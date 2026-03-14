package com.tencent.stat;

/* JADX INFO: loaded from: classes.dex */
public interface StatCustomLogger {
    void debug(Object obj);

    void error(Exception exc);

    void error(Object obj);

    void info(Object obj);

    void verbose(Object obj);

    void warn(Object obj);
}
