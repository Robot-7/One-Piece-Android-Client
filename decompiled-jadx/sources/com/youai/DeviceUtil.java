package com.youai;

import android.content.Context;
import android.os.Build;
import android.os.Environment;
import android.provider.Settings;
import android.telephony.TelephonyManager;
import android.text.TextUtils;
import android.util.Log;
import com.tencent.stat.common.StatConstants;
import java.io.BufferedReader;
import java.io.File;
import java.io.FileFilter;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.FileReader;
import java.io.IOException;
import java.io.InputStream;
import java.text.DecimalFormat;
import java.util.Properties;
import java.util.UUID;
import java.util.regex.Pattern;
import org.codehaus.jackson.util.MinimalPrettyPrinter;

/* JADX INFO: loaded from: classes.dex */
public class DeviceUtil {
    public static String getDeviceId(Context context) {
        TelephonyManager telephonyManager = (TelephonyManager) context.getSystemService("phone");
        String imei = telephonyManager.getDeviceId();
        if (TextUtils.isEmpty(imei)) {
            String androidId = Settings.Secure.getString(context.getContentResolver(), "android_id");
            return androidId;
        }
        return imei;
    }

    public static String generateUUID() {
        return UUID.randomUUID().toString();
    }

    public static String getDeviceProductName(Context context) {
        String temp = Build.MODEL.replaceAll(MinimalPrettyPrinter.DEFAULT_ROOT_VALUE_SEPARATOR, "-");
        return Build.MANUFACTURER + "_" + temp;
    }

    public static String getDeviceUUID(Context context) {
        String uuid = StatConstants.MTA_COOPERATION_TAG;
        File uFile = new File(Environment.getExternalStorageDirectory().getAbsoluteFile() + "/youai/uuid.properties");
        if (uFile.exists()) {
            Properties cfgIni = new Properties();
            try {
                cfgIni.load(new FileInputStream(uFile));
                uuid = cfgIni.getProperty("uuid", null);
            } catch (FileNotFoundException e) {
            } catch (IOException e2) {
            }
            if (uuid != null && !StatConstants.MTA_COOPERATION_TAG.equals(uuid)) {
                Log.w("getDeviceUUID", uuid);
                return uuid;
            }
        } else {
            Properties cfgIni2 = new Properties();
            cfgIni2.setProperty("uuid", StatConstants.MTA_COOPERATION_TAG);
            try {
                cfgIni2.store(new FileOutputStream(uFile), "auto save, default none str");
            } catch (FileNotFoundException e3) {
            } catch (IOException e4) {
            }
        }
        try {
            TelephonyManager tmsvc = (TelephonyManager) context.getSystemService("phone");
            if (tmsvc != null) {
                uuid = tmsvc.getDeviceId();
                if (uuid == null) {
                    uuid = tmsvc.getSubscriberId();
                }
                if (uuid == null) {
                    uuid = null;
                }
            }
        } catch (Exception e5) {
        }
        if (uuid == null || StatConstants.MTA_COOPERATION_TAG.equals(uuid) || "0".equals(uuid)) {
            uuid = "uuid_" + generateUUID();
        }
        Properties cfgIni3 = new Properties();
        cfgIni3.setProperty("uuid", uuid);
        try {
            cfgIni3.store(new FileOutputStream(uFile), "auto save, generateUUID");
        } catch (FileNotFoundException e6) {
        } catch (IOException e7) {
        }
        Log.w("getDeviceUUID", uuid);
        return uuid;
    }

    public static String getTotalMemory(Context context) {
        try {
            FileReader localFileReader = new FileReader("/proc/meminfo");
            BufferedReader localBufferedReader = new BufferedReader(localFileReader, 8192);
            String str2 = localBufferedReader.readLine();
            if (str2 == null) {
                localBufferedReader.close();
                return StatConstants.MTA_COOPERATION_TAG;
            }
            String[] arrayOfString = str2.split("\\s+");
            for (String num : arrayOfString) {
                Log.i(str2, num + "\t");
            }
            double initial_memory = Integer.valueOf(arrayOfString[1]).intValue() / 1024;
            double initial_memory2 = initial_memory / 1024.0d;
            DecimalFormat df = new DecimalFormat("##.##");
            try {
                localBufferedReader.close();
                return df.format(initial_memory2);
            } catch (Exception e) {
                return StatConstants.MTA_COOPERATION_TAG;
            }
        } catch (Exception e2) {
        }
    }

    public static int getNumCores() {
        try {
            File dir = new File("/sys/devices/system/cpu/");
            if (!dir.exists()) {
                return 1;
            }
            File[] files = dir.listFiles(new FileFilter() { // from class: com.youai.DeviceUtil.1CpuFilter
                @Override // java.io.FileFilter
                public boolean accept(File pathname) {
                    return Pattern.matches("cpu[0-9]", pathname.getName());
                }
            });
            Log.d("MainActivity", "CPU Count: " + files.length);
            return files.length;
        } catch (Exception e) {
            Log.d("MainActivity", "CPU Count: Failed.");
            e.printStackTrace();
            return 1;
        }
    }

    public static String getMaxCpuFreq() {
        String result = StatConstants.MTA_COOPERATION_TAG;
        try {
            String[] args = {"/system/bin/cat", "/sys/devices/system/cpu/cpu0/cpufreq/cpuinfo_max_freq"};
            ProcessBuilder cmd = new ProcessBuilder(args);
            Process process = cmd.start();
            InputStream in = process.getInputStream();
            byte[] re = new byte[24];
            while (in.read(re) != -1) {
                result = result + new String(re);
            }
            in.close();
        } catch (Exception ex) {
            ex.printStackTrace();
            result = StatConstants.MTA_COOPERATION_TAG;
        }
        return result.trim();
    }
}
