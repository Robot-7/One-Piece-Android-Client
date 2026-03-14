package com.igexin.a.a.d;

import java.util.concurrent.ThreadFactory;
import java.util.concurrent.atomic.AtomicInteger;

/* JADX INFO: loaded from: classes.dex */
final class h implements ThreadFactory {
    final AtomicInteger a = new AtomicInteger(0);
    final /* synthetic */ f b;

    public h(f fVar) {
        this.b = fVar;
    }

    @Override // java.util.concurrent.ThreadFactory
    public Thread newThread(Runnable runnable) {
        return new Thread(runnable, "TaskService-pool-" + this.a.incrementAndGet());
    }
}
