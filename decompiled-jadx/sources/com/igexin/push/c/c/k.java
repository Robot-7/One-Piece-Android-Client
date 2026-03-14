package com.igexin.push.c.c;

/* JADX INFO: loaded from: classes.dex */
public class k extends e {
    public boolean a;
    public boolean b;
    public String c;
    public String d;
    public long e;

    public k() {
        this.i = 5;
    }

    @Override // com.igexin.push.c.c.e
    public void a(byte[] bArr) {
        int i = 1;
        byte b = bArr[0];
        this.a = (b & 64) != 0;
        this.b = (b & 128) != 0;
        if (this.b) {
            this.c = a(b);
            int iB = com.igexin.a.a.b.g.b(bArr, 1);
            i = iB + 2 + 1;
            try {
                this.d = new String(bArr, 3, iB, this.c);
            } catch (Exception e) {
            }
        }
        if (bArr.length > i) {
            this.e = com.igexin.a.a.b.g.d(bArr, i);
            int i2 = i + 8;
        }
    }

    /* JADX WARN: Removed duplicated region for block: B:24:0x004e A[PHI: r3
      0x004e: PHI (r3v4 int) = (r3v3 int), (r3v5 int) binds: [B:13:0x0032, B:15:0x0038] A[DONT_GENERATE, DONT_INLINE]] */
    @Override // com.igexin.push.c.c.e
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public byte[] d() {
        /*
            r7 = this;
            r1 = 0
            r2 = 1
            r3 = 0
            boolean r0 = r7.a
            if (r0 == 0) goto L56
            r0 = 64
            byte r0 = (byte) r0
        La:
            boolean r4 = r7.b
            if (r4 == 0) goto L50
            r0 = r0 | 128(0x80, float:1.794E-43)
            byte r4 = (byte) r0
            r2 = 3
            java.lang.String r0 = r7.d     // Catch: java.lang.Exception -> L47
            java.lang.String r5 = r7.c     // Catch: java.lang.Exception -> L47
            byte[] r0 = r0.getBytes(r5)     // Catch: java.lang.Exception -> L47
            int r2 = r0.length     // Catch: java.lang.Exception -> L4c
            int r3 = r2 + 3
        L1d:
            java.lang.String r5 = r7.c
            int r5 = r7.a(r5)
            r4 = r4 | r5
            byte r4 = (byte) r4
            r6 = r4
            r4 = r3
            r3 = r6
        L28:
            int r4 = r4 + 8
            byte[] r4 = new byte[r4]
            int r3 = com.igexin.a.a.b.g.c(r3, r4, r1)
            boolean r5 = r7.b
            if (r5 == 0) goto L4e
            int r3 = com.igexin.a.a.b.g.b(r2, r4, r3)
            if (r0 == 0) goto L4e
            int r0 = com.igexin.a.a.b.g.a(r0, r1, r4, r3, r2)
            int r0 = r0 + r3
        L3f:
            long r1 = r7.e
            int r1 = com.igexin.a.a.b.g.a(r1, r4, r0)
            int r0 = r0 + r1
            return r4
        L47:
            r0 = move-exception
            r0 = r3
        L49:
            r3 = r2
            r2 = r1
            goto L1d
        L4c:
            r3 = move-exception
            goto L49
        L4e:
            r0 = r3
            goto L3f
        L50:
            r4 = r2
            r2 = r1
            r6 = r0
            r0 = r3
            r3 = r6
            goto L28
        L56:
            r0 = r1
            goto La
        */
        throw new UnsupportedOperationException("Method not decompiled: com.igexin.push.c.c.k.d():byte[]");
    }
}
