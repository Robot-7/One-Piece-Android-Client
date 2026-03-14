package com.tencent.a.a.a.a;

import android.content.Context;
import android.provider.Settings;
import android.util.Log;

/* JADX INFO: loaded from: classes.dex */
public final class e extends f {
    public e(Context context) {
        super(context);
    }

    @Override // com.tencent.a.a.a.a.f
    protected final boolean a() {
        return h.a(this.e, "android.permission.WRITE_SETTINGS");
    }

    @Override // com.tencent.a.a.a.a.f
    protected final String b() {
        String string;
        synchronized (this) {
            Log.i("MID", "read mid from Settings.System");
            string = Settings.System.getString(this.e.getContentResolver(), h.f("4kU71lN96TJUomD1vOU9lgj9Tw=="));
        }
        return string;
    }

    @Override // com.tencent.a.a.a.a.f
    protected final void b(String str) {
        synchronized (this) {
            Log.i("MID", "write mid to Settings.System");
            Settings.System.putString(this.e.getContentResolver(), h.f("4kU71lN96TJUomD1vOU9lgj9Tw=="), str);
        }
    }
}
