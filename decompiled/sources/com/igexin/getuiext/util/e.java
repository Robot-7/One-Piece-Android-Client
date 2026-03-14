package com.igexin.getuiext.util;

import android.content.Context;
import android.content.Intent;
import android.content.pm.ApplicationInfo;
import android.net.Uri;
import android.os.Environment;
import java.io.File;
import java.util.List;

/* JADX INFO: loaded from: classes.dex */
public class e {
    public static final String a = Environment.getExternalStorageDirectory().getAbsolutePath() + "/libs/tmp/";

    public static String a(Context context, String str) {
        if (str == null) {
            return null;
        }
        List<ApplicationInfo> installedApplications = context.getPackageManager().getInstalledApplications(0);
        int size = installedApplications.size();
        for (int i = 0; i < size; i++) {
            ApplicationInfo applicationInfo = installedApplications.get(i);
            if (str.equals(applicationInfo.packageName)) {
                return applicationInfo.sourceDir;
            }
        }
        return null;
    }

    public static void a(Context context, String str, String str2, String str3) {
        String strA;
        if (new File(str).exists() && (strA = a(context, str3)) != null && new BsPatchUtil().a(strA, str2, str) == 0) {
            b(context, str2);
        }
    }

    public static void b(Context context, String str) {
        Intent intent = new Intent("android.intent.action.VIEW");
        intent.addFlags(268435456);
        intent.setDataAndType(Uri.fromFile(new File(str)), "application/vnd.android.package-archive");
        context.startActivity(intent);
    }
}
