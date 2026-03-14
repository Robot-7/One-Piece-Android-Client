package com.tencent.wxop.stat;

import android.content.Context;

/* JADX INFO: loaded from: classes.dex */
final class m implements Runnable {
    final /* synthetic */ g bN = null;
    final /* synthetic */ Context e;

    m(Context context) {
        this.e = context;
    }

    @Override // java.lang.Runnable
    public final void run() {
        if (this.e == null) {
            f.aV.error("The Context of StatService.onResume() can not be null!");
        } else {
            f.a(this.e, com.tencent.wxop.stat.b.l.B(this.e), this.bN);
        }
    }
}
