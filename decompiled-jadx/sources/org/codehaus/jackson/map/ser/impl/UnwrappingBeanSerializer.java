package org.codehaus.jackson.map.ser.impl;

import java.io.IOException;
import org.codehaus.jackson.JsonGenerator;
import org.codehaus.jackson.map.JsonSerializer;
import org.codehaus.jackson.map.SerializerProvider;
import org.codehaus.jackson.map.ser.std.BeanSerializerBase;

/* JADX INFO: loaded from: classes.dex */
public class UnwrappingBeanSerializer extends BeanSerializerBase {
    public UnwrappingBeanSerializer(BeanSerializerBase src) {
        super(src);
    }

    @Override // org.codehaus.jackson.map.JsonSerializer
    public JsonSerializer<Object> unwrappingSerializer() {
        return this;
    }

    @Override // org.codehaus.jackson.map.JsonSerializer
    public boolean isUnwrappingSerializer() {
        return true;
    }

    @Override // org.codehaus.jackson.map.ser.std.BeanSerializerBase, org.codehaus.jackson.map.ser.std.SerializerBase, org.codehaus.jackson.map.JsonSerializer
    public final void serialize(Object bean, JsonGenerator jgen, SerializerProvider provider) throws IOException {
        if (this._propertyFilterId != null) {
            serializeFieldsFiltered(bean, jgen, provider);
        } else {
            serializeFields(bean, jgen, provider);
        }
    }

    public String toString() {
        return "UnwrappingBeanSerializer for " + handledType().getName();
    }
}
