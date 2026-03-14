package com.testin.agent.b;

import android.content.Context;

/* JADX INFO: loaded from: classes.dex */
class i implements Runnable {
    final /* synthetic */ f a;
    private final /* synthetic */ Context b;

    i(f fVar, Context context) {
        this.a = fVar;
        this.b = context;
    }

    @Override // java.lang.Runnable
    public void run() {
        if (!com.testin.agent.f.c.a(this.b)) {
            com.testin.agent.base.b.c("TestinTestHandler", "Current network is disconnected or disabled");
            return;
        }
        if (this.a.b == null) {
            this.a.b = new d();
        }
        com.testin.agent.f.e.a((Long) null);
        this.a.c(this.b);
    }
}
