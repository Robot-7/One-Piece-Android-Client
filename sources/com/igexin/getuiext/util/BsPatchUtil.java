package com.igexin.getuiext.util;

/* JADX INFO: loaded from: classes.dex */
public class BsPatchUtil {
    static {
        try {
            System.loadLibrary("getuiext");
        } catch (Exception e) {
        }
    }

    private native int bsPatch(String str, String str2, String str3);

    public int a(String str, String str2, String str3) {
        try {
            return bsPatch(str, str2, str3);
        } catch (Exception e) {
            return -1;
        }
    }
}
