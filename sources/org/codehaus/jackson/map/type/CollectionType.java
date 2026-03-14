package org.codehaus.jackson.map.type;

import org.codehaus.jackson.type.JavaType;

/* JADX INFO: loaded from: classes.dex */
public final class CollectionType extends CollectionLikeType {
    private CollectionType(Class<?> collT, JavaType elemT, Object valueHandler, Object typeHandler) {
        super(collT, elemT, valueHandler, typeHandler);
    }

    @Override // org.codehaus.jackson.map.type.CollectionLikeType, org.codehaus.jackson.type.JavaType
    protected JavaType _narrow(Class<?> subclass) {
        return new CollectionType(subclass, this._elementType, null, null);
    }

    @Override // org.codehaus.jackson.map.type.CollectionLikeType, org.codehaus.jackson.type.JavaType
    public JavaType narrowContentsBy(Class<?> contentClass) {
        return contentClass == this._elementType.getRawClass() ? this : new CollectionType(this._class, this._elementType.narrowBy(contentClass), this._valueHandler, this._typeHandler);
    }

    @Override // org.codehaus.jackson.map.type.CollectionLikeType, org.codehaus.jackson.type.JavaType
    public JavaType widenContentsBy(Class<?> contentClass) {
        return contentClass == this._elementType.getRawClass() ? this : new CollectionType(this._class, this._elementType.widenBy(contentClass), this._valueHandler, this._typeHandler);
    }

    public static CollectionType construct(Class<?> rawType, JavaType elemT) {
        return new CollectionType(rawType, elemT, null, null);
    }

    @Override // org.codehaus.jackson.map.type.CollectionLikeType, org.codehaus.jackson.type.JavaType
    public CollectionType withTypeHandler(Object h) {
        return new CollectionType(this._class, this._elementType, this._valueHandler, h);
    }

    @Override // org.codehaus.jackson.map.type.CollectionLikeType, org.codehaus.jackson.type.JavaType
    public CollectionType withContentTypeHandler(Object h) {
        return new CollectionType(this._class, this._elementType.withTypeHandler(h), this._valueHandler, this._typeHandler);
    }

    @Override // org.codehaus.jackson.map.type.CollectionLikeType, org.codehaus.jackson.type.JavaType
    public CollectionType withValueHandler(Object h) {
        return new CollectionType(this._class, this._elementType, h, this._typeHandler);
    }

    @Override // org.codehaus.jackson.map.type.CollectionLikeType, org.codehaus.jackson.type.JavaType
    public CollectionType withContentValueHandler(Object h) {
        return new CollectionType(this._class, this._elementType.withValueHandler(h), this._valueHandler, this._typeHandler);
    }

    @Override // org.codehaus.jackson.map.type.CollectionLikeType, org.codehaus.jackson.type.JavaType
    public String toString() {
        return "[collection type; class " + this._class.getName() + ", contains " + this._elementType + "]";
    }
}
