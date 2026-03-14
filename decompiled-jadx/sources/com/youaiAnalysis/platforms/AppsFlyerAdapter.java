package com.youaiAnalysis.platforms;

import android.annotation.SuppressLint;
import android.app.Activity;
import android.content.Context;
import android.content.SharedPreferences;
import android.os.Build;
import android.provider.Settings;
import android.telephony.TelephonyManager;
import android.util.Log;
import com.appsflyer.AppsFlyerLib;
import com.appsflyer.ConversionDataListener;
import com.igexin.download.Downloads;
import com.tencent.stat.common.StatConstants;
import com.youaiAnalysis.AnalysisBaseAdapter;
import com.youaiAnalysis.AnalysisManager;
import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.InetAddress;
import java.net.NetworkInterface;
import java.net.SocketException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Enumeration;
import java.util.GregorianCalendar;
import java.util.Locale;
import java.util.Map;
import org.apache.http.HttpEntity;
import org.apache.http.HttpResponse;
import org.apache.http.client.ClientProtocolException;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.conn.util.InetAddressUtils;
import org.apache.http.entity.ByteArrayEntity;
import org.apache.http.impl.client.DefaultHttpClient;
import org.apache.http.params.HttpConnectionParams;
import org.apache.http.params.HttpParams;
import org.codehaus.jackson.util.MinimalPrettyPrinter;
import org.json.JSONException;
import org.json.JSONObject;

/* JADX INFO: loaded from: classes.dex */
public class AppsFlyerAdapter extends AnalysisBaseAdapter {
    private static final String CollectDataUrl = "http://203.90.236.18/index.php?g=home&m=apiRequest&a=collectData";
    private static String devKey = "xTe4FqvHxdVJTTVj8xQPKa";

    public static void load(AnalysisManager registry) {
        try {
            if (Class.forName("com.appsflyer.AppsFlyerLib") != null) {
                registry.registerClass(new AppsFlyerAdapter().initAdapter());
            }
        } catch (ClassNotFoundException e) {
        }
    }

    @Override // com.youaiAnalysis.AnalysisBaseAdapter
    public void onCreate(Context context) {
        AppsFlyerLib.sendTracking(context.getApplicationContext());
    }

    @Override // com.youaiAnalysis.AnalysisBaseAdapter
    public AnalysisBaseAdapter initAdapter() {
        AppsFlyerLib.setAppsFlyerKey(devKey);
        AppsFlyerLib.setCurrencyCode(CurrencyCode.AMERICA);
        return this;
    }

    @Override // com.youaiAnalysis.AnalysisBaseAdapter
    public void converData(final Activity context, final String appkey, final String platform_type_str, final String sdkVersion) {
        SharedPreferences appsFlyerPre = context.getSharedPreferences("appsflyer", 0);
        boolean isSendData = appsFlyerPre.getBoolean("sendCollectData", false);
        if (!isSendData) {
            AppsFlyerLib.getConversionData(context, new ConversionDataListener() { // from class: com.youaiAnalysis.platforms.AppsFlyerAdapter.1
                /* JADX WARN: Type inference failed for: r0v7, types: [com.youaiAnalysis.platforms.AppsFlyerAdapter$1$1] */
                public void onConversionDataLoaded(Map<String, String> conversionData) {
                    for (String attrName : conversionData.keySet()) {
                        Log.d("AppsFlyerTest", "attribute: " + attrName + " = " + conversionData.get(attrName));
                    }
                    final String click_time = conversionData.get("click_time");
                    final String install_time = conversionData.get("install_time");
                    final String media_source = conversionData.get("media_source");
                    final String click_url = conversionData.get("click_time");
                    final String is_paid = conversionData.get("is_paid");
                    final Activity activity = context;
                    final String str = appkey;
                    final String str2 = platform_type_str;
                    final String str3 = sdkVersion;
                    new Thread() { // from class: com.youaiAnalysis.platforms.AppsFlyerAdapter.1.1
                        @Override // java.lang.Thread, java.lang.Runnable
                        public void run() throws Throwable {
                            String postData = AppsFlyerAdapter.makeAppsFlyerMsg(activity, str, str2, install_time, media_source, str3, click_url, click_time, is_paid);
                            String retData = AppsFlyerAdapter.doPost(AppsFlyerAdapter.CollectDataUrl, postData);
                            try {
                                JSONObject retJson = new JSONObject(retData);
                                int status = retJson.optInt(Downloads.COLUMN_STATUS);
                                if (status != 0) {
                                    SharedPreferences.Editor appsEditor = activity.getSharedPreferences("appsflyer", 0).edit();
                                    appsEditor.putBoolean("sendCollectData", true);
                                    appsEditor.commit();
                                }
                            } catch (JSONException e) {
                                e.printStackTrace();
                            }
                        }
                    }.start();
                }

                public void onConversionFailure(String errorMessage) {
                    Log.d("AppsFlyerTest", "error getting conversion data: " + errorMessage);
                }
            });
        }
    }

    @Override // com.youaiAnalysis.AnalysisBaseAdapter
    public void register(Context context, String type) {
        AppsFlyerLib.sendTrackingWithEvent(context.getApplicationContext(), type, StatConstants.MTA_COOPERATION_TAG);
    }

    @Override // com.youaiAnalysis.AnalysisBaseAdapter
    public void login(Context context) {
        AppsFlyerLib.sendTrackingWithEvent(context.getApplicationContext(), "login", StatConstants.MTA_COOPERATION_TAG);
    }

    @Override // com.youaiAnalysis.AnalysisBaseAdapter
    public void purchase(Context context, float price) {
        AppsFlyerLib.sendTrackingWithEvent(context.getApplicationContext(), "purchase", new StringBuilder(String.valueOf(price)).toString());
    }

    @Override // com.youaiAnalysis.AnalysisBaseAdapter
    public void setDeviceTrackingDisabled(boolean boo) {
        AppsFlyerLib.setDeviceTrackingDisabled(boo);
    }

    public static String makeAppsFlyerMsg(Activity context, String appkey, String platform_type_str, String installTime, String media_source, String sdkVersion, String click_url, String click_time, String is_paid) {
        StringBuffer datas = new StringBuffer();
        String time = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss").format(new Date()).toString();
        if (is_paid != null) {
            Date dat = new Date(is_paid);
            GregorianCalendar gc = new GregorianCalendar();
            gc.setTime(dat);
            SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
            String sb = format.format(gc.getTime());
            installTime = sb;
        }
        if (installTime == null) {
            installTime = time;
        }
        if (media_source == null) {
            media_source = StatConstants.MTA_COOPERATION_TAG;
        }
        if (click_url == null) {
            click_url = StatConstants.MTA_COOPERATION_TAG;
        }
        if (click_time == null) {
            click_time = time;
        }
        datas.append("android_id=" + Settings.Secure.getString(context.getContentResolver(), "android_id"));
        datas.append("&imei=" + ((TelephonyManager) context.getSystemService("phone")).getDeviceId());
        datas.append("&game_id=" + appkey);
        datas.append("&platform=" + platform_type_str);
        datas.append("&package=" + context.getApplication().getPackageName());
        datas.append("&media_source=" + media_source);
        datas.append("&ip=" + getLocalIpAddress());
        datas.append("&mac=" + getLocalMacAddressFromIp(context));
        datas.append("&decvice_type=" + getDeviceProductName(context));
        datas.append("&sdk_version=" + sdkVersion);
        datas.append("&os_version=" + Build.VERSION.SDK_INT);
        datas.append("&click_url=" + click_url);
        datas.append("&click_time=" + click_time);
        datas.append("&install_time=" + installTime);
        Locale locale = context.getResources().getConfiguration().locale;
        datas.append("&country_code=" + locale.getCountry());
        datas.append("&city=");
        return datas.toString();
    }

    public static String getLocalIpAddress() {
        Enumeration<NetworkInterface> en;
        try {
            en = NetworkInterface.getNetworkInterfaces();
        } catch (SocketException ex) {
            Log.e("WifiPreference IpAddress", ex.toString());
        }
        while (en.hasMoreElements()) {
            NetworkInterface intf = en.nextElement();
            Enumeration<InetAddress> enumIpAddr = intf.getInetAddresses();
            while (enumIpAddr.hasMoreElements()) {
                InetAddress inetAddress = enumIpAddr.nextElement();
                if (!inetAddress.isLoopbackAddress() && InetAddressUtils.isIPv4Address(inetAddress.getHostAddress()) && !inetAddress.getHostAddress().toString().equals("null") && inetAddress.getHostAddress() != null) {
                    return inetAddress.getHostAddress().toString().trim();
                }
                return StatConstants.MTA_COOPERATION_TAG;
            }
        }
        return StatConstants.MTA_COOPERATION_TAG;
    }

    public static String doPost(String url, String body) throws Throwable {
        DefaultHttpClient httpclient;
        BufferedReader in;
        StringBuffer stringBuffer = new StringBuffer();
        BufferedReader in2 = null;
        try {
            try {
                httpclient = new DefaultHttpClient();
                HttpParams params = httpclient.getParams();
                HttpConnectionParams.setConnectionTimeout(params, 20000);
                HttpConnectionParams.setSoTimeout(params, 20000);
                HttpPost httppost = new HttpPost(url);
                httppost.setHeader("Content-Type", "application/x-www-form-urlencoded");
                httppost.setEntity(new ByteArrayEntity(body.getBytes("UTF-8")));
                HttpResponse response = httpclient.execute(httppost);
                HttpEntity entity = response.getEntity();
                in = new BufferedReader(new InputStreamReader(entity.getContent()));
            } catch (Throwable th) {
                th = th;
            }
        } catch (IllegalStateException e) {
            e2 = e;
        } catch (ClientProtocolException e2) {
            e = e2;
        } catch (IOException e3) {
            e1 = e3;
        } catch (Exception e4) {
            e = e4;
        }
        while (true) {
            try {
                String ln = in.readLine();
                if (ln == null) {
                    break;
                }
                stringBuffer.append(ln);
                stringBuffer.append("\r\n");
            } catch (IllegalStateException e5) {
                e2 = e5;
                in2 = in;
                e2.printStackTrace();
                if (in2 != null) {
                    try {
                        in2.close();
                        in2 = null;
                    } catch (IOException e32) {
                        e32.printStackTrace();
                    }
                }
            } catch (ClientProtocolException e6) {
                e = e6;
                in2 = in;
                e.printStackTrace();
                if (in2 != null) {
                    try {
                        in2.close();
                        in2 = null;
                    } catch (IOException e33) {
                        e33.printStackTrace();
                    }
                }
            } catch (IOException e7) {
                e1 = e7;
                in2 = in;
                e1.printStackTrace();
                if (in2 != null) {
                    try {
                        in2.close();
                        in2 = null;
                    } catch (IOException e34) {
                        e34.printStackTrace();
                    }
                }
            } catch (Exception e8) {
                e = e8;
                in2 = in;
                e.printStackTrace();
                if (in2 != null) {
                    try {
                        in2.close();
                        in2 = null;
                    } catch (IOException e35) {
                        e35.printStackTrace();
                    }
                }
            } catch (Throwable th2) {
                th = th2;
                in2 = in;
                if (in2 != null) {
                    try {
                        in2.close();
                    } catch (IOException e36) {
                        e36.printStackTrace();
                    }
                }
                throw th;
            }
            return stringBuffer.toString();
        }
        httpclient.getConnectionManager().shutdown();
        if (in != null) {
            try {
                in.close();
                in2 = null;
            } catch (IOException e37) {
                e37.printStackTrace();
                in2 = in;
            }
        } else {
            in2 = in;
        }
        return stringBuffer.toString();
    }

    @SuppressLint({"NewApi"})
    public static String getLocalMacAddressFromIp(Context context) {
        try {
            NetworkInterface ne = NetworkInterface.getByInetAddress(InetAddress.getByName(getLocalIpAddress()));
            byte[] mac = ne.getHardwareAddress();
            String mac_s = byte2hex(mac);
            return mac_s;
        } catch (Exception e) {
            e.printStackTrace();
            return StatConstants.MTA_COOPERATION_TAG;
        }
    }

    public static String byte2hex(byte[] b) {
        StringBuffer hs = new StringBuffer(b.length);
        for (byte b2 : b) {
            String stmp = Integer.toHexString(b2 & 255);
            if (stmp.length() == 1) {
                hs = hs.append("0").append(stmp);
            } else {
                hs = hs.append(stmp);
            }
        }
        return String.valueOf(hs);
    }

    public static String getDeviceProductName(Context context) {
        String temp = Build.MODEL.replaceAll(MinimalPrettyPrinter.DEFAULT_ROOT_VALUE_SEPARATOR, "-");
        return String.valueOf(Build.MANUFACTURER) + "_" + temp;
    }
}
