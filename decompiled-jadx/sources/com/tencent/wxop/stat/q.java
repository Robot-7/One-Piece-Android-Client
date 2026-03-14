package com.tencent.wxop.stat;

import android.content.Context;
import com.pipaw.pipawpay.PipawSDK;

/* JADX INFO: loaded from: classes.dex */
final class q {
    private static volatile long bU = 0;
    private com.tencent.wxop.stat.a.d bP;
    private d bQ;
    private boolean bR;
    private Context bS;
    private long bT = System.currentTimeMillis();

    public q(com.tencent.wxop.stat.a.d dVar) {
        this.bQ = null;
        this.bR = false;
        this.bS = null;
        this.bP = dVar;
        this.bQ = c.j();
        this.bR = dVar.X();
        this.bS = dVar.J();
    }

    private void H() {
        if (u.ai().aI <= 0 || !c.ax) {
            a(new t(this));
        } else {
            u.ai().b(this.bP, null, this.bR, true);
            u.ai().b(-1);
        }
    }

    private void a(ak akVar) {
        al.aa(f.aY).a(this.bP, akVar);
    }

    public final void ah() {
        boolean z;
        if (c.ae <= 0) {
            z = false;
        } else {
            if (this.bT > f.aO) {
                f.aN.clear();
                long unused = f.aO = this.bT + c.af;
                if (c.k()) {
                    f.aV.b("clear methodsCalledLimitMap, nextLimitCallClearTime=" + f.aO);
                }
            }
            Integer numValueOf = Integer.valueOf(this.bP.ac().r());
            Integer num = (Integer) f.aN.get(numValueOf);
            if (num != null) {
                f.aN.put(numValueOf, Integer.valueOf(num.intValue() + 1));
                if (num.intValue() > c.ae) {
                    if (c.k()) {
                        f.aV.d("event " + this.bP.af() + " was discard, cause of called limit, current:" + num + ", limit:" + c.ae + ", period:" + c.af + " ms");
                    }
                    z = true;
                }
            } else {
                f.aN.put(numValueOf, 1);
            }
            z = false;
        }
        if (z) {
        }
        if (c.ay > 0 && this.bT >= bU) {
            f.p(this.bS);
            bU = this.bT + c.az;
            if (c.k()) {
                f.aV.b("nextFlushTime=" + bU);
            }
        }
        if (!h.r(this.bS).X()) {
            u.s(this.bS).b(this.bP, null, this.bR, false);
            return;
        }
        if (c.k()) {
            f.aV.b("sendFailedCount=" + f.aI);
        }
        if (f.a()) {
            u.s(this.bS).b(this.bP, null, this.bR, false);
            if (this.bT - f.aX > 1800000) {
                f.n(this.bS);
                return;
            }
            return;
        }
        if (this.bP.ae() != null && this.bP.ae().R()) {
            this.bQ = d.INSTANT;
        }
        if (c.ah && h.r(f.aY).W()) {
            this.bQ = d.INSTANT;
        }
        if (c.k()) {
            f.aV.b("strategy=" + this.bQ.name());
        }
        switch (k.bL[this.bQ.ordinal()]) {
            case 1:
                H();
                break;
            case 2:
                u.s(this.bS).b(this.bP, null, this.bR, false);
                if (c.k()) {
                    f.aV.b("PERIOD currTime=" + this.bT + ",nextPeriodSendTs=" + f.aZ + ",difftime=" + (f.aZ - this.bT));
                }
                if (f.aZ == 0) {
                    f.aZ = com.tencent.wxop.stat.b.q.g(this.bS, "last_period_ts");
                    if (this.bT > f.aZ) {
                        f.q(this.bS);
                    }
                    long jU = this.bT + ((long) (c.u() * 60 * PipawSDK.PAY_CANCEL));
                    if (f.aZ > jU) {
                        f.aZ = jU;
                    }
                    ag.Z(this.bS).ah();
                }
                if (c.k()) {
                    f.aV.b("PERIOD currTime=" + this.bT + ",nextPeriodSendTs=" + f.aZ + ",difftime=" + (f.aZ - this.bT));
                }
                if (this.bT > f.aZ) {
                    f.q(this.bS);
                }
                break;
            case 3:
            case 4:
                u.s(this.bS).b(this.bP, null, this.bR, false);
                break;
            case 5:
                u.s(this.bS).b(this.bP, new r(this), this.bR, true);
                break;
            case 6:
                if (h.r(f.aY).D() != 1) {
                    u.s(this.bS).b(this.bP, null, this.bR, false);
                } else {
                    H();
                }
                break;
            case 7:
                if (com.tencent.wxop.stat.b.l.y(this.bS)) {
                    a(new s(this));
                }
                break;
            default:
                f.aV.error("Invalid stat strategy:" + c.j());
                break;
        }
    }
}
