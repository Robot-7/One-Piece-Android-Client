package com.igexin.push.core.d;

import java.util.TimerTask;

/* JADX INFO: loaded from: classes.dex */
class c extends TimerTask {
    final /* synthetic */ b a;

    c(b bVar) {
        this.a = bVar;
    }

    @Override // java.util.TimerTask, java.lang.Runnable
    public void run() {
        com.igexin.push.core.a.f.a().a(this.a.b, this.a.c, this.a.d);
        this.a.c.a(this.a.c.a() + 1);
    }
}
