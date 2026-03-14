package com.tencent.stat;

import android.content.Context;

/* JADX INFO: loaded from: classes.dex */
final class q implements Runnable {
    final /* synthetic */ Context a;

    q(Context context) {
        this.a = context;
    }

    @Override // java.lang.Runnable
    public void run() {
        if (this.a == null) {
            StatServiceImpl.q.error("The Context of StatService.reportNativeCrash() can not be null!");
            return;
        }
        try {
            new Thread(new ao(this.a), "NativeCrashRepoter").start();
        } catch (Throwable th) {
            StatServiceImpl.q.e(th);
            StatServiceImpl.a(this.a, th);
        }
    }
}
