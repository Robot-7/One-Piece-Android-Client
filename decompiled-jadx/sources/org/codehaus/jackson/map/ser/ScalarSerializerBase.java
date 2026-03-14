package org.codehaus.jackson.map.ser;

/* JADX INFO: loaded from: classes.dex */
@Deprecated
public abstract class ScalarSerializerBase<T> extends org.codehaus.jackson.map.ser.std.SerializerBase<T> {
    protected ScalarSerializerBase(Class<T> t) {
        super(t);
    }

    protected ScalarSerializerBase(Class<?> t, boolean dummy) {
        super(t);
    }
}
