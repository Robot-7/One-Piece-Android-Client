package com.tencent.a.a.a.a;

import android.content.Context;

/* JADX INFO: loaded from: classes.dex */
public abstract class f {
    protected Context e;

    protected f(Context context) {
        this.e = null;
        this.e = context;
    }

    public final void a(c cVar) {
        if (cVar == null) {
            return;
        }
        String string = cVar.toString();
        if (a()) {
            b(h.g(string));
        }
    }

    protected abstract boolean a();

    protected abstract String b();

    protected abstract void b(String str);

    public final c e() {
        String strF = a() ? h.f(b()) : null;
        if (strF != null) {
            return c.c(strF);
        }
        return null;
    }
}
