package com.igexin.getuiext.a;

import android.R;
import android.app.Notification;
import android.app.NotificationManager;
import android.app.PendingIntent;
import android.content.Context;
import android.content.Intent;
import android.content.pm.ApplicationInfo;
import android.graphics.Bitmap;
import android.graphics.BitmapFactory;
import android.media.AudioManager;
import android.os.Bundle;
import android.widget.RemoteViews;
import com.igexin.download.Downloads;
import com.igexin.getuiext.data.Consts;
import com.pipaw.pipawpay.PipawSDK;
import com.tencent.stat.common.StatConstants;
import java.io.IOException;
import java.util.HashMap;
import java.util.Random;
import org.apache.http.MethodNotSupportedException;

/* JADX INFO: loaded from: classes.dex */
public class g implements a {
    private final String a = "GetuiExt-HandleQueryUpdateResponseAction";
    private Random b = null;

    private String a(String str, Intent intent) {
        if (str == null) {
            return null;
        }
        if (str.equals("app")) {
            return intent.getStringExtra("recommendApps");
        }
        if (str.equals("img")) {
            return intent.getStringExtra("recommendImg");
        }
        if (str.equals("txt")) {
            return intent.getStringExtra("recommendTxt");
        }
        return null;
    }

    private void b(Context context, Intent intent) {
        boolean z;
        boolean z2 = false;
        com.igexin.getuiext.data.a.e eVar = new com.igexin.getuiext.data.a.e();
        eVar.n = com.igexin.getuiext.data.a.f.a(intent.getStringExtra("updateType"));
        switch (h.a[eVar.n.ordinal()]) {
            case 1:
                eVar.g = intent.getStringExtra("diffFileurl");
                z = false;
                break;
            case 2:
                z2 = true;
                eVar.g = intent.getStringExtra("fullFileurl");
            default:
                z = z2;
                break;
        }
        String stringExtra = intent.getStringExtra("name");
        String str = (stringExtra == null || !stringExtra.equals("null")) ? stringExtra : "未知应用";
        eVar.a = str;
        String stringExtra2 = intent.getStringExtra("logo_url");
        String str2 = (stringExtra2 == null || !stringExtra2.equals("null")) ? stringExtra2 : null;
        eVar.f = str2;
        eVar.b = intent.getStringExtra("pkgname");
        eVar.c = intent.getStringExtra("versionName");
        eVar.d = Integer.parseInt(intent.getStringExtra("versionCode"));
        eVar.i = intent.getLongExtra("fullSize", 0L);
        eVar.o = intent.getLongExtra("diffSize", 0L);
        eVar.p = intent.getStringExtra("diffChecksum");
        eVar.q = intent.getStringExtra("fullChecksum");
        eVar.j = intent.getStringExtra("sendId");
        eVar.h = intent.getStringExtra("originalUrl");
        eVar.s = intent.getStringExtra("recommendType");
        eVar.t = a(eVar.s, intent);
        eVar.k = intent.getStringExtra("taskid");
        eVar.r = intent.getStringExtra(Downloads.COLUMN_DESCRIPTION);
        eVar.m = com.igexin.getuiext.util.h.a(context, eVar.b);
        com.igexin.getuiext.service.c.a().a(eVar.b, eVar);
        int iCurrentTimeMillis = (int) System.currentTimeMillis();
        PendingIntent pendingIntentA = a(context, eVar, eVar.s, eVar.t, iCurrentTimeMillis);
        NotificationManager notificationManager = (NotificationManager) context.getSystemService("notification");
        Notification notification = new Notification();
        notification.icon = R.drawable.stat_sys_download;
        notification.tickerText = str + "有更新";
        notification.defaults = 4;
        notification.flags = 16;
        int ringerMode = ((AudioManager) context.getSystemService("audio")).getRingerMode();
        if (ringerMode == 1) {
            notification.sound = null;
            notification.defaults |= 2;
        } else if (ringerMode == 2) {
            notification.defaults |= 2;
            notification.defaults |= 1;
        }
        ApplicationInfo applicationInfo = context.getApplicationInfo();
        int identifier = context.getResources().getIdentifier("notification_inc", "layout", applicationInfo.packageName);
        if (identifier != 0) {
            notification.contentView = new RemoteViews(applicationInfo.packageName, identifier);
            int identifier2 = context.getResources().getIdentifier("notification_icon", "id", applicationInfo.packageName);
            int identifier3 = context.getResources().getIdentifier("notification_update_icon", "id", applicationInfo.packageName);
            Bitmap bitmapA = com.igexin.getuiext.util.f.a(context, "inc-default.png");
            if (str2 != null) {
                Bitmap bitmapDecodeStream = null;
                try {
                    bitmapDecodeStream = BitmapFactory.decodeStream(com.igexin.getuiext.util.c.a("GET", str2, (HashMap) null));
                } catch (MethodNotSupportedException e) {
                }
                if (bitmapDecodeStream != null) {
                    notification.contentView.setImageViewBitmap(identifier2, bitmapDecodeStream);
                } else if (bitmapA != null) {
                    notification.contentView.setImageViewBitmap(identifier2, bitmapA);
                } else {
                    notification.contentView.setImageViewResource(identifier2, R.drawable.sym_def_app_icon);
                }
            } else if (bitmapA != null) {
                notification.contentView.setImageViewBitmap(identifier2, bitmapA);
            } else {
                notification.contentView.setImageViewResource(identifier2, R.drawable.sym_def_app_icon);
            }
            notification.contentView.setOnClickPendingIntent(identifier3, pendingIntentA);
            try {
                notification.contentView.setImageViewBitmap(identifier3, BitmapFactory.decodeStream(context.getAssets().open("inc_update.png")));
            } catch (IOException e2) {
            }
            notification.contentView.setTextViewText(context.getResources().getIdentifier("notification_name", "id", applicationInfo.packageName), str);
            notification.contentView.setTextViewText(context.getResources().getIdentifier("notification_version", "id", applicationInfo.packageName), "V" + eVar.c);
            notification.contentView.setTextViewText(context.getResources().getIdentifier("notification_fullsize", "id", applicationInfo.packageName), String.format("%.2f", Float.valueOf(eVar.i / 1048576.0f)) + "M");
            if (!z) {
                notification.contentView.setTextViewText(context.getResources().getIdentifier("notification_diffsize", "id", applicationInfo.packageName), "只需:" + String.format("%.2f", Float.valueOf(eVar.o / 1048576.0f)) + "M");
            }
            notification.contentView.setTextViewText(context.getResources().getIdentifier("notification_update_text", "id", applicationInfo.packageName), "更新");
        }
        if (identifier == 0) {
            notification.setLatestEventInfo(context, StatConstants.MTA_COOPERATION_TAG, StatConstants.MTA_COOPERATION_TAG, pendingIntentA);
        } else {
            notification.contentIntent = pendingIntentA;
        }
        com.igexin.getuiext.util.h hVar = new com.igexin.getuiext.util.h();
        if (System.currentTimeMillis() - hVar.b() < Consts.TIME_24HOUR) {
            return;
        }
        notificationManager.notify(iCurrentTimeMillis, notification);
        hVar.a();
        com.igexin.getuiext.service.a.a(context, eVar, 1);
    }

    PendingIntent a(Context context, com.igexin.getuiext.data.a.e eVar, String str, String str2, int i) {
        Intent intent = new Intent("com.igexin.increment");
        intent.addFlags(268435456);
        intent.putExtra("action", "download");
        Bundle bundle = new Bundle();
        bundle.putString("name", eVar.a);
        bundle.putLong("diffSize", eVar.o);
        bundle.putLong("fullSize", eVar.i);
        bundle.putString("versionName", eVar.c);
        bundle.putString(Downloads.COLUMN_DESCRIPTION, eVar.r);
        bundle.putString("url", eVar.g);
        bundle.putString("logo_url", eVar.f);
        bundle.putInt("notifID", i);
        bundle.putString("updateType", eVar.n.toString());
        bundle.putString("pkgname", eVar.b);
        bundle.putInt("versionCode", eVar.d);
        bundle.putInt("verifyCode", Consts.verifyCode);
        bundle.putString("originalUrl", eVar.h);
        bundle.putInt("previous_version_code", eVar.m);
        bundle.putString("recommendType", str);
        bundle.putString("promotion_attrs", str2);
        bundle.putString("taskid", eVar.k);
        bundle.putString("sendId", eVar.j);
        intent.putExtras(bundle);
        if (this.b == null) {
            this.b = new Random();
            this.b.setSeed(System.currentTimeMillis());
        }
        return PendingIntent.getBroadcast(context, this.b.nextInt(PipawSDK.PAY_CANCEL), intent, 134217728);
    }

    @Override // com.igexin.getuiext.a.a
    public void a(Context context, Intent intent) {
        b(context, intent);
    }
}
