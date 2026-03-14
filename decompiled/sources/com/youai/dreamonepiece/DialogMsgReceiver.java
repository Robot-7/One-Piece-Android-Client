package com.youai.dreamonepiece;

import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.Intent;

/* JADX INFO: loaded from: classes.dex */
public class DialogMsgReceiver extends BroadcastReceiver {
    public static String showDialogMsg = "showDialogMsg";

    @Override // android.content.BroadcastReceiver
    public void onReceive(Context context, Intent intent) {
        String pTitle = intent.getStringExtra("pTitle");
        String pMessage = intent.getStringExtra("pMessage");
        AnalyticsToolHelp.clearParamsMap();
        AnalyticsToolHelp.addParamsMapOnePair("pTitle", pTitle);
        AnalyticsToolHelp.addParamsMapOnePair("pMessage", pMessage);
        AnalyticsToolHelp.analyticsLogMapParamsEvent(showDialogMsg, false);
    }
}
