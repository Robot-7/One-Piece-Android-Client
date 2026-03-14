package com.igexin.push.core.a.a;

import android.content.Intent;
import android.content.pm.PackageInfo;
import android.content.pm.ServiceInfo;
import com.igexin.push.core.bean.BaseAction;
import com.igexin.push.core.bean.PushTaskBean;
import com.igexin.push.core.bean.m;
import com.igexin.sdk.PushConsts;
import com.tencent.stat.common.StatConstants;
import java.util.List;
import org.json.JSONException;
import org.json.JSONObject;

/* JADX INFO: loaded from: classes.dex */
public class k implements a {
    private String a(String str) {
        List<PackageInfo> installedPackages = com.igexin.push.core.g.i.getPackageManager().getInstalledPackages(4);
        if (installedPackages != null) {
            for (PackageInfo packageInfo : installedPackages) {
                if (str.equals(packageInfo.packageName)) {
                    ServiceInfo[] serviceInfoArr = packageInfo.services;
                    for (ServiceInfo serviceInfo : serviceInfoArr) {
                        if (com.igexin.push.core.a.n.equals(serviceInfo.name) || com.igexin.push.core.a.o.equals(serviceInfo.name) || com.igexin.push.core.a.p.equals(serviceInfo.name)) {
                            return serviceInfo.name;
                        }
                    }
                }
            }
        }
        return null;
    }

    @Override // com.igexin.push.core.a.a.a
    public com.igexin.push.core.b a(PushTaskBean pushTaskBean, BaseAction baseAction) {
        return com.igexin.push.core.b.success;
    }

    @Override // com.igexin.push.core.a.a.a
    public BaseAction a(JSONObject jSONObject) {
        try {
            if (com.igexin.push.a.k.v && jSONObject.has("do") && jSONObject.has("actionid") && jSONObject.has("type") && jSONObject.has("pkgname")) {
                m mVar = new m();
                mVar.setType("wakeupsdk");
                mVar.setActionId(jSONObject.getString("actionid"));
                mVar.setDoActionId(jSONObject.getString("do"));
                mVar.a(jSONObject.getString("pkgname"));
                if (!jSONObject.has("is_forcestart")) {
                    return mVar;
                }
                mVar.a(jSONObject.getBoolean("is_forcestart"));
                return mVar;
            }
        } catch (JSONException e) {
        }
        return null;
    }

    @Override // com.igexin.push.core.a.a.a
    public boolean b(PushTaskBean pushTaskBean, BaseAction baseAction) {
        if (pushTaskBean != null && baseAction != null) {
            m mVar = (m) baseAction;
            String strB = mVar.b();
            String strA = a(strB);
            if (strA != null) {
                if (strA.equals(com.igexin.push.core.a.n)) {
                    if (mVar.a()) {
                        Intent intent = new Intent();
                        intent.setClassName(strB, strA);
                        intent.putExtra("action", PushConsts.ACTION_SERVICE_INITIALIZE_SLAVE);
                        intent.putExtra("op_app", com.igexin.push.core.g.g);
                        intent.putExtra("isSlave", true);
                        com.igexin.push.core.g.i.startService(intent);
                    } else {
                        Intent intent2 = new Intent();
                        intent2.setClassName(strB, strA);
                        com.igexin.push.core.g.i.startService(intent2);
                    }
                } else if (strA.equals(com.igexin.push.core.a.o) || strA.equals(com.igexin.push.core.a.p)) {
                    Intent intent3 = new Intent();
                    intent3.setClassName(strB, strA);
                    com.igexin.push.core.g.i.startService(intent3);
                }
            }
            if (!baseAction.getDoActionId().equals(StatConstants.MTA_COOPERATION_TAG)) {
                com.igexin.push.core.a.f.a().a(pushTaskBean.getTaskId(), pushTaskBean.getMessageId(), baseAction.getDoActionId());
            }
        }
        return true;
    }
}
