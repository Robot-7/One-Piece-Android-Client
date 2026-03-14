package org.codehaus.jackson.map.deser.std;

import java.io.IOException;
import java.util.concurrent.atomic.AtomicReference;
import org.codehaus.jackson.JsonParser;
import org.codehaus.jackson.map.BeanProperty;
import org.codehaus.jackson.map.DeserializationConfig;
import org.codehaus.jackson.map.DeserializationContext;
import org.codehaus.jackson.map.DeserializerProvider;
import org.codehaus.jackson.map.JsonDeserializer;
import org.codehaus.jackson.map.JsonMappingException;
import org.codehaus.jackson.map.ResolvableDeserializer;
import org.codehaus.jackson.type.JavaType;

/* JADX INFO: loaded from: classes.dex */
public class AtomicReferenceDeserializer extends StdScalarDeserializer<AtomicReference<?>> implements ResolvableDeserializer {
    protected final BeanProperty _property;
    protected final JavaType _referencedType;
    protected JsonDeserializer<?> _valueDeserializer;

    public AtomicReferenceDeserializer(JavaType referencedType, BeanProperty property) {
        super((Class<?>) AtomicReference.class);
        this._referencedType = referencedType;
        this._property = property;
    }

    @Override // org.codehaus.jackson.map.JsonDeserializer
    public AtomicReference<?> deserialize(JsonParser jp, DeserializationContext ctxt) throws IOException {
        return new AtomicReference<>(this._valueDeserializer.deserialize(jp, ctxt));
    }

    @Override // org.codehaus.jackson.map.ResolvableDeserializer
    public void resolve(DeserializationConfig config, DeserializerProvider provider) throws JsonMappingException {
        this._valueDeserializer = provider.findValueDeserializer(config, this._referencedType, this._property);
    }
}
