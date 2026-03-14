package com.flurry.sdk;

import android.content.Context;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Iterator;
import java.util.List;

/* JADX INFO: loaded from: classes.dex */
public final class em implements eq {
    private static em a;
    private final List<eq> b = b();

    public static synchronized em a() {
        if (a == null) {
            a = new em();
        }
        return a;
    }

    private em() {
    }

    @Override // com.flurry.sdk.eq
    public void a(dj djVar, Context context) {
        Iterator<eq> it = this.b.iterator();
        while (it.hasNext()) {
            it.next().a(djVar, context);
        }
    }

    @Override // com.flurry.sdk.eq
    public void b(dj djVar, Context context) {
        Iterator<eq> it = this.b.iterator();
        while (it.hasNext()) {
            it.next().b(djVar, context);
        }
    }

    @Override // com.flurry.sdk.eq
    public void c(dj djVar, Context context) {
        Iterator<eq> it = this.b.iterator();
        while (it.hasNext()) {
            it.next().c(djVar, context);
        }
    }

    @Override // com.flurry.sdk.eq
    public void a(dj djVar) {
        Iterator<eq> it = this.b.iterator();
        while (it.hasNext()) {
            it.next().a(djVar);
        }
    }

    private static List<eq> b() {
        ArrayList arrayList = new ArrayList();
        arrayList.add(new en("com.flurry.android.impl.analytics.FlurryAnalyticsModule", 10));
        arrayList.add(new en("com.flurry.android.impl.ads.FlurryAdModule", 10));
        return Collections.unmodifiableList(arrayList);
    }
}
