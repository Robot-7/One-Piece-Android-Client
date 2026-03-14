package com.tencent.stat;

import android.content.Context;

/* JADX INFO: loaded from: classes.dex */
final class al implements Runnable {
    final /* synthetic */ StatGameUser a;
    final /* synthetic */ Context b;
    final /* synthetic */ StatSpecifyReportedInfo c;

    al(StatGameUser statGameUser, Context context, StatSpecifyReportedInfo statSpecifyReportedInfo) {
        this.a = statGameUser;
        this.b = context;
        this.c = statSpecifyReportedInfo;
    }

    @Override // java.lang.Runnable
    public void run() {
        if (this.a == null) {
            StatServiceImpl.q.error("The gameUser of StatService.reportGameUser() can not be null!");
            return;
        }
        if (this.a.getAccount() == null || this.a.getAccount().length() == 0) {
            StatServiceImpl.q.error("The account of gameUser on StatService.reportGameUser() can not be null or empty!");
            return;
        }
        try {
            new aq(new com.tencent.stat.a.g(this.b, StatServiceImpl.a(this.b, false, this.c), this.a, this.c)).a();
        } catch (Throwable th) {
            StatServiceImpl.q.e(th);
            StatServiceImpl.a(this.b, th);
        }
    }
}
