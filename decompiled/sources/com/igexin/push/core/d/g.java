package com.igexin.push.core.d;

import android.content.ContentValues;
import com.igexin.getuiext.data.Consts;
import org.json.JSONObject;

/* JADX INFO: loaded from: classes.dex */
public class g extends com.igexin.push.e.a.b {
    private boolean a;

    public g(String str, byte[] bArr, int i, boolean z) {
        super(str);
        this.a = false;
        this.a = z;
        a(bArr, i);
    }

    private void a(byte[] bArr, int i) {
        JSONObject jSONObject = new JSONObject();
        try {
            jSONObject.put("action", "upload_BI");
            jSONObject.put("BIType", String.valueOf(i));
            jSONObject.put("cid", com.igexin.push.core.g.u);
            jSONObject.put("BIData", new String(com.igexin.a.a.b.g.e(bArr, 0), "UTF-8"));
            b(com.igexin.a.b.a.b(jSONObject.toString().getBytes()));
        } catch (Exception e) {
        }
    }

    @Override // com.igexin.push.e.a.b
    public void a(byte[] bArr) {
        JSONObject jSONObject = new JSONObject(new String(bArr));
        if (this.a && jSONObject.has("result") && jSONObject.getString("result").equals("ok")) {
            ContentValues contentValues = new ContentValues();
            contentValues.put("type", "0");
            com.igexin.push.core.f.a().i().a("bi", contentValues, new String[]{"type"}, new String[]{Consts.BITYPE_UPDATE});
            com.igexin.push.core.c.f.a().c(System.currentTimeMillis());
        }
    }

    @Override // com.igexin.a.a.d.a.f
    public int b() {
        return 0;
    }
}
