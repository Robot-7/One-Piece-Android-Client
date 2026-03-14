package org.codehaus.jackson.map.introspect;

import java.lang.reflect.Constructor;
import java.lang.reflect.Method;
import java.lang.reflect.Type;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Collections;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;
import org.codehaus.jackson.map.AnnotationIntrospector;
import org.codehaus.jackson.map.BeanDescription;
import org.codehaus.jackson.map.BeanPropertyDefinition;
import org.codehaus.jackson.map.MapperConfig;
import org.codehaus.jackson.map.annotate.JsonSerialize;
import org.codehaus.jackson.map.type.TypeBindings;
import org.codehaus.jackson.map.util.Annotations;
import org.codehaus.jackson.type.JavaType;

/* JADX INFO: loaded from: classes.dex */
public class BasicBeanDescription extends BeanDescription {
    protected final AnnotationIntrospector _annotationIntrospector;
    protected AnnotatedMethod _anyGetterMethod;
    protected AnnotatedMethod _anySetterMethod;
    protected TypeBindings _bindings;
    protected final AnnotatedClass _classInfo;
    protected final MapperConfig<?> _config;
    protected Set<String> _ignoredPropertyNames;
    protected Map<Object, AnnotatedMember> _injectables;
    protected AnnotatedMethod _jsonValueMethod;
    protected final List<BeanPropertyDefinition> _properties;

    @Override // org.codehaus.jackson.map.BeanDescription
    public /* bridge */ /* synthetic */ Map findSerializableFields(VisibilityChecker x0, Collection x1) {
        return findSerializableFields((VisibilityChecker<?>) x0, (Collection<String>) x1);
    }

    @Deprecated
    public BasicBeanDescription(MapperConfig<?> config, JavaType type, AnnotatedClass ac) {
        this(config, type, ac, Collections.emptyList());
    }

    protected BasicBeanDescription(MapperConfig<?> config, JavaType type, AnnotatedClass ac, List<BeanPropertyDefinition> properties) {
        super(type);
        this._config = config;
        this._annotationIntrospector = config == null ? null : config.getAnnotationIntrospector();
        this._classInfo = ac;
        this._properties = properties;
    }

    public static BasicBeanDescription forDeserialization(POJOPropertiesCollector coll) {
        BasicBeanDescription desc = new BasicBeanDescription(coll.getConfig(), coll.getType(), coll.getClassDef(), coll.getProperties());
        desc._anySetterMethod = coll.getAnySetterMethod();
        desc._ignoredPropertyNames = coll.getIgnoredPropertyNames();
        desc._injectables = coll.getInjectables();
        return desc;
    }

    public static BasicBeanDescription forSerialization(POJOPropertiesCollector coll) {
        BasicBeanDescription desc = new BasicBeanDescription(coll.getConfig(), coll.getType(), coll.getClassDef(), coll.getProperties());
        desc._jsonValueMethod = coll.getJsonValueMethod();
        desc._anyGetterMethod = coll.getAnyGetterMethod();
        return desc;
    }

    public static BasicBeanDescription forOtherUse(MapperConfig<?> config, JavaType type, AnnotatedClass ac) {
        return new BasicBeanDescription(config, type, ac, Collections.emptyList());
    }

    @Override // org.codehaus.jackson.map.BeanDescription
    public AnnotatedClass getClassInfo() {
        return this._classInfo;
    }

    @Override // org.codehaus.jackson.map.BeanDescription
    public List<BeanPropertyDefinition> findProperties() {
        return this._properties;
    }

    @Override // org.codehaus.jackson.map.BeanDescription
    public AnnotatedMethod findJsonValueMethod() {
        return this._jsonValueMethod;
    }

    @Override // org.codehaus.jackson.map.BeanDescription
    public Set<String> getIgnoredPropertyNames() {
        return this._ignoredPropertyNames == null ? Collections.emptySet() : this._ignoredPropertyNames;
    }

    @Override // org.codehaus.jackson.map.BeanDescription
    public boolean hasKnownClassAnnotations() {
        return this._classInfo.hasAnnotations();
    }

    @Override // org.codehaus.jackson.map.BeanDescription
    public Annotations getClassAnnotations() {
        return this._classInfo.getAnnotations();
    }

    @Override // org.codehaus.jackson.map.BeanDescription
    public TypeBindings bindingsForBeanType() {
        if (this._bindings == null) {
            this._bindings = new TypeBindings(this._config.getTypeFactory(), this._type);
        }
        return this._bindings;
    }

    @Override // org.codehaus.jackson.map.BeanDescription
    public JavaType resolveType(Type jdkType) {
        if (jdkType == null) {
            return null;
        }
        return bindingsForBeanType().resolveType(jdkType);
    }

    @Override // org.codehaus.jackson.map.BeanDescription
    public AnnotatedConstructor findDefaultConstructor() {
        return this._classInfo.getDefaultConstructor();
    }

    @Override // org.codehaus.jackson.map.BeanDescription
    public AnnotatedMethod findAnySetter() throws IllegalArgumentException {
        Class<?> type;
        if (this._anySetterMethod != null && (type = this._anySetterMethod.getParameterClass(0)) != String.class && type != Object.class) {
            throw new IllegalArgumentException("Invalid 'any-setter' annotation on method " + this._anySetterMethod.getName() + "(): first argument not of type String or Object, but " + type.getName());
        }
        return this._anySetterMethod;
    }

    @Override // org.codehaus.jackson.map.BeanDescription
    public Map<Object, AnnotatedMember> findInjectables() {
        return this._injectables;
    }

    public List<AnnotatedConstructor> getConstructors() {
        return this._classInfo.getConstructors();
    }

    public AnnotatedMethod findMethod(String name, Class<?>[] paramTypes) {
        return this._classInfo.findMethod(name, paramTypes);
    }

    public Object instantiateBean(boolean fixAccess) throws Throwable {
        AnnotatedConstructor ac = this._classInfo.getDefaultConstructor();
        if (ac == null) {
            return null;
        }
        if (fixAccess) {
            ac.fixAccess();
        }
        try {
            return ac.getAnnotated().newInstance(new Object[0]);
        } catch (Exception e) {
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
            throw new IllegalArgumentException("Failed to instantiate bean of type " + this._classInfo.getAnnotated().getName() + ": (" + t.getClass().getName() + ") " + t.getMessage(), t);
        }
    }

    public List<AnnotatedMethod> getFactoryMethods() {
        List<AnnotatedMethod> candidates = this._classInfo.getStaticMethods();
        if (!candidates.isEmpty()) {
            ArrayList<AnnotatedMethod> result = new ArrayList<>();
            for (AnnotatedMethod am : candidates) {
                if (isFactoryMethod(am)) {
                    result.add(am);
                }
            }
            return result;
        }
        return candidates;
    }

    public Constructor<?> findSingleArgConstructor(Class<?>... argTypes) {
        for (AnnotatedConstructor ac : this._classInfo.getConstructors()) {
            if (ac.getParameterCount() == 1) {
                Class<?> actArg = ac.getParameterClass(0);
                for (Class<?> expArg : argTypes) {
                    if (expArg == actArg) {
                        return ac.getAnnotated();
                    }
                }
            }
        }
        return null;
    }

    public Method findFactoryMethod(Class<?>... expArgTypes) {
        for (AnnotatedMethod am : this._classInfo.getStaticMethods()) {
            if (isFactoryMethod(am)) {
                Class<?> actualArgType = am.getParameterClass(0);
                for (Class<?> expArgType : expArgTypes) {
                    if (actualArgType.isAssignableFrom(expArgType)) {
                        return am.getAnnotated();
                    }
                }
            }
        }
        return null;
    }

    protected boolean isFactoryMethod(AnnotatedMethod am) {
        Class<?> rt = am.getRawType();
        if (getBeanClass().isAssignableFrom(rt)) {
            return this._annotationIntrospector.hasCreatorAnnotation(am) || "valueOf".equals(am.getName());
        }
        return false;
    }

    public List<String> findCreatorPropertyNames() {
        String name;
        List<String> names = null;
        int i = 0;
        while (i < 2) {
            List<? extends AnnotatedWithParams> l = i == 0 ? getConstructors() : getFactoryMethods();
            for (AnnotatedWithParams creator : l) {
                int argCount = creator.getParameterCount();
                if (argCount >= 1 && (name = this._annotationIntrospector.findPropertyNameForParam(creator.getParameter(0))) != null) {
                    if (names == null) {
                        names = new ArrayList<>();
                    }
                    names.add(name);
                    for (int p = 1; p < argCount; p++) {
                        names.add(this._annotationIntrospector.findPropertyNameForParam(creator.getParameter(p)));
                    }
                }
            }
            i++;
        }
        if (names == null) {
            List<String> names2 = Collections.emptyList();
            return names2;
        }
        return names;
    }

    public JsonSerialize.Inclusion findSerializationInclusion(JsonSerialize.Inclusion defValue) {
        return this._annotationIntrospector == null ? defValue : this._annotationIntrospector.findSerializationInclusion(this._classInfo, defValue);
    }

    @Override // org.codehaus.jackson.map.BeanDescription
    public AnnotatedMethod findAnyGetter() throws IllegalArgumentException {
        if (this._anyGetterMethod != null) {
            Class<?> type = this._anyGetterMethod.getRawType();
            if (!Map.class.isAssignableFrom(type)) {
                throw new IllegalArgumentException("Invalid 'any-getter' annotation on method " + this._anyGetterMethod.getName() + "(): return type is not instance of java.util.Map");
            }
        }
        return this._anyGetterMethod;
    }

    public Map<String, AnnotatedMember> findBackReferenceProperties() {
        AnnotationIntrospector.ReferenceProperty refDef;
        HashMap<String, AnnotatedMember> result = null;
        for (BeanPropertyDefinition property : this._properties) {
            AnnotatedMember am = property.getMutator();
            if (am != null && (refDef = this._annotationIntrospector.findReferenceType(am)) != null && refDef.isBackReference()) {
                if (result == null) {
                    result = new HashMap<>();
                }
                String refName = refDef.getName();
                if (result.put(refName, am) != null) {
                    throw new IllegalArgumentException("Multiple back-reference properties with name '" + refName + "'");
                }
            }
        }
        return result;
    }

    public LinkedHashMap<String, AnnotatedField> _findPropertyFields(Collection<String> ignoredProperties, boolean forSerialization) {
        LinkedHashMap<String, AnnotatedField> results = new LinkedHashMap<>();
        for (BeanPropertyDefinition property : this._properties) {
            AnnotatedField f = property.getField();
            if (f != null) {
                String name = property.getName();
                if (ignoredProperties == null || !ignoredProperties.contains(name)) {
                    results.put(name, f);
                }
            }
        }
        return results;
    }

    @Override // org.codehaus.jackson.map.BeanDescription
    public LinkedHashMap<String, AnnotatedMethod> findGetters(VisibilityChecker<?> visibilityChecker, Collection<String> ignoredProperties) {
        LinkedHashMap<String, AnnotatedMethod> results = new LinkedHashMap<>();
        for (BeanPropertyDefinition property : this._properties) {
            AnnotatedMethod m = property.getGetter();
            if (m != null) {
                String name = property.getName();
                if (ignoredProperties == null || !ignoredProperties.contains(name)) {
                    results.put(name, m);
                }
            }
        }
        return results;
    }

    @Override // org.codehaus.jackson.map.BeanDescription
    public LinkedHashMap<String, AnnotatedMethod> findSetters(VisibilityChecker<?> visibilityChecker) {
        LinkedHashMap<String, AnnotatedMethod> results = new LinkedHashMap<>();
        for (BeanPropertyDefinition property : this._properties) {
            AnnotatedMethod m = property.getSetter();
            if (m != null) {
                results.put(property.getName(), m);
            }
        }
        return results;
    }

    @Override // org.codehaus.jackson.map.BeanDescription
    public LinkedHashMap<String, AnnotatedField> findSerializableFields(VisibilityChecker<?> visibilityChecker, Collection<String> ignoredProperties) {
        return _findPropertyFields(ignoredProperties, true);
    }

    @Override // org.codehaus.jackson.map.BeanDescription
    public LinkedHashMap<String, AnnotatedField> findDeserializableFields(VisibilityChecker<?> visibilityChecker, Collection<String> ignoredProperties) {
        return _findPropertyFields(ignoredProperties, false);
    }
}
