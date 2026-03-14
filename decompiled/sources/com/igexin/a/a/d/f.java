package com.igexin.a.a.d;

import java.util.HashMap;
import java.util.concurrent.BlockingQueue;
import java.util.concurrent.SynchronousQueue;
import java.util.concurrent.ThreadFactory;
import java.util.concurrent.TimeUnit;
import java.util.concurrent.locks.ReentrantLock;

/* JADX INFO: loaded from: classes.dex */
final class f {
    volatile int g;
    final /* synthetic */ e i;
    final ReentrantLock c = new ReentrantLock();
    final BlockingQueue a = new SynchronousQueue();
    final HashMap b = new HashMap();
    volatile long e = TimeUnit.SECONDS.toNanos(60);
    volatile int f = 0;
    ThreadFactory d = new h(this);
    volatile int h = Integer.MAX_VALUE;

    public f(e eVar) {
        this.i = eVar;
    }

    final d a() {
        d dVar;
        while (true) {
            try {
                dVar = this.g > this.f ? (d) this.a.poll(this.e, TimeUnit.NANOSECONDS) : (d) this.a.take();
            } catch (InterruptedException e) {
            }
            if (dVar != null) {
                return dVar;
            }
            if (this.a.isEmpty()) {
                return null;
            }
        }
    }

    final void a(d dVar) {
        if (dVar == null) {
            throw new NullPointerException();
        }
        if (dVar.L != 0) {
            ReentrantLock reentrantLock = this.c;
            reentrantLock.lock();
            try {
                g gVar = (g) this.b.get(Integer.valueOf(dVar.L));
                if (gVar != null) {
                    gVar.a.offer(dVar);
                    return;
                }
            } finally {
                reentrantLock.unlock();
            }
        }
        b(dVar);
    }

    final boolean a(g gVar) {
        ReentrantLock reentrantLock = this.c;
        reentrantLock.lock();
        try {
            int i = this.g - 1;
            this.g = i;
            if (i == 0 && !this.a.isEmpty()) {
                Thread threadF = f(null);
                if (threadF != null) {
                    threadF.start();
                }
            } else if (!gVar.a.isEmpty()) {
                return true;
            }
            this.b.remove(Integer.valueOf(gVar.d));
            return false;
        } finally {
            reentrantLock.unlock();
        }
    }

    final void b(d dVar) {
        if (this.g >= this.f || !c(dVar)) {
            if (!this.a.offer(dVar)) {
                if (!d(dVar)) {
                }
            } else if (this.g == 0) {
                e(dVar);
            }
        }
    }

    final boolean c(d dVar) {
        ReentrantLock reentrantLock = this.c;
        reentrantLock.lock();
        try {
            Thread threadF = this.g < this.f ? f(dVar) : null;
            if (threadF == null) {
                return false;
            }
            threadF.start();
            return true;
        } finally {
            reentrantLock.unlock();
        }
    }

    final boolean d(d dVar) {
        ReentrantLock reentrantLock = this.c;
        reentrantLock.lock();
        try {
            Thread threadF = this.g < this.h ? f(dVar) : null;
            if (threadF == null) {
                return false;
            }
            threadF.start();
            return true;
        } finally {
            reentrantLock.unlock();
        }
    }

    final void e(d dVar) {
        Thread threadF = null;
        ReentrantLock reentrantLock = this.c;
        reentrantLock.lock();
        try {
            if (this.g < Math.max(this.f, 1) && !this.a.isEmpty()) {
                threadF = f(null);
            }
            if (threadF != null) {
                threadF.start();
            }
        } finally {
            reentrantLock.unlock();
        }
    }

    final Thread f(d dVar) {
        g gVar = new g(this, dVar);
        if (dVar != null && dVar.L != 0) {
            this.b.put(Integer.valueOf(dVar.L), gVar);
        }
        Thread threadNewThread = this.d.newThread(gVar);
        if (threadNewThread != null) {
            this.g++;
        }
        return threadNewThread;
    }
}
