package com.tencent.mm.sdk.b;

import java.util.LinkedHashMap;

/* JADX INFO: loaded from: classes.dex */
public final class c<K, V> {
    private int A;
    private int B;
    private int C;
    private int D;
    private int size;
    private final LinkedHashMap<K, V> u;
    private int v;

    /* JADX WARN: Code restructure failed: missing block: B:10:0x0031, code lost:
    
        throw new java.lang.IllegalStateException(getClass().getName() + ".sizeOf() is reporting inconsistent results!");
     */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    private void trimToSize(int r4) {
        /*
            r3 = this;
        L0:
            monitor-enter(r3)
            int r0 = r3.size     // Catch: java.lang.Throwable -> L32
            if (r0 < 0) goto L11
            java.util.LinkedHashMap<K, V> r0 = r3.u     // Catch: java.lang.Throwable -> L32
            boolean r0 = r0.isEmpty()     // Catch: java.lang.Throwable -> L32
            if (r0 == 0) goto L35
            int r0 = r3.size     // Catch: java.lang.Throwable -> L32
            if (r0 == 0) goto L35
        L11:
            java.lang.IllegalStateException r0 = new java.lang.IllegalStateException     // Catch: java.lang.Throwable -> L32
            java.lang.StringBuilder r1 = new java.lang.StringBuilder     // Catch: java.lang.Throwable -> L32
            r1.<init>()     // Catch: java.lang.Throwable -> L32
            java.lang.Class r2 = r3.getClass()     // Catch: java.lang.Throwable -> L32
            java.lang.String r2 = r2.getName()     // Catch: java.lang.Throwable -> L32
            java.lang.StringBuilder r1 = r1.append(r2)     // Catch: java.lang.Throwable -> L32
            java.lang.String r2 = ".sizeOf() is reporting inconsistent results!"
            java.lang.StringBuilder r1 = r1.append(r2)     // Catch: java.lang.Throwable -> L32
            java.lang.String r1 = r1.toString()     // Catch: java.lang.Throwable -> L32
            r0.<init>(r1)     // Catch: java.lang.Throwable -> L32
            throw r0     // Catch: java.lang.Throwable -> L32
        L32:
            r0 = move-exception
            monitor-exit(r3)
            throw r0
        L35:
            int r0 = r3.size     // Catch: java.lang.Throwable -> L32
            if (r0 <= r4) goto L41
            java.util.LinkedHashMap<K, V> r0 = r3.u     // Catch: java.lang.Throwable -> L32
            boolean r0 = r0.isEmpty()     // Catch: java.lang.Throwable -> L32
            if (r0 == 0) goto L43
        L41:
            monitor-exit(r3)     // Catch: java.lang.Throwable -> L32
            return
        L43:
            java.util.LinkedHashMap<K, V> r0 = r3.u     // Catch: java.lang.Throwable -> L32
            java.util.Set r0 = r0.entrySet()     // Catch: java.lang.Throwable -> L32
            java.util.Iterator r0 = r0.iterator()     // Catch: java.lang.Throwable -> L32
            java.lang.Object r0 = r0.next()     // Catch: java.lang.Throwable -> L32
            java.util.Map$Entry r0 = (java.util.Map.Entry) r0     // Catch: java.lang.Throwable -> L32
            java.lang.Object r1 = r0.getKey()     // Catch: java.lang.Throwable -> L32
            r0.getValue()     // Catch: java.lang.Throwable -> L32
            java.util.LinkedHashMap<K, V> r0 = r3.u     // Catch: java.lang.Throwable -> L32
            r0.remove(r1)     // Catch: java.lang.Throwable -> L32
            int r0 = r3.size     // Catch: java.lang.Throwable -> L32
            int r0 = r0 + (-1)
            r3.size = r0     // Catch: java.lang.Throwable -> L32
            int r0 = r3.B     // Catch: java.lang.Throwable -> L32
            int r0 = r0 + 1
            r3.B = r0     // Catch: java.lang.Throwable -> L32
            monitor-exit(r3)     // Catch: java.lang.Throwable -> L32
            goto L0
        */
        throw new UnsupportedOperationException("Method not decompiled: com.tencent.mm.sdk.b.c.trimToSize(int):void");
    }

    public final synchronized boolean a(K k) {
        return this.u.containsKey(k);
    }

    public final V get(K k) {
        if (k == null) {
            throw new NullPointerException("key == null");
        }
        synchronized (this) {
            V v = this.u.get(k);
            if (v != null) {
                this.C++;
                return v;
            }
            this.D++;
            return null;
        }
    }

    public final V put(K k, V v) {
        V vPut;
        if (k == null || v == null) {
            throw new NullPointerException("key == null || value == null");
        }
        synchronized (this) {
            this.A++;
            this.size++;
            vPut = this.u.put(k, v);
            if (vPut != null) {
                this.size--;
            }
        }
        trimToSize(this.v);
        return vPut;
    }

    public final synchronized String toString() {
        String str;
        synchronized (this) {
            int i = this.C + this.D;
            str = String.format("LruCache[maxSize=%d,hits=%d,misses=%d,hitRate=%d%%]", Integer.valueOf(this.v), Integer.valueOf(this.C), Integer.valueOf(this.D), Integer.valueOf(i != 0 ? (this.C * 100) / i : 0));
        }
        return str;
    }
}
