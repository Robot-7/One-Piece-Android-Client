package com.tencent.wxop.stat;

import android.content.Context;

/* JADX INFO: loaded from: classes.dex */
final class as implements Runnable {
    final /* synthetic */ g bN = null;

    /* JADX INFO: renamed from: do, reason: not valid java name */
    final /* synthetic */ com.tencent.wxop.stat.a.b f0do;
    final /* synthetic */ Context e;

    as(Context context, com.tencent.wxop.stat.a.b bVar) {
        this.e = context;
        this.f0do = bVar;
    }

    @Override // java.lang.Runnable
    public final void run() {
        try {
            com.tencent.wxop.stat.a.a aVar = new com.tencent.wxop.stat.a.a(this.e, f.a(this.e, false, this.bN), this.f0do.a, this.bN);
            aVar.ab().bm = this.f0do.bm;
            new q(aVar).ah();
        } catch (Throwable th) {
            f.aV.b(th);
            f.a(this.e, th);
        }
    }
}
