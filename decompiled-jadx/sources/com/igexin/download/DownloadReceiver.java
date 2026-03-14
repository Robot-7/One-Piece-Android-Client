package com.igexin.download;

import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.Intent;
import android.net.NetworkInfo;
import com.igexin.sdk.PushConsts;

/* JADX INFO: loaded from: classes.dex */
public class DownloadReceiver extends BroadcastReceiver {
    @Override // android.content.BroadcastReceiver
    public void onReceive(Context context, Intent intent) {
        if (!intent.getAction().equals(PushConsts.ACTION_BROADCAST_NETWORK_CHANGE)) {
            if (intent.getAction().equals("android.intent.action.GTDOWNLOAD_WAKEUP")) {
                context.startService(new Intent(context, (Class<?>) DownloadService.class));
            }
        } else {
            NetworkInfo networkInfo = (NetworkInfo) intent.getParcelableExtra("networkInfo");
            if (networkInfo == null || !networkInfo.isConnected()) {
                return;
            }
            context.startService(new Intent(context, (Class<?>) DownloadService.class));
        }
    }
}
