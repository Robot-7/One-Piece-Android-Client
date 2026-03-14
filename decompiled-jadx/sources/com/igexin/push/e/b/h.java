package com.igexin.push.e.b;

import java.util.concurrent.TimeUnit;

/* JADX INFO: loaded from: classes.dex */
public abstract class h extends com.igexin.a.a.d.d {
    long c;

    public h(long j) {
        this(0L, j);
    }

    public h(long j, long j2) {
        super(5);
        this.c = j > 0 ? j2 + (j - System.currentTimeMillis()) : j2;
        a(this.c, TimeUnit.MILLISECONDS);
    }

    protected abstract void a();

    @Override // com.igexin.a.a.d.d
    public final void a_() {
        super.a_();
        a();
    }

    @Override // com.igexin.a.a.d.d
    protected void e() {
    }
}
