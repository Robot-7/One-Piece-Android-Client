package org.codehaus.jackson.map.deser;

import com.tencent.stat.common.StatConstants;
import java.io.IOException;
import java.lang.annotation.Annotation;
import java.lang.reflect.Constructor;
import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.util.Collection;
import java.util.Map;
import org.codehaus.jackson.JsonParser;
import org.codehaus.jackson.JsonProcessingException;
import org.codehaus.jackson.JsonToken;
import org.codehaus.jackson.map.BeanProperty;
import org.codehaus.jackson.map.DeserializationConfig;
import org.codehaus.jackson.map.DeserializationContext;
import org.codehaus.jackson.map.JsonDeserializer;
import org.codehaus.jackson.map.JsonMappingException;
import org.codehaus.jackson.map.TypeDeserializer;
import org.codehaus.jackson.map.introspect.AnnotatedField;
import org.codehaus.jackson.map.introspect.AnnotatedMember;
import org.codehaus.jackson.map.introspect.AnnotatedMethod;
import org.codehaus.jackson.map.util.Annotations;
import org.codehaus.jackson.map.util.ClassUtil;
import org.codehaus.jackson.type.JavaType;
import org.codehaus.jackson.util.InternCache;

/* JADX INFO: loaded from: classes.dex */
public abstract class SettableBeanProperty implements BeanProperty {
    protected final Annotations _contextAnnotations;
    protected String _managedReferenceName;
    protected NullProvider _nullProvider;
    protected final String _propName;
    protected int _propertyIndex;
    protected final JavaType _type;
    protected JsonDeserializer<Object> _valueDeserializer;
    protected TypeDeserializer _valueTypeDeserializer;

    public abstract void deserializeAndSet(JsonParser jsonParser, DeserializationContext deserializationContext, Object obj) throws IOException;

    @Override // org.codehaus.jackson.map.BeanProperty
    public abstract <A extends Annotation> A getAnnotation(Class<A> cls);

    @Override // org.codehaus.jackson.map.BeanProperty
    public abstract AnnotatedMember getMember();

    public abstract void set(Object obj, Object obj2) throws IOException;

    public abstract SettableBeanProperty withValueDeserializer(JsonDeserializer<Object> jsonDeserializer);

    protected SettableBeanProperty(String propName, JavaType type, TypeDeserializer typeDeser, Annotations contextAnnotations) {
        this._propertyIndex = -1;
        if (propName == null || propName.length() == 0) {
            this._propName = StatConstants.MTA_COOPERATION_TAG;
        } else {
            this._propName = InternCache.instance.intern(propName);
        }
        this._type = type;
        this._contextAnnotations = contextAnnotations;
        this._valueTypeDeserializer = typeDeser;
    }

    protected SettableBeanProperty(SettableBeanProperty src) {
        this._propertyIndex = -1;
        this._propName = src._propName;
        this._type = src._type;
        this._contextAnnotations = src._contextAnnotations;
        this._valueDeserializer = src._valueDeserializer;
        this._valueTypeDeserializer = src._valueTypeDeserializer;
        this._nullProvider = src._nullProvider;
        this._managedReferenceName = src._managedReferenceName;
        this._propertyIndex = src._propertyIndex;
    }

    protected SettableBeanProperty(SettableBeanProperty src, JsonDeserializer<Object> deser) {
        this._propertyIndex = -1;
        this._propName = src._propName;
        this._type = src._type;
        this._contextAnnotations = src._contextAnnotations;
        this._valueTypeDeserializer = src._valueTypeDeserializer;
        this._managedReferenceName = src._managedReferenceName;
        this._propertyIndex = src._propertyIndex;
        this._valueDeserializer = deser;
        if (deser == null) {
            this._nullProvider = null;
        } else {
            Object nvl = deser.getNullValue();
            this._nullProvider = nvl != null ? new NullProvider(this._type, nvl) : null;
        }
    }

    @Deprecated
    public void setValueDeserializer(JsonDeserializer<Object> deser) {
        if (this._valueDeserializer != null) {
            throw new IllegalStateException("Already had assigned deserializer for property '" + getName() + "' (class " + getDeclaringClass().getName() + ")");
        }
        this._valueDeserializer = deser;
        Object nvl = this._valueDeserializer.getNullValue();
        this._nullProvider = nvl == null ? null : new NullProvider(this._type, nvl);
    }

    public void setManagedReferenceName(String n) {
        this._managedReferenceName = n;
    }

    public void assignIndex(int index) {
        if (this._propertyIndex != -1) {
            throw new IllegalStateException("Property '" + getName() + "' already had index (" + this._propertyIndex + "), trying to assign " + index);
        }
        this._propertyIndex = index;
    }

    @Override // org.codehaus.jackson.map.BeanProperty, org.codehaus.jackson.map.util.Named
    public final String getName() {
        return this._propName;
    }

    @Override // org.codehaus.jackson.map.BeanProperty
    public JavaType getType() {
        return this._type;
    }

    @Override // org.codehaus.jackson.map.BeanProperty
    public <A extends Annotation> A getContextAnnotation(Class<A> cls) {
        return (A) this._contextAnnotations.get(cls);
    }

    protected final Class<?> getDeclaringClass() {
        return getMember().getDeclaringClass();
    }

    @Deprecated
    public String getPropertyName() {
        return this._propName;
    }

    public String getManagedReferenceName() {
        return this._managedReferenceName;
    }

    public boolean hasValueDeserializer() {
        return this._valueDeserializer != null;
    }

    public boolean hasValueTypeDeserializer() {
        return this._valueTypeDeserializer != null;
    }

    public JsonDeserializer<Object> getValueDeserializer() {
        return this._valueDeserializer;
    }

    public TypeDeserializer getValueTypeDeserializer() {
        return this._valueTypeDeserializer;
    }

    public int getPropertyIndex() {
        return this._propertyIndex;
    }

    @Deprecated
    public int getProperytIndex() {
        return getPropertyIndex();
    }

    public Object getInjectableValueId() {
        return null;
    }

    public final Object deserialize(JsonParser jp, DeserializationContext ctxt) throws IOException {
        JsonToken t = jp.getCurrentToken();
        if (t == JsonToken.VALUE_NULL) {
            if (this._nullProvider == null) {
                return null;
            }
            return this._nullProvider.nullValue(ctxt);
        }
        if (this._valueTypeDeserializer != null) {
            return this._valueDeserializer.deserializeWithType(jp, ctxt, this._valueTypeDeserializer);
        }
        return this._valueDeserializer.deserialize(jp, ctxt);
    }

    protected void _throwAsIOE(Exception e, Object value) throws Exception {
        if (e instanceof IllegalArgumentException) {
            String actType = value == null ? "[NULL]" : value.getClass().getName();
            StringBuilder msg = new StringBuilder("Problem deserializing property '").append(getPropertyName());
            msg.append("' (expected type: ").append(getType());
            msg.append("; actual type: ").append(actType).append(")");
            String origMsg = e.getMessage();
            if (origMsg != null) {
                msg.append(", problem: ").append(origMsg);
            } else {
                msg.append(" (no error message provided)");
            }
            throw new JsonMappingException(msg.toString(), null, e);
        }
        _throwAsIOE(e);
    }

    protected IOException _throwAsIOE(Exception e) throws Exception {
        if (e instanceof IOException) {
            throw ((IOException) e);
        }
        if (e instanceof RuntimeException) {
            throw ((RuntimeException) e);
        }
        Throwable th = e;
        while (th.getCause() != null) {
            th = th.getCause();
        }
        throw new JsonMappingException(th.getMessage(), null, th);
    }

    public String toString() {
        return "[property '" + getName() + "']";
    }

    public static final class MethodProperty extends SettableBeanProperty {
        protected final AnnotatedMethod _annotated;
        protected final Method _setter;

        @Override // org.codehaus.jackson.map.deser.SettableBeanProperty
        public /* bridge */ /* synthetic */ SettableBeanProperty withValueDeserializer(JsonDeserializer x0) {
            return withValueDeserializer((JsonDeserializer<Object>) x0);
        }

        public MethodProperty(String name, JavaType type, TypeDeserializer typeDeser, Annotations contextAnnotations, AnnotatedMethod method) {
            super(name, type, typeDeser, contextAnnotations);
            this._annotated = method;
            this._setter = method.getAnnotated();
        }

        protected MethodProperty(MethodProperty src, JsonDeserializer<Object> deser) {
            super(src, deser);
            this._annotated = src._annotated;
            this._setter = src._setter;
        }

        @Override // org.codehaus.jackson.map.deser.SettableBeanProperty
        public MethodProperty withValueDeserializer(JsonDeserializer<Object> deser) {
            return new MethodProperty(this, deser);
        }

        @Override // org.codehaus.jackson.map.deser.SettableBeanProperty, org.codehaus.jackson.map.BeanProperty
        public <A extends Annotation> A getAnnotation(Class<A> cls) {
            return (A) this._annotated.getAnnotation(cls);
        }

        @Override // org.codehaus.jackson.map.deser.SettableBeanProperty, org.codehaus.jackson.map.BeanProperty
        public AnnotatedMember getMember() {
            return this._annotated;
        }

        @Override // org.codehaus.jackson.map.deser.SettableBeanProperty
        public void deserializeAndSet(JsonParser jp, DeserializationContext ctxt, Object instance) throws IOException {
            set(instance, deserialize(jp, ctxt));
        }

        @Override // org.codehaus.jackson.map.deser.SettableBeanProperty
        public final void set(Object instance, Object value) throws IOException {
            try {
                this._setter.invoke(instance, value);
            } catch (Exception e) {
                _throwAsIOE(e, value);
            }
        }
    }

    public static final class SetterlessProperty extends SettableBeanProperty {
        protected final AnnotatedMethod _annotated;
        protected final Method _getter;

        @Override // org.codehaus.jackson.map.deser.SettableBeanProperty
        public /* bridge */ /* synthetic */ SettableBeanProperty withValueDeserializer(JsonDeserializer x0) {
            return withValueDeserializer((JsonDeserializer<Object>) x0);
        }

        public SetterlessProperty(String name, JavaType type, TypeDeserializer typeDeser, Annotations contextAnnotations, AnnotatedMethod method) {
            super(name, type, typeDeser, contextAnnotations);
            this._annotated = method;
            this._getter = method.getAnnotated();
        }

        protected SetterlessProperty(SetterlessProperty src, JsonDeserializer<Object> deser) {
            super(src, deser);
            this._annotated = src._annotated;
            this._getter = src._getter;
        }

        @Override // org.codehaus.jackson.map.deser.SettableBeanProperty
        public SetterlessProperty withValueDeserializer(JsonDeserializer<Object> deser) {
            return new SetterlessProperty(this, deser);
        }

        @Override // org.codehaus.jackson.map.deser.SettableBeanProperty, org.codehaus.jackson.map.BeanProperty
        public <A extends Annotation> A getAnnotation(Class<A> cls) {
            return (A) this._annotated.getAnnotation(cls);
        }

        @Override // org.codehaus.jackson.map.deser.SettableBeanProperty, org.codehaus.jackson.map.BeanProperty
        public AnnotatedMember getMember() {
            return this._annotated;
        }

        @Override // org.codehaus.jackson.map.deser.SettableBeanProperty
        public final void deserializeAndSet(JsonParser jp, DeserializationContext ctxt, Object instance) throws IOException {
            JsonToken t = jp.getCurrentToken();
            if (t != JsonToken.VALUE_NULL) {
                try {
                    Object toModify = this._getter.invoke(instance, new Object[0]);
                    if (toModify == null) {
                        throw new JsonMappingException("Problem deserializing 'setterless' property '" + getName() + "': get method returned null");
                    }
                    this._valueDeserializer.deserialize(jp, ctxt, toModify);
                } catch (Exception e) {
                    _throwAsIOE(e);
                }
            }
        }

        @Override // org.codehaus.jackson.map.deser.SettableBeanProperty
        public final void set(Object instance, Object value) throws IOException {
            throw new UnsupportedOperationException("Should never call 'set' on setterless property");
        }
    }

    public static final class FieldProperty extends SettableBeanProperty {
        protected final AnnotatedField _annotated;
        protected final Field _field;

        @Override // org.codehaus.jackson.map.deser.SettableBeanProperty
        public /* bridge */ /* synthetic */ SettableBeanProperty withValueDeserializer(JsonDeserializer x0) {
            return withValueDeserializer((JsonDeserializer<Object>) x0);
        }

        public FieldProperty(String name, JavaType type, TypeDeserializer typeDeser, Annotations contextAnnotations, AnnotatedField field) {
            super(name, type, typeDeser, contextAnnotations);
            this._annotated = field;
            this._field = field.getAnnotated();
        }

        protected FieldProperty(FieldProperty src, JsonDeserializer<Object> deser) {
            super(src, deser);
            this._annotated = src._annotated;
            this._field = src._field;
        }

        @Override // org.codehaus.jackson.map.deser.SettableBeanProperty
        public FieldProperty withValueDeserializer(JsonDeserializer<Object> deser) {
            return new FieldProperty(this, deser);
        }

        @Override // org.codehaus.jackson.map.deser.SettableBeanProperty, org.codehaus.jackson.map.BeanProperty
        public <A extends Annotation> A getAnnotation(Class<A> cls) {
            return (A) this._annotated.getAnnotation(cls);
        }

        @Override // org.codehaus.jackson.map.deser.SettableBeanProperty, org.codehaus.jackson.map.BeanProperty
        public AnnotatedMember getMember() {
            return this._annotated;
        }

        @Override // org.codehaus.jackson.map.deser.SettableBeanProperty
        public void deserializeAndSet(JsonParser jp, DeserializationContext ctxt, Object instance) throws IOException {
            set(instance, deserialize(jp, ctxt));
        }

        @Override // org.codehaus.jackson.map.deser.SettableBeanProperty
        public final void set(Object instance, Object value) throws IOException {
            try {
                this._field.set(instance, value);
            } catch (Exception e) {
                _throwAsIOE(e, value);
            }
        }
    }

    public static final class ManagedReferenceProperty extends SettableBeanProperty {
        protected final SettableBeanProperty _backProperty;
        protected final boolean _isContainer;
        protected final SettableBeanProperty _managedProperty;
        protected final String _referenceName;

        @Override // org.codehaus.jackson.map.deser.SettableBeanProperty
        public /* bridge */ /* synthetic */ SettableBeanProperty withValueDeserializer(JsonDeserializer x0) {
            return withValueDeserializer((JsonDeserializer<Object>) x0);
        }

        public ManagedReferenceProperty(String refName, SettableBeanProperty forward, SettableBeanProperty backward, Annotations contextAnnotations, boolean isContainer) {
            super(forward.getName(), forward.getType(), forward._valueTypeDeserializer, contextAnnotations);
            this._referenceName = refName;
            this._managedProperty = forward;
            this._backProperty = backward;
            this._isContainer = isContainer;
        }

        protected ManagedReferenceProperty(ManagedReferenceProperty src, JsonDeserializer<Object> deser) {
            super(src, deser);
            this._referenceName = src._referenceName;
            this._isContainer = src._isContainer;
            this._managedProperty = src._managedProperty;
            this._backProperty = src._backProperty;
        }

        @Override // org.codehaus.jackson.map.deser.SettableBeanProperty
        public ManagedReferenceProperty withValueDeserializer(JsonDeserializer<Object> deser) {
            return new ManagedReferenceProperty(this, deser);
        }

        @Override // org.codehaus.jackson.map.deser.SettableBeanProperty, org.codehaus.jackson.map.BeanProperty
        public <A extends Annotation> A getAnnotation(Class<A> cls) {
            return (A) this._managedProperty.getAnnotation(cls);
        }

        @Override // org.codehaus.jackson.map.deser.SettableBeanProperty, org.codehaus.jackson.map.BeanProperty
        public AnnotatedMember getMember() {
            return this._managedProperty.getMember();
        }

        @Override // org.codehaus.jackson.map.deser.SettableBeanProperty
        public void deserializeAndSet(JsonParser jp, DeserializationContext ctxt, Object instance) throws IOException {
            set(instance, this._managedProperty.deserialize(jp, ctxt));
        }

        @Override // org.codehaus.jackson.map.deser.SettableBeanProperty
        public final void set(Object instance, Object value) throws IOException {
            this._managedProperty.set(instance, value);
            if (value != null) {
                if (this._isContainer) {
                    if (value instanceof Object[]) {
                        Object[] arr$ = (Object[]) value;
                        for (Object ob : arr$) {
                            if (ob != null) {
                                this._backProperty.set(ob, instance);
                            }
                        }
                        return;
                    }
                    if (value instanceof Collection) {
                        for (Object ob2 : (Collection) value) {
                            if (ob2 != null) {
                                this._backProperty.set(ob2, instance);
                            }
                        }
                        return;
                    }
                    if (value instanceof Map) {
                        for (Object ob3 : ((Map) value).values()) {
                            if (ob3 != null) {
                                this._backProperty.set(ob3, instance);
                            }
                        }
                        return;
                    }
                    throw new IllegalStateException("Unsupported container type (" + value.getClass().getName() + ") when resolving reference '" + this._referenceName + "'");
                }
                this._backProperty.set(value, instance);
            }
        }
    }

    public static final class InnerClassProperty extends SettableBeanProperty {
        protected final Constructor<?> _creator;
        protected final SettableBeanProperty _delegate;

        @Override // org.codehaus.jackson.map.deser.SettableBeanProperty
        public /* bridge */ /* synthetic */ SettableBeanProperty withValueDeserializer(JsonDeserializer x0) {
            return withValueDeserializer((JsonDeserializer<Object>) x0);
        }

        public InnerClassProperty(SettableBeanProperty delegate, Constructor<?> ctor) {
            super(delegate);
            this._delegate = delegate;
            this._creator = ctor;
        }

        protected InnerClassProperty(InnerClassProperty src, JsonDeserializer<Object> deser) {
            super(src, deser);
            this._delegate = src._delegate.withValueDeserializer(deser);
            this._creator = src._creator;
        }

        @Override // org.codehaus.jackson.map.deser.SettableBeanProperty
        public InnerClassProperty withValueDeserializer(JsonDeserializer<Object> deser) {
            return new InnerClassProperty(this, deser);
        }

        @Override // org.codehaus.jackson.map.deser.SettableBeanProperty, org.codehaus.jackson.map.BeanProperty
        public <A extends Annotation> A getAnnotation(Class<A> cls) {
            return (A) this._delegate.getAnnotation(cls);
        }

        @Override // org.codehaus.jackson.map.deser.SettableBeanProperty, org.codehaus.jackson.map.BeanProperty
        public AnnotatedMember getMember() {
            return this._delegate.getMember();
        }

        @Override // org.codehaus.jackson.map.deser.SettableBeanProperty
        public void deserializeAndSet(JsonParser jp, DeserializationContext ctxt, Object bean) throws Throwable {
            Object objNewInstance;
            JsonToken t = jp.getCurrentToken();
            if (t == JsonToken.VALUE_NULL) {
                objNewInstance = this._nullProvider == null ? null : this._nullProvider.nullValue(ctxt);
            } else if (this._valueTypeDeserializer != null) {
                objNewInstance = this._valueDeserializer.deserializeWithType(jp, ctxt, this._valueTypeDeserializer);
            } else {
                try {
                    objNewInstance = this._creator.newInstance(bean);
                } catch (Exception e) {
                    ClassUtil.unwrapAndThrowAsIAE(e, "Failed to instantiate class " + this._creator.getDeclaringClass().getName() + ", problem: " + e.getMessage());
                    objNewInstance = null;
                }
                this._valueDeserializer.deserialize(jp, ctxt, objNewInstance);
            }
            set(bean, objNewInstance);
        }

        @Override // org.codehaus.jackson.map.deser.SettableBeanProperty
        public final void set(Object instance, Object value) throws IOException {
            this._delegate.set(instance, value);
        }
    }

    protected static final class NullProvider {
        private final boolean _isPrimitive;
        private final Object _nullValue;
        private final Class<?> _rawType;

        protected NullProvider(JavaType type, Object nullValue) {
            this._nullValue = nullValue;
            this._isPrimitive = type.isPrimitive();
            this._rawType = type.getRawClass();
        }

        public Object nullValue(DeserializationContext ctxt) throws JsonProcessingException {
            if (this._isPrimitive && ctxt.isEnabled(DeserializationConfig.Feature.FAIL_ON_NULL_FOR_PRIMITIVES)) {
                throw ctxt.mappingException("Can not map JSON null into type " + this._rawType.getName() + " (set DeserializationConfig.Feature.FAIL_ON_NULL_FOR_PRIMITIVES to 'false' to allow)");
            }
            return this._nullValue;
        }
    }
}
