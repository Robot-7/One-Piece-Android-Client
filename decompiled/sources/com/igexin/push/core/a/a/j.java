package com.igexin.push.core.a.a;

import android.content.Intent;
import android.content.pm.PackageManager;
import com.igexin.push.core.bean.BaseAction;
import com.igexin.push.core.bean.PushTaskBean;
import com.tencent.stat.common.StatConstants;
import org.json.JSONException;
import org.json.JSONObject;

/* JADX INFO: loaded from: classes.dex */
public class j implements a {
    private static final String a = com.igexin.push.a.j.a;

    @Override // com.igexin.push.core.a.a.a
    public com.igexin.push.core.b a(PushTaskBean pushTaskBean, BaseAction baseAction) {
        return com.igexin.push.core.b.success;
    }

    @Override // com.igexin.push.core.a.a.a
    public BaseAction a(JSONObject jSONObject) {
        try {
            com.igexin.push.core.bean.j jVar = new com.igexin.push.core.bean.j();
            jVar.setType("startapp");
            jVar.setActionId(jSONObject.getString("actionid"));
            jVar.setDoActionId(jSONObject.getString("do"));
            if (jSONObject.has("appstartupid")) {
                jVar.a(jSONObject.getJSONObject("appstartupid").getString("android"));
            }
            if (jSONObject.has("is_autostart")) {
                jVar.d(jSONObject.getString("is_autostart"));
            }
            if (jSONObject.has("appid")) {
                jVar.b(jSONObject.getString("appid"));
            }
            if (!jSONObject.has("noinstall_action")) {
                return jVar;
            }
            jVar.c(jSONObject.getString("noinstall_action"));
            return jVar;
        } catch (JSONException e) {
            return null;
        }
    }

    @Override // com.igexin.push.core.a.a.a
    public boolean b(PushTaskBean pushTaskBean, BaseAction baseAction) {
        boolean z;
        boolean z2 = false;
        if (pushTaskBean != null && baseAction != null) {
            com.igexin.push.core.bean.j jVar = (com.igexin.push.core.bean.j) baseAction;
            PackageManager packageManager = com.igexin.push.core.g.i.getPackageManager();
            String strB = jVar.b();
            if (strB.equals(StatConstants.MTA_COOPERATION_TAG)) {
                strB = com.igexin.push.core.g.c;
                z = true;
            } else {
                z = com.igexin.push.core.g.c.equals(jVar.b());
            }
            try {
                if (z) {
                    com.igexin.push.core.a.f.a().b(pushTaskBean.getTaskId(), pushTaskBean.getMessageId(), strB, null);
                    if (((com.igexin.push.core.bean.j) baseAction).d().equals("true")) {
                        Intent launchIntentForPackage = packageManager.getLaunchIntentForPackage(com.igexin.push.core.g.g);
                        if (launchIntentForPackage == null) {
                            return false;
                        }
                        com.igexin.push.core.g.i.startActivity(launchIntentForPackage);
                    }
                    if (jVar.getDoActionId() != null) {
                        com.igexin.push.core.a.f.a().a(pushTaskBean.getTaskId(), pushTaskBean.getMessageId(), jVar.getDoActionId());
                    }
                } else {
                    com.igexin.push.core.a.f.a().b(pushTaskBean.getTaskId(), pushTaskBean.getMessageId(), strB, null);
                    if (!jVar.d().equals("true")) {
                        z2 = true;
                    } else if (com.igexin.push.core.a.f.a().d(jVar.a())) {
                        Intent launchIntentForPackage2 = packageManager.getLaunchIntentForPackage(((com.igexin.push.core.bean.j) baseAction).a());
                        if (launchIntentForPackage2 == null) {
                            return false;
                        }
                        com.igexin.push.core.g.i.startActivity(launchIntentForPackage2);
                        z2 = true;
                    }
                    if (z2) {
                        if (jVar.getDoActionId() != null) {
                            com.igexin.push.core.a.f.a().a(pushTaskBean.getTaskId(), pushTaskBean.getMessageId(), jVar.getDoActionId());
                        }
                    } else if (jVar.c() != null) {
                        com.igexin.push.core.a.f.a().a(pushTaskBean.getTaskId(), pushTaskBean.getMessageId(), jVar.c());
                    }
                }
            } catch (Exception e) {
            }
        }
        return true;
    }
}
