package com.igexin.getuiext.b;

import android.content.Context;

/* JADX INFO: loaded from: classes.dex */
public class c {
    private static c e = new c();
    private com.igexin.getuiext.data.a a;
    private b b;
    private a c;
    private boolean d = false;

    private c() {
    }

    public static c d() {
        return e;
    }

    public com.igexin.getuiext.data.a a() {
        return this.a;
    }

    public synchronized void a(Context context) {
        if (!this.d) {
            this.a = new com.igexin.getuiext.data.a(context);
            this.b = new b(this.a);
            this.c = new a(this.a);
            this.d = true;
        }
    }

    public b b() {
        return this.b;
    }

    public a c() {
        return this.c;
    }
}
