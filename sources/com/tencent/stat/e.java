package com.tencent.stat;

import java.util.TimerTask;

/* JADX INFO: loaded from: classes.dex */
class e extends TimerTask {
    final /* synthetic */ d a;

    e(d dVar) {
        this.a = dVar;
    }

    @Override // java.util.TimerTask, java.lang.Runnable
    public void run() {
        if (StatConfig.isDebugEnable()) {
            com.tencent.stat.common.k.b().i("TimerTask run");
        }
        StatServiceImpl.f(this.a.c);
        cancel();
        this.a.a();
    }
}
