package com.igexin.getuiext.util;

import java.io.ByteArrayInputStream;
import java.io.InputStream;
import java.io.UnsupportedEncodingException;
import java.util.HashMap;
import java.util.Locale;
import org.apache.http.HttpResponse;
import org.apache.http.MethodNotSupportedException;
import org.apache.http.client.entity.UrlEncodedFormEntity;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.entity.InputStreamEntity;
import org.apache.http.impl.client.DefaultHttpClient;
import org.apache.http.params.BasicHttpParams;
import org.apache.http.params.HttpConnectionParams;
import org.apache.http.params.HttpParams;
import org.apache.http.util.EntityUtils;
import org.json.JSONObject;

/* JADX INFO: loaded from: classes.dex */
public class c {
    public static InputStream a(String str, String str2, HashMap map) throws MethodNotSupportedException {
        if (str == null) {
            str = "POST";
        }
        if ("POST".equals(str.toUpperCase(Locale.US))) {
            return b(str2, map);
        }
        if ("GET".equalsIgnoreCase(str)) {
            return a(str2, map);
        }
        throw new MethodNotSupportedException("Method you passed in httpMethod current can't be supported. Please contact Devin");
    }

    private static InputStream a(String str, HashMap map) {
        DefaultHttpClient defaultHttpClient = new DefaultHttpClient(a());
        if (map != null) {
            str = str + "?" + b.a(map);
        }
        try {
            HttpResponse httpResponseExecute = defaultHttpClient.execute(new HttpGet(str));
            if (httpResponseExecute.getStatusLine().getStatusCode() == 200) {
                return httpResponseExecute.getEntity().getContent();
            }
        } catch (Exception e) {
        }
        return null;
    }

    public static String a(String str, int i) {
        return a(str, (String) null, i);
    }

    public static String a(String str, String str2, int i) {
        byte[] bytes;
        if (str == null) {
            return null;
        }
        HttpPost httpPost = new HttpPost(str);
        if (str2 != null) {
            try {
                bytes = str2.getBytes("UTF-8");
            } catch (UnsupportedEncodingException e) {
                bytes = null;
            }
        } else {
            bytes = null;
        }
        if (bytes != null) {
            httpPost.setEntity(new InputStreamEntity(new ByteArrayInputStream(bytes), bytes.length));
        }
        DefaultHttpClient defaultHttpClient = new DefaultHttpClient(a());
        HttpResponse httpResponseExecute = null;
        while (i > 0) {
            try {
                httpResponseExecute = defaultHttpClient.execute(httpPost);
            } catch (Exception e2) {
            }
            if (httpResponseExecute == null) {
                return null;
            }
            if (httpResponseExecute.getStatusLine().getStatusCode() == 200) {
                try {
                    return EntityUtils.toString(httpResponseExecute.getEntity(), "UTF-8");
                } catch (Exception e3) {
                    return null;
                }
            }
            i--;
        }
        return null;
    }

    public static String a(String str, JSONObject jSONObject, int i) {
        return a(str, jSONObject != null ? jSONObject.toString() : null, i);
    }

    public static String a(String str, byte[] bArr, int i) {
        if (str == null) {
            return null;
        }
        HttpPost httpPost = new HttpPost(str);
        if (bArr != null) {
            httpPost.setEntity(new InputStreamEntity(new ByteArrayInputStream(bArr), bArr.length));
        }
        DefaultHttpClient defaultHttpClient = new DefaultHttpClient(a());
        HttpResponse httpResponseExecute = null;
        while (i > 0) {
            try {
                httpResponseExecute = defaultHttpClient.execute(httpPost);
            } catch (Exception e) {
            }
            if (httpResponseExecute == null) {
                return null;
            }
            if (httpResponseExecute.getStatusLine().getStatusCode() == 200) {
                try {
                    return EntityUtils.toString(httpResponseExecute.getEntity(), "UTF-8");
                } catch (Exception e2) {
                    return null;
                }
            }
            i--;
        }
        return null;
    }

    private static HttpParams a() {
        BasicHttpParams basicHttpParams = new BasicHttpParams();
        HttpConnectionParams.setConnectionTimeout(basicHttpParams, 120000);
        HttpConnectionParams.setSoTimeout(basicHttpParams, 120000);
        HttpConnectionParams.setSocketBufferSize(basicHttpParams, 10240);
        return basicHttpParams;
    }

    private static InputStream b(String str, HashMap map) {
        DefaultHttpClient defaultHttpClient = new DefaultHttpClient(a());
        HttpPost httpPost = new HttpPost(str);
        try {
            httpPost.setEntity(new UrlEncodedFormEntity(b.b(map)));
            HttpResponse httpResponseExecute = defaultHttpClient.execute(httpPost);
            if (httpResponseExecute.getStatusLine().getStatusCode() == 200) {
                return httpResponseExecute.getEntity().getContent();
            }
        } catch (Exception e) {
        }
        return null;
    }
}
