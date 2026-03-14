package com.igexin.getuiext.a;

import android.content.Context;
import android.content.Intent;
import android.content.pm.ApplicationInfo;
import android.content.pm.PackageInfo;
import com.igexin.getuiext.data.Consts;
import com.igexin.getuiext.service.GetuiExtService;
import java.io.ByteArrayOutputStream;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import java.util.zip.GZIPOutputStream;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

/* JADX INFO: loaded from: classes.dex */
public class c implements a {
    private final String a = "GetuiExt-BindCIDAction";

    private static void a(long j) {
        com.igexin.getuiext.data.a.b = j;
        com.igexin.getuiext.b.c.d().a().b();
    }

    private void a(Context context, long j) {
        ArrayList arrayList = new ArrayList();
        a(context, arrayList);
        int size = arrayList.size();
        if (size <= 0) {
            return;
        }
        JSONObject jSONObject = new JSONObject();
        try {
            jSONObject.put("action", "reportApps");
            jSONObject.put("cid", Consts.CID);
            jSONObject.put("app_id", Consts.APPID);
            jSONObject.put("selfpkg", context.getPackageName());
            JSONArray jSONArray = new JSONArray();
            for (int i = 0; i < size; i++) {
                JSONObject jSONObject2 = new JSONObject();
                com.igexin.getuiext.data.a.c cVar = (com.igexin.getuiext.data.a.c) arrayList.get(i);
                jSONObject2.put("pkgname", cVar.b);
                jSONObject2.put("versionCode", String.valueOf(cVar.d));
                jSONObject2.put("checksum", cVar.f);
                jSONArray.put(jSONObject2);
            }
            String strA = com.igexin.getuiext.util.g.a(String.valueOf(System.currentTimeMillis()));
            ByteArrayOutputStream byteArrayOutputStream = new ByteArrayOutputStream();
            GZIPOutputStream gZIPOutputStream = new GZIPOutputStream(byteArrayOutputStream);
            gZIPOutputStream.write(jSONArray.toString().getBytes());
            gZIPOutputStream.close();
            int size2 = byteArrayOutputStream.size();
            byte[] bArr = new byte[size2 + 16];
            byte[] bytes = strA.substring(0, 8).getBytes();
            byte[] bytes2 = strA.substring(24, 32).getBytes();
            System.arraycopy(bytes, 0, bArr, 0, 8);
            System.arraycopy(byteArrayOutputStream.toByteArray(), 0, bArr, 8, size2);
            System.arraycopy(bytes2, 0, bArr, size2 + 8, 8);
            byteArrayOutputStream.close();
            jSONObject.put("apps", new String(bArr, "ISO-8859-1"));
            String strA2 = com.igexin.getuiext.util.c.a(Consts.DELIVER_URL, jSONObject, Consts.DEFAULT_RETRY_TIMES);
            if (strA2 == null || !"1".equals(new JSONObject(strA2).getString("result"))) {
                return;
            }
            com.igexin.getuiext.data.a.a = j;
            com.igexin.getuiext.b.c.d().a().a();
        } catch (Exception e) {
        }
    }

    private void a(Context context, List list) {
        d dVar = new d(this);
        List<PackageInfo> installedPackages = context.getPackageManager().getInstalledPackages(0);
        int size = installedPackages.size();
        for (int i = 0; i < size; i++) {
            try {
                PackageInfo packageInfo = installedPackages.get(i);
                ApplicationInfo applicationInfo = packageInfo.applicationInfo;
                if ((applicationInfo.flags & 1) <= 0) {
                    com.igexin.getuiext.data.a.c cVar = new com.igexin.getuiext.data.a.c();
                    cVar.b = applicationInfo.packageName;
                    cVar.d = packageInfo.versionCode;
                    cVar.f = com.igexin.getuiext.util.h.b(context, applicationInfo.packageName, applicationInfo.sourceDir);
                    list.add(cVar);
                }
            } catch (Exception e) {
            }
        }
        Collections.sort(list, dVar);
    }

    @Override // com.igexin.getuiext.a.a
    public void a(Context context, Intent intent) {
        String stringExtra = intent.getStringExtra("cid");
        Consts.CID = stringExtra;
        if (System.currentTimeMillis() - com.igexin.getuiext.data.a.b < Consts.TIME_24HOUR) {
            context.stopService(new Intent(context, (Class<?>) GetuiExtService.class));
            return;
        }
        JSONObject jSONObject = new JSONObject();
        try {
            jSONObject.put("action", "bindApp");
            jSONObject.put("cid", stringExtra);
            jSONObject.put("app_id", Consts.APPID);
            jSONObject.put("pkgname", context.getPackageName());
            jSONObject.put("inc_version", Consts.VERSION);
            String strA = com.igexin.getuiext.util.c.a(Consts.DELIVER_URL, jSONObject, Consts.DEFAULT_RETRY_TIMES);
            if (strA != null) {
                try {
                    if ("1".equals(new JSONObject(strA).getString("result"))) {
                        long jCurrentTimeMillis = System.currentTimeMillis();
                        long j = jCurrentTimeMillis - com.igexin.getuiext.data.a.a;
                        a(jCurrentTimeMillis);
                        if (j > 259200000) {
                            a(context, jCurrentTimeMillis);
                        }
                    }
                } catch (JSONException e) {
                }
            }
        } catch (JSONException e2) {
        }
        context.stopService(new Intent(context, (Class<?>) GetuiExtService.class));
    }
}
