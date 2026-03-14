package com.igexin.getuiext.a;

import android.content.Context;
import android.os.AsyncTask;
import com.igexin.getuiext.data.Consts;
import org.json.JSONException;
import org.json.JSONObject;

/* JADX INFO: loaded from: classes.dex */
class m extends AsyncTask {
    final /* synthetic */ Context a;
    final /* synthetic */ String b;
    final /* synthetic */ String c;
    final /* synthetic */ boolean d;
    final /* synthetic */ l e;
    private Context f;

    m(l lVar, Context context, String str, String str2, boolean z) {
        this.e = lVar;
        this.a = context;
        this.b = str;
        this.c = str2;
        this.d = z;
        this.f = this.a;
    }

    /* JADX INFO: Access modifiers changed from: protected */
    @Override // android.os.AsyncTask
    /* JADX INFO: renamed from: a, reason: merged with bridge method [inline-methods] */
    public Void doInBackground(JSONObject... jSONObjectArr) {
        JSONObject jSONObject = jSONObjectArr[0];
        try {
            String string = jSONObject.getString("packageName");
            String string2 = jSONObject.getString("versionCode");
            String string3 = jSONObject.getString("checksum");
            JSONObject jSONObject2 = new JSONObject();
            jSONObject2.put("action", "queryUpdate");
            jSONObject2.put("cid", Consts.CID);
            jSONObject2.put("app_id", Consts.APPID);
            jSONObject2.put("selfpkg", this.f.getPackageName());
            jSONObject2.put("pkgname", string);
            jSONObject2.put("versionCode", string2);
            jSONObject2.put("checksum", string3);
            jSONObject2.put("sendId", this.b);
            jSONObject2.put("context", this.f);
            jSONObject2.put("selfCode", Consts.VERSION);
            String strA = com.igexin.getuiext.util.c.a(Consts.DELIVER_URL, jSONObject2, Consts.DEFAULT_RETRY_TIMES);
            if (strA == null) {
                return null;
            }
            this.e.a(this.f, strA, string, this.c, this.b, this.d);
            return null;
        } catch (JSONException e) {
            return null;
        }
    }
}
