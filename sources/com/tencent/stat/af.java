package com.tencent.stat;

import android.content.Context;

/* JADX INFO: loaded from: classes.dex */
final class af implements Runnable {
    final /* synthetic */ Context a;
    final /* synthetic */ String b;
    final /* synthetic */ StatSpecifyReportedInfo c;

    af(Context context, String str, StatSpecifyReportedInfo statSpecifyReportedInfo) {
        this.a = context;
        this.b = str;
        this.c = statSpecifyReportedInfo;
    }

    @Override // java.lang.Runnable
    public void run() {
        Long l;
        try {
            StatServiceImpl.flushDataToDB(this.a);
            synchronized (StatServiceImpl.o) {
                l = (Long) StatServiceImpl.o.remove(this.b);
            }
            if (l == null) {
                StatServiceImpl.q.e("Starttime for PageID:" + this.b + " not found, lost onResume()?");
                return;
            }
            Long lValueOf = Long.valueOf((System.currentTimeMillis() - l.longValue()) / 1000);
            if (lValueOf.longValue() <= 0) {
                lValueOf = 1L;
            }
            String str = StatServiceImpl.n;
            if (str != null && str.equals(this.b)) {
                str = "-";
            }
            com.tencent.stat.a.k kVar = new com.tencent.stat.a.k(this.a, str, this.b, StatServiceImpl.a(this.a, false, this.c), lValueOf, this.c);
            if (!this.b.equals(StatServiceImpl.m)) {
                StatServiceImpl.q.warn("Invalid invocation since previous onResume on diff page.");
            }
            new aq(kVar).a();
            String unused = StatServiceImpl.n = this.b;
        } catch (Throwable th) {
            StatServiceImpl.q.e(th);
            StatServiceImpl.a(this.a, th);
        }
    }
}
