package com.igexin.a.a.b.a.a;

import java.nio.ByteBuffer;

/* JADX INFO: loaded from: classes.dex */
public final class g extends com.igexin.a.a.b.f {
    e e;
    ByteBuffer f;

    public g(String str, com.igexin.a.a.b.c cVar) {
        super(str, cVar);
        this.D = true;
    }

    @Override // com.igexin.a.a.d.d
    public void a_() {
        super.a_();
        this.e.p.offer(this);
        if (!this.e.r() && !com.igexin.a.a.b.d.c().a((com.igexin.a.a.d.d) this.e, true)) {
            throw new IllegalStateException("NioSocketTask is invalid");
        }
        if (this.e.i) {
            this.e.i();
        }
    }

    @Override // com.igexin.a.a.d.a.f
    public final int b() {
        return -2046;
    }

    @Override // com.igexin.a.a.d.d
    public final void d() {
        super.d();
        this.e = e.a(this.a, this.b);
    }

    @Override // com.igexin.a.a.d.d
    protected void e() {
    }

    @Override // com.igexin.a.a.b.f, com.igexin.a.a.d.d
    public void f() {
        this.e = null;
        super.f();
    }
}
