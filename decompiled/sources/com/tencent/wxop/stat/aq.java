package com.tencent.wxop.stat;

import android.content.Context;

/* JADX INFO: loaded from: classes.dex */
final class aq implements Runnable {
    final /* synthetic */ Throwable dn;
    final /* synthetic */ Context e;

    aq(Context context, Throwable th) {
        this.e = context;
        this.dn = th;
    }

    @Override // java.lang.Runnable
    public final void run() {
        try {
            if (c.l()) {
                new q(new com.tencent.wxop.stat.a.c(this.e, f.a(this.e, false, (g) null), this.dn, com.tencent.wxop.stat.a.f.bw)).ah();
            }
        } catch (Throwable th) {
            f.aV.d("reportSdkSelfException error: " + th);
        }
    }
}
