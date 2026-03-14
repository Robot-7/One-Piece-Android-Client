package com.igexin.a.a.c;

import android.app.Activity;
import android.os.Environment;
import android.util.Log;
import com.igexin.push.a.m;
import com.igexin.push.core.g;
import com.tencent.stat.common.StatConstants;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.lang.Thread;
import java.text.SimpleDateFormat;
import java.util.Date;

/* JADX INFO: loaded from: classes.dex */
public class a extends Activity implements Thread.UncaughtExceptionHandler {
    public static boolean a = m.b.equals("debug");

    public static synchronized void a(String str) {
        if (a || (g.Q && g.R >= System.currentTimeMillis())) {
            String str2 = new SimpleDateFormat("yyyy-MM-dd").format(new Date());
            String str3 = g.g;
            if (str3 != null && !StatConstants.MTA_COOPERATION_TAG.equals(str3) && Environment.getExternalStorageState().equals("mounted")) {
                File file = new File("/sdcard/libs/");
                if (!file.exists()) {
                    file.mkdir();
                }
                try {
                    File file2 = new File("/sdcard/libs/" + str3 + "." + str2 + ".log");
                    if (!file2.exists()) {
                        file2.createNewFile();
                    }
                    FileOutputStream fileOutputStream = new FileOutputStream(file2, true);
                    fileOutputStream.write(((new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date()) + "|" + str).toString() + "\r\n").getBytes());
                    fileOutputStream.close();
                } catch (IOException e) {
                }
            }
        }
    }

    public static final void a(String str, String str2) {
        if (a) {
            Log.d(str, str2);
        }
    }

    public static final void a(String str, String str2, Throwable th) {
        if (a) {
            Log.d(str, str2, th);
        }
    }

    @Override // java.lang.Thread.UncaughtExceptionHandler
    public void uncaughtException(Thread thread, Throwable th) {
    }
}
