package com.tencent.stat;

import android.content.Context;

/* JADX INFO: loaded from: classes.dex */
final class ad implements Runnable {
    final /* synthetic */ Context a;

    ad(Context context) {
        this.a = context;
    }

    @Override // java.lang.Runnable
    public void run() {
        try {
            new Thread(new ap(this.a, null, null), "NetworkMonitorTask").start();
        } catch (Throwable th) {
            StatServiceImpl.q.e(th);
            StatServiceImpl.a(this.a, th);
        }
    }
}
