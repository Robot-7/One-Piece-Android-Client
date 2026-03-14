package com.igexin.push.c.c;

import org.codehaus.jackson.smile.SmileConstants;

/* JADX INFO: loaded from: classes.dex */
public class l extends e {
    public long a;

    public l() {
        this.i = 36;
        this.j = SmileConstants.TOKEN_KEY_LONG_STRING;
    }

    @Override // com.igexin.push.c.c.e
    public void a(byte[] bArr) {
        this.a = com.igexin.a.a.b.g.d(bArr, 0);
    }

    @Override // com.igexin.push.c.c.e
    public byte[] d() {
        byte[] bArr = new byte[8];
        com.igexin.a.a.b.g.a(this.a, bArr, 0);
        return bArr;
    }
}
