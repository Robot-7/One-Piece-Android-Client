package org.codehaus.jackson.map.deser;

import java.io.IOException;
import org.codehaus.jackson.JsonNode;
import org.codehaus.jackson.JsonParser;
import org.codehaus.jackson.map.DeserializationContext;
import org.codehaus.jackson.node.ArrayNode;
import org.codehaus.jackson.node.ObjectNode;

/* JADX INFO: loaded from: classes.dex */
@Deprecated
public class JsonNodeDeserializer extends org.codehaus.jackson.map.deser.std.JsonNodeDeserializer {

    @Deprecated
    public static final JsonNodeDeserializer instance = new JsonNodeDeserializer();

    @Deprecated
    protected final ObjectNode deserializeObject(JsonParser jp, DeserializationContext ctxt) throws IOException {
        return deserializeObject(jp, ctxt, ctxt.getNodeFactory());
    }

    @Deprecated
    protected final ArrayNode deserializeArray(JsonParser jp, DeserializationContext ctxt) throws IOException {
        return deserializeArray(jp, ctxt, ctxt.getNodeFactory());
    }

    @Deprecated
    protected final JsonNode deserializeAny(JsonParser jp, DeserializationContext ctxt) throws IOException {
        return deserializeAny(jp, ctxt, ctxt.getNodeFactory());
    }
}
