package com.pipaw.pipawpay;

import android.os.Handler;
import android.os.Looper;
import android.os.Message;
import com.tencent.stat.common.StatConstants;
import java.util.ArrayList;
import org.apache.http.message.BasicNameValuePair;

/* JADX INFO: loaded from: classes.dex */
class f extends Handler {
    final /* synthetic */ PipawService a;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public f(PipawService pipawService, Looper looper) {
        super(looper);
        this.a = pipawService;
    }

    @Override // android.os.Handler
    public void handleMessage(Message message) {
        try {
            String str = (String) message.obj;
            if (!com.pipaw.a.j.a(str)) {
                ArrayList arrayList = new ArrayList();
                arrayList.add(new BasicNameValuePair("exception", str));
                com.pipaw.a.e.a(StatConstants.MTA_COOPERATION_TAG, arrayList);
            }
        } catch (Exception e) {
            com.pipaw.a.d.a(PipawService.a, e);
        }
        super.handleMessage(message);
    }
}
