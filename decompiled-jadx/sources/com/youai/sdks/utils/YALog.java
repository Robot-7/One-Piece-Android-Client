package com.youai.sdks.utils;

import android.util.Log;

/* JADX INFO: loaded from: classes.dex */
public class YALog {
    public static boolean Debug = true;
    public static final String TAG = "YAlog";

    public static void i(String tag, String msg) {
        if (Debug) {
            Log.i(tag, msg);
        }
    }

    public static void e(String tag, String msg) {
        if (Debug) {
            Log.e(tag, msg);
        }
    }

    public static void d(String tag, String msg) {
        if (Debug) {
            Log.d(tag, msg);
        }
    }

    public static void i(String msg) {
        i(TAG, msg);
    }

    public static void e(String msg) {
        e(TAG, msg);
    }

    public static void d(String msg) {
        d(TAG, msg);
    }

    public static void i(Object msg) {
        i(TAG, msg.toString());
    }

    public static void e(Object msg) {
        e(TAG, msg.toString());
    }

    public static void d(Object msg) {
        d(TAG, msg.toString());
    }
}
