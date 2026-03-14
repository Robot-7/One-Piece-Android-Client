package com.flurry.sdk;

import com.flurry.android.FlurryAgent;
import com.flurry.sdk.dq;
import com.tencent.stat.common.StatConstants;
import java.lang.Thread;
import java.util.HashMap;
import java.util.Map;

/* JADX INFO: loaded from: classes.dex */
public class cx implements dq.a, Thread.UncaughtExceptionHandler {
    private static final String a = cx.class.getSimpleName();
    private static cx b;
    private final HashMap<String, Map<String, String>> c = new HashMap<>();
    private boolean d;

    public static class a {
        public int a;
    }

    private cx() {
        ec.a().a(this);
        d();
    }

    private void d() {
        dq dqVarA = dp.a();
        this.d = ((Boolean) dqVarA.a("CaptureUncaughtExceptions")).booleanValue();
        dqVarA.a("CaptureUncaughtExceptions", (dq.a) this);
        el.a(4, a, "initSettings, CrashReportingEnabled = " + this.d);
        String str = (String) dqVarA.a("VersionName");
        dqVarA.a("VersionName", (dq.a) this);
        eb.a(str);
        el.a(4, a, "initSettings, VersionName = " + str);
    }

    @Override // com.flurry.sdk.dq.a
    public void a(String str, Object obj) {
        if (str.equals("CaptureUncaughtExceptions")) {
            this.d = ((Boolean) obj).booleanValue();
            el.a(4, a, "onSettingUpdate, CrashReportingEnabled = " + this.d);
        } else {
            if (str.equals("VersionName")) {
                String str2 = (String) obj;
                eb.a(str2);
                el.a(4, a, "onSettingUpdate, VersionName = " + str2);
                return;
            }
            el.a(6, a, "onSettingUpdate internal error!");
        }
    }

    public static synchronized cx a() {
        if (b == null) {
            b = new cx();
        }
        return b;
    }

    public void a(String str, String str2, Map<String, String> map) {
        if (map == null) {
            map = new HashMap<>();
        }
        if (map.size() >= 10) {
            el.d(a, "MaxOriginParams exceeded: " + map.size());
            return;
        }
        map.put("flurryOriginVersion", str2);
        synchronized (this.c) {
            if (this.c.size() >= 10 && !this.c.containsKey(str)) {
                el.d(a, "MaxOrigins exceeded: " + this.c.size());
            } else {
                this.c.put(str, map);
            }
        }
    }

    public HashMap<String, Map<String, String>> b() {
        HashMap<String, Map<String, String>> map;
        synchronized (this.c) {
            map = new HashMap<>(this.c);
        }
        return map;
    }

    public void a(String str) {
        dj djVarC = dl.a().c();
        if (djVarC != null) {
            djVarC.a(str, null, false);
        }
    }

    public void a(String str, Map<String, String> map) {
        dj djVarC = dl.a().c();
        if (djVarC != null) {
            djVarC.a(str, map, false);
        }
    }

    public void a(String str, boolean z) {
        dj djVarC = dl.a().c();
        if (djVarC != null) {
            djVarC.a(str, null, z);
        }
    }

    public void a(String str, Map<String, String> map, boolean z) {
        dj djVarC = dl.a().c();
        if (djVarC != null) {
            djVarC.a(str, map, z);
        }
    }

    public void b(String str) {
        dj djVarC = dl.a().c();
        if (djVarC != null) {
            djVarC.a(str, (Map<String, String>) null);
        }
    }

    public void b(String str, Map<String, String> map) {
        dj djVarC = dl.a().c();
        if (djVarC != null) {
            djVarC.a(str, map);
        }
    }

    @Deprecated
    public void a(String str, String str2, String str3) {
        StackTraceElement[] stackTraceElementArr;
        StackTraceElement[] stackTrace = Thread.currentThread().getStackTrace();
        if (stackTrace == null || stackTrace.length <= 2) {
            stackTraceElementArr = stackTrace;
        } else {
            stackTraceElementArr = new StackTraceElement[stackTrace.length - 2];
            System.arraycopy(stackTrace, 2, stackTraceElementArr, 0, stackTraceElementArr.length);
        }
        Throwable th = new Throwable(str2);
        th.setStackTrace(stackTraceElementArr);
        dj djVarC = dl.a().c();
        if (djVarC != null) {
            djVarC.a(str, str2, str3, th);
        }
    }

    public void a(String str, String str2, Throwable th) {
        dj djVarC = dl.a().c();
        if (djVarC != null) {
            djVarC.a(str, str2, th.getClass().getName(), th);
        }
    }

    public void c(String str) {
        dj djVarC = dl.a().c();
        if (djVarC != null) {
            djVarC.a(str, null, false);
        }
    }

    public void c(String str, Map<String, String> map) {
        dj djVarC = dl.a().c();
        if (djVarC != null) {
            djVarC.a(str, map, false);
        }
    }

    public void c() {
        dj djVarC = dl.a().c();
        if (djVarC != null) {
            djVarC.e();
        }
    }

    @Override // java.lang.Thread.UncaughtExceptionHandler
    public void uncaughtException(Thread thread, Throwable th) {
        th.printStackTrace();
        if (this.d) {
            String message = StatConstants.MTA_COOPERATION_TAG;
            StackTraceElement[] stackTrace = th.getStackTrace();
            if (stackTrace != null && stackTrace.length > 0) {
                StringBuilder sb = new StringBuilder();
                if (th.getMessage() != null) {
                    sb.append(" (" + th.getMessage() + ")\n");
                }
                message = sb.toString();
            } else if (th.getMessage() != null) {
                message = th.getMessage();
            }
            FlurryAgent.onError("uncaught", message, th);
        }
        dl.a().d();
        dz.a().g();
    }

    public void a(boolean z) {
        el.a(z);
    }
}
