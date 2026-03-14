package com.igexin.push.core.b;

import android.content.Context;
import android.content.Intent;
import android.content.pm.PackageInfo;
import android.content.pm.Signature;
import android.os.RemoteException;
import com.igexin.sdk.PushConsts;
import java.util.List;

/* JADX INFO: loaded from: classes.dex */
public class c {
    private static c a;

    public static c a() {
        if (a == null) {
            a = new c();
        }
        return a;
    }

    public int a(String str, i iVar) {
        if (str == null) {
            return -1;
        }
        h hVarA = e.a().a(str);
        if (System.currentTimeMillis() > Long.valueOf(hVarA.c()).longValue()) {
            return -1;
        }
        List listE = hVarA.e();
        for (int i = 0; i < listE.size(); i++) {
            if (listE.get(i) == iVar) {
                return 0;
            }
        }
        return -2;
    }

    public String a(String str) {
        Signature[] signatureArr;
        List<PackageInfo> installedPackages = com.igexin.push.core.g.i.getPackageManager().getInstalledPackages(64);
        for (int i = 0; i < installedPackages.size(); i++) {
            PackageInfo packageInfo = installedPackages.get(i);
            if (packageInfo.packageName.equals(str) && (signatureArr = packageInfo.signatures) != null && signatureArr.length > 0) {
                return signatureArr[0].toCharsString();
            }
        }
        return null;
    }

    public void a(Intent intent) {
        if (intent == null || !intent.hasExtra("action")) {
            return;
        }
        String stringExtra = intent.getStringExtra("action");
        if (!stringExtra.equals("connected")) {
            if (stringExtra.equals("disconnected")) {
                a aVarA = b.a().a(intent.getStringExtra("pkgname"));
                try {
                    if (aVarA.b() != null) {
                        com.igexin.push.core.g.i.unbindService(aVarA.a());
                        return;
                    }
                    return;
                } catch (Exception e) {
                    return;
                }
            }
            return;
        }
        String stringExtra2 = intent.getStringExtra("pkgname");
        a aVarA2 = b.a().a(stringExtra2);
        long jCurrentTimeMillis = System.currentTimeMillis();
        h hVarA = e.a().a(stringExtra2);
        String strB = hVarA.b();
        long jC = hVarA.c();
        if (jCurrentTimeMillis > jC) {
            strB = com.igexin.a.b.a.a(stringExtra2 + "-" + jCurrentTimeMillis);
            jC = 604800 + jCurrentTimeMillis;
            hVarA.b(strB);
            hVarA.a(jC);
        }
        e.a().a(stringExtra2, hVarA);
        try {
            if (aVarA2.b() != null) {
                aVarA2.b().onAuthenticated(com.igexin.push.core.g.g, "com.igexin.sdk.PushService", strB, jC);
            }
        } catch (RemoteException e2) {
        }
        try {
            if (aVarA2.b() != null) {
                com.igexin.push.core.g.i.unbindService(aVarA2.a());
            }
        } catch (Exception e3) {
        }
    }

    public void b(Intent intent) {
        if (intent.getStringExtra("action").equals(PushConsts.ACTION_BROADCAST_REFRESHLS)) {
            String stringExtra = intent.getStringExtra("callback_pkgname");
            String stringExtra2 = intent.getStringExtra("callback_classname");
            a aVar = new a();
            aVar.a(stringExtra);
            aVar.a(new d(this));
            b.a().a(stringExtra, aVar);
            try {
                Context contextCreatePackageContext = com.igexin.push.core.g.i.createPackageContext(stringExtra, 3);
                com.igexin.push.core.g.i.bindService(new Intent(contextCreatePackageContext, contextCreatePackageContext.getClassLoader().loadClass(stringExtra2)), aVar.a(), 1);
            } catch (Exception e) {
            }
        }
    }
}
