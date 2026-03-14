package com.tencent.stat;

import android.content.Context;
import com.tencent.mid.api.MidEntity;
import com.tencent.mid.util.Util;
import com.tencent.stat.common.StatLogger;
import java.io.ByteArrayOutputStream;
import java.io.DataInputStream;
import java.io.InputStream;
import java.net.SocketTimeoutException;
import java.net.UnknownHostException;
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
class g {
    private static StatLogger d = com.tencent.stat.common.k.b();
    private static g e = null;
    private static Context f = null;
    DefaultHttpClient a;
    com.tencent.stat.common.e b;
    StringBuilder c = new StringBuilder(4096);
    private long g;

    private g(Context context) {
        this.a = null;
        this.b = null;
        this.g = 0L;
        try {
            f = context.getApplicationContext();
            this.g = System.currentTimeMillis() / 1000;
            this.b = new com.tencent.stat.common.e();
            if (StatConfig.isDebugEnable()) {
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
            this.a = new DefaultHttpClient(basicHttpParams);
            this.a.setKeepAliveStrategy(new h(this));
        } catch (Throwable th2) {
            d.e(th2);
        }
    }

    static Context a() {
        return f;
    }

    static void a(Context context) {
        f = context.getApplicationContext();
    }

    private void a(JSONObject jSONObject) {
        try {
            String strOptString = jSONObject.optString(MidEntity.TAG_MID);
            if (Util.isMidValid(strOptString)) {
                if (StatConfig.isDebugEnable()) {
                    d.i("update mid:" + strOptString);
                }
                Util.updateIfLocalInvalid(f, strOptString);
            }
            if (!jSONObject.isNull("cfg")) {
                StatConfig.a(f, jSONObject.getJSONObject("cfg"));
            }
            if (jSONObject.isNull("ncts")) {
                return;
            }
            int i = jSONObject.getInt("ncts");
            int iCurrentTimeMillis = (int) (((long) i) - (System.currentTimeMillis() / 1000));
            if (StatConfig.isDebugEnable()) {
                d.i("server time:" + i + ", diff time:" + iCurrentTimeMillis);
            }
            com.tencent.stat.common.k.z(f);
            com.tencent.stat.common.k.a(f, iCurrentTimeMillis);
        } catch (Throwable th) {
            d.w(th);
        }
    }

    static g b(Context context) {
        if (e == null) {
            synchronized (g.class) {
                if (e == null) {
                    e = new g(context);
                }
            }
        }
        return e;
    }

    void a(com.tencent.stat.a.e eVar, StatDispatchCallback statDispatchCallback) {
        b(Arrays.asList(eVar.g()), statDispatchCallback);
    }

    void a(List<?> list, StatDispatchCallback statDispatchCallback) {
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
            this.c.delete(0, this.c.length());
            this.c.append("[");
            for (int i = 0; i < size; i++) {
                this.c.append(list.get(i).toString());
                if (i != size - 1) {
                    this.c.append(",");
                }
            }
            this.c.append("]");
            String string = this.c.toString();
            int length = string.length();
            String str = StatConfig.getStatReportUrl() + "/?index=" + this.g;
            this.g++;
            if (StatConfig.isDebugEnable()) {
                d.i("[" + str + "]Send request(" + length + "bytes), content:" + string);
            }
            HttpPost httpPost = new HttpPost(str);
            httpPost.addHeader("Accept-Encoding", "gzip");
            httpPost.setHeader("Connection", "Keep-Alive");
            httpPost.removeHeaders("Cache-Control");
            HttpHost httpHostA = a.a(f).a();
            httpPost.addHeader("Content-Encoding", "rc4");
            if (httpHostA == null) {
                this.a.getParams().removeParameter("http.route.default-proxy");
            } else {
                if (StatConfig.isDebugEnable()) {
                    d.d("proxy:" + httpHostA.toHostString());
                }
                httpPost.addHeader("X-Content-Encoding", "rc4");
                this.a.getParams().setParameter("http.route.default-proxy", httpHostA);
                httpPost.addHeader("X-Online-Host", StatConfig.k);
                httpPost.addHeader("Accept", "*/*");
                httpPost.addHeader("Content-Type", "json");
            }
            byteArrayOutputStream = new ByteArrayOutputStream(length);
            byte[] bytes = string.getBytes("UTF-8");
            int length2 = bytes.length;
            if (length > StatConfig.o) {
                httpPost.removeHeaders("Content-Encoding");
                String str2 = "rc4,gzip";
                httpPost.addHeader("Content-Encoding", str2);
                if (httpHostA != null) {
                    httpPost.removeHeaders("X-Content-Encoding");
                    httpPost.addHeader("X-Content-Encoding", str2);
                }
                byteArrayOutputStream.write(new byte[4]);
                GZIPOutputStream gZIPOutputStream = new GZIPOutputStream(byteArrayOutputStream);
                gZIPOutputStream.write(bytes);
                gZIPOutputStream.close();
                bytes = byteArrayOutputStream.toByteArray();
                ByteBuffer.wrap(bytes, 0, 4).putInt(length2);
                if (StatConfig.isDebugEnable()) {
                    d.d("before Gzip:" + length2 + " bytes, after Gzip:" + bytes.length + " bytes");
                }
            }
            httpPost.setEntity(new ByteArrayEntity(com.tencent.stat.common.f.a(bytes)));
            httpResponseExecute = this.a.execute(httpPost);
            entity = httpResponseExecute.getEntity();
            statusCode = httpResponseExecute.getStatusLine().getStatusCode();
            contentLength = entity.getContentLength();
            if (StatConfig.isDebugEnable()) {
                d.i("http recv response status code:" + statusCode + ", content length:" + contentLength);
            }
        } catch (Throwable th) {
            th = th;
        }
        if (contentLength <= 0) {
            if (statusCode != 200) {
                d.error("Server response no error.");
                if (statDispatchCallback != null) {
                    statDispatchCallback.onDispatchFailure();
                }
            } else if (statDispatchCallback != null) {
                statDispatchCallback.onDispatchSuccess();
            }
            EntityUtils.toString(entity);
            return;
        }
        if (contentLength > 0) {
            InputStream content = entity.getContent();
            DataInputStream dataInputStream = new DataInputStream(content);
            byte[] bArrB = new byte[(int) entity.getContentLength()];
            dataInputStream.readFully(bArrB);
            content.close();
            dataInputStream.close();
            Header firstHeader = httpResponseExecute.getFirstHeader("Content-Encoding");
            if (firstHeader != null) {
                if (firstHeader.getValue().equalsIgnoreCase("gzip,rc4")) {
                    bArrB = com.tencent.stat.common.f.b(com.tencent.stat.common.k.a(bArrB));
                } else if (firstHeader.getValue().equalsIgnoreCase("rc4,gzip")) {
                    bArrB = com.tencent.stat.common.k.a(com.tencent.stat.common.f.b(bArrB));
                } else if (firstHeader.getValue().equalsIgnoreCase("gzip")) {
                    bArrB = com.tencent.stat.common.k.a(bArrB);
                } else if (firstHeader.getValue().equalsIgnoreCase("rc4")) {
                    bArrB = com.tencent.stat.common.f.b(bArrB);
                }
            }
            String str3 = new String(bArrB, "UTF-8");
            if (StatConfig.isDebugEnable()) {
                d.i("http get response data:" + str3);
            }
            JSONObject jSONObject = new JSONObject(str3);
            if (statusCode == 200) {
                a(jSONObject);
                if (statDispatchCallback != null) {
                    if (jSONObject.optInt("ret") == 0) {
                        statDispatchCallback.onDispatchSuccess();
                    } else {
                        d.error("response error data.");
                        statDispatchCallback.onDispatchFailure();
                    }
                }
            } else {
                d.error("Server response error code:" + statusCode + ", error:" + new String(bArrB, "UTF-8"));
                if (statDispatchCallback != null) {
                    statDispatchCallback.onDispatchFailure();
                }
            }
            content.close();
        } else {
            EntityUtils.toString(entity);
        }
        byteArrayOutputStream.close();
        th = null;
        if (th != null) {
            d.error(th);
            if (statDispatchCallback != null) {
                try {
                    statDispatchCallback.onDispatchFailure();
                } catch (Throwable th2) {
                    d.e(th2);
                }
            }
            if (th instanceof OutOfMemoryError) {
                System.gc();
                this.c = null;
                this.c = new StringBuilder(2048);
            } else if ((th instanceof UnknownHostException) || (th instanceof SocketTimeoutException)) {
            }
            a.a(f).d();
        }
    }

    void b(List<?> list, StatDispatchCallback statDispatchCallback) {
        if (this.b != null) {
            this.b.a(new i(this, list, statDispatchCallback));
        }
    }
}
