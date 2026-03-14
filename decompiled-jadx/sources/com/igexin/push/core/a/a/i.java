package com.igexin.push.core.a.a;

import android.content.Intent;
import android.net.Uri;
import com.igexin.push.core.bean.BaseAction;
import com.igexin.push.core.bean.PushTaskBean;
import com.tencent.stat.common.StatConstants;
import org.json.JSONException;
import org.json.JSONObject;

/* JADX INFO: loaded from: classes.dex */
public class i implements a {
    private static final String a = com.igexin.push.a.j.a;

    private void a(com.igexin.push.core.bean.k kVar, String str) {
        int iIndexOf;
        String strSubstring;
        String strA = kVar.a();
        if (strA == null || (iIndexOf = strA.indexOf(str)) == -1) {
            return;
        }
        String strSubstring2 = StatConstants.MTA_COOPERATION_TAG;
        String strSubstring3 = null;
        int iIndexOf2 = strA.indexOf("&");
        if (iIndexOf2 == -1) {
            strSubstring2 = strA.substring(0, iIndexOf - 1);
            String strSubstring4 = strA.substring(iIndexOf);
            if (strSubstring4.indexOf("=") != -1) {
                strSubstring3 = strSubstring4.substring(strSubstring4.indexOf("=") + 1);
            }
        } else if (strA.charAt(iIndexOf - 1) == '?') {
            strSubstring2 = strA.substring(0, iIndexOf) + strA.substring(iIndexOf2 + 1);
            String strSubstring5 = strA.substring(iIndexOf, iIndexOf2);
            if (strSubstring5.indexOf("=") != -1) {
                strSubstring3 = strSubstring5.substring(strSubstring5.indexOf("=") + 1);
            }
        } else if (strA.charAt(iIndexOf - 1) == '&') {
            String strSubstring6 = strA.substring(0, iIndexOf - 1);
            String strSubstring7 = strA.substring(iIndexOf);
            String strSubstring8 = StatConstants.MTA_COOPERATION_TAG;
            int iIndexOf3 = strSubstring7.indexOf("&");
            if (iIndexOf3 != -1) {
                strSubstring8 = strSubstring7.substring(iIndexOf3);
                String strSubstring9 = strSubstring7.substring(0, iIndexOf3);
                strSubstring = strSubstring9.substring(strSubstring9.indexOf("=") + 1);
            } else {
                strSubstring = strSubstring7.substring(strSubstring7.indexOf("=") + 1);
            }
            String str2 = strSubstring;
            strSubstring2 = strSubstring6 + strSubstring8;
            strSubstring3 = str2;
        }
        kVar.a(strSubstring2);
        kVar.b(strSubstring3);
    }

    @Override // com.igexin.push.core.a.a.a
    public com.igexin.push.core.b a(PushTaskBean pushTaskBean, BaseAction baseAction) {
        return com.igexin.push.core.b.success;
    }

    @Override // com.igexin.push.core.a.a.a
    public BaseAction a(JSONObject jSONObject) {
        try {
            if (jSONObject.has("url") && jSONObject.has("do") && jSONObject.has("actionid")) {
                String string = jSONObject.getString("url");
                if (!string.equals(StatConstants.MTA_COOPERATION_TAG)) {
                    com.igexin.push.core.bean.k kVar = new com.igexin.push.core.bean.k();
                    kVar.setType("startweb");
                    kVar.setActionId(jSONObject.getString("actionid"));
                    kVar.setDoActionId(jSONObject.getString("do"));
                    kVar.a(string);
                    if (jSONObject.has("is_withcid") && jSONObject.getString("is_withcid").equals("true")) {
                        kVar.a(true);
                    }
                    if (!jSONObject.has("is_withnettype") || !jSONObject.getString("is_withnettype").equals("true")) {
                        return kVar;
                    }
                    kVar.b(true);
                    return kVar;
                }
            }
        } catch (JSONException e) {
        }
        return null;
    }

    @Override // com.igexin.push.core.a.a.a
    public boolean b(PushTaskBean pushTaskBean, BaseAction baseAction) {
        com.igexin.push.core.bean.k kVar = (com.igexin.push.core.bean.k) baseAction;
        a(kVar, "targetpkgname");
        Intent intent = new Intent();
        intent.setAction("android.intent.action.VIEW");
        intent.setFlags(268435456);
        intent.setPackage(kVar.b());
        intent.setData(Uri.parse(kVar.c()));
        try {
            com.igexin.push.core.g.i.startActivity(intent);
        } catch (Exception e) {
        }
        if (baseAction.getDoActionId().equals(StatConstants.MTA_COOPERATION_TAG)) {
            return true;
        }
        com.igexin.push.core.a.f.a().a(pushTaskBean.getTaskId(), pushTaskBean.getMessageId(), baseAction.getDoActionId());
        return true;
    }
}
