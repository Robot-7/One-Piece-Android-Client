package com.pipaw.a;

import android.content.Context;
import android.content.SharedPreferences;

/* JADX INFO: loaded from: classes.dex */
public class i {
    private static final String a = d.a(i.class);

    public static long a(Context context, String str, String str2, long j) {
        try {
            return context.getSharedPreferences(str, 0).getLong(str2, j);
        } catch (Exception e) {
            d.a(a, e);
            return j;
        }
    }

    public static SharedPreferences a(Context context, String str) {
        return context.getSharedPreferences(str, 0);
    }

    public static String a(Context context, String str, String str2, String str3) {
        try {
            return context.getSharedPreferences(str, 0).getString(str2, str3);
        } catch (Exception e) {
            d.a(a, e);
            return str3;
        }
    }

    public static boolean a(Context context, String str, String str2, boolean z) {
        try {
            return context.getSharedPreferences(str, 0).getBoolean(str2, z);
        } catch (Exception e) {
            d.a(a, e);
            return z;
        }
    }

    public static void b(Context context, String str, String str2, long j) {
        context.getSharedPreferences(str, 0).edit().putLong(str2, j).commit();
    }

    public static void b(Context context, String str, String str2, String str3) {
        context.getSharedPreferences(str, 0).edit().putString(str2, str3).commit();
    }

    public static void b(Context context, String str, String str2, boolean z) {
        context.getSharedPreferences(str, 0).edit().putBoolean(str2, z).commit();
    }
}
