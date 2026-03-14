package com.tencent.stat;

import android.content.Context;

/* JADX INFO: loaded from: classes.dex */
final class am implements Runnable {
    final /* synthetic */ Context a;
    final /* synthetic */ StatSpecifyReportedInfo b;

    am(Context context, StatSpecifyReportedInfo statSpecifyReportedInfo) {
        this.a = context;
        this.b = statSpecifyReportedInfo;
    }

    @Override // java.lang.Runnable
    public void run() {
        try {
            StatServiceImpl.a(this.a, false, this.b);
        } catch (Throwable th) {
            StatServiceImpl.q.e(th);
        }
    }
}
