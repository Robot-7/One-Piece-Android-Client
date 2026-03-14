package com.tencent.stat;

import android.content.Context;
import com.tencent.stat.common.StatConstants;
import com.tencent.stat.common.StatLogger;
import java.io.BufferedReader;
import java.io.File;
import java.io.FileReader;
import java.io.IOException;
import java.util.LinkedHashSet;

/* JADX INFO: loaded from: classes.dex */
public class StatNativeCrashReport {
    public static final String PRE_TAG_TOMBSTONE_FNAME = "tombstone_";
    private static boolean d;
    private static boolean g;
    private volatile boolean c = false;
    private static StatLogger b = com.tencent.stat.common.k.b();
    static StatNativeCrashReport a = new StatNativeCrashReport();
    private static boolean e = false;
    private static String f = null;

    static {
        d = false;
        g = false;
        try {
            System.loadLibrary("MtaNativeCrash");
            g = true;
        } catch (Throwable th) {
            d = false;
            b.w("can't find libMtaNativeCrash.so, NativeCrash report disable.");
        }
    }

    static String a(File file) {
        BufferedReader bufferedReader;
        StringBuilder sb = new StringBuilder();
        try {
            bufferedReader = new BufferedReader(new FileReader(file));
        } catch (IOException e2) {
            b.e((Throwable) e2);
        }
        while (true) {
            String line = bufferedReader.readLine();
            if (line == null) {
                break;
            }
            sb.append(line);
            sb.append('\n');
            return sb.toString();
        }
        bufferedReader.close();
        return sb.toString();
    }

    static LinkedHashSet<File> a(Context context) {
        File file;
        File[] fileArrListFiles;
        LinkedHashSet<File> linkedHashSet = new LinkedHashSet<>();
        String tombstonesDir = getTombstonesDir(context);
        if (tombstonesDir != null && (file = new File(tombstonesDir)) != null && file.isDirectory() && (fileArrListFiles = file.listFiles()) != null) {
            for (File file2 : fileArrListFiles) {
                if (file2.getName().startsWith(PRE_TAG_TOMBSTONE_FNAME) && file2.isFile()) {
                    if (StatConfig.isDebugEnable()) {
                        b.d("get tombstone file:" + file2.getAbsolutePath().toString());
                    }
                    linkedHashSet.add(file2.getAbsoluteFile());
                }
            }
        }
        return linkedHashSet;
    }

    static long b(File file) {
        try {
            return Long.valueOf(file.getName().replace(PRE_TAG_TOMBSTONE_FNAME, StatConstants.MTA_COOPERATION_TAG)).longValue();
        } catch (NumberFormatException e2) {
            b.e((Throwable) e2);
            return 0L;
        }
    }

    public static void doNativeCrashTest() {
        if (g) {
            a.makeJniCrash();
        } else {
            b.warn("libMtaNativeCrash.so not loaded.");
        }
    }

    public static String getTombstonesDir(Context context) {
        if (f == null) {
            f = com.tencent.stat.common.p.a(context, "__mta_tombstone__", StatConstants.MTA_COOPERATION_TAG);
        }
        return f;
    }

    public static void initNativeCrash(Context context, String str) {
        if (!g) {
            b.warn("libMtaNativeCrash.so not loaded.");
            return;
        }
        if (a.c) {
            return;
        }
        if (str == null) {
            try {
                str = context.getDir("tombstones", 0).getAbsolutePath();
            } catch (Throwable th) {
                b.w(th);
                return;
            }
        }
        if (str.length() > 128) {
            b.e("The length of tombstones dir: " + str + " can't exceeds 200 bytes.");
            return;
        }
        f = str;
        com.tencent.stat.common.p.b(context, "__mta_tombstone__", str);
        setNativeCrashEnable(true);
        a.initJNICrash(str);
        a.c = true;
        if (StatConfig.isDebugEnable()) {
            b.d("initNativeCrash success.");
        }
    }

    public static boolean isNativeCrashDebugEnable() {
        return e;
    }

    public static boolean isNativeCrashEnable() {
        return d;
    }

    public static String onNativeCrashHappened() {
        try {
            new RuntimeException("MTA has caught a native crash, java stack:\n").printStackTrace();
            return StatConstants.MTA_COOPERATION_TAG;
        } catch (RuntimeException e2) {
            return e2.toString();
        }
    }

    public static void setNativeCrashDebugEnable(boolean z) {
        if (!g) {
            b.warn("libMtaNativeCrash.so not loaded.");
            return;
        }
        try {
            a.enableNativeCrashDebug(z);
            e = z;
        } catch (Throwable th) {
            b.w(th);
        }
    }

    public static void setNativeCrashEnable(boolean z) {
        if (!g) {
            b.warn("libMtaNativeCrash.so not loaded.");
            return;
        }
        try {
            a.enableNativeCrash(z);
            d = z;
        } catch (Throwable th) {
            b.w(th);
        }
    }

    public native void enableNativeCrash(boolean z);

    public native void enableNativeCrashDebug(boolean z);

    public native boolean initJNICrash(String str);

    public native String makeJniCrash();

    public native String stringFromJNI();
}
