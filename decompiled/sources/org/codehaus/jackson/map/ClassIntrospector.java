package org.codehaus.jackson.map;

import org.codehaus.jackson.map.BeanDescription;
import org.codehaus.jackson.type.JavaType;

/* JADX INFO: loaded from: classes.dex */
public abstract class ClassIntrospector<T extends BeanDescription> {

    public interface MixInResolver {
        Class<?> findMixInClassFor(Class<?> cls);
    }

    public abstract T forClassAnnotations(MapperConfig<?> mapperConfig, JavaType javaType, MixInResolver mixInResolver);

    public abstract T forCreation(DeserializationConfig deserializationConfig, JavaType javaType, MixInResolver mixInResolver);

    public abstract T forDeserialization(DeserializationConfig deserializationConfig, JavaType javaType, MixInResolver mixInResolver);

    public abstract T forDirectClassAnnotations(MapperConfig<?> mapperConfig, JavaType javaType, MixInResolver mixInResolver);

    public abstract T forSerialization(SerializationConfig serializationConfig, JavaType javaType, MixInResolver mixInResolver);

    protected ClassIntrospector() {
    }

    @Deprecated
    public T forClassAnnotations(MapperConfig<?> mapperConfig, Class<?> cls, MixInResolver mixInResolver) {
        return (T) forClassAnnotations(mapperConfig, mapperConfig.constructType(cls), mixInResolver);
    }

    @Deprecated
    public T forDirectClassAnnotations(MapperConfig<?> mapperConfig, Class<?> cls, MixInResolver mixInResolver) {
        return (T) forDirectClassAnnotations(mapperConfig, mapperConfig.constructType(cls), mixInResolver);
    }
}
