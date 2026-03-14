package com.youai;

import android.app.AlertDialog;
import android.content.ComponentName;
import android.content.Context;
import android.content.DialogInterface;
import android.content.Intent;
import android.net.ConnectivityManager;
import android.net.NetworkInfo;
import android.telephony.TelephonyManager;

/* JADX INFO: loaded from: classes.dex */
public class NetworkUtil {
    public static boolean detect(Context act) {
        NetworkInfo networkinfo;
        ConnectivityManager manager = (ConnectivityManager) act.getApplicationContext().getSystemService("connectivity");
        return (manager == null || (networkinfo = manager.getActiveNetworkInfo()) == null || !networkinfo.isAvailable()) ? false : true;
    }

    public static boolean isNetworkAvailable(Context context) {
        NetworkInfo[] info;
        ConnectivityManager cm = (ConnectivityManager) context.getSystemService("connectivity");
        if (cm != null && (info = cm.getAllNetworkInfo()) != null) {
            for (NetworkInfo networkInfo : info) {
                if (networkInfo.getState() == NetworkInfo.State.CONNECTED) {
                    return true;
                }
            }
        }
        return false;
    }

    protected boolean CheckNetwork(final Context pContext) {
        boolean flag = false;
        ConnectivityManager cwjManager = (ConnectivityManager) pContext.getSystemService("connectivity");
        if (cwjManager.getActiveNetworkInfo() != null) {
            flag = cwjManager.getActiveNetworkInfo().isAvailable();
        }
        if (!flag) {
            AlertDialog.Builder b = new AlertDialog.Builder(pContext).setTitle("没有可用的网络").setMessage("请开启GPRS或WIFI网路连接");
            b.setPositiveButton("确定", new DialogInterface.OnClickListener() { // from class: com.youai.NetworkUtil.2
                @Override // android.content.DialogInterface.OnClickListener
                public void onClick(DialogInterface dialog, int which) {
                    Intent mIntent = new Intent("/");
                    ComponentName comp = new ComponentName("com.android.settings", "com.android.settings.WirelessSettings");
                    mIntent.setComponent(comp);
                    mIntent.setAction("android.intent.action.VIEW");
                    pContext.startActivity(mIntent);
                }
            }).setNegativeButton("取消", new DialogInterface.OnClickListener() { // from class: com.youai.NetworkUtil.1
                @Override // android.content.DialogInterface.OnClickListener
                public void onClick(DialogInterface dialog, int which) {
                }
            }).create();
            b.show();
        }
        return flag;
    }

    public static boolean isWifiEnabled(Context context) {
        ConnectivityManager mgrConn = (ConnectivityManager) context.getSystemService("connectivity");
        TelephonyManager mgrTel = (TelephonyManager) context.getSystemService("phone");
        return (mgrConn.getActiveNetworkInfo() != null && mgrConn.getActiveNetworkInfo().getState() == NetworkInfo.State.CONNECTED) || mgrTel.getNetworkType() == 3;
    }

    public static boolean is3rd(Context context) {
        ConnectivityManager cm = (ConnectivityManager) context.getSystemService("connectivity");
        NetworkInfo networkINfo = cm.getActiveNetworkInfo();
        return networkINfo != null && networkINfo.getType() == 0;
    }

    public static boolean isWifi(Context context) {
        ConnectivityManager cm = (ConnectivityManager) context.getSystemService("connectivity");
        NetworkInfo networkINfo = cm.getActiveNetworkInfo();
        return networkINfo != null && networkINfo.getType() == 1;
    }

    public static int getMobileNetISP(Context context) {
        if (!is3rd(context)) {
            return 0;
        }
        TelephonyManager telManager = (TelephonyManager) context.getSystemService("phone");
        String operator = telManager.getSubscriberId();
        if (operator == null) {
            return 0;
        }
        if (operator.startsWith("46000") || operator.startsWith("46002") || operator.startsWith("46007")) {
            return 4;
        }
        if (operator.startsWith("46001")) {
            return 2;
        }
        return operator.startsWith("46003") ? 1 : 0;
    }

    public static int getMobileNetType(Context context) {
        if (isWifi(context)) {
            return 1;
        }
        TelephonyManager telephonyManager = (TelephonyManager) context.getSystemService("phone");
        switch (telephonyManager.getNetworkType()) {
            case 0:
            case 1:
            case 2:
            case 4:
            case 7:
            case 11:
            default:
                return 2;
            case 3:
                return 3;
            case 5:
                return 3;
            case 6:
                return 3;
            case 8:
                return 3;
            case 9:
                return 3;
            case 10:
                return 3;
            case 12:
                return 3;
            case 13:
                return 4;
            case 14:
                return 3;
            case 15:
                return 4;
        }
    }
}
