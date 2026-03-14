package com.igexin.push.core.a;

import com.igexin.push.core.c.u;
import java.util.ArrayList;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

/* JADX INFO: loaded from: classes.dex */
public class o extends b {
    private static final String a = com.igexin.push.a.j.a;

    @Override // com.igexin.push.core.a.b
    public boolean a(Object obj, JSONObject jSONObject) {
        long j;
        try {
            if (!jSONObject.has("action") || !jSONObject.getString("action").equals("redirect_server")) {
                return true;
            }
            String string = jSONObject.getString("delay");
            ArrayList arrayList = new ArrayList();
            JSONArray jSONArray = jSONObject.getJSONArray("address_list");
            com.igexin.a.a.c.a.a("redirect|" + string + "|" + jSONArray.toString());
            for (int i = 0; i < jSONArray.length(); i++) {
                String string2 = jSONArray.getString(i);
                int iIndexOf = string2.indexOf(44);
                if (iIndexOf > 0) {
                    String strSubstring = string2.substring(0, iIndexOf);
                    String strSubstring2 = string2.substring(iIndexOf + 1);
                    long jCurrentTimeMillis = System.currentTimeMillis();
                    if (strSubstring2 != null) {
                        try {
                            long j2 = Long.parseLong(strSubstring2);
                            u uVar = new u();
                            uVar.a = "socket://" + strSubstring;
                            uVar.b = (j2 * 1000) + jCurrentTimeMillis;
                            arrayList.add(uVar);
                        } catch (NumberFormatException e) {
                        }
                    }
                }
            }
            try {
                j = Long.parseLong(string) * 1000;
            } catch (NumberFormatException e2) {
                j = 0;
            }
            if (j >= 0) {
                com.igexin.push.core.g.F = j;
            }
            com.igexin.push.core.c.r.a(arrayList);
            com.igexin.push.core.f.a().g().e();
            return true;
        } catch (JSONException e3) {
            return true;
        }
    }
}
