package com.testin.agent.b;

import java.io.UnsupportedEncodingException;
import org.apache.http.HttpResponse;
import org.apache.http.client.HttpClient;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.entity.StringEntity;
import org.apache.http.impl.client.DefaultHttpClient;
import org.apache.http.params.BasicHttpParams;

/* JADX INFO: loaded from: classes.dex */
public class d {
    private HttpClient a;

    public HttpResponse a(String str, String str2, String str3, int i) {
        this.a = a(i);
        return this.a.execute(a(str, str2, str3));
    }

    public HttpClient a(int i) {
        BasicHttpParams basicHttpParams = new BasicHttpParams();
        basicHttpParams.setParameter("http.socket.timeout", Integer.valueOf(i));
        basicHttpParams.setParameter("http.connection.timeout", Integer.valueOf(i));
        return new DefaultHttpClient(basicHttpParams);
    }

    public HttpPost a(String str, String str2) {
        com.testin.agent.base.b.a("HttpHandler", "Send Uri:" + str);
        HttpPost httpPost = new HttpPost(str);
        httpPost.addHeader("Host", "apm-collector.qtestin.com");
        httpPost.addHeader("Accept", "text/plain");
        httpPost.addHeader("Accept-Charset", "utf-8");
        httpPost.addHeader("Accept-Encoding", "indentity");
        httpPost.addHeader("Content-Type", "application/json");
        httpPost.addHeader("Upload-Json", com.testin.agent.f.a.a(str2));
        return httpPost;
    }

    public HttpPost a(String str, String str2, String str3) {
        HttpPost httpPostA = a(str, str3);
        com.testin.agent.base.b.a("HttpHandler", "Send Data:" + str2);
        try {
            httpPostA.setEntity(new StringEntity(str2, "utf-8"));
        } catch (UnsupportedEncodingException e) {
            e.a(e);
        }
        return httpPostA;
    }
}
