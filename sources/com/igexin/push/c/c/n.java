package com.igexin.push.c.c;

import android.support.v4.view.MotionEventCompat;
import com.tencent.stat.common.StatConstants;
import org.codehaus.jackson.org.objectweb.asm.Opcodes;

/* JADX INFO: loaded from: classes.dex */
public class n extends e {
    public int a;
    public int b;
    public long c;
    public String d;
    public Object e;
    public Object f;
    public String g;
    public String h = "UTF-8";

    public n() {
        this.i = 26;
    }

    @Override // com.igexin.push.c.c.e
    public void a(byte[] bArr) {
        int i;
        int i2;
        this.a = com.igexin.a.a.b.g.b(bArr, 0);
        this.b = bArr[2] & 192;
        this.h = a(bArr[2]);
        this.c = com.igexin.a.a.b.g.d(bArr, 3);
        int i3 = bArr[11] & MotionEventCompat.ACTION_MASK;
        try {
            this.d = new String(bArr, 12, i3, this.h);
        } catch (Exception e) {
            this.d = StatConstants.MTA_COOPERATION_TAG;
        }
        int i4 = i3 + 12;
        int i5 = 0;
        while (true) {
            i = i5 | (bArr[i4] & Opcodes.LAND);
            if ((bArr[i4] & 128) == 0) {
                break;
            }
            i5 = i << 7;
            i4++;
        }
        int i6 = i4 + 1;
        if (i > 0) {
            if (this.b == 192) {
                this.e = new byte[i];
                System.arraycopy(bArr, i6, this.e, 0, i);
            } else {
                try {
                    this.e = new String(bArr, i6, i, this.h);
                } catch (Exception e2) {
                }
            }
        }
        int i7 = i + i6;
        int i8 = 0;
        while (true) {
            i2 = i8 | (bArr[i7] & Opcodes.LAND);
            if ((bArr[i7] & 128) == 0) {
                break;
            }
            i8 = i2 << 7;
            i7++;
        }
        int i9 = i7 + 1;
        if (i2 > 0) {
            this.f = new byte[i2];
            System.arraycopy(bArr, i9, this.f, 0, i2);
        }
        int i10 = i2 + i9;
        if (bArr.length > i10) {
            int i11 = i10 + 1;
            int i12 = bArr[i10] & MotionEventCompat.ACTION_MASK;
            try {
                this.g = new String(bArr, i11, i12, this.h);
            } catch (Exception e3) {
            }
            int i13 = i12 + i11;
        }
    }

    public final boolean a() {
        return this.b == 128;
    }

    @Override // com.igexin.push.c.c.e
    public byte[] d() {
        try {
            byte[] bytes = this.d.getBytes(this.h);
            byte[] bytes2 = this.g.getBytes(this.h);
            byte[] bytes3 = !StatConstants.MTA_COOPERATION_TAG.equals(this.e) ? this.b == 192 ? (byte[]) this.e : ((String) this.e).getBytes(this.h) : null;
            byte[] bArr = this.f != null ? (byte[]) this.f : null;
            int length = bytes3 == null ? 0 : bytes3.length;
            int length2 = bArr != null ? bArr.length : 0;
            byte[] bArrA = com.igexin.a.a.b.g.a(length);
            byte[] bArrA2 = com.igexin.a.a.b.g.a(length2);
            byte[] bArr2 = new byte[bytes.length + 13 + bArrA.length + length + bArrA2.length + length2 + bytes2.length];
            try {
                int iB = com.igexin.a.a.b.g.b(this.a, bArr2, 0);
                int iC = iB + com.igexin.a.a.b.g.c(this.b | a(this.h), bArr2, iB);
                int iA = iC + com.igexin.a.a.b.g.a(this.c, bArr2, iC);
                int iC2 = iA + com.igexin.a.a.b.g.c(bytes.length, bArr2, iA);
                int iA2 = iC2 + com.igexin.a.a.b.g.a(bytes, 0, bArr2, iC2, bytes.length);
                int iA3 = iA2 + com.igexin.a.a.b.g.a(bArrA, 0, bArr2, iA2, bArrA.length);
                if (length > 0) {
                    iA3 += com.igexin.a.a.b.g.a(bytes3, 0, bArr2, iA3, length);
                }
                int iA4 = iA3 + com.igexin.a.a.b.g.a(bArrA2, 0, bArr2, iA3, bArrA2.length);
                if (length2 > 0) {
                    iA4 += com.igexin.a.a.b.g.a(bArr, 0, bArr2, iA4, length2);
                }
                int iC3 = iA4 + com.igexin.a.a.b.g.c(bytes2.length, bArr2, iA4);
                int iA5 = iC3 + com.igexin.a.a.b.g.a(bytes2, 0, bArr2, iC3, bytes2.length);
                return bArr2;
            } catch (Exception e) {
                return bArr2;
            }
        } catch (Exception e2) {
            return null;
        }
    }
}
