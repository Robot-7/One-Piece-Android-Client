package com.youai.dreamonepiece;

import android.app.Notification;
import android.app.NotificationManager;
import android.app.PendingIntent;
import android.app.Service;
import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.Intent;
import android.content.IntentFilter;
import android.os.IBinder;
import android.util.Log;
import com.igexin.download.Downloads;
import com.pipaw.pipawpay.PipawSDK;
import java.util.Date;
import java.util.Timer;
import java.util.TimerTask;

/* JADX INFO: loaded from: classes.dex */
public class NotificationService extends Service {
    private static final String TAG = NotificationService.class.getSimpleName();
    private StringBuilder buf;
    private DataReceiver dataReceiver;
    private Date date;
    private NotificationManager notif;
    private Timer timer;

    @Override // android.app.Service
    public void onCreate() {
        super.onCreate();
        this.timer = new Timer("Notificationservice");
        this.notif = (NotificationManager) getSystemService("notification");
        this.dataReceiver = new DataReceiver();
        IntentFilter filter = new IntentFilter();
        filter.addAction("com.youai.dreamonepiece.notificationservice");
        registerReceiver(this.dataReceiver, filter);
    }

    class DataReceiver extends BroadcastReceiver {
        DataReceiver() {
        }

        @Override // android.content.BroadcastReceiver
        public void onReceive(Context context, Intent intent) {
            boolean isClear = intent.getBooleanExtra("clear", false);
            if (isClear) {
                NotificationService.this.timer.cancel();
                NotificationService.this.timer = new Timer("Notificationservice");
            } else {
                String title = intent.getStringExtra(Downloads.COLUMN_TITLE);
                String msg = intent.getStringExtra("message");
                int time = intent.getIntExtra("delayminite", 0);
                Log.i("DataReceiver onReceive:", title + msg);
                NotificationService.this.timer.schedule(NotificationService.this.new NotificationTask(msg, title), time * 60 * PipawSDK.PAY_CANCEL);
            }
        }
    }

    class NotificationTask extends TimerTask {
        String Noticontent;
        String Notititle;
        long showTime;

        public NotificationTask(String pTickrText, String pNotititle) {
            this.Notititle = pNotititle;
            this.Noticontent = pTickrText;
        }

        @Override // java.util.TimerTask, java.lang.Runnable
        public void run() {
            this.showTime = System.currentTimeMillis() + 1000;
            Notification notifica = new Notification(NotificationService.this.getApplicationInfo().icon, this.Notititle, this.showTime);
            notifica.flags = 16;
            Intent intent = new Intent(NotificationService.this, (Class<?>) GameActivity.class);
            intent.setFlags(335544320);
            intent.setAction("com.youai.dreamonepiece.notificationservice");
            PendingIntent contentIntent = PendingIntent.getActivity(NotificationService.this, 0, intent, 1073741824);
            notifica.setLatestEventInfo(NotificationService.this, this.Notititle, this.Noticontent, contentIntent);
            NotificationService.this.date = new Date();
            NotificationService.this.buf = new StringBuilder();
            int seq = 0;
            if (0 > 99999) {
                seq = 0;
            }
            NotificationService.this.buf.delete(0, NotificationService.this.buf.length());
            NotificationService.this.date.setTime(System.currentTimeMillis());
            int i = seq + 1;
            String str = String.format("%1$tY%1$tm%1$td%1$tk%1$tM%1$tS%2$05d", NotificationService.this.date, Integer.valueOf(seq));
            NotificationService.this.notif.notify((int) Long.parseLong(str), notifica);
        }
    }

    @Override // android.app.Service
    public void onDestroy() {
        super.onDestroy();
        Log.i(TAG, "Service destroyed");
        this.timer.cancel();
        this.timer = null;
        unregisterReceiver(this.dataReceiver);
    }

    @Override // android.app.Service
    public IBinder onBind(Intent intent) {
        return null;
    }
}
