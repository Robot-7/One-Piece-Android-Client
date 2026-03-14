package com.tencent.wxop.stat.b;

import com.pipaw.pipawpay.PipawSDK;
import com.tencent.stat.common.StatConstants;
import java.io.BufferedReader;
import java.io.File;
import java.io.FileReader;
import java.io.IOException;
import java.io.InputStream;
import org.codehaus.jackson.util.MinimalPrettyPrinter;

/* JADX INFO: loaded from: classes.dex */
final class m {
    static int D() {
        int iIntValue = 0;
        try {
            String str = StatConstants.MTA_COOPERATION_TAG;
            InputStream inputStream = new ProcessBuilder("/system/bin/cat", "/sys/devices/system/cpu/cpu0/cpufreq/cpuinfo_min_freq").start().getInputStream();
            byte[] bArr = new byte[24];
            while (inputStream.read(bArr) != -1) {
                str = str + new String(bArr);
            }
            inputStream.close();
            String strTrim = str.trim();
            if (strTrim.length() > 0) {
                iIntValue = Integer.valueOf(strTrim).intValue();
            }
        } catch (Throwable th) {
            l.cT.b(th);
        }
        return iIntValue * PipawSDK.PAY_CANCEL;
    }

    static int aA() {
        int iIntValue = 0;
        try {
            String str = StatConstants.MTA_COOPERATION_TAG;
            InputStream inputStream = new ProcessBuilder("/system/bin/cat", "/sys/devices/system/cpu/cpu0/cpufreq/cpuinfo_max_freq").start().getInputStream();
            byte[] bArr = new byte[24];
            while (inputStream.read(bArr) != -1) {
                str = str + new String(bArr);
            }
            inputStream.close();
            String strTrim = str.trim();
            if (strTrim.length() > 0) {
                iIntValue = Integer.valueOf(strTrim).intValue();
            }
        } catch (Exception e) {
            l.cT.b((Throwable) e);
        }
        return iIntValue * PipawSDK.PAY_CANCEL;
    }

    static String ax() {
        String[] strArr = {StatConstants.MTA_COOPERATION_TAG, StatConstants.MTA_COOPERATION_TAG};
        try {
            BufferedReader bufferedReader = new BufferedReader(new FileReader("/proc/cpuinfo"), 8192);
            String[] strArrSplit = bufferedReader.readLine().split("\\s+");
            for (int i = 2; i < strArrSplit.length; i++) {
                strArr[0] = strArr[0] + strArrSplit[i] + MinimalPrettyPrinter.DEFAULT_ROOT_VALUE_SEPARATOR;
            }
            bufferedReader.close();
        } catch (IOException e) {
        }
        return strArr[0];
    }

    static int r() {
        try {
            return new File("/sys/devices/system/cpu/").listFiles(new n()).length;
        } catch (Exception e) {
            e.printStackTrace();
            return 1;
        }
    }
}
