package com.pipaw.a;

/* JADX INFO: loaded from: classes.dex */
public class j {
    public static boolean a(CharSequence charSequence) {
        return charSequence == null || charSequence.length() == 0;
    }

    public static boolean a(CharSequence charSequence, int i) {
        return charSequence != null && charSequence.length() <= i;
    }
}
