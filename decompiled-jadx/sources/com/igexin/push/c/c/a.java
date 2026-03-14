package com.igexin.push.c.c;

import android.support.v4.view.MotionEventCompat;
import com.tencent.stat.common.StatConstants;
import org.codehaus.jackson.org.objectweb.asm.Opcodes;

/* JADX INFO: loaded from: classes.dex */
public class a extends e {
    public int a;
    public int b;
    public Object c;
    public String d;
    private int f = 0;
    private int g = 0;
    public String e = "UTF-8";

    public a() {
        this.i = 28;
    }

    public int a() {
        return this.f;
    }

    public void a(int i) {
        this.f = i;
    }

    @Override // com.igexin.push.c.c.e
    public void a(byte[] bArr) {
        int i;
        this.a = com.igexin.a.a.b.g.b(bArr, 0);
        this.b = bArr[2] & 192;
        this.e = a(bArr[2]);
        int i2 = 3;
        int i3 = 0;
        while (true) {
            i = i3 | (bArr[i2] & Opcodes.LAND);
            if ((bArr[i2] & 128) == 0) {
                break;
            }
            i3 = i << 7;
            i2++;
        }
        int i4 = i2 + 1;
        if (i > 0) {
            if (this.b == 192) {
                this.c = new byte[i];
                System.arraycopy(bArr, i4, this.c, 0, i);
            } else {
                try {
                    this.c = new String(bArr, i4, i, this.e);
                } catch (Exception e) {
                }
            }
        }
        int i5 = i + i4;
        int i6 = bArr[i5] & MotionEventCompat.ACTION_MASK;
        int i7 = i5 + 1;
        if (bArr.length > i7) {
            try {
                this.d = new String(bArr, i7, i6, this.e);
            } catch (Exception e2) {
            }
            int i8 = i7 + i6;
        }
    }

    public void b(int i) {
        this.g = i;
    }

    public int c() {
        return this.g;
    }

    @Override // com.igexin.push.c.c.e
    public byte[] d() {
        try {
            byte[] bytes = this.d.getBytes(this.e);
            byte[] bytes2 = !StatConstants.MTA_COOPERATION_TAG.equals(this.c) ? this.b == 192 ? (byte[]) this.c : ((String) this.c).getBytes(this.e) : null;
            int length = bytes2 != null ? bytes2.length : 0;
            byte[] bArrA = com.igexin.a.a.b.g.a(length);
            byte[] bArr = new byte[bArrA.length + 4 + length + bytes.length];
            try {
                int iB = com.igexin.a.a.b.g.b(this.a, bArr, 0);
                int iC = iB + com.igexin.a.a.b.g.c(this.b | a(this.e), bArr, iB);
                int iA = iC + com.igexin.a.a.b.g.a(bArrA, 0, bArr, iC, bArrA.length);
                if (length > 0) {
                    iA += com.igexin.a.a.b.g.a(bytes2, 0, bArr, iA, length);
                }
                int iC2 = iA + com.igexin.a.a.b.g.c(bytes.length, bArr, iA);
                int iA2 = iC2 + com.igexin.a.a.b.g.a(bytes, 0, bArr, iC2, bytes.length);
                return bArr;
            } catch (Exception e) {
                return bArr;
            }
        } catch (Exception e2) {
            return null;
        }
    }
}
