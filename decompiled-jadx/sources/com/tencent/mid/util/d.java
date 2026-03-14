package com.tencent.mid.util;

import org.codehaus.jackson.smile.SmileConstants;

/* JADX INFO: loaded from: classes.dex */
class d extends b {
    static final /* synthetic */ boolean g;
    private static final byte[] h;
    private static final byte[] i;
    int c;
    public final boolean d;
    public final boolean e;
    public final boolean f;
    private final byte[] j;
    private int k;
    private final byte[] l;

    static {
        g = !a.class.desiredAssertionStatus();
        h = new byte[]{65, 66, 67, 68, 69, 70, 71, 72, 73, 74, 75, 76, 77, 78, 79, 80, 81, 82, 83, 84, 85, 86, 87, 88, 89, 90, 97, 98, 99, 100, 101, 102, 103, 104, 105, 106, 107, 108, 109, 110, 111, 112, 113, 114, 115, 116, 117, 118, 119, 120, 121, 122, 48, 49, 50, 51, SmileConstants.TOKEN_KEY_LONG_STRING, 53, 54, 55, 56, 57, 43, 47};
        i = new byte[]{65, 66, 67, 68, 69, 70, 71, 72, 73, 74, 75, 76, 77, 78, 79, 80, 81, 82, 83, 84, 85, 86, 87, 88, 89, 90, 97, 98, 99, 100, 101, 102, 103, 104, 105, 106, 107, 108, 109, 110, 111, 112, 113, 114, 115, 116, 117, 118, 119, 120, 121, 122, 48, 49, 50, 51, SmileConstants.TOKEN_KEY_LONG_STRING, 53, 54, 55, 56, 57, 45, 95};
    }

    public d(int i2, byte[] bArr) {
        this.a = bArr;
        this.d = (i2 & 1) == 0;
        this.e = (i2 & 2) == 0;
        this.f = (i2 & 4) != 0;
        this.l = (i2 & 8) == 0 ? h : i;
        this.j = new byte[2];
        this.c = 0;
        this.k = this.e ? 19 : -1;
    }

    public boolean a(byte[] bArr, int i2, int i3, boolean z) {
        int i4;
        int i5;
        byte b;
        int i6;
        byte b2;
        int i7;
        byte b3;
        int i8;
        int i9;
        int i10;
        int i11;
        byte[] bArr2 = this.l;
        byte[] bArr3 = this.a;
        int i12 = 0;
        int i13 = this.k;
        int i14 = i3 + i2;
        int i15 = -1;
        switch (this.c) {
            case 0:
                i4 = i2;
                break;
            case 1:
                if (i2 + 2 > i14) {
                    i4 = i2;
                } else {
                    int i16 = i2 + 1;
                    i15 = ((this.j[0] & 255) << 16) | ((bArr[i2] & 255) << 8) | (bArr[i16] & 255);
                    this.c = 0;
                    i4 = i16 + 1;
                }
                break;
            case 2:
                if (i2 + 1 > i14) {
                    i4 = i2;
                } else {
                    i4 = i2 + 1;
                    i15 = ((this.j[0] & 255) << 16) | ((this.j[1] & 255) << 8) | (bArr[i2] & 255);
                    this.c = 0;
                }
                break;
            default:
                i4 = i2;
                break;
        }
        if (i15 != -1) {
            bArr3[0] = bArr2[(i15 >> 18) & 63];
            bArr3[1] = bArr2[(i15 >> 12) & 63];
            bArr3[2] = bArr2[(i15 >> 6) & 63];
            i12 = 4;
            bArr3[3] = bArr2[i15 & 63];
            i13--;
            if (i13 == 0) {
                if (this.f) {
                    i11 = 5;
                    bArr3[4] = 13;
                } else {
                    i11 = 4;
                }
                i12 = i11 + 1;
                bArr3[i11] = 10;
                i13 = 19;
            }
        }
        while (true) {
            int i17 = i13;
            int i18 = i12;
            if (i4 + 3 > i14) {
                if (z) {
                    if (i4 - this.c == i14 - 1) {
                        if (this.c > 0) {
                            i9 = 1;
                            b3 = this.j[0];
                            i8 = i4;
                        } else {
                            b3 = bArr[i4];
                            i8 = i4 + 1;
                            i9 = 0;
                        }
                        int i19 = (b3 & 255) << 4;
                        this.c -= i9;
                        int i20 = i18 + 1;
                        bArr3[i18] = bArr2[(i19 >> 6) & 63];
                        int i21 = i20 + 1;
                        bArr3[i20] = bArr2[i19 & 63];
                        if (this.d) {
                            int i22 = i21 + 1;
                            bArr3[i21] = 61;
                            i21 = i22 + 1;
                            bArr3[i22] = 61;
                        }
                        if (this.e) {
                            if (this.f) {
                                bArr3[i21] = 13;
                                i21++;
                            }
                            bArr3[i21] = 10;
                            i21++;
                        }
                        i4 = i8;
                        i18 = i21;
                    } else if (i4 - this.c == i14 - 2) {
                        if (this.c > 1) {
                            i6 = 1;
                            b = this.j[0];
                        } else {
                            b = bArr[i4];
                            i4++;
                            i6 = 0;
                        }
                        int i23 = (b & 255) << 10;
                        if (this.c > 0) {
                            b2 = this.j[i6];
                            i6++;
                        } else {
                            b2 = bArr[i4];
                            i4++;
                        }
                        int i24 = ((b2 & 255) << 2) | i23;
                        this.c -= i6;
                        int i25 = i18 + 1;
                        bArr3[i18] = bArr2[(i24 >> 12) & 63];
                        int i26 = i25 + 1;
                        bArr3[i25] = bArr2[(i24 >> 6) & 63];
                        int i27 = i26 + 1;
                        bArr3[i26] = bArr2[i24 & 63];
                        if (this.d) {
                            i7 = i27 + 1;
                            bArr3[i27] = 61;
                        } else {
                            i7 = i27;
                        }
                        if (this.e) {
                            if (this.f) {
                                bArr3[i7] = 13;
                                i7++;
                            }
                            bArr3[i7] = 10;
                            i7++;
                        }
                        i18 = i7;
                    } else if (this.e && i18 > 0 && i17 != 19) {
                        if (this.f) {
                            i5 = i18 + 1;
                            bArr3[i18] = 13;
                        } else {
                            i5 = i18;
                        }
                        i18 = i5 + 1;
                        bArr3[i5] = 10;
                    }
                    if (!g && this.c != 0) {
                        throw new AssertionError();
                    }
                    if (!g && i4 != i14) {
                        throw new AssertionError();
                    }
                } else if (i4 == i14 - 1) {
                    byte[] bArr4 = this.j;
                    int i28 = this.c;
                    this.c = i28 + 1;
                    bArr4[i28] = bArr[i4];
                } else if (i4 == i14 - 2) {
                    byte[] bArr5 = this.j;
                    int i29 = this.c;
                    this.c = i29 + 1;
                    bArr5[i29] = bArr[i4];
                    byte[] bArr6 = this.j;
                    int i30 = this.c;
                    this.c = i30 + 1;
                    bArr6[i30] = bArr[i4 + 1];
                }
                this.b = i18;
                this.k = i17;
                return true;
            }
            int i31 = ((bArr[i4] & 255) << 16) | ((bArr[i4 + 1] & 255) << 8) | (bArr[i4 + 2] & 255);
            bArr3[i18] = bArr2[(i31 >> 18) & 63];
            bArr3[i18 + 1] = bArr2[(i31 >> 12) & 63];
            bArr3[i18 + 2] = bArr2[(i31 >> 6) & 63];
            bArr3[i18 + 3] = bArr2[i31 & 63];
            i4 += 3;
            i12 = i18 + 4;
            i13 = i17 - 1;
            if (i13 == 0) {
                if (this.f) {
                    i10 = i12 + 1;
                    bArr3[i12] = 13;
                } else {
                    i10 = i12;
                }
                i12 = i10 + 1;
                bArr3[i10] = 10;
                i13 = 19;
            }
        }
    }
}
