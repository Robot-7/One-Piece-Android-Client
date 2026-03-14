package com.igexin.a.a.b.a.a;

/* JADX INFO: loaded from: classes.dex */
public class c extends com.igexin.a.a.b.f {
    e e;

    public c(String str) {
        super(str, null);
        this.a = this.a.replaceFirst("disConnect", "socket");
        this.D = true;
    }

    @Override // com.igexin.a.a.d.d
    public void a_() {
        super.a_();
        if (this.e.g.get()) {
            return;
        }
        int i = 0;
        while (!this.e.g.compareAndSet(false, true)) {
            int i2 = i + 1;
            if (i > 10) {
                break;
            } else {
                i = i2;
            }
        }
        if (this.e.g.get()) {
            this.e.i();
        }
    }

    @Override // com.igexin.a.a.d.a.f
    public final int b() {
        return -2045;
    }

    @Override // com.igexin.a.a.d.d
    public void d() {
        super.d();
        this.e = e.a(this.a, this.b);
    }

    @Override // com.igexin.a.a.d.d
    protected void e() {
    }
}
