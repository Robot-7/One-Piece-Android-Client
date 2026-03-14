package com.tencent.wxop.stat.b;

import android.util.Log;
import com.tencent.stat.common.StatConstants;

/* JADX INFO: loaded from: classes.dex */
public final class b {
    private String a;
    private boolean ch;
    private int cp;

    public b() {
        this.a = "default";
        this.ch = true;
        this.cp = 2;
    }

    public b(String str) {
        this.a = "default";
        this.ch = true;
        this.cp = 2;
        this.a = str;
    }

    private String c() {
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

    public final void a(Throwable th) {
        if (this.cp <= 6) {
            Log.e(this.a, StatConstants.MTA_COOPERATION_TAG, th);
            com.tencent.wxop.stat.c.F();
        }
    }

    public final void ap() {
        this.ch = false;
    }

    public final void b(Object obj) {
        if (!this.ch || this.cp > 4) {
            return;
        }
        String strC = c();
        Log.i(this.a, strC == null ? obj.toString() : strC + " - " + obj);
        com.tencent.wxop.stat.c.F();
    }

    public final void b(Throwable th) {
        if (this.ch) {
            a(th);
        }
    }

    public final void c(Object obj) {
        if (this.ch) {
            warn(obj);
        }
    }

    public final void d(Object obj) {
        if (this.ch) {
            error(obj);
        }
    }

    public final void debug(Object obj) {
        if (this.cp <= 3) {
            String strC = c();
            Log.d(this.a, strC == null ? obj.toString() : strC + " - " + obj);
            com.tencent.wxop.stat.c.F();
        }
    }

    public final void e(Object obj) {
        if (this.ch) {
            debug(obj);
        }
    }

    public final void error(Object obj) {
        if (this.cp <= 6) {
            String strC = c();
            Log.e(this.a, strC == null ? obj.toString() : strC + " - " + obj);
            com.tencent.wxop.stat.c.F();
        }
    }

    public final void warn(Object obj) {
        if (this.cp <= 5) {
            String strC = c();
            Log.w(this.a, strC == null ? obj.toString() : strC + " - " + obj);
            com.tencent.wxop.stat.c.F();
        }
    }
}
