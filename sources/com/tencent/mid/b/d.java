package com.tencent.mid.b;

import android.content.Context;
import android.content.SharedPreferences;
import android.preference.PreferenceManager;
import com.tencent.mid.util.Util;
import com.tencent.stat.common.StatConstants;

/* JADX INFO: loaded from: classes.dex */
public class d extends f {
    public d(Context context) {
        super(context);
    }

    @Override // com.tencent.mid.b.f
    protected void a(a aVar) {
        synchronized (this) {
            Util.logInfo("write CheckEntity to sharedPreferences:" + aVar.toString());
            SharedPreferences.Editor editorEdit = PreferenceManager.getDefaultSharedPreferences(this.a).edit();
            editorEdit.putString(g(), aVar.toString());
            editorEdit.commit();
        }
    }

    @Override // com.tencent.mid.b.f
    protected void a(String str) {
        synchronized (this) {
            Util.logInfo("write mid to sharedPreferences");
            SharedPreferences.Editor editorEdit = PreferenceManager.getDefaultSharedPreferences(this.a).edit();
            editorEdit.putString(k(), str);
            editorEdit.commit();
        }
    }

    @Override // com.tencent.mid.b.f
    protected boolean a() {
        return true;
    }

    @Override // com.tencent.mid.b.f
    protected String b() {
        String string;
        synchronized (this) {
            Util.logInfo("read mid from sharedPreferences");
            string = PreferenceManager.getDefaultSharedPreferences(this.a).getString(k(), null);
        }
        return string;
    }

    @Override // com.tencent.mid.b.f
    protected void c() {
        synchronized (this) {
            SharedPreferences.Editor editorEdit = PreferenceManager.getDefaultSharedPreferences(this.a).edit();
            editorEdit.putString(k(), StatConstants.MTA_COOPERATION_TAG);
            editorEdit.putString(g(), StatConstants.MTA_COOPERATION_TAG);
            editorEdit.commit();
        }
    }

    @Override // com.tencent.mid.b.f
    protected a d() {
        a aVar;
        synchronized (this) {
            aVar = new a(PreferenceManager.getDefaultSharedPreferences(this.a).getString(g(), null));
            Util.logInfo("read CheckEntity from sharedPreferences:" + aVar.toString());
        }
        return aVar;
    }
}
