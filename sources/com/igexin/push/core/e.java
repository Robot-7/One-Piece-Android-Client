package com.igexin.push.core;

import android.content.Intent;
import android.os.Bundle;
import android.os.Handler;
import android.os.Message;
import com.igexin.sdk.PushConsts;

/* JADX INFO: loaded from: classes.dex */
public class e extends Handler {
    private static String a = com.igexin.push.a.j.a;

    @Override // android.os.Handler
    public void handleMessage(Message message) throws Throwable {
        if (message.what != a.c) {
            if (message.what == a.d) {
                com.igexin.push.core.b.c.a().a((Intent) message.obj);
                return;
            }
            if (message.what == a.e) {
                com.igexin.push.core.a.f.a().c((Intent) message.obj);
                return;
            }
            if (message.what == a.f) {
                com.igexin.push.core.a.f.a().c((Intent) message.obj);
                return;
            }
            if (message.what != a.g) {
                if (message.what == a.h) {
                    Bundle bundle = (Bundle) message.obj;
                    com.igexin.push.core.a.f.a().b(bundle.getString("taskid"), bundle.getString("messageid"), bundle.getString("actionid"));
                    return;
                }
                if (message.what == a.i) {
                    com.igexin.push.core.a.f.a().a((com.igexin.push.core.bean.f) message.obj);
                    return;
                } else {
                    if (message.what == a.j) {
                        com.igexin.push.core.a.f.a().u();
                        return;
                    }
                    return;
                }
            }
            return;
        }
        Intent intent = (Intent) message.obj;
        if (intent == null || !intent.hasExtra("action")) {
            return;
        }
        String stringExtra = intent.getStringExtra("action");
        if (stringExtra.equals(PushConsts.ACTION_SERVICE_INITIALIZE)) {
            com.igexin.push.core.a.f.a().a(intent);
            return;
        }
        if (stringExtra.equals(PushConsts.ACTION_SERVICE_INITIALIZE_SLAVE)) {
            com.igexin.push.core.a.f.a().b(intent);
            return;
        }
        if (stringExtra.equals(PushConsts.ACTION_BROADCAST_REFRESHLS)) {
            if (com.igexin.push.a.k.r) {
                com.igexin.push.core.b.c.a().b(intent);
                return;
            }
            return;
        }
        if (stringExtra.equals(PushConsts.ACTION_BROADCAST_PUSHMANAGER)) {
            com.igexin.push.core.a.f.a().a(intent.getBundleExtra("bundle"));
            return;
        }
        if (!stringExtra.equals(PushConsts.ACTION_BROADCAST_USER_PRESENT)) {
            if (stringExtra.equals("com.igexin.sdk.action.extdownloadsuccess")) {
                com.igexin.push.core.a.f.a().d(intent);
                return;
            }
            return;
        }
        g.M = System.currentTimeMillis();
        boolean z = true;
        if (com.igexin.push.core.a.f.a().a(System.currentTimeMillis()) && "1".equals(com.igexin.push.core.a.f.a().g("ccs"))) {
            z = false;
        }
        if (z) {
            com.igexin.push.core.a.f.a().z();
        }
    }
}
