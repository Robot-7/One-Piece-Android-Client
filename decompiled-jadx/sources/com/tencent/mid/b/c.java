package com.tencent.mid.b;

import android.content.Context;
import android.os.Environment;
import com.tencent.mid.util.Util;
import com.tencent.stat.common.StatConstants;
import java.io.BufferedWriter;
import java.io.File;
import java.io.FileWriter;
import java.io.IOException;

/* JADX INFO: loaded from: classes.dex */
public class c extends f {
    public c(Context context) {
        super(context);
    }

    @Override // com.tencent.mid.b.f
    protected void a(a aVar) {
    }

    @Override // com.tencent.mid.b.f
    protected void a(String str) {
        synchronized (this) {
            Util.logInfo("write mid to InternalStorage");
            b.a(Environment.getExternalStorageDirectory() + "/" + e());
            File file = new File(Environment.getExternalStorageDirectory(), f());
            if (file != null) {
                try {
                    BufferedWriter bufferedWriter = new BufferedWriter(new FileWriter(file));
                    bufferedWriter.write(k() + "," + str);
                    bufferedWriter.write("\n");
                    bufferedWriter.close();
                } catch (IOException e) {
                    Util.logWarn(e);
                }
            }
        }
    }

    @Override // com.tencent.mid.b.f
    protected boolean a() {
        return Util.checkPermission(this.a, "android.permission.WRITE_EXTERNAL_STORAGE") && Environment.getExternalStorageState().equals("mounted");
    }

    /* JADX WARN: Code restructure failed: missing block: B:13:0x0041, code lost:
    
        com.tencent.mid.util.Util.logInfo("read mid from InternalStorage:" + r0[1]);
        r0 = r0[1];
     */
    @Override // com.tencent.mid.b.f
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    protected java.lang.String b() {
        /*
            r5 = this;
            r1 = 0
            monitor-enter(r5)
            java.lang.String r0 = "read mid from InternalStorage"
            com.tencent.mid.util.Util.logInfo(r0)     // Catch: java.lang.Throwable -> L65
            java.io.File r0 = new java.io.File     // Catch: java.lang.Throwable -> L65
            java.io.File r2 = android.os.Environment.getExternalStorageDirectory()     // Catch: java.lang.Throwable -> L65
            java.lang.String r3 = f()     // Catch: java.lang.Throwable -> L65
            r0.<init>(r2, r3)     // Catch: java.lang.Throwable -> L65
            if (r0 == 0) goto L5e
            java.util.List r0 = com.tencent.mid.b.b.a(r0)     // Catch: java.io.IOException -> L60 java.lang.Throwable -> L65
            java.util.Iterator r2 = r0.iterator()     // Catch: java.io.IOException -> L60 java.lang.Throwable -> L65
        L1e:
            boolean r0 = r2.hasNext()     // Catch: java.io.IOException -> L60 java.lang.Throwable -> L65
            if (r0 == 0) goto L68
            java.lang.Object r0 = r2.next()     // Catch: java.io.IOException -> L60 java.lang.Throwable -> L65
            java.lang.String r0 = (java.lang.String) r0     // Catch: java.io.IOException -> L60 java.lang.Throwable -> L65
            java.lang.String r3 = ","
            java.lang.String[] r0 = r0.split(r3)     // Catch: java.io.IOException -> L60 java.lang.Throwable -> L65
            int r3 = r0.length     // Catch: java.io.IOException -> L60 java.lang.Throwable -> L65
            r4 = 2
            if (r3 != r4) goto L1e
            r3 = 0
            r3 = r0[r3]     // Catch: java.io.IOException -> L60 java.lang.Throwable -> L65
            java.lang.String r4 = r5.k()     // Catch: java.io.IOException -> L60 java.lang.Throwable -> L65
            boolean r3 = r3.equals(r4)     // Catch: java.io.IOException -> L60 java.lang.Throwable -> L65
            if (r3 == 0) goto L1e
            java.lang.StringBuilder r2 = new java.lang.StringBuilder     // Catch: java.io.IOException -> L60 java.lang.Throwable -> L65
            r2.<init>()     // Catch: java.io.IOException -> L60 java.lang.Throwable -> L65
            java.lang.String r3 = "read mid from InternalStorage:"
            java.lang.StringBuilder r2 = r2.append(r3)     // Catch: java.io.IOException -> L60 java.lang.Throwable -> L65
            r3 = 1
            r3 = r0[r3]     // Catch: java.io.IOException -> L60 java.lang.Throwable -> L65
            java.lang.StringBuilder r2 = r2.append(r3)     // Catch: java.io.IOException -> L60 java.lang.Throwable -> L65
            java.lang.String r2 = r2.toString()     // Catch: java.io.IOException -> L60 java.lang.Throwable -> L65
            com.tencent.mid.util.Util.logInfo(r2)     // Catch: java.io.IOException -> L60 java.lang.Throwable -> L65
            r2 = 1
            r0 = r0[r2]     // Catch: java.io.IOException -> L60 java.lang.Throwable -> L65
        L5d:
            r1 = r0
        L5e:
            monitor-exit(r5)     // Catch: java.lang.Throwable -> L65
            return r1
        L60:
            r0 = move-exception
            com.tencent.mid.util.Util.logWarn(r0)     // Catch: java.lang.Throwable -> L65
            goto L5e
        L65:
            r0 = move-exception
            monitor-exit(r5)     // Catch: java.lang.Throwable -> L65
            throw r0
        L68:
            r0 = r1
            goto L5d
        */
        throw new UnsupportedOperationException("Method not decompiled: com.tencent.mid.b.c.b():java.lang.String");
    }

    @Override // com.tencent.mid.b.f
    protected void c() {
        synchronized (this) {
            b.a(Environment.getExternalStorageDirectory() + "/" + e());
            File file = new File(Environment.getExternalStorageDirectory(), f());
            if (file != null) {
                try {
                    BufferedWriter bufferedWriter = new BufferedWriter(new FileWriter(file));
                    bufferedWriter.write(StatConstants.MTA_COOPERATION_TAG);
                    bufferedWriter.close();
                } catch (IOException e) {
                    Util.logWarn(e);
                }
            }
        }
    }

    @Override // com.tencent.mid.b.f
    protected a d() {
        return null;
    }
}
