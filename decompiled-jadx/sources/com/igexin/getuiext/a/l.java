package com.igexin.getuiext.a;

import android.content.Context;
import android.content.Intent;
import com.igexin.download.Downloads;
import com.igexin.getuiext.data.Consts;
import com.igexin.getuiext.service.GetuiExtService;
import org.json.JSONException;
import org.json.JSONObject;

/* JADX INFO: loaded from: classes.dex */
public class l implements a {
    private final String a = "GetuiExt-QueryUpdateAction";

    /* JADX INFO: Access modifiers changed from: private */
    public void a(Context context, String str, String str2, String str3, String str4, boolean z) {
        try {
            JSONObject jSONObject = new JSONObject(str);
            int i = jSONObject.getInt("result");
            if (z) {
                if (Consts.APPID == null) {
                    Consts.APPID = com.igexin.getuiext.util.h.a(context);
                }
                if (Consts.APPID != null) {
                    Intent intent = new Intent("com.igexin.sdk.action." + Consts.APPID);
                    intent.putExtra("action", Consts.UPDATE_RESULT);
                    intent.putExtra("result", i);
                    context.sendBroadcast(intent);
                }
            }
            if (i == 0) {
                return;
            }
            Intent intent2 = new Intent(context, (Class<?>) GetuiExtService.class);
            intent2.putExtra("action", "handleUpdate");
            intent2.putExtra("name", jSONObject.getString("name"));
            intent2.putExtra("logo_url", jSONObject.getString("logo"));
            intent2.putExtra("versionCode", jSONObject.getString("versionCode"));
            intent2.putExtra("versionName", jSONObject.getString("versionName"));
            intent2.putExtra("fullSize", jSONObject.getLong("fullsize"));
            intent2.putExtra("diffSize", jSONObject.getLong("diffsize"));
            intent2.putExtra("updateType", jSONObject.getString("updateType"));
            intent2.putExtra("diffFileurl", jSONObject.getString("diffFileurl"));
            intent2.putExtra("fullFileurl", jSONObject.getString("fullFileurl"));
            intent2.putExtra("originalUrl", jSONObject.getString("originalUrl"));
            intent2.putExtra("diffChecksum", jSONObject.getString("diffChecksum"));
            intent2.putExtra("fullChecksum", jSONObject.getString("fullChecksum"));
            intent2.putExtra(Downloads.COLUMN_DESCRIPTION, jSONObject.getString(Downloads.COLUMN_DESCRIPTION));
            if (jSONObject.has("recommendType")) {
                intent2.putExtra("recommendType", jSONObject.getString("recommendType"));
            }
            if (jSONObject.has("recommendApps")) {
                intent2.putExtra("recommendApps", jSONObject.getString("recommendApps"));
            }
            if (jSONObject.has("recommendImg")) {
                intent2.putExtra("recommendImg", jSONObject.getString("recommendImg"));
            }
            if (jSONObject.has("recommendTxt")) {
                intent2.putExtra("recommendTxt", jSONObject.getString("recommendTxt"));
            }
            intent2.putExtra("pkgname", str2);
            intent2.putExtra("sendId", str3);
            intent2.putExtra("taskid", str4);
            intent2.putExtra("what", Consts.SERVICE_ONRECEIVE);
            context.startService(intent2);
        } catch (JSONException e) {
        }
    }

    @Override // com.igexin.getuiext.a.a
    public void a(Context context, Intent intent) {
        String stringExtra = intent.getStringExtra("pkgName");
        String stringExtra2 = intent.getStringExtra("versionCode");
        boolean booleanExtra = intent.getBooleanExtra("manual", false);
        String stringExtra3 = intent.getStringExtra("taskid");
        String stringExtra4 = intent.getStringExtra("sendId");
        JSONObject jSONObjectA = com.igexin.getuiext.util.h.a(context, stringExtra, stringExtra2, intent.getBooleanExtra("cleanInstall", false));
        if (jSONObjectA == null) {
            return;
        }
        new m(this, context, stringExtra4, stringExtra3, booleanExtra).execute(jSONObjectA);
    }
}
