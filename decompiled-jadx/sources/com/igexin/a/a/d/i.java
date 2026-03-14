package com.igexin.a.a.d;

import android.os.Process;

/* JADX INFO: loaded from: classes.dex */
final class i extends Thread {
    volatile boolean a = true;
    f b;
    final /* synthetic */ e c;

    public i(e eVar) {
        this.c = eVar;
        setName("taskService-processor");
    }

    @Override // java.lang.Thread, java.lang.Runnable
    public final void run() {
        Process.setThreadPriority(-2);
        c cVar = this.c.m;
        byte b = 1;
        d dVarC = null;
        while (this.a) {
            switch (b) {
                case -1:
                    try {
                        dVarC.d();
                    } catch (Exception e) {
                        b = 1;
                    }
                    if (dVarC.p()) {
                        if (this.b == null) {
                            this.b = new f(this.c);
                        }
                        this.b.a(dVarC);
                        b = 1;
                        dVarC = null;
                        break;
                    }
                case 0:
                    try {
                        try {
                            dVarC.a_();
                            dVarC.s();
                            dVarC.u();
                            this.c.h();
                            if (!dVarC.F) {
                                dVarC.c();
                            }
                            if (!dVarC.x && !dVarC.B) {
                                dVarC.M = 0;
                                cVar.a(dVarC);
                            }
                            b = 1;
                            dVarC = null;
                        } catch (Exception e2) {
                            dVarC.F = true;
                            dVarC.N = e2;
                            dVarC.v();
                            dVarC.o();
                            this.c.l.offer(dVarC);
                            this.c.h();
                            if (!dVarC.F) {
                                dVarC.c();
                            }
                            if (!dVarC.x && !dVarC.B) {
                                dVarC.M = 0;
                                cVar.a(dVarC);
                            }
                            b = 1;
                            dVarC = null;
                        }
                        break;
                    } catch (Throwable th) {
                        this.c.h();
                        if (!dVarC.F) {
                            dVarC.c();
                        }
                        if (!dVarC.x && !dVarC.B) {
                            dVarC.M = 0;
                            cVar.a(dVarC);
                        }
                        throw th;
                    }
                case 1:
                    try {
                        dVarC = cVar.c();
                        break;
                    } catch (InterruptedException e3) {
                    }
                    if (dVarC == null) {
                        this.c.h();
                        dVarC = dVarC;
                        b = 1;
                    } else if (dVarC.x || dVarC.y) {
                        dVarC = null;
                    } else {
                        b = -1;
                    }
                    break;
                case 2:
                    this.c.h();
                    dVarC = dVarC;
                    b = 1;
                    break;
            }
        }
        cVar.d();
    }
}
