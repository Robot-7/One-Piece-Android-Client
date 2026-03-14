package com.igexin.a.a.b;

import java.util.concurrent.TimeUnit;

/* JADX INFO: loaded from: classes.dex */
public class d extends com.igexin.a.a.d.e {
    static d a;
    public static boolean f;
    private byte[] A;
    private byte[] B;
    public volatile long b;
    public volatile long c;
    public volatile long d;
    public volatile long e;
    com.igexin.a.a.d.a.b g;

    public static d c() {
        if (a == null) {
            a = new d();
        }
        return a;
    }

    public static void e() {
        a.b = 0L;
        a.d = 0L;
        a.c = 0L;
        a.e = 0L;
    }

    public f a(String str, int i, c cVar) {
        return a(str, i, cVar, null, false, -1, -1L, (byte) 0, null, null);
    }

    public f a(String str, int i, c cVar, Object obj, boolean z) {
        return a(str, i, cVar, obj, z, -1, -1L, (byte) 0, null, null);
    }

    public f a(String str, int i, c cVar, Object obj, boolean z, int i2, long j, byte b, Object obj2, com.igexin.a.a.d.a.d dVar) {
        return a(str, i, cVar, obj, z, i2, j, b, obj2, dVar, 0, null);
    }

    public f a(String str, int i, c cVar, Object obj, boolean z, int i2, long j, byte b, Object obj2, com.igexin.a.a.d.a.d dVar, int i3, com.igexin.a.a.d.a.g gVar) {
        f fVar;
        if (this.g == null || (fVar = (f) this.g.a(str, Integer.valueOf(i), cVar)) == null || fVar.q()) {
            return null;
        }
        if (gVar != null) {
            fVar.a(i3, gVar);
        }
        a(fVar, obj, z, i2, j, b, obj2, dVar);
        return fVar;
    }

    public f a(String str, int i, c cVar, Object obj, boolean z, int i2, com.igexin.a.a.d.a.g gVar) {
        return a(str, i, cVar, obj, z, -1, -1L, (byte) 0, null, null, i2, gVar);
    }

    public void a(com.igexin.a.a.d.a.b bVar) {
        this.g = bVar;
    }

    public void a(byte[] bArr) {
        this.A = bArr;
        this.B = com.igexin.a.b.a.a(bArr);
    }

    boolean a(f fVar, Object obj, boolean z, int i, long j, byte b, Object obj2, com.igexin.a.a.d.a.d dVar) {
        fVar.c = obj;
        fVar.a(j, TimeUnit.MILLISECONDS);
        fVar.J = i;
        fVar.a((int) b);
        fVar.O = obj2;
        fVar.a(dVar);
        return a(fVar, z);
    }

    public byte[] a() {
        return this.A;
    }

    public byte[] b() {
        return this.B;
    }

    public final void d() {
        g();
    }
}
