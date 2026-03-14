package com.igexin.push.core.a;

import android.app.ActivityManager;
import android.app.NotificationManager;
import android.content.ContentValues;
import android.content.Intent;
import android.content.pm.ActivityInfo;
import android.content.pm.ApplicationInfo;
import android.content.pm.PackageInfo;
import android.content.pm.PackageManager;
import android.content.pm.ProviderInfo;
import android.content.pm.ResolveInfo;
import android.content.pm.ServiceInfo;
import android.database.Cursor;
import android.net.ConnectivityManager;
import android.net.NetworkInfo;
import android.net.Uri;
import android.net.wifi.ScanResult;
import android.net.wifi.WifiInfo;
import android.net.wifi.WifiManager;
import android.os.Bundle;
import android.os.Message;
import android.os.PowerManager;
import android.os.Process;
import android.support.v4.view.MotionEventCompat;
import android.util.Base64;
import android.util.Log;
import com.igexin.download.Downloads;
import com.igexin.getuiext.data.Consts;
import com.igexin.push.core.bean.BaseAction;
import com.igexin.push.core.bean.PushTaskBean;
import com.igexin.push.extension.stub.IPushExtension;
import com.igexin.sdk.PushBuildConfig;
import com.igexin.sdk.PushConsts;
import com.igexin.sdk.PushService;
import com.pipaw.pipawpay.PipawSDK;
import com.tencent.stat.common.StatConstants;
import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.lang.reflect.Method;
import java.net.SocketTimeoutException;
import java.net.UnknownHostException;
import java.net.UnknownServiceException;
import java.nio.channels.ClosedChannelException;
import java.nio.channels.UnresolvedAddressException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Collections;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Random;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

/* JADX INFO: loaded from: classes.dex */
public class f extends a implements com.igexin.push.d.k {
    private static Map a;
    private static Map b;
    private static f c;

    private f() {
        a = new HashMap();
        a.put(0, new i());
        a.put(5, new j());
        a.put(37, new l());
        a.put(9, new p());
        a.put(26, new h());
        a.put(28, new e());
        b = new HashMap();
        b.put("goto", new com.igexin.push.core.a.a.g());
        b.put("notification", new com.igexin.push.core.a.a.h());
        b.put("startapp", new com.igexin.push.core.a.a.j());
        b.put("null", new com.igexin.push.core.a.a.f());
        b.put("wakeupsdk", new com.igexin.push.core.a.a.k());
        b.put("startweb", new com.igexin.push.core.a.a.i());
        b.put("checkapp", new com.igexin.push.core.a.a.b());
        b.put("cleanext", new com.igexin.push.core.a.a.c());
        b.put("enablelog", new com.igexin.push.core.a.a.e());
        b.put("disablelog", new com.igexin.push.core.a.a.d());
    }

    private int F() {
        if (com.igexin.push.core.g.al.isEmpty() && com.igexin.push.core.g.q) {
            Cursor cursorA = com.igexin.push.core.f.a().i().a("message", new String[]{Downloads.COLUMN_STATUS}, new String[]{"0"}, null, null);
            if (cursorA != null) {
                while (cursorA.moveToNext()) {
                    try {
                        JSONObject jSONObject = new JSONObject(new String(com.igexin.a.b.a.c(cursorA.getBlob(cursorA.getColumnIndex("info")))));
                        String string = jSONObject.getString("id");
                        String string2 = jSONObject.getString("appid");
                        String string3 = jSONObject.getString("messageid");
                        String string4 = jSONObject.getString("taskid");
                        String string5 = jSONObject.getString("appkey");
                        String strA = a().a(string4, string3);
                        PushTaskBean pushTaskBean = new PushTaskBean();
                        pushTaskBean.setAppid(string2);
                        pushTaskBean.setMessageId(string3);
                        pushTaskBean.setTaskId(string4);
                        pushTaskBean.setId(string);
                        pushTaskBean.setAppKey(string5);
                        pushTaskBean.setCurrentActionid(1);
                        pushTaskBean.setStatus(cursorA.getInt(cursorA.getColumnIndex(Downloads.COLUMN_STATUS)));
                        if (jSONObject.has("cdnType")) {
                            pushTaskBean.setCDNType(jSONObject.getBoolean("cdnType"));
                        }
                        if (jSONObject.has("condition")) {
                            b(jSONObject, pushTaskBean);
                        }
                        com.igexin.push.core.g.al.put(strA, pushTaskBean);
                    } catch (JSONException e) {
                        e.printStackTrace();
                    }
                }
                cursorA.close();
            }
            com.igexin.push.core.g.q = false;
        }
        return com.igexin.push.core.g.al.size();
    }

    public static f a() {
        if (c == null) {
            c = new f();
        }
        return c;
    }

    private void a(int i, String str, String str2) {
        ContentValues contentValues = new ContentValues();
        contentValues.put(Downloads.COLUMN_STATUS, Integer.valueOf(i));
        com.igexin.push.core.f.a().i().a("message", contentValues, new String[]{"taskid"}, new String[]{str});
    }

    private void a(com.igexin.push.c.c.c cVar, PushTaskBean pushTaskBean, String str, String str2) {
        cVar.a(new com.igexin.push.e.b.c(pushTaskBean, str, k()));
        com.igexin.push.core.g.ao.put(str2, cVar);
    }

    private void a(com.igexin.push.core.bean.e eVar) {
        File file = new File(com.igexin.push.core.g.ac + "/" + eVar.c());
        File file2 = new File(com.igexin.push.core.g.ad + "/" + eVar.c());
        if (file2.exists()) {
            if (com.igexin.a.b.a.a(com.igexin.push.core.g.i, file2.getAbsolutePath()).equals(eVar.f())) {
                Intent intent = new Intent(com.igexin.push.core.g.i, (Class<?>) PushService.class);
                intent.putExtra("action", "com.igexin.sdk.action.extdownloadsuccess");
                intent.putExtra("id", eVar.a());
                intent.putExtra("result", true);
                com.igexin.push.core.g.i.startService(intent);
                return;
            }
            file2.delete();
        }
        if (!file.exists() || !com.igexin.a.b.a.a(com.igexin.push.core.g.i, file.getAbsolutePath()).equals(eVar.f()) || !a(file, file2, eVar.f())) {
            new Thread(new com.igexin.push.core.d.f(com.igexin.push.core.g.i, eVar)).start();
            return;
        }
        Intent intent2 = new Intent(com.igexin.push.core.g.i, (Class<?>) PushService.class);
        intent2.putExtra("action", "com.igexin.sdk.action.extdownloadsuccess");
        intent2.putExtra("id", eVar.a());
        intent2.putExtra("result", true);
        com.igexin.push.core.g.i.startService(intent2);
    }

    private void a(List list) {
        int i = 0;
        g gVar = new g(this);
        PackageManager packageManager = com.igexin.push.core.g.i.getPackageManager();
        List<PackageInfo> installedPackages = packageManager.getInstalledPackages(0);
        while (true) {
            int i2 = i;
            if (i2 >= installedPackages.size()) {
                Collections.sort(list, gVar);
                return;
            }
            try {
                PackageInfo packageInfo = installedPackages.get(i2);
                ApplicationInfo applicationInfo = packageInfo.applicationInfo;
                if ((applicationInfo.flags & 1) <= 0) {
                    com.igexin.push.core.bean.l lVar = new com.igexin.push.core.bean.l();
                    lVar.a(applicationInfo.loadLabel(packageManager).toString());
                    lVar.c(applicationInfo.packageName);
                    lVar.b(String.valueOf(packageInfo.versionCode));
                    list.add(lVar);
                }
            } catch (Exception e) {
            }
            i = i2 + 1;
        }
    }

    private boolean a(Class cls, Method method, String str) {
        try {
            return method.invoke(cls, str) != null;
        } catch (Exception e) {
            return true;
        }
    }

    private void b(List list) {
        if (list.size() <= 0) {
            return;
        }
        int i = 0;
        while (true) {
            int i2 = i;
            if (i2 >= list.size()) {
                return;
            }
            String str = (String) list.get(i2);
            PushTaskBean pushTaskBean = (PushTaskBean) com.igexin.push.core.g.al.get(str);
            pushTaskBean.setStatus(com.igexin.push.core.a.l);
            com.igexin.push.core.g.al.put(str, pushTaskBean);
            i = i2 + 1;
        }
    }

    private void b(JSONObject jSONObject, PushTaskBean pushTaskBean) {
        try {
            JSONObject jSONObject2 = jSONObject.getJSONObject("condition");
            HashMap map = new HashMap();
            if (jSONObject2.has("wifi")) {
                map.put("wifi", jSONObject2.getString("wifi"));
            }
            if (jSONObject2.has("screenOn")) {
                map.put("screenOn", jSONObject2.getString("screenOn"));
            }
            if (jSONObject2.has("ssid")) {
                map.put("ssid", jSONObject2.getString("ssid"));
                if (jSONObject2.has("bssid")) {
                    map.put("bssid", jSONObject2.getString("bssid"));
                }
            }
            if (jSONObject2.has("duration")) {
                String string = jSONObject2.getString("duration");
                if (string.contains("-")) {
                    int iIndexOf = string.indexOf("-");
                    String strSubstring = string.substring(0, iIndexOf);
                    String strSubstring2 = string.substring(iIndexOf + 1, string.length());
                    map.put("startTime", strSubstring);
                    map.put("endTime", strSubstring2);
                }
            }
            pushTaskBean.setConditionMap(map);
        } catch (JSONException e) {
            e.printStackTrace();
        }
    }

    private void h(String str) throws Throwable {
        FileOutputStream fileOutputStream;
        Throwable th;
        FileOutputStream fileOutputStream2 = null;
        try {
            File file = new File(com.igexin.push.core.g.aa);
            if (!file.exists()) {
                file.createNewFile();
            }
            fileOutputStream = new FileOutputStream(com.igexin.push.core.g.aa);
            try {
                fileOutputStream.write(com.igexin.a.b.a.a(str).getBytes());
                if (fileOutputStream != null) {
                    try {
                        fileOutputStream.close();
                    } catch (Exception e) {
                    }
                }
            } catch (Exception e2) {
                fileOutputStream2 = fileOutputStream;
                if (fileOutputStream2 != null) {
                    try {
                        fileOutputStream2.close();
                    } catch (Exception e3) {
                    }
                }
            } catch (Throwable th2) {
                th = th2;
                if (fileOutputStream != null) {
                    try {
                        fileOutputStream.close();
                    } catch (Exception e4) {
                    }
                }
                throw th;
            }
        } catch (Exception e5) {
        } catch (Throwable th3) {
            fileOutputStream = null;
            th = th3;
        }
    }

    private boolean i(String str) {
        try {
            com.igexin.push.core.g.i.getPackageManager().getPackageInfo(str, 0);
            return true;
        } catch (Exception e) {
            return false;
        }
    }

    public void A() {
        int i = com.igexin.push.core.g.aq - 100;
        if (i < 0) {
            com.igexin.push.core.g.aq = 0;
        } else {
            com.igexin.push.core.g.aq = i;
        }
        ArrayList arrayList = new ArrayList();
        long jCurrentTimeMillis = System.currentTimeMillis();
        for (Map.Entry entry : com.igexin.push.core.g.ap.entrySet()) {
            if (jCurrentTimeMillis - ((Long) entry.getValue()).longValue() > 3600000) {
                arrayList.add((String) entry.getKey());
            }
        }
        Iterator it = arrayList.iterator();
        while (it.hasNext()) {
            com.igexin.push.core.g.ap.remove((String) it.next());
        }
    }

    public void B() {
        if (com.igexin.push.core.g.R < System.currentTimeMillis()) {
            com.igexin.push.core.c.f.a().a(false);
        }
    }

    public void C() {
        if (!com.igexin.push.core.g.af) {
            com.igexin.push.core.g.af = com.igexin.a.a.b.d.c().a((com.igexin.a.a.d.d) com.igexin.push.e.b.d.g(), false, true);
        }
        if (!com.igexin.push.core.g.ag) {
            com.igexin.push.core.g.ag = com.igexin.a.a.b.d.c().a((com.igexin.a.a.d.d) com.igexin.push.e.b.f.g(), true, true);
        }
        if (!com.igexin.push.core.g.ah) {
            com.igexin.push.core.g.ah = com.igexin.a.a.b.d.c().a((com.igexin.a.a.d.d) com.igexin.push.e.b.e.g(), false, true);
        }
        if (!com.igexin.push.core.g.ai) {
            com.igexin.push.core.g.ai = com.igexin.a.a.b.d.c().a((com.igexin.a.a.d.d) com.igexin.push.e.b.g.g(), false, true);
        }
        if (!com.igexin.push.core.g.aj) {
            com.igexin.push.core.g.aj = com.igexin.a.a.b.d.c().a((com.igexin.a.a.d.d) com.igexin.push.e.b.a.g(), false, true);
        }
        if (com.igexin.push.core.g.ak) {
            return;
        }
        com.igexin.push.core.g.ak = com.igexin.a.a.b.d.c().a((com.igexin.a.a.d.d) com.igexin.push.e.b.b.g(), false, true);
    }

    public void D() throws Throwable {
        FileOutputStream fileOutputStream;
        Throwable th;
        FileOutputStream fileOutputStream2 = null;
        String str = "/data/data/" + com.igexin.push.core.g.g + "/files/init.pid";
        try {
            if (new File(str).exists()) {
                byte[] bytes = com.igexin.push.core.g.u.getBytes();
                byte[] bArr = new byte[bytes.length];
                for (int i = 0; i < bytes.length; i++) {
                    bArr[i] = (byte) (bytes[i] ^ com.igexin.push.core.g.ae[i]);
                }
                fileOutputStream = new FileOutputStream(str);
                try {
                    fileOutputStream.write(bArr);
                } catch (Exception e) {
                    fileOutputStream2 = fileOutputStream;
                    if (fileOutputStream2 != null) {
                        try {
                            fileOutputStream2.close();
                            return;
                        } catch (Exception e2) {
                            return;
                        }
                    }
                    return;
                } catch (Throwable th2) {
                    th = th2;
                    if (fileOutputStream != null) {
                        try {
                            fileOutputStream.close();
                        } catch (Exception e3) {
                        }
                    }
                    throw th;
                }
            } else {
                fileOutputStream = null;
            }
            if (fileOutputStream != null) {
                try {
                    fileOutputStream.close();
                } catch (Exception e4) {
                }
            }
        } catch (Exception e5) {
        } catch (Throwable th3) {
            fileOutputStream = null;
            th = th3;
        }
    }

    public boolean E() {
        try {
            if (PushBuildConfig.sdk_conf_debug_level.equals(com.igexin.push.a.k.y)) {
                return false;
            }
            for (String str : com.igexin.push.a.k.y.split(",")) {
                if (i(str)) {
                    return false;
                }
            }
            if (PushBuildConfig.sdk_conf_debug_level.equals(com.igexin.push.a.k.z)) {
                return false;
            }
            String[] strArrSplit = com.igexin.push.a.k.z.split(",");
            Class<?> cls = Class.forName("android.os.ServiceManager");
            Method method = cls.getMethod("getService", String.class);
            method.setAccessible(true);
            for (String str2 : strArrSplit) {
                if (a(cls, method, str2)) {
                    return false;
                }
            }
            return true;
        } catch (Exception e) {
            return false;
        }
    }

    public com.igexin.push.core.bean.f a(JSONObject jSONObject) throws JSONException {
        com.igexin.push.core.bean.f fVar = new com.igexin.push.core.bean.f();
        fVar.a(jSONObject.getString("version"));
        JSONArray jSONArray = jSONObject.getJSONArray("extensions");
        if (jSONArray == null || jSONArray.length() <= 0) {
            fVar.a(new HashMap());
        } else {
            HashMap map = new HashMap();
            int i = 0;
            while (true) {
                int i2 = i;
                if (i2 >= jSONArray.length()) {
                    break;
                }
                JSONObject jSONObject2 = (JSONObject) jSONArray.get(i2);
                com.igexin.push.core.bean.e eVar = new com.igexin.push.core.bean.e();
                eVar.a(jSONObject2.getInt("id"));
                eVar.a(jSONObject2.getString("version"));
                eVar.b(jSONObject2.getString("name"));
                eVar.c(jSONObject2.getString("cls_name"));
                eVar.d(jSONObject2.getString("url"));
                eVar.e(jSONObject2.getString("checksum"));
                eVar.f(jSONObject2.getString("key"));
                if (jSONObject2.has("isdestroy")) {
                    eVar.a(jSONObject2.getBoolean("isdestroy"));
                }
                if (jSONObject2.has("effective")) {
                    String string = jSONObject2.getString("effective");
                    long j = 0;
                    if (string != null && string.length() <= 13) {
                        j = Long.parseLong(string);
                    }
                    eVar.a(j);
                }
                if (jSONObject2.has("loadTime")) {
                    eVar.b(jSONObject2.getLong("loadTime"));
                }
                map.put(Integer.valueOf(eVar.a()), eVar);
                i = i2 + 1;
            }
            fVar.a(map);
        }
        return fVar;
    }

    public String a(String str, String str2) {
        return str + ":" + str2;
    }

    public String a(boolean z, int i) throws Throwable {
        Cursor cursorA;
        String str;
        Cursor cursor = null;
        String str2 = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date());
        try {
            if (i == -1) {
                str = str2 + "|" + com.igexin.push.core.g.C + "|register|" + com.igexin.push.core.g.v;
            } else if (i == 0) {
                cursorA = z ? com.igexin.push.core.f.a().i().a("bi", new String[]{"type"}, new String[]{"1", Consts.BITYPE_UPDATE}, null, null) : com.igexin.push.core.f.a().i().a("bi", new String[]{"type"}, new String[]{Consts.BITYPE_UPDATE}, null, null);
                if (cursorA != null) {
                    str = null;
                    while (cursorA.moveToNext()) {
                        try {
                            int i2 = cursorA.getInt(cursorA.getColumnIndexOrThrow("start_service_count"));
                            int i3 = cursorA.getInt(cursorA.getColumnIndexOrThrow("login_count"));
                            int i4 = cursorA.getInt(cursorA.getColumnIndexOrThrow("loginerror_nonetwork_count"));
                            int i5 = cursorA.getInt(cursorA.getColumnIndexOrThrow("loginerror_connecterror_count"));
                            int i6 = cursorA.getInt(cursorA.getColumnIndexOrThrow("online_time"));
                            int i7 = cursorA.getInt(cursorA.getColumnIndexOrThrow("network_time"));
                            int i8 = cursorA.getInt(cursorA.getColumnIndexOrThrow("running_time"));
                            String str3 = cursorA.getString(cursorA.getColumnIndexOrThrow("create_time")) + " 00:00:00";
                            str = str == null ? str3 + "|" + com.igexin.push.core.g.C + "|startservice|" + i2 + "\n" + str3 + "|" + com.igexin.push.core.g.C + "|login|" + i3 + "\n" + str3 + "|" + com.igexin.push.core.g.C + "|loginerror-nonetwork|" + i4 + "\n" + str3 + "|" + com.igexin.push.core.g.C + "|loginerror-connecterror|" + i5 + "\n" + str3 + "|" + com.igexin.push.core.g.C + "|online|" + i6 + "\n" + str3 + "|" + com.igexin.push.core.g.C + "|network|" + i7 + "\n" + str3 + "|" + com.igexin.push.core.g.C + "|running|" + i8 : str + "\n" + str3 + "|" + com.igexin.push.core.g.C + "|startservice|" + i2 + "\n" + str3 + "|" + com.igexin.push.core.g.C + "|login|" + i3 + "\n" + str3 + "|" + com.igexin.push.core.g.C + "|loginerror-nonetwork|" + i4 + "\n" + str3 + "|" + com.igexin.push.core.g.C + "|loginerror-connecterror|" + i5 + "\n" + str3 + "|" + com.igexin.push.core.g.C + "|online|" + i6 + "\n" + str3 + "|" + com.igexin.push.core.g.C + "|network|" + i7 + "\n" + str3 + "|" + com.igexin.push.core.g.C + "|running|" + i8;
                        } catch (Exception e) {
                            cursor = cursorA;
                            if (cursor != null) {
                                cursor.close();
                            }
                        } catch (Throwable th) {
                            th = th;
                            if (cursorA != null) {
                                cursorA.close();
                            }
                            throw th;
                        }
                    }
                } else {
                    str = null;
                }
                cursor = cursorA;
            } else if (i == 1) {
                long j = com.igexin.push.core.i.a().a;
                if (com.igexin.push.a.k.h > 0) {
                    j = com.igexin.push.a.k.h * PipawSDK.PAY_CANCEL;
                }
                str = str2 + "|" + com.igexin.push.core.g.u + "|" + com.igexin.push.core.g.c + "|" + com.igexin.push.core.g.l + "|" + (com.igexin.push.a.k.e + "," + com.igexin.push.a.k.f) + "|" + j + "|";
            } else {
                str = i == 4 ? str2 + "|" + com.igexin.push.core.g.u + "|" + com.igexin.push.core.g.c + "|" : i == 5 ? str2 + "|" + com.igexin.push.core.g.u + "|" + com.igexin.push.core.g.c : null;
            }
            if (cursor != null) {
                cursor.close();
            }
        } catch (Exception e2) {
            str = null;
        } catch (Throwable th2) {
            th = th2;
            cursorA = null;
        }
        return str;
    }

    public void a(int i) {
        Intent intent = new Intent();
        intent.setAction("com.igexin.sdk.action." + com.igexin.push.core.g.c);
        Bundle bundle = new Bundle();
        bundle.putInt("action", PushConsts.GET_SDKSERVICEPID);
        bundle.putInt("pid", i);
        intent.putExtras(bundle);
        com.igexin.push.core.f.a().a(intent);
    }

    public void a(int i, int i2, String str) {
        com.igexin.push.a.k.e = i;
        com.igexin.push.a.k.f = i2;
        com.igexin.push.a.a.a().b();
        com.igexin.push.e.b.g.g().h();
    }

    public void a(int i, String str) {
        com.igexin.push.a.k.h = i;
        com.igexin.push.a.a.a().c();
        if (com.igexin.push.core.g.o) {
            com.igexin.a.a.c.a.a("setHeartbeatInterval heartbeatReq");
            if (System.currentTimeMillis() - com.igexin.push.core.g.U > 5000) {
                com.igexin.push.core.g.U = System.currentTimeMillis();
                f();
            }
        }
    }

    public void a(Intent intent) {
        if (intent != null) {
            com.igexin.push.core.f.a().a(false);
            if (intent.hasExtra("op_app")) {
                com.igexin.push.core.g.E = intent.getStringExtra("op_app");
            } else {
                com.igexin.push.core.g.E = StatConstants.MTA_COOPERATION_TAG;
            }
            if (com.igexin.push.core.g.o) {
                l();
            }
        }
    }

    public void a(Bundle bundle) {
        String string = bundle.getString("action");
        if (string.equals("setTag")) {
            if (com.igexin.push.a.k.n) {
                c(bundle.getString("tags"));
                return;
            }
            return;
        }
        if (string.equals("setSilentTime")) {
            if (com.igexin.push.a.k.o) {
                a(bundle.getInt("beginHour", 0), bundle.getInt("duration", 0), com.igexin.push.core.g.i.getPackageName());
                return;
            }
            return;
        }
        if (string.equals("sendMessage")) {
            if (com.igexin.push.a.k.m) {
                a(bundle.getString("taskid"), bundle.getByteArray("extraData"));
                return;
            }
            return;
        }
        if (string.equals("stopService")) {
            com.igexin.push.core.f.a().a(com.igexin.push.core.g.i.getPackageName());
            return;
        }
        if (string.equals("setHeartbeatInterval")) {
            if (com.igexin.push.a.k.p) {
                a(bundle.getInt("interval", 0), com.igexin.push.core.g.i.getPackageName());
                return;
            }
            return;
        }
        if (string.equals("setSocketTimeout")) {
            if (com.igexin.push.a.k.q) {
                b(bundle.getInt("timeout", 0), com.igexin.push.core.g.i.getPackageName());
                return;
            }
            return;
        }
        if (!string.equals("sendFeedbackMessage")) {
            if (string.equals("turnOffPush")) {
                com.igexin.push.core.f.a().b(com.igexin.push.core.g.i.getPackageName());
                return;
            }
            return;
        }
        if (!com.igexin.push.a.k.w || com.igexin.push.core.g.aq > 200) {
            return;
        }
        String string2 = bundle.getString("taskid");
        String string3 = bundle.getString("messageid");
        String string4 = bundle.getString("actionid");
        String str = string2 + ":" + string3 + ":" + string4;
        if (com.igexin.push.core.g.ap.get(str) == null) {
            long jCurrentTimeMillis = System.currentTimeMillis();
            PushTaskBean pushTaskBean = new PushTaskBean();
            pushTaskBean.setTaskId(string2);
            pushTaskBean.setMessageId(string3);
            pushTaskBean.setAppid(com.igexin.push.core.g.c);
            pushTaskBean.setAppKey(com.igexin.push.core.g.d);
            a(pushTaskBean, string4);
            com.igexin.push.core.g.aq++;
            com.igexin.push.core.g.ap.put(str, Long.valueOf(jCurrentTimeMillis));
        }
    }

    public void a(PushTaskBean pushTaskBean) {
        com.igexin.push.c.c.c cVar = new com.igexin.push.c.c.c();
        cVar.a();
        cVar.c = "RCV" + pushTaskBean.getMessageId();
        cVar.d = com.igexin.push.core.g.u;
        cVar.a = (int) System.currentTimeMillis();
        com.igexin.push.core.f.a().e().a("C-" + com.igexin.push.core.g.u, cVar);
        com.igexin.a.a.c.a.a("cdnreceive|" + pushTaskBean.getTaskId() + "|" + pushTaskBean.getMessageId());
    }

    public void a(PushTaskBean pushTaskBean, String str) {
        if (pushTaskBean.isCDNType()) {
            b(pushTaskBean, str);
        } else {
            a(pushTaskBean, str, "ok");
        }
    }

    public void a(PushTaskBean pushTaskBean, String str, String str2) {
        long jCurrentTimeMillis = System.currentTimeMillis();
        String str3 = "{\"action\":\"pushmessage_feedback\",\"appid\":\"" + pushTaskBean.getAppid() + "\", \"id\":\"" + jCurrentTimeMillis + "\", \"appkey\":\"" + pushTaskBean.getAppKey() + "\", \"messageid\":\"" + pushTaskBean.getMessageId() + "\",\"taskid\":\"" + pushTaskBean.getTaskId() + "\",\"actionid\": \"" + str + "\",\"result\":\"" + str2 + "\",\"timestamp\":\"" + System.currentTimeMillis() + "\"}";
        com.igexin.push.c.c.d dVar = new com.igexin.push.c.c.d();
        dVar.a();
        dVar.a = (int) jCurrentTimeMillis;
        dVar.d = "17258000";
        dVar.e = str3;
        dVar.g = com.igexin.push.core.g.u;
        com.igexin.push.core.f.a().e().a("C-" + com.igexin.push.core.g.u, dVar);
        com.igexin.push.core.c.c cVarA = com.igexin.push.core.c.c.a();
        if (cVarA != null) {
            cVarA.a(new com.igexin.push.core.bean.i(jCurrentTimeMillis, str3, (byte) 3, jCurrentTimeMillis));
        }
        com.igexin.a.a.c.a.a("feedback|" + pushTaskBean.getTaskId() + "|" + pushTaskBean.getMessageId() + "|" + str);
    }

    public void a(com.igexin.push.core.bean.f fVar) {
        boolean z;
        com.igexin.push.core.g.as = 0;
        com.igexin.push.core.g.at = 0;
        com.igexin.push.core.g.av = fVar;
        Map mapB = fVar.b();
        if (com.igexin.push.a.k.x == null) {
            Iterator it = mapB.entrySet().iterator();
            while (it.hasNext()) {
                com.igexin.push.core.bean.e eVar = (com.igexin.push.core.bean.e) ((Map.Entry) it.next()).getValue();
                com.igexin.push.core.g.as++;
                a(eVar);
            }
            return;
        }
        Map mapB2 = com.igexin.push.a.k.x.b();
        ArrayList arrayList = new ArrayList();
        for (Map.Entry entry : mapB2.entrySet()) {
            int iIntValue = ((Integer) entry.getKey()).intValue();
            com.igexin.push.core.bean.e eVar2 = (com.igexin.push.core.bean.e) entry.getValue();
            if (!mapB.containsKey(Integer.valueOf(iIntValue))) {
                com.igexin.push.core.g.aw = true;
                File file = new File(com.igexin.push.core.g.ad + "/" + eVar2.c());
                if (file.exists()) {
                    file.delete();
                }
                arrayList.add(Integer.valueOf(iIntValue));
            }
        }
        if (arrayList != null && arrayList.size() > 0) {
            Iterator it2 = arrayList.iterator();
            while (it2.hasNext()) {
                mapB2.remove(Integer.valueOf(((Integer) it2.next()).intValue()));
            }
            com.igexin.push.a.a.a().g();
        }
        boolean z2 = true;
        for (Map.Entry entry2 : mapB.entrySet()) {
            int iIntValue2 = ((Integer) entry2.getKey()).intValue();
            com.igexin.push.core.bean.e eVar3 = (com.igexin.push.core.bean.e) entry2.getValue();
            if (mapB2.containsKey(Integer.valueOf(iIntValue2))) {
                if (!((com.igexin.push.core.bean.e) mapB2.get(Integer.valueOf(iIntValue2))).b().equals(eVar3.b())) {
                    com.igexin.push.core.g.aw = true;
                    com.igexin.push.core.g.as++;
                    a(eVar3);
                    z2 = false;
                }
                z = z2;
            } else {
                com.igexin.push.core.g.as++;
                a(eVar3);
                z = false;
            }
            z2 = z;
        }
        if (z2) {
            com.igexin.push.a.k.x.a(fVar.a());
            com.igexin.push.a.a.a().g();
            Process.killProcess(Process.myPid());
        }
    }

    public void a(String str) {
        com.igexin.push.c.c.d dVar = new com.igexin.push.c.c.d();
        dVar.a();
        dVar.a = (int) System.currentTimeMillis();
        dVar.d = "17258000";
        dVar.e = "{\"action\":\"received\",\"id\":\"" + str + "\"}";
        dVar.g = com.igexin.push.core.g.u;
        com.igexin.push.core.f.a().e().a("C-" + com.igexin.push.core.g.u, dVar);
    }

    public void a(String str, com.igexin.push.c.c.a aVar, PushTaskBean pushTaskBean) {
        com.igexin.a.a.b.d.c().a((com.igexin.a.a.d.d) new com.igexin.push.e.a.a(new com.igexin.push.core.d.b(str, aVar, pushTaskBean)), false, true);
    }

    public void a(String str, String str2, String str3, String str4) {
        Intent intent = new Intent("com.igexin.sdk.action.execute");
        intent.putExtra("taskid", str);
        intent.putExtra("messageid", str2);
        intent.putExtra("appid", com.igexin.push.core.g.c);
        intent.putExtra("pkgname", com.igexin.push.core.g.g);
        com.igexin.push.core.f.a().a(intent);
    }

    public void a(String str, String str2, String str3, String str4, long j) {
        Intent intent = new Intent();
        intent.setAction("com.igexin.sdk.action." + com.igexin.push.core.g.c);
        Bundle bundle = new Bundle();
        bundle.putInt("action", PushConsts.THIRDPART_FEEDBACK);
        bundle.putString("appid", str);
        bundle.putString("taskid", str2);
        bundle.putString("actionid", str3);
        bundle.putString("result", str4);
        bundle.putLong("timestamp", j);
        intent.putExtras(bundle);
        com.igexin.push.core.f.a().a(intent);
    }

    public void a(String str, byte[] bArr) {
        if (com.igexin.push.core.g.u != null) {
            JSONObject jSONObject = new JSONObject();
            long jCurrentTimeMillis = System.currentTimeMillis();
            try {
                jSONObject.put("action", "sendmessage");
                jSONObject.put("id", String.valueOf(jCurrentTimeMillis));
                jSONObject.put("cid", com.igexin.push.core.g.u);
                jSONObject.put("appid", com.igexin.push.core.g.c);
                jSONObject.put("taskid", str);
                String string = jSONObject.toString();
                com.igexin.push.core.c.c.a().a(new com.igexin.push.core.bean.i(jCurrentTimeMillis, string, (byte) 6, jCurrentTimeMillis));
                com.igexin.push.c.c.d dVar = new com.igexin.push.c.c.d();
                dVar.a();
                dVar.a = (int) jCurrentTimeMillis;
                dVar.d = com.igexin.push.core.g.u;
                dVar.e = string;
                dVar.f = bArr;
                dVar.g = com.igexin.push.core.g.u;
                com.igexin.push.core.f.a().e().a("C-" + com.igexin.push.core.g.u, dVar);
            } catch (JSONException e) {
            }
        }
    }

    @Override // com.igexin.push.d.k
    public void a(boolean z) {
    }

    public void a(byte[] bArr) throws Throwable {
        String string;
        com.igexin.push.core.bean.f fVarA;
        try {
            JSONObject jSONObject = new JSONObject(new String(com.igexin.a.b.a.c(Base64.decode(bArr, 0))));
            if (jSONObject.has("result") && "ok".equals(jSONObject.getString("result"))) {
                com.igexin.push.core.c.f.a().f(System.currentTimeMillis());
                if (jSONObject.has("config")) {
                    JSONObject jSONObject2 = new JSONObject(jSONObject.getString("config"));
                    if (jSONObject2.has("sdk.uploadapplist.enable")) {
                        String string2 = jSONObject2.getString("sdk.uploadapplist.enable");
                        if (string2.equals("true") || string2.equals("false")) {
                            com.igexin.push.a.k.l = Boolean.valueOf(string2).booleanValue();
                        }
                    }
                    if (jSONObject2.has("sdk.feature.sendmessage.enable")) {
                        String string3 = jSONObject2.getString("sdk.feature.sendmessage.enable");
                        if (string3.equals("true") || string3.equals("false")) {
                            com.igexin.push.a.k.m = Boolean.valueOf(string3).booleanValue();
                        }
                    }
                    if (jSONObject2.has("sdk.readlocalcell.enable")) {
                        String string4 = jSONObject2.getString("sdk.readlocalcell.enable");
                        if (string4.equals("true") || string4.equals("false")) {
                            com.igexin.push.a.k.k = Boolean.valueOf(string4).booleanValue();
                        }
                    }
                    if (jSONObject2.has("sdk.ca.enable")) {
                        String string5 = jSONObject2.getString("sdk.ca.enable");
                        if (string5.equals("true") || string5.equals("false")) {
                            com.igexin.push.a.k.r = Boolean.valueOf(string5).booleanValue();
                        }
                    }
                    if (jSONObject2.has("sdk.snl.enable")) {
                        String string6 = jSONObject2.getString("sdk.snl.enable");
                        if (string6.equals("true") || string6.equals("false")) {
                            com.igexin.push.a.k.s = Boolean.valueOf(string6).booleanValue();
                        }
                    }
                    if (jSONObject2.has("sdk.domainbackup.enable")) {
                        String string7 = jSONObject2.getString("sdk.domainbackup.enable");
                        if (string7.equals("true") || string7.equals("false")) {
                            com.igexin.push.a.k.j = Boolean.valueOf(string7).booleanValue();
                        }
                    }
                    if (jSONObject2.has("sdk.feature.setsilenttime.enable")) {
                        String string8 = jSONObject2.getString("sdk.feature.setsilenttime.enable");
                        if (string8.equals("true") || string8.equals("false")) {
                            com.igexin.push.a.k.o = Boolean.valueOf(string8).booleanValue();
                            if (!com.igexin.push.a.k.o && com.igexin.push.a.k.f != 0) {
                                a(12, 0, "server");
                            }
                        }
                    }
                    if (jSONObject2.has("sdk.snl.maxactiveflow")) {
                        try {
                            com.igexin.push.a.k.t = Integer.parseInt(jSONObject2.getString("sdk.snl.maxactiveflow"));
                        } catch (Exception e) {
                        }
                    }
                    if (jSONObject2.has("sdk.feature.settag.enable")) {
                        String string9 = jSONObject2.getString("sdk.feature.settag.enable");
                        if (string9.equals("true") || string9.equals("false")) {
                            com.igexin.push.a.k.n = Boolean.valueOf(string9).booleanValue();
                        }
                    }
                    if (jSONObject2.has("sdk.feature.setheartbeatinterval.enable")) {
                        String string10 = jSONObject2.getString("sdk.feature.setheartbeatinterval.enable");
                        if (string10.equals("true") || string10.equals("false")) {
                            com.igexin.push.a.k.p = Boolean.valueOf(string10).booleanValue();
                        }
                    }
                    if (jSONObject2.has("sdk.feature.setsockettimeout.enable")) {
                        String string11 = jSONObject2.getString("sdk.feature.setsockettimeout.enable");
                        if (string11.equals("true") || string11.equals("false")) {
                            com.igexin.push.a.k.q = Boolean.valueOf(string11).booleanValue();
                        }
                    }
                    if (jSONObject2.has("sdk.guard.enable")) {
                        String string12 = jSONObject2.getString("sdk.guard.enable");
                        if (string12.equals("true") || string12.equals("false")) {
                            com.igexin.push.a.k.u = Boolean.valueOf(string12).booleanValue();
                        }
                    }
                    if (jSONObject2.has("sdk.wakeupsdk.enable")) {
                        String string13 = jSONObject2.getString("sdk.wakeupsdk.enable");
                        if (string13.equals("true") || string13.equals("false")) {
                            com.igexin.push.a.k.v = Boolean.valueOf(string13).booleanValue();
                        }
                    }
                    if (jSONObject2.has("sdk.feature.feedback.enable")) {
                        String string14 = jSONObject2.getString("sdk.feature.feedback.enable");
                        if (string14.equals("true") || string14.equals("false")) {
                            com.igexin.push.a.k.w = Boolean.valueOf(string14).booleanValue();
                        }
                    }
                    if (jSONObject2.has("sdk.watchout.app")) {
                        com.igexin.push.a.k.y = jSONObject2.getString("sdk.watchout.app");
                    }
                    if (jSONObject2.has("sdk.watchout.service")) {
                        com.igexin.push.a.k.z = jSONObject2.getString("sdk.watchout.service");
                    }
                    if (jSONObject2.has("sdk.daemon.enable")) {
                        String string15 = jSONObject2.getString("sdk.daemon.enable");
                        if (string15.equals("true") || string15.equals("false")) {
                            com.igexin.push.a.k.A = Boolean.valueOf(string15).booleanValue();
                        }
                    }
                    if (jSONObject2.has("ext_infos") && (string = jSONObject2.getString("ext_infos")) != null && !StatConstants.MTA_COOPERATION_TAG.equals(string)) {
                        JSONObject jSONObject3 = new JSONObject(string);
                        if (jSONObject3.has("version")) {
                            if ((com.igexin.push.a.k.x == null || !jSONObject3.getString("version").equals(com.igexin.push.a.k.x.a())) && (fVarA = a(jSONObject3)) != null) {
                                Message message = new Message();
                                message.what = com.igexin.push.core.a.i;
                                message.obj = fVarA;
                                com.igexin.push.core.f.a().a(message);
                            }
                        }
                    }
                    com.igexin.push.a.a.a().f();
                }
            }
        } catch (Exception e2) {
            f(e2.toString());
        }
    }

    public boolean a(long j) {
        Date date = new Date(j);
        Calendar calendar = Calendar.getInstance();
        calendar.setTime(date);
        int i = calendar.get(11);
        int i2 = com.igexin.push.a.k.e + com.igexin.push.a.k.f;
        if (i2 >= 24) {
            i2 -= 24;
        }
        if (com.igexin.push.a.k.f == 0) {
            return false;
        }
        if (com.igexin.push.a.k.e < i2) {
            if (i >= com.igexin.push.a.k.e && i < i2) {
                return true;
            }
        } else if (com.igexin.push.a.k.e > i2) {
            if (i >= 0 && i < i2) {
                return true;
            }
            if (i >= com.igexin.push.a.k.e && i < 24) {
                return true;
            }
        }
        return false;
    }

    @Override // com.igexin.push.core.a.a
    public boolean a(com.igexin.a.a.d.d dVar) {
        switch (dVar.b()) {
            case -2047:
                com.igexin.a.a.c.a.a("disconnected|network");
                com.igexin.push.core.i.a().a(com.igexin.push.core.k.NETWORK_ERROR);
                com.igexin.push.core.c.r.d();
                if ((dVar.N instanceof ClosedChannelException) || (dVar.N instanceof SocketTimeoutException) || (dVar.N instanceof UnknownHostException) || (dVar.N instanceof UnresolvedAddressException) || (dVar.N instanceof UnknownServiceException)) {
                    com.igexin.push.core.c.r.a();
                }
                if (com.igexin.push.core.g.l && com.igexin.push.core.g.m) {
                    if (com.igexin.push.core.g.o) {
                        com.igexin.push.core.g.o = false;
                        m();
                    }
                    com.igexin.push.core.f.a().e().c(false);
                } else if (com.igexin.push.core.g.o) {
                    com.igexin.push.core.g.o = false;
                    m();
                }
                break;
            case -2046:
            default:
                return true;
            case -2045:
                com.igexin.a.a.c.a.a("disconnected|user");
                com.igexin.push.core.c.r.d();
                if (com.igexin.push.core.g.o) {
                    com.igexin.push.core.g.o = false;
                    m();
                }
                break;
        }
        return false;
    }

    @Override // com.igexin.push.d.k
    public boolean a(com.igexin.push.c.c.e eVar) {
        if (eVar == null) {
            return false;
        }
        a aVar = (a) a.get(Integer.valueOf(eVar.i));
        if (aVar != null) {
            aVar.a(eVar);
        }
        com.igexin.push.e.b.d.g().h();
        return true;
    }

    /* JADX WARN: Removed duplicated region for block: B:51:0x0092 A[Catch: Exception -> 0x009b, TryCatch #9 {Exception -> 0x009b, blocks: (B:49:0x008d, B:51:0x0092, B:53:0x0097), top: B:79:0x008d }] */
    /* JADX WARN: Removed duplicated region for block: B:53:0x0097 A[Catch: Exception -> 0x009b, TRY_LEAVE, TryCatch #9 {Exception -> 0x009b, blocks: (B:49:0x008d, B:51:0x0092, B:53:0x0097), top: B:79:0x008d }] */
    /* JADX WARN: Removed duplicated region for block: B:79:0x008d A[EXC_TOP_SPLITTER, SYNTHETIC] */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public boolean a(java.io.File r10, java.io.File r11, java.lang.String r12) throws java.lang.Throwable {
        /*
            r9 = this;
            r2 = 0
            r0 = 0
            java.io.FileInputStream r4 = new java.io.FileInputStream     // Catch: java.lang.Throwable -> L87 java.lang.Exception -> Lac
            r4.<init>(r10)     // Catch: java.lang.Throwable -> L87 java.lang.Exception -> Lac
            java.io.FileOutputStream r3 = new java.io.FileOutputStream     // Catch: java.lang.Throwable -> L9d java.lang.Exception -> Lb1
            r3.<init>(r11)     // Catch: java.lang.Throwable -> L9d java.lang.Exception -> Lb1
            java.io.BufferedOutputStream r1 = new java.io.BufferedOutputStream     // Catch: java.lang.Throwable -> La1 java.lang.Exception -> Lb6
            r1.<init>(r3)     // Catch: java.lang.Throwable -> La1 java.lang.Exception -> Lb6
            r2 = 1024(0x400, float:1.435E-42)
            byte[] r2 = new byte[r2]     // Catch: java.lang.Exception -> L27 java.lang.Throwable -> La4
        L15:
            int r5 = r4.read(r2)     // Catch: java.lang.Exception -> L27 java.lang.Throwable -> La4
            r6 = -1
            if (r5 == r6) goto L43
            byte[] r6 = new byte[r5]     // Catch: java.lang.Exception -> L27 java.lang.Throwable -> La4
            r7 = 0
            r8 = 0
            java.lang.System.arraycopy(r2, r7, r6, r8, r5)     // Catch: java.lang.Exception -> L27 java.lang.Throwable -> La4
            r1.write(r6)     // Catch: java.lang.Exception -> L27 java.lang.Throwable -> La4
            goto L15
        L27:
            r2 = move-exception
            r2 = r3
            r3 = r4
        L2a:
            boolean r4 = r11.exists()     // Catch: java.lang.Throwable -> La6
            if (r4 == 0) goto L33
            r11.delete()     // Catch: java.lang.Throwable -> La6
        L33:
            if (r3 == 0) goto L38
            r3.close()     // Catch: java.lang.Exception -> Laa
        L38:
            if (r1 == 0) goto L3d
            r1.close()     // Catch: java.lang.Exception -> Laa
        L3d:
            if (r2 == 0) goto L42
            r2.close()     // Catch: java.lang.Exception -> Laa
        L42:
            return r0
        L43:
            r4.close()     // Catch: java.lang.Exception -> L27 java.lang.Throwable -> La4
            r1.flush()     // Catch: java.lang.Exception -> L27 java.lang.Throwable -> La4
            r1.close()     // Catch: java.lang.Exception -> L27 java.lang.Throwable -> La4
            r3.close()     // Catch: java.lang.Exception -> L27 java.lang.Throwable -> La4
            android.content.Context r2 = com.igexin.push.core.g.i     // Catch: java.lang.Exception -> L27 java.lang.Throwable -> La4
            java.lang.String r5 = r11.getAbsolutePath()     // Catch: java.lang.Exception -> L27 java.lang.Throwable -> La4
            java.lang.String r2 = com.igexin.a.b.a.a(r2, r5)     // Catch: java.lang.Exception -> L27 java.lang.Throwable -> La4
            boolean r2 = r2.equals(r12)     // Catch: java.lang.Exception -> L27 java.lang.Throwable -> La4
            if (r2 != 0) goto L74
            r11.delete()     // Catch: java.lang.Exception -> L27 java.lang.Throwable -> La4
            if (r4 == 0) goto L67
            r4.close()     // Catch: java.lang.Exception -> L72
        L67:
            if (r1 == 0) goto L6c
            r1.close()     // Catch: java.lang.Exception -> L72
        L6c:
            if (r3 == 0) goto L42
            r3.close()     // Catch: java.lang.Exception -> L72
            goto L42
        L72:
            r1 = move-exception
            goto L42
        L74:
            r0 = 1
            if (r4 == 0) goto L7a
            r4.close()     // Catch: java.lang.Exception -> L85
        L7a:
            if (r1 == 0) goto L7f
            r1.close()     // Catch: java.lang.Exception -> L85
        L7f:
            if (r3 == 0) goto L42
            r3.close()     // Catch: java.lang.Exception -> L85
            goto L42
        L85:
            r1 = move-exception
            goto L42
        L87:
            r0 = move-exception
            r1 = r2
            r3 = r2
            r4 = r2
        L8b:
            if (r4 == 0) goto L90
            r4.close()     // Catch: java.lang.Exception -> L9b
        L90:
            if (r1 == 0) goto L95
            r1.close()     // Catch: java.lang.Exception -> L9b
        L95:
            if (r3 == 0) goto L9a
            r3.close()     // Catch: java.lang.Exception -> L9b
        L9a:
            throw r0
        L9b:
            r1 = move-exception
            goto L9a
        L9d:
            r0 = move-exception
            r1 = r2
            r3 = r2
            goto L8b
        La1:
            r0 = move-exception
            r1 = r2
            goto L8b
        La4:
            r0 = move-exception
            goto L8b
        La6:
            r0 = move-exception
            r4 = r3
            r3 = r2
            goto L8b
        Laa:
            r1 = move-exception
            goto L42
        Lac:
            r1 = move-exception
            r1 = r2
            r3 = r2
            goto L2a
        Lb1:
            r1 = move-exception
            r1 = r2
            r3 = r4
            goto L2a
        Lb6:
            r1 = move-exception
            r1 = r2
            r2 = r3
            r3 = r4
            goto L2a
        */
        throw new UnsupportedOperationException("Method not decompiled: com.igexin.push.core.a.f.a(java.io.File, java.io.File, java.lang.String):boolean");
    }

    @Override // com.igexin.push.core.a.a
    public boolean a(Object obj) {
        com.igexin.push.d.j jVarE = com.igexin.push.core.f.a().e();
        if ((obj instanceof com.igexin.push.c.c.e) && jVarE != null) {
            jVarE.a((com.igexin.push.c.c.e) obj);
        } else if (obj instanceof com.igexin.a.a.b.a.a.b) {
            if (com.igexin.push.core.g.o) {
                com.igexin.push.core.g.o = false;
                m();
            }
        } else if (!(obj instanceof com.igexin.a.a.b.a.a.a)) {
            if (obj instanceof com.igexin.push.c.b.a) {
                jVarE.c(false);
            } else if (obj instanceof com.igexin.push.c.b.b) {
                jVarE.c(true);
            }
        }
        return true;
    }

    public boolean a(String str, String str2, String str3) {
        Bundle bundle = new Bundle();
        bundle.putString("taskid", str);
        bundle.putString("messageid", str2);
        bundle.putString("actionid", str3);
        Message message = new Message();
        message.what = com.igexin.push.core.a.h;
        message.obj = bundle;
        return com.igexin.push.core.f.a().a(message);
    }

    public boolean a(JSONObject jSONObject, PushTaskBean pushTaskBean) {
        BaseAction baseActionA;
        com.igexin.push.core.a.a.a aVar;
        boolean z;
        ArrayList arrayList = new ArrayList();
        try {
            JSONArray jSONArray = jSONObject.getJSONArray("action_chains");
            for (int i = 0; i < jSONArray.length(); i++) {
                String string = ((JSONObject) jSONArray.get(i)).getString("type");
                if (string != null) {
                    Iterator it = com.igexin.push.extension.a.a().c().iterator();
                    while (true) {
                        if (!it.hasNext()) {
                            z = false;
                            break;
                        }
                        if (((IPushExtension) it.next()).isActionSupported(string)) {
                            z = true;
                            break;
                        }
                    }
                    if (!z && b.get(string) == null) {
                        return false;
                    }
                }
            }
            for (int i2 = 0; i2 < jSONArray.length(); i2++) {
                JSONObject jSONObject2 = (JSONObject) jSONArray.get(i2);
                String string2 = jSONObject2.getString("type");
                if (string2 != null) {
                    BaseAction action = null;
                    Iterator it2 = com.igexin.push.extension.a.a().c().iterator();
                    while (it2.hasNext() && (action = ((IPushExtension) it2.next()).parseAction(jSONObject2)) == null) {
                    }
                    if (action != null || (aVar = (com.igexin.push.core.a.a.a) b.get(string2)) == null) {
                        baseActionA = action;
                    } else {
                        baseActionA = aVar.a(jSONObject2);
                        if (baseActionA != null) {
                            baseActionA.setSupportExt(false);
                        }
                    }
                    if (baseActionA == null) {
                        return false;
                    }
                    arrayList.add(baseActionA);
                }
            }
        } catch (JSONException e) {
        }
        pushTaskBean.setActionChains(arrayList);
        return true;
    }

    public boolean a(JSONObject jSONObject, byte[] bArr, boolean z) throws Throwable {
        Cursor cursorA;
        Cursor cursor;
        try {
            if (jSONObject.has("action") && jSONObject.getString("action").equals("pushmessage")) {
                String string = jSONObject.getString("id");
                String string2 = jSONObject.getString("appid");
                String string3 = jSONObject.getString("messageid");
                String string4 = jSONObject.getString("taskid");
                String string5 = jSONObject.getString("appkey");
                JSONArray jSONArray = jSONObject.getJSONArray("action_chains");
                com.igexin.a.a.c.a.a("pushmessage|" + string4 + "|" + string3 + "|" + string2 + "|" + z);
                if (string2 != null && string != null && string3 != null && string4 != null && jSONArray != null && string2.equals(com.igexin.push.core.g.c)) {
                    PushTaskBean pushTaskBean = new PushTaskBean();
                    pushTaskBean.setAppid(string2);
                    pushTaskBean.setMessageId(string3);
                    pushTaskBean.setTaskId(string4);
                    pushTaskBean.setId(string);
                    pushTaskBean.setAppKey(string5);
                    pushTaskBean.setCurrentActionid(1);
                    if (jSONObject.has("cdnType")) {
                        pushTaskBean.setCDNType(jSONObject.getBoolean("cdnType"));
                    }
                    String strA = a().a(string4, string3);
                    if (z) {
                        a().a(pushTaskBean, "0");
                        if (a().a(System.currentTimeMillis())) {
                            return true;
                        }
                    }
                    ContentValues contentValues = new ContentValues();
                    contentValues.put("messageid", string3);
                    contentValues.put("taskid", string4);
                    contentValues.put("appid", string2);
                    contentValues.put("key", "CACHE_" + strA);
                    contentValues.put("info", com.igexin.a.b.a.b(jSONObject.toString().getBytes()));
                    contentValues.put("createtime", Long.valueOf(System.currentTimeMillis()));
                    if (bArr != null) {
                        contentValues.put("msgextra", bArr);
                        pushTaskBean.setMsgExtra(bArr);
                    }
                    if (jSONArray.length() > 0 && !a().a(jSONObject, pushTaskBean)) {
                        return true;
                    }
                    if (z) {
                        try {
                            cursorA = com.igexin.push.core.f.a().i().a("message", new String[]{"taskid"}, new String[]{string4}, null, null);
                            if (cursorA != null) {
                                try {
                                    if (cursorA.getCount() != 0) {
                                        if (cursorA == null) {
                                            return true;
                                        }
                                        cursorA.close();
                                        return true;
                                    }
                                    if (jSONObject.has("condition")) {
                                        b(jSONObject, pushTaskBean);
                                        pushTaskBean.setStatus(com.igexin.push.core.a.k);
                                        contentValues.put(Downloads.COLUMN_STATUS, Integer.valueOf(com.igexin.push.core.a.k));
                                    } else {
                                        pushTaskBean.setStatus(com.igexin.push.core.a.l);
                                        contentValues.put(Downloads.COLUMN_STATUS, Integer.valueOf(com.igexin.push.core.a.l));
                                    }
                                    com.igexin.push.core.f.a().i().a("message", contentValues);
                                    com.igexin.push.core.g.al.put(strA, pushTaskBean);
                                    if (jSONObject.has("condition")) {
                                        u();
                                    } else {
                                        a().a(string4, string3, com.igexin.push.core.g.c, com.igexin.push.core.g.g);
                                    }
                                } catch (Exception e) {
                                    cursor = cursorA;
                                    if (cursor != null) {
                                        cursor.close();
                                    }
                                } catch (Throwable th) {
                                    th = th;
                                    if (cursorA != null) {
                                        cursorA.close();
                                    }
                                    throw th;
                                }
                            }
                            if (cursorA != null) {
                                cursorA.close();
                            }
                        } catch (Exception e2) {
                            cursor = null;
                        } catch (Throwable th2) {
                            th = th2;
                            cursorA = null;
                        }
                    } else {
                        if (jSONObject.has("condition")) {
                            b(jSONObject, pushTaskBean);
                        }
                        pushTaskBean.setStatus(com.igexin.push.core.a.l);
                        com.igexin.push.core.g.al.put(strA, pushTaskBean);
                    }
                }
            }
        } catch (JSONException e3) {
            e3.printStackTrace();
        }
        return true;
    }

    public com.igexin.push.core.b b(String str, String str2) {
        com.igexin.push.core.b bVarA;
        com.igexin.push.core.b bVar = com.igexin.push.core.b.success;
        int i = 0;
        PushTaskBean pushTaskBean = (PushTaskBean) com.igexin.push.core.g.al.get(str + ":" + str2);
        if (pushTaskBean == null) {
            return com.igexin.push.core.b.stop;
        }
        Iterator it = pushTaskBean.getActionChains().iterator();
        while (true) {
            int i2 = i;
            com.igexin.push.core.b bVar2 = bVar;
            if (!it.hasNext()) {
                if (i2 != 0 && !com.igexin.push.core.g.a(str, Integer.valueOf(i2), true)) {
                    bVar2 = com.igexin.push.core.b.success;
                }
                return bVar2;
            }
            BaseAction baseAction = (BaseAction) it.next();
            com.igexin.push.core.b bVarPrepareExecuteAction = com.igexin.push.core.b.stop;
            if (baseAction == null) {
                return bVarPrepareExecuteAction;
            }
            Iterator it2 = com.igexin.push.extension.a.a().c().iterator();
            while (true) {
                if (!it2.hasNext()) {
                    bVarA = bVarPrepareExecuteAction;
                    break;
                }
                bVarPrepareExecuteAction = ((IPushExtension) it2.next()).prepareExecuteAction(pushTaskBean, baseAction);
                if (bVarPrepareExecuteAction != com.igexin.push.core.b.stop) {
                    bVarA = bVarPrepareExecuteAction;
                    break;
                }
            }
            if (bVarA == com.igexin.push.core.b.stop) {
                com.igexin.push.core.a.a.a aVar = (com.igexin.push.core.a.a.a) b.get(baseAction.getType());
                if (aVar == null) {
                    return bVarA;
                }
                bVarA = aVar.a(pushTaskBean, baseAction);
                if (bVarA == com.igexin.push.core.b.stop) {
                    return bVarA;
                }
            }
            bVar = bVar2 == com.igexin.push.core.b.success ? bVarA : bVar2;
            i = bVarA == com.igexin.push.core.b.wait ? i2 + 1 : i2;
        }
    }

    public String b(com.igexin.push.core.bean.f fVar) {
        JSONObject jSONObject = new JSONObject();
        try {
            String strA = fVar.a();
            Map mapB = fVar.b();
            String str = "[]";
            if (strA != null) {
                jSONObject.put("version", strA);
            }
            if (mapB != null && mapB.size() > 0) {
                String str2 = "[";
                Iterator it = mapB.entrySet().iterator();
                while (it.hasNext()) {
                    com.igexin.push.core.bean.e eVar = (com.igexin.push.core.bean.e) ((Map.Entry) it.next()).getValue();
                    JSONObject jSONObject2 = new JSONObject();
                    jSONObject2.put("id", eVar.a());
                    jSONObject2.put("version", eVar.b());
                    jSONObject2.put("name", eVar.c());
                    jSONObject2.put("cls_name", eVar.d());
                    jSONObject2.put("url", eVar.e());
                    jSONObject2.put("checksum", eVar.f());
                    jSONObject2.put("isdestroy", eVar.g());
                    jSONObject2.put("effective", eVar.h());
                    jSONObject2.put("loadTime", eVar.i());
                    jSONObject2.put("key", eVar.j());
                    str2 = (str2 + jSONObject2.toString()) + ",";
                }
                str = (str2.endsWith(",") ? str2.substring(0, str2.length() - 1) : str2) + "]";
            }
            jSONObject.put("extensions", new JSONArray(str));
            return jSONObject.toString();
        } catch (JSONException e) {
            return null;
        }
    }

    @Override // com.igexin.push.d.k
    public void b() throws Throwable {
        d();
    }

    public void b(int i, String str) {
        com.igexin.push.a.k.i = i;
        com.igexin.push.a.a.a().d();
    }

    public void b(Intent intent) {
        if (intent != null && intent.hasExtra("isSlave") && intent.getBooleanExtra("isSlave", false)) {
            com.igexin.push.core.f.a().a(true);
            if (intent.hasExtra("op_app")) {
                com.igexin.push.core.g.E = intent.getStringExtra("op_app");
            } else {
                com.igexin.push.core.g.E = StatConstants.MTA_COOPERATION_TAG;
            }
            if (com.igexin.push.core.g.o) {
                l();
            }
        }
    }

    public void b(PushTaskBean pushTaskBean, String str) {
        String str2 = pushTaskBean.getMessageId() + "|" + str;
        if (com.igexin.push.core.g.ao.containsKey(str2)) {
            com.igexin.push.c.c.c cVar = (com.igexin.push.c.c.c) com.igexin.push.core.g.ao.get(str2);
            if (cVar.c() < 2) {
                com.igexin.push.core.f.a().e().a("C-" + com.igexin.push.core.g.u, cVar);
                cVar.a(cVar.c() + 1);
                a(cVar, pushTaskBean, str, str2);
            }
        } else {
            com.igexin.push.c.c.c cVar2 = new com.igexin.push.c.c.c();
            long jCurrentTimeMillis = System.currentTimeMillis();
            cVar2.a();
            cVar2.c = "FDB" + pushTaskBean.getMessageId() + "|" + pushTaskBean.getTaskId() + "|" + str + "|ok|" + jCurrentTimeMillis;
            cVar2.d = com.igexin.push.core.g.u;
            cVar2.a = (int) jCurrentTimeMillis;
            com.igexin.push.core.f.a().e().a("C-" + com.igexin.push.core.g.u, cVar2);
            a(cVar2, pushTaskBean, str, str2);
        }
        com.igexin.a.a.c.a.a("cdnfeedback|" + pushTaskBean.getTaskId() + "|" + pushTaskBean.getMessageId() + "|" + str);
    }

    public void b(String str) {
        if (str != null) {
            long jCurrentTimeMillis = System.currentTimeMillis();
            String str2 = "{\"action\":\"bindapp\",\"appid\":\"" + str + "\",\"cid\":\"" + com.igexin.push.core.g.u + "\",\"id\":\"" + jCurrentTimeMillis + "\",\"type\":\"bind\"}";
            com.igexin.push.core.c.c cVarA = com.igexin.push.core.c.c.a();
            if (cVarA != null) {
                cVarA.a(new com.igexin.push.core.bean.i(jCurrentTimeMillis, str2, (byte) 1, jCurrentTimeMillis));
            }
            if (str2 != null) {
                com.igexin.push.c.c.d dVar = new com.igexin.push.c.c.d();
                dVar.a();
                dVar.a = (int) jCurrentTimeMillis;
                dVar.d = "17258000";
                dVar.e = str2;
                dVar.g = com.igexin.push.core.g.u;
                com.igexin.push.core.f.a().e().a("C-" + com.igexin.push.core.g.u, dVar);
            }
        }
    }

    public void b(String str, String str2, String str3, String str4) {
        byte[] msgExtra;
        Intent intent = new Intent();
        Bundle bundle = new Bundle();
        bundle.putInt("action", 10001);
        bundle.putString("taskid", str);
        bundle.putString("messageid", str2);
        bundle.putString("appid", str3);
        bundle.putString("packagename", com.igexin.push.core.g.g);
        intent.setAction("com.igexin.sdk.action." + str3);
        if (str4 != null) {
            msgExtra = str4.getBytes();
        } else {
            PushTaskBean pushTaskBean = (PushTaskBean) com.igexin.push.core.g.al.get(a(str, str2));
            msgExtra = pushTaskBean != null ? pushTaskBean.getMsgExtra() : null;
        }
        if (msgExtra != null) {
        }
        bundle.putByteArray("payload", msgExtra);
        intent.putExtras(bundle);
        try {
            com.igexin.a.a.c.a.a("startapp|broadcast|" + str3 + "|" + new String(msgExtra, "utf-8"));
        } catch (Exception e) {
        }
        com.igexin.push.core.g.i.sendBroadcast(intent);
    }

    public boolean b(String str, String str2, String str3) throws Throwable {
        Cursor cursorA;
        Cursor cursor;
        PushTaskBean pushTaskBean = (PushTaskBean) com.igexin.push.core.g.al.get(str + ":" + str2);
        if (pushTaskBean == null) {
            try {
                cursorA = com.igexin.push.core.f.a().i().a("message", new String[]{"taskid", "messageid"}, new String[]{str, str2}, null, null);
                if (cursorA == null) {
                    if (cursorA != null) {
                        cursorA.close();
                    }
                    return false;
                }
                try {
                    if (cursorA.getCount() <= 0) {
                        if (cursorA != null) {
                            cursorA.close();
                        }
                        return false;
                    }
                    while (cursorA.moveToNext()) {
                        a(new JSONObject(new String(com.igexin.a.b.a.c(cursorA.getBlob(cursorA.getColumnIndexOrThrow("info"))))), cursorA.getBlob(cursorA.getColumnIndexOrThrow("msgextra")), false);
                        PushTaskBean pushTaskBean2 = (PushTaskBean) com.igexin.push.core.g.al.get(str + ":" + str2);
                        if (pushTaskBean2 == null) {
                            if (cursorA != null) {
                                cursorA.close();
                            }
                            return false;
                        }
                        pushTaskBean = pushTaskBean2;
                    }
                    if (cursorA != null) {
                        cursorA.close();
                    }
                } catch (Exception e) {
                    cursor = cursorA;
                    if (cursor != null) {
                        cursor.close();
                    }
                } catch (Throwable th) {
                    th = th;
                    if (cursorA != null) {
                        cursorA.close();
                    }
                    throw th;
                }
            } catch (Exception e2) {
                cursor = null;
            } catch (Throwable th2) {
                th = th2;
                cursorA = null;
            }
        }
        a().a(pushTaskBean, str3);
        BaseAction baseAction = pushTaskBean.getBaseAction(str3);
        if (baseAction == null) {
            return false;
        }
        if (baseAction.isSupportExt()) {
            Iterator it = com.igexin.push.extension.a.a().c().iterator();
            while (it.hasNext()) {
                if (((IPushExtension) it.next()).executeAction(pushTaskBean, baseAction)) {
                    return true;
                }
            }
        }
        com.igexin.push.core.a.a.a aVar = (com.igexin.push.core.a.a.a) b.get(baseAction.getType());
        if (aVar == null || pushTaskBean.isStop()) {
            return false;
        }
        return aVar.b(pushTaskBean, baseAction);
    }

    public com.igexin.push.c.c.i c() {
        WifiInfo connectionInfo;
        com.igexin.push.c.c.i iVar = new com.igexin.push.c.c.i();
        iVar.a = com.igexin.push.core.g.t;
        iVar.b = (byte) 0;
        iVar.c = MotionEventCompat.ACTION_POINTER_INDEX_MASK;
        try {
            if (E()) {
                ArrayList arrayList = new ArrayList();
                WifiManager wifiManager = (WifiManager) com.igexin.push.core.g.i.getSystemService("wifi");
                if (wifiManager != null && wifiManager.isWifiEnabled() && (connectionInfo = wifiManager.getConnectionInfo()) != null) {
                    String ssid = connectionInfo.getSSID();
                    String bssid = connectionInfo.getBSSID();
                    if (ssid != null) {
                        com.igexin.push.c.c.j jVar = new com.igexin.push.c.c.j();
                        jVar.a = (byte) 1;
                        jVar.b = ssid;
                        arrayList.add(jVar);
                    }
                    if (bssid != null) {
                        com.igexin.push.c.c.j jVar2 = new com.igexin.push.c.c.j();
                        jVar2.a = (byte) 4;
                        jVar2.b = bssid;
                        arrayList.add(jVar2);
                    }
                }
                if (arrayList.size() > 0) {
                    iVar.d = arrayList;
                }
            }
        } catch (Exception e) {
        }
        return iVar;
    }

    public void c(Intent intent) throws Throwable {
        ServiceInfo[] serviceInfoArr;
        Cursor cursorA;
        Cursor cursor = null;
        if (intent == null) {
            return;
        }
        try {
            if (PushConsts.ACTION_BROADCAST_NETWORK_CHANGE.equals(intent.getAction())) {
                if (com.igexin.a.a.b.d.c() != null) {
                    com.igexin.push.core.i.a().a(com.igexin.push.core.k.NETWORK_SWITCH);
                    if (com.igexin.push.core.f.a().h().getActiveNetworkInfo() == null || !com.igexin.push.core.f.a().h().getActiveNetworkInfo().isAvailable()) {
                        com.igexin.push.core.g.k = false;
                    } else {
                        com.igexin.push.core.g.k = true;
                    }
                    if (!com.igexin.push.core.g.o) {
                        com.igexin.push.core.f.a().e().c(true);
                    } else if (System.currentTimeMillis() - com.igexin.push.core.g.U > 5000) {
                        com.igexin.push.core.g.U = System.currentTimeMillis();
                        if (f() == -2) {
                            com.igexin.push.core.g.o = false;
                            m();
                        }
                    }
                    if (v()) {
                        u();
                        return;
                    }
                    return;
                }
                return;
            }
            if ("com.igexin.sdk.action.snlrefresh".equals(intent.getAction()) || com.igexin.push.core.g.W.equals(intent.getAction()) || "com.igexin.sdk.action.snlretire".equals(intent.getAction())) {
                com.igexin.push.core.f.a().f().a(intent);
                return;
            }
            if (!"com.igexin.sdk.action.execute".equals(intent.getAction())) {
                if ("com.igexin.sdk.action.doaction".equals(intent.getAction())) {
                    String stringExtra = intent.getStringExtra("taskid");
                    String stringExtra2 = intent.getStringExtra("messageid");
                    String stringExtra3 = intent.getStringExtra("actionid");
                    String stringExtra4 = intent.getStringExtra("accesstoken");
                    int intExtra = intent.getIntExtra("notifID", 0);
                    NotificationManager notificationManager = (NotificationManager) com.igexin.push.core.g.i.getSystemService("notification");
                    if (intExtra != 0) {
                        notificationManager.cancel(intExtra);
                    } else if (com.igexin.push.core.g.am.get(stringExtra) != null) {
                        notificationManager.cancel(((Integer) com.igexin.push.core.g.am.get(stringExtra)).intValue());
                    }
                    if (stringExtra4.equals(com.igexin.push.core.g.ax)) {
                        b(stringExtra, stringExtra2, stringExtra3);
                        return;
                    }
                    return;
                }
                if ("android.intent.action.TIME_SET".equals(intent.getAction())) {
                    if (com.igexin.push.a.k.f != 0) {
                        com.igexin.push.e.b.g.g().h();
                        return;
                    }
                    return;
                }
                if ("android.intent.action.SCREEN_ON".equals(intent.getAction())) {
                    com.igexin.push.core.g.s = 1;
                    if (v()) {
                        u();
                        return;
                    }
                    return;
                }
                if ("android.intent.action.SCREEN_OFF".equals(intent.getAction())) {
                    com.igexin.push.core.g.s = 0;
                    return;
                }
                if (!"android.intent.action.PACKAGE_ADDED".equals(intent.getAction())) {
                    if (!"android.intent.action.PACKAGE_REMOVED".equals(intent.getAction())) {
                        if ("com.igexin.sdk.action.core.clearmsg".equals(intent.getAction())) {
                            com.igexin.push.core.f.a().i().a("message", (String) null);
                            return;
                        }
                        return;
                    }
                    String dataString = intent.getDataString();
                    if (dataString == null || !dataString.startsWith("package:")) {
                        return;
                    }
                    String strSubstring = dataString.substring(8);
                    if (com.igexin.push.core.c.f.a().c().containsKey(strSubstring)) {
                        com.igexin.push.core.c.f.a().c().remove(strSubstring);
                        return;
                    }
                    return;
                }
                String dataString2 = intent.getDataString();
                if (dataString2 == null || !dataString2.startsWith("package:")) {
                    return;
                }
                String strSubstring2 = dataString2.substring(8);
                try {
                    PackageInfo packageInfo = com.igexin.push.core.g.i.getPackageManager().getPackageInfo(strSubstring2, 4);
                    if (packageInfo == null || (serviceInfoArr = packageInfo.services) == null) {
                        return;
                    }
                    for (ServiceInfo serviceInfo : serviceInfoArr) {
                        if (com.igexin.push.core.a.o.equals(serviceInfo.name) || com.igexin.push.core.a.n.equals(serviceInfo.name) || com.igexin.push.core.a.p.equals(serviceInfo.name)) {
                            com.igexin.push.core.c.f.a().c().put(strSubstring2, serviceInfo.name);
                            return;
                        }
                    }
                    return;
                } catch (PackageManager.NameNotFoundException e) {
                    return;
                }
            }
            String stringExtra5 = intent.getStringExtra("taskid");
            String stringExtra6 = intent.getStringExtra("messageid");
            String stringExtra7 = intent.getStringExtra("appid");
            String stringExtra8 = intent.getStringExtra("pkgname");
            ContentValues contentValues = new ContentValues();
            String str = "EXEC_" + stringExtra5;
            contentValues.put("taskid", stringExtra5);
            contentValues.put("appid", stringExtra7);
            contentValues.put("key", str);
            contentValues.put("createtime", Long.valueOf(System.currentTimeMillis()));
            try {
                cursorA = com.igexin.push.core.f.a().i().a("message", new String[]{"key"}, new String[]{str}, null, null);
                if (cursorA != null) {
                    try {
                        if (cursorA.getCount() == 0) {
                            com.igexin.push.core.f.a().i().a("message", contentValues);
                            if (stringExtra8.equals(com.igexin.push.core.g.g)) {
                                if (stringExtra6 == null || stringExtra5 == null) {
                                    if (cursorA != null) {
                                        cursorA.close();
                                        return;
                                    }
                                    return;
                                } else if (com.igexin.push.core.f.a() != null && b(stringExtra5, stringExtra6) == com.igexin.push.core.b.success) {
                                    a(stringExtra5, stringExtra6, "1");
                                }
                            }
                        }
                    } catch (Exception e2) {
                        if (cursorA != null) {
                            cursorA.close();
                            return;
                        }
                        return;
                    } catch (Throwable th) {
                        cursor = cursorA;
                        th = th;
                        if (cursor != null) {
                            cursor.close();
                        }
                        throw th;
                    }
                }
                if (cursorA != null) {
                    cursorA.close();
                }
            } catch (Exception e3) {
                cursorA = null;
            } catch (Throwable th2) {
                th = th2;
            }
        } catch (Exception e4) {
        }
    }

    public void c(String str) {
        if (com.igexin.push.core.g.u != null) {
            long jCurrentTimeMillis = System.currentTimeMillis();
            String str2 = "{\"action\":\"set_tag\",\"id\":\"" + jCurrentTimeMillis + "\", \"cid\":\"" + com.igexin.push.core.g.u + "\", \"appid\":\"" + com.igexin.push.core.g.c + "\", \"tags\":\"" + str + "\"}";
            com.igexin.push.core.c.c cVarA = com.igexin.push.core.c.c.a();
            if (cVarA != null) {
                cVarA.a(new com.igexin.push.core.bean.i(jCurrentTimeMillis, str2, (byte) 2, jCurrentTimeMillis));
            }
            com.igexin.push.c.c.d dVar = new com.igexin.push.c.c.d();
            dVar.a();
            dVar.d = "17258000";
            dVar.e = str2;
            com.igexin.a.a.b.d.c().a(com.igexin.push.core.g.a, 3, com.igexin.push.core.f.a().d(), dVar, false);
            com.igexin.a.a.c.a.a("settag");
        }
    }

    public int d() throws Throwable {
        boolean z;
        Cursor cursorA;
        Cursor cursor;
        if (!com.igexin.push.core.g.l || !com.igexin.push.core.g.m || a(System.currentTimeMillis()) || !n()) {
            return -1;
        }
        if (com.igexin.push.core.g.n) {
            com.igexin.push.core.g.n = !com.igexin.push.core.g.n;
            com.igexin.push.core.g.O = (((long) Math.abs(new Random().nextInt() % 24)) * 3600000) + System.currentTimeMillis();
        }
        com.igexin.push.core.c.r.b();
        if (com.igexin.push.core.g.t == 0) {
            com.igexin.a.a.c.a.a("registerReq");
            z = com.igexin.push.core.f.a().e().a(new StringBuilder().append("R-").append(com.igexin.push.core.g.C).toString(), new com.igexin.push.c.c.f(com.igexin.push.core.g.w, com.igexin.push.core.g.x, com.igexin.push.core.g.C, com.igexin.push.core.g.c)) >= 0;
        } else {
            com.igexin.push.c.c.i iVarC = c();
            com.igexin.a.a.c.a.a("loginReqBefore|" + iVarC.a);
            z = com.igexin.push.core.f.a().e().a(new StringBuilder().append("S-").append(String.valueOf(com.igexin.push.core.g.t)).toString(), iVarC) >= 0;
            if (z) {
                com.igexin.a.a.c.a.a("loginReq|" + com.igexin.push.core.g.u);
            }
        }
        if (z) {
            return 1;
        }
        try {
            String str = new SimpleDateFormat("yyyy-MM-dd").format(new Date());
            cursorA = com.igexin.push.core.f.a().i().a("bi", new String[]{"type"}, new String[]{"1"}, null, null);
            if (cursorA != null) {
                try {
                    if (cursorA.getCount() == 0) {
                        ContentValues contentValues = new ContentValues();
                        contentValues.put("loginerror_nonetwork_count", (Integer) 1);
                        contentValues.put("create_time", str);
                        contentValues.put("type", "1");
                        com.igexin.push.core.f.a().i().a("bi", contentValues);
                    } else {
                        int i = 0;
                        while (cursorA.moveToNext()) {
                            String string = cursorA.getString(cursorA.getColumnIndexOrThrow("create_time"));
                            String string2 = cursorA.getString(cursorA.getColumnIndexOrThrow("id"));
                            if (str.equals(string)) {
                                i = cursorA.getInt(cursorA.getColumnIndexOrThrow("loginerror_nonetwork_count"));
                                ContentValues contentValues2 = new ContentValues();
                                contentValues2.put("loginerror_nonetwork_count", Integer.valueOf(i + 1));
                                com.igexin.push.core.f.a().i().a("bi", contentValues2, new String[]{"id"}, new String[]{string2});
                            } else {
                                ContentValues contentValues3 = new ContentValues();
                                contentValues3.put("type", Consts.BITYPE_UPDATE);
                                com.igexin.push.core.f.a().i().a("bi", contentValues3, new String[]{"id"}, new String[]{string2});
                                ContentValues contentValues4 = new ContentValues();
                                contentValues4.put("loginerror_nonetwork_count", Integer.valueOf(i + 1));
                                contentValues4.put("create_time", str);
                                contentValues4.put("type", "1");
                                com.igexin.push.core.f.a().i().a("bi", contentValues4);
                            }
                        }
                    }
                } catch (Exception e) {
                    cursor = cursorA;
                    if (cursor != null) {
                        cursor.close();
                    }
                } catch (Throwable th) {
                    th = th;
                    if (cursorA != null) {
                        cursorA.close();
                    }
                    throw th;
                }
            }
            if (cursorA != null) {
                cursorA.close();
            }
        } catch (Exception e2) {
            cursor = null;
        } catch (Throwable th2) {
            th = th2;
            cursorA = null;
        }
        return 0;
    }

    public void d(Intent intent) {
        Map map;
        boolean z;
        if (intent == null) {
            return;
        }
        int intExtra = intent.getIntExtra("id", -1);
        boolean booleanExtra = intent.getBooleanExtra("result", false);
        if (intExtra != -1) {
            com.igexin.push.core.g.au++;
            if (booleanExtra) {
                com.igexin.push.core.g.at++;
                Map mapB = com.igexin.push.core.g.av != null ? com.igexin.push.core.g.av.b() : null;
                if (mapB == null) {
                    return;
                }
                if (com.igexin.push.a.k.x != null) {
                    Map mapB2 = com.igexin.push.a.k.x.b();
                    if (mapB2 == null) {
                        return;
                    }
                    if (mapB2.containsKey(Integer.valueOf(intExtra))) {
                        z = true;
                        com.igexin.push.core.bean.e eVar = (com.igexin.push.core.bean.e) mapB2.get(Integer.valueOf(intExtra));
                        if (eVar != null) {
                            File file = new File(com.igexin.push.core.g.ad + "/" + eVar.c());
                            if (file.exists()) {
                                file.delete();
                            }
                        }
                        mapB2.remove(Integer.valueOf(intExtra));
                        map = mapB2;
                    } else {
                        z = false;
                        map = mapB2;
                    }
                } else {
                    HashMap map2 = new HashMap();
                    com.igexin.push.core.bean.f fVar = new com.igexin.push.core.bean.f();
                    fVar.a("0");
                    fVar.a(map2);
                    com.igexin.push.a.k.x = fVar;
                    map = map2;
                    z = false;
                }
                com.igexin.push.core.bean.e eVar2 = (com.igexin.push.core.bean.e) mapB.get(Integer.valueOf(intExtra));
                if (eVar2 == null) {
                    return;
                }
                String str = com.igexin.push.core.g.ad + "/" + eVar2.c();
                File file2 = new File(str);
                if (file2.exists()) {
                    map.put(Integer.valueOf(intExtra), eVar2);
                    if (com.igexin.push.core.g.at == com.igexin.push.core.g.as) {
                        com.igexin.push.a.k.x.a(com.igexin.push.core.g.av.a());
                    }
                    if (!z && com.igexin.push.extension.a.a().a(com.igexin.push.core.g.i, str, eVar2.d(), eVar2.j(), eVar2.c())) {
                        eVar2.b(System.currentTimeMillis());
                        if (eVar2.g()) {
                            file2.delete();
                            map.remove(Integer.valueOf(intExtra));
                        }
                    }
                    com.igexin.push.a.a.a().g();
                }
            }
            if (com.igexin.push.core.g.au == com.igexin.push.core.g.as && com.igexin.push.core.g.aw) {
                Process.killProcess(Process.myPid());
            }
        }
    }

    public boolean d(String str) {
        PackageManager packageManager = com.igexin.push.core.g.i.getPackageManager();
        Intent intent = new Intent("android.intent.action.MAIN", (Uri) null);
        intent.addCategory("android.intent.category.LAUNCHER");
        Iterator<ResolveInfo> it = packageManager.queryIntentActivities(intent, 0).iterator();
        while (it.hasNext()) {
            if (it.next().activityInfo.packageName.equals(str)) {
                return true;
            }
        }
        return false;
    }

    public void e() {
        com.igexin.a.a.b.d.c().a(com.igexin.push.core.g.a.replaceFirst("socket", "disConnect"), 0, (com.igexin.a.a.b.c) null);
    }

    public boolean e(String str) {
        Iterator<ActivityManager.RunningAppProcessInfo> it = ((ActivityManager) com.igexin.push.core.g.i.getSystemService("activity")).getRunningAppProcesses().iterator();
        while (it.hasNext()) {
            if (str.equals(it.next().processName)) {
                return true;
            }
        }
        return false;
    }

    public int f() {
        return com.igexin.push.core.f.a().e().a("H-" + com.igexin.push.core.g.u, new com.igexin.push.c.c.h());
    }

    public void f(String str) throws Throwable {
        com.igexin.a.a.b.d.c().a((com.igexin.a.a.d.d) new com.igexin.push.e.a.c(new com.igexin.push.core.d.g(com.igexin.push.core.g.a(), ((a(true, 4) + "2.3.0.0|sdkconfig-error|") + str).getBytes(), 0, true)), false, true);
    }

    public String g(String str) {
        if (com.igexin.push.core.g.c() == null) {
            return null;
        }
        return (String) com.igexin.push.core.g.c().get(str);
    }

    public void g() {
        for (com.igexin.push.core.bean.i iVar : com.igexin.push.core.c.c.a().b()) {
            if (iVar.d() + 10000 <= System.currentTimeMillis()) {
                long jCurrentTimeMillis = System.currentTimeMillis();
                com.igexin.push.c.c.d dVar = new com.igexin.push.c.c.d();
                dVar.a();
                dVar.a = (int) jCurrentTimeMillis;
                dVar.d = "17258000";
                dVar.e = iVar.b();
                dVar.g = com.igexin.push.core.g.u;
                com.igexin.push.core.f.a().e().a("C-" + com.igexin.push.core.g.u, dVar);
                com.igexin.a.a.c.a.a("freshral|" + iVar.b());
                return;
            }
        }
    }

    public void h() {
        long jCurrentTimeMillis = System.currentTimeMillis();
        com.igexin.push.c.c.d dVar = new com.igexin.push.c.c.d();
        dVar.a();
        dVar.a = (int) jCurrentTimeMillis;
        dVar.d = "17258000";
        dVar.e = "{\"action\":\"request_deviceid\",\"id\":\"" + jCurrentTimeMillis + "\"}";
        dVar.g = com.igexin.push.core.g.u;
        com.igexin.push.core.f.a().e().a("C-" + com.igexin.push.core.g.u, dVar);
        com.igexin.a.a.c.a.a("deviceidReq");
    }

    public void i() {
        long j;
        String strA = null;
        long j2 = -1;
        try {
            com.igexin.push.core.bean.a aVar = new com.igexin.push.core.bean.a();
            j2 = aVar.l;
            strA = com.igexin.push.core.bean.a.a(aVar);
            j = j2;
        } catch (JSONException e) {
            j = j2;
        }
        if (strA != null) {
            com.igexin.a.a.c.a.a("addphoneinfo");
            com.igexin.push.core.c.c cVarA = com.igexin.push.core.c.c.a();
            if (cVarA != null) {
                cVarA.a(new com.igexin.push.core.bean.i(j, strA, (byte) 5, j));
            }
            com.igexin.push.c.c.d dVar = new com.igexin.push.c.c.d();
            dVar.a();
            dVar.a = (int) j;
            dVar.d = "17258000";
            dVar.e = strA;
            dVar.g = com.igexin.push.core.g.u;
            com.igexin.push.core.f.a().e().a("C-" + com.igexin.push.core.g.u, dVar);
        }
    }

    public void j() {
        long jCurrentTimeMillis = System.currentTimeMillis();
        String str = "{\"action\":\"request_ca_list\",\"id\":\"" + jCurrentTimeMillis + "\", \"appid\":\"" + com.igexin.push.core.g.c + "\", \"cid\":\"" + com.igexin.push.core.g.u + "\"}";
        com.igexin.push.c.c.d dVar = new com.igexin.push.c.c.d();
        dVar.a();
        dVar.a = (int) jCurrentTimeMillis;
        dVar.d = "17258000";
        dVar.e = str;
        dVar.g = com.igexin.push.core.g.u;
        com.igexin.push.core.f.a().e().a("C-" + com.igexin.push.core.g.u, dVar);
    }

    public long k() {
        return ((long) (new Random().nextInt(6) + 2)) * 60000;
    }

    public void l() {
        Intent intent = new Intent();
        intent.setAction("com.igexin.sdk.action." + com.igexin.push.core.g.c);
        Bundle bundle = new Bundle();
        bundle.putInt("action", 10002);
        bundle.putString("clientid", com.igexin.push.core.g.u);
        intent.putExtras(bundle);
        com.igexin.push.core.f.a().a(intent);
        Log.d("PushService", "clientid is " + com.igexin.push.core.g.u);
    }

    public void m() {
        Intent intent = new Intent();
        intent.setAction("com.igexin.sdk.action." + com.igexin.push.core.g.c);
        Bundle bundle = new Bundle();
        bundle.putInt("action", PushConsts.GET_SDKONLINESTATE);
        bundle.putBoolean("onlineState", com.igexin.push.core.g.o);
        intent.putExtras(bundle);
        com.igexin.push.core.f.a().a(intent);
    }

    public boolean n() {
        return System.currentTimeMillis() > com.igexin.push.a.k.g;
    }

    public String o() throws Throwable {
        ByteArrayOutputStream byteArrayOutputStream;
        FileInputStream fileInputStream;
        ByteArrayOutputStream byteArrayOutputStream2;
        FileInputStream fileInputStream2;
        if (new File(com.igexin.push.core.g.aa).exists()) {
            byte[] bArr = new byte[1024];
            try {
                fileInputStream = new FileInputStream(com.igexin.push.core.g.aa);
                try {
                    byteArrayOutputStream = new ByteArrayOutputStream();
                    while (true) {
                        try {
                            int i = fileInputStream.read(bArr);
                            if (i == -1) {
                                break;
                            }
                            byteArrayOutputStream.write(bArr, 0, i);
                        } catch (Exception e) {
                            byteArrayOutputStream2 = byteArrayOutputStream;
                            fileInputStream2 = fileInputStream;
                            if (fileInputStream2 != null) {
                                try {
                                    fileInputStream2.close();
                                } catch (Exception e2) {
                                }
                            }
                            if (byteArrayOutputStream2 != null) {
                                try {
                                    byteArrayOutputStream2.close();
                                    return null;
                                } catch (Exception e3) {
                                    return null;
                                }
                            }
                            return null;
                        } catch (Throwable th) {
                            th = th;
                            if (fileInputStream != null) {
                                try {
                                    fileInputStream.close();
                                } catch (Exception e4) {
                                }
                            }
                            if (byteArrayOutputStream == null) {
                                throw th;
                            }
                            try {
                                byteArrayOutputStream.close();
                                throw th;
                            } catch (Exception e5) {
                                throw th;
                            }
                        }
                    }
                    String str = new String(byteArrayOutputStream.toByteArray());
                    if (fileInputStream != null) {
                        try {
                            fileInputStream.close();
                        } catch (Exception e6) {
                        }
                    }
                    if (byteArrayOutputStream == null) {
                        return str;
                    }
                    try {
                        byteArrayOutputStream.close();
                        return str;
                    } catch (Exception e7) {
                        return str;
                    }
                } catch (Exception e8) {
                    byteArrayOutputStream2 = null;
                    fileInputStream2 = fileInputStream;
                } catch (Throwable th2) {
                    th = th2;
                    byteArrayOutputStream = null;
                }
            } catch (Exception e9) {
                byteArrayOutputStream2 = null;
                fileInputStream2 = null;
            } catch (Throwable th3) {
                th = th3;
                byteArrayOutputStream = null;
                fileInputStream = null;
            }
        }
        return null;
    }

    public void p() throws Throwable {
        ArrayList arrayList = new ArrayList();
        a((List) arrayList);
        int size = arrayList.size();
        if (size <= 0) {
            return;
        }
        JSONObject jSONObject = new JSONObject();
        try {
            jSONObject.put("action", "reportapplist");
            jSONObject.put("session_last", com.igexin.push.core.g.t);
            JSONArray jSONArray = new JSONArray();
            for (int i = 0; i < size; i++) {
                JSONObject jSONObject2 = new JSONObject();
                jSONObject2.put("appid", ((com.igexin.push.core.bean.l) arrayList.get(i)).c());
                jSONObject2.put("name", ((com.igexin.push.core.bean.l) arrayList.get(i)).a());
                jSONObject2.put("version", ((com.igexin.push.core.bean.l) arrayList.get(i)).b());
                jSONArray.put(jSONObject2);
            }
            jSONObject.put("applist", jSONArray);
        } catch (JSONException e) {
        }
        byte[] bArrB = com.igexin.a.b.a.b(jSONObject.toString().getBytes());
        if (bArrB != null) {
            com.igexin.a.a.b.d.c().a((com.igexin.a.a.d.d) new com.igexin.push.e.a.c(new com.igexin.push.core.d.a(com.igexin.push.core.g.a(), bArrB)), false, true);
            h(q());
            com.igexin.a.a.c.a.a("reportapplist");
        }
    }

    public String q() {
        ArrayList arrayList = new ArrayList();
        ArrayList arrayList2 = new ArrayList();
        a((List) arrayList2);
        int size = arrayList2.size();
        if (size > 0) {
            for (int i = 0; i < size; i++) {
                arrayList.add(((com.igexin.push.core.bean.l) arrayList2.get(i)).c());
            }
        }
        return arrayList.toString();
    }

    public boolean r() {
        boolean z;
        boolean z2;
        boolean z3;
        if (com.igexin.push.core.g.i == null) {
        }
        String packageName = com.igexin.push.core.g.i.getApplicationContext().getPackageName();
        try {
            ServiceInfo[] serviceInfoArr = com.igexin.push.core.g.i.getPackageManager().getPackageInfo(packageName, 4).services;
            if (serviceInfoArr != null) {
                boolean z4 = false;
                for (ServiceInfo serviceInfo : serviceInfoArr) {
                    try {
                        if (serviceInfo.name.indexOf("DownloadService") != -1) {
                            z4 = true;
                        }
                    } catch (PackageManager.NameNotFoundException e) {
                        z2 = false;
                        z3 = z4;
                        z = false;
                    }
                }
                z3 = z4;
            } else {
                z3 = false;
            }
            try {
                ProviderInfo[] providerInfoArr = com.igexin.push.core.g.i.getPackageManager().getPackageInfo(packageName, 8).providers;
                if (providerInfoArr != null) {
                    boolean z5 = false;
                    for (ProviderInfo providerInfo : providerInfoArr) {
                        try {
                            if (providerInfo.name.indexOf("DownloadProvider") != -1) {
                                z5 = true;
                            }
                        } catch (PackageManager.NameNotFoundException e2) {
                            z2 = z5;
                            z = false;
                        }
                    }
                    z2 = z5;
                } else {
                    z2 = false;
                }
                try {
                    ActivityInfo[] activityInfoArr = com.igexin.push.core.g.i.getPackageManager().getPackageInfo(packageName, 2).receivers;
                    if (activityInfoArr != null) {
                        z = false;
                        for (ActivityInfo activityInfo : activityInfoArr) {
                            try {
                                if (activityInfo.name.indexOf("DownloadReceiver") != -1) {
                                    z = true;
                                }
                            } catch (PackageManager.NameNotFoundException e3) {
                            }
                        }
                    } else {
                        z = false;
                    }
                } catch (PackageManager.NameNotFoundException e4) {
                    z = false;
                }
            } catch (PackageManager.NameNotFoundException e5) {
                z = false;
                z2 = false;
            }
        } catch (PackageManager.NameNotFoundException e6) {
            z = false;
            z2 = false;
            z3 = false;
        }
        return z3 && z2 && z;
    }

    public void s() {
        com.igexin.push.core.f.a().i().a("message", "createtime <= " + (System.currentTimeMillis() - 604800000));
    }

    public void t() {
        SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd");
        String str = simpleDateFormat.format(new Date());
        File file = new File("/sdcard/libs/");
        String str2 = com.igexin.push.core.g.g;
        if (str2 == null) {
            str2 = "unknowPacageName";
        }
        if (file.exists()) {
            String[] list = file.list();
            int length = list.length;
            for (int i = 0; i < length; i++) {
                int length2 = list[i].length();
                if (list[i].startsWith(str2) && list[i].endsWith(".log") && length2 > str2.length() + 14 && str2.equals(list[i].substring(0, length2 - 15))) {
                    try {
                        if (Math.abs((simpleDateFormat.parse(str).getTime() - simpleDateFormat.parse(list[i].substring(str2.length() + 1, length2 - 4)).getTime()) / Consts.TIME_24HOUR) > 6) {
                            File file2 = new File("/sdcard/libs/" + list[i]);
                            if (file2.exists()) {
                                file2.delete();
                            }
                        }
                    } catch (Exception e) {
                    }
                }
            }
        }
    }

    public void u() {
        if (F() > 0) {
            ArrayList arrayList = new ArrayList();
            Iterator it = com.igexin.push.core.g.al.entrySet().iterator();
            while (it.hasNext()) {
                String str = (String) ((Map.Entry) it.next()).getKey();
                PushTaskBean pushTaskBean = (PushTaskBean) com.igexin.push.core.g.al.get(str);
                String str2 = StatConstants.MTA_COOPERATION_TAG;
                if (pushTaskBean != null && pushTaskBean.getStatus() == com.igexin.push.core.a.k) {
                    String taskId = pushTaskBean.getTaskId();
                    Map conditionMap = pushTaskBean.getConditionMap();
                    if (conditionMap == null) {
                        return;
                    }
                    if (!conditionMap.containsKey("endTime") || Long.valueOf((String) conditionMap.get("endTime")).longValue() >= System.currentTimeMillis()) {
                        if (conditionMap.containsKey("wifi")) {
                            int iIntValue = Integer.valueOf((String) conditionMap.get("wifi")).intValue();
                            x();
                            if (iIntValue == com.igexin.push.core.g.r) {
                            }
                        }
                        if (conditionMap.containsKey("screenOn")) {
                            int iIntValue2 = Integer.valueOf((String) conditionMap.get("screenOn")).intValue();
                            w();
                            if (iIntValue2 == com.igexin.push.core.g.s) {
                            }
                        }
                        if (conditionMap.containsKey("ssid")) {
                            String str3 = (String) conditionMap.get("ssid");
                            y();
                            if (com.igexin.push.core.g.ar.containsValue(str3)) {
                                str2 = str3;
                            }
                        }
                        if (conditionMap.containsKey("bssid")) {
                            String str4 = (String) conditionMap.get("bssid");
                            if (!com.igexin.push.core.g.ar.containsKey(str4) || !((String) com.igexin.push.core.g.ar.get(str4)).equals(str2)) {
                            }
                        }
                        if (!conditionMap.containsKey("startTime") || Long.valueOf((String) conditionMap.get("startTime")).longValue() <= System.currentTimeMillis()) {
                            a().a(taskId, pushTaskBean.getMessageId(), com.igexin.push.core.g.c, com.igexin.push.core.g.g);
                            a(com.igexin.push.core.a.l, taskId, str);
                            arrayList.add(str);
                        }
                    } else {
                        a(com.igexin.push.core.a.m, taskId, str);
                        arrayList.add(str);
                    }
                }
            }
            b(arrayList);
        }
    }

    public boolean v() {
        long jCurrentTimeMillis = System.currentTimeMillis();
        if (com.igexin.push.core.g.L <= 0) {
            com.igexin.push.core.g.L = jCurrentTimeMillis - 60000;
            return true;
        }
        if (jCurrentTimeMillis - com.igexin.push.core.g.L <= 60000) {
            return false;
        }
        com.igexin.push.core.g.L = jCurrentTimeMillis;
        return true;
    }

    public void w() {
        if (((PowerManager) com.igexin.push.core.g.i.getSystemService("power")).isScreenOn()) {
            com.igexin.push.core.g.s = 1;
        } else {
            com.igexin.push.core.g.s = 0;
        }
    }

    public void x() {
        NetworkInfo.State state = ((ConnectivityManager) com.igexin.push.core.g.i.getSystemService("connectivity")).getNetworkInfo(1).getState();
        if (state == NetworkInfo.State.CONNECTED || state == NetworkInfo.State.CONNECTING) {
            com.igexin.push.core.g.r = 1;
        } else {
            com.igexin.push.core.g.r = 0;
        }
    }

    public void y() {
        List<ScanResult> scanResults = ((WifiManager) com.igexin.push.core.g.i.getSystemService("wifi")).getScanResults();
        com.igexin.push.core.g.ar.clear();
        if (scanResults == null) {
            return;
        }
        int i = 0;
        while (true) {
            int i2 = i;
            if (i2 >= scanResults.size()) {
                return;
            }
            com.igexin.push.core.g.ar.put(scanResults.get(i2).BSSID, scanResults.get(i2).SSID);
            i = i2 + 1;
        }
    }

    public void z() {
        Map mapC;
        if (!com.igexin.push.a.k.u || (mapC = com.igexin.push.core.c.f.a().c()) == null || mapC.size() <= 0) {
            return;
        }
        for (String str : mapC.keySet()) {
            String str2 = (String) mapC.get(str);
            try {
                Intent intent = new Intent();
                intent.setClassName(str, str2);
                com.igexin.push.core.g.i.startService(intent);
            } catch (Exception e) {
            }
        }
    }
}
