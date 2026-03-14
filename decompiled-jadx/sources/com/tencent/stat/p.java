package com.tencent.stat;

import android.content.Context;

/* JADX INFO: loaded from: classes.dex */
final class p implements Runnable {
    final /* synthetic */ Throwable a;
    final /* synthetic */ Context b;
    final /* synthetic */ StatSpecifyReportedInfo c;

    p(Throwable th, Context context, StatSpecifyReportedInfo statSpecifyReportedInfo) {
        this.a = th;
        this.b = context;
        this.c = statSpecifyReportedInfo;
    }

    @Override // java.lang.Runnable
    public void run() {
        if (this.a == null) {
            StatServiceImpl.q.error("The Throwable error message of StatService.reportException() can not be null!");
        } else {
            new aq(new com.tencent.stat.a.d(this.b, StatServiceImpl.a(this.b, false, this.c), 1, this.a, this.c)).a();
        }
    }
}
