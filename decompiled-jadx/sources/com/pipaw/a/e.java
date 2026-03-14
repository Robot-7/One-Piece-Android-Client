package com.pipaw.a;

import com.tencent.stat.common.StatConstants;
import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.util.List;
import org.apache.http.client.entity.UrlEncodedFormEntity;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.impl.client.DefaultHttpClient;

/* JADX INFO: loaded from: classes.dex */
public class e {
    private static final String a = d.a(e.class);

    public static String a(String str, String str2, List list) {
        return !j.a(str) ? a(str, list) : a(str2, list);
    }

    public static String a(String str, List list) {
        int i = 0;
        while (i < 3) {
            i++;
            try {
                return b(str, list);
            } catch (Exception e) {
                d.a(a, e);
            }
        }
        return StatConstants.MTA_COOPERATION_TAG;
    }

    public static String b(String str, List list) throws Throwable {
        BufferedReader bufferedReader;
        d.a(a, "uri " + str);
        BufferedReader bufferedReader2 = null;
        try {
            DefaultHttpClient defaultHttpClient = new DefaultHttpClient();
            HttpPost httpPost = new HttpPost(str);
            if (list != null) {
                httpPost.setEntity(new UrlEncodedFormEntity(list, "UTF-8"));
            }
            bufferedReader = new BufferedReader(new InputStreamReader(defaultHttpClient.execute(httpPost).getEntity().getContent()));
        } catch (Throwable th) {
            th = th;
        }
        try {
            StringBuilder sb = new StringBuilder();
            while (true) {
                String line = bufferedReader.readLine();
                if (line == null) {
                    break;
                }
                sb.append(line);
            }
            d.a(a, "response " + ((Object) sb));
            String string = sb.toString();
            if (bufferedReader != null) {
                try {
                    bufferedReader.close();
                } catch (Exception e) {
                    d.a(a, e);
                }
            }
            return string;
        } catch (Throwable th2) {
            th = th2;
            bufferedReader2 = bufferedReader;
            if (bufferedReader2 != null) {
                try {
                    bufferedReader2.close();
                } catch (Exception e2) {
                    d.a(a, e2);
                }
            }
            throw th;
        }
    }
}
