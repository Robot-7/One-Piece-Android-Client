package com.tencent.mid.b;

import android.content.Context;
import android.provider.Settings;
import com.tencent.mid.util.Util;
import com.tencent.stat.common.StatConstants;

/* JADX INFO: loaded from: classes.dex */
public class e extends f {
    public e(Context context) {
        super(context);
    }

    @Override // com.tencent.mid.b.f
    protected void a(a aVar) {
        synchronized (this) {
            Util.logInfo("write CheckEntity to Settings.System:" + aVar.toString());
            Settings.System.putString(this.a.getContentResolver(), g(), aVar.toString());
        }
    }

    @Override // com.tencent.mid.b.f
    protected void a(String str) {
        synchronized (this) {
            Util.logInfo("write mid to Settings.System");
            Settings.System.putString(this.a.getContentResolver(), k(), str);
        }
    }

    @Override // com.tencent.mid.b.f
    protected boolean a() {
        return Util.checkPermission(this.a, "android.permission.WRITE_SETTINGS");
    }

    @Override // com.tencent.mid.b.f
    protected String b() {
        String string;
        synchronized (this) {
            Util.logInfo("read mid from Settings.System");
            string = Settings.System.getString(this.a.getContentResolver(), k());
        }
        return string;
    }

    @Override // com.tencent.mid.b.f
    protected void c() {
        synchronized (this) {
            Settings.System.putString(this.a.getContentResolver(), k(), StatConstants.MTA_COOPERATION_TAG);
            Settings.System.putString(this.a.getContentResolver(), g(), StatConstants.MTA_COOPERATION_TAG);
        }
    }

    @Override // com.tencent.mid.b.f
    protected a d() {
        a aVar;
        synchronized (this) {
            aVar = new a(Settings.System.getString(this.a.getContentResolver(), g()));
            Util.logInfo("read readCheckEntity from Settings.System:" + aVar.toString());
        }
        return aVar;
    }
}
