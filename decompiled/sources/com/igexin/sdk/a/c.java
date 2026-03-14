package com.igexin.sdk.a;

import android.content.Context;
import java.io.File;
import java.io.IOException;

/* JADX INFO: loaded from: classes.dex */
public class c {
    private String a;

    public c(Context context) {
        if (context == null) {
            return;
        }
        context.getFilesDir();
        this.a = "/data/data/" + context.getPackageName() + "/files/push.pid";
    }

    public void a() {
        if (c() || this.a == null) {
            return;
        }
        try {
            new File(this.a).createNewFile();
        } catch (IOException e) {
        }
    }

    public void b() {
        if (!c() || this.a == null) {
            return;
        }
        new File(this.a).delete();
    }

    public boolean c() {
        if (this.a != null) {
            return new File(this.a).exists();
        }
        return false;
    }
}
