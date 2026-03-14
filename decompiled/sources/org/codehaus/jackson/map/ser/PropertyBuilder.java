package org.codehaus.jackson.map.ser;

import java.lang.reflect.Array;
import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.util.Collection;
import java.util.Map;
import org.codehaus.jackson.map.AnnotationIntrospector;
import org.codehaus.jackson.map.JsonSerializer;
import org.codehaus.jackson.map.SerializationConfig;
import org.codehaus.jackson.map.TypeSerializer;
import org.codehaus.jackson.map.annotate.JsonSerialize;
import org.codehaus.jackson.map.introspect.Annotated;
import org.codehaus.jackson.map.introspect.AnnotatedField;
import org.codehaus.jackson.map.introspect.AnnotatedMember;
import org.codehaus.jackson.map.introspect.AnnotatedMethod;
import org.codehaus.jackson.map.introspect.BasicBeanDescription;
import org.codehaus.jackson.map.util.Annotations;
import org.codehaus.jackson.map.util.Comparators;
import org.codehaus.jackson.type.JavaType;

/* JADX INFO: loaded from: classes.dex */
public class PropertyBuilder {
    protected final AnnotationIntrospector _annotationIntrospector;
    protected final BasicBeanDescription _beanDesc;
    protected final SerializationConfig _config;
    protected Object _defaultBean;
    protected final JsonSerialize.Inclusion _outputProps;

    public PropertyBuilder(SerializationConfig config, BasicBeanDescription beanDesc) {
        this._config = config;
        this._beanDesc = beanDesc;
        this._outputProps = beanDesc.findSerializationInclusion(config.getSerializationInclusion());
        this._annotationIntrospector = this._config.getAnnotationIntrospector();
    }

    public Annotations getClassAnnotations() {
        return this._beanDesc.getClassAnnotations();
    }

    protected BeanPropertyWriter buildWriter(String name, JavaType declaredType, JsonSerializer<Object> ser, TypeSerializer typeSer, TypeSerializer contentTypeSer, AnnotatedMember am, boolean defaultUseStaticTyping) {
        Method m;
        Field f;
        if (am instanceof AnnotatedField) {
            m = null;
            f = ((AnnotatedField) am).getAnnotated();
        } else {
            m = ((AnnotatedMethod) am).getAnnotated();
            f = null;
        }
        JavaType serializationType = findSerializationType(am, defaultUseStaticTyping, declaredType);
        if (contentTypeSer != null) {
            if (serializationType == null) {
                serializationType = declaredType;
            }
            JavaType ct = serializationType.getContentType();
            if (ct == null) {
                throw new IllegalStateException("Problem trying to create BeanPropertyWriter for property '" + name + "' (of type " + this._beanDesc.getType() + "); serialization type " + serializationType + " has no content");
            }
            serializationType = serializationType.withContentTypeHandler(contentTypeSer);
            serializationType.getContentType();
        }
        Object valueToSuppress = null;
        boolean suppressNulls = false;
        JsonSerialize.Inclusion methodProps = this._annotationIntrospector.findSerializationInclusion(am, this._outputProps);
        if (methodProps != null) {
            switch (methodProps) {
                case NON_DEFAULT:
                    valueToSuppress = getDefaultValue(name, m, f);
                    if (valueToSuppress == null) {
                        suppressNulls = true;
                    } else if (valueToSuppress.getClass().isArray()) {
                        valueToSuppress = Comparators.getArrayComparator(valueToSuppress);
                    }
                    break;
                case NON_EMPTY:
                    suppressNulls = true;
                    valueToSuppress = getEmptyValueChecker(name, declaredType);
                    break;
                case NON_NULL:
                    suppressNulls = true;
                case ALWAYS:
                    if (declaredType.isContainerType()) {
                        valueToSuppress = getContainerValueChecker(name, declaredType);
                    }
                    break;
            }
        }
        BeanPropertyWriter bpw = new BeanPropertyWriter(am, this._beanDesc.getClassAnnotations(), name, declaredType, ser, typeSer, serializationType, m, f, suppressNulls, valueToSuppress);
        Boolean unwrapped = this._annotationIntrospector.shouldUnwrapProperty(am);
        if (unwrapped != null && unwrapped.booleanValue()) {
            return bpw.unwrappingWriter();
        }
        return bpw;
    }

    protected JavaType findSerializationType(Annotated a, boolean useStaticTyping, JavaType declaredType) {
        JsonSerialize.Typing typing;
        Class<?> serClass = this._annotationIntrospector.findSerializationType(a);
        if (serClass != null) {
            Class<?> rawDeclared = declaredType.getRawClass();
            if (serClass.isAssignableFrom(rawDeclared)) {
                declaredType = declaredType.widenBy(serClass);
            } else {
                if (!rawDeclared.isAssignableFrom(serClass)) {
                    throw new IllegalArgumentException("Illegal concrete-type annotation for method '" + a.getName() + "': class " + serClass.getName() + " not a super-type of (declared) class " + rawDeclared.getName());
                }
                declaredType = this._config.constructSpecializedType(declaredType, serClass);
            }
            useStaticTyping = true;
        }
        JavaType secondary = BeanSerializerFactory.modifySecondaryTypesByAnnotation(this._config, a, declaredType);
        if (secondary != declaredType) {
            useStaticTyping = true;
            declaredType = secondary;
        }
        if (!useStaticTyping && (typing = this._annotationIntrospector.findSerializationTyping(a)) != null) {
            useStaticTyping = typing == JsonSerialize.Typing.STATIC;
        }
        if (useStaticTyping) {
            return declaredType;
        }
        return null;
    }

    protected Object getDefaultBean() {
        if (this._defaultBean == null) {
            this._defaultBean = this._beanDesc.instantiateBean(this._config.isEnabled(SerializationConfig.Feature.CAN_OVERRIDE_ACCESS_MODIFIERS));
            if (this._defaultBean == null) {
                Class<?> cls = this._beanDesc.getClassInfo().getAnnotated();
                throw new IllegalArgumentException("Class " + cls.getName() + " has no default constructor; can not instantiate default bean value to support 'properties=JsonSerialize.Inclusion.NON_DEFAULT' annotation");
            }
        }
        return this._defaultBean;
    }

    protected Object getDefaultValue(String name, Method m, Field f) {
        Object objInvoke;
        Object defaultBean = getDefaultBean();
        try {
            if (m != null) {
                objInvoke = m.invoke(defaultBean, new Object[0]);
            } else {
                objInvoke = f.get(defaultBean);
            }
            return objInvoke;
        } catch (Exception e) {
            return _throwWrapped(e, name, defaultBean);
        }
    }

    protected Object getContainerValueChecker(String propertyName, JavaType propertyType) {
        if (!this._config.isEnabled(SerializationConfig.Feature.WRITE_EMPTY_JSON_ARRAYS)) {
            if (propertyType.isArrayType()) {
                return new EmptyArrayChecker();
            }
            if (Collection.class.isAssignableFrom(propertyType.getRawClass())) {
                return new EmptyCollectionChecker();
            }
        }
        return null;
    }

    protected Object getEmptyValueChecker(String propertyName, JavaType propertyType) {
        Class<?> rawType = propertyType.getRawClass();
        if (rawType == String.class) {
            return new EmptyStringChecker();
        }
        if (propertyType.isArrayType()) {
            return new EmptyArrayChecker();
        }
        if (Collection.class.isAssignableFrom(rawType)) {
            return new EmptyCollectionChecker();
        }
        if (Map.class.isAssignableFrom(rawType)) {
            return new EmptyMapChecker();
        }
        return null;
    }

    protected Object _throwWrapped(Exception e, String propName, Object defaultBean) throws Throwable {
        Throwable t = e;
        while (t.getCause() != null) {
            t = t.getCause();
        }
        if (t instanceof Error) {
            throw ((Error) t);
        }
        if (t instanceof RuntimeException) {
            throw ((RuntimeException) t);
        }
        throw new IllegalArgumentException("Failed to get property '" + propName + "' of default " + defaultBean.getClass().getName() + " instance");
    }

    public static class EmptyCollectionChecker {
        public boolean equals(Object other) {
            return other == null || ((Collection) other).size() == 0;
        }
    }

    public static class EmptyMapChecker {
        public boolean equals(Object other) {
            return other == null || ((Map) other).size() == 0;
        }
    }

    public static class EmptyArrayChecker {
        public boolean equals(Object other) {
            return other == null || Array.getLength(other) == 0;
        }
    }

    public static class EmptyStringChecker {
        public boolean equals(Object other) {
            return other == null || ((String) other).length() == 0;
        }
    }
}
