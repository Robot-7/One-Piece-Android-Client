package com.tencent.wxop.stat.b;

/* JADX INFO: loaded from: classes.dex */
public class h {
    static final /* synthetic */ boolean cH;

    static {
        cH = !h.class.desiredAssertionStatus();
    }

    private h() {
    }

    public static byte[] d(byte[] bArr) {
        int length = bArr.length;
        j jVar = new j(new byte[(length * 3) / 4]);
        if (!jVar.a(bArr, length)) {
            throw new IllegalArgumentException("bad base-64");
        }
        if (jVar.g == jVar.cI.length) {
            return jVar.cI;
        }
        byte[] bArr2 = new byte[jVar.g];
        System.arraycopy(jVar.cI, 0, bArr2, 0, jVar.g);
        return bArr2;
    }

    public static byte[] e(byte[] bArr) {
        int length = bArr.length;
        k kVar = new k();
        int i = (length / 3) * 4;
        if (!kVar.ba) {
            switch (length % 3) {
                case 1:
                    i += 2;
                    break;
                case 2:
                    i += 3;
                    break;
            }
        } else if (length % 3 > 0) {
            i += 4;
        }
        if (kVar.bb && length > 0) {
            i += (kVar.cP ? 2 : 1) * (((length - 1) / 57) + 1);
        }
        kVar.cI = new byte[i];
        kVar.a(bArr, length);
        if (cH || kVar.g == i) {
            return kVar.cI;
        }
        throw new AssertionError();
    }
}
