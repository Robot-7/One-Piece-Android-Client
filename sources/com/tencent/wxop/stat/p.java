package com.tencent.wxop.stat;

import android.content.Context;
import java.io.IOException;
import java.net.InetSocketAddress;
import java.net.Socket;
import java.util.HashMap;
import java.util.Map;
import org.json.JSONArray;

/* JADX INFO: loaded from: classes.dex */
final class p implements Runnable {
    private g bM;
    private Map<String, Integer> bO = null;
    private Context e;

    public p(Context context) {
        this.e = null;
        this.bM = null;
        this.e = context;
        this.bM = null;
    }

    private static b a(String str, int i) {
        b bVar = new b();
        Socket socket = new Socket();
        int i2 = 0;
        try {
            try {
                bVar.setDomain(str);
                bVar.setPort(i);
                long jCurrentTimeMillis = System.currentTimeMillis();
                InetSocketAddress inetSocketAddress = new InetSocketAddress(str, i);
                socket.connect(inetSocketAddress, 30000);
                bVar.a(System.currentTimeMillis() - jCurrentTimeMillis);
                bVar.k(inetSocketAddress.getAddress().getHostAddress());
                socket.close();
            } catch (IOException e) {
                i2 = -1;
                f.aV.b((Throwable) e);
                try {
                    socket.close();
                } catch (Throwable th) {
                    f.aV.b(th);
                }
            }
            bVar.setStatusCode(i2);
            return bVar;
        } finally {
            try {
                socket.close();
            } catch (Throwable th2) {
                f.aV.b(th2);
            }
        }
    }

    private static Map<String, Integer> ag() {
        String str;
        HashMap map = new HashMap();
        String strL = c.l("__MTA_TEST_SPEED__");
        if (strL != null && strL.trim().length() != 0) {
            for (String str2 : strL.split(";")) {
                String[] strArrSplit = str2.split(",");
                if (strArrSplit != null && strArrSplit.length == 2 && (str = strArrSplit[0]) != null && str.trim().length() != 0) {
                    try {
                        map.put(str, Integer.valueOf(Integer.valueOf(strArrSplit[1]).intValue()));
                    } catch (NumberFormatException e) {
                        f.aV.b((Throwable) e);
                    }
                }
            }
        }
        return map;
    }

    @Override // java.lang.Runnable
    public final void run() {
        try {
            if (this.bO == null) {
                this.bO = ag();
            }
            if (this.bO == null || this.bO.size() == 0) {
                f.aV.b("empty domain list.");
                return;
            }
            JSONArray jSONArray = new JSONArray();
            for (Map.Entry<String, Integer> entry : this.bO.entrySet()) {
                String key = entry.getKey();
                if (key == null || key.length() == 0) {
                    f.aV.c("empty domain name.");
                } else if (entry.getValue() == null) {
                    f.aV.c("port is null for " + key);
                } else {
                    jSONArray.put(a(entry.getKey(), entry.getValue().intValue()).i());
                }
            }
            if (jSONArray.length() != 0) {
                com.tencent.wxop.stat.a.g gVar = new com.tencent.wxop.stat.a.g(this.e, f.a(this.e, false, this.bM), this.bM);
                gVar.b(jSONArray.toString());
                new q(gVar).ah();
            }
        } catch (Throwable th) {
            f.aV.b(th);
        }
    }
}
