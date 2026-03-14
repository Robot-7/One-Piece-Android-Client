package com.tencent.wxop.stat;

import android.content.Context;
import com.tencent.mid.api.MidEntity;
import java.io.ByteArrayOutputStream;
import java.io.DataInputStream;
import java.io.InputStream;
import java.nio.ByteBuffer;
import java.util.Arrays;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import java.util.zip.GZIPOutputStream;
import org.apache.http.Header;
import org.apache.http.HttpEntity;
import org.apache.http.HttpHost;
import org.apache.http.HttpResponse;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.entity.ByteArrayEntity;
import org.apache.http.impl.client.DefaultHttpClient;
import org.apache.http.params.BasicHttpParams;
import org.apache.http.params.HttpConnectionParams;
import org.apache.http.util.EntityUtils;
import org.json.JSONObject;

/* JADX INFO: loaded from: classes.dex */
class al {
    private static com.tencent.wxop.stat.b.b cx = com.tencent.wxop.stat.b.l.av();
    private static al dj = null;
    private static Context dk = null;
    private long cv;
    DefaultHttpClient dg;
    com.tencent.wxop.stat.b.f dh;
    StringBuilder di = new StringBuilder(4096);

    private al(Context context) {
        this.dg = null;
        this.dh = null;
        this.cv = 0L;
        try {
            dk = context.getApplicationContext();
            this.cv = System.currentTimeMillis() / 1000;
            this.dh = new com.tencent.wxop.stat.b.f();
            if (c.k()) {
                try {
                    Logger.getLogger("org.apache.http.wire").setLevel(Level.FINER);
                    Logger.getLogger("org.apache.http.headers").setLevel(Level.FINER);
                    System.setProperty("org.apache.commons.logging.Log", "org.apache.commons.logging.impl.SimpleLog");
                    System.setProperty("org.apache.commons.logging.simplelog.showdatetime", "true");
                    System.setProperty("org.apache.commons.logging.simplelog.log.httpclient.wire", "debug");
                    System.setProperty("org.apache.commons.logging.simplelog.log.org.apache.http", "debug");
                    System.setProperty("org.apache.commons.logging.simplelog.log.org.apache.http.headers", "debug");
                } catch (Throwable th) {
                }
            }
            BasicHttpParams basicHttpParams = new BasicHttpParams();
            HttpConnectionParams.setStaleCheckingEnabled(basicHttpParams, false);
            HttpConnectionParams.setConnectionTimeout(basicHttpParams, 10000);
            HttpConnectionParams.setSoTimeout(basicHttpParams, 10000);
            this.dg = new DefaultHttpClient(basicHttpParams);
            this.dg.setKeepAliveStrategy(new am(this));
        } catch (Throwable th2) {
            cx.b(th2);
        }
    }

    static Context aB() {
        return dk;
    }

    static al aa(Context context) {
        if (dj == null) {
            synchronized (al.class) {
                if (dj == null) {
                    dj = new al(context);
                }
            }
        }
        return dj;
    }

    static void j(Context context) {
        dk = context.getApplicationContext();
    }

    final void a(com.tencent.wxop.stat.a.d dVar, ak akVar) {
        b(Arrays.asList(dVar.af()), akVar);
    }

    final void a(List<?> list, ak akVar) {
        ByteArrayOutputStream byteArrayOutputStream;
        HttpResponse httpResponseExecute;
        HttpEntity entity;
        int statusCode;
        long contentLength;
        if (list == null || list.isEmpty()) {
            return;
        }
        int size = list.size();
        list.get(0);
        try {
            this.di.delete(0, this.di.length());
            this.di.append("[");
            for (int i = 0; i < size; i++) {
                this.di.append(list.get(i).toString());
                if (i != size - 1) {
                    this.di.append(",");
                }
            }
            this.di.append("]");
            String string = this.di.toString();
            int length = string.length();
            String str = c.y() + "/?index=" + this.cv;
            this.cv++;
            if (c.k()) {
                cx.b("[" + str + "]Send request(" + length + "bytes), content:" + string);
            }
            HttpPost httpPost = new HttpPost(str);
            httpPost.addHeader("Accept-Encoding", "gzip");
            httpPost.setHeader("Connection", "Keep-Alive");
            httpPost.removeHeaders("Cache-Control");
            HttpHost httpHostV = h.r(dk).V();
            httpPost.addHeader("Content-Encoding", "rc4");
            if (httpHostV == null) {
                this.dg.getParams().removeParameter("http.route.default-proxy");
            } else {
                if (c.k()) {
                    cx.e("proxy:" + httpHostV.toHostString());
                }
                httpPost.addHeader("X-Content-Encoding", "rc4");
                this.dg.getParams().setParameter("http.route.default-proxy", httpHostV);
                httpPost.addHeader("X-Online-Host", c.al);
                httpPost.addHeader("Accept", "*/*");
                httpPost.addHeader("Content-Type", "json");
            }
            byteArrayOutputStream = new ByteArrayOutputStream(length);
            byte[] bytes = string.getBytes("UTF-8");
            int length2 = bytes.length;
            if (length > c.aA) {
                httpPost.removeHeaders("Content-Encoding");
                String str2 = "rc4,gzip";
                httpPost.addHeader("Content-Encoding", str2);
                if (httpHostV != null) {
                    httpPost.removeHeaders("X-Content-Encoding");
                    httpPost.addHeader("X-Content-Encoding", str2);
                }
                byteArrayOutputStream.write(new byte[4]);
                GZIPOutputStream gZIPOutputStream = new GZIPOutputStream(byteArrayOutputStream);
                gZIPOutputStream.write(bytes);
                gZIPOutputStream.close();
                bytes = byteArrayOutputStream.toByteArray();
                ByteBuffer.wrap(bytes, 0, 4).putInt(length2);
                if (c.k()) {
                    cx.e("before Gzip:" + length2 + " bytes, after Gzip:" + bytes.length + " bytes");
                }
            }
            httpPost.setEntity(new ByteArrayEntity(com.tencent.wxop.stat.b.g.b(bytes)));
            httpResponseExecute = this.dg.execute(httpPost);
            entity = httpResponseExecute.getEntity();
            statusCode = httpResponseExecute.getStatusLine().getStatusCode();
            contentLength = entity.getContentLength();
            if (c.k()) {
                cx.b("http recv response status code:" + statusCode + ", content length:" + contentLength);
            }
        } catch (Throwable th) {
            th = th;
        }
        if (contentLength <= 0) {
            if (statusCode != 200) {
                cx.error("Server response no error.");
                if (akVar != null) {
                    akVar.B();
                }
            } else if (akVar != null) {
                akVar.ah();
            }
            EntityUtils.toString(entity);
            return;
        }
        if (contentLength > 0) {
            InputStream content = entity.getContent();
            DataInputStream dataInputStream = new DataInputStream(content);
            byte[] bArrC = new byte[(int) entity.getContentLength()];
            dataInputStream.readFully(bArrC);
            content.close();
            dataInputStream.close();
            Header firstHeader = httpResponseExecute.getFirstHeader("Content-Encoding");
            if (firstHeader != null) {
                if (firstHeader.getValue().equalsIgnoreCase("gzip,rc4")) {
                    bArrC = com.tencent.wxop.stat.b.g.c(com.tencent.wxop.stat.b.l.b(bArrC));
                } else if (firstHeader.getValue().equalsIgnoreCase("rc4,gzip")) {
                    bArrC = com.tencent.wxop.stat.b.l.b(com.tencent.wxop.stat.b.g.c(bArrC));
                } else if (firstHeader.getValue().equalsIgnoreCase("gzip")) {
                    bArrC = com.tencent.wxop.stat.b.l.b(bArrC);
                } else if (firstHeader.getValue().equalsIgnoreCase("rc4")) {
                    bArrC = com.tencent.wxop.stat.b.g.c(bArrC);
                }
            }
            String str3 = new String(bArrC, "UTF-8");
            if (c.k()) {
                cx.b("http get response data:" + str3);
            }
            JSONObject jSONObject = new JSONObject(str3);
            if (statusCode == 200) {
                try {
                    String strOptString = jSONObject.optString(MidEntity.TAG_MID);
                    if (com.tencent.a.a.a.a.h.e(strOptString)) {
                        if (c.k()) {
                            cx.b("update mid:" + strOptString);
                        }
                        com.tencent.a.a.a.a.g.a(dk).b(strOptString);
                    }
                    if (!jSONObject.isNull("cfg")) {
                        c.a(dk, jSONObject.getJSONObject("cfg"));
                    }
                    if (!jSONObject.isNull("ncts")) {
                        int i2 = jSONObject.getInt("ncts");
                        int iCurrentTimeMillis = (int) (((long) i2) - (System.currentTimeMillis() / 1000));
                        if (c.k()) {
                            cx.b("server time:" + i2 + ", diff time:" + iCurrentTimeMillis);
                        }
                        com.tencent.wxop.stat.b.l.Q(dk);
                        com.tencent.wxop.stat.b.l.a(dk, iCurrentTimeMillis);
                    }
                } catch (Throwable th2) {
                    cx.c(th2);
                }
                if (akVar != null) {
                    if (jSONObject.optInt("ret") == 0) {
                        akVar.ah();
                    } else {
                        cx.error("response error data.");
                        akVar.B();
                    }
                }
            } else {
                cx.error("Server response error code:" + statusCode + ", error:" + new String(bArrC, "UTF-8"));
                if (akVar != null) {
                    akVar.B();
                }
            }
            content.close();
        } else {
            EntityUtils.toString(entity);
        }
        byteArrayOutputStream.close();
        th = null;
        if (th != null) {
            cx.a(th);
            if (akVar != null) {
                try {
                    akVar.B();
                } catch (Throwable th3) {
                    cx.b(th3);
                }
            }
            if (th instanceof OutOfMemoryError) {
                System.gc();
                this.di = null;
                this.di = new StringBuilder(2048);
            }
            h.r(dk).I();
        }
    }

    final void b(List<?> list, ak akVar) {
        if (this.dh != null) {
            this.dh.a(new an(this, list, akVar));
        }
    }
}
