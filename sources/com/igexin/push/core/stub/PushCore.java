package com.igexin.push.core.stub;

import android.app.Activity;
import android.content.Context;
import android.content.Intent;
import android.content.res.Configuration;
import android.os.IBinder;
import android.os.Message;
import android.view.KeyEvent;
import android.view.Menu;
import com.igexin.push.core.e.a;
import com.igexin.push.core.e.b;
import com.igexin.push.core.f;
import com.igexin.push.core.o;
import com.igexin.sdk.IPushCore;
import java.util.HashMap;
import java.util.Map;

/* JADX INFO: loaded from: classes.dex */
public class PushCore implements IPushCore {
    private f a;
    private Map b = new HashMap();

    @Override // com.igexin.sdk.IPushCore
    public void onActivityConfigurationChanged(Activity activity, Configuration configuration) {
        a aVar = (a) this.b.get(activity);
        if (aVar != null) {
            aVar.a(configuration);
        }
    }

    @Override // com.igexin.sdk.IPushCore
    public boolean onActivityCreateOptionsMenu(Activity activity, Menu menu) {
        a aVar = (a) this.b.get(activity);
        if (aVar != null) {
            return aVar.a(menu);
        }
        return false;
    }

    @Override // com.igexin.sdk.IPushCore
    public void onActivityDestroy(Activity activity) {
        a aVar = (a) this.b.get(activity);
        if (aVar != null) {
            aVar.h();
            this.b.remove(activity);
            b.a().c(aVar);
        }
    }

    @Override // com.igexin.sdk.IPushCore
    public boolean onActivityKeyDown(Activity activity, int i, KeyEvent keyEvent) {
        a aVar = (a) this.b.get(activity);
        if (aVar != null) {
            return aVar.a(i, keyEvent);
        }
        return false;
    }

    @Override // com.igexin.sdk.IPushCore
    public void onActivityNewIntent(Activity activity, Intent intent) {
        a aVar = (a) this.b.get(activity);
        if (aVar != null) {
            aVar.a(intent);
        }
    }

    @Override // com.igexin.sdk.IPushCore
    public void onActivityPause(Activity activity) {
        a aVar = (a) this.b.get(activity);
        if (aVar != null) {
            aVar.f();
        }
    }

    @Override // com.igexin.sdk.IPushCore
    public void onActivityRestart(Activity activity) {
        a aVar = (a) this.b.get(activity);
        if (aVar != null) {
            aVar.d();
        }
    }

    @Override // com.igexin.sdk.IPushCore
    public void onActivityResume(Activity activity) {
        a aVar = (a) this.b.get(activity);
        if (aVar != null) {
            aVar.e();
        }
    }

    @Override // com.igexin.sdk.IPushCore
    public void onActivityStart(Activity activity, Intent intent) {
        if (activity == null || intent == null || !intent.hasExtra("activityid")) {
            return;
        }
        a aVarA = b.a().a(Long.valueOf(intent.getLongExtra("activityid", 0L)));
        if (aVarA == null) {
            activity.finish();
            return;
        }
        aVarA.a(activity);
        this.b.put(activity, aVarA);
        aVarA.c();
    }

    @Override // com.igexin.sdk.IPushCore
    public void onActivityStop(Activity activity) {
        a aVar = (a) this.b.get(activity);
        if (aVar != null) {
            aVar.g();
        }
    }

    @Override // com.igexin.sdk.IPushCore
    public IBinder onServiceBind(Intent intent) {
        return o.a();
    }

    @Override // com.igexin.sdk.IPushCore
    public void onServiceDestroy() {
        this.a.j();
    }

    @Override // com.igexin.sdk.IPushCore
    public int onServiceStartCommand(Intent intent, int i, int i2) {
        if (this.a == null) {
            return 1;
        }
        Message message = new Message();
        message.what = com.igexin.push.core.a.c;
        message.obj = intent;
        this.a.a(message);
        return 1;
    }

    @Override // com.igexin.sdk.IPushCore
    public boolean start(Context context) {
        this.a = f.a();
        this.a.a(context);
        return true;
    }
}
