package org.codehaus.jackson.map.type;

import java.io.IOException;
import org.codehaus.jackson.JsonGenerator;
import org.codehaus.jackson.map.JsonSerializableWithType;
import org.codehaus.jackson.map.SerializerProvider;
import org.codehaus.jackson.map.TypeSerializer;
import org.codehaus.jackson.type.JavaType;

/* JADX INFO: loaded from: classes.dex */
public abstract class TypeBase extends JavaType implements JsonSerializableWithType {
    volatile String _canonicalName;

    protected abstract String buildCanonicalName();

    @Override // org.codehaus.jackson.type.JavaType
    public abstract StringBuilder getErasedSignature(StringBuilder sb);

    @Override // org.codehaus.jackson.type.JavaType
    public abstract StringBuilder getGenericSignature(StringBuilder sb);

    @Deprecated
    protected TypeBase(Class<?> raw, int hash) {
        super(raw, hash);
    }

    protected TypeBase(Class<?> raw, int hash, Object valueHandler, Object typeHandler) {
        super(raw, hash);
        this._valueHandler = valueHandler;
        this._typeHandler = typeHandler;
    }

    @Override // org.codehaus.jackson.type.JavaType
    public String toCanonical() {
        String str = this._canonicalName;
        if (str == null) {
            return buildCanonicalName();
        }
        return str;
    }

    @Override // org.codehaus.jackson.type.JavaType
    public <T> T getValueHandler() {
        return (T) this._valueHandler;
    }

    @Override // org.codehaus.jackson.type.JavaType
    public <T> T getTypeHandler() {
        return (T) this._typeHandler;
    }

    @Override // org.codehaus.jackson.map.JsonSerializableWithType
    public void serializeWithType(JsonGenerator jgen, SerializerProvider provider, TypeSerializer typeSer) throws IOException {
        typeSer.writeTypePrefixForScalar(this, jgen);
        serialize(jgen, provider);
        typeSer.writeTypeSuffixForScalar(this, jgen);
    }

    @Override // org.codehaus.jackson.map.JsonSerializable
    public void serialize(JsonGenerator jgen, SerializerProvider provider) throws IOException {
        jgen.writeString(toCanonical());
    }

    protected static StringBuilder _classSignature(Class<?> cls, StringBuilder sb, boolean trailingSemicolon) {
        if (cls.isPrimitive()) {
            if (cls == Boolean.TYPE) {
                sb.append('Z');
            } else if (cls == Byte.TYPE) {
                sb.append('B');
            } else if (cls == Short.TYPE) {
                sb.append('S');
            } else if (cls == Character.TYPE) {
                sb.append('C');
            } else if (cls == Integer.TYPE) {
                sb.append('I');
            } else if (cls == Long.TYPE) {
                sb.append('J');
            } else if (cls == Float.TYPE) {
                sb.append('F');
            } else if (cls == Double.TYPE) {
                sb.append('D');
            } else if (cls == Void.TYPE) {
                sb.append('V');
            } else {
                throw new IllegalStateException("Unrecognized primitive type: " + cls.getName());
            }
        } else {
            sb.append('L');
            String name = cls.getName();
            int len = name.length();
            for (int i = 0; i < len; i++) {
                char c = name.charAt(i);
                if (c == '.') {
                    c = '/';
                }
                sb.append(c);
            }
            if (trailingSemicolon) {
                sb.append(';');
            }
        }
        return sb;
    }
}
