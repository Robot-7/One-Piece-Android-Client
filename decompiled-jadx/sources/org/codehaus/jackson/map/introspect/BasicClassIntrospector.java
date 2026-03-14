package org.codehaus.jackson.map.introspect;

import java.lang.reflect.Method;
import java.lang.reflect.Modifier;
import java.util.Collection;
import java.util.Map;
import org.codehaus.jackson.map.AnnotationIntrospector;
import org.codehaus.jackson.map.BeanDescription;
import org.codehaus.jackson.map.ClassIntrospector;
import org.codehaus.jackson.map.DeserializationConfig;
import org.codehaus.jackson.map.MapperConfig;
import org.codehaus.jackson.map.SerializationConfig;
import org.codehaus.jackson.map.type.SimpleType;
import org.codehaus.jackson.map.util.ClassUtil;
import org.codehaus.jackson.type.JavaType;

/* JADX INFO: loaded from: classes.dex */
public class BasicClassIntrospector extends ClassIntrospector<BasicBeanDescription> {
    protected static final BasicBeanDescription BOOLEAN_DESC;

    @Deprecated
    public static final GetterMethodFilter DEFAULT_GETTER_FILTER;

    @Deprecated
    public static final SetterAndGetterMethodFilter DEFAULT_SETTER_AND_GETTER_FILTER;

    @Deprecated
    public static final SetterMethodFilter DEFAULT_SETTER_FILTER;
    protected static final BasicBeanDescription INT_DESC;
    protected static final BasicBeanDescription LONG_DESC;
    protected static final MethodFilter MINIMAL_FILTER;
    protected static final BasicBeanDescription STRING_DESC;
    public static final BasicClassIntrospector instance;

    @Override // org.codehaus.jackson.map.ClassIntrospector
    public /* bridge */ /* synthetic */ BeanDescription forClassAnnotations(MapperConfig x0, JavaType x1, ClassIntrospector.MixInResolver x2) {
        return forClassAnnotations((MapperConfig<?>) x0, x1, x2);
    }

    @Override // org.codehaus.jackson.map.ClassIntrospector
    public /* bridge */ /* synthetic */ BeanDescription forDirectClassAnnotations(MapperConfig x0, JavaType x1, ClassIntrospector.MixInResolver x2) {
        return forDirectClassAnnotations((MapperConfig<?>) x0, x1, x2);
    }

    static {
        AnnotatedClass ac = AnnotatedClass.constructWithoutSuperTypes(String.class, null, null);
        STRING_DESC = BasicBeanDescription.forOtherUse(null, SimpleType.constructUnsafe(String.class), ac);
        AnnotatedClass ac2 = AnnotatedClass.constructWithoutSuperTypes(Boolean.TYPE, null, null);
        BOOLEAN_DESC = BasicBeanDescription.forOtherUse(null, SimpleType.constructUnsafe(Boolean.TYPE), ac2);
        AnnotatedClass ac3 = AnnotatedClass.constructWithoutSuperTypes(Integer.TYPE, null, null);
        INT_DESC = BasicBeanDescription.forOtherUse(null, SimpleType.constructUnsafe(Integer.TYPE), ac3);
        AnnotatedClass ac4 = AnnotatedClass.constructWithoutSuperTypes(Long.TYPE, null, null);
        LONG_DESC = BasicBeanDescription.forOtherUse(null, SimpleType.constructUnsafe(Long.TYPE), ac4);
        DEFAULT_GETTER_FILTER = new GetterMethodFilter();
        DEFAULT_SETTER_FILTER = new SetterMethodFilter();
        DEFAULT_SETTER_AND_GETTER_FILTER = new SetterAndGetterMethodFilter();
        MINIMAL_FILTER = new MinimalMethodFilter();
        instance = new BasicClassIntrospector();
    }

    @Override // org.codehaus.jackson.map.ClassIntrospector
    public BasicBeanDescription forSerialization(SerializationConfig cfg, JavaType type, ClassIntrospector.MixInResolver r) {
        BasicBeanDescription desc = _findCachedDesc(type);
        if (desc == null) {
            return BasicBeanDescription.forSerialization(collectProperties(cfg, type, r, true));
        }
        return desc;
    }

    @Override // org.codehaus.jackson.map.ClassIntrospector
    public BasicBeanDescription forDeserialization(DeserializationConfig cfg, JavaType type, ClassIntrospector.MixInResolver r) {
        BasicBeanDescription desc = _findCachedDesc(type);
        if (desc == null) {
            return BasicBeanDescription.forDeserialization(collectProperties(cfg, type, r, false));
        }
        return desc;
    }

    @Override // org.codehaus.jackson.map.ClassIntrospector
    public BasicBeanDescription forCreation(DeserializationConfig cfg, JavaType type, ClassIntrospector.MixInResolver r) {
        BasicBeanDescription desc = _findCachedDesc(type);
        if (desc == null) {
            return BasicBeanDescription.forDeserialization(collectProperties(cfg, type, r, false));
        }
        return desc;
    }

    @Override // org.codehaus.jackson.map.ClassIntrospector
    public BasicBeanDescription forClassAnnotations(MapperConfig<?> cfg, JavaType type, ClassIntrospector.MixInResolver r) {
        boolean useAnnotations = cfg.isAnnotationProcessingEnabled();
        AnnotationIntrospector ai = cfg.getAnnotationIntrospector();
        Class<?> rawClass = type.getRawClass();
        if (!useAnnotations) {
            ai = null;
        }
        AnnotatedClass ac = AnnotatedClass.construct(rawClass, ai, r);
        return BasicBeanDescription.forOtherUse(cfg, type, ac);
    }

    @Override // org.codehaus.jackson.map.ClassIntrospector
    public BasicBeanDescription forDirectClassAnnotations(MapperConfig<?> cfg, JavaType type, ClassIntrospector.MixInResolver r) {
        boolean useAnnotations = cfg.isAnnotationProcessingEnabled();
        AnnotationIntrospector ai = cfg.getAnnotationIntrospector();
        Class<?> rawClass = type.getRawClass();
        if (!useAnnotations) {
            ai = null;
        }
        AnnotatedClass ac = AnnotatedClass.constructWithoutSuperTypes(rawClass, ai, r);
        return BasicBeanDescription.forOtherUse(cfg, type, ac);
    }

    public POJOPropertiesCollector collectProperties(MapperConfig<?> config, JavaType type, ClassIntrospector.MixInResolver r, boolean forSerialization) {
        AnnotatedClass ac = classWithCreators(config, type, r);
        ac.resolveMemberMethods(MINIMAL_FILTER);
        ac.resolveFields();
        return constructPropertyCollector(config, ac, type, forSerialization).collect();
    }

    protected POJOPropertiesCollector constructPropertyCollector(MapperConfig<?> config, AnnotatedClass ac, JavaType type, boolean forSerialization) {
        return new POJOPropertiesCollector(config, forSerialization, type, ac);
    }

    public AnnotatedClass classWithCreators(MapperConfig<?> config, JavaType type, ClassIntrospector.MixInResolver r) {
        boolean useAnnotations = config.isAnnotationProcessingEnabled();
        AnnotationIntrospector ai = config.getAnnotationIntrospector();
        Class<?> rawClass = type.getRawClass();
        if (!useAnnotations) {
            ai = null;
        }
        AnnotatedClass ac = AnnotatedClass.construct(rawClass, ai, r);
        ac.resolveMemberMethods(MINIMAL_FILTER);
        ac.resolveCreators(true);
        return ac;
    }

    protected BasicBeanDescription _findCachedDesc(JavaType type) {
        Class<?> cls = type.getRawClass();
        if (cls == String.class) {
            return STRING_DESC;
        }
        if (cls == Boolean.TYPE) {
            return BOOLEAN_DESC;
        }
        if (cls == Integer.TYPE) {
            return INT_DESC;
        }
        if (cls == Long.TYPE) {
            return LONG_DESC;
        }
        return null;
    }

    @Deprecated
    protected MethodFilter getSerializationMethodFilter(SerializationConfig cfg) {
        return DEFAULT_GETTER_FILTER;
    }

    @Deprecated
    protected MethodFilter getDeserializationMethodFilter(DeserializationConfig cfg) {
        return cfg.isEnabled(DeserializationConfig.Feature.USE_GETTERS_AS_SETTERS) ? DEFAULT_SETTER_AND_GETTER_FILTER : DEFAULT_SETTER_FILTER;
    }

    private static class MinimalMethodFilter implements MethodFilter {
        private MinimalMethodFilter() {
        }

        @Override // org.codehaus.jackson.map.introspect.MethodFilter
        public boolean includeMethod(Method m) {
            if (Modifier.isStatic(m.getModifiers())) {
                return false;
            }
            int pcount = m.getParameterTypes().length;
            return pcount <= 2;
        }
    }

    @Deprecated
    public static class GetterMethodFilter implements MethodFilter {
        private GetterMethodFilter() {
        }

        @Override // org.codehaus.jackson.map.introspect.MethodFilter
        public boolean includeMethod(Method m) {
            return ClassUtil.hasGetterSignature(m);
        }
    }

    @Deprecated
    public static class SetterMethodFilter implements MethodFilter {
        @Override // org.codehaus.jackson.map.introspect.MethodFilter
        public boolean includeMethod(Method m) {
            if (Modifier.isStatic(m.getModifiers())) {
                return false;
            }
            int pcount = m.getParameterTypes().length;
            switch (pcount) {
                case 1:
                    return true;
                case 2:
                    return true;
                default:
                    return false;
            }
        }
    }

    @Deprecated
    public static final class SetterAndGetterMethodFilter extends SetterMethodFilter {
        @Override // org.codehaus.jackson.map.introspect.BasicClassIntrospector.SetterMethodFilter, org.codehaus.jackson.map.introspect.MethodFilter
        public boolean includeMethod(Method m) {
            if (super.includeMethod(m)) {
                return true;
            }
            if (!ClassUtil.hasGetterSignature(m)) {
                return false;
            }
            Class<?> rt = m.getReturnType();
            return Collection.class.isAssignableFrom(rt) || Map.class.isAssignableFrom(rt);
        }
    }
}
