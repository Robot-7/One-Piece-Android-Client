package com.tencent.stat;

import android.content.Context;
import java.io.File;

/* JADX INFO: loaded from: classes.dex */
class ao implements Runnable {
    private Context a;

    public ao(Context context) {
        this.a = null;
        this.a = context;
    }

    @Override // java.lang.Runnable
    public void run() {
        for (File file : StatNativeCrashReport.a(this.a)) {
            com.tencent.stat.a.d dVar = new com.tencent.stat.a.d(this.a, StatServiceImpl.a(this.a, false, (StatSpecifyReportedInfo) null), StatNativeCrashReport.a(file), 3, 10240, new Thread(), null);
            dVar.a(StatNativeCrashReport.b(file));
            new aq(dVar).a();
            file.delete();
            if (StatConfig.isDebugEnable()) {
                StatServiceImpl.q.d("delete tombstone file:" + file.getAbsolutePath().toString());
            }
        }
    }
}
