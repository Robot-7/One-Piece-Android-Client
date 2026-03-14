package com.igexin.push.core.d;

import android.content.Context;
import android.content.Intent;
import android.os.Process;
import com.igexin.sdk.PushService;
import java.io.File;
import java.io.FileOutputStream;
import java.io.InputStream;
import org.apache.http.HttpResponse;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.impl.client.DefaultHttpClient;

/* JADX INFO: loaded from: classes.dex */
public class f implements Runnable {
    private Context a;
    private com.igexin.push.core.bean.e b;
    private int c = 0;

    public f(Context context, com.igexin.push.core.bean.e eVar) {
        this.a = context;
        this.b = eVar;
    }

    protected boolean a(String str, String str2, String str3) throws Throwable {
        if (str2 == null || str2.length() == 0) {
            return false;
        }
        if (str == null) {
            this.c = 3;
            com.igexin.push.core.a.f.a().f("url is null");
            return false;
        }
        if (!str.startsWith("http://") && !str.startsWith("https://")) {
            this.c = 3;
            com.igexin.push.core.a.f.a().f("httpUrl:" + str + " is not a valid url...");
            return false;
        }
        Process.setThreadPriority(10);
        try {
            HttpResponse httpResponseExecute = new DefaultHttpClient().execute(new HttpGet(str));
            if (httpResponseExecute.getStatusLine().getStatusCode() != 200) {
                this.c++;
                return false;
            }
            InputStream content = httpResponseExecute.getEntity().getContent();
            String str4 = com.igexin.push.core.g.ad + "/" + str2;
            File file = new File(str4);
            FileOutputStream fileOutputStream = new FileOutputStream(file);
            byte[] bArr = new byte[1024];
            while (true) {
                int i = content.read(bArr);
                if (i == -1) {
                    break;
                }
                fileOutputStream.write(bArr, 0, i);
            }
            fileOutputStream.close();
            content.close();
            if (!com.igexin.a.b.a.a(this.a, str4).equals(str3)) {
                if (file.exists()) {
                    file.delete();
                }
                this.c = 4;
                return false;
            }
            File file2 = new File(com.igexin.push.core.g.ad + "/" + this.b.c());
            file.renameTo(file2);
            if (!this.b.g() && this.b.h() == 0) {
                File file3 = new File(com.igexin.push.core.g.ac + "/" + this.b.c());
                if (!file3.exists()) {
                    com.igexin.push.core.a.f.a().a(file2, file3, this.b.f());
                } else if (!com.igexin.a.b.a.a(com.igexin.push.core.g.i, file3.getAbsolutePath()).equals(this.b.f())) {
                    file3.delete();
                    com.igexin.push.core.a.f.a().a(file2, file3, this.b.f());
                }
            }
            return true;
        } catch (IllegalArgumentException e) {
            this.c = 3;
            com.igexin.push.core.a.f.a().f(e.toString());
            return false;
        } catch (Exception e2) {
            this.c++;
            return false;
        }
    }

    @Override // java.lang.Runnable
    public void run() {
        while (!a(this.b.e(), this.b.c() + ".tmp", this.b.f())) {
            if (this.c >= 3) {
                Intent intent = new Intent(this.a, (Class<?>) PushService.class);
                intent.putExtra("action", "com.igexin.sdk.action.extdownloadsuccess");
                intent.putExtra("id", this.b.a());
                intent.putExtra("result", false);
                this.a.startService(intent);
                return;
            }
        }
        Intent intent2 = new Intent(this.a, (Class<?>) PushService.class);
        intent2.putExtra("action", "com.igexin.sdk.action.extdownloadsuccess");
        intent2.putExtra("id", this.b.a());
        intent2.putExtra("result", true);
        this.a.startService(intent2);
    }
}
