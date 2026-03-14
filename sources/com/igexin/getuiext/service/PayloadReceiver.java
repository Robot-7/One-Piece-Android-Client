package com.igexin.getuiext.service;

import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.Intent;
import android.os.Bundle;
import com.igexin.getuiext.data.Consts;
import com.tencent.stat.common.StatConstants;
import org.json.JSONException;
import org.json.JSONObject;

/* JADX INFO: loaded from: classes.dex */
public class PayloadReceiver extends BroadcastReceiver {
    @Override // android.content.BroadcastReceiver
    public void onReceive(Context context, Intent intent) {
        String string;
        String action = intent.getAction();
        String strA = com.igexin.getuiext.util.h.a(context);
        if (strA == null) {
            return;
        }
        Bundle extras = intent.getExtras();
        if (("com.igexin.sdk.action." + strA).equals(action)) {
            if (extras.getInt("action") != 10002 || (string = extras.getString("clientid")) == null) {
                return;
            }
            Intent intent2 = new Intent(context, (Class<?>) GetuiExtService.class);
            intent2.putExtra("action", "bindApp");
            intent2.putExtra("cid", string);
            intent2.putExtra("what", Consts.SERVICE_ONRECEIVE);
            context.startService(intent2);
            return;
        }
        if (extras.getInt("action") == 10001) {
            if (context.getPackageName().equals(extras.getString("packagename")) && extras.getString("appid").equals(Consts.INC_APPID)) {
                if (System.currentTimeMillis() - new com.igexin.getuiext.util.h().b() >= Consts.TIME_24HOUR) {
                    byte[] byteArray = extras.getByteArray("payload");
                    String string2 = extras.getString("taskid");
                    if (byteArray == null || StatConstants.MTA_COOPERATION_TAG.equals(string2)) {
                        return;
                    }
                    try {
                        JSONObject jSONObject = new JSONObject(new String(byteArray));
                        String string3 = jSONObject.getString("action");
                        String string4 = jSONObject.getString("pkgname");
                        String string5 = jSONObject.getString("versionCode");
                        String string6 = jSONObject.getString("sendId");
                        String string7 = jSONObject.getString("context");
                        boolean z = jSONObject.has("cleanInstall") ? jSONObject.getBoolean("cleanInstall") : false;
                        if (string3 == null || string4 == null || string5 == null) {
                            return;
                        }
                        Intent intent3 = new Intent(context, (Class<?>) GetuiExtService.class);
                        intent3.putExtra("action", string3);
                        intent3.putExtra("pkgName", string4);
                        intent3.putExtra("versionCode", string5);
                        intent3.putExtra("taskid", string2);
                        intent3.putExtra("sendId", string6);
                        intent3.putExtra("context", string7);
                        intent3.putExtra("what", Consts.SERVICE_ONRECEIVE);
                        intent3.putExtra("cleanInstall", z);
                        context.startService(intent3);
                    } catch (JSONException e) {
                    }
                }
            }
        }
    }
}
