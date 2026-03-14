package com.tencent.stat;

import android.content.Context;

/* JADX INFO: loaded from: classes.dex */
final class r implements Runnable {
    final /* synthetic */ Context a;
    final /* synthetic */ StatSpecifyReportedInfo b;
    final /* synthetic */ com.tencent.stat.a.c c;

    r(Context context, StatSpecifyReportedInfo statSpecifyReportedInfo, com.tencent.stat.a.c cVar) {
        this.a = context;
        this.b = statSpecifyReportedInfo;
        this.c = cVar;
    }

    @Override // java.lang.Runnable
    public void run() {
        try {
            com.tencent.stat.a.b bVar = new com.tencent.stat.a.b(this.a, StatServiceImpl.a(this.a, false, this.b), this.c.a, this.b);
            bVar.b().b = this.c.b;
            new aq(bVar).a();
        } catch (Throwable th) {
            StatServiceImpl.q.e(th);
            StatServiceImpl.a(this.a, th);
        }
    }
}
