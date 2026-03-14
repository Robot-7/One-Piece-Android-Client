package com.igexin.getuiext.ui;

import android.graphics.Rect;
import java.nio.ByteBuffer;
import java.nio.ByteOrder;

/* JADX INFO: loaded from: classes.dex */
class e {
    public final Rect a = new Rect();
    public int[] b;
    public int[] c;
    public int[] d;

    e() {
    }

    public static e a(byte[] bArr) {
        ByteBuffer byteBufferOrder = ByteBuffer.wrap(bArr).order(ByteOrder.nativeOrder());
        if (byteBufferOrder.get() == 0) {
            return null;
        }
        e eVar = new e();
        eVar.b = new int[byteBufferOrder.get()];
        eVar.c = new int[byteBufferOrder.get()];
        eVar.d = new int[byteBufferOrder.get()];
        a(eVar.b.length);
        a(eVar.c.length);
        byteBufferOrder.getInt();
        byteBufferOrder.getInt();
        eVar.a.left = byteBufferOrder.getInt();
        eVar.a.right = byteBufferOrder.getInt();
        eVar.a.top = byteBufferOrder.getInt();
        eVar.a.bottom = byteBufferOrder.getInt();
        byteBufferOrder.getInt();
        a(eVar.b, byteBufferOrder);
        a(eVar.c, byteBufferOrder);
        a(eVar.d, byteBufferOrder);
        return eVar;
    }

    private static void a(int i) {
        if (i == 0 || (i & 1) != 0) {
            throw new RuntimeException("invalid nine-patch: " + i);
        }
    }

    private static void a(int[] iArr, ByteBuffer byteBuffer) {
        int length = iArr.length;
        for (int i = 0; i < length; i++) {
            iArr[i] = byteBuffer.getInt();
        }
    }
}
