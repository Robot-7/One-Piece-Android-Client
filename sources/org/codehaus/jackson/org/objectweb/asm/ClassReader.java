package org.codehaus.jackson.org.objectweb.asm;

import com.pipaw.pipawpay.PipawSDK;
import com.youai.PlatformAndGameInfo;
import com.youai.sdks.beans.PlatformContacts;
import java.io.IOException;
import java.io.InputStream;

/* JADX INFO: loaded from: classes.dex */
public class ClassReader {
    public static final int EXPAND_FRAMES = 8;
    public static final int SKIP_CODE = 1;
    public static final int SKIP_DEBUG = 2;
    public static final int SKIP_FRAMES = 4;
    private final int[] a;
    public final byte[] b;
    private final String[] c;
    private final int d;
    public final int header;

    public ClassReader(InputStream inputStream) throws IOException {
        this(a(inputStream));
    }

    public ClassReader(String str) throws IOException {
        this(ClassLoader.getSystemResourceAsStream(new StringBuffer().append(str.replace('.', '/')).append(".class").toString()));
    }

    public ClassReader(byte[] bArr) {
        this(bArr, 0, bArr.length);
    }

    public ClassReader(byte[] bArr, int i, int i2) {
        int unsignedShort;
        this.b = bArr;
        this.a = new int[readUnsignedShort(i + 8)];
        int length = this.a.length;
        this.c = new String[length];
        int i3 = 0;
        int i4 = 1;
        int i5 = i + 10;
        while (i4 < length) {
            this.a[i4] = i5 + 1;
            switch (bArr[i5]) {
                case 1:
                    unsignedShort = readUnsignedShort(i5 + 1) + 3;
                    if (unsignedShort > i3) {
                        i3 = unsignedShort;
                    }
                    break;
                case 2:
                case 7:
                case 8:
                default:
                    unsignedShort = 3;
                    break;
                case 3:
                case 4:
                case 9:
                case 10:
                case 11:
                case 12:
                    unsignedShort = 5;
                    break;
                case 5:
                case 6:
                    unsignedShort = 9;
                    i4++;
                    break;
            }
            i4++;
            i5 = unsignedShort + i5;
        }
        this.d = i3;
        this.header = i5;
    }

    private int a(int i, char[] cArr, String str, AnnotationVisitor annotationVisitor) {
        int i2 = 0;
        if (annotationVisitor == null) {
            switch (this.b[i] & 255) {
                case 64:
                    return a(i + 3, cArr, true, (AnnotationVisitor) null);
                case 91:
                    return a(i + 1, cArr, false, (AnnotationVisitor) null);
                case 101:
                    return i + 5;
                default:
                    return i + 3;
            }
        }
        int i3 = i + 1;
        switch (this.b[i] & 255) {
            case 64:
                return a(i3 + 2, cArr, true, annotationVisitor.visitAnnotation(str, readUTF8(i3, cArr)));
            case PlatformAndGameInfo.enPlatform_Amazon /* 66 */:
                annotationVisitor.visit(str, new Byte((byte) readInt(this.a[readUnsignedShort(i3)])));
                return i3 + 2;
            case 67:
                annotationVisitor.visit(str, new Character((char) readInt(this.a[readUnsignedShort(i3)])));
                return i3 + 2;
            case PlatformContacts.Platforms.PlatformFeiLiu /* 68 */:
            case 70:
            case 73:
            case 74:
                annotationVisitor.visit(str, readConst(readUnsignedShort(i3), cArr));
                return i3 + 2;
            case 83:
                annotationVisitor.visit(str, new Short((short) readInt(this.a[readUnsignedShort(i3)])));
                return i3 + 2;
            case 90:
                annotationVisitor.visit(str, readInt(this.a[readUnsignedShort(i3)]) == 0 ? Boolean.FALSE : Boolean.TRUE);
                return i3 + 2;
            case 91:
                int unsignedShort = readUnsignedShort(i3);
                int i4 = i3 + 2;
                if (unsignedShort == 0) {
                    return a(i4 - 2, cArr, false, annotationVisitor.visitArray(str));
                }
                int i5 = i4 + 1;
                switch (this.b[i4] & 255) {
                    case PlatformAndGameInfo.enPlatform_Amazon /* 66 */:
                        byte[] bArr = new byte[unsignedShort];
                        while (i2 < unsignedShort) {
                            bArr[i2] = (byte) readInt(this.a[readUnsignedShort(i5)]);
                            i5 += 3;
                            i2++;
                        }
                        annotationVisitor.visit(str, bArr);
                        return i5 - 1;
                    case 67:
                        char[] cArr2 = new char[unsignedShort];
                        while (i2 < unsignedShort) {
                            cArr2[i2] = (char) readInt(this.a[readUnsignedShort(i5)]);
                            i5 += 3;
                            i2++;
                        }
                        annotationVisitor.visit(str, cArr2);
                        return i5 - 1;
                    case PlatformContacts.Platforms.PlatformFeiLiu /* 68 */:
                        double[] dArr = new double[unsignedShort];
                        while (i2 < unsignedShort) {
                            dArr[i2] = Double.longBitsToDouble(readLong(this.a[readUnsignedShort(i5)]));
                            i5 += 3;
                            i2++;
                        }
                        annotationVisitor.visit(str, dArr);
                        return i5 - 1;
                    case 70:
                        float[] fArr = new float[unsignedShort];
                        while (i2 < unsignedShort) {
                            fArr[i2] = Float.intBitsToFloat(readInt(this.a[readUnsignedShort(i5)]));
                            i5 += 3;
                            i2++;
                        }
                        annotationVisitor.visit(str, fArr);
                        return i5 - 1;
                    case 73:
                        int[] iArr = new int[unsignedShort];
                        while (i2 < unsignedShort) {
                            iArr[i2] = readInt(this.a[readUnsignedShort(i5)]);
                            i5 += 3;
                            i2++;
                        }
                        annotationVisitor.visit(str, iArr);
                        return i5 - 1;
                    case 74:
                        long[] jArr = new long[unsignedShort];
                        while (i2 < unsignedShort) {
                            jArr[i2] = readLong(this.a[readUnsignedShort(i5)]);
                            i5 += 3;
                            i2++;
                        }
                        annotationVisitor.visit(str, jArr);
                        return i5 - 1;
                    case 83:
                        short[] sArr = new short[unsignedShort];
                        while (i2 < unsignedShort) {
                            sArr[i2] = (short) readInt(this.a[readUnsignedShort(i5)]);
                            i5 += 3;
                            i2++;
                        }
                        annotationVisitor.visit(str, sArr);
                        return i5 - 1;
                    case 90:
                        boolean[] zArr = new boolean[unsignedShort];
                        int i6 = i5;
                        for (int i7 = 0; i7 < unsignedShort; i7++) {
                            zArr[i7] = readInt(this.a[readUnsignedShort(i6)]) != 0;
                            i6 += 3;
                        }
                        annotationVisitor.visit(str, zArr);
                        return i6 - 1;
                    default:
                        return a(i5 - 3, cArr, false, annotationVisitor.visitArray(str));
                }
            case Opcodes.DADD /* 99 */:
                annotationVisitor.visit(str, Type.getType(readUTF8(i3, cArr)));
                return i3 + 2;
            case 101:
                annotationVisitor.visitEnum(str, readUTF8(i3, cArr), readUTF8(i3 + 2, cArr));
                return i3 + 4;
            case Opcodes.DREM /* 115 */:
                annotationVisitor.visit(str, readUTF8(i3, cArr));
                return i3 + 2;
            default:
                return i3;
        }
    }

    private int a(int i, char[] cArr, boolean z, AnnotationVisitor annotationVisitor) {
        int iA;
        int unsignedShort = readUnsignedShort(i);
        int i2 = i + 2;
        if (z) {
            iA = i2;
            int i3 = unsignedShort;
            while (i3 > 0) {
                i3--;
                iA = a(iA + 2, cArr, readUTF8(iA, cArr), annotationVisitor);
            }
        } else {
            iA = i2;
            int i4 = unsignedShort;
            while (i4 > 0) {
                i4--;
                iA = a(iA, cArr, (String) null, annotationVisitor);
            }
        }
        if (annotationVisitor != null) {
            annotationVisitor.visitEnd();
        }
        return iA;
    }

    private int a(Object[] objArr, int i, int i2, char[] cArr, Label[] labelArr) {
        int i3 = i2 + 1;
        switch (this.b[i2] & 255) {
            case 0:
                objArr[i] = Opcodes.TOP;
                return i3;
            case 1:
                objArr[i] = Opcodes.INTEGER;
                return i3;
            case 2:
                objArr[i] = Opcodes.FLOAT;
                return i3;
            case 3:
                objArr[i] = Opcodes.DOUBLE;
                return i3;
            case 4:
                objArr[i] = Opcodes.LONG;
                return i3;
            case 5:
                objArr[i] = Opcodes.NULL;
                return i3;
            case 6:
                objArr[i] = Opcodes.UNINITIALIZED_THIS;
                return i3;
            case 7:
                objArr[i] = readClass(i3, cArr);
                return i3 + 2;
            default:
                objArr[i] = readLabel(readUnsignedShort(i3), labelArr);
                return i3 + 2;
        }
    }

    private String a(int i, int i2, char[] cArr) {
        int i3;
        int i4 = i + i2;
        byte[] bArr = this.b;
        char c = 0;
        char c2 = 0;
        int i5 = 0;
        while (i < i4) {
            int i6 = i + 1;
            byte b = bArr[i];
            switch (c2) {
                case 0:
                    int i7 = b & 255;
                    if (i7 < 128) {
                        i3 = i5 + 1;
                        cArr[i5] = (char) i7;
                    } else if (i7 < 224 && i7 > 191) {
                        c = (char) (i7 & 31);
                        c2 = 1;
                        i3 = i5;
                    } else {
                        c = (char) (i7 & 15);
                        c2 = 2;
                        i3 = i5;
                    }
                    break;
                case 1:
                    cArr[i5] = (char) ((b & 63) | (c << 6));
                    i3 = i5 + 1;
                    c2 = 0;
                    break;
                case 2:
                    c = (char) ((c << 6) | (b & 63));
                    c2 = 1;
                    i3 = i5;
                    break;
                default:
                    i3 = i5;
                    break;
            }
            i5 = i3;
            i = i6;
        }
        return new String(cArr, 0, i5);
    }

    private Attribute a(Attribute[] attributeArr, String str, int i, int i2, char[] cArr, int i3, Label[] labelArr) {
        for (int i4 = 0; i4 < attributeArr.length; i4++) {
            if (attributeArr[i4].type.equals(str)) {
                return attributeArr[i4].read(this, i, i2, cArr, i3, labelArr);
            }
        }
        return new Attribute(str).read(this, i, i2, null, -1, null);
    }

    private void a(int i, String str, char[] cArr, boolean z, MethodVisitor methodVisitor) {
        int iA = i + 1;
        int i2 = this.b[i] & 255;
        int length = Type.getArgumentTypes(str).length - i2;
        int i3 = 0;
        while (i3 < length) {
            AnnotationVisitor annotationVisitorVisitParameterAnnotation = methodVisitor.visitParameterAnnotation(i3, "Ljava/lang/Synthetic;", false);
            if (annotationVisitorVisitParameterAnnotation != null) {
                annotationVisitorVisitParameterAnnotation.visitEnd();
            }
            i3++;
        }
        while (true) {
            int i4 = i3;
            if (i4 >= i2 + length) {
                return;
            }
            iA += 2;
            for (int unsignedShort = readUnsignedShort(iA); unsignedShort > 0; unsignedShort--) {
                iA = a(iA + 2, cArr, true, methodVisitor.visitParameterAnnotation(i4, readUTF8(iA, cArr), z));
            }
            i3 = i4 + 1;
        }
    }

    private static byte[] a(InputStream inputStream) throws IOException {
        if (inputStream == null) {
            throw new IOException("Class not found");
        }
        byte[] bArr = new byte[inputStream.available()];
        int i = 0;
        while (true) {
            int i2 = inputStream.read(bArr, i, bArr.length - i);
            if (i2 == -1) {
                if (i >= bArr.length) {
                    return bArr;
                }
                byte[] bArr2 = new byte[i];
                System.arraycopy(bArr, 0, bArr2, 0, i);
                return bArr2;
            }
            int i3 = i2 + i;
            if (i3 == bArr.length) {
                int i4 = inputStream.read();
                if (i4 < 0) {
                    return bArr;
                }
                byte[] bArr3 = new byte[bArr.length + PipawSDK.PAY_CANCEL];
                System.arraycopy(bArr, 0, bArr3, 0, i3);
                i = i3 + 1;
                bArr3[i3] = (byte) i4;
                bArr = bArr3;
            } else {
                i = i3;
            }
        }
    }

    void a(ClassWriter classWriter) {
        int i;
        char[] cArr = new char[this.d];
        int length = this.a.length;
        Item[] itemArr = new Item[length];
        int i2 = 1;
        while (i2 < length) {
            int i3 = this.a[i2];
            byte b = this.b[i3 - 1];
            Item item = new Item(i2);
            switch (b) {
                case 1:
                    String strA = this.c[i2];
                    if (strA == null) {
                        int i4 = this.a[i2];
                        String[] strArr = this.c;
                        strA = a(i4 + 2, readUnsignedShort(i4), cArr);
                        strArr[i2] = strA;
                    }
                    item.a(b, strA, null, null);
                    i = i2;
                    break;
                case 2:
                case 7:
                case 8:
                default:
                    item.a(b, readUTF8(i3, cArr), null, null);
                    i = i2;
                    break;
                case 3:
                    item.a(readInt(i3));
                    i = i2;
                    break;
                case 4:
                    item.a(Float.intBitsToFloat(readInt(i3)));
                    i = i2;
                    break;
                case 5:
                    item.a(readLong(i3));
                    i = i2 + 1;
                    break;
                case 6:
                    item.a(Double.longBitsToDouble(readLong(i3)));
                    i = i2 + 1;
                    break;
                case 9:
                case 10:
                case 11:
                    int i5 = this.a[readUnsignedShort(i3 + 2)];
                    item.a(b, readClass(i3, cArr), readUTF8(i5, cArr), readUTF8(i5 + 2, cArr));
                    i = i2;
                    break;
                case 12:
                    item.a(b, readUTF8(i3, cArr), readUTF8(i3 + 2, cArr), null);
                    i = i2;
                    break;
            }
            int length2 = item.j % itemArr.length;
            item.k = itemArr[length2];
            itemArr[length2] = item;
            i2 = i + 1;
        }
        int i6 = this.a[1] - 1;
        classWriter.d.putByteArray(this.b, i6, this.header - i6);
        classWriter.e = itemArr;
        classWriter.f = (int) (0.75d * ((double) length));
        classWriter.c = length;
    }

    public void accept(ClassVisitor classVisitor, int i) {
        accept(classVisitor, new Attribute[0], i);
    }

    /* JADX WARN: Removed duplicated region for block: B:257:0x07c2  */
    /* JADX WARN: Removed duplicated region for block: B:279:0x08a3  */
    /* JADX WARN: Removed duplicated region for block: B:286:0x091b  */
    /* JADX WARN: Removed duplicated region for block: B:331:0x0a73  */
    /* JADX WARN: Removed duplicated region for block: B:378:0x0b60  */
    /* JADX WARN: Removed duplicated region for block: B:484:0x0e7c  */
    /* JADX WARN: Removed duplicated region for block: B:489:0x0e86  */
    /* JADX WARN: Removed duplicated region for block: B:494:0x0ec3  */
    /* JADX WARN: Removed duplicated region for block: B:507:0x0f1a A[LOOP:41: B:506:0x0f18->B:507:0x0f1a, LOOP_END] */
    /* JADX WARN: Removed duplicated region for block: B:510:0x0f34  */
    /* JADX WARN: Removed duplicated region for block: B:516:0x0f4c  */
    /* JADX WARN: Removed duplicated region for block: B:523:0x0f7f  */
    /* JADX WARN: Removed duplicated region for block: B:573:0x06cb A[SYNTHETIC] */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public void accept(org.codehaus.jackson.org.objectweb.asm.ClassVisitor r49, org.codehaus.jackson.org.objectweb.asm.Attribute[] r50, int r51) {
        /*
            Method dump skipped, instruction units count: 4142
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: org.codehaus.jackson.org.objectweb.asm.ClassReader.accept(org.codehaus.jackson.org.objectweb.asm.ClassVisitor, org.codehaus.jackson.org.objectweb.asm.Attribute[], int):void");
    }

    public int getAccess() {
        return readUnsignedShort(this.header);
    }

    public String getClassName() {
        return readClass(this.header + 2, new char[this.d]);
    }

    public String[] getInterfaces() {
        int i = this.header + 6;
        int unsignedShort = readUnsignedShort(i);
        String[] strArr = new String[unsignedShort];
        if (unsignedShort > 0) {
            char[] cArr = new char[this.d];
            for (int i2 = 0; i2 < unsignedShort; i2++) {
                i += 2;
                strArr[i2] = readClass(i, cArr);
            }
        }
        return strArr;
    }

    public int getItem(int i) {
        return this.a[i];
    }

    public String getSuperName() {
        int i = this.a[readUnsignedShort(this.header + 4)];
        if (i == 0) {
            return null;
        }
        return readUTF8(i, new char[this.d]);
    }

    public int readByte(int i) {
        return this.b[i] & 255;
    }

    public String readClass(int i, char[] cArr) {
        return readUTF8(this.a[readUnsignedShort(i)], cArr);
    }

    public Object readConst(int i, char[] cArr) {
        int i2 = this.a[i];
        switch (this.b[i2 - 1]) {
            case 3:
                return new Integer(readInt(i2));
            case 4:
                return new Float(Float.intBitsToFloat(readInt(i2)));
            case 5:
                return new Long(readLong(i2));
            case 6:
                return new Double(Double.longBitsToDouble(readLong(i2)));
            case 7:
                return Type.getObjectType(readUTF8(i2, cArr));
            default:
                return readUTF8(i2, cArr);
        }
    }

    public int readInt(int i) {
        byte[] bArr = this.b;
        return (bArr[i + 3] & 255) | ((bArr[i] & 255) << 24) | ((bArr[i + 1] & 255) << 16) | ((bArr[i + 2] & 255) << 8);
    }

    protected Label readLabel(int i, Label[] labelArr) {
        if (labelArr[i] == null) {
            labelArr[i] = new Label();
        }
        return labelArr[i];
    }

    public long readLong(int i) {
        return (((long) readInt(i)) << 32) | (((long) readInt(i + 4)) & 4294967295L);
    }

    public short readShort(int i) {
        byte[] bArr = this.b;
        return (short) ((bArr[i + 1] & 255) | ((bArr[i] & 255) << 8));
    }

    public String readUTF8(int i, char[] cArr) {
        int unsignedShort = readUnsignedShort(i);
        String str = this.c[unsignedShort];
        if (str != null) {
            return str;
        }
        int i2 = this.a[unsignedShort];
        String[] strArr = this.c;
        String strA = a(i2 + 2, readUnsignedShort(i2), cArr);
        strArr[unsignedShort] = strA;
        return strA;
    }

    public int readUnsignedShort(int i) {
        byte[] bArr = this.b;
        return (bArr[i + 1] & 255) | ((bArr[i] & 255) << 8);
    }
}
