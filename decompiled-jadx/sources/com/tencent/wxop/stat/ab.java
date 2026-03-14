package com.tencent.wxop.stat;

import java.util.List;

/* JADX INFO: loaded from: classes.dex */
final class ab implements ak {
    final /* synthetic */ List bc;
    final /* synthetic */ boolean ch;
    final /* synthetic */ u cn;

    ab(u uVar, List list, boolean z) {
        this.cn = uVar;
        this.bc = list;
        this.ch = z;
    }

    @Override // com.tencent.wxop.stat.ak
    public final void B() {
        f.I();
        this.cn.b(this.bc, this.ch);
    }

    @Override // com.tencent.wxop.stat.ak
    public final void ah() {
        f.H();
        this.cn.c(this.bc, this.ch);
    }
}
