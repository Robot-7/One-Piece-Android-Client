package com.youai;

import android.app.Activity;
import android.content.Context;
import android.os.Build;
import android.provider.Settings;
import android.telephony.TelephonyManager;
import android.util.Log;
import com.tencent.stat.common.StatConstants;
import com.youai.PlatformAndGameInfo;
import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.UnsupportedEncodingException;
import java.net.InetAddress;
import java.net.NetworkInterface;
import java.net.SocketException;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Enumeration;
import java.util.GregorianCalendar;
import java.util.Locale;
import java.util.Properties;
import org.apache.http.HttpEntity;
import org.apache.http.HttpResponse;
import org.apache.http.client.ClientProtocolException;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.conn.util.InetAddressUtils;
import org.apache.http.entity.ByteArrayEntity;
import org.apache.http.impl.client.DefaultHttpClient;
import org.apache.http.params.HttpConnectionParams;
import org.apache.http.params.HttpParams;
import org.codehaus.jackson.map.DeserializationConfig;
import org.codehaus.jackson.map.ObjectMapper;

/* JADX INFO: loaded from: classes.dex */
public class Util {
    private static ObjectMapper objectMapper = new ObjectMapper();

    static {
        objectMapper.setDateFormat(new SimpleDateFormat("yyyy-MM-dd"));
        objectMapper.setDeserializationConfig(objectMapper.getDeserializationConfig().without(DeserializationConfig.Feature.FAIL_ON_UNKNOWN_PROPERTIES));
    }

    public static Object decodeJson(String json, Class<?> pojoClass) throws Exception {
        try {
            return objectMapper.readValue(json, pojoClass);
        } catch (Exception e) {
            throw e;
        }
    }

    public static String encodeJson(Object o) throws Exception {
        try {
            return objectMapper.writeValueAsString(o);
        } catch (Exception e) {
            throw e;
        }
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

    public static String makeAppsFlyerMsg(Activity context, PlatformAndGameInfo.GameInfo gameInfo, String installTime, String media_source, String sdkVersion, String click_url, String click_time, String is_paid) {
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
        datas.append("&game_id=" + gameInfo.app_key);
        datas.append("&platform=" + gameInfo.platform_type_str);
        datas.append("&package=" + context.getApplication().getPackageName());
        datas.append("&media_source=" + media_source);
        datas.append("&ip=" + getLocalIpAddress());
        datas.append("&mac=" + getLocalMacAddressFromIp(context));
        datas.append("&decvice_type=" + DeviceUtil.getDeviceProductName(context));
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

    public static String doGet(String url) {
        StringBuffer stringBuffer = new StringBuffer();
        DefaultHttpClient httpclient = new DefaultHttpClient();
        HttpGet httpget = new HttpGet(url);
        httpget.setHeader("Content-Type", "application/x-www-form-urlencoded");
        try {
            HttpResponse response = httpclient.execute(httpget);
            if (response.getStatusLine().getStatusCode() == 200) {
                HttpEntity entity = response.getEntity();
                BufferedReader in = new BufferedReader(new InputStreamReader(entity.getContent()));
                while (true) {
                    String ln = in.readLine();
                    if (ln == null) {
                        break;
                    }
                    stringBuffer.append(ln);
                    stringBuffer.append("\r\n");
                }
                httpclient.getConnectionManager().shutdown();
            }
        } catch (ClientProtocolException e) {
        } catch (IOException e2) {
        } catch (Exception e3) {
        }
        return stringBuffer.toString();
    }

    public static String getMD5Str(String str) {
        MessageDigest messageDigest = null;
        try {
            messageDigest = MessageDigest.getInstance("MD5");
            messageDigest.reset();
            messageDigest.update(str.getBytes("UTF-8"));
        } catch (UnsupportedEncodingException e) {
            e.printStackTrace();
        } catch (NoSuchAlgorithmException e2) {
            System.out.println("NoSuchAlgorithmException caught!");
            System.exit(-1);
        }
        byte[] byteArray = messageDigest.digest();
        StringBuffer md5StrBuff = new StringBuffer();
        for (int i = 0; i < byteArray.length; i++) {
            if (Integer.toHexString(byteArray[i] & 255).length() == 1) {
                md5StrBuff.append("0").append(Integer.toHexString(byteArray[i] & 255));
            } else {
                md5StrBuff.append(Integer.toHexString(byteArray[i] & 255));
            }
        }
        return md5StrBuff.toString();
    }

    public static String getConfig(String key) throws Exception {
        try {
            InputStream in = Util.class.getResourceAsStream("/conf.Properties");
            Properties p = new Properties();
            p.load(in);
            return p.get(key).toString().trim();
        } catch (Exception e) {
            System.out.println("配置文件不存在" + e.toString());
            return StatConstants.MTA_COOPERATION_TAG;
        }
    }
}
