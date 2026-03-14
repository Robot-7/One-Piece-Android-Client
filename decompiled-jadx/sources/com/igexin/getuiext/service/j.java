package com.igexin.getuiext.service;

import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.Intent;

/* JADX INFO: loaded from: classes.dex */
class j extends BroadcastReceiver {
    final /* synthetic */ GetuiExtService a;

    j(GetuiExtService getuiExtService) {
        this.a = getuiExtService;
    }

    @Override // android.content.BroadcastReceiver
    public void onReceive(Context context, Intent intent) {
        if (intent.getAction().equals("android.intent.action.PACKAGE_ADDED")) {
            String strSubstring = intent.getDataString().substring(8);
            com.igexin.getuiext.data.a.d dVarB = c.a().b(strSubstring);
            if (dVarB == null) {
                if (context.getPackageName().equals(strSubstring)) {
                    a.a(context, dVarB, 5);
                }
            } else {
                if (dVarB instanceof com.igexin.getuiext.ui.promotion.f) {
                    a.a(context, dVarB, 4);
                } else if (dVarB instanceof com.igexin.getuiext.data.a.e) {
                    a.a(context, dVarB, 5);
                }
                c.a().c(strSubstring);
            }
        }
    }
}
