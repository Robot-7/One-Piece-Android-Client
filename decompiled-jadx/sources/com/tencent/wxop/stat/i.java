package com.tencent.wxop.stat;

import android.content.Context;

/* JADX INFO: loaded from: classes.dex */
final class i implements Runnable {
    final /* synthetic */ Context e;
    final /* synthetic */ int g = -1;

    i(Context context) {
        this.e = context;
    }

    @Override // java.lang.Runnable
    public final void run() {
        try {
            f.p(this.e);
            u.s(this.e).b(this.g);
        } catch (Throwable th) {
            f.aV.b(th);
            f.a(this.e, th);
        }
    }
}
