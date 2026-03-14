package com.tencent.stat;

import android.content.Context;

/* JADX INFO: loaded from: classes.dex */
final class l implements Runnable {
    final /* synthetic */ Context a;

    l(Context context) {
        this.a = context;
    }

    @Override // java.lang.Runnable
    public void run() {
        if (this.a == null) {
            StatServiceImpl.q.error("The Context of StatService.onStop() can not be null!");
            return;
        }
        StatServiceImpl.flushDataToDB(this.a);
        if (StatServiceImpl.a()) {
            return;
        }
        try {
            Thread.sleep(100L);
        } catch (InterruptedException e) {
            e.printStackTrace();
        }
        if (com.tencent.stat.common.k.C(this.a)) {
            if (StatConfig.isDebugEnable()) {
                StatServiceImpl.q.i("onStop isBackgroundRunning flushDataToDB");
            }
            StatServiceImpl.commitEvents(this.a, -1);
        }
    }
}
