package com.igexin.getuiext.ui;

import android.content.Context;
import android.content.Intent;
import com.igexin.download.SdkDownLoader;
import com.igexin.getuiext.data.Consts;

/* JADX INFO: loaded from: classes.dex */
public class b {
    public static int a(Context context, com.igexin.getuiext.data.a.d dVar, boolean z) {
        Context applicationContext = context.getApplicationContext();
        if (dVar == null) {
            return -1;
        }
        SdkDownLoader instantiate = SdkDownLoader.getInstantiate(applicationContext);
        instantiate.setDownloadDir("/libs/tmp/");
        int iNewTask = instantiate.newTask(dVar.g, dVar.a, dVar.f, z, Consts.DOWNLOAD_HANDLER_OWNER);
        com.igexin.getuiext.b.c cVarD = com.igexin.getuiext.b.c.d();
        cVarD.a(applicationContext);
        cVarD.c().a(iNewTask, dVar);
        a(applicationContext, dVar);
        return iNewTask;
    }

    public static void a(Context context, int i, com.igexin.getuiext.data.a.a aVar) {
        Context applicationContext = context.getApplicationContext();
        Intent intent = new Intent("com.igexin.download.action.notify.click");
        intent.putExtra("action", "run");
        intent.putExtra("id", i);
        intent.putExtra("verifyCode", Consts.verifyCode);
        applicationContext.sendBroadcast(intent);
        if (aVar != null) {
            if (aVar instanceof com.igexin.getuiext.data.a.e) {
                com.igexin.getuiext.service.a.a(applicationContext, aVar, 9);
            } else if (aVar instanceof com.igexin.getuiext.ui.promotion.f) {
                com.igexin.getuiext.service.a.a(applicationContext, aVar, 7);
            }
        }
    }

    public static void a(Context context, int i, com.igexin.getuiext.data.a.d dVar) {
        Context applicationContext = context.getApplicationContext();
        Intent intent = new Intent("com.igexin.download.action.notify.click");
        intent.putExtra("action", "pause");
        intent.putExtra("id", i);
        intent.putExtra("verifyCode", Consts.verifyCode);
        applicationContext.sendBroadcast(intent);
        if (dVar != null) {
            if (dVar instanceof com.igexin.getuiext.data.a.e) {
                com.igexin.getuiext.service.a.a(applicationContext, dVar, 8);
            } else if (dVar instanceof com.igexin.getuiext.ui.promotion.f) {
                com.igexin.getuiext.service.a.a(applicationContext, dVar, 6);
            }
        }
    }

    private static void a(Context context, com.igexin.getuiext.data.a.d dVar) {
        new c(dVar, context).execute(new Void[0]);
    }

    public static void a(Context context, String str) {
        Intent launchIntentForPackage = context.getPackageManager().getLaunchIntentForPackage(str);
        if (launchIntentForPackage != null) {
            context.startActivity(launchIntentForPackage);
        }
    }

    public static void a(Context context, String str, int i, com.igexin.getuiext.data.a.a aVar) {
        Intent intent = new Intent("com.igexin.increment");
        intent.putExtra("action", "install");
        intent.putExtra("filepath", str);
        intent.putExtra("pkgname", aVar.b);
        intent.putExtra("verifyCode", Consts.verifyCode);
        context.sendBroadcast(intent);
    }
}
