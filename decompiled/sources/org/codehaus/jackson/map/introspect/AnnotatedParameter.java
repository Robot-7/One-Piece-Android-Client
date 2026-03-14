package org.codehaus.jackson.map.introspect;

import com.tencent.stat.common.StatConstants;
import java.lang.annotation.Annotation;
import java.lang.reflect.AnnotatedElement;
import java.lang.reflect.Member;
import java.lang.reflect.Type;
import org.codehaus.jackson.map.type.TypeFactory;
import org.codehaus.jackson.type.JavaType;

/* JADX INFO: loaded from: classes.dex */
public final class AnnotatedParameter extends AnnotatedMember {
    protected final int _index;
    protected final AnnotatedWithParams _owner;
    protected final Type _type;

    public AnnotatedParameter(AnnotatedWithParams owner, Type type, AnnotationMap annotations, int index) {
        super(annotations);
        this._owner = owner;
        this._type = type;
        this._index = index;
    }

    @Override // org.codehaus.jackson.map.introspect.Annotated
    public AnnotatedParameter withAnnotations(AnnotationMap ann) {
        return ann == this._annotations ? this : this._owner.replaceParameterAnnotations(this._index, ann);
    }

    public void addOrOverride(Annotation a) {
        this._annotations.add(a);
    }

    @Override // org.codehaus.jackson.map.introspect.Annotated
    public AnnotatedElement getAnnotated() {
        return null;
    }

    @Override // org.codehaus.jackson.map.introspect.Annotated
    public int getModifiers() {
        return this._owner.getModifiers();
    }

    @Override // org.codehaus.jackson.map.introspect.Annotated
    public String getName() {
        return StatConstants.MTA_COOPERATION_TAG;
    }

    @Override // org.codehaus.jackson.map.introspect.Annotated
    public <A extends Annotation> A getAnnotation(Class<A> cls) {
        return (A) this._annotations.get(cls);
    }

    @Override // org.codehaus.jackson.map.introspect.Annotated
    public Type getGenericType() {
        return this._type;
    }

    @Override // org.codehaus.jackson.map.introspect.Annotated
    public Class<?> getRawType() {
        if (this._type instanceof Class) {
            return (Class) this._type;
        }
        JavaType t = TypeFactory.defaultInstance().constructType(this._type);
        return t.getRawClass();
    }

    @Override // org.codehaus.jackson.map.introspect.AnnotatedMember
    public Class<?> getDeclaringClass() {
        return this._owner.getDeclaringClass();
    }

    @Override // org.codehaus.jackson.map.introspect.AnnotatedMember
    public Member getMember() {
        return this._owner.getMember();
    }

    @Override // org.codehaus.jackson.map.introspect.AnnotatedMember
    public void setValue(Object pojo, Object value) throws UnsupportedOperationException {
        throw new UnsupportedOperationException("Cannot call setValue() on constructor parameter of " + getDeclaringClass().getName());
    }

    public Type getParameterType() {
        return this._type;
    }

    public AnnotatedWithParams getOwner() {
        return this._owner;
    }

    public int getIndex() {
        return this._index;
    }

    public String toString() {
        return "[parameter #" + getIndex() + ", annotations: " + this._annotations + "]";
    }
}
