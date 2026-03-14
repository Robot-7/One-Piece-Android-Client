package com.igexin.push.core.a.a;

import android.R;
import android.app.Notification;
import android.app.NotificationManager;
import android.app.PendingIntent;
import android.content.Intent;
import com.igexin.download.Downloads;
import com.igexin.getuiext.data.Consts;
import com.igexin.push.core.bean.BaseAction;
import com.igexin.push.core.bean.PushTaskBean;
import com.pipaw.pipawpay.PipawSDK;
import com.tencent.stat.common.StatConstants;
import java.util.HashMap;
import java.util.Random;
import org.json.JSONException;
import org.json.JSONObject;

/* JADX INFO: loaded from: classes.dex */
public class h implements a {
    private static final String b = com.igexin.push.a.j.a;
    public static HashMap a = new HashMap();

    private PendingIntent a(String str, String str2, String str3, int i) {
        Intent intent = new Intent("com.igexin.sdk.action.doaction");
        intent.putExtra("taskid", str);
        intent.putExtra("messageid", str2);
        intent.putExtra("appid", com.igexin.push.core.g.c);
        intent.putExtra("actionid", str3);
        intent.putExtra("accesstoken", com.igexin.push.core.g.ax);
        intent.putExtra("notifID", i);
        return PendingIntent.getBroadcast(com.igexin.push.core.g.i, new Random().nextInt(PipawSDK.PAY_CANCEL), intent, 134217728);
    }

    @Override // com.igexin.push.core.a.a.a
    public com.igexin.push.core.b a(PushTaskBean pushTaskBean, BaseAction baseAction) {
        return com.igexin.push.core.b.success;
    }

    @Override // com.igexin.push.core.a.a.a
    public BaseAction a(JSONObject jSONObject) {
        try {
            com.igexin.push.core.bean.h hVar = new com.igexin.push.core.bean.h();
            hVar.setType("notification");
            hVar.setActionId(jSONObject.getString("actionid"));
            hVar.setDoActionId(jSONObject.getString("do"));
            String string = jSONObject.getString(Downloads.COLUMN_TITLE);
            String string2 = jSONObject.getString(Consts.PROMOTION_TYPE_TEXT);
            hVar.a(string);
            hVar.b(string2);
            if (jSONObject.has("logo") && !StatConstants.MTA_COOPERATION_TAG.equals(jSONObject.getString("logo"))) {
                String string3 = jSONObject.getString("logo");
                if (string3.lastIndexOf(".png") == -1 && string3.lastIndexOf(".jpeg") == -1) {
                    string3 = "null";
                } else {
                    int iIndexOf = string3.indexOf(".png");
                    if (iIndexOf == -1) {
                        iIndexOf = string3.indexOf(".jpeg");
                    }
                    if (iIndexOf != -1) {
                        string3 = string3.substring(0, iIndexOf);
                    }
                }
                hVar.c(string3);
            }
            if (jSONObject.has("is_noclear")) {
                hVar.a(jSONObject.getBoolean("is_noclear"));
            }
            if (jSONObject.has("is_novibrate")) {
                hVar.b(jSONObject.getBoolean("is_novibrate"));
            }
            if (jSONObject.has("is_noring")) {
                hVar.c(jSONObject.getBoolean("is_noring"));
            }
            if (jSONObject.has("is_chklayout")) {
                hVar.d(jSONObject.getBoolean("is_chklayout"));
            }
            if (jSONObject.has("logo_url")) {
                hVar.d(jSONObject.getString("logo_url"));
            }
            if (jSONObject.has("banner_url")) {
                hVar.e(jSONObject.getString("banner_url"));
            }
            return hVar;
        } catch (JSONException e) {
            return null;
        }
    }

    public void a(String str, String str2, com.igexin.push.core.bean.h hVar) {
        int iCurrentTimeMillis = (int) System.currentTimeMillis();
        com.igexin.push.core.g.am.put(str, Integer.valueOf(iCurrentTimeMillis));
        PendingIntent pendingIntentA = a(str, str2, hVar.getDoActionId(), iCurrentTimeMillis);
        NotificationManager notificationManager = (NotificationManager) com.igexin.push.core.g.i.getSystemService("notification");
        Notification notification = new Notification();
        notification.tickerText = hVar.b();
        notification.defaults = 4;
        notification.ledARGB = -16711936;
        notification.ledOnMS = PipawSDK.PAY_CANCEL;
        notification.ledOffMS = 3000;
        notification.flags = 1;
        if (hVar.c()) {
            notification.flags |= 32;
        } else {
            notification.flags |= 16;
        }
        if (!hVar.e()) {
            notification.defaults |= 1;
        }
        if (!hVar.d()) {
            notification.defaults |= 2;
        }
        int identifier = com.igexin.push.core.g.i.getResources().getIdentifier("push", "drawable", com.igexin.push.core.g.g);
        if (hVar.f() == null) {
            if (identifier != 0) {
                notification.icon = identifier;
            } else {
                notification.icon = R.drawable.sym_def_app_icon;
            }
        } else if ("null".equals(hVar.f())) {
            notification.icon = R.drawable.sym_def_app_icon;
        } else if (hVar.f().startsWith("@")) {
            String strF = hVar.f();
            if (strF.substring(1, strF.length()).endsWith("email")) {
                notification.icon = R.drawable.sym_action_email;
            } else {
                notification.icon = R.drawable.sym_def_app_icon;
            }
        } else {
            int identifier2 = com.igexin.push.core.g.i.getResources().getIdentifier(hVar.f(), "drawable", com.igexin.push.core.g.g);
            if (identifier2 != 0) {
                notification.icon = identifier2;
            } else {
                notification.icon = R.drawable.sym_def_app_icon;
            }
        }
        if (!(hVar.h() == null && hVar.g() == null) && hVar.i()) {
            return;
        }
        notification.setLatestEventInfo(com.igexin.push.core.g.i, hVar.a(), hVar.b(), pendingIntentA);
        notificationManager.notify(iCurrentTimeMillis, notification);
    }

    @Override // com.igexin.push.core.a.a.a
    public boolean b(PushTaskBean pushTaskBean, BaseAction baseAction) {
        if (pushTaskBean == null || baseAction == null || !(baseAction instanceof com.igexin.push.core.bean.h)) {
            return true;
        }
        a(pushTaskBean.getTaskId(), pushTaskBean.getMessageId(), (com.igexin.push.core.bean.h) baseAction);
        return true;
    }
}
