package com.igexin.getuiext.data.a;

import java.util.Locale;

/* JADX INFO: loaded from: classes.dex */
public enum f {
    FULL,
    DIFF;

    public static f a(String str) {
        return (str == null || !str.toUpperCase(Locale.US).equals("DIFF")) ? FULL : DIFF;
    }
}
