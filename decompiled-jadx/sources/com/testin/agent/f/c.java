package com.testin.agent.f;

import android.content.Context;
import android.net.ConnectivityManager;
import android.net.NetworkInfo;
import android.telephony.TelephonyManager;
import com.tencent.stat.common.StatConstants;
import com.testin.agent.base.TestinGVariables;

/* JADX INFO: loaded from: classes.dex */
public class c {
    public static String a(String str) {
        return String.valueOf(TestinGVariables.c().a ? "https://" : "http://") + "apm-collector.qtestin.com:80" + str;
    }

    public static boolean a(Context context) {
        NetworkInfo activeNetworkInfo = ((ConnectivityManager) context.getSystemService("connectivity")).getActiveNetworkInfo();
        return activeNetworkInfo != null && activeNetworkInfo.isConnected() && activeNetworkInfo.getState() == NetworkInfo.State.CONNECTED;
    }

    public static String b(Context context) {
        String networkOperator = ((TelephonyManager) context.getSystemService("phone")).getNetworkOperator();
        return (networkOperator == null || networkOperator.equals(StatConstants.MTA_COOPERATION_TAG)) ? "0" : networkOperator;
    }

    public static String c(Context context) {
        NetworkInfo activeNetworkInfo = ((ConnectivityManager) context.getSystemService("connectivity")).getActiveNetworkInfo();
        if (activeNetworkInfo == null || !activeNetworkInfo.isConnected()) {
            return StatConstants.MTA_COOPERATION_TAG;
        }
        return String.valueOf(activeNetworkInfo.getType() == 1 ? "1" : "0") + "/" + activeNetworkInfo.getSubtype();
    }
}
