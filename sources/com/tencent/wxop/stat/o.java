package com.tencent.wxop.stat;

import java.lang.Thread;

/* JADX INFO: loaded from: classes.dex */
final class o implements Thread.UncaughtExceptionHandler {
    o() {
    }

    @Override // java.lang.Thread.UncaughtExceptionHandler
    public final void uncaughtException(Thread thread, Throwable th) {
        if (!c.l() || f.aY == null) {
            return;
        }
        if (c.x()) {
            u.s(f.aY).b(new com.tencent.wxop.stat.a.c(f.aY, f.a(f.aY, false, (g) null), th, thread), null, false, true);
            f.aV.debug("MTA has caught the following uncaught exception:");
            f.aV.a(th);
        }
        f.p(f.aY);
        if (f.aW != null) {
            f.aV.e("Call the original uncaught exception handler.");
            if (f.aW instanceof o) {
                return;
            }
            f.aW.uncaughtException(thread, th);
        }
    }
}
