package org.codehaus.jackson.map;

import java.text.DateFormat;
import java.util.HashMap;
import org.codehaus.jackson.annotate.JsonAutoDetect;
import org.codehaus.jackson.annotate.JsonMethod;
import org.codehaus.jackson.map.MapperConfig;
import org.codehaus.jackson.map.annotate.JsonSerialize;
import org.codehaus.jackson.map.introspect.Annotated;
import org.codehaus.jackson.map.introspect.AnnotatedClass;
import org.codehaus.jackson.map.introspect.VisibilityChecker;
import org.codehaus.jackson.map.jsontype.SubtypeResolver;
import org.codehaus.jackson.map.jsontype.TypeResolverBuilder;
import org.codehaus.jackson.map.ser.FilterProvider;
import org.codehaus.jackson.map.type.ClassKey;
import org.codehaus.jackson.map.type.TypeFactory;
import org.codehaus.jackson.map.util.ClassUtil;
import org.codehaus.jackson.type.JavaType;

/* JADX INFO: loaded from: classes.dex */
public class SerializationConfig extends MapperConfig.Impl<Feature, SerializationConfig> {
    protected FilterProvider _filterProvider;
    protected JsonSerialize.Inclusion _serializationInclusion;
    protected Class<?> _serializationView;

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
        AUTO_DETECT_GETTERS(true),
        AUTO_DETECT_IS_GETTERS(true),
        AUTO_DETECT_FIELDS(true),
        CAN_OVERRIDE_ACCESS_MODIFIERS(true),
        REQUIRE_SETTERS_FOR_GETTERS(false),
        WRITE_NULL_PROPERTIES(true),
        USE_STATIC_TYPING(false),
        DEFAULT_VIEW_INCLUSION(true),
        WRAP_ROOT_VALUE(false),
        INDENT_OUTPUT(false),
        SORT_PROPERTIES_ALPHABETICALLY(false),
        FAIL_ON_EMPTY_BEANS(true),
        WRAP_EXCEPTIONS(true),
        CLOSE_CLOSEABLE(false),
        FLUSH_AFTER_WRITE_VALUE(true),
        WRITE_DATES_AS_TIMESTAMPS(true),
        WRITE_DATE_KEYS_AS_TIMESTAMPS(false),
        WRITE_CHAR_ARRAYS_AS_JSON_ARRAYS(false),
        WRITE_ENUMS_USING_TO_STRING(false),
        WRITE_ENUMS_USING_INDEX(false),
        WRITE_NULL_MAP_VALUES(true),
        WRITE_EMPTY_JSON_ARRAYS(true);

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

    public SerializationConfig(ClassIntrospector<? extends BeanDescription> intr, AnnotationIntrospector annIntr, VisibilityChecker<?> vc, SubtypeResolver subtypeResolver, PropertyNamingStrategy propertyNamingStrategy, TypeFactory typeFactory, HandlerInstantiator handlerInstantiator) {
        super(intr, annIntr, vc, subtypeResolver, propertyNamingStrategy, typeFactory, handlerInstantiator, collectFeatureDefaults(Feature.class));
        this._serializationInclusion = null;
        this._filterProvider = null;
    }

    protected SerializationConfig(SerializationConfig src) {
        this(src, src._base);
    }

    protected SerializationConfig(SerializationConfig src, HashMap<ClassKey, Class<?>> mixins, SubtypeResolver str) {
        this(src, src._base);
        this._mixInAnnotations = mixins;
        this._subtypeResolver = str;
    }

    protected SerializationConfig(SerializationConfig src, MapperConfig.Base base) {
        super(src, base, src._subtypeResolver);
        this._serializationInclusion = null;
        this._serializationInclusion = src._serializationInclusion;
        this._serializationView = src._serializationView;
        this._filterProvider = src._filterProvider;
    }

    protected SerializationConfig(SerializationConfig src, FilterProvider filters) {
        super(src);
        this._serializationInclusion = null;
        this._serializationInclusion = src._serializationInclusion;
        this._serializationView = src._serializationView;
        this._filterProvider = filters;
    }

    protected SerializationConfig(SerializationConfig src, Class<?> view) {
        super(src);
        this._serializationInclusion = null;
        this._serializationInclusion = src._serializationInclusion;
        this._serializationView = view;
        this._filterProvider = src._filterProvider;
    }

    protected SerializationConfig(SerializationConfig src, JsonSerialize.Inclusion incl) {
        super(src);
        this._serializationInclusion = null;
        this._serializationInclusion = incl;
        if (incl == JsonSerialize.Inclusion.NON_NULL) {
            this._featureFlags &= Feature.WRITE_NULL_PROPERTIES.getMask() ^ (-1);
        } else {
            this._featureFlags |= Feature.WRITE_NULL_PROPERTIES.getMask();
        }
        this._serializationView = src._serializationView;
        this._filterProvider = src._filterProvider;
    }

    protected SerializationConfig(SerializationConfig src, int features) {
        super(src, features);
        this._serializationInclusion = null;
        this._serializationInclusion = src._serializationInclusion;
        this._serializationView = src._serializationView;
        this._filterProvider = src._filterProvider;
    }

    @Override // org.codehaus.jackson.map.MapperConfig
    public SerializationConfig withClassIntrospector(ClassIntrospector<? extends BeanDescription> ci) {
        return new SerializationConfig(this, this._base.withClassIntrospector(ci));
    }

    @Override // org.codehaus.jackson.map.MapperConfig
    public SerializationConfig withAnnotationIntrospector(AnnotationIntrospector ai) {
        return new SerializationConfig(this, this._base.withAnnotationIntrospector(ai));
    }

    @Override // org.codehaus.jackson.map.MapperConfig
    public SerializationConfig withInsertedAnnotationIntrospector(AnnotationIntrospector ai) {
        return new SerializationConfig(this, this._base.withInsertedAnnotationIntrospector(ai));
    }

    @Override // org.codehaus.jackson.map.MapperConfig
    public SerializationConfig withAppendedAnnotationIntrospector(AnnotationIntrospector ai) {
        return new SerializationConfig(this, this._base.withAppendedAnnotationIntrospector(ai));
    }

    @Override // org.codehaus.jackson.map.MapperConfig
    public SerializationConfig withVisibilityChecker(VisibilityChecker<?> vc) {
        return new SerializationConfig(this, this._base.withVisibilityChecker(vc));
    }

    @Override // org.codehaus.jackson.map.MapperConfig
    public SerializationConfig withVisibility(JsonMethod forMethod, JsonAutoDetect.Visibility visibility) {
        return new SerializationConfig(this, this._base.withVisibility(forMethod, visibility));
    }

    @Override // org.codehaus.jackson.map.MapperConfig
    public SerializationConfig withTypeResolverBuilder(TypeResolverBuilder<?> trb) {
        return new SerializationConfig(this, this._base.withTypeResolverBuilder(trb));
    }

    @Override // org.codehaus.jackson.map.MapperConfig
    public SerializationConfig withSubtypeResolver(SubtypeResolver str) {
        SerializationConfig cfg = new SerializationConfig(this);
        cfg._subtypeResolver = str;
        return cfg;
    }

    @Override // org.codehaus.jackson.map.MapperConfig
    public SerializationConfig withPropertyNamingStrategy(PropertyNamingStrategy pns) {
        return new SerializationConfig(this, this._base.withPropertyNamingStrategy(pns));
    }

    @Override // org.codehaus.jackson.map.MapperConfig
    public SerializationConfig withTypeFactory(TypeFactory tf) {
        return new SerializationConfig(this, this._base.withTypeFactory(tf));
    }

    @Override // org.codehaus.jackson.map.MapperConfig
    public SerializationConfig withDateFormat(DateFormat df) {
        SerializationConfig cfg = new SerializationConfig(this, this._base.withDateFormat(df));
        return df == null ? cfg.with(Feature.WRITE_DATES_AS_TIMESTAMPS) : cfg.without(Feature.WRITE_DATES_AS_TIMESTAMPS);
    }

    @Override // org.codehaus.jackson.map.MapperConfig
    public SerializationConfig withHandlerInstantiator(HandlerInstantiator hi) {
        return new SerializationConfig(this, this._base.withHandlerInstantiator(hi));
    }

    public SerializationConfig withFilters(FilterProvider filterProvider) {
        return new SerializationConfig(this, filterProvider);
    }

    public SerializationConfig withView(Class<?> view) {
        return new SerializationConfig(this, view);
    }

    public SerializationConfig withSerializationInclusion(JsonSerialize.Inclusion incl) {
        return new SerializationConfig(this, incl);
    }

    @Override // org.codehaus.jackson.map.MapperConfig.Impl
    public SerializationConfig with(Feature... features) {
        int flags = this._featureFlags;
        for (Feature f : features) {
            flags |= f.getMask();
        }
        return new SerializationConfig(this, flags);
    }

    @Override // org.codehaus.jackson.map.MapperConfig.Impl
    public SerializationConfig without(Feature... features) {
        int flags = this._featureFlags;
        for (Feature f : features) {
            flags &= f.getMask() ^ (-1);
        }
        return new SerializationConfig(this, flags);
    }

    @Override // org.codehaus.jackson.map.MapperConfig
    @Deprecated
    public void fromAnnotations(Class<?> cls) {
        AnnotationIntrospector ai = getAnnotationIntrospector();
        AnnotatedClass ac = AnnotatedClass.construct(cls, ai, null);
        this._base = this._base.withVisibilityChecker(ai.findAutoDetectVisibility(ac, getDefaultVisibilityChecker()));
        JsonSerialize.Inclusion incl = ai.findSerializationInclusion(ac, null);
        if (incl != this._serializationInclusion) {
            setSerializationInclusion(incl);
        }
        JsonSerialize.Typing typing = ai.findSerializationTyping(ac);
        if (typing != null) {
            set(Feature.USE_STATIC_TYPING, typing == JsonSerialize.Typing.STATIC);
        }
    }

    @Override // org.codehaus.jackson.map.MapperConfig
    public SerializationConfig createUnshared(SubtypeResolver subtypeResolver) {
        HashMap<ClassKey, Class<?>> mixins = this._mixInAnnotations;
        this._mixInAnnotationsShared = true;
        return new SerializationConfig(this, mixins, subtypeResolver);
    }

    @Override // org.codehaus.jackson.map.MapperConfig
    public AnnotationIntrospector getAnnotationIntrospector() {
        return isEnabled(Feature.USE_ANNOTATIONS) ? super.getAnnotationIntrospector() : AnnotationIntrospector.nopInstance();
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
        return isEnabled(Feature.SORT_PROPERTIES_ALPHABETICALLY);
    }

    @Override // org.codehaus.jackson.map.MapperConfig
    public VisibilityChecker<?> getDefaultVisibilityChecker() {
        VisibilityChecker<?> vchecker = super.getDefaultVisibilityChecker();
        if (!isEnabled(Feature.AUTO_DETECT_GETTERS)) {
            vchecker = vchecker.withGetterVisibility(JsonAutoDetect.Visibility.NONE);
        }
        if (!isEnabled(Feature.AUTO_DETECT_IS_GETTERS)) {
            vchecker = vchecker.withIsGetterVisibility(JsonAutoDetect.Visibility.NONE);
        }
        if (!isEnabled(Feature.AUTO_DETECT_FIELDS)) {
            return vchecker.withFieldVisibility(JsonAutoDetect.Visibility.NONE);
        }
        return vchecker;
    }

    public Class<?> getSerializationView() {
        return this._serializationView;
    }

    public JsonSerialize.Inclusion getSerializationInclusion() {
        if (this._serializationInclusion != null) {
            return this._serializationInclusion;
        }
        return isEnabled(Feature.WRITE_NULL_PROPERTIES) ? JsonSerialize.Inclusion.ALWAYS : JsonSerialize.Inclusion.NON_NULL;
    }

    @Deprecated
    public void setSerializationInclusion(JsonSerialize.Inclusion props) {
        this._serializationInclusion = props;
        if (props == JsonSerialize.Inclusion.NON_NULL) {
            disable(Feature.WRITE_NULL_PROPERTIES);
        } else {
            enable(Feature.WRITE_NULL_PROPERTIES);
        }
    }

    public FilterProvider getFilterProvider() {
        return this._filterProvider;
    }

    public <T extends BeanDescription> T introspect(JavaType javaType) {
        return (T) getClassIntrospector().forSerialization(this, javaType, this);
    }

    public JsonSerializer<Object> serializerInstance(Annotated annotated, Class<? extends JsonSerializer<?>> serClass) {
        JsonSerializer<?> ser;
        HandlerInstantiator hi = getHandlerInstantiator();
        return (hi == null || (ser = hi.serializerInstance(this, annotated, serClass)) == null) ? (JsonSerializer) ClassUtil.createInstance(serClass, canOverrideAccessModifiers()) : ser;
    }

    @Override // org.codehaus.jackson.map.MapperConfig
    @Deprecated
    public final void setDateFormat(DateFormat df) {
        super.setDateFormat(df);
        set(Feature.WRITE_DATES_AS_TIMESTAMPS, df == null);
    }

    @Deprecated
    public void setSerializationView(Class<?> view) {
        this._serializationView = view;
    }

    public String toString() {
        return "[SerializationConfig: flags=0x" + Integer.toHexString(this._featureFlags) + "]";
    }
}
