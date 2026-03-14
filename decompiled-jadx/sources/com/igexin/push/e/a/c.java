package com.igexin.push.e.a;

import android.os.Process;
import com.igexin.a.a.d.d;
import java.io.ByteArrayInputStream;
import java.net.URI;
import org.apache.http.HttpResponse;
import org.apache.http.client.HttpClient;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.client.methods.HttpRequestBase;
import org.apache.http.entity.InputStreamEntity;
import org.apache.http.impl.client.DefaultHttpClient;
import org.apache.http.util.EntityUtils;

/* JADX INFO: loaded from: classes.dex */
public class c extends d {
    public b a;
    public HttpRequestBase b;
    public HttpClient c;

    public c(b bVar) {
        super(0);
        this.a = bVar;
    }

    @Override // com.igexin.a.a.d.d
    public final void a_() throws Exception {
        HttpResponse httpResponseExecute;
        super.a_();
        Process.setThreadPriority(10);
        if (this.a == null || this.a.e == null) {
            return;
        }
        this.c = new DefaultHttpClient();
        if (this.a.f == null && this.a.g == null) {
            HttpGet httpGet = new HttpGet(URI.create(this.a.e));
            this.b = httpGet;
            httpResponseExecute = this.c.execute(httpGet);
        } else {
            HttpPost httpPost = new HttpPost(URI.create(this.a.e));
            this.b = httpPost;
            if (this.a.g != null) {
                httpPost.setEntity(new InputStreamEntity(this.a.g, this.a.h));
            } else {
                httpPost.setEntity(new InputStreamEntity(new ByteArrayInputStream(this.a.f), this.a.f.length));
            }
            httpResponseExecute = this.c.execute(httpPost);
        }
        if (httpResponseExecute.getStatusLine().getStatusCode() != 200) {
            throw new Exception("Http response code is : " + httpResponseExecute.getStatusLine().getStatusCode() + " try times = 1");
        }
        this.a.a(EntityUtils.toByteArray(httpResponseExecute.getEntity()));
        com.igexin.a.a.b.d.c().a(this.a);
        com.igexin.a.a.b.d.c().d();
    }

    @Override // com.igexin.a.a.d.a.f
    public final int b() {
        return -2147483638;
    }

    @Override // com.igexin.a.a.d.d
    public void d() {
        this.z = true;
    }

    @Override // com.igexin.a.a.d.d
    protected void e() {
    }

    @Override // com.igexin.a.a.d.d
    public void f() {
        super.f();
        if (this.b != null) {
            this.b.abort();
        }
        this.c = null;
    }
}
