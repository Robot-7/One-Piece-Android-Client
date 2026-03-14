package com.igexin.a.a.b;

import android.support.v4.view.MotionEventCompat;
import java.io.IOException;
import java.io.OutputStream;
import org.codehaus.jackson.org.objectweb.asm.signature.SignatureVisitor;

/* JADX INFO: loaded from: classes.dex */
public class a extends OutputStream {
    private OutputStream a;
    private int b = 0;
    private int c = 0;
    private int d = 0;
    private int e;

    public a(OutputStream outputStream, int i) {
        this.a = null;
        this.e = 0;
        this.a = outputStream;
        this.e = i;
    }

    protected void a() throws IOException {
        char cCharAt = SignatureVisitor.INSTANCEOF;
        if (this.c > 0) {
            if (this.e > 0 && this.d == this.e) {
                this.a.write("\r\n".getBytes());
                this.d = 0;
            }
            char cCharAt2 = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/".charAt((this.b << 8) >>> 26);
            char cCharAt3 = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/".charAt((this.b << 14) >>> 26);
            char cCharAt4 = this.c < 2 ? '=' : "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/".charAt((this.b << 20) >>> 26);
            if (this.c >= 3) {
                cCharAt = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/".charAt((this.b << 26) >>> 26);
            }
            this.a.write(cCharAt2);
            this.a.write(cCharAt3);
            this.a.write(cCharAt4);
            this.a.write(cCharAt);
            this.d += 4;
            this.c = 0;
            this.b = 0;
        }
    }

    @Override // java.io.OutputStream, java.io.Closeable, java.lang.AutoCloseable
    public void close() throws IOException {
        a();
        this.a.close();
    }

    @Override // java.io.OutputStream
    public void write(int i) throws IOException {
        this.b = ((i & MotionEventCompat.ACTION_MASK) << (16 - (this.c * 8))) | this.b;
        this.c++;
        if (this.c == 3) {
            a();
        }
    }
}
