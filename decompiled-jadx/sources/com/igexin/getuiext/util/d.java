package com.igexin.getuiext.util;

import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.zip.GZIPOutputStream;

/* JADX INFO: loaded from: classes.dex */
public final class d {
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

    public static byte[] a(byte[] bArr) {
        ByteArrayOutputStream byteArrayOutputStream = new ByteArrayOutputStream();
        byte[] byteArray = null;
        try {
            GZIPOutputStream gZIPOutputStream = new GZIPOutputStream(byteArrayOutputStream);
            gZIPOutputStream.write(bArr);
            gZIPOutputStream.close();
            byteArray = byteArrayOutputStream.toByteArray();
            byteArrayOutputStream.close();
            return byteArray;
        } catch (IOException e) {
            return byteArray;
        }
    }

    public static byte[] a(byte[] bArr, int i) {
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
