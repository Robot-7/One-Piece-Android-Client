package com.igexin.a.a.d;

import java.util.Comparator;
import java.util.NoSuchElementException;
import java.util.TreeSet;
import java.util.concurrent.TimeUnit;
import java.util.concurrent.atomic.AtomicInteger;
import java.util.concurrent.atomic.AtomicLong;
import java.util.concurrent.locks.Condition;
import java.util.concurrent.locks.ReentrantLock;

/* JADX INFO: loaded from: classes.dex */
public class c {
    static final /* synthetic */ boolean h;
    final TreeSet c;
    int e;
    e f;
    final transient ReentrantLock a = new ReentrantLock();
    final transient Condition b = this.a.newCondition();
    final AtomicInteger d = new AtomicInteger(0);
    public final AtomicLong g = new AtomicLong(-1);

    static {
        h = !c.class.desiredAssertionStatus();
    }

    public c(Comparator comparator, e eVar) {
        this.c = new TreeSet(comparator);
        this.f = eVar;
    }

    private d e() {
        d dVarA = a();
        if (dVarA != null && this.c.remove(dVarA)) {
            return dVarA;
        }
        return null;
    }

    public final int a(d dVar, long j, TimeUnit timeUnit) {
        ReentrantLock reentrantLock = this.a;
        reentrantLock.lock();
        try {
            if (!this.c.contains(dVar)) {
                return -1;
            }
            this.c.remove(dVar);
            dVar.G = System.currentTimeMillis() + TimeUnit.MILLISECONDS.convert(j, timeUnit);
            return a(dVar) ? 1 : -2;
        } finally {
            reentrantLock.unlock();
        }
    }

    d a() {
        try {
            return (d) this.c.first();
        } catch (NoSuchElementException e) {
            return null;
        }
    }

    public final boolean a(d dVar) {
        if (dVar == null) {
            return false;
        }
        ReentrantLock reentrantLock = this.a;
        reentrantLock.lock();
        try {
            d dVarA = a();
            int i = this.e + 1;
            this.e = i;
            dVar.H = i;
            if (!this.c.add(dVar)) {
                dVar.H--;
                return false;
            }
            dVar.m();
            if (dVarA == null || this.c.comparator().compare(dVar, dVarA) < 0) {
                this.b.signalAll();
            }
            return true;
        } catch (Exception e) {
            com.igexin.a.a.c.a.a("ScheduleQueue|offer|error");
            return false;
        } finally {
            reentrantLock.unlock();
        }
    }

    final boolean b() {
        ReentrantLock reentrantLock = this.a;
        reentrantLock.lock();
        try {
            return this.c.isEmpty();
        } finally {
            reentrantLock.unlock();
        }
    }

    public final d c() throws InterruptedException {
        ReentrantLock reentrantLock = this.a;
        reentrantLock.lockInterruptibly();
        while (true) {
            try {
                d dVarA = a();
                if (dVarA == null) {
                    this.d.set(1);
                    this.e = 0;
                    this.b.await();
                } else {
                    long jA = dVarA.a(TimeUnit.NANOSECONDS);
                    boolean z = dVarA.x || dVarA.y;
                    if (jA <= 0 || z) {
                        break;
                    }
                    this.g.set(dVarA.G);
                    if (this.f.y) {
                        this.f.a(dVarA.G);
                    }
                    this.b.awaitNanos(jA);
                }
            } finally {
                reentrantLock.unlock();
            }
        }
        d dVarE = e();
        if (!h && dVarE == null) {
            throw new AssertionError();
        }
        if (!b()) {
            this.b.signalAll();
        }
        this.g.set(-1L);
        return dVarE;
    }

    public final void d() {
        this.c.clear();
    }
}
