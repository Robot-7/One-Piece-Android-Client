package com.igexin.a.a.d;

/* JADX INFO: loaded from: classes.dex */
public abstract class a implements com.igexin.a.a.d.a.f {
    private volatile boolean a;
    private long b;
    protected String w = getClass().getSimpleName();

    @Override // com.igexin.a.a.d.a.f
    public void a(boolean z) {
        this.a = !z;
    }

    @Override // com.igexin.a.a.d.a.f
    public boolean j() {
        return this.a;
    }

    @Override // com.igexin.a.a.d.a.f
    public long k() {
        return this.b;
    }
}
