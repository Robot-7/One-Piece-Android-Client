package com.flurry.sdk;

import android.annotation.TargetApi;
import android.os.Build;
import com.tencent.stat.common.StatConstants;
import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.Closeable;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import org.apache.http.Header;
import org.apache.http.HeaderElement;
import org.apache.http.HttpEntity;
import org.apache.http.HttpResponse;
import org.apache.http.client.HttpClient;
import org.apache.http.client.methods.HttpDelete;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.client.methods.HttpHead;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.client.methods.HttpPut;
import org.apache.http.client.methods.HttpRequestBase;
import org.apache.http.entity.AbstractHttpEntity;
import org.apache.http.params.BasicHttpParams;
import org.apache.http.params.HttpConnectionParams;

/* JADX INFO: loaded from: classes.dex */
public class ek extends fd {
    private static final String a = ek.class.getSimpleName();
    private String b;
    private a c;
    private c j;
    private HttpURLConnection k;
    private HttpClient l;
    private boolean m;
    private boolean n;
    private Exception o;
    private int d = 10000;
    private int e = 15000;
    private boolean f = true;
    private final ds<String, String> i = new ds<>();
    private int p = -1;
    private final ds<String, String> q = new ds<>();
    private final Object r = new Object();

    public interface c {
        void a(ek ekVar);

        void a(ek ekVar, InputStream inputStream) throws Exception;

        void a(ek ekVar, OutputStream outputStream) throws Exception;
    }

    public static class b implements c {
        @Override // com.flurry.sdk.ek.c
        public void a(ek ekVar, OutputStream outputStream) throws Exception {
        }

        @Override // com.flurry.sdk.ek.c
        public void a(ek ekVar, InputStream inputStream) throws Exception {
        }

        @Override // com.flurry.sdk.ek.c
        public void a(ek ekVar) {
        }
    }

    public enum a {
        kUnknown,
        kGet,
        kPost,
        kPut,
        kDelete,
        kHead;

        @Override // java.lang.Enum
        public String toString() {
            switch (this) {
                case kPost:
                    return "POST";
                case kPut:
                    return "PUT";
                case kDelete:
                    return "DELETE";
                case kHead:
                    return "HEAD";
                case kGet:
                    return "GET";
                default:
                    return null;
            }
        }

        public HttpRequestBase a(String str) {
            switch (this) {
                case kPost:
                    return new HttpPost(str);
                case kPut:
                    return new HttpPut(str);
                case kDelete:
                    return new HttpDelete(str);
                case kHead:
                    return new HttpHead(str);
                case kGet:
                    return new HttpGet(str);
                default:
                    return null;
            }
        }
    }

    public void a(String str) {
        this.b = str;
    }

    public void a(a aVar) {
        this.c = aVar;
    }

    public void a(boolean z) {
        this.f = z;
    }

    public void a(String str, String str2) {
        this.i.a(str, str2);
    }

    public void a(c cVar) {
        this.j = cVar;
    }

    public boolean b() {
        boolean z;
        synchronized (this.r) {
            z = this.n;
        }
        return z;
    }

    public boolean c() {
        return !f() && d();
    }

    public boolean d() {
        return this.p >= 200 && this.p < 400;
    }

    public int e() {
        return this.p;
    }

    public boolean f() {
        return this.o != null;
    }

    public List<String> b(String str) {
        if (str == null) {
            return null;
        }
        return this.q.a(str);
    }

    public void g() {
        synchronized (this.r) {
            this.n = true;
        }
        q();
    }

    @Override // com.flurry.sdk.fc
    public void a() {
        try {
            if (this.b == null) {
                return;
            }
            if (!es.a().c()) {
                el.a(3, a, "Network not available, aborting http request: " + this.b);
                return;
            }
            if (this.c == null || a.kUnknown.equals(this.c)) {
                this.c = a.kGet;
            }
            if (Build.VERSION.SDK_INT >= 9) {
                m();
            } else {
                n();
            }
            el.a(4, a, "HTTP status: " + this.p + " for url: " + this.b);
        } catch (Exception e) {
            el.a(4, a, "HTTP status: " + this.p + " for url: " + this.b);
            el.a(3, a, "Exception during http request: " + this.b, e);
            this.o = e;
        } finally {
            o();
        }
    }

    @Override // com.flurry.sdk.fd
    public void h() {
        g();
    }

    private void m() throws Exception {
        BufferedOutputStream bufferedOutputStream;
        InputStream inputStream;
        BufferedInputStream bufferedInputStream;
        Closeable closeable = null;
        if (this.n) {
            return;
        }
        try {
            this.k = (HttpURLConnection) new URL(this.b).openConnection();
            this.k.setConnectTimeout(this.d);
            this.k.setReadTimeout(this.e);
            this.k.setRequestMethod(this.c.toString());
            this.k.setInstanceFollowRedirects(this.f);
            this.k.setDoOutput(a.kPost.equals(this.c));
            this.k.setDoInput(true);
            for (Map.Entry<String, String> entry : this.i.b()) {
                this.k.addRequestProperty(entry.getKey(), entry.getValue());
            }
            if (!a.kGet.equals(this.c) && !a.kPost.equals(this.c)) {
                this.k.setRequestProperty("Accept-Encoding", StatConstants.MTA_COOPERATION_TAG);
            }
            if (this.n) {
                return;
            }
            if (a.kPost.equals(this.c)) {
                try {
                    OutputStream outputStream = this.k.getOutputStream();
                    try {
                        bufferedOutputStream = new BufferedOutputStream(outputStream);
                        try {
                            a(bufferedOutputStream);
                            fb.a(bufferedOutputStream);
                            fb.a(outputStream);
                        } catch (Throwable th) {
                            th = th;
                            closeable = outputStream;
                            fb.a(bufferedOutputStream);
                            fb.a(closeable);
                            throw th;
                        }
                    } catch (Throwable th2) {
                        th = th2;
                        bufferedOutputStream = null;
                        closeable = outputStream;
                    }
                } catch (Throwable th3) {
                    th = th3;
                    bufferedOutputStream = null;
                }
            }
            this.p = this.k.getResponseCode();
            for (Map.Entry<String, List<String>> entry2 : this.k.getHeaderFields().entrySet()) {
                Iterator<String> it = entry2.getValue().iterator();
                while (it.hasNext()) {
                    this.q.a(entry2.getKey(), it.next());
                }
            }
            if (!a.kGet.equals(this.c) && !a.kPost.equals(this.c)) {
                return;
            }
            if (this.n) {
                return;
            }
            try {
                InputStream inputStream2 = this.k.getInputStream();
                try {
                    bufferedInputStream = new BufferedInputStream(inputStream2);
                } catch (Throwable th4) {
                    th = th4;
                    inputStream = inputStream2;
                }
                try {
                    a(bufferedInputStream);
                    fb.a(bufferedInputStream);
                    fb.a(inputStream2);
                } catch (Throwable th5) {
                    th = th5;
                    closeable = bufferedInputStream;
                    inputStream = inputStream2;
                    fb.a(closeable);
                    fb.a(inputStream);
                    throw th;
                }
            } catch (Throwable th6) {
                th = th6;
                inputStream = null;
            }
        } finally {
            p();
        }
    }

    private void n() throws Exception {
        BufferedInputStream bufferedInputStream;
        InputStream content;
        InputStream inputStream = null;
        if (!this.n) {
            HttpRequestBase httpRequestBaseA = this.c.a(this.b);
            for (Map.Entry<String, String> entry : this.i.b()) {
                httpRequestBaseA.setHeader(entry.getKey(), entry.getValue());
            }
            if (!a.kGet.equals(this.c) && !a.kPost.equals(this.c)) {
                httpRequestBaseA.removeHeaders("Accept-Encoding");
            }
            if (a.kPost.equals(this.c)) {
                ((HttpPost) httpRequestBaseA).setEntity(new AbstractHttpEntity() { // from class: com.flurry.sdk.ek.1
                    @Override // org.apache.http.HttpEntity
                    public boolean isRepeatable() {
                        return false;
                    }

                    @Override // org.apache.http.HttpEntity
                    public long getContentLength() {
                        return -1L;
                    }

                    @Override // org.apache.http.HttpEntity
                    public boolean isStreaming() {
                        return false;
                    }

                    @Override // org.apache.http.HttpEntity
                    public InputStream getContent() throws IOException {
                        throw new UnsupportedOperationException();
                    }

                    @Override // org.apache.http.HttpEntity
                    @TargetApi(9)
                    public void writeTo(OutputStream outputStream) throws Throwable {
                        try {
                            try {
                                BufferedOutputStream bufferedOutputStream = new BufferedOutputStream(outputStream);
                                try {
                                    ek.this.a(bufferedOutputStream);
                                    fb.a(bufferedOutputStream);
                                } catch (IOException e) {
                                } catch (Exception e2) {
                                    e = e2;
                                    if (Build.VERSION.SDK_INT >= 9) {
                                        throw new IOException(e);
                                    }
                                    throw new IOException(e.toString());
                                }
                            } catch (Throwable th) {
                                th = th;
                                fb.a((Closeable) null);
                                throw th;
                            }
                        } catch (IOException e3) {
                            throw e3;
                        } catch (Exception e4) {
                            e = e4;
                        } catch (Throwable th2) {
                            th = th2;
                            fb.a((Closeable) null);
                            throw th;
                        }
                    }
                });
            }
            try {
                BasicHttpParams basicHttpParams = new BasicHttpParams();
                HttpConnectionParams.setConnectionTimeout(basicHttpParams, this.d);
                HttpConnectionParams.setSoTimeout(basicHttpParams, this.e);
                basicHttpParams.setParameter("http.protocol.handle-redirects", Boolean.valueOf(this.f));
                this.l = eh.a(basicHttpParams);
                HttpResponse httpResponseExecute = this.l.execute(httpRequestBaseA);
                if (this.n) {
                    throw new Exception("Request cancelled");
                }
                if (httpResponseExecute != null) {
                    this.p = httpResponseExecute.getStatusLine().getStatusCode();
                    Header[] allHeaders = httpResponseExecute.getAllHeaders();
                    if (allHeaders != null) {
                        for (Header header : allHeaders) {
                            HeaderElement[] elements = header.getElements();
                            for (HeaderElement headerElement : elements) {
                                this.q.a(headerElement.getName(), headerElement.getValue());
                            }
                        }
                    }
                    if (a.kGet.equals(this.c) || a.kPost.equals(this.c)) {
                        if (this.n) {
                            throw new Exception("Request cancelled");
                        }
                        HttpEntity entity = httpResponseExecute.getEntity();
                        if (entity != null) {
                            try {
                                content = entity.getContent();
                                try {
                                    bufferedInputStream = new BufferedInputStream(content);
                                } catch (Throwable th) {
                                    th = th;
                                    bufferedInputStream = null;
                                    inputStream = content;
                                }
                            } catch (Throwable th2) {
                                th = th2;
                                bufferedInputStream = null;
                            }
                            try {
                                a(bufferedInputStream);
                                fb.a(bufferedInputStream);
                                fb.a(content);
                            } catch (Throwable th3) {
                                th = th3;
                                inputStream = content;
                                fb.a(bufferedInputStream);
                                fb.a(inputStream);
                                throw th;
                            }
                        }
                    }
                }
            } finally {
                p();
            }
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void a(OutputStream outputStream) throws Exception {
        if (this.j != null && !b() && outputStream != null) {
            this.j.a(this, outputStream);
        }
    }

    private void a(InputStream inputStream) throws Exception {
        if (this.j != null && !b() && inputStream != null) {
            this.j.a(this, inputStream);
        }
    }

    private void o() {
        if (this.j != null && !b()) {
            this.j.a(this);
        }
    }

    private void p() {
        if (!this.m) {
            this.m = true;
            if (this.k != null) {
                this.k.disconnect();
            }
            if (this.l != null) {
                this.l.getConnectionManager().shutdown();
            }
        }
    }

    private void q() {
        if (!this.m) {
            this.m = true;
            if (this.k != null || this.l != null) {
                new Thread() { // from class: com.flurry.sdk.ek.2
                    @Override // java.lang.Thread, java.lang.Runnable
                    public void run() {
                        if (ek.this.k != null) {
                            ek.this.k.disconnect();
                        }
                        if (ek.this.l != null) {
                            ek.this.l.getConnectionManager().shutdown();
                        }
                    }
                }.start();
            }
        }
    }
}
