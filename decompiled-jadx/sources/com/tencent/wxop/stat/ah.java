package com.tencent.wxop.stat;

import java.util.TimerTask;

/* JADX INFO: loaded from: classes.dex */
final class ah extends TimerTask {
    final /* synthetic */ ag de;

    ah(ag agVar) {
        this.de = agVar;
    }

    @Override // java.util.TimerTask, java.lang.Runnable
    public final void run() {
        if (c.k()) {
            com.tencent.wxop.stat.b.l.av().b("TimerTask run");
        }
        f.q(this.de.h);
        cancel();
        this.de.ah();
    }
}
