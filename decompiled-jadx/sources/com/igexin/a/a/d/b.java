package com.igexin.a.a.d;

import java.util.concurrent.TimeUnit;

/* JADX INFO: loaded from: classes.dex */
public abstract class b implements com.igexin.a.a.d.a.g {
    protected boolean a = true;

    public void a() {
        this.a = false;
    }

    @Override // com.igexin.a.a.d.a.g
    public boolean a(long j, d dVar) {
        return TimeUnit.SECONDS.toMillis((long) dVar.K) < j - dVar.I;
    }

    @Override // com.igexin.a.a.d.a.g
    public long b(long j, d dVar) {
        return (TimeUnit.SECONDS.toMillis(dVar.K) + dVar.I) - j;
    }

    @Override // com.igexin.a.a.d.a.g
    public boolean b() {
        return this.a;
    }
}
