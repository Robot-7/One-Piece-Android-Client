package com.youai.dreamonepiece;

import android.content.Context;
import android.content.pm.PackageInfo;
import android.content.pm.PackageManager;
import android.os.Build;
import android.os.Environment;
import android.os.Looper;
import android.os.Process;
import android.util.Log;
import android.widget.Toast;
import com.tencent.stat.common.StatConstants;
import java.io.BufferedReader;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.PrintWriter;
import java.io.StringWriter;
import java.io.Writer;
import java.lang.Thread;
import java.lang.reflect.Field;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

/* JADX INFO: loaded from: classes.dex */
public class LogcatHelper implements Thread.UncaughtExceptionHandler {
    private static String PATH_LOGCAT;
    private static final String TAG = LogcatHelper.class.getSimpleName();
    private static LogcatHelper mInstance = null;
    private Context mContext;
    private Thread.UncaughtExceptionHandler mDefaultHandler;
    private int mPId;
    private Map<String, String> info = new HashMap();
    private LogDumper mLogDumper = null;

    private LogcatHelper() {
    }

    public static LogcatHelper getInstance(Context context) {
        if (mInstance == null) {
            mInstance = new LogcatHelper(context);
        }
        return mInstance;
    }

    private void init(Context context) {
        this.mContext = context;
        if (Environment.getExternalStorageState().equals("mounted")) {
            PATH_LOGCAT = context.getExternalFilesDir(null) + File.separator + "Log";
            File file = new File(PATH_LOGCAT);
            if (!file.exists()) {
                file.mkdirs();
            }
            collectDeviceInfo(this.mContext);
            this.mDefaultHandler = Thread.getDefaultUncaughtExceptionHandler();
            Thread.setDefaultUncaughtExceptionHandler(this);
        }
    }

    private LogcatHelper(Context context) {
        init(context);
        this.mPId = Process.myPid();
    }

    public void start() {
        if (PATH_LOGCAT != null && !PATH_LOGCAT.equals(StatConstants.MTA_COOPERATION_TAG)) {
            if (this.mLogDumper == null) {
                this.mLogDumper = new LogDumper(String.valueOf(this.mPId), PATH_LOGCAT);
            }
            this.mLogDumper.start();
        }
    }

    public void stop() {
        if (this.mLogDumper != null) {
            this.mLogDumper.stopLogs();
            this.mLogDumper = null;
        }
    }

    private class LogDumper extends Thread {
        private String cmds;
        private Process logcatProc;
        private String mPID;
        private FileOutputStream out;
        private BufferedReader mReader = null;
        private boolean mRunning = true;
        private String FilePath = "log-" + MyDate.getFileName();

        public LogDumper(String pid, String dir) {
            this.out = null;
            this.cmds = null;
            this.mPID = pid;
            this.FilePath += "-" + System.currentTimeMillis() + ".log";
            try {
                this.out = new FileOutputStream(new File(dir, this.FilePath));
            } catch (FileNotFoundException e) {
                e.printStackTrace();
            }
            this.cmds = "logcat  | grep \"(" + this.mPID + ")\"";
        }

        public void stopLogs() {
            this.mRunning = false;
        }

        @Override // java.lang.Thread, java.lang.Runnable
        public void run() {
            String line;
            try {
                try {
                    this.logcatProc = Runtime.getRuntime().exec(this.cmds);
                    this.mReader = new BufferedReader(new InputStreamReader(this.logcatProc.getInputStream()), 1024);
                    while (this.mRunning && (line = this.mReader.readLine()) != null && this.mRunning) {
                        if (line.length() != 0 && this.out != null && line.contains(this.mPID)) {
                            this.out.write((MyDate.getDateEN() + "\t" + line + "\n").getBytes());
                        }
                    }
                    if (this.logcatProc != null) {
                        this.logcatProc.destroy();
                        this.logcatProc = null;
                    }
                    if (this.mReader != null) {
                        try {
                            this.mReader.close();
                            this.mReader = null;
                        } catch (IOException e) {
                            e.printStackTrace();
                        }
                    }
                } catch (Throwable th) {
                    if (this.logcatProc != null) {
                        this.logcatProc.destroy();
                        this.logcatProc = null;
                    }
                    if (this.mReader != null) {
                        try {
                            this.mReader.close();
                            this.mReader = null;
                        } catch (IOException e2) {
                            e2.printStackTrace();
                        }
                    }
                    if (this.out == null) {
                        throw th;
                    }
                    try {
                        this.out.close();
                    } catch (IOException e3) {
                        e3.printStackTrace();
                    }
                    this.out = null;
                    throw th;
                }
            } catch (IOException e4) {
                e4.printStackTrace();
                if (this.logcatProc != null) {
                    this.logcatProc.destroy();
                    this.logcatProc = null;
                }
                if (this.mReader != null) {
                    try {
                        this.mReader.close();
                        this.mReader = null;
                    } catch (IOException e5) {
                        e5.printStackTrace();
                    }
                }
                if (this.out != null) {
                    try {
                        this.out.close();
                    } catch (IOException e6) {
                        e6.printStackTrace();
                    }
                } else {
                    return;
                }
            }
            if (this.out != null) {
                try {
                    this.out.close();
                } catch (IOException e7) {
                    e7.printStackTrace();
                }
                this.out = null;
            }
        }
    }

    @Override // java.lang.Thread.UncaughtExceptionHandler
    public void uncaughtException(Thread thread, Throwable ex) {
        if (!handleException(ex) && this.mDefaultHandler != null) {
            this.mDefaultHandler.uncaughtException(thread, ex);
            return;
        }
        try {
            Thread.sleep(3000L);
        } catch (InterruptedException e) {
            e.printStackTrace();
        }
        Process.killProcess(Process.myPid());
        System.exit(1);
    }

    /* JADX WARN: Type inference failed for: r0v0, types: [com.youai.dreamonepiece.LogcatHelper$1] */
    public boolean handleException(Throwable ex) {
        if (ex == null) {
            return false;
        }
        new Thread() { // from class: com.youai.dreamonepiece.LogcatHelper.1
            @Override // java.lang.Thread, java.lang.Runnable
            public void run() {
                Looper.prepare();
                Toast.makeText(LogcatHelper.this.mContext, "很抱歉,程序出现异常,即将退出,请联系客服!", 0).show();
                Looper.loop();
            }
        }.start();
        saveCrashInfo2File(ex);
        return true;
    }

    public void collectDeviceInfo(Context context) {
        File tmp = new File(PATH_LOGCAT + File.separator + "device.log");
        if (!tmp.exists()) {
            try {
                PackageManager pm = context.getPackageManager();
                PackageInfo pi = pm.getPackageInfo(context.getPackageName(), 1);
                if (pi != null) {
                    String versionName = pi.versionName == null ? "null" : pi.versionName;
                    String versionCode = pi.versionCode + StatConstants.MTA_COOPERATION_TAG;
                    this.info.put("versionName", versionName);
                    this.info.put("versionCode", versionCode);
                }
            } catch (PackageManager.NameNotFoundException e) {
                e.printStackTrace();
            }
            Field[] fields = Build.class.getDeclaredFields();
            for (Field field : fields) {
                try {
                    field.setAccessible(true);
                    this.info.put(field.getName(), field.get(StatConstants.MTA_COOPERATION_TAG).toString());
                    Log.d(TAG, field.getName() + ":" + field.get(StatConstants.MTA_COOPERATION_TAG));
                } catch (IllegalAccessException e2) {
                    e2.printStackTrace();
                } catch (IllegalArgumentException e3) {
                    e3.printStackTrace();
                }
            }
            StringBuffer sb = new StringBuffer();
            for (Map.Entry<String, String> entry : this.info.entrySet()) {
                String key = entry.getKey();
                String value = entry.getValue();
                sb.append(key + "=" + value + "\r\n");
            }
            if (Environment.getExternalStorageState().equals("mounted")) {
                try {
                    File dir = new File(this.mContext.getExternalFilesDir(null) + File.separator + "Log");
                    if (!dir.exists()) {
                        dir.mkdir();
                    }
                    FileOutputStream fos = new FileOutputStream(new File(dir, "device.log"));
                    fos.write(sb.toString().getBytes());
                    fos.close();
                } catch (FileNotFoundException e4) {
                    e4.printStackTrace();
                } catch (IOException e5) {
                    e5.printStackTrace();
                }
            }
        }
    }

    private String saveCrashInfo2File(Throwable ex) {
        StringBuffer sb = new StringBuffer();
        Writer writer = new StringWriter();
        PrintWriter pw = new PrintWriter(writer);
        ex.printStackTrace(pw);
        for (Throwable cause = ex.getCause(); cause != null; cause = cause.getCause()) {
            cause.printStackTrace(pw);
        }
        pw.close();
        String result = writer.toString();
        sb.append(result);
        long timetamp = System.currentTimeMillis();
        String time = MyDate.getFileName();
        String fileName = "crash-" + time + "-" + timetamp + ".log";
        if (Environment.getExternalStorageState().equals("mounted")) {
            try {
                File dir = new File(this.mContext.getExternalFilesDir(null) + File.separator + "Log");
                if (!dir.exists()) {
                    dir.mkdir();
                }
                FileOutputStream fos = new FileOutputStream(new File(dir, fileName));
                fos.write(sb.toString().getBytes());
                fos.close();
                return fileName;
            } catch (FileNotFoundException e) {
                e.printStackTrace();
            } catch (IOException e2) {
                e2.printStackTrace();
            }
        }
        return null;
    }

    public static class MyDate {
        public static String getFileName() {
            SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
            String date = format.format(new Date(System.currentTimeMillis()));
            return date;
        }

        public static String getDateEN() {
            SimpleDateFormat format1 = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
            String date1 = format1.format(new Date(System.currentTimeMillis()));
            return date1;
        }
    }
}
