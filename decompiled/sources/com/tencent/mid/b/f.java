package com.tencent.mid.b;

import android.content.Context;
import com.tencent.mid.api.MidEntity;
import com.tencent.mid.util.Util;

/* JADX INFO: loaded from: classes.dex */
public abstract class f {
    protected Context a;

    protected f(Context context) {
        this.a = null;
        this.a = context;
    }

    private void d(String str) {
        if (a()) {
            a(b(str));
        }
    }

    public static String e() {
        return Util.decode("6X8Y4XdM2Vhvn0I=");
    }

    public static String f() {
        return Util.decode("6X8Y4XdM2Vhvn0KfzcEatGnWaNU=");
    }

    public static String g() {
        return Util.decode("4kU71lN96TJUomD1vOU9lgj9U+kKmxDPLVM+zzjst5U=");
    }

    private String l() {
        if (a()) {
            return c(b());
        }
        return null;
    }

    public void a(MidEntity midEntity) {
        if (midEntity == null) {
            return;
        }
        d(midEntity.toString());
    }

    protected abstract void a(a aVar);

    protected abstract void a(String str);

    protected abstract boolean a();

    protected abstract String b();

    protected String b(String str) {
        return Util.encode(str);
    }

    public void b(a aVar) {
        if (aVar != null && a()) {
            a(aVar);
        }
    }

    protected String c(String str) {
        return Util.decode(str);
    }

    protected abstract void c();

    protected abstract a d();

    public MidEntity h() {
        String strL = l();
        if (strL != null) {
            return MidEntity.parse(strL);
        }
        return null;
    }

    void i() {
        if (a()) {
            c();
        }
    }

    public a j() {
        if (a()) {
            return d();
        }
        return null;
    }

    protected String k() {
        return Util.decode("4kU71lN96TJUomD1vOU9lgj9Tw==");
    }
}
