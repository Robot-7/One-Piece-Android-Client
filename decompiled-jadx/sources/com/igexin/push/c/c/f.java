package com.igexin.push.c.c;

import com.tencent.stat.common.StatConstants;
import java.io.UnsupportedEncodingException;
import org.codehaus.jackson.smile.SmileConstants;

/* JADX INFO: loaded from: classes.dex */
public class f extends e {
    String a;
    String b;
    String c;
    String d;

    public f() {
        this.i = 6;
        this.j = SmileConstants.TOKEN_KEY_LONG_STRING;
        this.a = StatConstants.MTA_COOPERATION_TAG;
        this.b = StatConstants.MTA_COOPERATION_TAG;
        this.c = StatConstants.MTA_COOPERATION_TAG;
        this.d = StatConstants.MTA_COOPERATION_TAG;
    }

    public f(String str, String str2, String str3, String str4) {
        this.i = 6;
        this.j = SmileConstants.TOKEN_KEY_LONG_STRING;
        this.a = str == null ? StatConstants.MTA_COOPERATION_TAG : str;
        this.b = str2 == null ? StatConstants.MTA_COOPERATION_TAG : str2;
        this.c = str3 == null ? StatConstants.MTA_COOPERATION_TAG : str3;
        this.d = str4 == null ? StatConstants.MTA_COOPERATION_TAG : str4;
    }

    public String a() {
        return this.c;
    }

    @Override // com.igexin.push.c.c.e
    public void a(byte[] bArr) {
        try {
            int iA = com.igexin.a.a.b.g.a(bArr, 0);
            this.a = new String(bArr, 1, iA, "utf-8");
            int i = iA + 1;
            int iA2 = com.igexin.a.a.b.g.a(bArr, i);
            int i2 = i + 1;
            this.b = new String(bArr, i2, iA2, "utf-8");
            int i3 = i2 + iA2;
            int iA3 = com.igexin.a.a.b.g.a(bArr, i3);
            int i4 = i3 + 1;
            this.c = new String(bArr, i4, iA3, "utf-8");
            int i5 = i4 + iA3;
            int iA4 = com.igexin.a.a.b.g.a(bArr, i5);
            int i6 = i5 + 1;
            this.d = new String(bArr, i6, iA4, "utf-8");
            int i7 = i6 + iA4;
        } catch (UnsupportedEncodingException e) {
        }
    }

    @Override // com.igexin.push.c.c.e
    public byte[] d() {
        byte[] bytes = this.b.getBytes();
        byte[] bytes2 = this.a.getBytes();
        byte[] bytes3 = this.c.getBytes();
        byte[] bytes4 = this.d.getBytes();
        byte[] bArr = new byte[bytes.length + bytes2.length + bytes3.length + bytes4.length + 4];
        com.igexin.a.a.b.g.c(bytes.length, bArr, 0);
        System.arraycopy(bytes, 0, bArr, 1, bytes.length);
        int length = bytes.length + 1;
        int i = length + 1;
        com.igexin.a.a.b.g.c(bytes2.length, bArr, length);
        System.arraycopy(bytes2, 0, bArr, i, bytes2.length);
        int length2 = bytes2.length + i;
        int i2 = length2 + 1;
        com.igexin.a.a.b.g.c(bytes3.length, bArr, length2);
        System.arraycopy(bytes3, 0, bArr, i2, bytes3.length);
        int length3 = bytes3.length + i2;
        int i3 = length3 + 1;
        com.igexin.a.a.b.g.c(bytes4.length, bArr, length3);
        System.arraycopy(bytes4, 0, bArr, i3, bytes4.length);
        int length4 = bytes4.length + i3;
        return bArr;
    }
}
