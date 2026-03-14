package com.igexin.sdk.a;

import android.content.Context;
import java.io.File;
import java.io.IOException;

/* JADX INFO: loaded from: classes.dex */
public class d {
    private String a;
    private String b;
    private Context c;

    public d(Context context) {
        if (context == null) {
            return;
        }
        this.c = context;
        context.getFilesDir();
        this.a = "/data/data/" + context.getPackageName() + "/files/run.pid";
        this.b = "/data/data/" + context.getPackageName() + "/files/stop.lock";
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
        File file = this.a != null ? new File(this.a) : null;
        File file2 = this.b != null ? new File(this.b) : null;
        if (file != null && file.exists()) {
            if (file2 != null && file2.exists()) {
                file2.delete();
            }
            return true;
        }
        if (file2 == null || !file2.exists() || !file2.renameTo(new File(this.a))) {
            return false;
        }
        new c(this.c).a();
        return true;
    }
}
