package com.igexin.push.c.c;

/* JADX INFO: loaded from: classes.dex */
public class b {
    public int a;
    public byte b;
    public byte c;
    public byte[] d;

    public void a(byte[] bArr) {
        if (bArr == null) {
            this.a = 0;
        } else {
            this.d = bArr;
            this.a = bArr.length;
        }
    }

    public byte[] a() {
        if (this.d == null) {
            return null;
        }
        byte[] bArr = new byte[this.a + 3];
        com.igexin.a.a.b.g.b(this.a, bArr, 0);
        com.igexin.a.a.b.g.c(this.b, bArr, 2);
        com.igexin.a.a.b.g.a(this.d, 0, bArr, 3, this.d.length);
        return bArr;
    }
}
