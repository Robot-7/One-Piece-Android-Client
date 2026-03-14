package com.igexin.push.c.a;

import com.igexin.a.a.b.d;
import com.igexin.a.a.b.e;
import com.igexin.a.a.b.f;
import com.igexin.push.c.c.g;
import com.igexin.push.c.c.h;
import java.nio.ByteBuffer;

/* JADX INFO: loaded from: classes.dex */
public class c extends com.igexin.a.a.b.c {
    private byte[] e;
    private boolean f;
    private boolean g;

    c(String str) {
        super(str, true);
        this.e = null;
        this.f = false;
        this.g = false;
    }

    public static com.igexin.a.a.b.c a() {
        c cVar = new c("socketProtocol");
        new a("command", cVar);
        return cVar;
    }

    static g a(int i) {
        g gVar = new g();
        gVar.b = 1944742139;
        gVar.c = 3;
        gVar.d = g.a;
        gVar.i = (byte) 0;
        gVar.h = (byte) 0;
        gVar.f = i;
        d.e();
        return gVar;
    }

    static g a(int i, byte b) {
        g gVar = new g();
        gVar.b = 1944742139;
        gVar.a(b);
        gVar.c = 3;
        if (gVar.h == 48) {
            gVar.c += d.c().a().length + 1;
        }
        gVar.d = g.a;
        gVar.f = i;
        d.e();
        return gVar;
    }

    @Override // com.igexin.a.a.b.c
    public Object a(f fVar, e eVar, Object obj) {
        if (!(obj instanceof com.igexin.push.c.c.b)) {
            com.igexin.push.c.c.b[] bVarArr = (com.igexin.push.c.c.b[]) obj;
            g gVarA = a(bVarArr.length);
            int i = 0;
            for (com.igexin.push.c.c.b bVar : bVarArr) {
                i += bVar.a + 3;
            }
            byte[] bArr = new byte[i + 5 + gVarA.c];
            int iA = com.igexin.a.a.b.g.a(1944742139, bArr, 0);
            int iC = iA + com.igexin.a.a.b.g.c(gVarA.c, bArr, iA);
            int iC2 = iC + com.igexin.a.a.b.g.c(gVarA.d, bArr, iC);
            int iC3 = iC2 + com.igexin.a.a.b.g.c(gVarA.c(), bArr, iC2);
            int iC4 = iC3 + com.igexin.a.a.b.g.c(gVarA.f, bArr, iC3);
            for (int i2 = 0; i2 < bVarArr.length; i2++) {
                int iB = iC4 + com.igexin.a.a.b.g.b(bVarArr[i2].a, bArr, iC4);
                int iC5 = iB + com.igexin.a.a.b.g.c(bVarArr[i2].b, bArr, iB);
                iC4 = iC5 + com.igexin.a.a.b.g.a(bVarArr[i2].d, 0, bArr, iC5, bVarArr[i2].a);
            }
            return bArr;
        }
        com.igexin.push.c.c.b bVar2 = (com.igexin.push.c.c.b) obj;
        g gVarA2 = a(bVar2.b > 0 ? 1 : 0, bVar2.c);
        if (bVar2.b > 0 && bVar2.a > 0) {
            if ((gVarA2.g & 192) == 128) {
                bVar2.a(com.igexin.a.a.b.g.a(bVar2.d));
            }
            if ((gVarA2.h & 48) == 48) {
                bVar2.a(com.igexin.a.a.a.a.a(bVar2.d, d.c().b()));
            }
        }
        byte[] bArr2 = new byte[(bVar2.b > 0 ? bVar2.a + 3 : 0) + gVarA2.c + 5];
        int iA2 = com.igexin.a.a.b.g.a(1944742139, bArr2, 0);
        int iC6 = iA2 + com.igexin.a.a.b.g.c(gVarA2.c, bArr2, iA2);
        int iC7 = iC6 + com.igexin.a.a.b.g.c(gVarA2.d, bArr2, iC6);
        int iC8 = iC7 + com.igexin.a.a.b.g.c(gVarA2.c(), bArr2, iC7);
        int iC9 = iC8 + com.igexin.a.a.b.g.c(gVarA2.f, bArr2, iC8);
        if ((gVarA2.h & 48) == 48) {
            byte[] bArrA = d.c().a();
            int iC10 = iC9 + com.igexin.a.a.b.g.c(bArrA.length, bArr2, iC9);
            iC9 = iC10 + com.igexin.a.a.b.g.a(bArrA, 0, bArr2, iC10, bArrA.length);
        }
        if (bVar2.b > 0) {
            int iB2 = iC9 + com.igexin.a.a.b.g.b(bVar2.a, bArr2, iC9);
            int iC11 = iB2 + com.igexin.a.a.b.g.c(bVar2.b, bArr2, iB2);
            if (bVar2.a > 0) {
                int iA3 = iC11 + com.igexin.a.a.b.g.a(bVar2.d, 0, bArr2, iC11, bVar2.a);
            }
        }
        return bArr2;
    }

    @Override // com.igexin.a.a.b.c
    /* JADX INFO: renamed from: b, reason: merged with bridge method [inline-methods] */
    public com.igexin.a.a.d.a.f c(f fVar, e eVar, Object obj) throws Throwable {
        if (eVar.a() == null) {
            eVar.a(new b());
        }
        b bVar = (b) eVar.a();
        ByteBuffer byteBufferWrap = obj instanceof byte[] ? ByteBuffer.wrap((byte[]) obj) : (ByteBuffer) obj;
        if (bVar.a == 0) {
            if (bVar.d == 0) {
                bVar.f = new byte[8];
            }
            while (byteBufferWrap.remaining() > 0) {
                byte b = byteBufferWrap.get();
                byte[] bArr = bVar.f;
                int i = bVar.d;
                bVar.d = i + 1;
                bArr[i] = b;
                if (bVar.d == 4 && com.igexin.a.a.b.g.c(bVar.f, 0) != 1944742139) {
                    bVar.d = 0;
                }
                if (bVar.d >= 8) {
                    g gVar = new g();
                    gVar.c = bVar.f[4] & 255;
                    gVar.d = bVar.f[5] & 255;
                    gVar.a(bVar.f[6]);
                    if (gVar.h == 48) {
                        this.g = true;
                        int i2 = byteBufferWrap.get();
                        this.e = new byte[i2];
                        for (int i3 = 0; i3 < i2; i3++) {
                            this.e[i3] = byteBufferWrap.get();
                        }
                    } else {
                        this.g = false;
                    }
                    if (gVar.g == -128) {
                        this.f = true;
                    } else {
                        this.f = false;
                    }
                    gVar.f = bVar.f[7] & 255;
                    bVar.a(gVar.f);
                    bVar.d = 0;
                    bVar.f = null;
                    if (gVar.f > 0) {
                        bVar.a = 1;
                        return c(fVar, eVar, byteBufferWrap);
                    }
                    d.c().a(new h());
                    d.c().d();
                    if (byteBufferWrap.remaining() > 0) {
                        return c(fVar, eVar, byteBufferWrap);
                    }
                }
            }
            return null;
        }
        while (bVar.a == 1 && byteBufferWrap.remaining() > 0) {
            byte b2 = byteBufferWrap.get();
            if (bVar.d == 0) {
                bVar.f = new byte[2];
            }
            byte[] bArr2 = bVar.f;
            int i4 = bVar.d;
            bVar.d = i4 + 1;
            bArr2[i4] = b2;
            if (bVar.d >= 2) {
                if (bVar.d == 2) {
                    bVar.e = com.igexin.a.a.b.g.b(bVar.f, 0);
                    bVar.f = null;
                    bVar.f = new byte[bVar.e + 3];
                    com.igexin.a.a.b.g.b(bVar.e, bVar.f, 0);
                } else if (bVar.d >= bVar.e + 3) {
                    com.igexin.push.c.c.b bVar2 = new com.igexin.push.c.c.b();
                    bVar2.a = bVar.e;
                    bVar2.b = bVar.f[2];
                    if (bVar2.a > 0) {
                        byte[] bArr3 = new byte[bVar2.a];
                        com.igexin.a.a.b.g.a(bVar.f, 3, bArr3, 0, bVar2.a);
                        byte[] bArrA = this.g ? com.igexin.a.a.a.a.a(bArr3, this.e == null ? d.c().b() : com.igexin.a.b.a.a(this.e)) : bArr3;
                        if (this.f) {
                            bArrA = com.igexin.a.a.b.g.b(bArrA);
                        }
                        bVar2.a(bArrA);
                    }
                    bVar.e = 0;
                    bVar.d = 0;
                    bVar.f = null;
                    if (this.b != null) {
                        d.c().a(this.b.c(fVar, eVar, bVar2));
                    }
                    bVar.b++;
                    if (bVar.b == bVar.c) {
                        bVar.a = 0;
                    }
                }
            }
        }
        if (bVar.b > 0) {
            d.c().d();
        }
        if (byteBufferWrap.remaining() > 0) {
            return c(fVar, eVar, byteBufferWrap);
        }
        return null;
    }
}
