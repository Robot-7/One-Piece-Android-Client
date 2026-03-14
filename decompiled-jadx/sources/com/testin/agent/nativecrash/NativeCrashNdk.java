package com.testin.agent.nativecrash;

import android.content.Context;
import java.io.File;
import java.io.IOException;
import java.io.InputStream;

/* JADX INFO: loaded from: classes.dex */
public class NativeCrashNdk {
    private static boolean a = false;

    public static void a(Context context) {
        boolean zB = true;
        if (c(context)) {
            zB = b(context);
        } else {
            try {
                System.loadLibrary("NativeCrash");
            } catch (Throwable th) {
                zB = false;
            }
        }
        if (zB) {
            try {
                if (installNdk()) {
                    a = true;
                    com.testin.agent.base.b.a("NativeCrashNdk", "install NativeCrash Ndk success");
                }
            } catch (Throwable th2) {
                com.testin.agent.base.b.c("NativeCrashNdk", "install NativeCrash Ndk failed!");
            }
        }
    }

    public static boolean a() {
        return a;
    }

    /* JADX WARN: Removed duplicated region for block: B:34:0x0056 A[Catch: IOException -> 0x005a, TRY_LEAVE, TryCatch #1 {IOException -> 0x005a, blocks: (B:32:0x0051, B:34:0x0056), top: B:46:0x0051 }] */
    /* JADX WARN: Removed duplicated region for block: B:46:0x0051 A[EXC_TOP_SPLITTER, SYNTHETIC] */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public static boolean a(android.content.Context r6, java.io.File r7) throws java.lang.Throwable {
        /*
            r2 = 0
            r0 = 0
            java.io.File r1 = r7.getParentFile()     // Catch: java.lang.Throwable -> L4d java.lang.Exception -> L66
            boolean r1 = r1.mkdirs()     // Catch: java.lang.Throwable -> L4d java.lang.Exception -> L66
            if (r1 == 0) goto L44
            java.io.FileOutputStream r3 = new java.io.FileOutputStream     // Catch: java.lang.Throwable -> L4d java.lang.Exception -> L66
            r3.<init>(r7)     // Catch: java.lang.Throwable -> L4d java.lang.Exception -> L66
            java.io.InputStream r2 = d(r6)     // Catch: java.lang.Exception -> L30 java.lang.Throwable -> L64
            r1 = 8192(0x2000, float:1.14794E-41)
            byte[] r1 = new byte[r1]     // Catch: java.lang.Exception -> L30 java.lang.Throwable -> L64
        L19:
            int r4 = r2.read(r1)     // Catch: java.lang.Exception -> L30 java.lang.Throwable -> L64
            if (r4 >= 0) goto L2b
            r0 = 1
        L20:
            if (r3 == 0) goto L25
            r3.close()     // Catch: java.io.IOException -> L5f
        L25:
            if (r2 == 0) goto L2a
            r2.close()     // Catch: java.io.IOException -> L5f
        L2a:
            return r0
        L2b:
            r5 = 0
            r3.write(r1, r5, r4)     // Catch: java.lang.Exception -> L30 java.lang.Throwable -> L64
            goto L19
        L30:
            r1 = move-exception
        L31:
            com.testin.agent.b.e.a(r1)     // Catch: java.lang.Throwable -> L64
            if (r3 == 0) goto L39
            r3.close()     // Catch: java.io.IOException -> L3f
        L39:
            if (r2 == 0) goto L2a
            r2.close()     // Catch: java.io.IOException -> L3f
            goto L2a
        L3f:
            r1 = move-exception
            com.testin.agent.b.e.a(r1)
            goto L2a
        L44:
            java.lang.String r1 = "NativeCrashNdk"
            java.lang.String r3 = "Directories make fail"
            com.testin.agent.base.b.c(r1, r3)     // Catch: java.lang.Throwable -> L4d java.lang.Exception -> L66
            r3 = r2
            goto L20
        L4d:
            r0 = move-exception
            r3 = r2
        L4f:
            if (r3 == 0) goto L54
            r3.close()     // Catch: java.io.IOException -> L5a
        L54:
            if (r2 == 0) goto L59
            r2.close()     // Catch: java.io.IOException -> L5a
        L59:
            throw r0
        L5a:
            r1 = move-exception
            com.testin.agent.b.e.a(r1)
            goto L59
        L5f:
            r1 = move-exception
            com.testin.agent.b.e.a(r1)
            goto L2a
        L64:
            r0 = move-exception
            goto L4f
        L66:
            r1 = move-exception
            r3 = r2
            goto L31
        */
        throw new UnsupportedOperationException("Method not decompiled: com.testin.agent.nativecrash.NativeCrashNdk.a(android.content.Context, java.io.File):boolean");
    }

    public static boolean b(Context context) {
        File file = new File(context.getFilesDir(), "/com.testin.agent/lib/");
        File file2 = new File(file, "libNativeCrash.so");
        try {
            if (!file2.exists()) {
                if (!a(context, file2)) {
                    if (file2.delete()) {
                        com.testin.agent.base.b.a("NativeCrashNdk", "Delete localFile2 success");
                        return false;
                    }
                    com.testin.agent.base.b.c("NativeCrashNdk", "Delete localFile2 fail");
                    return false;
                }
                if (file.delete()) {
                    com.testin.agent.base.b.a("NativeCrashNdk", "Delete localFile1 success");
                } else {
                    com.testin.agent.base.b.c("NativeCrashNdk", "Delete localFile1 fail");
                }
            }
            System.load(file2.getAbsolutePath());
            return true;
        } catch (Throwable th) {
            com.testin.agent.base.b.c("NativeCrashNdk", "Unable to install NDK library" + th);
            if (file2 == null || !file2.exists()) {
                return false;
            }
            if (file2.delete()) {
                com.testin.agent.base.b.a("NativeCrashNdk", "Delete localFile2 success");
                return false;
            }
            com.testin.agent.base.b.c("NativeCrashNdk", "Delete localFile2 fail");
            return false;
        }
    }

    public static boolean c(Context context) {
        try {
            d(context);
            return true;
        } catch (IOException e) {
            return false;
        }
    }

    public static InputStream d(Context context) {
        return context.getAssets().open(String.valueOf(System.getProperty("os.arch").contains("v7") ? String.valueOf("armeabi") + "-v7a" : "armeabi") + "/libNativeCrash.so");
    }

    public static native boolean installNdk();
}
