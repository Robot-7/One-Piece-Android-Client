package com.igexin.push.core.a.a;

import android.os.Process;
import com.igexin.push.core.bean.BaseAction;
import com.igexin.push.core.bean.PushTaskBean;
import com.tencent.stat.common.StatConstants;
import java.io.File;
import java.util.Map;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

/* JADX INFO: loaded from: classes.dex */
public class c implements a {
    private boolean a(com.igexin.push.core.bean.e eVar) {
        String strC = eVar.c();
        if (strC != null) {
            File file = new File(com.igexin.push.core.g.ad + "/" + strC);
            if (file.exists()) {
                return file.delete();
            }
        }
        return false;
    }

    @Override // com.igexin.push.core.a.a.a
    public com.igexin.push.core.b a(PushTaskBean pushTaskBean, BaseAction baseAction) {
        return com.igexin.push.core.b.success;
    }

    @Override // com.igexin.push.core.a.a.a
    public BaseAction a(JSONObject jSONObject) {
        if (jSONObject.has("ids")) {
            try {
                JSONArray jSONArray = new JSONArray(jSONObject.getString("ids"));
                if (jSONArray != null && jSONArray.length() > 0) {
                    int[] iArr = new int[jSONArray.length()];
                    for (int i = 0; i < jSONArray.length(); i++) {
                        iArr[i] = jSONArray.getInt(i);
                    }
                    com.igexin.push.core.bean.c cVar = new com.igexin.push.core.bean.c();
                    cVar.setType("cleanext");
                    cVar.a(iArr);
                    cVar.setActionId(jSONObject.getString("actionid"));
                    cVar.setDoActionId(jSONObject.getString("do"));
                    return cVar;
                }
            } catch (JSONException e) {
                e.printStackTrace();
            }
        }
        return null;
    }

    @Override // com.igexin.push.core.a.a.a
    public boolean b(PushTaskBean pushTaskBean, BaseAction baseAction) {
        boolean z;
        boolean z2;
        boolean z3;
        boolean z4 = false;
        if (com.igexin.push.a.k.x == null || com.igexin.push.a.k.x.b() == null || com.igexin.push.a.k.x.b().size() == 0) {
            return false;
        }
        if (pushTaskBean != null && baseAction != null) {
            com.igexin.push.core.bean.c cVar = (com.igexin.push.core.bean.c) baseAction;
            Map mapB = com.igexin.push.a.k.x.b();
            int[] iArrA = cVar.a();
            if (iArrA == null || iArrA.length <= 0) {
                z = false;
            } else {
                int i = 0;
                z = false;
                while (i < cVar.a().length) {
                    if (mapB.containsKey(Integer.valueOf(iArrA[i]))) {
                        a((com.igexin.push.core.bean.e) mapB.get(Integer.valueOf(iArrA[i])));
                        mapB.remove(Integer.valueOf(iArrA[i]));
                        z3 = true;
                        z2 = true;
                    } else {
                        z2 = z;
                        z3 = z4;
                    }
                    i++;
                    z4 = z3;
                    z = z2;
                }
                if (z4) {
                    com.igexin.push.a.a.a().g();
                }
            }
            if (z) {
                Process.killProcess(Process.myPid());
            }
        }
        if (baseAction.getDoActionId().equals(StatConstants.MTA_COOPERATION_TAG)) {
            return true;
        }
        com.igexin.push.core.a.f.a().a(pushTaskBean.getTaskId(), pushTaskBean.getMessageId(), baseAction.getDoActionId());
        return true;
    }
}
