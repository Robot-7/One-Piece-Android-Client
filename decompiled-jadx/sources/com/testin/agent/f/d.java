package com.testin.agent.f;

import android.content.Context;
import android.text.TextUtils;
import com.tencent.stat.common.StatConstants;

/* JADX INFO: loaded from: classes.dex */
public class d {
    public static String a(Context context) {
        return context.getSharedPreferences("TestinCrash", 0).getString("deviceId", StatConstants.MTA_COOPERATION_TAG);
    }

    public static void a(Context context, int i) {
        context.getSharedPreferences("TestinCrash", 0).edit().putInt("uploadType", i).commit();
    }

    public static void a(Context context, String str) {
        context.getSharedPreferences("TestinCrash", 0).edit().putString("deviceId", str).commit();
    }

    public static void a(Context context, String str, String str2) {
        if (TextUtils.isEmpty(str2)) {
            str2 = "*";
        }
        String upperCase = TextUtils.isEmpty(str) ? "*" : str.toUpperCase();
        context.getSharedPreferences("TestinCrash", 0).edit().putString("LogScript", ("*".equals(str2) && "*".equals(upperCase)) ? "logcat -t 100 -v time" : String.format("logcat -t 100 -v time -s %1$s:%2$s", str2, upperCase)).commit();
    }

    public static void a(Context context, boolean z) {
        context.getSharedPreferences("TestinCrash", 0).edit().putBoolean("isForeground", z).commit();
    }

    public static void b(Context context, int i) {
        context.getSharedPreferences("TestinCrash", 0).edit().putInt("maxErroNum", i).commit();
    }

    public static boolean b(Context context) {
        return context.getSharedPreferences("TestinCrash", 0).getBoolean("isForeground", false);
    }

    public static int c(Context context) {
        return context.getSharedPreferences("TestinCrash", 0).getInt("uploadType", 0);
    }

    public static void c(Context context, int i) {
        context.getSharedPreferences("TestinCrash", 0).edit().putInt("maxAnnalNum", i).commit();
    }

    public static int d(Context context) {
        return context.getSharedPreferences("TestinCrash", 0).getInt("maxErroNum", 2);
    }

    public static void d(Context context, int i) {
        context.getSharedPreferences("TestinCrash", 0).edit().putInt("HttpTimeOut", i).commit();
    }

    public static int e(Context context) {
        return context.getSharedPreferences("TestinCrash", 0).getInt("maxAnnalNum", 10);
    }

    public static int f(Context context) {
        return context.getSharedPreferences("TestinCrash", 0).getInt("HttpTimeOut", 3000);
    }

    public static String g(Context context) {
        return context.getSharedPreferences("TestinCrash", 0).getString("LogScript", "logcat -t 100 -v time");
    }
}
