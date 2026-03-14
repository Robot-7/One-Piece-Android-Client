package org.codehaus.jackson.map.deser;

import java.util.Collection;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;
import org.codehaus.jackson.JsonNode;
import org.codehaus.jackson.map.AbstractTypeResolver;
import org.codehaus.jackson.map.AnnotationIntrospector;
import org.codehaus.jackson.map.BeanProperty;
import org.codehaus.jackson.map.BeanPropertyDefinition;
import org.codehaus.jackson.map.DeserializationConfig;
import org.codehaus.jackson.map.DeserializerFactory;
import org.codehaus.jackson.map.DeserializerProvider;
import org.codehaus.jackson.map.Deserializers;
import org.codehaus.jackson.map.JsonDeserializer;
import org.codehaus.jackson.map.JsonMappingException;
import org.codehaus.jackson.map.KeyDeserializer;
import org.codehaus.jackson.map.KeyDeserializers;
import org.codehaus.jackson.map.TypeDeserializer;
import org.codehaus.jackson.map.deser.SettableBeanProperty;
import org.codehaus.jackson.map.deser.impl.CreatorCollector;
import org.codehaus.jackson.map.deser.impl.CreatorProperty;
import org.codehaus.jackson.map.introspect.AnnotatedClass;
import org.codehaus.jackson.map.introspect.AnnotatedConstructor;
import org.codehaus.jackson.map.introspect.AnnotatedField;
import org.codehaus.jackson.map.introspect.AnnotatedMember;
import org.codehaus.jackson.map.introspect.AnnotatedMethod;
import org.codehaus.jackson.map.introspect.AnnotatedParameter;
import org.codehaus.jackson.map.introspect.BasicBeanDescription;
import org.codehaus.jackson.map.introspect.VisibilityChecker;
import org.codehaus.jackson.map.type.ArrayType;
import org.codehaus.jackson.map.type.CollectionLikeType;
import org.codehaus.jackson.map.type.CollectionType;
import org.codehaus.jackson.map.type.MapLikeType;
import org.codehaus.jackson.map.type.MapType;
import org.codehaus.jackson.map.util.ArrayBuilders;
import org.codehaus.jackson.map.util.ClassUtil;
import org.codehaus.jackson.type.JavaType;

/* JADX INFO: loaded from: classes.dex */
public class BeanDeserializerFactory extends BasicDeserializerFactory {
    private static final Class<?>[] INIT_CAUSE_PARAMS = {Throwable.class};
    public static final BeanDeserializerFactory instance = new BeanDeserializerFactory(null);
    protected final DeserializerFactory.Config _factoryConfig;

    public static class ConfigImpl extends DeserializerFactory.Config {
        protected final AbstractTypeResolver[] _abstractTypeResolvers;
        protected final Deserializers[] _additionalDeserializers;
        protected final KeyDeserializers[] _additionalKeyDeserializers;
        protected final BeanDeserializerModifier[] _modifiers;
        protected final ValueInstantiators[] _valueInstantiators;
        protected static final KeyDeserializers[] NO_KEY_DESERIALIZERS = new KeyDeserializers[0];
        protected static final BeanDeserializerModifier[] NO_MODIFIERS = new BeanDeserializerModifier[0];
        protected static final AbstractTypeResolver[] NO_ABSTRACT_TYPE_RESOLVERS = new AbstractTypeResolver[0];
        protected static final ValueInstantiators[] NO_VALUE_INSTANTIATORS = new ValueInstantiators[0];

        public ConfigImpl() {
            this(null, null, null, null, null);
        }

        protected ConfigImpl(Deserializers[] allAdditionalDeserializers, KeyDeserializers[] allAdditionalKeyDeserializers, BeanDeserializerModifier[] modifiers, AbstractTypeResolver[] atr, ValueInstantiators[] vi) {
            this._additionalDeserializers = allAdditionalDeserializers == null ? BeanDeserializerFactory.NO_DESERIALIZERS : allAdditionalDeserializers;
            this._additionalKeyDeserializers = allAdditionalKeyDeserializers == null ? NO_KEY_DESERIALIZERS : allAdditionalKeyDeserializers;
            this._modifiers = modifiers == null ? NO_MODIFIERS : modifiers;
            this._abstractTypeResolvers = atr == null ? NO_ABSTRACT_TYPE_RESOLVERS : atr;
            this._valueInstantiators = vi == null ? NO_VALUE_INSTANTIATORS : vi;
        }

        @Override // org.codehaus.jackson.map.DeserializerFactory.Config
        public DeserializerFactory.Config withAdditionalDeserializers(Deserializers additional) {
            if (additional == null) {
                throw new IllegalArgumentException("Can not pass null Deserializers");
            }
            Deserializers[] all = (Deserializers[]) ArrayBuilders.insertInListNoDup(this._additionalDeserializers, additional);
            return new ConfigImpl(all, this._additionalKeyDeserializers, this._modifiers, this._abstractTypeResolvers, this._valueInstantiators);
        }

        @Override // org.codehaus.jackson.map.DeserializerFactory.Config
        public DeserializerFactory.Config withAdditionalKeyDeserializers(KeyDeserializers additional) {
            if (additional == null) {
                throw new IllegalArgumentException("Can not pass null KeyDeserializers");
            }
            KeyDeserializers[] all = (KeyDeserializers[]) ArrayBuilders.insertInListNoDup(this._additionalKeyDeserializers, additional);
            return new ConfigImpl(this._additionalDeserializers, all, this._modifiers, this._abstractTypeResolvers, this._valueInstantiators);
        }

        @Override // org.codehaus.jackson.map.DeserializerFactory.Config
        public DeserializerFactory.Config withDeserializerModifier(BeanDeserializerModifier modifier) {
            if (modifier == null) {
                throw new IllegalArgumentException("Can not pass null modifier");
            }
            BeanDeserializerModifier[] all = (BeanDeserializerModifier[]) ArrayBuilders.insertInListNoDup(this._modifiers, modifier);
            return new ConfigImpl(this._additionalDeserializers, this._additionalKeyDeserializers, all, this._abstractTypeResolvers, this._valueInstantiators);
        }

        @Override // org.codehaus.jackson.map.DeserializerFactory.Config
        public DeserializerFactory.Config withAbstractTypeResolver(AbstractTypeResolver resolver) {
            if (resolver == null) {
                throw new IllegalArgumentException("Can not pass null resolver");
            }
            AbstractTypeResolver[] all = (AbstractTypeResolver[]) ArrayBuilders.insertInListNoDup(this._abstractTypeResolvers, resolver);
            return new ConfigImpl(this._additionalDeserializers, this._additionalKeyDeserializers, this._modifiers, all, this._valueInstantiators);
        }

        @Override // org.codehaus.jackson.map.DeserializerFactory.Config
        public DeserializerFactory.Config withValueInstantiators(ValueInstantiators instantiators) {
            if (instantiators == null) {
                throw new IllegalArgumentException("Can not pass null resolver");
            }
            ValueInstantiators[] all = (ValueInstantiators[]) ArrayBuilders.insertInListNoDup(this._valueInstantiators, instantiators);
            return new ConfigImpl(this._additionalDeserializers, this._additionalKeyDeserializers, this._modifiers, this._abstractTypeResolvers, all);
        }

        @Override // org.codehaus.jackson.map.DeserializerFactory.Config
        public boolean hasDeserializers() {
            return this._additionalDeserializers.length > 0;
        }

        @Override // org.codehaus.jackson.map.DeserializerFactory.Config
        public boolean hasKeyDeserializers() {
            return this._additionalKeyDeserializers.length > 0;
        }

        @Override // org.codehaus.jackson.map.DeserializerFactory.Config
        public boolean hasDeserializerModifiers() {
            return this._modifiers.length > 0;
        }

        @Override // org.codehaus.jackson.map.DeserializerFactory.Config
        public boolean hasAbstractTypeResolvers() {
            return this._abstractTypeResolvers.length > 0;
        }

        @Override // org.codehaus.jackson.map.DeserializerFactory.Config
        public boolean hasValueInstantiators() {
            return this._valueInstantiators.length > 0;
        }

        @Override // org.codehaus.jackson.map.DeserializerFactory.Config
        public Iterable<Deserializers> deserializers() {
            return ArrayBuilders.arrayAsIterable(this._additionalDeserializers);
        }

        @Override // org.codehaus.jackson.map.DeserializerFactory.Config
        public Iterable<KeyDeserializers> keyDeserializers() {
            return ArrayBuilders.arrayAsIterable(this._additionalKeyDeserializers);
        }

        @Override // org.codehaus.jackson.map.DeserializerFactory.Config
        public Iterable<BeanDeserializerModifier> deserializerModifiers() {
            return ArrayBuilders.arrayAsIterable(this._modifiers);
        }

        @Override // org.codehaus.jackson.map.DeserializerFactory.Config
        public Iterable<AbstractTypeResolver> abstractTypeResolvers() {
            return ArrayBuilders.arrayAsIterable(this._abstractTypeResolvers);
        }

        @Override // org.codehaus.jackson.map.DeserializerFactory.Config
        public Iterable<ValueInstantiators> valueInstantiators() {
            return ArrayBuilders.arrayAsIterable(this._valueInstantiators);
        }
    }

    @Deprecated
    public BeanDeserializerFactory() {
        this(null);
    }

    public BeanDeserializerFactory(DeserializerFactory.Config config) {
        this._factoryConfig = config == null ? new ConfigImpl() : config;
    }

    @Override // org.codehaus.jackson.map.DeserializerFactory
    public final DeserializerFactory.Config getConfig() {
        return this._factoryConfig;
    }

    @Override // org.codehaus.jackson.map.deser.BasicDeserializerFactory, org.codehaus.jackson.map.DeserializerFactory
    public DeserializerFactory withConfig(DeserializerFactory.Config config) {
        if (this._factoryConfig != config) {
            if (getClass() != BeanDeserializerFactory.class) {
                throw new IllegalStateException("Subtype of BeanDeserializerFactory (" + getClass().getName() + ") has not properly overridden method 'withAdditionalDeserializers': can not instantiate subtype with additional deserializer definitions");
            }
            return new BeanDeserializerFactory(config);
        }
        return this;
    }

    @Override // org.codehaus.jackson.map.DeserializerFactory
    public KeyDeserializer createKeyDeserializer(DeserializationConfig config, JavaType type, BeanProperty property) throws JsonMappingException {
        if (this._factoryConfig.hasKeyDeserializers()) {
            BasicBeanDescription beanDesc = (BasicBeanDescription) config.introspectClassAnnotations(type.getRawClass());
            for (KeyDeserializers d : this._factoryConfig.keyDeserializers()) {
                KeyDeserializer deser = d.findKeyDeserializer(type, config, beanDesc, property);
                if (deser != null) {
                    return deser;
                }
            }
        }
        return null;
    }

    @Override // org.codehaus.jackson.map.deser.BasicDeserializerFactory
    protected JsonDeserializer<?> _findCustomArrayDeserializer(ArrayType type, DeserializationConfig config, DeserializerProvider provider, BeanProperty property, TypeDeserializer elementTypeDeserializer, JsonDeserializer<?> elementDeserializer) throws JsonMappingException {
        for (Deserializers d : this._factoryConfig.deserializers()) {
            JsonDeserializer<?> deser = d.findArrayDeserializer(type, config, provider, property, elementTypeDeserializer, elementDeserializer);
            if (deser != null) {
                return deser;
            }
        }
        return null;
    }

    @Override // org.codehaus.jackson.map.deser.BasicDeserializerFactory
    protected JsonDeserializer<?> _findCustomCollectionDeserializer(CollectionType type, DeserializationConfig config, DeserializerProvider provider, BasicBeanDescription beanDesc, BeanProperty property, TypeDeserializer elementTypeDeserializer, JsonDeserializer<?> elementDeserializer) throws JsonMappingException {
        for (Deserializers d : this._factoryConfig.deserializers()) {
            JsonDeserializer<?> deser = d.findCollectionDeserializer(type, config, provider, beanDesc, property, elementTypeDeserializer, elementDeserializer);
            if (deser != null) {
                return deser;
            }
        }
        return null;
    }

    @Override // org.codehaus.jackson.map.deser.BasicDeserializerFactory
    protected JsonDeserializer<?> _findCustomCollectionLikeDeserializer(CollectionLikeType type, DeserializationConfig config, DeserializerProvider provider, BasicBeanDescription beanDesc, BeanProperty property, TypeDeserializer elementTypeDeserializer, JsonDeserializer<?> elementDeserializer) throws JsonMappingException {
        for (Deserializers d : this._factoryConfig.deserializers()) {
            JsonDeserializer<?> deser = d.findCollectionLikeDeserializer(type, config, provider, beanDesc, property, elementTypeDeserializer, elementDeserializer);
            if (deser != null) {
                return deser;
            }
        }
        return null;
    }

    @Override // org.codehaus.jackson.map.deser.BasicDeserializerFactory
    protected JsonDeserializer<?> _findCustomEnumDeserializer(Class<?> type, DeserializationConfig config, BasicBeanDescription beanDesc, BeanProperty property) throws JsonMappingException {
        for (Deserializers d : this._factoryConfig.deserializers()) {
            JsonDeserializer<?> deser = d.findEnumDeserializer(type, config, beanDesc, property);
            if (deser != null) {
                return deser;
            }
        }
        return null;
    }

    @Override // org.codehaus.jackson.map.deser.BasicDeserializerFactory
    protected JsonDeserializer<?> _findCustomMapDeserializer(MapType type, DeserializationConfig config, DeserializerProvider provider, BasicBeanDescription beanDesc, BeanProperty property, KeyDeserializer keyDeserializer, TypeDeserializer elementTypeDeserializer, JsonDeserializer<?> elementDeserializer) throws JsonMappingException {
        for (Deserializers d : this._factoryConfig.deserializers()) {
            JsonDeserializer<?> deser = d.findMapDeserializer(type, config, provider, beanDesc, property, keyDeserializer, elementTypeDeserializer, elementDeserializer);
            if (deser != null) {
                return deser;
            }
        }
        return null;
    }

    @Override // org.codehaus.jackson.map.deser.BasicDeserializerFactory
    protected JsonDeserializer<?> _findCustomMapLikeDeserializer(MapLikeType type, DeserializationConfig config, DeserializerProvider provider, BasicBeanDescription beanDesc, BeanProperty property, KeyDeserializer keyDeserializer, TypeDeserializer elementTypeDeserializer, JsonDeserializer<?> elementDeserializer) throws JsonMappingException {
        for (Deserializers d : this._factoryConfig.deserializers()) {
            JsonDeserializer<?> deser = d.findMapLikeDeserializer(type, config, provider, beanDesc, property, keyDeserializer, elementTypeDeserializer, elementDeserializer);
            if (deser != null) {
                return deser;
            }
        }
        return null;
    }

    @Override // org.codehaus.jackson.map.deser.BasicDeserializerFactory
    protected JsonDeserializer<?> _findCustomTreeNodeDeserializer(Class<? extends JsonNode> type, DeserializationConfig config, BeanProperty property) throws JsonMappingException {
        for (Deserializers d : this._factoryConfig.deserializers()) {
            JsonDeserializer<?> deser = d.findTreeNodeDeserializer(type, config, property);
            if (deser != null) {
                return deser;
            }
        }
        return null;
    }

    protected JsonDeserializer<Object> _findCustomBeanDeserializer(JavaType type, DeserializationConfig config, DeserializerProvider provider, BasicBeanDescription beanDesc, BeanProperty property) throws JsonMappingException {
        for (Deserializers d : this._factoryConfig.deserializers()) {
            JsonDeserializer<?> deser = d.findBeanDeserializer(type, config, provider, beanDesc, property);
            if (deser != null) {
                return deser;
            }
        }
        return null;
    }

    @Override // org.codehaus.jackson.map.deser.BasicDeserializerFactory, org.codehaus.jackson.map.DeserializerFactory
    public JavaType mapAbstractType(DeserializationConfig config, JavaType type) throws JsonMappingException {
        JavaType next;
        while (true) {
            next = _mapAbstractType2(config, type);
            if (next == null) {
                return type;
            }
            Class<?> prevCls = type.getRawClass();
            Class<?> nextCls = next.getRawClass();
            if (prevCls == nextCls || !prevCls.isAssignableFrom(nextCls)) {
                break;
            }
            type = next;
        }
        throw new IllegalArgumentException("Invalid abstract type resolution from " + type + " to " + next + ": latter is not a subtype of former");
    }

    @Override // org.codehaus.jackson.map.deser.BasicDeserializerFactory, org.codehaus.jackson.map.DeserializerFactory
    public ValueInstantiator findValueInstantiator(DeserializationConfig config, BasicBeanDescription beanDesc) throws JsonMappingException {
        ValueInstantiator instantiator;
        AnnotatedClass ac = beanDesc.getClassInfo();
        Object instDef = config.getAnnotationIntrospector().findValueInstantiator(ac);
        if (instDef != null) {
            if (instDef instanceof ValueInstantiator) {
                instantiator = (ValueInstantiator) instDef;
            } else {
                if (!(instDef instanceof Class)) {
                    throw new IllegalStateException("Invalid value instantiator returned for type " + beanDesc + ": neither a Class nor ValueInstantiator");
                }
                Class<?> cls = (Class) instDef;
                if (!ValueInstantiator.class.isAssignableFrom(cls)) {
                    throw new IllegalStateException("Invalid instantiator Class<?> returned for type " + beanDesc + ": " + cls.getName() + " not a ValueInstantiator");
                }
                instantiator = config.valueInstantiatorInstance(ac, cls);
            }
        } else {
            instantiator = constructDefaultValueInstantiator(config, beanDesc);
        }
        if (this._factoryConfig.hasValueInstantiators()) {
            for (ValueInstantiators insts : this._factoryConfig.valueInstantiators()) {
                instantiator = insts.findValueInstantiator(config, beanDesc, instantiator);
                if (instantiator == null) {
                    throw new JsonMappingException("Broken registered ValueInstantiators (of type " + insts.getClass().getName() + "): returned null ValueInstantiator");
                }
            }
        }
        return instantiator;
    }

    @Override // org.codehaus.jackson.map.DeserializerFactory
    public JsonDeserializer<Object> createBeanDeserializer(DeserializationConfig config, DeserializerProvider p, JavaType type, BeanProperty property) throws JsonMappingException {
        JavaType concreteType;
        if (type.isAbstract()) {
            type = mapAbstractType(config, type);
        }
        BasicBeanDescription beanDesc = (BasicBeanDescription) config.introspect(type);
        JsonDeserializer<Object> ad = findDeserializerFromAnnotation(config, beanDesc.getClassInfo(), property);
        if (ad == null) {
            JavaType newType = modifyTypeByAnnotation(config, beanDesc.getClassInfo(), type, null);
            if (newType.getRawClass() != type.getRawClass()) {
                type = newType;
                beanDesc = (BasicBeanDescription) config.introspect(type);
            }
            JsonDeserializer<Object> custom = _findCustomBeanDeserializer(type, config, p, beanDesc, property);
            if (custom != null) {
                return custom;
            }
            if (type.isThrowable()) {
                return buildThrowableDeserializer(config, type, beanDesc, property);
            }
            if (type.isAbstract() && (concreteType = materializeAbstractType(config, beanDesc)) != null) {
                return buildBeanDeserializer(config, concreteType, (BasicBeanDescription) config.introspect(concreteType), property);
            }
            JsonDeserializer<Object> deser = findStdBeanDeserializer(config, p, type, property);
            if (deser != null) {
                return deser;
            }
            if (!isPotentialBeanType(type.getRawClass())) {
                return null;
            }
            return buildBeanDeserializer(config, type, beanDesc, property);
        }
        return ad;
    }

    protected JavaType _mapAbstractType2(DeserializationConfig config, JavaType type) throws JsonMappingException {
        Class<?> currClass = type.getRawClass();
        if (this._factoryConfig.hasAbstractTypeResolvers()) {
            for (AbstractTypeResolver resolver : this._factoryConfig.abstractTypeResolvers()) {
                JavaType concrete = resolver.findTypeMapping(config, type);
                if (concrete != null && concrete.getRawClass() != currClass) {
                    return concrete;
                }
            }
        }
        return null;
    }

    protected JavaType materializeAbstractType(DeserializationConfig config, BasicBeanDescription beanDesc) throws JsonMappingException {
        JavaType abstractType = beanDesc.getType();
        for (AbstractTypeResolver r : this._factoryConfig.abstractTypeResolvers()) {
            JavaType concrete = r.resolveAbstractType(config, abstractType);
            if (concrete != null) {
                return concrete;
            }
        }
        return null;
    }

    public JsonDeserializer<Object> buildBeanDeserializer(DeserializationConfig config, JavaType type, BasicBeanDescription beanDesc, BeanProperty property) throws JsonMappingException {
        ValueInstantiator valueInstantiator = findValueInstantiator(config, beanDesc);
        if (type.isAbstract() && !valueInstantiator.canInstantiate()) {
            return new AbstractDeserializer(type);
        }
        BeanDeserializerBuilder builder = constructBeanDeserializerBuilder(beanDesc);
        builder.setValueInstantiator(valueInstantiator);
        addBeanProps(config, beanDesc, builder);
        addReferenceProperties(config, beanDesc, builder);
        addInjectables(config, beanDesc, builder);
        if (this._factoryConfig.hasDeserializerModifiers()) {
            for (BeanDeserializerModifier mod : this._factoryConfig.deserializerModifiers()) {
                builder = mod.updateBuilder(config, beanDesc, builder);
            }
        }
        JsonDeserializer<?> deserializer = builder.build(property);
        if (this._factoryConfig.hasDeserializerModifiers()) {
            for (BeanDeserializerModifier mod2 : this._factoryConfig.deserializerModifiers()) {
                deserializer = mod2.modifyDeserializer(config, beanDesc, deserializer);
            }
            return deserializer;
        }
        return deserializer;
    }

    public JsonDeserializer<Object> buildThrowableDeserializer(DeserializationConfig config, JavaType type, BasicBeanDescription beanDesc, BeanProperty property) throws JsonMappingException {
        SettableBeanProperty prop;
        BeanDeserializerBuilder builder = constructBeanDeserializerBuilder(beanDesc);
        builder.setValueInstantiator(findValueInstantiator(config, beanDesc));
        addBeanProps(config, beanDesc, builder);
        AnnotatedMethod am = beanDesc.findMethod("initCause", INIT_CAUSE_PARAMS);
        if (am != null && (prop = constructSettableProperty(config, beanDesc, "cause", am)) != null) {
            builder.addOrReplaceProperty(prop, true);
        }
        builder.addIgnorable("localizedMessage");
        builder.addIgnorable("message");
        if (this._factoryConfig.hasDeserializerModifiers()) {
            for (BeanDeserializerModifier mod : this._factoryConfig.deserializerModifiers()) {
                builder = mod.updateBuilder(config, beanDesc, builder);
            }
        }
        JsonDeserializer<?> deserializer = builder.build(property);
        if (deserializer instanceof BeanDeserializer) {
            deserializer = new org.codehaus.jackson.map.deser.std.ThrowableDeserializer((BeanDeserializer) deserializer);
        }
        if (this._factoryConfig.hasDeserializerModifiers()) {
            for (BeanDeserializerModifier mod2 : this._factoryConfig.deserializerModifiers()) {
                deserializer = mod2.modifyDeserializer(config, beanDesc, deserializer);
            }
        }
        return deserializer;
    }

    protected BeanDeserializerBuilder constructBeanDeserializerBuilder(BasicBeanDescription beanDesc) {
        return new BeanDeserializerBuilder(beanDesc);
    }

    protected ValueInstantiator constructDefaultValueInstantiator(DeserializationConfig config, BasicBeanDescription beanDesc) throws JsonMappingException {
        AnnotatedConstructor defaultCtor;
        boolean fixAccess = config.isEnabled(DeserializationConfig.Feature.CAN_OVERRIDE_ACCESS_MODIFIERS);
        CreatorCollector creators = new CreatorCollector(beanDesc, fixAccess);
        AnnotationIntrospector intr = config.getAnnotationIntrospector();
        if (beanDesc.getType().isConcrete() && (defaultCtor = beanDesc.findDefaultConstructor()) != null) {
            if (fixAccess) {
                ClassUtil.checkAndFixAccess(defaultCtor.getAnnotated());
            }
            creators.setDefaultConstructor(defaultCtor);
        }
        VisibilityChecker<?> vchecker = config.getAnnotationIntrospector().findAutoDetectVisibility(beanDesc.getClassInfo(), config.getDefaultVisibilityChecker());
        _addDeserializerFactoryMethods(config, beanDesc, vchecker, intr, creators);
        _addDeserializerConstructors(config, beanDesc, vchecker, intr, creators);
        return creators.constructValueInstantiator(config);
    }

    protected void _addDeserializerConstructors(DeserializationConfig config, BasicBeanDescription beanDesc, VisibilityChecker<?> vchecker, AnnotationIntrospector intr, CreatorCollector creators) throws JsonMappingException {
        for (AnnotatedConstructor ctor : beanDesc.getConstructors()) {
            int argCount = ctor.getParameterCount();
            if (argCount >= 1) {
                boolean isCreator = intr.hasCreatorAnnotation(ctor);
                boolean isVisible = vchecker.isCreatorVisible(ctor);
                if (argCount == 1) {
                    AnnotatedParameter param = ctor.getParameter(0);
                    String name = intr.findPropertyNameForParam(param);
                    Object injectId = intr.findInjectableValueId(param);
                    if (injectId != null || (name != null && name.length() > 0)) {
                        creators.addPropertyCreator(ctor, new CreatorProperty[]{constructCreatorProperty(config, beanDesc, name, 0, param, injectId)});
                    } else {
                        Class<?> type = ctor.getParameterClass(0);
                        if (type == String.class) {
                            if (isCreator || isVisible) {
                                creators.addStringCreator(ctor);
                            }
                        } else if (type == Integer.TYPE || type == Integer.class) {
                            if (isCreator || isVisible) {
                                creators.addIntCreator(ctor);
                            }
                        } else if (type == Long.TYPE || type == Long.class) {
                            if (isCreator || isVisible) {
                                creators.addLongCreator(ctor);
                            }
                        } else if (type == Double.TYPE || type == Double.class) {
                            if (isCreator || isVisible) {
                                creators.addDoubleCreator(ctor);
                            }
                        } else if (isCreator) {
                            creators.addDelegatingCreator(ctor);
                        }
                    }
                } else if (isCreator || isVisible) {
                    boolean annotationFound = false;
                    boolean notAnnotatedParamFound = false;
                    CreatorProperty[] properties = new CreatorProperty[argCount];
                    for (int i = 0; i < argCount; i++) {
                        AnnotatedParameter param2 = ctor.getParameter(i);
                        String name2 = param2 == null ? null : intr.findPropertyNameForParam(param2);
                        Object injectId2 = intr.findInjectableValueId(param2);
                        boolean hasName = name2 != null && name2.length() > 0;
                        boolean hasInject = injectId2 != null;
                        notAnnotatedParamFound |= (hasName || hasInject) ? false : true;
                        annotationFound |= !notAnnotatedParamFound;
                        if (notAnnotatedParamFound && (annotationFound || isCreator)) {
                            throw new IllegalArgumentException("Argument #" + i + " of constructor " + ctor + " has no property name annotation; must have name when multiple-paramater constructor annotated as Creator");
                        }
                        if (!notAnnotatedParamFound) {
                            properties[i] = constructCreatorProperty(config, beanDesc, name2, i, param2, injectId2);
                        }
                    }
                    if (annotationFound) {
                        creators.addPropertyCreator(ctor, properties);
                    }
                }
            }
        }
    }

    /* JADX WARN: Removed duplicated region for block: B:59:0x00d6  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    protected void _addDeserializerFactoryMethods(org.codehaus.jackson.map.DeserializationConfig r16, org.codehaus.jackson.map.introspect.BasicBeanDescription r17, org.codehaus.jackson.map.introspect.VisibilityChecker<?> r18, org.codehaus.jackson.map.AnnotationIntrospector r19, org.codehaus.jackson.map.deser.impl.CreatorCollector r20) throws org.codehaus.jackson.map.JsonMappingException {
        /*
            Method dump skipped, instruction units count: 303
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: org.codehaus.jackson.map.deser.BeanDeserializerFactory._addDeserializerFactoryMethods(org.codehaus.jackson.map.DeserializationConfig, org.codehaus.jackson.map.introspect.BasicBeanDescription, org.codehaus.jackson.map.introspect.VisibilityChecker, org.codehaus.jackson.map.AnnotationIntrospector, org.codehaus.jackson.map.deser.impl.CreatorCollector):void");
    }

    protected CreatorProperty constructCreatorProperty(DeserializationConfig config, BasicBeanDescription beanDesc, String name, int index, AnnotatedParameter param, Object injectableValueId) throws JsonMappingException {
        JavaType t0 = config.getTypeFactory().constructType(param.getParameterType(), beanDesc.bindingsForBeanType());
        BeanProperty.Std property = new BeanProperty.Std(name, t0, beanDesc.getClassAnnotations(), param);
        JavaType type = resolveType(config, beanDesc, t0, param, property);
        if (type != t0) {
            property = property.withType(type);
        }
        JsonDeserializer<Object> deser = findDeserializerFromAnnotation(config, param, property);
        JavaType type2 = modifyTypeByAnnotation(config, param, type, name);
        TypeDeserializer typeDeser = (TypeDeserializer) type2.getTypeHandler();
        if (typeDeser == null) {
            typeDeser = findTypeDeserializer(config, type2, property);
        }
        CreatorProperty prop = new CreatorProperty(name, type2, typeDeser, beanDesc.getClassAnnotations(), param, index, injectableValueId);
        if (deser != null) {
            return prop.withValueDeserializer(deser);
        }
        return prop;
    }

    protected void addBeanProps(DeserializationConfig config, BasicBeanDescription beanDesc, BeanDeserializerBuilder builder) throws JsonMappingException {
        List<BeanPropertyDefinition> props = beanDesc.findProperties();
        AnnotationIntrospector intr = config.getAnnotationIntrospector();
        Boolean B = intr.findIgnoreUnknownProperties(beanDesc.getClassInfo());
        if (B != null) {
            boolean ignoreAny = B.booleanValue();
            builder.setIgnoreUnknownProperties(ignoreAny);
        }
        Set<String> ignored = ArrayBuilders.arrayToSet(intr.findPropertiesToIgnore(beanDesc.getClassInfo()));
        for (String propName : ignored) {
            builder.addIgnorable(propName);
        }
        Collection<String> ignored2 = beanDesc.getIgnoredPropertyNames();
        if (ignored2 != null) {
            for (String propName2 : ignored2) {
                builder.addIgnorable(propName2);
            }
        }
        HashMap<Class<?>, Boolean> ignoredTypes = new HashMap<>();
        for (BeanPropertyDefinition property : props) {
            String name = property.getName();
            if (!ignored.contains(name)) {
                if (property.hasSetter()) {
                    AnnotatedMethod setter = property.getSetter();
                    Class<?> type = setter.getParameterClass(0);
                    if (isIgnorableType(config, beanDesc, type, ignoredTypes)) {
                        builder.addIgnorable(name);
                    } else {
                        SettableBeanProperty prop = constructSettableProperty(config, beanDesc, name, setter);
                        if (prop != null) {
                            builder.addProperty(prop);
                        }
                    }
                } else if (property.hasField()) {
                    AnnotatedField field = property.getField();
                    Class<?> type2 = field.getRawType();
                    if (isIgnorableType(config, beanDesc, type2, ignoredTypes)) {
                        builder.addIgnorable(name);
                    } else {
                        SettableBeanProperty prop2 = constructSettableProperty(config, beanDesc, name, field);
                        if (prop2 != null) {
                            builder.addProperty(prop2);
                        }
                    }
                }
            }
        }
        AnnotatedMethod anySetter = beanDesc.findAnySetter();
        if (anySetter != null) {
            builder.setAnySetter(constructAnySetter(config, beanDesc, anySetter));
        }
        if (config.isEnabled(DeserializationConfig.Feature.USE_GETTERS_AS_SETTERS)) {
            for (BeanPropertyDefinition property2 : props) {
                if (property2.hasGetter()) {
                    String name2 = property2.getName();
                    if (!builder.hasProperty(name2) && !ignored.contains(name2)) {
                        AnnotatedMethod getter = property2.getGetter();
                        Class<?> rt = getter.getRawType();
                        if (Collection.class.isAssignableFrom(rt) || Map.class.isAssignableFrom(rt)) {
                            if (!ignored.contains(name2) && !builder.hasProperty(name2)) {
                                builder.addProperty(constructSetterlessProperty(config, beanDesc, name2, getter));
                            }
                        }
                    }
                }
            }
        }
    }

    protected void addReferenceProperties(DeserializationConfig config, BasicBeanDescription beanDesc, BeanDeserializerBuilder builder) throws JsonMappingException {
        Map<String, AnnotatedMember> refs = beanDesc.findBackReferenceProperties();
        if (refs != null) {
            for (Map.Entry<String, AnnotatedMember> en : refs.entrySet()) {
                String name = en.getKey();
                AnnotatedMember m = en.getValue();
                if (m instanceof AnnotatedMethod) {
                    builder.addBackReferenceProperty(name, constructSettableProperty(config, beanDesc, m.getName(), (AnnotatedMethod) m));
                } else {
                    builder.addBackReferenceProperty(name, constructSettableProperty(config, beanDesc, m.getName(), (AnnotatedField) m));
                }
            }
        }
    }

    protected void addInjectables(DeserializationConfig config, BasicBeanDescription beanDesc, BeanDeserializerBuilder builder) throws JsonMappingException {
        Map<Object, AnnotatedMember> raw = beanDesc.findInjectables();
        if (raw != null) {
            boolean fixAccess = config.isEnabled(DeserializationConfig.Feature.CAN_OVERRIDE_ACCESS_MODIFIERS);
            for (Map.Entry<Object, AnnotatedMember> entry : raw.entrySet()) {
                AnnotatedMember m = entry.getValue();
                if (fixAccess) {
                    m.fixAccess();
                }
                builder.addInjectable(m.getName(), beanDesc.resolveType(m.getGenericType()), beanDesc.getClassAnnotations(), m, entry.getKey());
            }
        }
    }

    protected SettableAnyProperty constructAnySetter(DeserializationConfig config, BasicBeanDescription beanDesc, AnnotatedMethod setter) throws JsonMappingException {
        if (config.isEnabled(DeserializationConfig.Feature.CAN_OVERRIDE_ACCESS_MODIFIERS)) {
            setter.fixAccess();
        }
        JavaType type = beanDesc.bindingsForBeanType().resolveType(setter.getParameterType(1));
        BeanProperty.Std property = new BeanProperty.Std(setter.getName(), type, beanDesc.getClassAnnotations(), setter);
        JavaType type2 = resolveType(config, beanDesc, type, setter, property);
        JsonDeserializer<Object> deser = findDeserializerFromAnnotation(config, setter, property);
        if (deser != null) {
            return new SettableAnyProperty(property, setter, type2, deser);
        }
        return new SettableAnyProperty(property, setter, modifyTypeByAnnotation(config, setter, type2, property.getName()), (JsonDeserializer<Object>) null);
    }

    protected SettableBeanProperty constructSettableProperty(DeserializationConfig config, BasicBeanDescription beanDesc, String name, AnnotatedMethod setter) throws JsonMappingException {
        if (config.isEnabled(DeserializationConfig.Feature.CAN_OVERRIDE_ACCESS_MODIFIERS)) {
            setter.fixAccess();
        }
        JavaType t0 = beanDesc.bindingsForBeanType().resolveType(setter.getParameterType(0));
        BeanProperty.Std property = new BeanProperty.Std(name, t0, beanDesc.getClassAnnotations(), setter);
        JavaType type = resolveType(config, beanDesc, t0, setter, property);
        if (type != t0) {
            property = property.withType(type);
        }
        JsonDeserializer<Object> propDeser = findDeserializerFromAnnotation(config, setter, property);
        JavaType type2 = modifyTypeByAnnotation(config, setter, type, name);
        TypeDeserializer typeDeser = (TypeDeserializer) type2.getTypeHandler();
        SettableBeanProperty prop = new SettableBeanProperty.MethodProperty(name, type2, typeDeser, beanDesc.getClassAnnotations(), setter);
        if (propDeser != null) {
            prop = prop.withValueDeserializer(propDeser);
        }
        AnnotationIntrospector.ReferenceProperty ref = config.getAnnotationIntrospector().findReferenceType(setter);
        if (ref != null && ref.isManagedReference()) {
            prop.setManagedReferenceName(ref.getName());
        }
        return prop;
    }

    protected SettableBeanProperty constructSettableProperty(DeserializationConfig config, BasicBeanDescription beanDesc, String name, AnnotatedField field) throws JsonMappingException {
        if (config.isEnabled(DeserializationConfig.Feature.CAN_OVERRIDE_ACCESS_MODIFIERS)) {
            field.fixAccess();
        }
        JavaType t0 = beanDesc.bindingsForBeanType().resolveType(field.getGenericType());
        BeanProperty.Std property = new BeanProperty.Std(name, t0, beanDesc.getClassAnnotations(), field);
        JavaType type = resolveType(config, beanDesc, t0, field, property);
        if (type != t0) {
            property = property.withType(type);
        }
        JsonDeserializer<Object> propDeser = findDeserializerFromAnnotation(config, field, property);
        JavaType type2 = modifyTypeByAnnotation(config, field, type, name);
        TypeDeserializer typeDeser = (TypeDeserializer) type2.getTypeHandler();
        SettableBeanProperty prop = new SettableBeanProperty.FieldProperty(name, type2, typeDeser, beanDesc.getClassAnnotations(), field);
        if (propDeser != null) {
            prop = prop.withValueDeserializer(propDeser);
        }
        AnnotationIntrospector.ReferenceProperty ref = config.getAnnotationIntrospector().findReferenceType(field);
        if (ref != null && ref.isManagedReference()) {
            prop.setManagedReferenceName(ref.getName());
        }
        return prop;
    }

    protected SettableBeanProperty constructSetterlessProperty(DeserializationConfig config, BasicBeanDescription beanDesc, String name, AnnotatedMethod getter) throws JsonMappingException {
        if (config.isEnabled(DeserializationConfig.Feature.CAN_OVERRIDE_ACCESS_MODIFIERS)) {
            getter.fixAccess();
        }
        JavaType type = getter.getType(beanDesc.bindingsForBeanType());
        BeanProperty.Std property = new BeanProperty.Std(name, type, beanDesc.getClassAnnotations(), getter);
        JsonDeserializer<Object> propDeser = findDeserializerFromAnnotation(config, getter, property);
        JavaType type2 = modifyTypeByAnnotation(config, getter, type, name);
        TypeDeserializer typeDeser = (TypeDeserializer) type2.getTypeHandler();
        SettableBeanProperty prop = new SettableBeanProperty.SetterlessProperty(name, type2, typeDeser, beanDesc.getClassAnnotations(), getter);
        if (propDeser != null) {
            return prop.withValueDeserializer(propDeser);
        }
        return prop;
    }

    protected boolean isPotentialBeanType(Class<?> type) {
        String typeStr = ClassUtil.canBeABeanType(type);
        if (typeStr != null) {
            throw new IllegalArgumentException("Can not deserialize Class " + type.getName() + " (of type " + typeStr + ") as a Bean");
        }
        if (ClassUtil.isProxyType(type)) {
            throw new IllegalArgumentException("Can not deserialize Proxy class " + type.getName() + " as a Bean");
        }
        String typeStr2 = ClassUtil.isLocalType(type, true);
        if (typeStr2 != null) {
            throw new IllegalArgumentException("Can not deserialize Class " + type.getName() + " (of type " + typeStr2 + ") as a Bean");
        }
        return true;
    }

    protected boolean isIgnorableType(DeserializationConfig config, BasicBeanDescription beanDesc, Class<?> type, Map<Class<?>, Boolean> ignoredTypes) {
        Boolean status = ignoredTypes.get(type);
        if (status == null) {
            BasicBeanDescription desc = (BasicBeanDescription) config.introspectClassAnnotations(type);
            status = config.getAnnotationIntrospector().isIgnorableType(desc.getClassInfo());
            if (status == null) {
                status = Boolean.FALSE;
            }
        }
        return status.booleanValue();
    }
}
