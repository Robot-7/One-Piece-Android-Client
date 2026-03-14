package com.tencent.stat;

import java.lang.Thread;

/* JADX INFO: loaded from: classes.dex */
class an implements Thread.UncaughtExceptionHandler {
    an() {
    }

    @Override // java.lang.Thread.UncaughtExceptionHandler
    public void uncaughtException(Thread thread, Throwable th) {
        if (!StatConfig.isEnableStatService() || StatServiceImpl.t == null) {
            return;
        }
        if (StatConfig.isAutoExceptionCaught()) {
            au.a(StatServiceImpl.t).a((com.tencent.stat.a.e) new com.tencent.stat.a.d(StatServiceImpl.t, StatServiceImpl.a(StatServiceImpl.t, false, (StatSpecifyReportedInfo) null), 2, th, thread, null), (StatDispatchCallback) null, false, true);
            StatServiceImpl.q.debug("MTA has caught the following uncaught exception:");
            StatServiceImpl.q.error(th);
        }
        StatServiceImpl.flushDataToDB(StatServiceImpl.t);
        if (StatServiceImpl.r != null) {
            StatServiceImpl.q.d("Call the original uncaught exception handler.");
            if (StatServiceImpl.r instanceof an) {
                return;
            }
            StatServiceImpl.r.uncaughtException(thread, th);
        }
    }
}
