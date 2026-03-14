package com.tencent.wxop.stat;

import android.content.Context;

/* JADX INFO: loaded from: classes.dex */
final class ap implements Runnable {
    final /* synthetic */ g bN = null;
    final /* synthetic */ Context e;

    ap(Context context) {
        this.e = context;
    }

    @Override // java.lang.Runnable
    public final void run() {
        if (this.e == null) {
            f.aV.error("The Context of StatService.onPause() can not be null!");
        } else {
            f.b(this.e, com.tencent.wxop.stat.b.l.B(this.e), this.bN);
        }
    }
}
