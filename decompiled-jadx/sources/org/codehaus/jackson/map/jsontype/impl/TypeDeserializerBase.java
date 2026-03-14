package org.codehaus.jackson.map.jsontype.impl;

import java.io.IOException;
import java.util.HashMap;
import org.codehaus.jackson.annotate.JsonTypeInfo;
import org.codehaus.jackson.map.BeanProperty;
import org.codehaus.jackson.map.DeserializationContext;
import org.codehaus.jackson.map.JsonDeserializer;
import org.codehaus.jackson.map.TypeDeserializer;
import org.codehaus.jackson.map.jsontype.TypeIdResolver;
import org.codehaus.jackson.type.JavaType;

/* JADX INFO: loaded from: classes.dex */
public abstract class TypeDeserializerBase extends TypeDeserializer {
    protected final JavaType _baseType;
    protected final JavaType _defaultImpl;
    protected JsonDeserializer<Object> _defaultImplDeserializer;
    protected final HashMap<String, JsonDeserializer<Object>> _deserializers;
    protected final TypeIdResolver _idResolver;
    protected final BeanProperty _property;

    @Override // org.codehaus.jackson.map.TypeDeserializer
    public abstract JsonTypeInfo.As getTypeInclusion();

    @Deprecated
    protected TypeDeserializerBase(JavaType baseType, TypeIdResolver idRes, BeanProperty property) {
        this(baseType, idRes, property, null);
    }

    protected TypeDeserializerBase(JavaType baseType, TypeIdResolver idRes, BeanProperty property, Class<?> defaultImpl) {
        this._baseType = baseType;
        this._idResolver = idRes;
        this._property = property;
        this._deserializers = new HashMap<>();
        if (defaultImpl == null) {
            this._defaultImpl = null;
        } else {
            this._defaultImpl = baseType.forcedNarrowBy(defaultImpl);
        }
    }

    public String baseTypeName() {
        return this._baseType.getRawClass().getName();
    }

    @Override // org.codehaus.jackson.map.TypeDeserializer
    public String getPropertyName() {
        return null;
    }

    @Override // org.codehaus.jackson.map.TypeDeserializer
    public TypeIdResolver getTypeIdResolver() {
        return this._idResolver;
    }

    @Override // org.codehaus.jackson.map.TypeDeserializer
    public Class<?> getDefaultImpl() {
        if (this._defaultImpl == null) {
            return null;
        }
        return this._defaultImpl.getRawClass();
    }

    public String toString() {
        StringBuilder sb = new StringBuilder();
        sb.append('[').append(getClass().getName());
        sb.append("; base-type:").append(this._baseType);
        sb.append("; id-resolver: ").append(this._idResolver);
        sb.append(']');
        return sb.toString();
    }

    protected final JsonDeserializer<Object> _findDeserializer(DeserializationContext ctxt, String typeId) throws IOException {
        JsonDeserializer<Object> deser;
        synchronized (this._deserializers) {
            deser = this._deserializers.get(typeId);
            if (deser == null) {
                JavaType type = this._idResolver.typeFromId(typeId);
                if (type == null) {
                    if (this._defaultImpl == null) {
                        throw ctxt.unknownTypeException(this._baseType, typeId);
                    }
                    deser = _findDefaultImplDeserializer(ctxt);
                } else {
                    if (this._baseType != null && this._baseType.getClass() == type.getClass()) {
                        type = this._baseType.narrowBy(type.getRawClass());
                    }
                    deser = ctxt.getDeserializerProvider().findValueDeserializer(ctxt.getConfig(), type, this._property);
                }
                this._deserializers.put(typeId, deser);
            }
        }
        return deser;
    }

    protected final JsonDeserializer<Object> _findDefaultImplDeserializer(DeserializationContext ctxt) throws IOException {
        JsonDeserializer<Object> jsonDeserializer;
        if (this._defaultImpl == null) {
            return null;
        }
        synchronized (this._defaultImpl) {
            if (this._defaultImplDeserializer == null) {
                this._defaultImplDeserializer = ctxt.getDeserializerProvider().findValueDeserializer(ctxt.getConfig(), this._defaultImpl, this._property);
            }
            jsonDeserializer = this._defaultImplDeserializer;
        }
        return jsonDeserializer;
    }
}
