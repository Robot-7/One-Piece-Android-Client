package com.tencent.stat;

import android.content.Context;

/* JADX INFO: loaded from: classes.dex */
final class aj implements Runnable {
    final /* synthetic */ String a;
    final /* synthetic */ Context b;
    final /* synthetic */ StatSpecifyReportedInfo c;

    aj(String str, Context context, StatSpecifyReportedInfo statSpecifyReportedInfo) {
        this.a = str;
        this.b = context;
        this.c = statSpecifyReportedInfo;
    }

    @Override // java.lang.Runnable
    public void run() {
        if (this.a == null || this.a.trim().length() == 0) {
            StatServiceImpl.q.w("qq num is null or empty.");
        } else {
            StatConfig.f = this.a;
            StatServiceImpl.b(this.b, new StatAccount(this.a), this.c);
        }
    }
}
