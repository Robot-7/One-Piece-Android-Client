package com.tencent.wxop.stat.b;

import java.io.File;

/* JADX INFO: loaded from: classes.dex */
final class p {
    private static int aI = -1;

    public static boolean a() {
        if (aI == 1) {
            return true;
        }
        if (aI == 0) {
            return false;
        }
        for (String str : new String[]{"/bin", "/system/bin/", "/system/xbin/", "/system/sbin/", "/sbin/", "/vendor/bin/"}) {
            try {
                if (new File(str + "su").exists()) {
                    aI = 1;
                    return true;
                }
            } catch (Exception e) {
            }
            aI = 0;
            return false;
        }
        aI = 0;
        return false;
    }
}
