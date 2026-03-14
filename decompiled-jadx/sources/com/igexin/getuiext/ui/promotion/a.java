package com.igexin.getuiext.ui.promotion;

/* JADX INFO: loaded from: classes.dex */
public enum a {
    DOWNLOAD("download"),
    OPEN_LINK("openlink"),
    UNKNOWN("unknown");

    private String d;

    a(String str) {
        this.d = str;
    }

    public static a a(String str) {
        return str.equals(DOWNLOAD.b()) ? DOWNLOAD : str.equals(OPEN_LINK.b()) ? OPEN_LINK : UNKNOWN;
    }

    public String b() {
        return this.d;
    }
}
