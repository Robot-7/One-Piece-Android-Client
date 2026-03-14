package com.tencent.stat;

import android.content.Context;
import com.pipaw.pipawpay.PipawSDK;
import java.util.Timer;
import java.util.TimerTask;

/* JADX INFO: loaded from: classes.dex */
public class d {
    private static volatile d b = null;
    private Timer a;
    private Context c;

    private d(Context context) {
        this.a = null;
        this.c = null;
        this.c = context.getApplicationContext();
        this.a = new Timer(false);
    }

    public static d a(Context context) {
        if (b == null) {
            synchronized (d.class) {
                if (b == null) {
                    b = new d(context);
                }
            }
        }
        return b;
    }

    public void a() {
        if (StatConfig.getStatSendStrategy() == StatReportStrategy.PERIOD) {
            long sendPeriodMinutes = StatConfig.getSendPeriodMinutes() * 60 * PipawSDK.PAY_CANCEL;
            if (StatConfig.isDebugEnable()) {
                com.tencent.stat.common.k.b().i("setupPeriodTimer delay:" + sendPeriodMinutes);
            }
            a(new e(this), sendPeriodMinutes);
        }
    }

    public void a(TimerTask timerTask, long j) {
        if (this.a != null) {
            if (StatConfig.isDebugEnable()) {
                com.tencent.stat.common.k.b().i("setupPeriodTimer schedule delay:" + j);
            }
            this.a.schedule(timerTask, j);
        } else if (StatConfig.isDebugEnable()) {
            com.tencent.stat.common.k.b().w("setupPeriodTimer schedule timer == null");
        }
    }
}
