package com.tencent.stat;

import android.content.Context;

/* JADX INFO: loaded from: classes.dex */
final class o implements Runnable {
    final /* synthetic */ Context a;
    final /* synthetic */ Throwable b;

    o(Context context, Throwable th) {
        this.a = context;
        this.b = th;
    }

    @Override // java.lang.Runnable
    public void run() {
        try {
            if (StatConfig.isEnableStatService()) {
                new aq(new com.tencent.stat.a.d(this.a, StatServiceImpl.a(this.a, false, (StatSpecifyReportedInfo) null), 99, this.b, com.tencent.stat.a.i.a)).a();
            }
        } catch (Throwable th) {
            StatServiceImpl.q.e("reportSdkSelfException error: " + th);
        }
    }
}
