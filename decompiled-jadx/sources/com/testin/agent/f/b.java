package com.testin.agent.f;

import com.tencent.stat.common.StatConstants;
import java.security.MessageDigest;

/* JADX INFO: loaded from: classes.dex */
public class b {
    public static String a(String str) {
        try {
            byte[] bArrDigest = MessageDigest.getInstance("MD5").digest(str.getBytes("UTF-8"));
            StringBuilder sb = new StringBuilder(bArrDigest.length * 2);
            for (byte b : bArrDigest) {
                if ((b & 255) < 16) {
                    sb.append("0");
                }
                sb.append(Integer.toHexString(b & 255));
            }
            return sb.toString();
        } catch (Exception e) {
            com.testin.agent.b.e.a(e);
            return StatConstants.MTA_COOPERATION_TAG;
        }
    }
}
