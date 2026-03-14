package com.igexin.push.e.b;

import com.igexin.push.a.k;
import java.util.Calendar;
import java.util.concurrent.TimeUnit;

/* JADX INFO: loaded from: classes.dex */
public class g extends h {
    private static g b;
    private boolean a;

    public g() {
        super(3600000L);
        this.a = false;
        this.A = true;
    }

    public static g g() {
        if (b == null) {
            b = new g();
        }
        return b;
    }

    @Override // com.igexin.push.e.b.h
    protected void a() {
        com.igexin.push.core.a.f.a().C();
    }

    @Override // com.igexin.a.a.d.a.f
    public int b() {
        return 0;
    }

    @Override // com.igexin.a.a.d.d
    public void c() {
        super.c();
        if (this.x) {
            return;
        }
        h();
    }

    public void h() {
        long timeInMillis = 3600000;
        long jCurrentTimeMillis = System.currentTimeMillis();
        if (k.f != 0) {
            Calendar calendar = Calendar.getInstance();
            if (com.igexin.push.core.a.f.a().a(jCurrentTimeMillis)) {
                if (!this.a) {
                    this.a = true;
                    com.igexin.push.d.a aVar = new com.igexin.push.d.a();
                    aVar.a(com.igexin.push.core.c.stop);
                    com.igexin.push.core.f.a().f().a(aVar);
                }
                if (k.e + k.f > 24) {
                    calendar.set(11, (k.e + k.f) - 24);
                } else {
                    calendar.set(11, k.e + k.f);
                }
                calendar.set(12, 0);
                calendar.set(13, 0);
                if (calendar.getTimeInMillis() < jCurrentTimeMillis) {
                    calendar.add(5, 1);
                }
            } else {
                if (this.a) {
                    this.a = false;
                    com.igexin.push.d.a aVar2 = new com.igexin.push.d.a();
                    aVar2.a(com.igexin.push.core.c.start);
                    com.igexin.push.core.f.a().f().a(aVar2);
                }
                calendar.set(11, k.e);
                calendar.set(12, 0);
                calendar.set(13, 0);
                if (calendar.getTimeInMillis() < jCurrentTimeMillis) {
                    calendar.add(5, 1);
                }
            }
            timeInMillis = calendar.getTimeInMillis() - jCurrentTimeMillis;
        } else if (this.a) {
            this.a = false;
            com.igexin.push.d.a aVar3 = new com.igexin.push.d.a();
            aVar3.a(com.igexin.push.core.c.start);
            com.igexin.push.core.f.a().f().a(aVar3);
        }
        if (k.g > jCurrentTimeMillis + timeInMillis) {
            timeInMillis = k.g - jCurrentTimeMillis;
            if (!this.a) {
                this.a = true;
                com.igexin.push.d.a aVar4 = new com.igexin.push.d.a();
                aVar4.a(com.igexin.push.core.c.stop);
                com.igexin.push.core.f.a().f().a(aVar4);
            }
        }
        a(timeInMillis, TimeUnit.MILLISECONDS);
    }
}
