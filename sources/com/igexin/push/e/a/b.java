package com.igexin.push.e.a;

import java.io.InputStream;

/* JADX INFO: loaded from: classes.dex */
public abstract class b extends com.igexin.a.a.d.a {
    String e;
    byte[] f;
    InputStream g;
    long h;
    public boolean i;

    public b(String str) {
        this.e = str;
    }

    public void a(Exception exc) {
    }

    public void a(byte[] bArr) {
        this.i = false;
        if (bArr != null && bArr.length >= 7 && bArr[5] == 111 && bArr[6] == 107) {
            this.i = true;
        }
    }

    public void b(byte[] bArr) {
        this.f = bArr;
    }

    public String c() {
        return this.e;
    }

    public byte[] d() {
        return this.f;
    }

    public InputStream e() {
        return this.g;
    }

    public long f() {
        return this.h;
    }
}
