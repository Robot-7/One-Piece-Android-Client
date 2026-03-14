package com.testin.agent.a;

import android.content.ContentValues;
import android.content.Context;
import android.support.v4.view.accessibility.AccessibilityEventCompat;
import android.text.TextUtils;
import com.tencent.stat.common.StatConstants;
import com.testin.agent.b.d;
import com.testin.agent.b.e;
import com.testin.agent.b.f;
import com.testin.agent.base.b;
import com.testin.agent.c.c;
import java.io.DataOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.InputStream;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.concurrent.Executors;
import java.util.concurrent.ScheduledExecutorService;
import java.util.concurrent.ScheduledFuture;
import java.util.concurrent.TimeUnit;
import java.util.concurrent.atomic.AtomicBoolean;
import java.util.concurrent.locks.ReentrantLock;
import org.apache.http.HttpResponse;
import org.apache.http.util.EntityUtils;
import org.json.JSONObject;

/* JADX INFO: loaded from: classes.dex */
public class a implements Runnable {
    private static ReentrantLock b = new ReentrantLock();
    private static a f;
    private Context a;
    private ScheduledFuture e;
    private c g;
    private ArrayList h;
    private d k;
    private AtomicBoolean d = new AtomicBoolean(false);
    private HashMap i = new HashMap();
    private int j = 0;
    private ScheduledExecutorService c = Executors.newSingleThreadScheduledExecutor();

    public a(Context context) {
        this.a = context;
        this.g = new c(this.a);
    }

    public static a a(Context context) {
        b.lock();
        try {
            f = new a(context);
            b.unlock();
            return f;
        } catch (Throwable th) {
            b.unlock();
            throw th;
        }
    }

    private void a(int i) {
        this.g.b("crashtable", i);
        this.i.put(Integer.valueOf(i), true);
    }

    private void a(int i, String str) {
        a(i);
        File file = new File(str);
        if (file.exists()) {
            if (file.delete()) {
                b.a("CacheUploader", "Delete dumpfile(crashId:" + i + ") successed");
            } else {
                b.a("CacheUploader", "Delete dumpfile(crashId:" + i + ") failed");
            }
        }
    }

    private void a(int i, boolean z, int i2) {
        if (z) {
            ContentValues contentValues = new ContentValues();
            contentValues.put("crashed_num", Integer.valueOf(i2));
            this.g.a("crashtable", i, contentValues);
        }
    }

    private void a(com.testin.agent.c.a aVar) {
        c(aVar);
    }

    private void a(boolean z) {
        if (!this.d.get()) {
            b.a("CacheUploader", "CacheUploader is stopped");
            return;
        }
        b.lock();
        try {
            f.d.set(false);
            f.e.cancel(z);
            b.a("CacheUploader", "CacheUploader stopped");
        } finally {
            b.unlock();
        }
    }

    public static void b() {
        if (f == null) {
            return;
        }
        f.a(true);
    }

    private void b(com.testin.agent.c.a aVar) {
        try {
            int iA = aVar.a();
            int iQ = aVar.q();
            int iR = aVar.r();
            int iF = com.testin.agent.f.d.f(this.a);
            String strP = aVar.p();
            HttpURLConnection httpURLConnection = (HttpURLConnection) new URL(com.testin.agent.f.c.a("/cpi/crash")).openConnection();
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
            httpURLConnection.setRequestProperty("Upload-Json", com.testin.agent.f.a.a("subndk"));
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
            if (httpURLConnection.getResponseCode() == 200) {
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
                b.a("CacheUploader", "Response：" + string);
                switch (new JSONObject(string).getInt("en")) {
                    case 0:
                        a(iA, strP);
                        break;
                    default:
                        if (iQ + 1 <= iR) {
                            a(iA, true, iQ + 1);
                        } else {
                            a(iA, strP);
                        }
                        break;
                }
            }
        } catch (Exception e) {
            e.a(e);
        }
    }

    private void c() {
        if (this.d.get()) {
            b.b("CacheUploader", "CacheUploader is running");
        } else {
            this.d.set(true);
            this.e = this.c.scheduleAtFixedRate(this, 0L, 3000L, TimeUnit.MILLISECONDS);
        }
    }

    private void c(com.testin.agent.c.a aVar) {
        if (aVar == null) {
        }
        if (this.k == null) {
            this.k = new d();
        }
        int iA = aVar.a();
        int iQ = aVar.q();
        int iR = aVar.r();
        try {
            String strA = StatConstants.MTA_COOPERATION_TAG;
            String str = StatConstants.MTA_COOPERATION_TAG;
            switch (Integer.valueOf(aVar.d()).intValue()) {
                case 10:
                    str = "submit";
                    strA = com.testin.agent.f.a.a(aVar);
                    break;
                case 11:
                    str = "exception";
                    strA = com.testin.agent.f.a.b(aVar);
                    break;
            }
            if (TextUtils.isEmpty(str) || TextUtils.isEmpty(strA)) {
                b.c("CacheUploader", "Head tag or crash message is 0-length");
                return;
            }
            HttpResponse httpResponseA = this.k.a(com.testin.agent.f.c.a("/cpi/crash"), strA, str, com.testin.agent.f.d.f(this.a));
            if (httpResponseA.getStatusLine().getStatusCode() == 200) {
                String string = EntityUtils.toString(httpResponseA.getEntity(), "UTF-8");
                b.a("CacheUploader", "ResultMsg:" + string);
                switch (new JSONObject(string).getInt("en")) {
                    case 0:
                        a(iA);
                        break;
                    default:
                        if (iQ + 1 <= iR) {
                            a(iA, true, iQ + 1);
                        } else {
                            a(iA);
                        }
                        break;
                }
            }
        } catch (Exception e) {
            e.a(e);
        }
    }

    private void d() {
        int i = 0;
        b.lock();
        try {
            this.h = this.g.b("crashtable");
            while (true) {
                int i2 = i;
                if (i2 >= this.h.size()) {
                    return;
                }
                this.i.put((Integer) this.h.get(i2), false);
                i = i2 + 1;
            }
        } finally {
            b.unlock();
        }
    }

    private void e() {
        this.j = 0;
        if (this.h != null) {
            this.h.clear();
            this.h = null;
        }
        this.i.clear();
    }

    public void a() {
        if (f == null) {
            return;
        }
        b.lock();
        try {
            f.c();
            b.a("CacheUploader", "CacheUploader started");
        } finally {
            b.unlock();
        }
    }

    @Override // java.lang.Runnable
    public void run() {
        if (f.d.get()) {
            b.lock();
            try {
                if (this.g.a("crashtable") == 0) {
                    f.a.sendEmptyMessage(10);
                }
                if (this.h == null) {
                    d();
                    b.a("CacheUploader", "Indexs :" + this.h.toString());
                }
                if (com.testin.agent.f.c.a(this.a)) {
                    int iIntValue = ((Integer) this.h.get(this.j)).intValue();
                    b.a("CacheUploader", "Upload CrashId :" + iIntValue);
                    if (!((Boolean) this.i.get(Integer.valueOf(iIntValue))).booleanValue()) {
                        com.testin.agent.c.a aVarA = this.g.a("crashtable", iIntValue);
                        switch (Integer.valueOf(aVarA.d()).intValue()) {
                            case 10:
                                switch (Integer.valueOf(aVarA.b()).intValue()) {
                                    case 0:
                                        c(aVarA);
                                        break;
                                    case 1:
                                        b(aVarA);
                                        break;
                                }
                                break;
                            case 11:
                                a(aVarA);
                                break;
                        }
                    }
                    this.j++;
                    if (this.j >= this.h.size()) {
                        e();
                        f.a.sendEmptyMessage(10);
                    }
                } else {
                    b.a("Current network is disconnected or disabled");
                    e();
                    f.a.sendEmptyMessage(10);
                }
            } finally {
                b.unlock();
            }
        }
    }
}
