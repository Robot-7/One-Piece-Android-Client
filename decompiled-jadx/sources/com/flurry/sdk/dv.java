package com.flurry.sdk;

import android.annotation.TargetApi;
import android.app.Activity;
import android.app.Application;
import android.os.Build;
import android.os.Bundle;
import com.flurry.sdk.du;
import java.util.Iterator;
import java.util.List;

/* JADX INFO: loaded from: classes.dex */
public class dv {
    private static dv b;
    private final dt<du> a = new dt<>();

    public static synchronized dv a() {
        if (b == null) {
            b = new dv();
        }
        return b;
    }

    public boolean b() {
        return Build.VERSION.SDK_INT >= 14;
    }

    @TargetApi(14)
    private dv() {
        if (Build.VERSION.SDK_INT >= 14) {
            ((Application) Cdo.a().b()).registerActivityLifecycleCallbacks(new Application.ActivityLifecycleCallbacks() { // from class: com.flurry.sdk.dv.1
                @Override // android.app.Application.ActivityLifecycleCallbacks
                public void onActivityCreated(Activity activity, Bundle bundle) {
                    a(activity, du.a.kCreated);
                }

                @Override // android.app.Application.ActivityLifecycleCallbacks
                public void onActivityStarted(Activity activity) {
                    a(activity, du.a.kStarted);
                }

                @Override // android.app.Application.ActivityLifecycleCallbacks
                public void onActivityResumed(Activity activity) {
                    a(activity, du.a.kResumed);
                }

                @Override // android.app.Application.ActivityLifecycleCallbacks
                public void onActivityPaused(Activity activity) {
                    a(activity, du.a.kPaused);
                }

                @Override // android.app.Application.ActivityLifecycleCallbacks
                public void onActivityStopped(Activity activity) {
                    a(activity, du.a.kStopped);
                }

                @Override // android.app.Application.ActivityLifecycleCallbacks
                public void onActivitySaveInstanceState(Activity activity, Bundle bundle) {
                    a(activity, du.a.kSaveState);
                }

                @Override // android.app.Application.ActivityLifecycleCallbacks
                public void onActivityDestroyed(Activity activity) {
                    a(activity, du.a.kDestroyed);
                }

                protected void a(Activity activity, du.a aVar) {
                    Iterator it = dv.this.c().iterator();
                    while (it.hasNext()) {
                        ((du) it.next()).a(activity, aVar);
                    }
                }
            });
        }
    }

    public synchronized void a(du duVar) {
        this.a.a(duVar);
    }

    /* JADX INFO: Access modifiers changed from: private */
    public synchronized List<du> c() {
        return this.a.a();
    }
}
