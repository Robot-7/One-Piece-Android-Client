package com.testin.agent.b;

import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.Intent;
import com.testin.agent.base.TestinGVariables;

/* JADX INFO: loaded from: classes.dex */
class k extends BroadcastReceiver {
    double a;

    private k() {
        this.a = 0.0d;
    }

    /* synthetic */ k(k kVar) {
        this();
    }

    @Override // android.content.BroadcastReceiver
    public void onReceive(Context context, Intent intent) {
        if ("android.intent.action.BATTERY_CHANGED".equals(intent.getAction())) {
            int intExtra = intent.getIntExtra("level", -1);
            double intExtra2 = intent.getIntExtra("scale", -1);
            if (intExtra > 0 && intExtra2 > 0.0d) {
                this.a = ((double) intExtra) / intExtra2;
            }
            if (TestinGVariables.c().j.size() != 10) {
                TestinGVariables.c().j.addLast(String.valueOf(this.a));
            } else {
                TestinGVariables.c().j.removeFirst();
                TestinGVariables.c().j.addLast(String.valueOf(this.a));
            }
        }
    }
}
