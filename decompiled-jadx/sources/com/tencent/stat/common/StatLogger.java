package com.tencent.stat.common;

import android.util.Log;
import com.tencent.stat.StatConfig;
import com.tencent.stat.StatCustomLogger;

/* JADX INFO: loaded from: classes.dex */
public final class StatLogger {
    private String a;
    private boolean b;
    private int c;

    public StatLogger() {
        this.a = "default";
        this.b = true;
        this.c = 2;
    }

    public StatLogger(String str) {
        this.a = "default";
        this.b = true;
        this.c = 2;
        this.a = str;
    }

    private String a() {
        StackTraceElement[] stackTrace = Thread.currentThread().getStackTrace();
        if (stackTrace == null) {
            return null;
        }
        for (StackTraceElement stackTraceElement : stackTrace) {
            if (!stackTraceElement.isNativeMethod() && !stackTraceElement.getClassName().equals(Thread.class.getName()) && !stackTraceElement.getClassName().equals(getClass().getName())) {
                return "[" + Thread.currentThread().getName() + "(" + Thread.currentThread().getId() + "): " + stackTraceElement.getFileName() + ":" + stackTraceElement.getLineNumber() + "]";
            }
        }
        return null;
    }

    public void d(Object obj) {
        if (isDebugEnable()) {
            debug(obj);
        }
    }

    public void debug(Object obj) {
        if (this.c <= 3) {
            String strA = a();
            String string = strA == null ? obj.toString() : strA + " - " + obj;
            Log.d(this.a, string);
            StatCustomLogger customLogger = StatConfig.getCustomLogger();
            if (customLogger != null) {
                customLogger.debug(string);
            }
        }
    }

    public void e(Object obj) {
        if (isDebugEnable()) {
            error(obj);
        }
    }

    public void e(Throwable th) {
        if (isDebugEnable()) {
            error(th);
        }
    }

    public void error(Object obj) {
        if (this.c <= 6) {
            String strA = a();
            String string = strA == null ? obj.toString() : strA + " - " + obj;
            Log.e(this.a, string);
            StatCustomLogger customLogger = StatConfig.getCustomLogger();
            if (customLogger != null) {
                customLogger.error(string);
            }
        }
    }

    public void error(Throwable th) {
        if (this.c <= 6) {
            Log.e(this.a, StatConstants.MTA_COOPERATION_TAG, th);
            StatCustomLogger customLogger = StatConfig.getCustomLogger();
            if (customLogger != null) {
                customLogger.error(th);
            }
        }
    }

    public int getLogLevel() {
        return this.c;
    }

    public void i(Object obj) {
        if (isDebugEnable()) {
            info(obj);
        }
    }

    public void info(Object obj) {
        if (this.c <= 4) {
            String strA = a();
            String string = strA == null ? obj.toString() : strA + " - " + obj;
            Log.i(this.a, string);
            StatCustomLogger customLogger = StatConfig.getCustomLogger();
            if (customLogger != null) {
                customLogger.info(string);
            }
        }
    }

    public boolean isDebugEnable() {
        return this.b;
    }

    public void setDebugEnable(boolean z) {
        this.b = z;
    }

    public void setLogLevel(int i) {
        this.c = i;
    }

    public void setTag(String str) {
        this.a = str;
    }

    public void v(Object obj) {
        if (isDebugEnable()) {
            verbose(obj);
        }
    }

    public void verbose(Object obj) {
        if (this.c <= 2) {
            String strA = a();
            String string = strA == null ? obj.toString() : strA + " - " + obj;
            Log.v(this.a, string);
            StatCustomLogger customLogger = StatConfig.getCustomLogger();
            if (customLogger != null) {
                customLogger.verbose(string);
            }
        }
    }

    public void w(Object obj) {
        if (isDebugEnable()) {
            warn(obj);
        }
    }

    public void warn(Object obj) {
        if (this.c <= 5) {
            String strA = a();
            String string = strA == null ? obj.toString() : strA + " - " + obj;
            Log.w(this.a, string);
            StatCustomLogger customLogger = StatConfig.getCustomLogger();
            if (customLogger != null) {
                customLogger.warn(string);
            }
        }
    }
}
