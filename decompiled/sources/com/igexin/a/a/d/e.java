package com.igexin.a.a.d;

import android.app.AlarmManager;
import android.app.PendingIntent;
import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.Intent;
import android.content.IntentFilter;
import android.os.PowerManager;
import java.text.SimpleDateFormat;
import java.util.Comparator;
import java.util.Date;
import java.util.HashMap;
import java.util.concurrent.ConcurrentLinkedQueue;
import java.util.concurrent.TimeUnit;
import java.util.concurrent.locks.ReentrantLock;

/* JADX INFO: loaded from: classes.dex */
public class e extends BroadcastReceiver implements Comparator {
    public static final String i = e.class.getSimpleName();
    public static final long z = TimeUnit.SECONDS.toMillis(2);
    PowerManager p;
    AlarmManager q;
    Intent r;
    PendingIntent s;
    Intent t;
    PendingIntent u;
    Intent v;
    PendingIntent w;
    String x;
    volatile boolean y;
    public String h = getClass().getSimpleName();
    final ReentrantLock n = new ReentrantLock();
    final ReentrantLock o = new ReentrantLock();
    private boolean a = false;
    final HashMap k = new HashMap(7);
    final c m = new c(this, this);
    final ConcurrentLinkedQueue l = new ConcurrentLinkedQueue();
    final i j = new i(this);

    protected e() {
        d.Q = this;
    }

    @Override // java.util.Comparator
    /* JADX INFO: renamed from: a, reason: merged with bridge method [inline-methods] */
    public final int compare(d dVar, d dVar2) {
        int i2 = dVar.M > dVar2.M ? -1 : dVar.M < dVar2.M ? 1 : dVar.H < dVar2.H ? -1 : dVar.H > dVar2.H ? 1 : 0;
        if (dVar.G != dVar2.G) {
            i2 = dVar.G < dVar2.G ? -1 : 1;
        }
        return i2 == 0 ? dVar.hashCode() - dVar2.hashCode() : i2;
    }

    public final void a(long j) {
        if (this.y) {
            com.igexin.a.a.c.a.a("setalarm|" + new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date(j)));
            if (j < 0) {
                j = System.currentTimeMillis() + z;
            }
            if (this.s == null || this.u == null) {
                return;
            }
            this.q.set(0, j, this.s);
            this.q.set(0, z + j, this.u);
        }
    }

    public final void a(Context context) {
        if (this.a) {
            return;
        }
        this.p = (PowerManager) context.getSystemService("power");
        this.y = true;
        this.q = (AlarmManager) context.getSystemService("alarm");
        context.registerReceiver(this, new IntentFilter("AlarmTaskSchedule." + context.getPackageName()));
        context.registerReceiver(this, new IntentFilter("AlarmTaskScheduleBak." + context.getPackageName()));
        context.registerReceiver(this, new IntentFilter("android.intent.action.SCREEN_OFF"));
        context.registerReceiver(this, new IntentFilter("android.intent.action.SCREEN_ON"));
        this.x = "AlarmNioTaskSchedule." + context.getPackageName();
        context.registerReceiver(this, new IntentFilter(this.x));
        this.r = new Intent("AlarmTaskSchedule." + context.getPackageName());
        this.s = PendingIntent.getBroadcast(context, hashCode(), this.r, 134217728);
        this.t = new Intent("AlarmTaskScheduleBak." + context.getPackageName());
        this.u = PendingIntent.getBroadcast(context, hashCode() + 1, this.t, 134217728);
        this.v = new Intent(this.x);
        this.w = PendingIntent.getBroadcast(context, hashCode() + 2, this.v, 134217728);
        this.j.start();
        Thread.yield();
        this.a = true;
    }

    public final boolean a(com.igexin.a.a.d.a.c cVar) {
        if (cVar == null) {
            throw new NullPointerException();
        }
        ReentrantLock reentrantLock = this.n;
        if (!reentrantLock.tryLock()) {
            return false;
        }
        try {
            if (this.k.keySet().contains(Long.valueOf(cVar.m()))) {
                return false;
            }
            this.k.put(Long.valueOf(cVar.m()), cVar);
            return true;
        } finally {
            reentrantLock.unlock();
        }
    }

    final boolean a(com.igexin.a.a.d.a.f fVar, com.igexin.a.a.d.a.c cVar) {
        int iB = fVar.b();
        if (iB <= Integer.MIN_VALUE || iB >= 0) {
            if (iB < 0 || iB >= Integer.MAX_VALUE) {
                return false;
            }
            return cVar.a(fVar, this);
        }
        d dVar = (d) fVar;
        boolean zA = dVar.F ? cVar.a(dVar, this) : cVar.a(fVar, this);
        if (zA) {
            dVar.c();
        }
        return zA;
    }

    public final boolean a(d dVar, boolean z2) {
        if (dVar == null) {
            throw new NullPointerException();
        }
        if (dVar.B || dVar.x) {
            return false;
        }
        c cVar = this.m;
        dVar.M = z2 ? cVar.d.incrementAndGet() : 0;
        return cVar.a(dVar);
    }

    public final boolean a(d dVar, boolean z2, boolean z3) {
        boolean z4 = false;
        if (dVar == null) {
            throw new NullPointerException();
        }
        if (dVar.y) {
            return false;
        }
        if (!z2 || z3) {
            return a(dVar, z3 && z2);
        }
        dVar.d();
        try {
            try {
                dVar.a_();
                dVar.s();
                dVar.u();
                if (!dVar.F) {
                    dVar.c();
                }
                z4 = true;
            } catch (Exception e) {
                dVar.F = true;
                dVar.N = e;
                dVar.o();
                dVar.v();
                a(dVar);
                g();
                if (!dVar.F) {
                    dVar.c();
                }
            }
            return z4;
        } catch (Throwable th) {
            if (!dVar.F) {
                dVar.c();
            }
            throw th;
        }
    }

    public final boolean a(Object obj) {
        if (obj == null) {
            return false;
        }
        if (!(obj instanceof com.igexin.a.a.d.a.f)) {
            throw new ClassCastException("response Obj is not a TaskResult ");
        }
        com.igexin.a.a.d.a.f fVar = (com.igexin.a.a.d.a.f) obj;
        if (fVar.j()) {
            return false;
        }
        fVar.a(false);
        this.l.offer(fVar);
        return true;
    }

    public final void b(long j) {
        com.igexin.a.a.c.a.a("setnioalarm|" + new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date(j)));
        if (j < 0) {
            j = System.currentTimeMillis() + z;
        }
        if (this.w != null) {
            this.q.set(0, j, this.w);
        }
    }

    public final void f() {
        if (this.w != null) {
            this.q.cancel(this.w);
        }
    }

    protected final void g() {
        if (this.j == null || this.j.isInterrupted()) {
            return;
        }
        this.j.interrupt();
    }

    final void h() {
        int iB;
        int iB2;
        int iB3;
        while (!this.l.isEmpty()) {
            com.igexin.a.a.d.a.f fVar = (com.igexin.a.a.d.a.f) this.l.poll();
            fVar.a(true);
            boolean zA = false;
            ReentrantLock reentrantLock = this.n;
            reentrantLock.lock();
            try {
                if (!this.k.isEmpty()) {
                    long jK = fVar.k();
                    if (jK == 0) {
                        for (com.igexin.a.a.d.a.c cVar : this.k.values()) {
                            if (cVar.l() && (zA = a(fVar, cVar))) {
                                break;
                            }
                        }
                    } else {
                        com.igexin.a.a.d.a.c cVar2 = (com.igexin.a.a.d.a.c) this.k.get(Long.valueOf(jK));
                        zA = (cVar2 == null || !cVar2.l()) ? false : a(fVar, cVar2);
                    }
                }
                if (!zA && (iB3 = fVar.b()) > Integer.MIN_VALUE && iB3 < 0) {
                    ((d) fVar).c();
                }
                reentrantLock.unlock();
            } catch (Exception e) {
                if (0 == 0 && (iB2 = fVar.b()) > Integer.MIN_VALUE && iB2 < 0) {
                    ((d) fVar).c();
                }
                reentrantLock.unlock();
            } catch (Throwable th) {
                if (0 == 0 && (iB = fVar.b()) > Integer.MIN_VALUE && iB < 0) {
                    ((d) fVar).c();
                }
                reentrantLock.unlock();
                throw th;
            }
        }
    }

    @Override // android.content.BroadcastReceiver
    public final void onReceive(Context context, Intent intent) {
        if ("android.intent.action.SCREEN_OFF".equals(intent.getAction())) {
            this.y = true;
            com.igexin.a.a.c.a.a("screenoff");
            if (this.m.g.get() > 0) {
                a(this.m.g.get());
                return;
            }
            return;
        }
        if ("android.intent.action.SCREEN_ON".equals(intent.getAction())) {
            this.y = false;
            com.igexin.a.a.c.a.a("screenon");
            return;
        }
        if (intent.getAction().startsWith("AlarmTaskSchedule.") || intent.getAction().startsWith("AlarmTaskScheduleBak.")) {
            com.igexin.a.a.c.a.a("receivealarm|" + this.y);
            g();
        } else if (this.x.equals(intent.getAction())) {
            com.igexin.a.a.c.a.a("receivenioalarm");
            try {
                if (com.igexin.a.a.b.a.a.e.h() != null) {
                    com.igexin.a.a.b.a.a.e.h().i();
                }
            } catch (Exception e) {
            }
        }
    }
}
