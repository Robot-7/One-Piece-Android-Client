package com.igexin.getuiext.util;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import org.apache.http.message.BasicNameValuePair;

/* JADX INFO: loaded from: classes.dex */
public class b {
    public static String a(HashMap map) {
        boolean z = true;
        StringBuffer stringBuffer = new StringBuffer();
        Iterator it = map.keySet().iterator();
        while (true) {
            boolean z2 = z;
            if (!it.hasNext()) {
                return stringBuffer.toString();
            }
            String str = (String) it.next();
            String str2 = (String) map.get(str);
            if (z2) {
                stringBuffer.append(str).append("=").append(str2);
                z = false;
            } else {
                stringBuffer.append("&");
                stringBuffer.append(str).append("=").append(str2);
                z = z2;
            }
        }
    }

    public static ArrayList b(HashMap map) {
        ArrayList arrayList = new ArrayList();
        for (String str : map.keySet()) {
            arrayList.add(new BasicNameValuePair(str, (String) map.get(str)));
        }
        return arrayList;
    }
}
