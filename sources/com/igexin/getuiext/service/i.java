package com.igexin.getuiext.service;

import android.content.Intent;
import android.os.Handler;
import android.os.Looper;
import android.os.Message;
import com.igexin.getuiext.data.Consts;
import java.util.ArrayList;
import org.json.JSONException;
import org.json.JSONObject;

/* JADX INFO: loaded from: classes.dex */
public class i extends Handler {
    final /* synthetic */ GetuiExtService a;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public i(GetuiExtService getuiExtService, Looper looper) {
        super(looper);
        this.a = getuiExtService;
    }

    private boolean a(String str) {
        String strA;
        String string;
        ArrayList arrayListA = a.a(str);
        if (arrayListA != null && arrayListA.size() > 0) {
            StringBuffer stringBuffer = new StringBuffer();
            int size = arrayListA.size();
            for (int i = 0; i < size; i++) {
                if (i > 0) {
                    stringBuffer.append("\n");
                }
                stringBuffer.append(((com.igexin.getuiext.data.a.b) arrayListA.get(i)).b);
            }
            try {
                JSONObject jSONObject = new JSONObject();
                jSONObject.put("action", "upload_BI");
                jSONObject.put("BIType", str);
                jSONObject.put("cid", Consts.CID);
                jSONObject.put("BIData", new String(com.igexin.getuiext.util.d.a(stringBuffer.toString().getBytes(), 0), "UTF-8"));
                strA = com.igexin.getuiext.util.c.a("http://sdk.open.phone.igexin.com/api.php?format=json&t=1", com.igexin.getuiext.util.g.a(jSONObject.toString().getBytes()), Consts.DEFAULT_RETRY_TIMES);
            } catch (Exception e) {
                strA = null;
            }
            if (strA != null) {
                try {
                    string = new JSONObject(strA).getString("result");
                } catch (JSONException e2) {
                    string = null;
                }
                if (string != null && string.equals("ok")) {
                    return true;
                }
            }
        }
        return false;
    }

    public void a(String str, int i) {
        a.a(str, i);
        if (a(Consts.BITYPE_UPDATE)) {
            a.b(Consts.BITYPE_UPDATE);
        }
        if (a(Consts.BITYPE_RECOMMEND)) {
            a.b(Consts.BITYPE_RECOMMEND);
        }
        if (a(Consts.BITYPE_PROMOTION_TEXT_OR_IMG)) {
            a.b(Consts.BITYPE_PROMOTION_TEXT_OR_IMG);
        }
    }

    @Override // android.os.Handler
    public void handleMessage(Message message) {
        Intent intent;
        if (message.what != 11002 || (intent = (Intent) message.obj) == null) {
            return;
        }
        a(intent.getStringExtra("BIData"), Integer.valueOf(intent.getStringExtra("BIType")).intValue());
    }
}
