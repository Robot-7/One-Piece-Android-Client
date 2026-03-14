package com.pipaw.a;

import android.content.Context;

/* JADX INFO: loaded from: classes.dex */
public class h {
    private static final String a = d.a(h.class);

    public static int a(Context context, String str) {
        return a(context, ".R$anim", str);
    }

    public static int a(Context context, String str, String str2) {
        try {
            Class<?> cls = Class.forName(String.valueOf(context.getPackageName()) + str);
            return cls.getDeclaredField(str2).getInt(cls.newInstance());
        } catch (Exception e) {
            d.a(a, e);
            return 0;
        }
    }

    public static int b(Context context, String str) {
        return a(context, ".R$id", str);
    }

    public static int c(Context context, String str) {
        return a(context, ".R$layout", str);
    }
}
