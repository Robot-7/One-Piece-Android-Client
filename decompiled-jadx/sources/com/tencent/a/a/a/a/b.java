package com.tencent.a.a.a.a;

import android.content.Context;
import android.os.Environment;
import android.util.Log;
import java.io.BufferedWriter;
import java.io.File;
import java.io.FileWriter;

/* JADX INFO: loaded from: classes.dex */
final class b extends f {
    b(Context context) {
        super(context);
    }

    @Override // com.tencent.a.a.a.a.f
    protected final boolean a() {
        return h.a(this.e, "android.permission.WRITE_EXTERNAL_STORAGE") && Environment.getExternalStorageState().equals("mounted");
    }

    /* JADX WARN: Code restructure failed: missing block: B:12:0x0045, code lost:
    
        android.util.Log.i("MID", "read mid from InternalStorage:" + r0[1]);
        r0 = r0[1];
     */
    @Override // com.tencent.a.a.a.a.f
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    protected final java.lang.String b() {
        /*
            r5 = this;
            r1 = 0
            monitor-enter(r5)
            java.lang.String r0 = "read mid from InternalStorage"
            java.lang.String r2 = "MID"
            android.util.Log.i(r2, r0)     // Catch: java.lang.Throwable -> L6b
            java.io.File r0 = new java.io.File     // Catch: java.lang.Throwable -> L6b
            java.io.File r2 = android.os.Environment.getExternalStorageDirectory()     // Catch: java.lang.Throwable -> L6b
            java.lang.String r3 = "6X8Y4XdM2Vhvn0KfzcEatGnWaNU="
            java.lang.String r3 = com.tencent.a.a.a.a.h.f(r3)     // Catch: java.lang.Throwable -> L6b
            r0.<init>(r2, r3)     // Catch: java.lang.Throwable -> L6b
            java.util.List r0 = com.tencent.a.a.a.a.a.a(r0)     // Catch: java.io.IOException -> L63 java.lang.Throwable -> L6b
            java.util.Iterator r2 = r0.iterator()     // Catch: java.io.IOException -> L63 java.lang.Throwable -> L6b
        L20:
            boolean r0 = r2.hasNext()     // Catch: java.io.IOException -> L63 java.lang.Throwable -> L6b
            if (r0 == 0) goto L61
            java.lang.Object r0 = r2.next()     // Catch: java.io.IOException -> L63 java.lang.Throwable -> L6b
            java.lang.String r0 = (java.lang.String) r0     // Catch: java.io.IOException -> L63 java.lang.Throwable -> L6b
            java.lang.String r3 = ","
            java.lang.String[] r0 = r0.split(r3)     // Catch: java.io.IOException -> L63 java.lang.Throwable -> L6b
            int r3 = r0.length     // Catch: java.io.IOException -> L63 java.lang.Throwable -> L6b
            r4 = 2
            if (r3 != r4) goto L20
            r3 = 0
            r3 = r0[r3]     // Catch: java.io.IOException -> L63 java.lang.Throwable -> L6b
            java.lang.String r4 = "4kU71lN96TJUomD1vOU9lgj9Tw=="
            java.lang.String r4 = com.tencent.a.a.a.a.h.f(r4)     // Catch: java.io.IOException -> L63 java.lang.Throwable -> L6b
            boolean r3 = r3.equals(r4)     // Catch: java.io.IOException -> L63 java.lang.Throwable -> L6b
            if (r3 == 0) goto L20
            java.lang.StringBuilder r2 = new java.lang.StringBuilder     // Catch: java.io.IOException -> L63 java.lang.Throwable -> L6b
            java.lang.String r3 = "read mid from InternalStorage:"
            r2.<init>(r3)     // Catch: java.io.IOException -> L63 java.lang.Throwable -> L6b
            r3 = 1
            r3 = r0[r3]     // Catch: java.io.IOException -> L63 java.lang.Throwable -> L6b
            java.lang.StringBuilder r2 = r2.append(r3)     // Catch: java.io.IOException -> L63 java.lang.Throwable -> L6b
            java.lang.String r2 = r2.toString()     // Catch: java.io.IOException -> L63 java.lang.Throwable -> L6b
            java.lang.String r3 = "MID"
            android.util.Log.i(r3, r2)     // Catch: java.io.IOException -> L63 java.lang.Throwable -> L6b
            r2 = 1
            r0 = r0[r2]     // Catch: java.io.IOException -> L63 java.lang.Throwable -> L6b
        L5f:
            monitor-exit(r5)     // Catch: java.lang.Throwable -> L6b
            return r0
        L61:
            r0 = r1
            goto L5f
        L63:
            r0 = move-exception
            java.lang.String r2 = "MID"
            android.util.Log.w(r2, r0)     // Catch: java.lang.Throwable -> L6b
            r0 = r1
            goto L5f
        L6b:
            r0 = move-exception
            monitor-exit(r5)
            throw r0
        */
        throw new UnsupportedOperationException("Method not decompiled: com.tencent.a.a.a.a.b.b():java.lang.String");
    }

    @Override // com.tencent.a.a.a.a.f
    protected final void b(String str) {
        synchronized (this) {
            Log.i("MID", "write mid to InternalStorage");
            a.a(Environment.getExternalStorageDirectory() + "/" + h.f("6X8Y4XdM2Vhvn0I="));
            try {
                BufferedWriter bufferedWriter = new BufferedWriter(new FileWriter(new File(Environment.getExternalStorageDirectory(), h.f("6X8Y4XdM2Vhvn0KfzcEatGnWaNU="))));
                bufferedWriter.write(h.f("4kU71lN96TJUomD1vOU9lgj9Tw==") + "," + str);
                bufferedWriter.write("\n");
                bufferedWriter.close();
            } catch (Exception e) {
                Log.w("MID", e);
            }
        }
    }
}
