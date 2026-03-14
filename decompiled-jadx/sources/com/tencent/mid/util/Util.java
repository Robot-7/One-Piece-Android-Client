package com.tencent.mid.util;

import android.content.Context;
import android.net.ConnectivityManager;
import android.net.NetworkInfo;
import android.net.Proxy;
import android.net.wifi.ScanResult;
import android.net.wifi.WifiInfo;
import android.net.wifi.WifiManager;
import android.os.Build;
import android.os.Environment;
import android.os.StatFs;
import android.telephony.TelephonyManager;
import android.util.DisplayMetrics;
import android.util.Log;
import android.view.WindowManager;
import com.tencent.mid.api.MidEntity;
import com.tencent.mid.api.MidService;
import com.tencent.stat.common.StatConstants;
import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.InetAddress;
import java.net.URL;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.Collections;
import java.util.List;
import java.util.zip.GZIPInputStream;
import javax.crypto.Mac;
import javax.crypto.spec.SecretKeySpec;
import org.apache.http.HttpHost;
import org.json.JSONArray;
import org.json.JSONObject;

/* JADX INFO: loaded from: classes.dex */
public class Util {
    public static byte[] StringToBytes(String str) {
        if (str == null) {
            return null;
        }
        try {
            return str.getBytes("UTF-8");
        } catch (UnsupportedEncodingException e) {
            return str.getBytes();
        }
    }

    public static String bytesToString(byte[] bArr) {
        if (bArr == null) {
            return null;
        }
        try {
            return new String(bArr, "UTF-8");
        } catch (UnsupportedEncodingException e) {
            return new String(bArr);
        }
    }

    public static boolean checkPermission(Context context, String str) {
        try {
            return context.getPackageManager().checkPermission(str, context.getPackageName()) == 0;
        } catch (Throwable th) {
            Log.e("MID", "checkPermission error", th);
            return false;
        }
    }

    public static void clear(Context context) {
        if (context == null) {
            return;
        }
        com.tencent.mid.b.g.a(context).c();
    }

    public static String decode(String str) {
        if (str == null) {
            return null;
        }
        if (Build.VERSION.SDK_INT < 8) {
            return str;
        }
        try {
            return new String(h.b(a.a(str.getBytes("UTF-8"), 0)), "UTF-8").trim().replace("\t", StatConstants.MTA_COOPERATION_TAG).replace("\n", StatConstants.MTA_COOPERATION_TAG).replace("\r", StatConstants.MTA_COOPERATION_TAG);
        } catch (Throwable th) {
            Log.e("MID", "decode error", th);
            return str;
        }
    }

    public static byte[] deocdeGZipContent(byte[] bArr) throws IOException {
        ByteArrayInputStream byteArrayInputStream = new ByteArrayInputStream(bArr);
        GZIPInputStream gZIPInputStream = new GZIPInputStream(byteArrayInputStream);
        byte[] bArr2 = new byte[4096];
        ByteArrayOutputStream byteArrayOutputStream = new ByteArrayOutputStream(bArr.length * 2);
        while (true) {
            int i = gZIPInputStream.read(bArr2);
            if (i == -1) {
                byte[] byteArray = byteArrayOutputStream.toByteArray();
                byteArrayInputStream.close();
                gZIPInputStream.close();
                byteArrayOutputStream.close();
                return byteArray;
            }
            byteArrayOutputStream.write(bArr2, 0, i);
        }
    }

    public static String encode(String str) {
        if (str == null) {
            return null;
        }
        if (Build.VERSION.SDK_INT < 8) {
            return str;
        }
        try {
            return new String(a.b(h.a(str.getBytes("UTF-8")), 0), "UTF-8").trim().replace("\t", StatConstants.MTA_COOPERATION_TAG).replace("\n", StatConstants.MTA_COOPERATION_TAG).replace("\r", StatConstants.MTA_COOPERATION_TAG);
        } catch (Throwable th) {
            Log.w("MID", "encode error", th);
            return str;
        }
    }

    public static boolean equal(MidEntity midEntity, MidEntity midEntity2) {
        return (midEntity == null || midEntity2 == null) ? midEntity == null && midEntity2 == null : midEntity.compairTo(midEntity2) == 0;
    }

    public static String getDeviceModel() {
        return Build.MODEL;
    }

    public static DisplayMetrics getDisplayMetrics(Context context) {
        DisplayMetrics displayMetrics = new DisplayMetrics();
        ((WindowManager) context.getApplicationContext().getSystemService("window")).getDefaultDisplay().getMetrics(displayMetrics);
        return displayMetrics;
    }

    public static String getExternalStorageInfo(Context context) {
        String path;
        String str = null;
        try {
            if (checkPermission(context, "android.permission.WRITE_EXTERNAL_STORAGE")) {
                String externalStorageState = Environment.getExternalStorageState();
                if (externalStorageState != null && externalStorageState.equals("mounted") && (path = Environment.getExternalStorageDirectory().getPath()) != null) {
                    StatFs statFs = new StatFs(path);
                    str = String.valueOf((((long) statFs.getBlockSize()) * ((long) statFs.getAvailableBlocks())) / 1000000) + "/" + String.valueOf((((long) statFs.getBlockCount()) * ((long) statFs.getBlockSize())) / 1000000);
                }
            } else {
                Log.e("MID", "can not get the permission of android.permission.WRITE_EXTERNAL_STORAGE");
            }
        } catch (Throwable th) {
            Log.e("MID", StatConstants.MTA_COOPERATION_TAG, th);
        }
        return str;
    }

    public static byte[] getHMAC(String str, String str2) {
        try {
            SecretKeySpec secretKeySpec = new SecretKeySpec(str.getBytes(), "hmacmd5");
            Mac mac = Mac.getInstance("HmacSHA1");
            mac.init(secretKeySpec);
            mac.update(str2.getBytes());
            return mac.doFinal();
        } catch (Exception e) {
            logWarn(e);
            return null;
        }
    }

    public static HttpHost getHttpProxy() {
        if (Proxy.getDefaultHost() != null) {
            return new HttpHost(Proxy.getDefaultHost(), Proxy.getDefaultPort());
        }
        return null;
    }

    /* JADX WARN: Unsupported multi-entry loop pattern (BACK_EDGE: B:30:0x007f -> B:40:0x0004). Please report as a decompilation issue!!! */
    public static HttpHost getHttpProxy(Context context) {
        HttpHost httpHost;
        NetworkInfo activeNetworkInfo;
        if (context == null) {
            return null;
        }
        try {
        } catch (Throwable th) {
            logWarn(th);
        }
        if (context.getPackageManager().checkPermission("android.permission.ACCESS_NETWORK_STATE", context.getPackageName()) != 0 || (activeNetworkInfo = ((ConnectivityManager) context.getSystemService("connectivity")).getActiveNetworkInfo()) == null) {
            httpHost = null;
        } else if (activeNetworkInfo.getTypeName() == null || !activeNetworkInfo.getTypeName().equalsIgnoreCase("WIFI")) {
            String extraInfo = activeNetworkInfo.getExtraInfo();
            logInfo("network type:" + extraInfo);
            if (extraInfo == null) {
                httpHost = null;
            } else if (extraInfo.equals("cmwap") || extraInfo.equals("3gwap") || extraInfo.equals("uniwap")) {
                httpHost = new HttpHost("10.0.0.172", 80);
            } else if (extraInfo.equals("ctwap")) {
                httpHost = new HttpHost("10.0.0.200", 80);
            } else {
                String defaultHost = Proxy.getDefaultHost();
                httpHost = (defaultHost == null || defaultHost.trim().length() <= 0) ? null : new HttpHost(defaultHost, Proxy.getDefaultPort());
            }
        } else {
            httpHost = null;
        }
        return httpHost;
    }

    public static String getHttpUrl() {
        return "http://pingmid.qq.com:80/";
    }

    public static String getImei(Context context) {
        try {
            if (checkPermission(context, "android.permission.READ_PHONE_STATE")) {
                String deviceId = ((TelephonyManager) context.getSystemService("phone")).getDeviceId();
                if (deviceId != null) {
                    return deviceId;
                }
            } else {
                logInfo("Could not get permission of android.permission.READ_PHONE_STATE");
            }
        } catch (Throwable th) {
            logWarn(th);
        }
        return StatConstants.MTA_COOPERATION_TAG;
    }

    public static String getLinkedWay(Context context) {
        try {
            if (checkPermission(context, "android.permission.INTERNET") && checkPermission(context, "android.permission.ACCESS_NETWORK_STATE")) {
                NetworkInfo activeNetworkInfo = ((ConnectivityManager) context.getSystemService("connectivity")).getActiveNetworkInfo();
                if (activeNetworkInfo != null && activeNetworkInfo.isConnected()) {
                    String typeName = activeNetworkInfo.getTypeName();
                    String extraInfo = activeNetworkInfo.getExtraInfo();
                    if (typeName != null) {
                        return typeName.equalsIgnoreCase("WIFI") ? "WIFI" : typeName.equalsIgnoreCase("MOBILE") ? extraInfo == null ? "MOBILE" : extraInfo : extraInfo == null ? typeName : extraInfo;
                    }
                }
            } else {
                Log.e("MID", "can not get the permission of android.permission.ACCESS_WIFI_STATE");
            }
        } catch (Throwable th) {
            Log.e("MID", StatConstants.MTA_COOPERATION_TAG, th);
        }
        return null;
    }

    public static MidEntity getNewerMidEntity(MidEntity midEntity, MidEntity midEntity2) {
        if (midEntity != null && midEntity2 != null) {
            return midEntity.compairTo(midEntity2) >= 0 ? midEntity : midEntity2;
        }
        if (midEntity != null) {
            return midEntity;
        }
        if (midEntity2 != null) {
            return midEntity2;
        }
        return null;
    }

    public static String getRemoteUrlIp(String str) {
        InetAddress byName;
        try {
            URL url = new URL(str);
            if (url != null && (byName = InetAddress.getByName(url.getHost())) != null) {
                return byName.getHostAddress();
            }
        } catch (Throwable th) {
            th.printStackTrace();
        }
        return null;
    }

    public static String getSimOperator(Context context) {
        try {
            if (checkPermission(context, "android.permission.READ_PHONE_STATE")) {
                TelephonyManager telephonyManager = (TelephonyManager) context.getSystemService("phone");
                if (telephonyManager != null) {
                    return telephonyManager.getSimOperator();
                }
            } else {
                Log.e("MID", "Could not get permission of android.permission.READ_PHONE_STATE");
            }
        } catch (Throwable th) {
            Log.e("MID", StatConstants.MTA_COOPERATION_TAG, th);
        }
        return null;
    }

    public static Integer getTelephonyNetworkType(Context context) {
        try {
            TelephonyManager telephonyManager = (TelephonyManager) context.getSystemService("phone");
            if (telephonyManager != null) {
                return Integer.valueOf(telephonyManager.getNetworkType());
            }
        } catch (Throwable th) {
        }
        return null;
    }

    public static String getWiFiBBSID(Context context) {
        try {
            WifiInfo wifiInfo = getWifiInfo(context);
            if (wifiInfo != null) {
                return wifiInfo.getBSSID();
            }
        } catch (Throwable th) {
            logWarn(th);
        }
        return null;
    }

    public static String getWiFiSSID(Context context) {
        try {
            WifiInfo wifiInfo = getWifiInfo(context);
            if (wifiInfo != null) {
                return wifiInfo.getSSID();
            }
        } catch (Throwable th) {
            logWarn(th);
        }
        return null;
    }

    public static WifiInfo getWifiInfo(Context context) {
        WifiManager wifiManager;
        if (!checkPermission(context, "android.permission.ACCESS_WIFI_STATE") || (wifiManager = (WifiManager) context.getApplicationContext().getSystemService("wifi")) == null) {
            return null;
        }
        return wifiManager.getConnectionInfo();
    }

    public static String getWifiMacAddress(Context context) {
        if (!checkPermission(context, "android.permission.ACCESS_WIFI_STATE")) {
            logInfo("Could not get permission of android.permission.ACCESS_WIFI_STATE");
            return StatConstants.MTA_COOPERATION_TAG;
        }
        try {
            WifiManager wifiManager = (WifiManager) context.getSystemService("wifi");
            return wifiManager == null ? StatConstants.MTA_COOPERATION_TAG : wifiManager.getConnectionInfo().getMacAddress();
        } catch (Exception e) {
            logInfo("get wifi address error" + e);
            return StatConstants.MTA_COOPERATION_TAG;
        }
    }

    public static JSONArray getWifiTopN(Context context, int i) {
        List<ScanResult> scanResults;
        try {
            if (checkPermission(context, "android.permission.INTERNET") && checkPermission(context, "android.permission.ACCESS_NETWORK_STATE")) {
                WifiManager wifiManager = (WifiManager) context.getSystemService("wifi");
                if (wifiManager != null && (scanResults = wifiManager.getScanResults()) != null && scanResults.size() > 0) {
                    Collections.sort(scanResults, new k());
                    JSONArray jSONArray = new JSONArray();
                    for (int i2 = 0; i2 < scanResults.size() && i2 < i; i2++) {
                        ScanResult scanResult = scanResults.get(i2);
                        JSONObject jSONObject = new JSONObject();
                        jSONObject.put("bs", scanResult.BSSID);
                        jSONObject.put("ss", scanResult.SSID);
                        jSONArray.put(jSONObject);
                    }
                    return jSONArray;
                }
            } else {
                logInfo("can not get the permisson of android.permission.INTERNET");
            }
        } catch (Throwable th) {
            logWarn(th);
        }
        return null;
    }

    public static boolean isMidValid(String str) {
        return str != null && str.trim().length() >= 40;
    }

    public static boolean isNetworkAvailable(Context context) {
        ConnectivityManager connectivityManager;
        try {
            if (checkPermission(context, "android.permission.INTERNET") && checkPermission(context, "android.permission.ACCESS_NETWORK_STATE") && (connectivityManager = (ConnectivityManager) context.getSystemService("connectivity")) != null) {
                NetworkInfo activeNetworkInfo = connectivityManager.getActiveNetworkInfo();
                if (activeNetworkInfo != null && activeNetworkInfo.isAvailable()) {
                    return true;
                }
                Log.w("MID", "Network error");
                return false;
            }
        } catch (Throwable th) {
            Log.e("MID", "isNetworkAvailable error", th);
        }
        return false;
    }

    public static boolean isStringValid(String str) {
        return (str == null || str.trim().length() == 0) ? false : true;
    }

    public static boolean isWifiNet(Context context) {
        NetworkInfo activeNetworkInfo = ((ConnectivityManager) context.getSystemService("connectivity")).getActiveNetworkInfo();
        return (activeNetworkInfo == null || activeNetworkInfo.getTypeName() == null || !activeNetworkInfo.getTypeName().equalsIgnoreCase("WIFI")) ? false : true;
    }

    public static void jsonPut(JSONObject jSONObject, String str, String str2) {
        if (isStringValid(str2)) {
            jSONObject.put(str, str2);
        }
    }

    public static void logInfo(String str) {
        if (MidService.isEnableDebug()) {
            Log.i("MID", str);
        }
    }

    public static void logWarn(Throwable th) {
        if (MidService.isEnableDebug()) {
            Log.w("MID", th);
        }
    }

    public static String md5(String str) {
        try {
            MessageDigest messageDigest = MessageDigest.getInstance("MD5");
            messageDigest.update(str.getBytes("UTF-8"));
            byte[] bArrDigest = messageDigest.digest();
            StringBuffer stringBuffer = new StringBuffer();
            for (byte b : bArrDigest) {
                stringBuffer.append((int) b);
            }
            return stringBuffer.toString();
        } catch (UnsupportedEncodingException e) {
            logWarn(e);
            return str;
        } catch (NoSuchAlgorithmException e2) {
            logWarn(e2);
            return str;
        }
    }

    public static void updateIfLocalInvalid(Context context, String str) {
        if (isMidValid(str) && !isStringValid(MidService.getLocalMidOnly(context)) && isStringValid(str)) {
            MidEntity midEntity = new MidEntity();
            midEntity.setImei(getImei(context));
            midEntity.setMac(getWifiMacAddress(context));
            midEntity.setMid(str);
            com.tencent.mid.b.g.a(context).a(midEntity);
        }
    }
}
