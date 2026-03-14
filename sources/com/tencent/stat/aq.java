package com.tencent.stat;

import android.content.Context;
import com.pipaw.pipawpay.PipawSDK;

/* JADX INFO: loaded from: classes.dex */
class aq {
    private static volatile long f = 0;
    private com.tencent.stat.a.e a;
    private StatReportStrategy b;
    private boolean c;
    private Context d;
    private long e = System.currentTimeMillis();

    public aq(com.tencent.stat.a.e eVar) {
        this.b = null;
        this.c = false;
        this.d = null;
        this.a = eVar;
        this.b = StatConfig.getStatSendStrategy();
        this.c = eVar.f();
        this.d = eVar.e();
    }

    private void a(StatDispatchCallback statDispatchCallback) {
        g.b(StatServiceImpl.t).a(this.a, statDispatchCallback);
    }

    private void b() {
        if (this.a.d() != null && this.a.d().isSendImmediately()) {
            this.b = StatReportStrategy.INSTANT;
        }
        if (StatConfig.j && a.a(StatServiceImpl.t).e()) {
            this.b = StatReportStrategy.INSTANT;
        }
        if (StatConfig.isDebugEnable()) {
            StatServiceImpl.q.i("strategy=" + this.b.name());
        }
        switch (ag.a[this.b.ordinal()]) {
            case 1:
                c();
                break;
            case 2:
                au.a(this.d).a(this.a, (StatDispatchCallback) null, this.c, false);
                if (StatConfig.isDebugEnable()) {
                    StatServiceImpl.q.i("PERIOD currTime=" + this.e + ",nextPeriodSendTs=" + StatServiceImpl.c + ",difftime=" + (StatServiceImpl.c - this.e));
                }
                if (StatServiceImpl.c == 0) {
                    StatServiceImpl.c = com.tencent.stat.common.p.a(this.d, "last_period_ts", 0L);
                    if (this.e > StatServiceImpl.c) {
                        StatServiceImpl.f(this.d);
                    }
                    long sendPeriodMinutes = this.e + ((long) (StatConfig.getSendPeriodMinutes() * 60 * PipawSDK.PAY_CANCEL));
                    if (StatServiceImpl.c > sendPeriodMinutes) {
                        StatServiceImpl.c = sendPeriodMinutes;
                    }
                    d.a(this.d).a();
                }
                if (StatConfig.isDebugEnable()) {
                    StatServiceImpl.q.i("PERIOD currTime=" + this.e + ",nextPeriodSendTs=" + StatServiceImpl.c + ",difftime=" + (StatServiceImpl.c - this.e));
                }
                if (this.e > StatServiceImpl.c) {
                    StatServiceImpl.f(this.d);
                }
                break;
            case 3:
            case 4:
                au.a(this.d).a(this.a, (StatDispatchCallback) null, this.c, false);
                break;
            case 5:
                au.a(this.d).a(this.a, (StatDispatchCallback) new ar(this), this.c, true);
                break;
            case 6:
                if (a.a(StatServiceImpl.t).c() != 1) {
                    au.a(this.d).a(this.a, (StatDispatchCallback) null, this.c, false);
                } else {
                    c();
                }
                break;
            case 7:
                if (com.tencent.stat.common.k.e(this.d)) {
                    a(new as(this));
                }
                break;
            default:
                StatServiceImpl.q.error("Invalid stat strategy:" + StatConfig.getStatSendStrategy());
                break;
        }
    }

    private void c() {
        if (au.b().a <= 0 || !StatConfig.l) {
            a(new at(this));
        } else {
            au.b().a(this.a, (StatDispatchCallback) null, this.c, true);
            au.b().a(-1);
        }
    }

    private boolean d() {
        if (StatConfig.h > 0) {
            if (this.e > StatServiceImpl.h) {
                StatServiceImpl.g.clear();
                long unused = StatServiceImpl.h = this.e + StatConfig.i;
                if (StatConfig.isDebugEnable()) {
                    StatServiceImpl.q.i("clear methodsCalledLimitMap, nextLimitCallClearTime=" + StatServiceImpl.h);
                }
            }
            Integer numValueOf = Integer.valueOf(this.a.a().a());
            Integer num = (Integer) StatServiceImpl.g.get(numValueOf);
            if (num != null) {
                StatServiceImpl.g.put(numValueOf, Integer.valueOf(num.intValue() + 1));
                if (num.intValue() > StatConfig.h) {
                    if (StatConfig.isDebugEnable()) {
                        StatServiceImpl.q.e("event " + this.a.g() + " was discard, cause of called limit, current:" + num + ", limit:" + StatConfig.h + ", period:" + StatConfig.i + " ms");
                    }
                    return true;
                }
            } else {
                StatServiceImpl.g.put(numValueOf, 1);
            }
        }
        return false;
    }

    public void a() {
        if (d()) {
            return;
        }
        if (StatConfig.p != null) {
            String strG = this.a.g();
            if (StatConfig.isDebugEnable()) {
                StatServiceImpl.q.i("transfer event data:" + strG);
            }
            StatConfig.p.onTransfer(strG);
            return;
        }
        if (StatConfig.m > 0 && this.e >= f) {
            StatServiceImpl.flushDataToDB(this.d);
            f = this.e + StatConfig.n;
            if (StatConfig.isDebugEnable()) {
                StatServiceImpl.q.i("nextFlushTime=" + f);
            }
        }
        if (!a.a(this.d).f()) {
            au.a(this.d).a(this.a, (StatDispatchCallback) null, this.c, false);
            return;
        }
        if (StatConfig.isDebugEnable()) {
            StatServiceImpl.q.i("sendFailedCount=" + StatServiceImpl.a);
        }
        if (!StatServiceImpl.a()) {
            b();
            return;
        }
        au.a(this.d).a(this.a, (StatDispatchCallback) null, this.c, false);
        if (this.e - StatServiceImpl.b > 1800000) {
            StatServiceImpl.e(this.d);
        }
    }
}
