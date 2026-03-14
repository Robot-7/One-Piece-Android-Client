package com.testin.agent.f;

import android.content.Context;
import com.testin.agent.base.TestinGVariables;
import java.io.BufferedInputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.zip.ZipEntry;
import java.util.zip.ZipOutputStream;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

/* JADX INFO: loaded from: classes.dex */
public class a {
    public static String a(com.testin.agent.c.a aVar) {
        JSONObject jSONObject = new JSONObject();
        try {
            com.testin.agent.d.b bVar = new com.testin.agent.d.b();
            bVar.a(aVar.k());
            bVar.b(aVar.l());
            bVar.d(aVar.m());
            bVar.e(aVar.b());
            bVar.a(new JSONArray(aVar.n()));
            bVar.b(new JSONArray(aVar.h()));
            bVar.f(aVar.c());
            jSONObject.put("pro", aVar.f());
            jSONObject.put("dei", new JSONObject(aVar.e()));
            jSONObject.put("mach", new JSONObject(aVar.g()));
            jSONObject.put("nwt", new JSONObject(aVar.j()));
            jSONObject.put("data", bVar.a());
        } catch (JSONException e) {
            com.testin.agent.b.e.a(e);
        }
        return jSONObject.toString();
    }

    public static String a(String str) {
        JSONObject jSONObject = new JSONObject();
        try {
            jSONObject.put("ak", TestinGVariables.c().e);
            jSONObject.put("ty", "0");
            jSONObject.put("pro", "5.0");
            jSONObject.put("tm", String.valueOf(System.currentTimeMillis() / 1000));
            jSONObject.put("ac", str);
        } catch (JSONException e) {
            com.testin.agent.b.e.a(e);
        }
        return jSONObject.toString();
    }

    public static JSONArray a() {
        JSONArray jSONArray;
        JSONException e;
        try {
            jSONArray = new JSONArray();
            try {
                jSONArray.put(new JSONObject().put("une", TestinGVariables.c().g));
            } catch (JSONException e2) {
                e = e2;
                com.testin.agent.b.e.a(e);
            }
        } catch (JSONException e3) {
            jSONArray = null;
            e = e3;
        }
        return jSONArray;
    }

    public static void a(Context context, com.testin.agent.c.a aVar) throws Throwable {
        new com.testin.agent.c.c(context).a("crashtable", aVar);
    }

    public static void a(File file, File file2) throws Throwable {
        ZipOutputStream zipOutputStream;
        BufferedInputStream bufferedInputStream;
        byte[] bArr;
        try {
            zipOutputStream = new ZipOutputStream(new FileOutputStream(file2));
            try {
                try {
                    zipOutputStream.putNextEntry(new ZipEntry(file.getName()));
                    bufferedInputStream = new BufferedInputStream(new FileInputStream(file));
                    bArr = new byte[8192];
                } catch (Exception e) {
                    e = e;
                    com.testin.agent.b.e.a(e);
                    if (zipOutputStream != null) {
                        try {
                            zipOutputStream.close();
                            return;
                        } catch (IOException e2) {
                            com.testin.agent.b.e.a(e2);
                            return;
                        }
                    }
                    return;
                }
            } catch (Throwable th) {
                th = th;
            }
        } catch (Exception e3) {
            e = e3;
            zipOutputStream = null;
        } catch (Throwable th2) {
            th = th2;
            zipOutputStream = null;
        }
        while (true) {
            int i = bufferedInputStream.read(bArr);
            if (i == -1) {
                break;
            } else {
                zipOutputStream.write(bArr, 0, i);
            }
            th = th;
            if (zipOutputStream != null) {
                try {
                    zipOutputStream.close();
                } catch (IOException e4) {
                    com.testin.agent.b.e.a(e4);
                }
            }
            throw th;
        }
        bufferedInputStream.close();
        zipOutputStream.flush();
        if (zipOutputStream != null) {
            try {
                zipOutputStream.close();
            } catch (IOException e5) {
                com.testin.agent.b.e.a(e5);
            }
        }
    }

    public static String b(com.testin.agent.c.a aVar) {
        JSONObject jSONObject = new JSONObject();
        try {
            com.testin.agent.d.b bVar = new com.testin.agent.d.b();
            bVar.a(aVar.k());
            bVar.b(aVar.l());
            bVar.d(aVar.m());
            bVar.e(aVar.b());
            bVar.a(new JSONArray(aVar.n()));
            bVar.c(aVar.i());
            bVar.f(aVar.c());
            jSONObject.put("pro", aVar.f());
            jSONObject.put("dei", new JSONObject(aVar.e()));
            jSONObject.put("mach", new JSONObject(aVar.g()));
            jSONObject.put("nwt", new JSONObject(aVar.j()));
            jSONObject.put("data", bVar.b());
        } catch (JSONException e) {
            com.testin.agent.b.e.a(e);
        }
        return jSONObject.toString();
    }

    public static String c(com.testin.agent.c.a aVar) {
        JSONObject jSONObject = new JSONObject();
        try {
            com.testin.agent.d.b bVar = new com.testin.agent.d.b();
            bVar.a(aVar.k());
            bVar.a(new JSONArray(aVar.n()));
            bVar.d(aVar.m());
            bVar.e(aVar.b());
            bVar.f(aVar.c());
            jSONObject.put("pro", aVar.f());
            jSONObject.put("cpun", aVar.o());
            jSONObject.put("dei", new JSONObject(aVar.e()));
            jSONObject.put("mach", new JSONObject(aVar.g()));
            jSONObject.put("nwt", new JSONObject(aVar.j()));
            jSONObject.put("data", bVar.c());
        } catch (JSONException e) {
            com.testin.agent.b.e.a(e);
        }
        return jSONObject.toString();
    }
}
