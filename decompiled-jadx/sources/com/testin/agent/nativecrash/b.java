package com.testin.agent.nativecrash;

import android.content.Context;
import android.support.v4.view.accessibility.AccessibilityEventCompat;
import android.text.TextUtils;
import com.tencent.stat.common.StatConstants;
import com.testin.agent.base.TestinGVariables;
import com.testin.agent.d.c;
import com.testin.agent.d.d;
import com.testin.agent.f.e;
import java.io.DataOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.InputStream;
import java.net.HttpURLConnection;
import java.net.URL;
import org.json.JSONException;
import org.json.JSONObject;

/* JADX INFO: loaded from: classes.dex */
public class b {
    private static Context a;

    private static com.testin.agent.c.a a(int i, String str) {
        long jCurrentTimeMillis = System.currentTimeMillis();
        com.testin.agent.c.a aVar = new com.testin.agent.c.a();
        try {
            c cVarB = TestinGVariables.c().b();
            d dVarA = TestinGVariables.c().a();
            aVar.a(String.valueOf(i));
            aVar.b(String.valueOf(System.currentTimeMillis() / 1000));
            aVar.c(String.valueOf(10));
            aVar.e("5.0");
            aVar.d(cVarB.a().toString());
            aVar.i(dVarA.a().toString());
            aVar.f(e.h().toString());
            aVar.j(e.c(a));
            aVar.l(e.d(a));
            aVar.n(System.getProperty("os.arch"));
            aVar.o(str);
            aVar.m(com.testin.agent.f.a.a().toString());
            aVar.b(0);
            aVar.c(com.testin.agent.f.d.d(a));
            com.testin.agent.base.b.a("NativeCrashHandler", "数据采集耗时（毫秒）：" + (System.currentTimeMillis() - jCurrentTimeMillis));
        } catch (Exception e) {
            com.testin.agent.b.e.a(e);
        }
        return aVar;
    }

    public static void a(String str) {
        if (new NativeCrash().registNativeCrash(str)) {
            com.testin.agent.base.b.a("Regist native crash successed");
        } else {
            com.testin.agent.base.b.a("Regist native crash failled");
        }
    }

    public static void a(String str, com.testin.agent.c.a aVar) throws Throwable {
        try {
            String strP = aVar.p();
            int iF = com.testin.agent.f.d.f(a);
            HttpURLConnection httpURLConnection = (HttpURLConnection) new URL(str).openConnection();
            httpURLConnection.setChunkedStreamingMode(AccessibilityEventCompat.TYPE_GESTURE_DETECTION_START);
            httpURLConnection.setDoInput(true);
            httpURLConnection.setDoOutput(true);
            httpURLConnection.setUseCaches(false);
            httpURLConnection.setConnectTimeout(iF);
            httpURLConnection.setReadTimeout(iF);
            httpURLConnection.setRequestMethod("POST");
            httpURLConnection.setRequestProperty("Connection", "Keep-Alive");
            httpURLConnection.setRequestProperty("Charset", "utf-8");
            httpURLConnection.setRequestProperty("Accept-Encoding", "indentity");
            httpURLConnection.setRequestProperty("Upload-Json", e("subndk"));
            httpURLConnection.setRequestProperty("Content-Type", "multipart/form-data;boundary=*********");
            DataOutputStream dataOutputStream = new DataOutputStream(httpURLConnection.getOutputStream());
            dataOutputStream.writeBytes(String.valueOf("--") + "*********\r\n");
            dataOutputStream.writeBytes("Content-Disposition: form-data; name=\"file_msg\"\r\n");
            dataOutputStream.writeBytes("\r\n");
            dataOutputStream.write(com.testin.agent.f.a.c(aVar).getBytes("UTF-8"));
            dataOutputStream.writeBytes("\r\n");
            dataOutputStream.writeBytes(String.valueOf("--") + "*********\r\n");
            dataOutputStream.writeBytes("Content-Disposition: form-data; name=\"file_dump\"; filename=\"" + strP.substring(strP.lastIndexOf("/") + 1) + "\"\r\n");
            dataOutputStream.writeBytes("\r\n");
            FileInputStream fileInputStream = new FileInputStream(strP);
            byte[] bArr = new byte[8192];
            while (true) {
                int i = fileInputStream.read(bArr);
                if (i == -1) {
                    break;
                } else {
                    dataOutputStream.write(bArr, 0, i);
                }
            }
            fileInputStream.close();
            dataOutputStream.writeBytes("\r\n");
            dataOutputStream.writeBytes(String.valueOf("--") + "*********--\r\n");
            dataOutputStream.flush();
            dataOutputStream.close();
            if (httpURLConnection.getResponseCode() != 200) {
                com.testin.agent.base.b.c("NativeCrashHandler", "ResponseCode: " + httpURLConnection.getResponseCode());
                com.testin.agent.f.a.a(a, aVar);
                return;
            }
            InputStream inputStream = httpURLConnection.getInputStream();
            StringBuffer stringBuffer = new StringBuffer();
            while (true) {
                int i2 = inputStream.read();
                if (i2 == -1) {
                    break;
                } else {
                    stringBuffer.append((char) i2);
                }
            }
            String string = stringBuffer.toString();
            com.testin.agent.base.b.a("NativeCrashHandler", "ResultMsg:" + string);
            switch (new JSONObject(string).getInt("en")) {
                case 0:
                    d(strP);
                    break;
                default:
                    com.testin.agent.f.a.a(a, aVar);
                    break;
            }
        } catch (Exception e) {
            com.testin.agent.f.a.a(a, aVar);
            com.testin.agent.b.e.a(e);
        }
    }

    public static boolean a(Context context) {
        a = context;
        NativeCrashNdk.a(a);
        return NativeCrashNdk.a();
    }

    public static void b(String str) throws Throwable {
        com.testin.agent.base.b.a("NativeCrashHandler", "filePath：" + str);
        String str2 = a.getFilesDir() + "/com.testin.agent/dumps/" + str.substring(str.lastIndexOf("/") + 1, str.lastIndexOf(".")) + ".zip";
        if (!new File(str).exists()) {
            com.testin.agent.base.b.a("Native code crashed, But dump file is not exists");
            return;
        }
        com.testin.agent.f.a.a(new File(str), new File(str2));
        c(str2);
        d(str);
    }

    public static void c(String str) throws Throwable {
        com.testin.agent.c.a aVarA = a(1, str);
        switch (com.testin.agent.f.d.c(a)) {
            case 0:
                if (!com.testin.agent.f.c.a(a)) {
                    com.testin.agent.f.a.a(a, aVarA);
                    com.testin.agent.base.b.a("Current network is disconnected or disabled");
                } else {
                    try {
                        a(com.testin.agent.f.c.a("/cpi/crash"), aVarA);
                    } catch (Exception e) {
                        com.testin.agent.b.e.a(e);
                        return;
                    }
                }
                break;
            case 1:
                com.testin.agent.f.a.a(a, aVarA);
                break;
        }
    }

    private static void d(String str) {
        if (TextUtils.isEmpty(str)) {
            com.testin.agent.base.b.a("Delete dump file, but it's null");
            return;
        }
        File file = new File(str);
        if (file.exists()) {
            file.delete();
        } else {
            com.testin.agent.base.b.a("Delete dumpfile, but files is not exists");
        }
    }

    private static String e(String str) {
        try {
            JSONObject jSONObject = new JSONObject();
            jSONObject.put("ak", TestinGVariables.c().e);
            jSONObject.put("tm", String.valueOf(System.currentTimeMillis() / 1000));
            jSONObject.put("ac", str);
            return jSONObject.toString();
        } catch (JSONException e) {
            com.testin.agent.b.e.a(e);
            return StatConstants.MTA_COOPERATION_TAG;
        }
    }
}
