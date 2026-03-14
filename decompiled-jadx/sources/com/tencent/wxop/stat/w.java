package com.tencent.wxop.stat;

import java.util.List;

/* JADX INFO: loaded from: classes.dex */
final class w implements Runnable {
    final /* synthetic */ boolean bR = true;
    final /* synthetic */ List bc;
    final /* synthetic */ boolean ch;
    final /* synthetic */ u ci;

    w(u uVar, List list, boolean z) {
        this.ci = uVar;
        this.bc = list;
        this.ch = z;
    }

    @Override // java.lang.Runnable
    public final void run() {
        this.ci.a((List<ae>) this.bc, this.ch);
        if (this.bR) {
            this.bc.clear();
        }
    }
}
