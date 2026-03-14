package com.tencent.wxop.stat.b;

import android.content.Context;
import android.content.SharedPreferences;
import android.preference.PreferenceManager;

/* JADX INFO: loaded from: classes.dex */
public final class q {
    private static SharedPreferences db = null;

    private static synchronized SharedPreferences T(Context context) {
        SharedPreferences sharedPreferences = context.getSharedPreferences(".mta-wxop", 0);
        db = sharedPreferences;
        if (sharedPreferences == null) {
            db = PreferenceManager.getDefaultSharedPreferences(context);
        }
        return db;
    }

    public static int a(Context context, String str, int i) {
        return T(context).getInt(l.f(context, "wxop_" + str), i);
    }

    public static void a(Context context, String str, long j) {
        String strF = l.f(context, "wxop_" + str);
        SharedPreferences.Editor editorEdit = T(context).edit();
        editorEdit.putLong(strF, j);
        editorEdit.commit();
    }

    public static void b(Context context, String str, int i) {
        String strF = l.f(context, "wxop_" + str);
        SharedPreferences.Editor editorEdit = T(context).edit();
        editorEdit.putInt(strF, i);
        editorEdit.commit();
    }

    public static String c(Context context, String str, String str2) {
        return T(context).getString(l.f(context, "wxop_" + str), str2);
    }

    public static void d(Context context, String str, String str2) {
        String strF = l.f(context, "wxop_" + str);
        SharedPreferences.Editor editorEdit = T(context).edit();
        editorEdit.putString(strF, str2);
        editorEdit.commit();
    }

    public static long g(Context context, String str) {
        return T(context).getLong(l.f(context, "wxop_" + str), 0L);
    }
}
