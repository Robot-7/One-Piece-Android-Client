package com.flurry.sdk;

import android.content.Context;

/* JADX INFO: loaded from: classes.dex */
public class ep implements eq {
    private final eq a;

    public ep(eq eqVar) {
        this.a = eqVar;
    }

    @Override // com.flurry.sdk.eq
    public void a(dj djVar, Context context) {
        if (this.a != null) {
            this.a.a(djVar, context);
        }
    }

    @Override // com.flurry.sdk.eq
    public void b(dj djVar, Context context) {
        if (this.a != null) {
            this.a.b(djVar, context);
        }
    }

    @Override // com.flurry.sdk.eq
    public void c(dj djVar, Context context) {
        if (this.a != null) {
            this.a.c(djVar, context);
        }
    }

    @Override // com.flurry.sdk.eq
    public void a(dj djVar) {
        if (this.a != null) {
            this.a.a(djVar);
        }
    }
}
