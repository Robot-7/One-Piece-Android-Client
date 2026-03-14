package org.codehaus.jackson.map.deser.std;

import java.io.IOException;
import java.util.EnumMap;
import org.codehaus.jackson.JsonParser;
import org.codehaus.jackson.JsonToken;
import org.codehaus.jackson.map.DeserializationContext;
import org.codehaus.jackson.map.JsonDeserializer;
import org.codehaus.jackson.map.TypeDeserializer;
import org.codehaus.jackson.map.util.EnumResolver;

/* JADX INFO: loaded from: classes.dex */
public class EnumMapDeserializer extends StdDeserializer<EnumMap<?, ?>> {
    protected final EnumResolver<?> _enumResolver;
    protected final JsonDeserializer<Object> _valueDeserializer;

    public EnumMapDeserializer(EnumResolver<?> enumRes, JsonDeserializer<Object> valueDes) {
        super((Class<?>) EnumMap.class);
        this._enumResolver = enumRes;
        this._valueDeserializer = valueDes;
    }

    @Override // org.codehaus.jackson.map.JsonDeserializer
    public EnumMap<?, ?> deserialize(JsonParser jp, DeserializationContext ctxt) throws IOException {
        if (jp.getCurrentToken() != JsonToken.START_OBJECT) {
            throw ctxt.mappingException(EnumMap.class);
        }
        EnumMap<?, ?> enumMapConstructMap = constructMap();
        while (jp.nextToken() != JsonToken.END_OBJECT) {
            String fieldName = jp.getCurrentName();
            Enum<?> key = this._enumResolver.findEnum(fieldName);
            if (key == null) {
                throw ctxt.weirdStringException(this._enumResolver.getEnumClass(), "value not one of declared Enum instance names");
            }
            JsonToken t = jp.nextToken();
            Object value = t == JsonToken.VALUE_NULL ? null : this._valueDeserializer.deserialize(jp, ctxt);
            enumMapConstructMap.put(key, value);
        }
        return enumMapConstructMap;
    }

    @Override // org.codehaus.jackson.map.deser.std.StdDeserializer, org.codehaus.jackson.map.JsonDeserializer
    public Object deserializeWithType(JsonParser jp, DeserializationContext ctxt, TypeDeserializer typeDeserializer) throws IOException {
        return typeDeserializer.deserializeTypedFromObject(jp, ctxt);
    }

    private EnumMap<?, ?> constructMap() {
        return new EnumMap<>(this._enumResolver.getEnumClass());
    }
}
