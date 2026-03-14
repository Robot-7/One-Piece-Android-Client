package com.testin.agent.b;

import android.content.Context;
import com.testin.agent.base.TestinGVariables;

/* JADX INFO: loaded from: classes.dex */
class j implements Runnable {
    final /* synthetic */ f a;
    private final /* synthetic */ Context b;

    j(f fVar, Context context) {
        this.a = fVar;
        this.b = context;
    }

    @Override // java.lang.Runnable
    public void run() {
        com.testin.agent.f.e.a((Long) null);
        if (TestinGVariables.c().b() == null) {
            this.a.g(this.b);
        }
        if (TestinGVariables.c().a() == null) {
            this.a.f(this.b);
        }
    }
}
