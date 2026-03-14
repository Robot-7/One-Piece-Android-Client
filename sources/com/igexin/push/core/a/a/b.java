package com.igexin.push.core.a.a;

import android.content.pm.PackageInfo;
import com.igexin.push.core.bean.BaseAction;
import com.igexin.push.core.bean.PushTaskBean;
import com.tencent.stat.common.StatConstants;
import java.util.Iterator;
import org.json.JSONObject;

/* JADX INFO: loaded from: classes.dex */
public class b implements a {
    @Override // com.igexin.push.core.a.a.a
    public com.igexin.push.core.b a(PushTaskBean pushTaskBean, BaseAction baseAction) {
        return com.igexin.push.core.b.success;
    }

    @Override // com.igexin.push.core.a.a.a
    public BaseAction a(JSONObject jSONObject) {
        try {
            if (jSONObject.has("type") && jSONObject.has("actionid")) {
                com.igexin.push.core.bean.b bVar = new com.igexin.push.core.bean.b();
                bVar.setType("checkapp");
                bVar.setActionId(jSONObject.getString("actionid"));
                if (jSONObject.has("appstartupid")) {
                    JSONObject jSONObject2 = jSONObject.getJSONObject("appstartupid");
                    if (jSONObject2.has("android")) {
                        bVar.a(jSONObject2.getString("android"));
                        if (jSONObject.has("do_installed") || jSONObject.has("do_uninstalled")) {
                            if (jSONObject.has("do_installed")) {
                                bVar.b(jSONObject.getString("do_installed"));
                            }
                            if (!jSONObject.has("do_uninstalled")) {
                                return bVar;
                            }
                            bVar.c(jSONObject.getString("do_uninstalled"));
                            return bVar;
                        }
                    }
                }
            }
        } catch (Exception e) {
        }
        return null;
    }

    public boolean a(String str) {
        Iterator<PackageInfo> it = com.igexin.push.core.g.i.getPackageManager().getInstalledPackages(4096).iterator();
        while (it.hasNext()) {
            if (it.next().packageName.equals(str)) {
                return true;
            }
        }
        return false;
    }

    @Override // com.igexin.push.core.a.a.a
    public boolean b(PushTaskBean pushTaskBean, BaseAction baseAction) {
        com.igexin.push.core.bean.b bVar = (com.igexin.push.core.bean.b) baseAction;
        String taskId = pushTaskBean.getTaskId();
        String messageId = pushTaskBean.getMessageId();
        if (a(bVar.a())) {
            if (bVar.b() == null || bVar.b().equals(StatConstants.MTA_COOPERATION_TAG)) {
                return true;
            }
            com.igexin.push.core.a.f.a().a(taskId, messageId, bVar.b());
            return true;
        }
        if (bVar.c() == null || bVar.c().equals(StatConstants.MTA_COOPERATION_TAG)) {
            return true;
        }
        com.igexin.push.core.a.f.a().a(taskId, messageId, bVar.c());
        return true;
    }
}
