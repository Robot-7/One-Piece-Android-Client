package com.igexin.push.c.c;

/* JADX INFO: loaded from: classes.dex */
public class j extends e {
    public byte a;
    public Object b;

    @Override // com.igexin.push.c.c.e
    public void a(byte[] bArr) {
    }

    @Override // com.igexin.push.c.c.e
    public byte[] d() {
        byte[] bytes = null;
        if (this.a == 1) {
            bytes = ((String) this.b).getBytes();
        } else if (this.a != 2 && this.a != 3 && this.a == 4) {
            bytes = ((String) this.b).getBytes();
        }
        byte[] bArr = new byte[bytes.length + 2];
        bArr[0] = this.a;
        bArr[1] = (byte) bytes.length;
        System.arraycopy(bytes, 0, bArr, 2, bytes.length);
        return bArr;
    }
}
