package com.igexin.push.e.b;

import com.igexin.push.core.i;
import java.util.concurrent.TimeUnit;

/* JADX INFO: loaded from: classes.dex */
public class d extends h {
    private static d a;

    public d() {
        super(i.a().b());
        this.A = true;
    }

    public static d g() {
        if (a == null) {
            a = new d();
        }
        return a;
    }

    @Override // com.igexin.push.e.b.h
    protected void a() {
        com.igexin.push.core.a.f.a().C();
        com.igexin.push.core.g.G = System.currentTimeMillis();
        if (!com.igexin.push.core.g.o) {
            h();
        } else {
            com.igexin.a.a.c.a.a("heartbeatReq");
            com.igexin.push.core.f.a().g().f();
        }
    }

    @Override // com.igexin.a.a.d.a.f
    public final int b() {
        return -2147483642;
    }

    @Override // com.igexin.a.a.d.d
    public void c() {
        super.c();
        if (this.x) {
            return;
        }
        h();
    }

    @Override // com.igexin.a.a.d.d
    public void d() {
    }

    public void h() {
        a(i.a().b(), TimeUnit.MILLISECONDS);
    }

    public void i() {
    }
}
