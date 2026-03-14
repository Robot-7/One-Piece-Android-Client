package com.tencent.mid.a;

import android.content.Context;
import com.tencent.mid.api.MidCallback;
import com.tencent.mid.api.MidConstants;
import com.tencent.mid.api.MidEntity;
import com.tencent.mid.util.Util;
import java.util.ArrayList;
import java.util.Arrays;

/* JADX INFO: loaded from: classes.dex */
public class h implements Runnable {
    private Context a;
    private MidCallback b;
    private int c;

    public h(Context context, int i, MidCallback midCallback) {
        this.a = null;
        this.b = null;
        this.c = 0;
        this.a = context;
        this.c = i;
        this.b = midCallback;
    }

    private void a() {
        MidEntity midEntityA = com.tencent.mid.b.g.a(this.a).a(new ArrayList(Arrays.asList(1)));
        MidEntity midEntityA2 = com.tencent.mid.b.g.a(this.a).a(new ArrayList(Arrays.asList(2)));
        MidEntity midEntityA3 = com.tencent.mid.b.g.a(this.a).a(new ArrayList(Arrays.asList(4)));
        if (Util.equal(midEntityA, midEntityA2) && Util.equal(midEntityA, midEntityA3)) {
            Util.logInfo("local mid check passed.");
            return;
        }
        MidEntity newerMidEntity = Util.getNewerMidEntity(Util.getNewerMidEntity(midEntityA, midEntityA2), Util.getNewerMidEntity(midEntityA, midEntityA3));
        Util.logInfo("local mid check failed, redress with mid:" + newerMidEntity.toString());
        com.tencent.mid.b.g.a(this.a).a(newerMidEntity);
    }

    private void b() {
        d.a(this.a).a(new g(this.a), new i(this));
    }

    private void c() {
        com.tencent.mid.b.a aVarB = com.tencent.mid.b.g.a(this.a).b();
        if (aVarB == null) {
            Util.logInfo("CheckEntity is null");
            return;
        }
        int iC = aVarB.c() + 1;
        long jAbs = Math.abs(System.currentTimeMillis() - aVarB.b());
        Util.logInfo("check entity: " + aVarB.toString() + ",duration:" + jAbs);
        if ((iC <= aVarB.d() || jAbs <= a.a) && jAbs <= ((long) aVarB.a()) * a.a) {
            aVarB.b(iC);
            com.tencent.mid.b.g.a(this.a).a(aVarB);
        } else {
            a();
            b();
        }
    }

    @Override // java.lang.Runnable
    public void run() {
        Util.logInfo("request type:" + this.c);
        switch (this.c) {
            case 1:
                if (!Util.isNetworkAvailable(this.a)) {
                    this.b.onFail(MidConstants.ERROR_NETWORK, "network not available.");
                } else {
                    d.a(this.a).a(new g(this.a), this.b);
                }
                break;
            case 2:
                if (Util.isNetworkAvailable(this.a)) {
                    c();
                }
                break;
            default:
                Util.logInfo("wrong type:" + this.c);
                break;
        }
    }
}
