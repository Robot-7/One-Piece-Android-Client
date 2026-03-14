package com.igexin.sdk.a;

import android.content.Context;
import java.io.File;
import java.io.IOException;

/* JADX INFO: loaded from: classes.dex */
public class b {
    private String a;

    public b(Context context) {
        if (context == null) {
            return;
        }
        context.getFilesDir();
        this.a = "/data/data/" + context.getPackageName() + "/files/init.pid";
    }

    public void a() {
        if (b() || this.a == null) {
            return;
        }
        try {
            new File(this.a).createNewFile();
        } catch (IOException e) {
        }
    }

    public boolean b() {
        if (this.a != null) {
            return new File(this.a).exists();
        }
        return false;
    }
}
