package com.tencent.wxop.stat;

import android.content.Context;

/* JADX INFO: loaded from: classes.dex */
final class l implements Runnable {
    final /* synthetic */ String b;
    final /* synthetic */ g bM;
    final /* synthetic */ Context e;

    l(Context context, String str, g gVar) {
        this.e = context;
        this.b = str;
        this.bM = gVar;
    }

    @Override // java.lang.Runnable
    public final void run() {
        Long l;
        try {
            f.p(this.e);
            synchronized (f.aT) {
                l = (Long) f.aT.remove(this.b);
            }
            if (l == null) {
                f.aV.d("Starttime for PageID:" + this.b + " not found, lost onResume()?");
                return;
            }
            Long lValueOf = Long.valueOf((System.currentTimeMillis() - l.longValue()) / 1000);
            if (lValueOf.longValue() <= 0) {
                lValueOf = 1L;
            }
            String str = f.aS;
            if (str != null && str.equals(this.b)) {
                str = "-";
            }
            com.tencent.wxop.stat.a.h hVar = new com.tencent.wxop.stat.a.h(this.e, str, this.b, f.a(this.e, false, this.bM), lValueOf, this.bM);
            if (!this.b.equals(f.aR)) {
                f.aV.warn("Invalid invocation since previous onResume on diff page.");
            }
            new q(hVar).ah();
            String unused = f.aS = this.b;
        } catch (Throwable th) {
            f.aV.b(th);
            f.a(this.e, th);
        }
    }
}
