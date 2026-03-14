package com.tencent.wxop.stat;

/* JADX INFO: loaded from: classes.dex */
final class t implements ak {
    final /* synthetic */ q bV;

    t(q qVar) {
        this.bV = qVar;
    }

    @Override // com.tencent.wxop.stat.ak
    public final void B() {
        u.ai().b(this.bV.bP, null, this.bV.bR, true);
        f.I();
    }

    @Override // com.tencent.wxop.stat.ak
    public final void ah() {
        f.H();
        if (u.ai().aI > 0) {
            f.o(this.bV.bS);
        }
    }
}
