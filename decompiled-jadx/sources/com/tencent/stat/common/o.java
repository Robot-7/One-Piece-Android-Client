package com.tencent.stat.common;

import java.io.File;

/* JADX INFO: loaded from: classes.dex */
class o {
    private static int a = -1;

    public static boolean a() {
        if (a == 1) {
            return true;
        }
        if (a == 0) {
            return false;
        }
        for (String str : new String[]{"/bin", "/system/bin/", "/system/xbin/", "/system/sbin/", "/sbin/", "/vendor/bin/"}) {
            try {
                File file = new File(str + "su");
                if (file != null && file.exists()) {
                    a = 1;
                    return true;
                }
            } catch (Exception e) {
            }
            a = 0;
            return false;
        }
        a = 0;
        return false;
    }
}
