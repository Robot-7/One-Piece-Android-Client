package org.codehaus.jackson.map;

import java.text.DateFormat;
import java.util.HashMap;
import org.codehaus.jackson.Base64Variant;
import org.codehaus.jackson.Base64Variants;
import org.codehaus.jackson.annotate.JsonAutoDetect;
import org.codehaus.jackson.annotate.JsonMethod;
import org.codehaus.jackson.map.MapperConfig;
import org.codehaus.jackson.map.SerializationConfig;
import org.codehaus.jackson.map.deser.ValueInstantiator;
import org.codehaus.jackson.map.introspect.Annotated;
import org.codehaus.jackson.map.introspect.AnnotatedClass;
import org.codehaus.jackson.map.introspect.NopAnnotationIntrospector;
import org.codehaus.jackson.map.introspect.VisibilityChecker;
import org.codehaus.jackson.map.jsontype.SubtypeResolver;
import org.codehaus.jackson.map.jsontype.TypeResolverBuilder;
import org.codehaus.jackson.map.type.ClassKey;
import org.codehaus.jackson.map.type.TypeFactory;
import org.codehaus.jackson.map.util.ClassUtil;
import org.codehaus.jackson.map.util.LinkedNode;
import org.codehaus.jackson.node.JsonNodeFactory;
import org.codehaus.jackson.type.JavaType;

/* JADX INFO: loaded from: classes.dex */
public class DeserializationConfig extends MapperConfig.Impl<Feature, DeserializationConfig> {
    protected final JsonNodeFactory _nodeFactory;
    protected LinkedNode<DeserializationProblemHandler> _problemHandlers;
    protected boolean _sortPropertiesAlphabetically;

    @Override // org.codehaus.jackson.map.MapperConfig.Impl, org.codehaus.jackson.map.MapperConfig
    public /* bridge */ /* synthetic */ boolean isEnabled(MapperConfig.ConfigFeature x0) {
        return super.isEnabled(x0);
    }

    @Override // org.codehaus.jackson.map.MapperConfig
    public /* bridge */ /* synthetic */ MapperConfig withClassIntrospector(ClassIntrospector x0) {
        return withClassIntrospector((ClassIntrospector<? extends BeanDescription>) x0);
    }

    @Override // org.codehaus.jackson.map.MapperConfig
    public /* bridge */ /* synthetic */ MapperConfig withTypeResolverBuilder(TypeResolverBuilder x0) {
        return withTypeResolverBuilder((TypeResolverBuilder<?>) x0);
    }

    @Override // org.codehaus.jackson.map.MapperConfig
    public /* bridge */ /* synthetic */ MapperConfig withVisibilityChecker(VisibilityChecker x0) {
        return withVisibilityChecker((VisibilityChecker<?>) x0);
    }

    public enum Feature implements MapperConfig.ConfigFeature {
        USE_ANNOTATIONS(true),
        AUTO_DETECT_SETTERS(true),
        AUTO_DETECT_CREATORS(true),
        AUTO_DETECT_FIELDS(true),
        USE_GETTERS_AS_SETTERS(true),
        CAN_OVERRIDE_ACCESS_MODIFIERS(true),
        USE_BIG_DECIMAL_FOR_FLOATS(false),
        USE_BIG_INTEGER_FOR_INTS(false),
        USE_JAVA_ARRAY_FOR_JSON_ARRAY(false),
        READ_ENUMS_USING_TO_STRING(false),
        FAIL_ON_UNKNOWN_PROPERTIES(true),
        FAIL_ON_NULL_FOR_PRIMITIVES(false),
        FAIL_ON_NUMBERS_FOR_ENUMS(false),
        WRAP_EXCEPTIONS(true),
        ACCEPT_SINGLE_VALUE_AS_ARRAY(false),
        UNWRAP_ROOT_VALUE(false),
        ACCEPT_EMPTY_STRING_AS_NULL_OBJECT(false);

        final boolean _defaultState;

        Feature(boolean defaultState) {
            this._defaultState = defaultState;
        }

        @Override // org.codehaus.jackson.map.MapperConfig.ConfigFeature
        public boolean enabledByDefault() {
            return this._defaultState;
        }

        @Override // org.codehaus.jackson.map.MapperConfig.ConfigFeature
        public int getMask() {
            return 1 << ordinal();
        }
    }

    public DeserializationConfig(ClassIntrospector<? extends BeanDescription> intr, AnnotationIntrospector annIntr, VisibilityChecker<?> vc, SubtypeResolver subtypeResolver, PropertyNamingStrategy propertyNamingStrategy, TypeFactory typeFactory, HandlerInstantiator handlerInstantiator) {
        super(intr, annIntr, vc, subtypeResolver, propertyNamingStrategy, typeFactory, handlerInstantiator, collectFeatureDefaults(Feature.class));
        this._nodeFactory = JsonNodeFactory.instance;
    }

    protected DeserializationConfig(DeserializationConfig src) {
        this(src, src._base);
    }

    private DeserializationConfig(DeserializationConfig src, HashMap<ClassKey, Class<?>> mixins, SubtypeResolver str) {
        this(src, src._base);
        this._mixInAnnotations = mixins;
        this._subtypeResolver = str;
    }

    protected DeserializationConfig(DeserializationConfig src, MapperConfig.Base base) {
        super(src, base, src._subtypeResolver);
        this._problemHandlers = src._problemHandlers;
        this._nodeFactory = src._nodeFactory;
        this._sortPropertiesAlphabetically = src._sortPropertiesAlphabetically;
    }

    protected DeserializationConfig(DeserializationConfig src, JsonNodeFactory f) {
        super(src);
        this._problemHandlers = src._problemHandlers;
        this._nodeFactory = f;
        this._sortPropertiesAlphabetically = src._sortPropertiesAlphabetically;
    }

    protected DeserializationConfig(DeserializationConfig src, int featureFlags) {
        super(src, featureFlags);
        this._problemHandlers = src._problemHandlers;
        this._nodeFactory = src._nodeFactory;
        this._sortPropertiesAlphabetically = src._sortPropertiesAlphabetically;
    }

    protected DeserializationConfig passSerializationFeatures(int serializationFeatureFlags) {
        this._sortPropertiesAlphabetically = (SerializationConfig.Feature.SORT_PROPERTIES_ALPHABETICALLY.getMask() & serializationFeatureFlags) != 0;
        return this;
    }

    @Override // org.codehaus.jackson.map.MapperConfig
    public DeserializationConfig withClassIntrospector(ClassIntrospector<? extends BeanDescription> ci) {
        return new DeserializationConfig(this, this._base.withClassIntrospector(ci));
    }

    @Override // org.codehaus.jackson.map.MapperConfig
    public DeserializationConfig withAnnotationIntrospector(AnnotationIntrospector ai) {
        return new DeserializationConfig(this, this._base.withAnnotationIntrospector(ai));
    }

    @Override // org.codehaus.jackson.map.MapperConfig
    public DeserializationConfig withVisibilityChecker(VisibilityChecker<?> vc) {
        return new DeserializationConfig(this, this._base.withVisibilityChecker(vc));
    }

    @Override // org.codehaus.jackson.map.MapperConfig
    public DeserializationConfig withVisibility(JsonMethod forMethod, JsonAutoDetect.Visibility visibility) {
        return new DeserializationConfig(this, this._base.withVisibility(forMethod, visibility));
    }

    @Override // org.codehaus.jackson.map.MapperConfig
    public DeserializationConfig withTypeResolverBuilder(TypeResolverBuilder<?> trb) {
        return new DeserializationConfig(this, this._base.withTypeResolverBuilder(trb));
    }

    @Override // org.codehaus.jackson.map.MapperConfig
    public DeserializationConfig withSubtypeResolver(SubtypeResolver str) {
        DeserializationConfig cfg = new DeserializationConfig(this);
        cfg._subtypeResolver = str;
        return cfg;
    }

    @Override // org.codehaus.jackson.map.MapperConfig
    public DeserializationConfig withPropertyNamingStrategy(PropertyNamingStrategy pns) {
        return new DeserializationConfig(this, this._base.withPropertyNamingStrategy(pns));
    }

    @Override // org.codehaus.jackson.map.MapperConfig
    public DeserializationConfig withTypeFactory(TypeFactory tf) {
        return tf == this._base.getTypeFactory() ? this : new DeserializationConfig(this, this._base.withTypeFactory(tf));
    }

    @Override // org.codehaus.jackson.map.MapperConfig
    public DeserializationConfig withDateFormat(DateFormat df) {
        return df == this._base.getDateFormat() ? this : new DeserializationConfig(this, this._base.withDateFormat(df));
    }

    @Override // org.codehaus.jackson.map.MapperConfig
    public DeserializationConfig withHandlerInstantiator(HandlerInstantiator hi) {
        return hi == this._base.getHandlerInstantiator() ? this : new DeserializationConfig(this, this._base.withHandlerInstantiator(hi));
    }

    @Override // org.codehaus.jackson.map.MapperConfig
    public DeserializationConfig withInsertedAnnotationIntrospector(AnnotationIntrospector ai) {
        return new DeserializationConfig(this, this._base.withInsertedAnnotationIntrospector(ai));
    }

    @Override // org.codehaus.jackson.map.MapperConfig
    public DeserializationConfig withAppendedAnnotationIntrospector(AnnotationIntrospector ai) {
        return new DeserializationConfig(this, this._base.withAppendedAnnotationIntrospector(ai));
    }

    public DeserializationConfig withNodeFactory(JsonNodeFactory f) {
        return new DeserializationConfig(this, f);
    }

    @Override // org.codehaus.jackson.map.MapperConfig.Impl
    public DeserializationConfig with(Feature... features) {
        int flags = this._featureFlags;
        for (Feature f : features) {
            flags |= f.getMask();
        }
        return new DeserializationConfig(this, flags);
    }

    @Override // org.codehaus.jackson.map.MapperConfig.Impl
    public DeserializationConfig without(Feature... features) {
        int flags = this._featureFlags;
        for (Feature f : features) {
            flags &= f.getMask() ^ (-1);
        }
        return new DeserializationConfig(this, flags);
    }

    @Override // org.codehaus.jackson.map.MapperConfig
    @Deprecated
    public void fromAnnotations(Class<?> cls) {
        AnnotationIntrospector ai = getAnnotationIntrospector();
        AnnotatedClass ac = AnnotatedClass.construct(cls, ai, null);
        VisibilityChecker<?> prevVc = getDefaultVisibilityChecker();
        this._base = this._base.withVisibilityChecker(ai.findAutoDetectVisibility(ac, prevVc));
    }

    @Override // org.codehaus.jackson.map.MapperConfig
    public DeserializationConfig createUnshared(SubtypeResolver subtypeResolver) {
        HashMap<ClassKey, Class<?>> mixins = this._mixInAnnotations;
        this._mixInAnnotationsShared = true;
        return new DeserializationConfig(this, mixins, subtypeResolver);
    }

    @Override // org.codehaus.jackson.map.MapperConfig
    public AnnotationIntrospector getAnnotationIntrospector() {
        return isEnabled(Feature.USE_ANNOTATIONS) ? super.getAnnotationIntrospector() : NopAnnotationIntrospector.instance;
    }

    @Override // org.codehaus.jackson.map.MapperConfig
    public <T extends BeanDescription> T introspectClassAnnotations(JavaType javaType) {
        return (T) getClassIntrospector().forClassAnnotations(this, javaType, this);
    }

    @Override // org.codehaus.jackson.map.MapperConfig
    public <T extends BeanDescription> T introspectDirectClassAnnotations(JavaType javaType) {
        return (T) getClassIntrospector().forDirectClassAnnotations(this, javaType, this);
    }

    @Override // org.codehaus.jackson.map.MapperConfig
    public boolean isAnnotationProcessingEnabled() {
        return isEnabled(Feature.USE_ANNOTATIONS);
    }

    @Override // org.codehaus.jackson.map.MapperConfig
    public boolean canOverrideAccessModifiers() {
        return isEnabled(Feature.CAN_OVERRIDE_ACCESS_MODIFIERS);
    }

    @Override // org.codehaus.jackson.map.MapperConfig
    public boolean shouldSortPropertiesAlphabetically() {
        return this._sortPropertiesAlphabetically;
    }

    @Override // org.codehaus.jackson.map.MapperConfig
    public VisibilityChecker<?> getDefaultVisibilityChecker() {
        VisibilityChecker<?> vchecker = super.getDefaultVisibilityChecker();
        if (!isEnabled(Feature.AUTO_DETECT_SETTERS)) {
            vchecker = vchecker.withSetterVisibility(JsonAutoDetect.Visibility.NONE);
        }
        if (!isEnabled(Feature.AUTO_DETECT_CREATORS)) {
            vchecker = vchecker.withCreatorVisibility(JsonAutoDetect.Visibility.NONE);
        }
        if (!isEnabled(Feature.AUTO_DETECT_FIELDS)) {
            return vchecker.withFieldVisibility(JsonAutoDetect.Visibility.NONE);
        }
        return vchecker;
    }

    public LinkedNode<DeserializationProblemHandler> getProblemHandlers() {
        return this._problemHandlers;
    }

    public void addHandler(DeserializationProblemHandler h) {
        if (!LinkedNode.contains(this._problemHandlers, h)) {
            this._problemHandlers = new LinkedNode<>(h, this._problemHandlers);
        }
    }

    public void clearHandlers() {
        this._problemHandlers = null;
    }

    public Base64Variant getBase64Variant() {
        return Base64Variants.getDefaultVariant();
    }

    public final JsonNodeFactory getNodeFactory() {
        return this._nodeFactory;
    }

    public <T extends BeanDescription> T introspect(JavaType javaType) {
        return (T) getClassIntrospector().forDeserialization(this, javaType, this);
    }

    public <T extends BeanDescription> T introspectForCreation(JavaType javaType) {
        return (T) getClassIntrospector().forCreation(this, javaType, this);
    }

    public JsonDeserializer<Object> deserializerInstance(Annotated annotated, Class<? extends JsonDeserializer<?>> deserClass) {
        JsonDeserializer<?> deser;
        HandlerInstantiator hi = getHandlerInstantiator();
        return (hi == null || (deser = hi.deserializerInstance(this, annotated, deserClass)) == null) ? (JsonDeserializer) ClassUtil.createInstance(deserClass, canOverrideAccessModifiers()) : deser;
    }

    public KeyDeserializer keyDeserializerInstance(Annotated annotated, Class<? extends KeyDeserializer> keyDeserClass) {
        KeyDeserializer keyDeser;
        HandlerInstantiator hi = getHandlerInstantiator();
        return (hi == null || (keyDeser = hi.keyDeserializerInstance(this, annotated, keyDeserClass)) == null) ? (KeyDeserializer) ClassUtil.createInstance(keyDeserClass, canOverrideAccessModifiers()) : keyDeser;
    }

    public ValueInstantiator valueInstantiatorInstance(Annotated annotated, Class<? extends ValueInstantiator> instClass) {
        ValueInstantiator inst;
        HandlerInstantiator hi = getHandlerInstantiator();
        return (hi == null || (inst = hi.valueInstantiatorInstance(this, annotated, instClass)) == null) ? (ValueInstantiator) ClassUtil.createInstance(instClass, canOverrideAccessModifiers()) : inst;
    }
}
