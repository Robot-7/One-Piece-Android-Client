package com.flurry.sdk;

import com.tencent.stat.common.StatConstants;
import java.nio.ByteBuffer;
import java.util.Collections;
import java.util.Locale;
import java.util.Map;

/* JADX INFO: loaded from: classes.dex */
public class dn {
    private static final String a = dn.class.getSimpleName();
    private static dn b;

    public static synchronized dn a() {
        if (b == null) {
            b = new dn();
        }
        return b;
    }

    public int b() {
        int iIntValue = ((Integer) dp.a().a("AgentVersion")).intValue();
        el.a(4, a, "getAgentVersion() = " + iIntValue);
        return iIntValue;
    }

    int c() {
        return ((Integer) dp.a().a("ReleaseMajorVersion")).intValue();
    }

    int d() {
        return ((Integer) dp.a().a("ReleaseMinorVersion")).intValue();
    }

    int e() {
        return ((Integer) dp.a().a("ReleasePatchVersion")).intValue();
    }

    String f() {
        return (String) dp.a().a("ReleaseBetaVersion");
    }

    public String g() {
        String str;
        if (f().length() > 0) {
            str = ".";
        } else {
            str = StatConstants.MTA_COOPERATION_TAG;
        }
        return String.format(Locale.getDefault(), "Flurry_Android_%d_%d.%d.%d%s%s", Integer.valueOf(b()), Integer.valueOf(c()), Integer.valueOf(d()), Integer.valueOf(e()), str, f());
    }

    public String h() {
        dj djVarC = dl.a().c();
        if (djVarC == null) {
            return null;
        }
        return djVarC.j();
    }

    public String i() {
        dj djVarC = dl.a().c();
        if (djVarC == null) {
            return null;
        }
        return djVarC.k();
    }

    public String j() {
        dj djVarC = dl.a().c();
        if (djVarC == null) {
            return null;
        }
        return djVarC.l();
    }

    public boolean k() {
        dj djVarC = dl.a().c();
        if (djVarC != null) {
            return djVarC.o();
        }
        return true;
    }

    public Map<dr, ByteBuffer> l() {
        dj djVarC = dl.a().c();
        return djVarC != null ? djVarC.p() : Collections.emptyMap();
    }
}
