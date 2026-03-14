package com.flurry.sdk;

import android.widget.Toast;
import com.flurry.sdk.de;
import com.flurry.sdk.dq;
import com.flurry.sdk.ei;
import com.flurry.sdk.ek;

/* JADX INFO: loaded from: classes.dex */
public class dd extends de implements dq.a {
    static String a;
    private boolean i;
    private static final String h = dd.class.getSimpleName();
    static String b = "http://data.flurry.com/aap.do";
    static String c = "https://data.flurry.com/aap.do";

    public dd() {
        this(null);
    }

    dd(de.a aVar) {
        super("Analytics", dd.class.getSimpleName());
        this.g = "AnalyticsData_";
        g();
        a(aVar);
    }

    private void g() {
        dq dqVarA = dp.a();
        this.i = ((Boolean) dqVarA.a("UseHttps")).booleanValue();
        dqVarA.a("UseHttps", (dq.a) this);
        el.a(4, h, "initSettings, UseHttps = " + this.i);
        String str = (String) dqVarA.a("ReportUrl");
        dqVarA.a("ReportUrl", (dq.a) this);
        b(str);
        el.a(4, h, "initSettings, ReportUrl = " + str);
    }

    @Override // com.flurry.sdk.dq.a
    public void a(String str, Object obj) {
        if (str.equals("UseHttps")) {
            this.i = ((Boolean) obj).booleanValue();
            el.a(4, h, "onSettingUpdate, UseHttps = " + this.i);
        } else {
            if (str.equals("ReportUrl")) {
                String str2 = (String) obj;
                b(str2);
                el.a(4, h, "onSettingUpdate, ReportUrl = " + str2);
                return;
            }
            el.a(6, h, "onSettingUpdate internal error!");
        }
    }

    private void b(String str) {
        if (str != null && !str.endsWith(".do")) {
            el.a(5, h, "overriding analytics agent report URL without an endpoint, are you sure?");
        }
        a = str;
    }

    String a() {
        if (a != null) {
            return a;
        }
        if (this.i) {
            return c;
        }
        return b;
    }

    @Override // com.flurry.sdk.de
    protected void a(byte[] bArr, final String str, final String str2) {
        String strA = a();
        el.a(4, h, "FlurryDataSender: start upload data " + bArr + " with id = " + str + " to " + strA);
        ei eiVar = new ei();
        eiVar.a(strA);
        eiVar.a(ek.a.kPost);
        eiVar.a("Content-Type", "application/octet-stream");
        eiVar.a((eu) new et());
        eiVar.a(bArr);
        eiVar.a((ei.a) new ei.a<byte[], Void>() { // from class: com.flurry.sdk.dd.1
            @Override // com.flurry.sdk.ei.a
            public void a(ei<byte[], Void> eiVar2, Void r6) {
                final int iE = eiVar2.e();
                if (iE > 0) {
                    el.d(dd.h, "FlurryDataSender: report " + str + " sent. HTTP response: " + iE);
                    if (el.c() <= 3 && el.d()) {
                        Cdo.a().a(new Runnable() { // from class: com.flurry.sdk.dd.1.1
                            @Override // java.lang.Runnable
                            public void run() {
                                Toast.makeText(Cdo.a().b(), "SD HTTP Response Code: " + iE, 0).show();
                            }
                        });
                    }
                    dd.this.a(str, str2, iE);
                    dd.this.d();
                    return;
                }
                dd.this.b(str, str2);
            }
        });
        ej.a().a(this, eiVar);
    }

    @Override // com.flurry.sdk.de
    protected void a(String str, String str2, final int i) {
        a(new fc() { // from class: com.flurry.sdk.dd.2
            @Override // com.flurry.sdk.fc
            public void a() {
                dj djVarC;
                if (i == 200 && (djVarC = dl.a().c()) != null) {
                    djVarC.b();
                }
            }
        });
        super.a(str, str2, i);
    }
}
