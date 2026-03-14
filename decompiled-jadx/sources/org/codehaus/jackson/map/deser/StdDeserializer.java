package org.codehaus.jackson.map.deser;

import java.io.IOException;
import org.codehaus.jackson.Base64Variants;
import org.codehaus.jackson.JsonParser;
import org.codehaus.jackson.JsonToken;
import org.codehaus.jackson.map.DeserializationContext;
import org.codehaus.jackson.map.TypeDeserializer;
import org.codehaus.jackson.map.annotate.JacksonStdImpl;
import org.codehaus.jackson.type.JavaType;

/* JADX INFO: loaded from: classes.dex */
@Deprecated
public abstract class StdDeserializer<T> extends org.codehaus.jackson.map.deser.std.StdDeserializer<T> {
    protected StdDeserializer(Class<?> vc) {
        super(vc);
    }

    protected StdDeserializer(JavaType valueType) {
        super(valueType);
    }

    @JacksonStdImpl
    @Deprecated
    public class ClassDeserializer extends org.codehaus.jackson.map.deser.std.ClassDeserializer {
        public ClassDeserializer() {
        }
    }

    @JacksonStdImpl
    @Deprecated
    public class CalendarDeserializer extends org.codehaus.jackson.map.deser.std.CalendarDeserializer {
        public CalendarDeserializer() {
        }
    }

    @JacksonStdImpl
    @Deprecated
    public static final class StringDeserializer extends org.codehaus.jackson.map.deser.std.StdScalarDeserializer<String> {
        public StringDeserializer() {
            super((Class<?>) String.class);
        }

        @Override // org.codehaus.jackson.map.JsonDeserializer
        public String deserialize(JsonParser jp, DeserializationContext ctxt) throws IOException {
            JsonToken curr = jp.getCurrentToken();
            if (curr == JsonToken.VALUE_STRING) {
                return jp.getText();
            }
            if (curr == JsonToken.VALUE_EMBEDDED_OBJECT) {
                Object ob = jp.getEmbeddedObject();
                if (ob == null) {
                    return null;
                }
                if (ob instanceof byte[]) {
                    return Base64Variants.getDefaultVariant().encode((byte[]) ob, false);
                }
                return ob.toString();
            }
            if (curr.isScalarValue()) {
                return jp.getText();
            }
            throw ctxt.mappingException(this._valueClass, curr);
        }

        @Override // org.codehaus.jackson.map.deser.std.StdScalarDeserializer, org.codehaus.jackson.map.deser.std.StdDeserializer, org.codehaus.jackson.map.JsonDeserializer
        public String deserializeWithType(JsonParser jp, DeserializationContext ctxt, TypeDeserializer typeDeserializer) throws IOException {
            return deserialize(jp, ctxt);
        }
    }
}
