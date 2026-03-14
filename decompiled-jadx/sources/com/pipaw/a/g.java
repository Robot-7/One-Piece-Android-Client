package com.pipaw.a;

import android.content.Context;

/* JADX INFO: loaded from: classes.dex */
public class g {
    private static final String a = d.a(g.class);

    public static int a(Context context, String str) {
        try {
            return context.getPackageManager().getApplicationInfo(context.getPackageName(), 128).metaData.getInt(str);
        } catch (Exception e) {
            d.a(a, e);
            return 0;
        }
    }
}
