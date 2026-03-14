package com.testin.agent.nativecrash;

import android.text.TextUtils;
import com.testin.agent.b.e;
import java.io.File;

/* JADX INFO: loaded from: classes.dex */
public class NativeCrash {
    private boolean tag = false;

    public boolean initNativeCrash(String str) {
        return registNativeCrash(str);
    }

    public void notifyNativeCrashed(String str) {
        try {
            if (TextUtils.isEmpty(str)) {
                com.testin.agent.base.b.a("dumpfile path is null or 0-length");
                return;
            }
            if (!new File(str).exists()) {
                com.testin.agent.base.b.a("dump file not exists");
                return;
            }
            new Thread(new a(this, str)).start();
            while (!this.tag) {
                try {
                    Thread.sleep(1L);
                } catch (Exception e) {
                    e.a(e);
                }
            }
        } catch (Exception e2) {
            e.a(e2);
        }
    }

    public native boolean registNativeCrash(String str);
}
