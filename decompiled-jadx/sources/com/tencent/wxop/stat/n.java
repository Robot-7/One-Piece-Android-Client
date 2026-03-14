package com.tencent.wxop.stat;

import android.content.Context;

/* JADX INFO: loaded from: classes.dex */
final class n implements Runnable {
    final /* synthetic */ g bN = null;
    final /* synthetic */ Context e;

    n(Context context) {
        this.e = context;
    }

    @Override // java.lang.Runnable
    public final void run() {
        try {
            f.a(this.e, false, this.bN);
        } catch (Throwable th) {
            f.aV.b(th);
        }
    }
}
