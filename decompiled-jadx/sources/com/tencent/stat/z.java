package com.tencent.stat;

import android.content.Context;

/* JADX INFO: loaded from: classes.dex */
final class z implements Runnable {
    final /* synthetic */ Context a;
    final /* synthetic */ StatSpecifyReportedInfo b;
    final /* synthetic */ StatAppMonitor c;

    z(Context context, StatSpecifyReportedInfo statSpecifyReportedInfo, StatAppMonitor statAppMonitor) {
        this.a = context;
        this.b = statSpecifyReportedInfo;
        this.c = statAppMonitor;
    }

    @Override // java.lang.Runnable
    public void run() {
        try {
            new aq(new com.tencent.stat.a.h(this.a, StatServiceImpl.a(this.a, false, this.b), this.c, this.b)).a();
        } catch (Throwable th) {
            StatServiceImpl.q.e(th);
            StatServiceImpl.a(this.a, th);
        }
    }
}
