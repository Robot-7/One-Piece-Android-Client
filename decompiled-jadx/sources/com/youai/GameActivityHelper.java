package com.youai;

import android.app.AlarmManager;
import android.app.AlertDialog;
import android.app.PendingIntent;
import android.content.ComponentName;
import android.content.Context;
import android.content.DialogInterface;
import android.content.Intent;
import android.content.pm.PackageInfo;
import android.content.pm.PackageManager;
import android.content.pm.ResolveInfo;
import android.net.Uri;
import android.os.Handler;
import android.os.Process;
import android.util.Log;
import com.tencent.mm.sdk.constants.ConstantsAPI;
import java.util.List;

/* JADX INFO: loaded from: classes.dex */
public class GameActivityHelper {
    static Context mContext;

    public static void requestRestart(final Context context, Handler pManHandler) {
        pManHandler.post(new Runnable() { // from class: com.youai.GameActivityHelper.1
            @Override // java.lang.Runnable
            public void run() {
                AlarmManager alm = (AlarmManager) context.getSystemService("alarm");
                alm.set(1, System.currentTimeMillis() + 1000, PendingIntent.getActivity(context, 0, new Intent(context, context.getClass()), 0));
                Process.killProcess(Process.myPid());
            }
        });
    }

    public static void openCLD(String packageName, Context context) {
        PackageManager packageManager = context.getPackageManager();
        PackageInfo pi = null;
        try {
            pi = packageManager.getPackageInfo(packageName, 0);
        } catch (PackageManager.NameNotFoundException e) {
        }
        Intent resolveIntent = new Intent("android.intent.action.MAIN", (Uri) null);
        resolveIntent.addCategory("android.intent.category.LAUNCHER");
        resolveIntent.setPackage(pi.packageName);
        List<ResolveInfo> apps = packageManager.queryIntentActivities(resolveIntent, 0);
        ResolveInfo ri = apps.iterator().next();
        if (ri != null) {
            String className = ri.activityInfo.name;
            Intent intent = new Intent("android.intent.action.MAIN");
            intent.addCategory("android.intent.category.LAUNCHER");
            ComponentName cn = new ComponentName(packageName, className);
            intent.setComponent(cn);
            intent.setFlags(268435456);
            intent.setAction("android.intent.action.VIEW");
            try {
                context.startActivity(intent);
            } catch (Exception e2) {
                Log.i("GameActivityHelp", e2.toString());
            }
        }
    }

    public static void noWeChatDialog(final Context context, Handler pMainHandler) {
        pMainHandler.post(new Runnable() { // from class: com.youai.GameActivityHelper.2
            @Override // java.lang.Runnable
            public void run() {
                new AlertDialog.Builder(context).setTitle("提示").setMessage("您还没有安装微信\n").setPositiveButton("确定", (DialogInterface.OnClickListener) null).setNegativeButton("下载", new DialogInterface.OnClickListener() { // from class: com.youai.GameActivityHelper.2.1
                    @Override // android.content.DialogInterface.OnClickListener
                    public void onClick(DialogInterface dialog, int which) {
                        Intent localIntent = new Intent("android.intent.action.VIEW");
                        localIntent.setData(Uri.parse("market://details?id=com.tencent.mm"));
                        try {
                            context.startActivity(localIntent);
                        } catch (Exception e) {
                            Uri uri = Uri.parse("https://market.android.com/details?id=com.tencent.mm");
                            Intent intent = new Intent("android.intent.action.VIEW", uri);
                            context.startActivity(intent);
                        }
                    }
                }).show();
            }
        });
    }

    public static boolean isInstallWeChat(Context pContext, Handler pMainHandler) {
        PackageInfo packageInfo;
        try {
            packageInfo = pContext.getPackageManager().getPackageInfo(ConstantsAPI.WXApp.WXAPP_PACKAGE_NAME, 0);
        } catch (PackageManager.NameNotFoundException e) {
            packageInfo = null;
        }
        return packageInfo != null;
    }

    public static void openWeChat(final Context pContext, final Handler pMainHandler) {
        if (isInstallWeChat(pContext, pMainHandler)) {
            pMainHandler.post(new Runnable() { // from class: com.youai.GameActivityHelper.3
                @Override // java.lang.Runnable
                public void run() {
                    Intent intent = new Intent();
                    intent.setComponent(new ComponentName(ConstantsAPI.WXApp.WXAPP_PACKAGE_NAME, "com.tencent.mm.ui.LauncherUI"));
                    intent.setFlags(268435456);
                    intent.setAction("android.intent.action.VIEW");
                    try {
                        pContext.startActivity(intent);
                    } catch (Exception e) {
                        Log.i("GameActivityHelp", e.toString());
                    }
                }
            });
        } else {
            pMainHandler.post(new Runnable() { // from class: com.youai.GameActivityHelper.4
                @Override // java.lang.Runnable
                public void run() {
                    GameActivityHelper.mContext = pContext;
                    GameActivityHelper.noWeChatDialog(pContext, pMainHandler);
                }
            });
        }
    }
}
