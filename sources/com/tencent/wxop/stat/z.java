package com.tencent.wxop.stat;

/* JADX INFO: loaded from: classes.dex */
final class z implements Runnable {
    final /* synthetic */ ai O;
    final /* synthetic */ u cl;

    z(u uVar, ai aiVar) {
        this.cl = uVar;
        this.O = aiVar;
    }

    @Override // java.lang.Runnable
    public final void run() {
        this.cl.a(this.O);
    }
}
