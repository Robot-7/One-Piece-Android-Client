package org.codehaus.jackson.node;

import com.tencent.stat.common.StatConstants;
import java.io.IOException;
import org.codehaus.jackson.Base64Variant;
import org.codehaus.jackson.Base64Variants;
import org.codehaus.jackson.JsonGenerator;
import org.codehaus.jackson.JsonLocation;
import org.codehaus.jackson.JsonParseException;
import org.codehaus.jackson.JsonToken;
import org.codehaus.jackson.io.NumberInput;
import org.codehaus.jackson.map.SerializerProvider;
import org.codehaus.jackson.util.CharTypes;

/* JADX INFO: loaded from: classes.dex */
public final class TextNode extends ValueNode {
    static final TextNode EMPTY_STRING_NODE = new TextNode(StatConstants.MTA_COOPERATION_TAG);
    static final int INT_SPACE = 32;
    final String _value;

    public TextNode(String v) {
        this._value = v;
    }

    public static TextNode valueOf(String v) {
        if (v == null) {
            return null;
        }
        if (v.length() == 0) {
            return EMPTY_STRING_NODE;
        }
        return new TextNode(v);
    }

    @Override // org.codehaus.jackson.node.ValueNode, org.codehaus.jackson.node.BaseJsonNode, org.codehaus.jackson.JsonNode
    public JsonToken asToken() {
        return JsonToken.VALUE_STRING;
    }

    @Override // org.codehaus.jackson.JsonNode
    public boolean isTextual() {
        return true;
    }

    @Override // org.codehaus.jackson.JsonNode
    public String getTextValue() {
        return this._value;
    }

    /* JADX WARN: Code restructure failed: missing block: B:11:0x0024, code lost:
    
        r0 = r13.decodeBase64Char(r2);
     */
    /* JADX WARN: Code restructure failed: missing block: B:12:0x0028, code lost:
    
        if (r0 >= 0) goto L14;
     */
    /* JADX WARN: Code restructure failed: missing block: B:13:0x002a, code lost:
    
        _reportInvalidBase64(r13, r2, 0);
     */
    /* JADX WARN: Code restructure failed: missing block: B:15:0x002f, code lost:
    
        if (r6 < r4) goto L17;
     */
    /* JADX WARN: Code restructure failed: missing block: B:16:0x0031, code lost:
    
        _reportBase64EOF();
     */
    /* JADX WARN: Code restructure failed: missing block: B:17:0x0034, code lost:
    
        r5 = r6 + 1;
        r2 = r7.charAt(r6);
        r0 = r13.decodeBase64Char(r2);
     */
    /* JADX WARN: Code restructure failed: missing block: B:18:0x003e, code lost:
    
        if (r0 >= 0) goto L20;
     */
    /* JADX WARN: Code restructure failed: missing block: B:19:0x0040, code lost:
    
        _reportInvalidBase64(r13, r2, 1);
     */
    /* JADX WARN: Code restructure failed: missing block: B:20:0x0044, code lost:
    
        r3 = (r0 << 6) | r0;
     */
    /* JADX WARN: Code restructure failed: missing block: B:21:0x0048, code lost:
    
        if (r5 < r4) goto L26;
     */
    /* JADX WARN: Code restructure failed: missing block: B:23:0x004e, code lost:
    
        if (r13.usesPadding() != false) goto L25;
     */
    /* JADX WARN: Code restructure failed: missing block: B:24:0x0050, code lost:
    
        r1.append(r3 >> 4);
     */
    /* JADX WARN: Code restructure failed: missing block: B:25:0x0056, code lost:
    
        _reportBase64EOF();
     */
    /* JADX WARN: Code restructure failed: missing block: B:26:0x0059, code lost:
    
        r6 = r5 + 1;
        r2 = r7.charAt(r5);
        r0 = r13.decodeBase64Char(r2);
     */
    /* JADX WARN: Code restructure failed: missing block: B:27:0x0063, code lost:
    
        if (r0 >= 0) goto L52;
     */
    /* JADX WARN: Code restructure failed: missing block: B:28:0x0065, code lost:
    
        if (r0 == (-2)) goto L30;
     */
    /* JADX WARN: Code restructure failed: missing block: B:29:0x0067, code lost:
    
        _reportInvalidBase64(r13, r2, 2);
     */
    /* JADX WARN: Code restructure failed: missing block: B:30:0x006b, code lost:
    
        if (r6 < r4) goto L32;
     */
    /* JADX WARN: Code restructure failed: missing block: B:31:0x006d, code lost:
    
        _reportBase64EOF();
     */
    /* JADX WARN: Code restructure failed: missing block: B:32:0x0070, code lost:
    
        r5 = r6 + 1;
        r2 = r7.charAt(r6);
     */
    /* JADX WARN: Code restructure failed: missing block: B:33:0x007a, code lost:
    
        if (r13.usesPaddingChar(r2) != false) goto L35;
     */
    /* JADX WARN: Code restructure failed: missing block: B:34:0x007c, code lost:
    
        _reportInvalidBase64(r13, r2, 3, "expected padding character '" + r13.getPaddingChar() + "'");
     */
    /* JADX WARN: Code restructure failed: missing block: B:35:0x009c, code lost:
    
        r1.append(r3 >> 4);
     */
    /* JADX WARN: Code restructure failed: missing block: B:36:0x00a3, code lost:
    
        r3 = (r3 << 6) | r0;
     */
    /* JADX WARN: Code restructure failed: missing block: B:37:0x00a7, code lost:
    
        if (r6 < r4) goto L42;
     */
    /* JADX WARN: Code restructure failed: missing block: B:39:0x00ad, code lost:
    
        if (r13.usesPadding() != false) goto L41;
     */
    /* JADX WARN: Code restructure failed: missing block: B:40:0x00af, code lost:
    
        r1.appendTwoBytes(r3 >> 2);
     */
    /* JADX WARN: Code restructure failed: missing block: B:41:0x00b7, code lost:
    
        _reportBase64EOF();
     */
    /* JADX WARN: Code restructure failed: missing block: B:42:0x00ba, code lost:
    
        r5 = r6 + 1;
        r2 = r7.charAt(r6);
        r0 = r13.decodeBase64Char(r2);
     */
    /* JADX WARN: Code restructure failed: missing block: B:43:0x00c4, code lost:
    
        if (r0 >= 0) goto L55;
     */
    /* JADX WARN: Code restructure failed: missing block: B:44:0x00c6, code lost:
    
        if (r0 == (-2)) goto L46;
     */
    /* JADX WARN: Code restructure failed: missing block: B:45:0x00c8, code lost:
    
        _reportInvalidBase64(r13, r2, 3);
     */
    /* JADX WARN: Code restructure failed: missing block: B:46:0x00cb, code lost:
    
        r1.appendTwoBytes(r3 >> 2);
     */
    /* JADX WARN: Code restructure failed: missing block: B:47:0x00d2, code lost:
    
        r1.appendThreeBytes((r3 << 6) | r0);
     */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public byte[] getBinaryValue(org.codehaus.jackson.Base64Variant r13) throws java.io.IOException {
        /*
            Method dump skipped, instruction units count: 222
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: org.codehaus.jackson.node.TextNode.getBinaryValue(org.codehaus.jackson.Base64Variant):byte[]");
    }

    @Override // org.codehaus.jackson.JsonNode
    public byte[] getBinaryValue() throws IOException {
        return getBinaryValue(Base64Variants.getDefaultVariant());
    }

    @Override // org.codehaus.jackson.JsonNode
    public String asText() {
        return this._value;
    }

    @Override // org.codehaus.jackson.JsonNode
    public boolean asBoolean(boolean defaultValue) {
        if (this._value != null && "true".equals(this._value.trim())) {
            return true;
        }
        return defaultValue;
    }

    @Override // org.codehaus.jackson.JsonNode
    public int asInt(int defaultValue) {
        return NumberInput.parseAsInt(this._value, defaultValue);
    }

    @Override // org.codehaus.jackson.JsonNode
    public long asLong(long defaultValue) {
        return NumberInput.parseAsLong(this._value, defaultValue);
    }

    @Override // org.codehaus.jackson.JsonNode
    public double asDouble(double defaultValue) {
        return NumberInput.parseAsDouble(this._value, defaultValue);
    }

    @Override // org.codehaus.jackson.node.BaseJsonNode, org.codehaus.jackson.map.JsonSerializable
    public final void serialize(JsonGenerator jg, SerializerProvider provider) throws IOException {
        if (this._value == null) {
            jg.writeNull();
        } else {
            jg.writeString(this._value);
        }
    }

    @Override // org.codehaus.jackson.JsonNode
    public boolean equals(Object o) {
        if (o == this) {
            return true;
        }
        if (o == null || o.getClass() != getClass()) {
            return false;
        }
        return ((TextNode) o)._value.equals(this._value);
    }

    public int hashCode() {
        return this._value.hashCode();
    }

    @Override // org.codehaus.jackson.node.ValueNode, org.codehaus.jackson.JsonNode
    public String toString() {
        int len = this._value.length();
        StringBuilder sb = new StringBuilder(len + 2 + (len >> 4));
        appendQuoted(sb, this._value);
        return sb.toString();
    }

    protected static void appendQuoted(StringBuilder sb, String content) {
        sb.append('\"');
        CharTypes.appendQuoted(sb, content);
        sb.append('\"');
    }

    protected void _reportInvalidBase64(Base64Variant b64variant, char ch, int bindex) throws JsonParseException {
        _reportInvalidBase64(b64variant, ch, bindex, null);
    }

    protected void _reportInvalidBase64(Base64Variant b64variant, char ch, int bindex, String msg) throws JsonParseException {
        String base;
        if (ch <= ' ') {
            base = "Illegal white space character (code 0x" + Integer.toHexString(ch) + ") as character #" + (bindex + 1) + " of 4-char base64 unit: can only used between units";
        } else if (b64variant.usesPaddingChar(ch)) {
            base = "Unexpected padding character ('" + b64variant.getPaddingChar() + "') as character #" + (bindex + 1) + " of 4-char base64 unit: padding only legal as 3rd or 4th character";
        } else if (!Character.isDefined(ch) || Character.isISOControl(ch)) {
            base = "Illegal character (code 0x" + Integer.toHexString(ch) + ") in base64 content";
        } else {
            base = "Illegal character '" + ch + "' (code 0x" + Integer.toHexString(ch) + ") in base64 content";
        }
        if (msg != null) {
            base = base + ": " + msg;
        }
        throw new JsonParseException(base, JsonLocation.NA);
    }

    protected void _reportBase64EOF() throws JsonParseException {
        throw new JsonParseException("Unexpected end-of-String when base64 content", JsonLocation.NA);
    }
}
