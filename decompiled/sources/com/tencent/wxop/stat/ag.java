package com.tencent.wxop.stat;

import android.content.Context;
import com.pipaw.pipawpay.PipawSDK;
import java.util.Timer;

/* JADX INFO: loaded from: classes.dex */
public class ag {
    private static volatile ag dd = null;
    private Timer dc;
    private Context h;

    private ag(Context context) {
        this.dc = null;
        this.h = null;
        this.h = context.getApplicationContext();
        this.dc = new Timer(false);
    }

    public static ag Z(Context context) {
        if (dd == null) {
            synchronized (ag.class) {
                if (dd == null) {
                    dd = new ag(context);
                }
            }
        }
        return dd;
    }

    public final void ah() {
        if (c.j() == d.PERIOD) {
            long jU = c.u() * 60 * PipawSDK.PAY_CANCEL;
            if (c.k()) {
                com.tencent.wxop.stat.b.l.av().b("setupPeriodTimer delay:" + jU);
            }
            ah ahVar = new ah(this);
            if (this.dc != null) {
                if (c.k()) {
                    com.tencent.wxop.stat.b.l.av().b("setupPeriodTimer schedule delay:" + jU);
                }
                this.dc.schedule(ahVar, jU);
            } else if (c.k()) {
                com.tencent.wxop.stat.b.l.av().c("setupPeriodTimer schedule timer == null");
            }
        }
    }
}
