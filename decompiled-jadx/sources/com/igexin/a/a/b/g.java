package com.igexin.a.a.b;

import android.support.v4.view.MotionEventCompat;
import com.tencent.stat.common.StatConstants;
import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.zip.GZIPInputStream;
import java.util.zip.GZIPOutputStream;
import org.codehaus.jackson.org.objectweb.asm.Opcodes;

/* JADX INFO: loaded from: classes.dex */
public final class g {
    public static final int a(int i, byte[] bArr, int i2) {
        bArr[i2] = (byte) ((i >> 24) & MotionEventCompat.ACTION_MASK);
        bArr[i2 + 1] = (byte) ((i >> 16) & MotionEventCompat.ACTION_MASK);
        bArr[i2 + 2] = (byte) ((i >> 8) & MotionEventCompat.ACTION_MASK);
        bArr[i2 + 3] = (byte) (i & MotionEventCompat.ACTION_MASK);
        return 4;
    }

    public static final int a(long j, byte[] bArr, int i) {
        bArr[i] = (byte) ((j >> 56) & 255);
        bArr[i + 1] = (byte) ((j >> 48) & 255);
        bArr[i + 2] = (byte) ((j >> 40) & 255);
        bArr[i + 3] = (byte) ((j >> 32) & 255);
        bArr[i + 4] = (byte) ((j >> 24) & 255);
        bArr[i + 5] = (byte) ((j >> 16) & 255);
        bArr[i + 6] = (byte) ((j >> 8) & 255);
        bArr[i + 7] = (byte) (255 & j);
        return 8;
    }

    public static final int a(byte[] bArr, int i) {
        return bArr[i] & 255;
    }

    public static final int a(byte[] bArr, int i, byte[] bArr2, int i2, int i3) {
        System.arraycopy(bArr, i, bArr2, i2, i3);
        return i3;
    }

    public static final String a(String[] strArr) {
        StringBuffer stringBuffer = new StringBuffer();
        if (!strArr[0].equals(StatConstants.MTA_COOPERATION_TAG)) {
            stringBuffer.append(strArr[0]).append("://");
        }
        if (!strArr[1].equals(StatConstants.MTA_COOPERATION_TAG)) {
            stringBuffer.append(strArr[1]);
        }
        if (!strArr[2].equals(StatConstants.MTA_COOPERATION_TAG)) {
            stringBuffer.append(':').append(strArr[2]);
        }
        if (!strArr[3].equals(StatConstants.MTA_COOPERATION_TAG)) {
            stringBuffer.append(strArr[3]);
            if (!strArr[3].equals("/")) {
                stringBuffer.append('/');
            }
        }
        if (!strArr[4].equals(StatConstants.MTA_COOPERATION_TAG)) {
            stringBuffer.append(strArr[4]);
        }
        if (!strArr[5].equals(StatConstants.MTA_COOPERATION_TAG)) {
            stringBuffer.append('?').append(strArr[5]);
        }
        return stringBuffer.toString();
    }

    private static void a(InputStream inputStream, OutputStream outputStream) throws IOException {
        byte[] bArr = new byte[1024];
        while (true) {
            int i = inputStream.read(bArr);
            if (i == -1) {
                return;
            } else {
                outputStream.write(bArr, 0, i);
            }
        }
    }

    public static void a(InputStream inputStream, OutputStream outputStream, int i) throws IOException {
        a aVar = new a(outputStream, i);
        a(inputStream, aVar);
        aVar.a();
    }

    public static final byte[] a(int i) {
        int i2 = 0;
        int i3 = 0;
        do {
            int i4 = ((i & Opcodes.LAND) << 24) | i2;
            i >>>= 7;
            i3++;
            i2 = i > 0 ? (i4 >>> 8) | Integer.MIN_VALUE : i4;
        } while (i > 0);
        byte[] bArr = new byte[i3];
        int i5 = 24;
        for (int i6 = 0; i6 < i3; i6++) {
            bArr[i6] = (byte) (i2 >>> i5);
            i5 -= 8;
        }
        return bArr;
    }

    public static byte[] a(byte[] bArr) throws Throwable {
        GZIPOutputStream gZIPOutputStream;
        Throwable th;
        byte[] byteArray = null;
        ByteArrayOutputStream byteArrayOutputStream = new ByteArrayOutputStream();
        try {
            gZIPOutputStream = new GZIPOutputStream(byteArrayOutputStream);
        } catch (IOException e) {
            gZIPOutputStream = null;
        } catch (Throwable th2) {
            gZIPOutputStream = null;
            th = th2;
        }
        try {
            gZIPOutputStream.write(bArr);
            gZIPOutputStream.finish();
            byteArray = byteArrayOutputStream.toByteArray();
            if (gZIPOutputStream != null) {
                try {
                    gZIPOutputStream.close();
                } catch (IOException e2) {
                    e2.printStackTrace();
                }
            }
            if (byteArrayOutputStream != null) {
                byteArrayOutputStream.close();
            }
        } catch (IOException e3) {
            if (gZIPOutputStream != null) {
                try {
                    gZIPOutputStream.close();
                } catch (IOException e4) {
                    e4.printStackTrace();
                }
            }
            if (byteArrayOutputStream != null) {
                byteArrayOutputStream.close();
            }
        } catch (Throwable th3) {
            th = th3;
            if (gZIPOutputStream != null) {
                try {
                    gZIPOutputStream.close();
                } catch (IOException e5) {
                    e5.printStackTrace();
                    throw th;
                }
            }
            if (byteArrayOutputStream != null) {
                byteArrayOutputStream.close();
            }
            throw th;
        }
        return byteArray;
    }

    public static final String[] a(String str) {
        StringBuffer stringBuffer = new StringBuffer(str.toLowerCase());
        String[] strArr = new String[6];
        for (int i = 0; i < 6; i++) {
            strArr[i] = StatConstants.MTA_COOPERATION_TAG;
        }
        int iIndexOf = str.indexOf(":");
        if (iIndexOf > 0) {
            strArr[0] = str.substring(0, iIndexOf);
            stringBuffer.delete(0, iIndexOf + 1);
        } else if (iIndexOf == 0) {
            throw new IllegalArgumentException("url format error - protocol");
        }
        if (stringBuffer.length() >= 2 && stringBuffer.charAt(0) == '/' && stringBuffer.charAt(1) == '/') {
            stringBuffer.delete(0, 2);
            int iIndexOf2 = stringBuffer.toString().indexOf(47);
            if (iIndexOf2 < 0) {
                iIndexOf2 = stringBuffer.length();
            }
            if (iIndexOf2 != 0) {
                int iIndexOf3 = stringBuffer.toString().indexOf(58);
                if (iIndexOf3 < 0) {
                    iIndexOf3 = iIndexOf2;
                } else {
                    if (iIndexOf3 > iIndexOf2) {
                        throw new IllegalArgumentException("url format error - port");
                    }
                    strArr[2] = stringBuffer.toString().substring(iIndexOf3 + 1, iIndexOf2);
                }
                strArr[1] = stringBuffer.toString().substring(0, iIndexOf3);
                stringBuffer.delete(0, iIndexOf2);
            }
        }
        if (stringBuffer.length() > 0) {
            String string = stringBuffer.toString();
            int iLastIndexOf = string.lastIndexOf(47);
            if (iLastIndexOf > 0) {
                strArr[3] = string.substring(0, iLastIndexOf);
            } else if (iLastIndexOf == 0) {
                if (string.indexOf(63) > 0) {
                    throw new IllegalArgumentException("url format error - path");
                }
                strArr[3] = string;
                return strArr;
            }
            if (iLastIndexOf < string.length() - 1) {
                String strSubstring = string.substring(iLastIndexOf + 1, string.length());
                int iIndexOf4 = strSubstring.indexOf(63);
                if (iIndexOf4 >= 0) {
                    strArr[4] = strSubstring.substring(0, iIndexOf4);
                    strArr[5] = strSubstring.substring(iIndexOf4 + 1);
                } else {
                    strArr[4] = strSubstring;
                }
            }
        } else {
            strArr[3] = "/";
        }
        return strArr;
    }

    public static final int b(int i, byte[] bArr, int i2) {
        bArr[i2] = (byte) ((i >> 8) & MotionEventCompat.ACTION_MASK);
        bArr[i2 + 1] = (byte) (i & MotionEventCompat.ACTION_MASK);
        return 2;
    }

    public static final int b(byte[] bArr, int i) {
        return ((bArr[i] & 255) << 8) | (bArr[i + 1] & 255);
    }

    public static byte[] b(byte[] bArr) throws Throwable {
        GZIPInputStream gZIPInputStream;
        Throwable th;
        ByteArrayOutputStream byteArrayOutputStream;
        byte[] byteArray = null;
        ByteArrayInputStream byteArrayInputStream = new ByteArrayInputStream(bArr);
        try {
            gZIPInputStream = new GZIPInputStream(byteArrayInputStream);
            try {
                byteArrayOutputStream = new ByteArrayOutputStream();
            } catch (IOException e) {
                byteArrayOutputStream = null;
            } catch (Throwable th2) {
                byteArrayOutputStream = null;
                th = th2;
            }
        } catch (IOException e2) {
            byteArrayOutputStream = null;
            gZIPInputStream = null;
        } catch (Throwable th3) {
            gZIPInputStream = null;
            th = th3;
            byteArrayOutputStream = null;
        }
        while (true) {
            try {
                int i = gZIPInputStream.read();
                if (i == -1) {
                    break;
                }
                byteArrayOutputStream.write(i);
            } catch (IOException e3) {
                if (byteArrayOutputStream != null) {
                    try {
                        byteArrayOutputStream.close();
                    } catch (IOException e4) {
                    }
                }
                if (gZIPInputStream != null) {
                    gZIPInputStream.close();
                }
                if (byteArrayInputStream != null) {
                    byteArrayInputStream.close();
                }
            } catch (Throwable th4) {
                th = th4;
                if (byteArrayOutputStream != null) {
                    try {
                        byteArrayOutputStream.close();
                    } catch (IOException e5) {
                        throw th;
                    }
                }
                if (gZIPInputStream != null) {
                    gZIPInputStream.close();
                }
                if (byteArrayInputStream != null) {
                    byteArrayInputStream.close();
                }
                throw th;
            }
            return byteArray;
        }
        byteArray = byteArrayOutputStream.toByteArray();
        if (byteArrayOutputStream != null) {
            try {
                byteArrayOutputStream.close();
            } catch (IOException e6) {
            }
        }
        if (gZIPInputStream != null) {
            gZIPInputStream.close();
        }
        if (byteArrayInputStream != null) {
            byteArrayInputStream.close();
        }
        return byteArray;
    }

    public static final int c(int i, byte[] bArr, int i2) {
        bArr[i2] = (byte) i;
        return 1;
    }

    public static final int c(byte[] bArr, int i) {
        return ((bArr[i] & 255) << 24) | ((bArr[i + 1] & 255) << 16) | ((bArr[i + 2] & 255) << 8) | (bArr[i + 3] & 255);
    }

    public static final long d(byte[] bArr, int i) {
        return ((((long) bArr[i]) & 255) << 56) | ((((long) bArr[i + 1]) & 255) << 48) | ((((long) bArr[i + 2]) & 255) << 40) | ((((long) bArr[i + 3]) & 255) << 32) | ((((long) bArr[i + 4]) & 255) << 24) | ((((long) bArr[i + 5]) & 255) << 16) | ((((long) bArr[i + 6]) & 255) << 8) | (((long) bArr[i + 7]) & 255);
    }

    public static byte[] e(byte[] bArr, int i) {
        ByteArrayInputStream byteArrayInputStream = new ByteArrayInputStream(bArr);
        ByteArrayOutputStream byteArrayOutputStream = new ByteArrayOutputStream();
        try {
            try {
                a(byteArrayInputStream, byteArrayOutputStream, i);
                try {
                    byteArrayInputStream.close();
                } catch (Throwable th) {
                }
                try {
                    byteArrayOutputStream.close();
                } catch (Throwable th2) {
                }
                return byteArrayOutputStream.toByteArray();
            } catch (Throwable th3) {
                try {
                    byteArrayInputStream.close();
                } catch (Throwable th4) {
                }
                try {
                    byteArrayOutputStream.close();
                    throw th3;
                } catch (Throwable th5) {
                    throw th3;
                }
            }
        } catch (IOException e) {
            throw new RuntimeException("Unexpected I/O error", e);
        }
    }
}
