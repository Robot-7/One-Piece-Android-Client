package com.tencent.stat;

/* JADX INFO: loaded from: classes.dex */
class ay implements Runnable {
    final /* synthetic */ com.tencent.stat.a.e a;
    final /* synthetic */ StatDispatchCallback b;
    final /* synthetic */ boolean c;
    final /* synthetic */ boolean d;
    final /* synthetic */ au e;

    ay(au auVar, com.tencent.stat.a.e eVar, StatDispatchCallback statDispatchCallback, boolean z, boolean z2) {
        this.e = auVar;
        this.a = eVar;
        this.b = statDispatchCallback;
        this.c = z;
        this.d = z2;
    }

    @Override // java.lang.Runnable
    public void run() {
        this.e.b(this.a, this.b, this.c, this.d);
    }
}
