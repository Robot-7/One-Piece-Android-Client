package com.tencent.wxop.stat;

import java.util.List;

/* JADX INFO: loaded from: classes.dex */
final class v implements Runnable {
    final /* synthetic */ boolean bR;
    final /* synthetic */ List bc;
    final /* synthetic */ u cg;
    final /* synthetic */ int g = 1;
    final /* synthetic */ boolean ba = true;

    v(u uVar, List list, boolean z) {
        this.cg = uVar;
        this.bc = list;
        this.bR = z;
    }

    @Override // java.lang.Runnable
    public final void run() {
        this.cg.a((List<ae>) this.bc, this.g, this.bR);
        if (this.ba) {
            this.bc.clear();
        }
    }
}
