package com.igexin.getuiext.service;

import android.content.Intent;
import android.os.Handler;
import android.os.Looper;
import android.os.Message;
import com.igexin.getuiext.data.Consts;

/* JADX INFO: loaded from: classes.dex */
final class h extends Handler {
    final /* synthetic */ GetuiExtService a;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public h(GetuiExtService getuiExtService, Looper looper) {
        super(looper);
        this.a = getuiExtService;
    }

    private void a(int i, Intent intent) {
        com.igexin.getuiext.data.a.d dVarB;
        switch (i) {
            case Consts.SERVICE_ONRECEIVE /* 11001 */:
                a(intent);
                break;
            case Consts.INSTALL_APP /* 11003 */:
                String stringExtra = intent.getStringExtra("pkgName");
                if (stringExtra != null && (dVarB = c.a().b(stringExtra)) != null) {
                    if (dVarB instanceof com.igexin.getuiext.ui.promotion.f) {
                        a.a(this.a.c, dVarB, 5);
                    } else if (dVarB instanceof com.igexin.getuiext.data.a.e) {
                        a.a(this.a.c, dVarB, 6);
                    }
                    break;
                }
                break;
        }
    }

    private void a(Intent intent) {
        com.igexin.getuiext.a.a aVarA;
        if (intent == null || (aVarA = com.igexin.getuiext.a.b.a(intent.getStringExtra("action"))) == null) {
            return;
        }
        aVarA.a(this.a.c, intent);
    }

    @Override // android.os.Handler
    public void handleMessage(Message message) {
        int intExtra;
        Intent intent = (Intent) message.obj;
        if (intent == null || (intExtra = intent.getIntExtra("what", -1)) == -1) {
            return;
        }
        a(intExtra, intent);
    }
}
