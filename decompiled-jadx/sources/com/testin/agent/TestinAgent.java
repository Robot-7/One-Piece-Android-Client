package com.testin.agent;

import android.content.Context;
import android.content.pm.ApplicationInfo;
import android.text.TextUtils;
import com.tencent.stat.common.StatConstants;
import com.testin.agent.b.a;
import com.testin.agent.b.f;
import com.testin.agent.base.TestinGVariables;
import com.testin.agent.base.b;
import java.io.PrintWriter;
import java.io.StringWriter;

/* JADX INFO: loaded from: classes.dex */
public class TestinAgent {
    private static final int CRASH_TYPE_JAVA = 0;
    private static f testHandler = null;

    private static String getAppKey(Context context) {
        try {
            ApplicationInfo applicationInfo = context.getPackageManager().getApplicationInfo(context.getPackageName(), 128);
            if (applicationInfo == null) {
                return StatConstants.MTA_COOPERATION_TAG;
            }
            String string = applicationInfo.metaData.getString("TESTIN_APPKEY");
            return string == null ? StatConstants.MTA_COOPERATION_TAG : string;
        } catch (Exception e) {
            return null;
        }
    }

    private static String getChannel(Context context) {
        Object obj;
        try {
            ApplicationInfo applicationInfo = context.getPackageManager().getApplicationInfo(context.getPackageName(), 128);
            return (applicationInfo == null || (obj = applicationInfo.metaData.get("TESTIN_CHANNEL")) == null) ? StatConstants.MTA_COOPERATION_TAG : String.valueOf(obj);
        } catch (Exception e) {
            return null;
        }
    }

    private static String getStackTraceInfo(Throwable th) {
        try {
            StringWriter stringWriter = new StringWriter();
            PrintWriter printWriter = new PrintWriter(stringWriter);
            th.printStackTrace(printWriter);
            String string = stringWriter.toString();
            printWriter.close();
            return string;
        } catch (Exception e) {
            return StatConstants.MTA_COOPERATION_TAG;
        }
    }

    public static void init(Context context) {
        init(context, null, null);
    }

    public static void init(Context context, String str) {
        init(context, str, null);
    }

    public static void init(Context context, String str, String str2) {
        if (context == null) {
            b.a("Context parameter is null");
            return;
        }
        Context applicationContext = context.getApplicationContext();
        if (TextUtils.isEmpty(str)) {
            str = getAppKey(applicationContext);
        }
        if (TextUtils.isEmpty(str2)) {
            str2 = getChannel(applicationContext);
        }
        start(applicationContext, str, str2);
    }

    public static void onStart(Context context) {
        a.a(context.getApplicationContext());
    }

    public static void onStop(Context context) {
        a.c(context.getApplicationContext());
    }

    public static synchronized void reportCustomizedException(int i, String str, String str2) {
        if (TextUtils.isEmpty(str2)) {
            b.a("reportCustomizedException(): StackTrace info is null or 0-length");
        } else {
            if (TextUtils.isEmpty(str)) {
                str = StatConstants.MTA_COOPERATION_TAG;
            }
            f.a(TestinGVariables.c().d, i, str, str2);
        }
    }

    public static void setUserInfo(String str) {
        if (TextUtils.isEmpty(str)) {
            return;
        }
        TestinGVariables.c().g = str;
    }

    private static void start(Context context, String str, String str2) {
        if (TextUtils.isEmpty(str)) {
            b.a("TestinAgent appKey parameter not configured");
            return;
        }
        if (!TextUtils.isEmpty(TestinGVariables.c().e)) {
            b.a("TestinAgent is initialized");
            return;
        }
        if (TextUtils.isEmpty(str2)) {
            b.a("TestinAgent channel parameter not configured");
        }
        if (testHandler == null) {
            testHandler = new f();
        }
        TestinGVariables.c().d = context;
        TestinGVariables.c().e = str;
        TestinGVariables.c().f = str2;
        testHandler.a(context);
    }

    public static synchronized void uploadException(Context context, String str, Throwable th) {
        if (context == null) {
            b.a("uploadException(): Context parameter is null");
        } else {
            Context applicationContext = context.getApplicationContext();
            if (th == null) {
                b.a("uploadException(): Throwable parameter is null");
            } else {
                String stackTraceInfo = getStackTraceInfo(th);
                if (TextUtils.isEmpty(stackTraceInfo)) {
                    b.a("uploadException(): StackTrace info is null or 0-length");
                } else {
                    if (TextUtils.isEmpty(str)) {
                        b.a("uploadException(): Message parameter is null or 0-length");
                        str = StatConstants.MTA_COOPERATION_TAG;
                    }
                    f.a(applicationContext, 0, str, stackTraceInfo);
                }
            }
        }
    }
}
