package com.igexin.push.core.d;

import com.igexin.push.core.bean.PushTaskBean;
import java.util.Timer;
import org.json.JSONException;
import org.json.JSONObject;

/* JADX INFO: loaded from: classes.dex */
public class b extends com.igexin.push.e.a.b {
    private String a;
    private String b;
    private com.igexin.push.c.c.a c;
    private PushTaskBean d;

    public b(String str, com.igexin.push.c.c.a aVar, PushTaskBean pushTaskBean) {
        super(str);
        this.b = str;
        this.a = pushTaskBean.getMessageId();
        this.c = aVar;
        this.d = pushTaskBean;
    }

    protected void a(PushTaskBean pushTaskBean, com.igexin.push.c.c.a aVar) {
        com.igexin.push.c.c.c cVar = new com.igexin.push.c.c.c();
        cVar.a();
        cVar.c = "RTV" + pushTaskBean.getMessageId() + "@" + pushTaskBean.getTaskId();
        cVar.d = com.igexin.push.core.g.u;
        cVar.a = (int) System.currentTimeMillis();
        com.igexin.push.core.f.a().e().a("C-" + com.igexin.push.core.g.u, cVar);
        com.igexin.a.a.c.a.a("cdnRetrieve|" + pushTaskBean.getMessageId() + "|" + pushTaskBean.getTaskId());
        if (aVar.c() < 2) {
            long jK = com.igexin.push.core.a.f.a().k();
            Timer timer = new Timer();
            timer.schedule(new d(this, pushTaskBean, aVar), jK);
            com.igexin.push.core.g.an.put(pushTaskBean.getTaskId(), timer);
        }
    }

    @Override // com.igexin.push.e.a.b
    public void a(Exception exc) {
        if (this.c.a() >= 2) {
            a(this.d, this.c);
        } else {
            new Timer().schedule(new c(this), com.igexin.push.core.a.f.a().k());
        }
    }

    @Override // com.igexin.push.e.a.b
    public void a(byte[] bArr) throws Exception {
        if (bArr != null) {
            byte[] bArrB = com.igexin.a.a.b.g.b(com.igexin.a.a.a.a.a(bArr, com.igexin.push.core.g.e));
            if (bArrB == null) {
                throw new Exception("Get error CDNData, can not UnGzip it...");
            }
            JSONObject jSONObject = new JSONObject(new String(bArrB, "utf-8"));
            jSONObject.put("id", this.a);
            jSONObject.put("messageid", this.a);
            jSONObject.put("cdnType", true);
            try {
                if ("pushmessage".equals(jSONObject.getString("action"))) {
                    com.igexin.push.core.a.f.a().a(jSONObject, jSONObject.has("extraData") ? jSONObject.getString("extraData").getBytes() : null, true);
                }
            } catch (JSONException e) {
                e.printStackTrace();
            }
        }
    }

    @Override // com.igexin.a.a.d.a.f
    public int b() {
        return 0;
    }
}
