package com.igexin.push.e.b;

import android.os.Message;
import java.util.concurrent.TimeUnit;

/* JADX INFO: loaded from: classes.dex */
public class b extends h {
    private static b a;

    public b() {
        super(60000L);
        this.A = true;
    }

    public static b g() {
        if (a == null) {
            a = new b();
        }
        return a;
    }

    private void h() {
        a(360000L, TimeUnit.MILLISECONDS);
    }

    @Override // com.igexin.push.e.b.h
    protected void a() {
        com.igexin.push.core.a.f.a().C();
        Message message = new Message();
        message.what = com.igexin.push.core.a.j;
        com.igexin.push.core.f.a().a(message);
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
}
