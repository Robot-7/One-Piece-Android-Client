package com.flurry.sdk;

import android.app.Activity;

/* JADX INFO: loaded from: classes.dex */
public interface du {

    public enum a {
        kCreated,
        kDestroyed,
        kPaused,
        kResumed,
        kStarted,
        kStopped,
        kSaveState
    }

    void a(Activity activity, a aVar);
}
