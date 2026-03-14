package com.tencent.stat;

import android.content.Context;

/* JADX INFO: loaded from: classes.dex */
final class ac implements Runnable {
    final /* synthetic */ Context a;
    final /* synthetic */ int b;

    ac(Context context, int i) {
        this.a = context;
        this.b = i;
    }

    @Override // java.lang.Runnable
    public void run() {
        try {
            StatServiceImpl.flushDataToDB(this.a);
            au.a(this.a).a(this.b);
        } catch (Throwable th) {
            StatServiceImpl.q.e(th);
            StatServiceImpl.a(this.a, th);
        }
    }
}
