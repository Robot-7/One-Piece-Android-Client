package com.igexin.push.e.b;

import com.igexin.push.a.j;
import java.util.concurrent.TimeUnit;

/* JADX INFO: loaded from: classes.dex */
public class f extends h {
    private static final String a = j.a;
    private static f b;

    private f() {
        super(3600000L);
        this.A = true;
    }

    public static f g() {
        if (b == null) {
            b = new f();
        }
        return b;
    }

    @Override // com.igexin.push.e.b.h
    protected void a() throws Throwable {
        com.igexin.push.core.a.f.a().C();
        boolean zA = com.igexin.push.core.a.f.a().a(System.currentTimeMillis());
        boolean zN = com.igexin.push.core.a.f.a().n();
        if (!com.igexin.push.core.g.k || !com.igexin.push.core.g.l || !com.igexin.push.core.g.m || com.igexin.push.core.g.o || zA || !zN || com.igexin.push.core.g.o) {
            a(3600000L, TimeUnit.MILLISECONDS);
            return;
        }
        int iD = com.igexin.push.core.f.a().g().d();
        if (iD != 1 && iD == 0) {
            com.igexin.a.a.b.d.c().a(new com.igexin.push.c.b.a());
            com.igexin.a.a.b.d.c().d();
        }
        a(1800000L, TimeUnit.MILLISECONDS);
    }

    @Override // com.igexin.a.a.d.a.f
    public final int b() {
        return -2147483641;
    }

    @Override // com.igexin.a.a.d.d
    public void c() {
        super.c();
    }

    @Override // com.igexin.a.a.d.d
    public void d() {
    }

    public void h() {
        a(com.igexin.push.core.f.a().e().c(), TimeUnit.MILLISECONDS);
    }
}
