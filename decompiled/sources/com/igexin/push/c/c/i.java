package com.igexin.push.c.c;

import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.util.Iterator;
import java.util.List;
import org.codehaus.jackson.smile.SmileConstants;

/* JADX INFO: loaded from: classes.dex */
public class i extends e {
    public long a;
    public byte b;
    public int c;
    public List d;

    public i() {
        this.i = 4;
        this.j = SmileConstants.TOKEN_KEY_LONG_STRING;
    }

    @Override // com.igexin.push.c.c.e
    public void a(byte[] bArr) {
        this.a = com.igexin.a.a.b.g.d(bArr, 0);
        this.b = bArr[8];
        this.c = com.igexin.a.a.b.g.c(bArr, 8) & 16777215;
    }

    @Override // com.igexin.push.c.c.e
    public byte[] d() {
        byte[] bArr;
        int length;
        int i;
        byte[] byteArray;
        byte[] bArr2 = null;
        if (this.d == null || this.d.size() <= 0) {
            bArr = null;
        } else {
            ByteArrayOutputStream byteArrayOutputStream = new ByteArrayOutputStream();
            Iterator it = this.d.iterator();
            while (it.hasNext()) {
                try {
                    byteArrayOutputStream.write(((j) it.next()).d());
                    byteArray = byteArrayOutputStream.toByteArray();
                } catch (IOException e) {
                    byteArray = bArr2;
                }
                bArr2 = byteArray;
            }
            if (byteArrayOutputStream != null) {
                try {
                    byteArrayOutputStream.close();
                    bArr = bArr2;
                } catch (IOException e2) {
                    bArr = bArr2;
                }
            } else {
                bArr = bArr2;
            }
        }
        if (bArr != null) {
            length = bArr.length;
            i = length + 1;
        } else {
            length = 0;
            i = 0;
        }
        byte[] bArr3 = new byte[i + 12];
        int iA = com.igexin.a.a.b.g.a(this.a, bArr3, 0);
        int iA2 = iA + com.igexin.a.a.b.g.a(((this.b & 255) << 24) | this.c, bArr3, iA);
        if (length > 0) {
            int iC = iA2 + com.igexin.a.a.b.g.c(length, bArr3, iA2);
            int iA3 = com.igexin.a.a.b.g.a(bArr, 0, bArr3, iC, length) + iC;
        }
        return bArr3;
    }
}
