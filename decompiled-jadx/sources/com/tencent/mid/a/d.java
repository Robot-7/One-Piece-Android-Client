package com.tencent.mid.a;

import android.content.Context;
import android.os.Handler;
import android.os.HandlerThread;
import android.util.Log;
import com.tencent.mid.api.MidCallback;
import com.tencent.mid.api.MidConstants;
import com.tencent.mid.api.MidEntity;
import com.tencent.mid.api.MidService;
import com.tencent.mid.util.Util;
import com.tencent.mid.util.j;
import java.util.HashMap;
import org.json.JSONException;
import org.json.JSONObject;

/* JADX INFO: loaded from: classes.dex */
public class d {
    private static String b = "iikVs3FGzEQ23RaD1JlHsSWSI5Z26m2hX3gO51mH3ag=";
    private static d c = null;
    private static Context d = null;
    Handler a;

    private d(Context context) {
        this.a = null;
        try {
            HandlerThread handlerThread = new HandlerThread("HttpManager");
            handlerThread.start();
            this.a = new Handler(handlerThread.getLooper());
            d = context.getApplicationContext();
        } catch (Throwable th) {
            Util.logWarn(th);
        }
    }

    static Context a() {
        return d;
    }

    public static synchronized d a(Context context) {
        if (c == null) {
            c = new d(context);
        }
        return c;
    }

    private String a(f fVar, MidCallback midCallback) throws JSONException {
        int i;
        int i2 = -1;
        int iA = fVar.a();
        String strB = fVar.b();
        String strOptString = "0";
        if (iA == 200) {
            boolean z = false;
            if (Util.isStringValid(strB)) {
                JSONObject jSONObject = new JSONObject(strB);
                if (!jSONObject.isNull(MidEntity.TAG_MID)) {
                    strOptString = jSONObject.optString(MidEntity.TAG_MID);
                    if (Util.isMidValid(strOptString)) {
                        MidEntity midEntity = new MidEntity();
                        midEntity.setMid(strOptString);
                        midEntity.setMac(Util.getWifiMacAddress(d));
                        midEntity.setImei(Util.getImei(d));
                        if (jSONObject.isNull(MidEntity.TAG_TIMESTAMPS)) {
                            midEntity.setTimestamps(System.currentTimeMillis());
                        } else {
                            long jOptLong = jSONObject.optLong(MidEntity.TAG_TIMESTAMPS);
                            if (jOptLong > 0) {
                                midEntity.setTimestamps(jOptLong);
                            }
                        }
                        Util.logInfo("new mid midEntity:" + midEntity.toString());
                        midCallback.onSuccess(midEntity.toString());
                        com.tencent.mid.b.g.a(d).a(midEntity);
                        z = true;
                    }
                }
                i = !jSONObject.isNull(com.tencent.mid.b.a.c) ? jSONObject.getInt(com.tencent.mid.b.a.c) : -1;
                if (!jSONObject.isNull(com.tencent.mid.b.a.d)) {
                    i2 = jSONObject.getInt(com.tencent.mid.b.a.d);
                }
            } else {
                i = -1;
            }
            com.tencent.mid.b.g.a(d).a(i, i2);
            if (!z) {
                midCallback.onSuccess(com.tencent.mid.b.g.a(d).a());
            }
        } else {
            String str = "Server response error code:" + iA + ", error:" + strB;
            Util.logInfo(str);
            midCallback.onFail(iA, str);
        }
        return strOptString;
    }

    private String b() {
        return Util.decode(b);
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void b(g gVar, MidCallback midCallback) {
        try {
            try {
                String httpUrl = Util.getHttpUrl();
                f fVarA = b.a(httpUrl);
                if (fVarA.a() != 200) {
                    String str = "response code invalid:" + fVarA.a();
                    Util.logInfo(str);
                    midCallback.onFail(fVarA.a(), str);
                    b.b();
                    return;
                }
                int i = 0;
                String strA = null;
                JSONObject jSONObject = new JSONObject(fVarA.b());
                if (!jSONObject.isNull("rand")) {
                    i = jSONObject.getInt("rand");
                    strA = j.a(Util.getHMAC(b(), String.valueOf(i)));
                }
                if (strA == null || i == 0) {
                    Util.logInfo("hmac == null");
                    b.b();
                    return;
                }
                HashMap map = new HashMap();
                map.put("k", strA);
                map.put("s", String.valueOf(i));
                String str2 = httpUrl + b.a(map);
                f fVarA2 = b.a(str2);
                if (fVarA2.a() != 200) {
                    Util.logInfo("hmac invalid.");
                    midCallback.onFail(fVarA2.a(), "hmac invalid.");
                    b.b();
                    return;
                }
                JSONObject jSONObject2 = new JSONObject();
                gVar.a(jSONObject2);
                Util.jsonPut(jSONObject2, "rip", Util.getRemoteUrlIp(Util.getHttpUrl()));
                String strA2 = a(b.a(str2, "[" + jSONObject2.toString() + "]"), midCallback);
                if (!Util.isMidValid(jSONObject2.optString(MidEntity.TAG_MID)) && !Util.isMidValid(strA2)) {
                    throw new Exception("get Mid failed, something wrong");
                }
                b.b();
            } catch (Throwable th) {
                if (MidService.isEnableDebug()) {
                    Log.w("MID", "request MID from MID server failed, try to connect MTA server", th);
                }
                try {
                    JSONObject jSONObject3 = new JSONObject();
                    gVar.a(jSONObject3);
                    jSONObject3.put("ky", "A81AG9CN6AE8");
                    Util.jsonPut(jSONObject3, "rip", Util.getRemoteUrlIp("http://pingma.qq.com:80"));
                    a(b.a("http://pingma.qq.com:80/mstat/report/", "[" + jSONObject3.toString() + "]"), midCallback);
                } catch (Throwable th2) {
                    midCallback.onFail(MidConstants.ERROR_SDK_LOGIC, th.toString());
                    Log.e("MID", "request MID  failed", th);
                }
                b.b();
            }
        } catch (Throwable th3) {
            b.b();
            throw th3;
        }
    }

    void a(g gVar, MidCallback midCallback) {
        if (gVar == null || this.a == null || midCallback == null) {
            if (midCallback != null) {
                midCallback.onFail(MidConstants.ERROR_ARGUMENT, "packet == null || handler == null");
            }
        } else if (Thread.currentThread().getId() == this.a.getLooper().getThread().getId()) {
            b(gVar, midCallback);
        } else {
            this.a.post(new e(this, gVar, midCallback));
        }
    }
}
