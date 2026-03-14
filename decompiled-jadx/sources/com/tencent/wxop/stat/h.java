package com.tencent.wxop.stat;

import android.content.Context;
import android.content.IntentFilter;
import com.igexin.sdk.PushConsts;
import com.tencent.stat.common.StatConstants;
import java.net.InetAddress;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Random;
import java.util.regex.Pattern;
import org.apache.http.HttpHost;
import org.json.JSONObject;

/* JADX INFO: loaded from: classes.dex */
public class h {
    private static h bg = null;
    private List<String> bc;
    private com.tencent.wxop.stat.b.f be;
    private Context bh;
    private com.tencent.wxop.stat.b.b bi;
    private volatile int g = 2;
    private volatile String c = StatConstants.MTA_COOPERATION_TAG;
    private volatile HttpHost bd = null;
    private int bf = 0;

    private h(Context context) {
        this.bc = null;
        this.be = null;
        this.bh = null;
        this.bi = null;
        this.bh = context.getApplicationContext();
        this.be = new com.tencent.wxop.stat.b.f();
        al.j(context);
        this.bi = com.tencent.wxop.stat.b.l.av();
        Y();
        this.bc = new ArrayList(10);
        this.bc.add("117.135.169.101");
        this.bc.add("140.207.54.125");
        this.bc.add("180.153.8.53");
        this.bc.add("120.198.203.175");
        this.bc.add("14.17.43.18");
        this.bc.add("163.177.71.186");
        this.bc.add("111.30.131.31");
        this.bc.add("123.126.121.167");
        this.bc.add("123.151.152.111");
        this.bc.add("113.142.45.79");
        this.bc.add("123.138.162.90");
        this.bc.add("103.7.30.94");
        Z();
    }

    private String O() {
        try {
            if (!d(StatConstants.MTA_SERVER_HOST)) {
                return InetAddress.getByName(StatConstants.MTA_SERVER_HOST).getHostAddress();
            }
        } catch (Exception e) {
            this.bi.b((Throwable) e);
        }
        return StatConstants.MTA_COOPERATION_TAG;
    }

    private void Y() {
        this.g = 0;
        this.bd = null;
        this.c = null;
    }

    private static boolean d(String str) {
        return Pattern.compile("(2[5][0-5]|2[0-4]\\d|1\\d{2}|\\d{1,2})\\.(25[0-5]|2[0-4]\\d|1\\d{2}|\\d{1,2})\\.(25[0-5]|2[0-4]\\d|1\\d{2}|\\d{1,2})\\.(25[0-5]|2[0-4]\\d|1\\d{2}|\\d{1,2})").matcher(str).matches();
    }

    public static h r(Context context) {
        if (bg == null) {
            synchronized (h.class) {
                if (bg == null) {
                    bg = new h(context);
                }
            }
        }
        return bg;
    }

    public final int D() {
        return this.g;
    }

    public final void I() {
        this.bf = (this.bf + 1) % this.bc.size();
    }

    public final HttpHost V() {
        return this.bd;
    }

    public final boolean W() {
        return this.g == 1;
    }

    public final boolean X() {
        return this.g != 0;
    }

    final void Z() {
        String str;
        if (!com.tencent.wxop.stat.b.r.X(this.bh)) {
            if (c.k()) {
                this.bi.b("NETWORK TYPE: network is close.");
            }
            Y();
            return;
        }
        if (c.ad) {
            String strO = O();
            if (c.k()) {
                this.bi.b("remoteIp ip is " + strO);
            }
            if (com.tencent.wxop.stat.b.l.e(strO)) {
                if (this.bc.contains(strO)) {
                    str = strO;
                } else {
                    str = this.bc.get(this.bf);
                    if (c.k()) {
                        this.bi.c(strO + " not in ip list, change to:" + str);
                    }
                }
                c.o("http://" + str + ":80/mstat/report");
            }
        }
        this.c = com.tencent.wxop.stat.b.l.E(this.bh);
        if (c.k()) {
            this.bi.b("NETWORK name:" + this.c);
        }
        if (com.tencent.wxop.stat.b.l.e(this.c)) {
            if ("WIFI".equalsIgnoreCase(this.c)) {
                this.g = 1;
            } else {
                this.g = 2;
            }
            this.bd = com.tencent.wxop.stat.b.l.v(this.bh);
        }
        if (f.a()) {
            f.n(this.bh);
        }
    }

    public final void aa() {
        this.bh.getApplicationContext().registerReceiver(new aa(this), new IntentFilter(PushConsts.ACTION_BROADCAST_NETWORK_CHANGE));
    }

    public final String b() {
        return this.c;
    }

    public final void b(String str) {
        if (c.k()) {
            this.bi.b("updateIpList " + str);
        }
        try {
            if (com.tencent.wxop.stat.b.l.e(str)) {
                JSONObject jSONObject = new JSONObject(str);
                if (jSONObject.length() > 0) {
                    Iterator<String> itKeys = jSONObject.keys();
                    while (itKeys.hasNext()) {
                        String string = jSONObject.getString(itKeys.next());
                        if (com.tencent.wxop.stat.b.l.e(string)) {
                            String[] strArrSplit = string.split(";");
                            for (String str2 : strArrSplit) {
                                if (com.tencent.wxop.stat.b.l.e(str2)) {
                                    String[] strArrSplit2 = str2.split(":");
                                    if (strArrSplit2.length > 1) {
                                        String str3 = strArrSplit2[0];
                                        if (d(str3) && !this.bc.contains(str3)) {
                                            if (c.k()) {
                                                this.bi.b("add new ip:" + str3);
                                            }
                                            this.bc.add(str3);
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
            }
        } catch (Exception e) {
            this.bi.b((Throwable) e);
        }
        this.bf = new Random().nextInt(this.bc.size());
    }
}
