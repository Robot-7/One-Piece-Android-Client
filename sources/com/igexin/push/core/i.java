package com.igexin.push.core;

import android.net.ConnectivityManager;
import android.net.NetworkInfo;
import com.pipaw.pipawpay.PipawSDK;

/* JADX INFO: loaded from: classes.dex */
public class i {
    private static i e;
    public long a = 240000;
    private l b = l.DETECT;
    private long c = 0;
    private ConnectivityManager d = f.a().h();

    private i() {
    }

    public static i a() {
        if (e == null) {
            e = new i();
        }
        return e;
    }

    public long a(long j, long j2) {
        return j > j2 ? j : j2;
    }

    public void a(long j) {
        this.a = j;
    }

    public void a(k kVar) {
        switch (this.b) {
            case DETECT:
                switch (kVar) {
                    case HEARTBEAT_OK:
                        a(b(this.a + 60000, 420000L));
                        a(l.DETECT);
                        break;
                    case HEARTBEAT_TIMEOUT:
                    case NETWORK_ERROR:
                        this.c++;
                        if (this.c >= 2) {
                            a(a(this.a - 60000, 240000L));
                            a(l.STABLE);
                        }
                        break;
                    case NETWORK_SWITCH:
                        a(240000L);
                        a(l.DETECT);
                        break;
                }
                break;
            case STABLE:
                switch (kVar) {
                    case HEARTBEAT_OK:
                        a(l.STABLE);
                        break;
                    case HEARTBEAT_TIMEOUT:
                    case NETWORK_ERROR:
                        a(a(this.a - 60000, 240000L));
                        this.c++;
                        if (this.c >= 2) {
                            a(240000L);
                            a(l.PENDING);
                        }
                        break;
                    case NETWORK_SWITCH:
                        a(240000L);
                        a(l.DETECT);
                        break;
                }
                break;
            case PENDING:
                switch (kVar) {
                    case HEARTBEAT_OK:
                        a(240000L);
                        a(l.DETECT);
                        break;
                    case HEARTBEAT_TIMEOUT:
                    case NETWORK_ERROR:
                        a(l.PENDING);
                        break;
                    case NETWORK_SWITCH:
                        a(240000L);
                        a(l.DETECT);
                        break;
                }
                break;
        }
    }

    public void a(l lVar) {
        this.b = lVar;
        this.c = 0L;
    }

    public long b() {
        long j = this.a;
        if (com.igexin.push.a.k.h > 0) {
            j = com.igexin.push.a.k.h * PipawSDK.PAY_CANCEL;
        }
        NetworkInfo activeNetworkInfo = this.d.getActiveNetworkInfo();
        if (activeNetworkInfo == null || !activeNetworkInfo.isAvailable()) {
            return 3600000L;
        }
        if (g.o && f.a().e().a()) {
            return j;
        }
        return 3600000L;
    }

    public long b(long j, long j2) {
        return j < j2 ? j : j2;
    }
}
