package com.tencent.wxop.stat;

import android.content.Context;

/* JADX INFO: loaded from: classes.dex */
final class j implements Runnable {
    final /* synthetic */ Context e;

    j(Context context) {
        this.e = context;
    }

    @Override // java.lang.Runnable
    public final void run() {
        try {
            new Thread(new p(this.e), "NetworkMonitorTask").start();
        } catch (Throwable th) {
            f.aV.b(th);
            f.a(this.e, th);
        }
    }
}
