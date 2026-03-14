package org.codehaus.jackson.map.ser.impl;

import org.codehaus.jackson.JsonGenerator;
import org.codehaus.jackson.map.JsonMappingException;
import org.codehaus.jackson.map.JsonSerializer;
import org.codehaus.jackson.map.SerializerProvider;
import org.codehaus.jackson.map.ser.BeanPropertyWriter;
import org.codehaus.jackson.type.JavaType;

/* JADX INFO: loaded from: classes.dex */
public class UnwrappingBeanPropertyWriter extends BeanPropertyWriter {
    public UnwrappingBeanPropertyWriter(BeanPropertyWriter base) {
        super(base);
    }

    public UnwrappingBeanPropertyWriter(BeanPropertyWriter base, JsonSerializer<Object> ser) {
        super(base, ser);
    }

    @Override // org.codehaus.jackson.map.ser.BeanPropertyWriter
    public BeanPropertyWriter withSerializer(JsonSerializer<Object> ser) {
        if (getClass() != UnwrappingBeanPropertyWriter.class) {
            throw new IllegalStateException("UnwrappingBeanPropertyWriter sub-class does not override 'withSerializer()'; needs to!");
        }
        if (!ser.isUnwrappingSerializer()) {
            ser = ser.unwrappingSerializer();
        }
        return new UnwrappingBeanPropertyWriter(this, ser);
    }

    @Override // org.codehaus.jackson.map.ser.BeanPropertyWriter
    public void serializeAsField(Object bean, JsonGenerator jgen, SerializerProvider prov) throws Exception {
        Class<?> cls;
        PropertySerializerMap map;
        Object value = get(bean);
        if (value != null) {
            if (value == bean) {
                _reportSelfReference(bean);
            }
            if (this._suppressableValue == null || !this._suppressableValue.equals(value)) {
                JsonSerializer<Object> ser = this._serializer;
                if (ser == null && (ser = (map = this._dynamicSerializers).serializerFor((cls = value.getClass()))) == null) {
                    ser = _findAndAddDynamic(map, cls, prov);
                }
                if (!ser.isUnwrappingSerializer()) {
                    jgen.writeFieldName(this._name);
                }
                if (this._typeSerializer == null) {
                    ser.serialize(value, jgen, prov);
                } else {
                    ser.serializeWithType(value, jgen, prov, this._typeSerializer);
                }
            }
        }
    }

    @Override // org.codehaus.jackson.map.ser.BeanPropertyWriter
    protected JsonSerializer<Object> _findAndAddDynamic(PropertySerializerMap map, Class<?> type, SerializerProvider provider) throws JsonMappingException {
        JsonSerializer<Object> serializer;
        if (this._nonTrivialBaseType != null) {
            JavaType subtype = provider.constructSpecializedType(this._nonTrivialBaseType, type);
            serializer = provider.findValueSerializer(subtype, this);
        } else {
            serializer = provider.findValueSerializer(type, this);
        }
        if (!serializer.isUnwrappingSerializer()) {
            serializer = serializer.unwrappingSerializer();
        }
        this._dynamicSerializers = this._dynamicSerializers.newWith(type, serializer);
        return serializer;
    }
}
