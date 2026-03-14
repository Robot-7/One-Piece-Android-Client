package com.tencent.wxop.stat;

/* JADX INFO: loaded from: classes.dex */
final class y implements Runnable {
    final /* synthetic */ com.tencent.wxop.stat.a.d bP;
    final /* synthetic */ boolean bR;
    final /* synthetic */ boolean ba;
    final /* synthetic */ u cg;
    final /* synthetic */ ak ck;

    y(u uVar, com.tencent.wxop.stat.a.d dVar, ak akVar, boolean z, boolean z2) {
        this.cg = uVar;
        this.bP = dVar;
        this.ck = akVar;
        this.bR = z;
        this.ba = z2;
    }

    @Override // java.lang.Runnable
    public final void run() {
        this.cg.a(this.bP, this.ck, this.bR, this.ba);
    }
}
