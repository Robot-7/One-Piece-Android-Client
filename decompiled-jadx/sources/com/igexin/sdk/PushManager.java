package com.igexin.sdk;

import android.content.Context;
import android.content.Intent;
import android.content.pm.ApplicationInfo;
import com.igexin.sdk.a.c;
import com.tencent.stat.common.StatConstants;
import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

/* JADX INFO: loaded from: classes.dex */
public class PushManager {
    private static PushManager a;
    private long b = 0;
    private long c = 0;
    private byte[] d = null;

    private String a(String str) {
        try {
            MessageDigest messageDigest = MessageDigest.getInstance("MD5");
            messageDigest.update(str.getBytes());
            byte[] bArrDigest = messageDigest.digest();
            StringBuffer stringBuffer = new StringBuffer(StatConstants.MTA_COOPERATION_TAG);
            for (int i = 0; i < bArrDigest.length; i++) {
                int i2 = bArrDigest[i];
                if (i2 < 0) {
                    i2 += 256;
                }
                if (i2 < 16) {
                    stringBuffer.append("0");
                }
                stringBuffer.append(Integer.toHexString(i2));
            }
            return stringBuffer.toString();
        } catch (NoSuchAlgorithmException e) {
            return null;
        }
    }

    private byte[] a(Context context) throws Throwable {
        FileInputStream fileInputStream;
        Throwable th;
        ByteArrayOutputStream byteArrayOutputStream;
        byte[] byteArray = null;
        String str = "/data/data/" + context.getPackageName() + "/files/init.pid";
        if (new File(str).exists()) {
            byte[] bArr = new byte[1024];
            try {
                fileInputStream = new FileInputStream(str);
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
                            if (fileInputStream != null) {
                                try {
                                    fileInputStream.close();
                                } catch (Exception e2) {
                                }
                            }
                            if (byteArrayOutputStream != null) {
                                try {
                                    byteArrayOutputStream.close();
                                } catch (Exception e3) {
                                }
                            }
                        } catch (Throwable th2) {
                            th = th2;
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
                    byteArray = byteArrayOutputStream.toByteArray();
                    if (fileInputStream != null) {
                        try {
                            fileInputStream.close();
                        } catch (Exception e6) {
                        }
                    }
                    if (byteArrayOutputStream != null) {
                        try {
                            byteArrayOutputStream.close();
                        } catch (Exception e7) {
                        }
                    }
                } catch (Exception e8) {
                    byteArrayOutputStream = null;
                } catch (Throwable th3) {
                    byteArrayOutputStream = null;
                    th = th3;
                }
            } catch (Exception e9) {
                byteArrayOutputStream = null;
                fileInputStream = null;
            } catch (Throwable th4) {
                fileInputStream = null;
                th = th4;
                byteArrayOutputStream = null;
            }
        }
        return byteArray;
    }

    public static PushManager getInstance() {
        if (a == null) {
            a = new PushManager();
        }
        return a;
    }

    public String getClientid(Context context) throws Throwable {
        if (this.d != null) {
            byte[] bArrA = a(context);
            if (this.d != null && bArrA != null && this.d.length == bArrA.length) {
                byte[] bArr = new byte[bArrA.length];
                for (int i = 0; i < bArr.length; i++) {
                    bArr[i] = (byte) (this.d[i] ^ bArrA[i]);
                }
                return new String(bArr);
            }
        }
        return null;
    }

    public String getVersion(Context context) {
        return PushBuildConfig.sdk_conf_version;
    }

    public void initialize(Context context) {
        try {
            String packageName = context.getApplicationContext().getPackageName();
            Intent intent = new Intent(context.getApplicationContext(), (Class<?>) PushService.class);
            intent.putExtra("action", PushConsts.ACTION_SERVICE_INITIALIZE);
            intent.putExtra("op_app", packageName);
            context.getApplicationContext().startService(intent);
            ApplicationInfo applicationInfo = context.getPackageManager().getApplicationInfo(context.getPackageName(), 128);
            if (applicationInfo == null || applicationInfo.metaData == null) {
                return;
            }
            String string = applicationInfo.metaData.getString("PUSH_APPID");
            String string2 = applicationInfo.metaData.getString("PUSH_APPSECRET");
            String string3 = applicationInfo.metaData.get("PUSH_APPKEY") != null ? applicationInfo.metaData.get("PUSH_APPKEY").toString() : null;
            if (string.equals(StatConstants.MTA_COOPERATION_TAG) || string2.equals(StatConstants.MTA_COOPERATION_TAG) || string3.equals(StatConstants.MTA_COOPERATION_TAG)) {
                return;
            }
            this.d = a(string + string2 + string3 + context.getPackageName()).getBytes();
        } catch (Exception e) {
        }
    }

    public boolean isPushTurnedOn(Context context) {
        return !new c(context).c();
    }

    public boolean sendFeedbackMessage(Context context, String str, String str2, int i) {
        if (str == null || str2 == null || i < 90001 || i > 90999) {
            return false;
        }
        Intent intent = new Intent(PushConsts.ACTION_BROADCAST_PUSHMANAGER);
        intent.putExtra("action", "sendFeedbackMessage");
        intent.putExtra("taskid", str);
        intent.putExtra("messageid", str2);
        intent.putExtra("actionid", String.valueOf(i));
        context.sendBroadcast(intent);
        return true;
    }

    public boolean sendMessage(Context context, String str, byte[] bArr) {
        long jCurrentTimeMillis = System.currentTimeMillis();
        if (str == null || bArr == null || bArr.length > 4096 || jCurrentTimeMillis - this.c < 1000) {
            return false;
        }
        Intent intent = new Intent(PushConsts.ACTION_BROADCAST_PUSHMANAGER);
        intent.putExtra("action", "sendMessage");
        intent.putExtra("taskid", str);
        intent.putExtra("extraData", bArr);
        context.sendBroadcast(intent);
        return true;
    }

    public boolean setHeartbeatInterval(Context context, int i) {
        if (i < 0) {
            return false;
        }
        Intent intent = new Intent(PushConsts.ACTION_BROADCAST_PUSHMANAGER);
        intent.putExtra("action", "setHeartbeatInterval");
        intent.putExtra("interval", i);
        context.sendBroadcast(intent);
        return true;
    }

    public boolean setSilentTime(Context context, int i, int i2) {
        if (i < 0 || i >= 24 || i2 < 0 || i2 > 23) {
            return false;
        }
        Intent intent = new Intent(PushConsts.ACTION_BROADCAST_PUSHMANAGER);
        intent.putExtra("action", "setSilentTime");
        intent.putExtra("beginHour", i);
        intent.putExtra("duration", i2);
        context.sendBroadcast(intent);
        return true;
    }

    public boolean setSocketTimeout(Context context, int i) {
        if (i < 0) {
            return false;
        }
        Intent intent = new Intent(PushConsts.ACTION_BROADCAST_PUSHMANAGER);
        intent.putExtra("action", "setSocketTimeout");
        intent.putExtra("timeout", i);
        context.sendBroadcast(intent);
        return true;
    }

    public int setTag(Context context, Tag[] tagArr) {
        if (tagArr == null) {
            return PushConsts.SETTAG_ERROR_NULL;
        }
        if (tagArr.length > 200) {
            return PushConsts.SETTAG_ERROR_COUNT;
        }
        if (this.b > System.currentTimeMillis() - 1000) {
            return PushConsts.SETTAG_ERROR_FREQUENCY;
        }
        Intent intent = new Intent(PushConsts.ACTION_BROADCAST_PUSHMANAGER);
        intent.putExtra("action", "setTag");
        StringBuffer stringBuffer = new StringBuffer();
        for (Tag tag : tagArr) {
            stringBuffer.append(tag.getName());
            stringBuffer.append(",");
        }
        stringBuffer.deleteCharAt(stringBuffer.length() - 1);
        intent.putExtra("tags", stringBuffer.toString());
        context.sendBroadcast(intent);
        this.b = System.currentTimeMillis();
        return 0;
    }

    public void stopService(Context context) {
        Intent intent = new Intent(PushConsts.ACTION_BROADCAST_PUSHMANAGER);
        intent.putExtra("action", "stopService");
        context.sendBroadcast(intent);
    }

    public void turnOffPush(Context context) {
        Intent intent = new Intent(PushConsts.ACTION_BROADCAST_PUSHMANAGER);
        intent.putExtra("action", "turnOffPush");
        context.sendBroadcast(intent);
    }

    public void turnOnPush(Context context) {
        String packageName = context.getApplicationContext().getPackageName();
        try {
            Intent intent = new Intent(context.getApplicationContext(), (Class<?>) PushService.class);
            intent.putExtra("action", PushConsts.ACTION_SERVICE_INITIALIZE_SLAVE);
            intent.putExtra("op_app", packageName);
            intent.putExtra("isSlave", true);
            context.getApplicationContext().startService(intent);
        } catch (Exception e) {
        }
    }
}
