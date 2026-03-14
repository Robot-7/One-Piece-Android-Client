package com.tencent.mid.api;

import android.content.Context;
import android.os.Handler;
import android.os.HandlerThread;
import android.util.Log;
import com.tencent.mid.a.h;
import com.tencent.mid.b.g;
import com.tencent.mid.util.Util;
import com.tencent.stat.common.StatConstants;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

/* JADX INFO: loaded from: classes.dex */
public class MidService {
    private static Context a = null;
    private static Handler b = null;
    private static MidService c = null;
    private static final List<String> d = new ArrayList(Arrays.asList("android.permission.INTERNET", "android.permission.ACCESS_NETWORK_STATE", "android.permission.ACCESS_WIFI_STATE"));
    private static boolean e = false;

    private MidService(Context context) {
        HandlerThread handlerThread = new HandlerThread(getClass().getSimpleName());
        handlerThread.start();
        b = new Handler(handlerThread.getLooper());
        a = context.getApplicationContext();
    }

    static synchronized MidService a(Context context) {
        if (c == null) {
            c = new MidService(context);
        }
        return c;
    }

    private static boolean a(Context context, MidCallback midCallback) {
        for (String str : d) {
            if (!Util.checkPermission(context, str)) {
                midCallback.onFail(MidConstants.ERROR_PERMISSIONS, "permission :" + str + " is denyed, please set it on AndroidManifest.xml first");
                return false;
            }
        }
        if (!Util.checkPermission(context, "android.permission.WRITE_SETTINGS") && !Util.checkPermission(context, "android.permission.WRITE_EXTERNAL_STORAGE")) {
            midCallback.onFail(MidConstants.ERROR_PERMISSIONS, "failed to get permission either permission android.permission.WRITE_SETTINGS or android.permission.WRITE_EXTERNAL_STORAGE");
            return false;
        }
        if (!Util.checkPermission(context, "android.permission.READ_PHONE_STATE")) {
            Log.e("MID", "android.permission.READ_PHONE_STATE is denyed.");
        }
        return true;
    }

    private static void b(Context context, MidCallback midCallback) {
        if (a(context, midCallback)) {
            a(context);
            MidEntity midEntityA = g.a(context).a();
            if (midEntityA == null || !midEntityA.isMidValid()) {
                Util.logInfo("request new mid entity.");
                if (b != null) {
                    b.post(new h(context, 1, midCallback));
                    return;
                }
                return;
            }
            Util.logInfo("get local mid entity:" + midEntityA.toString());
            midCallback.onSuccess(midEntityA.toString());
            if (b != null) {
                b.post(new h(context, 2, midCallback));
            }
        }
    }

    public static void enableDebug(boolean z) {
        e = z;
    }

    public static String getLocalMidOnly(Context context) {
        MidEntity midEntityA = g.a(context).a();
        return (midEntityA == null || !midEntityA.isMidValid()) ? StatConstants.MTA_COOPERATION_TAG : midEntityA.getMid();
    }

    public static String getMid(Context context) {
        if (context == null) {
            Log.e("MID", "context==null in getMid()");
            return null;
        }
        a(context);
        MidEntity midEntityA = g.a(context).a();
        if (midEntityA == null) {
            midEntityA = new MidEntity();
        }
        if (!isMidValid(midEntityA.getMid())) {
            Util.logInfo("request new mid entity.");
            if (b != null) {
                b.post(new h(context, 1, new b()));
            }
        } else if (b != null) {
            b.post(new h(context, 2, new c()));
        }
        return midEntityA.getMid();
    }

    public static boolean isEnableDebug() {
        return e;
    }

    public static boolean isMidValid(String str) {
        return Util.isMidValid(str);
    }

    public static void requestMid(Context context, MidCallback midCallback) {
        if (midCallback == null) {
            throw new IllegalArgumentException("error, callback is null!");
        }
        if (context == null) {
            midCallback.onFail(MidConstants.ERROR_ARGUMENT, "content is null!");
        } else {
            b(context, new a(midCallback));
        }
    }
}
