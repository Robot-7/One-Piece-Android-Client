package org.codehaus.jackson.map.type;

import java.lang.reflect.Array;
import org.codehaus.jackson.type.JavaType;

/* JADX INFO: loaded from: classes.dex */
public final class ArrayType extends TypeBase {
    protected final JavaType _componentType;
    protected final Object _emptyArray;

    private ArrayType(JavaType componentType, Object emptyInstance, Object valueHandler, Object typeHandler) {
        super(emptyInstance.getClass(), componentType.hashCode(), valueHandler, typeHandler);
        this._componentType = componentType;
        this._emptyArray = emptyInstance;
    }

    @Deprecated
    public static ArrayType construct(JavaType componentType) {
        return construct(componentType, null, null);
    }

    public static ArrayType construct(JavaType componentType, Object valueHandler, Object typeHandler) {
        Object emptyInstance = Array.newInstance(componentType.getRawClass(), 0);
        return new ArrayType(componentType, emptyInstance, null, null);
    }

    @Override // org.codehaus.jackson.type.JavaType
    public ArrayType withTypeHandler(Object h) {
        return h == this._typeHandler ? this : new ArrayType(this._componentType, this._emptyArray, this._valueHandler, h);
    }

    @Override // org.codehaus.jackson.type.JavaType
    public ArrayType withContentTypeHandler(Object h) {
        return h == this._componentType.getTypeHandler() ? this : new ArrayType(this._componentType.withTypeHandler(h), this._emptyArray, this._valueHandler, this._typeHandler);
    }

    @Override // org.codehaus.jackson.type.JavaType
    public ArrayType withValueHandler(Object h) {
        return h == this._valueHandler ? this : new ArrayType(this._componentType, this._emptyArray, h, this._typeHandler);
    }

    @Override // org.codehaus.jackson.type.JavaType
    public ArrayType withContentValueHandler(Object h) {
        return h == this._componentType.getValueHandler() ? this : new ArrayType(this._componentType.withValueHandler(h), this._emptyArray, this._valueHandler, this._typeHandler);
    }

    @Override // org.codehaus.jackson.map.type.TypeBase
    protected String buildCanonicalName() {
        return this._class.getName();
    }

    @Override // org.codehaus.jackson.type.JavaType
    protected JavaType _narrow(Class<?> subclass) {
        if (!subclass.isArray()) {
            throw new IllegalArgumentException("Incompatible narrowing operation: trying to narrow " + toString() + " to class " + subclass.getName());
        }
        Class<?> newCompClass = subclass.getComponentType();
        JavaType newCompType = TypeFactory.defaultInstance().constructType(newCompClass);
        return construct(newCompType, this._valueHandler, this._typeHandler);
    }

    @Override // org.codehaus.jackson.type.JavaType
    public JavaType narrowContentsBy(Class<?> contentClass) {
        return contentClass == this._componentType.getRawClass() ? this : construct(this._componentType.narrowBy(contentClass), this._valueHandler, this._typeHandler);
    }

    @Override // org.codehaus.jackson.type.JavaType
    public JavaType widenContentsBy(Class<?> contentClass) {
        return contentClass == this._componentType.getRawClass() ? this : construct(this._componentType.widenBy(contentClass), this._valueHandler, this._typeHandler);
    }

    @Override // org.codehaus.jackson.type.JavaType
    public boolean isArrayType() {
        return true;
    }

    @Override // org.codehaus.jackson.type.JavaType
    public boolean isAbstract() {
        return false;
    }

    @Override // org.codehaus.jackson.type.JavaType
    public boolean isConcrete() {
        return true;
    }

    @Override // org.codehaus.jackson.type.JavaType
    public boolean hasGenericTypes() {
        return this._componentType.hasGenericTypes();
    }

    @Override // org.codehaus.jackson.type.JavaType
    public String containedTypeName(int index) {
        if (index == 0) {
            return "E";
        }
        return null;
    }

    @Override // org.codehaus.jackson.type.JavaType
    public boolean isContainerType() {
        return true;
    }

    @Override // org.codehaus.jackson.type.JavaType
    public JavaType getContentType() {
        return this._componentType;
    }

    @Override // org.codehaus.jackson.type.JavaType
    public int containedTypeCount() {
        return 1;
    }

    @Override // org.codehaus.jackson.type.JavaType
    public JavaType containedType(int index) {
        if (index == 0) {
            return this._componentType;
        }
        return null;
    }

    @Override // org.codehaus.jackson.map.type.TypeBase, org.codehaus.jackson.type.JavaType
    public StringBuilder getGenericSignature(StringBuilder sb) {
        sb.append('[');
        return this._componentType.getGenericSignature(sb);
    }

    @Override // org.codehaus.jackson.map.type.TypeBase, org.codehaus.jackson.type.JavaType
    public StringBuilder getErasedSignature(StringBuilder sb) {
        sb.append('[');
        return this._componentType.getErasedSignature(sb);
    }

    @Override // org.codehaus.jackson.type.JavaType
    public String toString() {
        return "[array type, component type: " + this._componentType + "]";
    }

    @Override // org.codehaus.jackson.type.JavaType
    public boolean equals(Object o) {
        if (o == this) {
            return true;
        }
        if (o == null || o.getClass() != getClass()) {
            return false;
        }
        ArrayType other = (ArrayType) o;
        return this._componentType.equals(other._componentType);
    }
}
