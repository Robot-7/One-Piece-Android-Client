package org.codehaus.jackson.map.deser.std;

import java.io.IOException;
import org.codehaus.jackson.JsonParser;
import org.codehaus.jackson.map.DeserializationContext;
import org.codehaus.jackson.map.annotate.JacksonStdImpl;
import org.codehaus.jackson.util.TokenBuffer;

/* JADX INFO: loaded from: classes.dex */
@JacksonStdImpl
public class TokenBufferDeserializer extends StdScalarDeserializer<TokenBuffer> {
    public TokenBufferDeserializer() {
        super((Class<?>) TokenBuffer.class);
    }

    @Override // org.codehaus.jackson.map.JsonDeserializer
    public TokenBuffer deserialize(JsonParser jp, DeserializationContext ctxt) throws IOException {
        TokenBuffer tb = new TokenBuffer(jp.getCodec());
        tb.copyCurrentStructure(jp);
        return tb;
    }
}
