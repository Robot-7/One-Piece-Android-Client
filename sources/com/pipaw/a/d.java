package com.pipaw.a;

import android.util.Log;

/* JADX INFO: loaded from: classes.dex */
public class d {
    private static final String a = a(d.class);
    private static boolean b = true;

    public static int a(String str, String str2) {
        if (b) {
            return Log.d(str, str2);
        }
        return -1;
    }

    public static int a(String str, Throwable th) {
        if (b) {
            return Log.w(str, th);
        }
        return -1;
    }

    public static String a(Class cls) {
        return cls.getSimpleName();
    }

    public static void a(String str) {
        if (b) {
            try {
                Log.d(str, Thread.currentThread().getStackTrace()[3].getMethodName());
            } catch (Exception e) {
                a(a, e);
            }
        }
    }
}
