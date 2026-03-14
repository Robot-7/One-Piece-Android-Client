package com.flurry.sdk;

import android.content.Context;
import android.os.Build;
import android.os.Environment;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;

/* JADX INFO: loaded from: classes.dex */
public final class fa {
    private static String a = fa.class.getSimpleName();

    public static File a(boolean z) {
        File externalFilesDir = null;
        Context contextB = Cdo.a().b();
        if (z && "mounted".equals(Environment.getExternalStorageState()) && (Build.VERSION.SDK_INT >= 19 || contextB.checkCallingOrSelfPermission("android.permission.WRITE_EXTERNAL_STORAGE") == 0)) {
            externalFilesDir = contextB.getExternalFilesDir(null);
        }
        if (externalFilesDir == null) {
            return contextB.getFilesDir();
        }
        return externalFilesDir;
    }

    public static File b(boolean z) {
        Context contextB = Cdo.a().b();
        File externalCacheDir = null;
        if (z && "mounted".equals(Environment.getExternalStorageState()) && (Build.VERSION.SDK_INT >= 19 || contextB.checkCallingOrSelfPermission("android.permission.WRITE_EXTERNAL_STORAGE") == 0)) {
            externalCacheDir = contextB.getExternalCacheDir();
        }
        if (externalCacheDir == null) {
            return contextB.getCacheDir();
        }
        return externalCacheDir;
    }

    public static boolean a(File file) {
        if (file == null || file.getAbsoluteFile() == null) {
            return false;
        }
        File parentFile = file.getParentFile();
        if (parentFile == null) {
            return true;
        }
        if (parentFile.mkdirs() || parentFile.isDirectory()) {
            return true;
        }
        el.a(6, a, "Unable to create persistent dir: " + parentFile);
        return false;
    }

    public static boolean b(File file) {
        if (file != null && file.isDirectory()) {
            for (String str : file.list()) {
                if (!b(new File(file, str))) {
                    return false;
                }
            }
        }
        return file.delete();
    }

    @Deprecated
    public static String c(File file) throws Throwable {
        FileInputStream fileInputStream;
        Throwable th;
        StringBuilder sb;
        if (file == null || !file.exists()) {
            el.a(4, a, "Persistent file doesn't exist.");
            return null;
        }
        el.a(4, a, "Loading persistent data: " + file.getAbsolutePath());
        try {
            fileInputStream = new FileInputStream(file);
            try {
                try {
                    sb = new StringBuilder();
                    byte[] bArr = new byte[1024];
                    while (true) {
                        int i = fileInputStream.read(bArr);
                        if (i <= 0) {
                            break;
                        }
                        sb.append(new String(bArr, 0, i));
                    }
                    fb.a(fileInputStream);
                } catch (Throwable th2) {
                    th = th2;
                    el.a(6, a, "Error when loading persistent file", th);
                    fb.a(fileInputStream);
                    sb = null;
                }
            } catch (Throwable th3) {
                th = th3;
                fb.a(fileInputStream);
                throw th;
            }
        } catch (Throwable th4) {
            fileInputStream = null;
            th = th4;
            fb.a(fileInputStream);
            throw th;
        }
        if (sb != null) {
            return sb.toString();
        }
        return null;
    }

    @Deprecated
    public static void a(File file, String str) throws Throwable {
        FileOutputStream fileOutputStream;
        if (file == null) {
            el.a(4, a, "No persistent file specified.");
            return;
        }
        if (str == null) {
            el.a(4, a, "No data specified; deleting persistent file: " + file.getAbsolutePath());
            file.delete();
            return;
        }
        el.a(4, a, "Writing persistent data: " + file.getAbsolutePath());
        try {
            fileOutputStream = new FileOutputStream(file);
            try {
                try {
                    fileOutputStream.write(str.getBytes());
                    fb.a(fileOutputStream);
                } catch (Throwable th) {
                    th = th;
                    el.a(6, a, "Error writing persistent file", th);
                    fb.a(fileOutputStream);
                }
            } catch (Throwable th2) {
                th = th2;
                fb.a(fileOutputStream);
                throw th;
            }
        } catch (Throwable th3) {
            th = th3;
            fileOutputStream = null;
            fb.a(fileOutputStream);
            throw th;
        }
    }
}
