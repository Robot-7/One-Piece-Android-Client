package org.codehaus.jackson.org.objectweb.asm;

/* JADX INFO: loaded from: classes.dex */
public class Label {
    int a;
    int b;
    int c;
    private int d;
    private int[] e;
    int f;
    int g;
    Frame h;
    Label i;
    public Object info;
    Edge j;
    Label k;

    private void a(int i, int i2) {
        if (this.e == null) {
            this.e = new int[6];
        }
        if (this.d >= this.e.length) {
            int[] iArr = new int[this.e.length + 6];
            System.arraycopy(this.e, 0, iArr, 0, this.e.length);
            this.e = iArr;
        }
        int[] iArr2 = this.e;
        int i3 = this.d;
        this.d = i3 + 1;
        iArr2[i3] = i;
        int[] iArr3 = this.e;
        int i4 = this.d;
        this.d = i4 + 1;
        iArr3[i4] = i2;
    }

    Label a() {
        return this.h == null ? this : this.h.b;
    }

    void a(long j, int i) {
        if ((this.a & 1024) == 0) {
            this.a |= 1024;
            this.e = new int[((i - 1) / 32) + 1];
        }
        int[] iArr = this.e;
        int i2 = (int) (j >>> 32);
        iArr[i2] = iArr[i2] | ((int) j);
    }

    void a(MethodWriter methodWriter, ByteVector byteVector, int i, boolean z) {
        if ((this.a & 2) != 0) {
            if (z) {
                byteVector.putInt(this.c - i);
                return;
            } else {
                byteVector.putShort(this.c - i);
                return;
            }
        }
        if (z) {
            a((-1) - i, byteVector.b);
            byteVector.putInt(-1);
        } else {
            a(i, byteVector.b);
            byteVector.putShort(-1);
        }
    }

    boolean a(long j) {
        return ((this.a & 1024) == 0 || (this.e[(int) (j >>> 32)] & ((int) j)) == 0) ? false : true;
    }

    boolean a(Label label) {
        if ((this.a & 1024) == 0 || (label.a & 1024) == 0) {
            return false;
        }
        for (int i = 0; i < this.e.length; i++) {
            if ((this.e[i] & label.e[i]) != 0) {
                return true;
            }
        }
        return false;
    }

    boolean a(MethodWriter methodWriter, int i, byte[] bArr) {
        int i2 = 0;
        this.a |= 2;
        this.c = i;
        boolean z = false;
        while (i2 < this.d) {
            int i3 = i2 + 1;
            int i4 = this.e[i2];
            i2 = i3 + 1;
            int i5 = this.e[i3];
            if (i4 >= 0) {
                int i6 = i - i4;
                if (i6 < -32768 || i6 > 32767) {
                    int i7 = bArr[i5 - 1] & 255;
                    if (i7 <= 168) {
                        bArr[i5 - 1] = (byte) (i7 + 49);
                    } else {
                        bArr[i5 - 1] = (byte) (i7 + 20);
                    }
                    z = true;
                }
                bArr[i5] = (byte) (i6 >>> 8);
                bArr[i5 + 1] = (byte) i6;
            } else {
                int i8 = i4 + i + 1;
                int i9 = i5 + 1;
                bArr[i5] = (byte) (i8 >>> 24);
                int i10 = i9 + 1;
                bArr[i9] = (byte) (i8 >>> 16);
                bArr[i10] = (byte) (i8 >>> 8);
                bArr[i10 + 1] = (byte) i8;
            }
        }
        return z;
    }

    /* JADX WARN: Removed duplicated region for block: B:15:0x003f  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    void b(org.codehaus.jackson.org.objectweb.asm.Label r5, long r6, int r8) {
        /*
            r4 = this;
        L0:
            if (r4 == 0) goto L68
            org.codehaus.jackson.org.objectweb.asm.Label r1 = r4.k
            r0 = 0
            r4.k = r0
            if (r5 == 0) goto L5a
            int r0 = r4.a
            r0 = r0 & 2048(0x800, float:2.87E-42)
            if (r0 == 0) goto L11
            r4 = r1
            goto L0
        L11:
            int r0 = r4.a
            r0 = r0 | 2048(0x800, float:2.87E-42)
            r4.a = r0
            int r0 = r4.a
            r0 = r0 & 256(0x100, float:3.59E-43)
            if (r0 == 0) goto L38
            boolean r0 = r4.a(r5)
            if (r0 != 0) goto L38
            org.codehaus.jackson.org.objectweb.asm.Edge r0 = new org.codehaus.jackson.org.objectweb.asm.Edge
            r0.<init>()
            int r2 = r4.f
            r0.a = r2
            org.codehaus.jackson.org.objectweb.asm.Edge r2 = r5.j
            org.codehaus.jackson.org.objectweb.asm.Label r2 = r2.b
            r0.b = r2
            org.codehaus.jackson.org.objectweb.asm.Edge r2 = r4.j
            r0.c = r2
            r4.j = r0
        L38:
            org.codehaus.jackson.org.objectweb.asm.Edge r0 = r4.j
            r3 = r0
            r0 = r1
            r1 = r3
        L3d:
            if (r1 == 0) goto L66
            int r2 = r4.a
            r2 = r2 & 128(0x80, float:1.794E-43)
            if (r2 == 0) goto L4b
            org.codehaus.jackson.org.objectweb.asm.Edge r2 = r4.j
            org.codehaus.jackson.org.objectweb.asm.Edge r2 = r2.c
            if (r1 == r2) goto L57
        L4b:
            org.codehaus.jackson.org.objectweb.asm.Label r2 = r1.b
            org.codehaus.jackson.org.objectweb.asm.Label r2 = r2.k
            if (r2 != 0) goto L57
            org.codehaus.jackson.org.objectweb.asm.Label r2 = r1.b
            r2.k = r0
            org.codehaus.jackson.org.objectweb.asm.Label r0 = r1.b
        L57:
            org.codehaus.jackson.org.objectweb.asm.Edge r1 = r1.c
            goto L3d
        L5a:
            boolean r0 = r4.a(r6)
            if (r0 == 0) goto L62
            r4 = r1
            goto L0
        L62:
            r4.a(r6, r8)
            goto L38
        L66:
            r4 = r0
            goto L0
        L68:
            return
        */
        throw new UnsupportedOperationException("Method not decompiled: org.codehaus.jackson.org.objectweb.asm.Label.b(org.codehaus.jackson.org.objectweb.asm.Label, long, int):void");
    }

    public int getOffset() {
        if ((this.a & 2) == 0) {
            throw new IllegalStateException("Label offset position has not been resolved yet");
        }
        return this.c;
    }

    public String toString() {
        return new StringBuffer().append("L").append(System.identityHashCode(this)).toString();
    }
}
