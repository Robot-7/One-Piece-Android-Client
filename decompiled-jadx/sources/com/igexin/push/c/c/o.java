package com.igexin.push.c.c;

import com.tencent.stat.common.StatConstants;

/* JADX INFO: loaded from: classes.dex */
public class o extends e {
    public long a;
    public String b = StatConstants.MTA_COOPERATION_TAG;

    public o() {
        this.i = 9;
    }

    @Override // com.igexin.push.c.c.e
    public void a(byte[] bArr) {
        this.a = com.igexin.a.a.b.g.d(bArr, 0);
        if (bArr.length > 8) {
            int i = bArr[8] & 255;
            try {
                this.b = new String(bArr, 9, i, "UTF-8");
            } catch (Exception e) {
                this.b = StatConstants.MTA_COOPERATION_TAG;
            }
            int i2 = i + 9;
        }
    }

    @Override // com.igexin.push.c.c.e
    public byte[] d() {
        byte[] bArr = new byte[8];
        com.igexin.a.a.b.g.a(this.a, bArr, 0);
        return bArr;
    }
}
