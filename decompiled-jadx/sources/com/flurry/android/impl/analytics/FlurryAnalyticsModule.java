package com.flurry.android.impl.analytics;

import android.content.Context;
import com.flurry.sdk.dd;
import com.flurry.sdk.dj;
import com.flurry.sdk.eq;

/* JADX INFO: loaded from: classes.dex */
public class FlurryAnalyticsModule implements eq {
    private static FlurryAnalyticsModule a;
    private dd b;

    public static synchronized FlurryAnalyticsModule getInstance() {
        if (a == null) {
            a = new FlurryAnalyticsModule();
        }
        return a;
    }

    private FlurryAnalyticsModule() {
    }

    @Override // com.flurry.sdk.eq
    public void a(dj djVar, Context context) {
        if (this.b == null) {
            this.b = new dd();
        }
    }

    @Override // com.flurry.sdk.eq
    public void b(dj djVar, Context context) {
    }

    @Override // com.flurry.sdk.eq
    public void c(dj djVar, Context context) {
    }

    @Override // com.flurry.sdk.eq
    public void a(dj djVar) {
    }

    public dd a() {
        return this.b;
    }
}
