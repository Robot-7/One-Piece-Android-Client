package com.tencent.stat;

import android.content.Context;

/* JADX INFO: loaded from: classes.dex */
final class ak implements Runnable {
    final /* synthetic */ StatAccount a;
    final /* synthetic */ Context b;
    final /* synthetic */ StatSpecifyReportedInfo c;

    ak(StatAccount statAccount, Context context, StatSpecifyReportedInfo statSpecifyReportedInfo) {
        this.a = statAccount;
        this.b = context;
        this.c = statSpecifyReportedInfo;
    }

    @Override // java.lang.Runnable
    public void run() {
        if (this.a == null || this.a.getAccount().trim().length() == 0) {
            StatServiceImpl.q.w("account is null or empty.");
        } else {
            StatConfig.setQQ(this.b, this.a.getAccount());
            StatServiceImpl.b(this.b, this.a, this.c);
        }
    }
}
