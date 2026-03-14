package com.testin.agent.b;

import android.app.ActivityManager;
import android.content.Context;
import java.util.List;

/* JADX INFO: loaded from: classes.dex */
public class a {
    private static f a = null;

    public static boolean a(Context context) {
        b(context);
        return true;
    }

    public static boolean b(Context context) {
        if (a == null) {
            a = new f();
        }
        if (com.testin.agent.f.d.b(context)) {
            return true;
        }
        a.b(context);
        return true;
    }

    public static boolean c(Context context) {
        com.testin.agent.f.d.a(context, d(context));
        return false;
    }

    public static boolean d(Context context) {
        ActivityManager activityManager = (ActivityManager) context.getSystemService("activity");
        String packageName = context.getPackageName();
        List<ActivityManager.RunningAppProcessInfo> runningAppProcesses = activityManager.getRunningAppProcesses();
        if (runningAppProcesses == null) {
            return false;
        }
        for (ActivityManager.RunningAppProcessInfo runningAppProcessInfo : runningAppProcesses) {
            if (runningAppProcessInfo.processName.equals(packageName) && runningAppProcessInfo.importance == 100) {
                return true;
            }
        }
        return false;
    }
}
