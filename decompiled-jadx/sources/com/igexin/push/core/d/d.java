package com.igexin.push.core.d;

import com.igexin.push.core.bean.PushTaskBean;
import java.util.Timer;
import java.util.TimerTask;

/* JADX INFO: loaded from: classes.dex */
class d extends TimerTask {
    final /* synthetic */ PushTaskBean a;
    final /* synthetic */ com.igexin.push.c.c.a b;
    final /* synthetic */ b c;

    d(b bVar, PushTaskBean pushTaskBean, com.igexin.push.c.c.a aVar) {
        this.c = bVar;
        this.a = pushTaskBean;
        this.b = aVar;
    }

    @Override // java.util.TimerTask, java.lang.Runnable
    public void run() {
        if (com.igexin.push.core.g.an.containsKey(this.a.getTaskId())) {
            ((Timer) com.igexin.push.core.g.an.get(this.a.getTaskId())).cancel();
            com.igexin.push.core.g.an.remove(this.a.getTaskId());
        }
        this.c.a(this.a, this.b);
        this.b.b(this.b.c() + 1);
    }
}
