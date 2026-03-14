package com.igexin.a.a.d;

import android.os.PowerManager;
import java.util.concurrent.BlockingQueue;
import java.util.concurrent.LinkedBlockingQueue;
import java.util.concurrent.TimeUnit;
import java.util.concurrent.locks.ReentrantLock;

/* JADX INFO: loaded from: classes.dex */
final class g implements Runnable {
    final BlockingQueue a = new LinkedBlockingQueue();
    d b;
    d c;
    volatile int d;
    PowerManager.WakeLock e;
    final /* synthetic */ f f;

    public g(f fVar, d dVar) {
        this.f = fVar;
        this.b = dVar;
        this.e = fVar.i.p.newWakeLock(1, toString());
        this.e.setReferenceCounted(false);
    }

    public final void a() {
        this.a.clear();
        this.c = null;
        this.e = null;
    }

    public final void a(d dVar) {
        dVar.a(this.e);
        if (this.d == 0) {
            this.d = dVar.L;
        }
        boolean z = true;
        while (z) {
            if (dVar.U) {
                this.e.acquire();
            }
            try {
                try {
                    dVar.a_();
                    dVar.s();
                    dVar.u();
                } catch (Exception e) {
                    dVar.F = true;
                    dVar.N = e;
                    dVar.v();
                    dVar.o();
                    this.f.i.a(dVar);
                    this.f.i.g();
                    if (dVar.U) {
                        this.e.release();
                    }
                    if (!dVar.F) {
                        dVar.c();
                    }
                    if (dVar.x || !dVar.A) {
                    }
                }
            } finally {
                if (dVar.U) {
                    this.e.release();
                }
                if (!dVar.F) {
                    dVar.c();
                }
                if (dVar.x || !dVar.A) {
                }
            }
            z = false;
            dVar = null;
        }
    }

    final d b() {
        while (this.d != 0) {
            try {
                d dVar = (d) this.a.poll(this.f.e, TimeUnit.NANOSECONDS);
                if (dVar != null) {
                    return dVar;
                }
                if (this.a.isEmpty()) {
                    ReentrantLock reentrantLock = this.f.c;
                    reentrantLock.lock();
                    try {
                        if (this.a.isEmpty()) {
                            this.f.b.remove(Integer.valueOf(this.d));
                            this.c.e();
                            this.d = 0;
                            reentrantLock.unlock();
                            return null;
                        }
                    } finally {
                        reentrantLock.unlock();
                    }
                } else {
                    continue;
                }
            } catch (InterruptedException e) {
            }
        }
        return null;
    }

    @Override // java.lang.Runnable
    public final void run() {
        boolean zA = true;
        while (zA) {
            try {
                d dVarB = this.b;
                this.b = null;
                while (true) {
                    if (dVarB == null) {
                        dVarB = b();
                        if (dVarB == null && (dVarB = this.f.a()) == null) {
                            break;
                        }
                    }
                    this.c = null;
                    a(dVarB);
                    this.c = dVarB;
                    dVarB = null;
                }
                zA = this.f.a(this);
                if (!zA) {
                    a();
                }
            } catch (Exception e) {
                zA = this.f.a(this);
                if (!zA) {
                    a();
                }
            } catch (Throwable th) {
                if (!this.f.a(this)) {
                    a();
                }
                throw th;
            }
        }
    }
}
