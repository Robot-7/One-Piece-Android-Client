package com.igexin.push.e.b;

import java.util.concurrent.TimeUnit;

/* JADX INFO: loaded from: classes.dex */
public class e extends h {
    private static e a;

    public e() {
        super(3600000L);
        this.A = true;
    }

    public static e g() {
        if (a == null) {
            a = new e();
        }
        return a;
    }

    @Override // com.igexin.push.e.b.h
    protected void a() {
        com.igexin.push.core.a.f.a().C();
        com.igexin.push.core.a.f.a().A();
        com.igexin.push.core.a.f.a().s();
        com.igexin.push.core.a.f.a().t();
        long jCurrentTimeMillis = System.currentTimeMillis();
        if (jCurrentTimeMillis - com.igexin.push.core.g.M > 3600000) {
            boolean z = true;
            if (com.igexin.push.core.a.f.a().a(jCurrentTimeMillis) && "1".equals(com.igexin.push.core.a.f.a().g("ccs"))) {
                z = false;
            }
            if (z) {
                com.igexin.push.core.g.M = jCurrentTimeMillis;
                com.igexin.push.core.a.f.a().z();
            }
        }
        com.igexin.push.core.a.f.a().B();
    }

    @Override // com.igexin.a.a.d.a.f
    public int b() {
        return 0;
    }

    @Override // com.igexin.a.a.d.d
    public void c() {
        super.c();
        if (this.x) {
            return;
        }
        h();
    }

    public void h() {
        a(3600000L, TimeUnit.MILLISECONDS);
    }
}
