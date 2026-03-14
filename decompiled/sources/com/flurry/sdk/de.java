package com.flurry.sdk;

import java.util.HashSet;
import java.util.List;
import java.util.Set;

/* JADX INFO: loaded from: classes.dex */
public abstract class de implements er {
    protected final String d;
    dg f;
    Set<String> e = new HashSet();
    protected String g = "defaultDataKey_";

    public interface a {
        void a();
    }

    protected abstract void a(byte[] bArr, String str, String str2);

    public de(String str, String str2) {
        this.d = str2;
        es.a().a(this);
        a(str);
    }

    protected void a(fc fcVar) {
        Cdo.a().c(fcVar);
    }

    protected void a(final String str) {
        a(new fc() { // from class: com.flurry.sdk.de.1
            @Override // com.flurry.sdk.fc
            public void a() {
                de.this.f = new dg(str);
            }
        });
    }

    @Override // com.flurry.sdk.er
    public void a(boolean z) {
        el.a(4, this.d, "onNetworkStateChanged : isNetworkEnable = " + z);
        if (z) {
            d();
        }
    }

    public void b(byte[] bArr, String str, String str2) {
        a(bArr, str, str2, null);
    }

    protected void a(byte[] bArr, String str, String str2, a aVar) {
        if (bArr == null || bArr.length == 0) {
            el.a(6, this.d, "Report that has to be sent is EMPTY or NULL");
        } else {
            c(bArr, str, str2);
            a(aVar);
        }
    }

    protected int c() {
        return this.e.size();
    }

    protected void c(final byte[] bArr, final String str, final String str2) {
        a(new fc() { // from class: com.flurry.sdk.de.2
            @Override // com.flurry.sdk.fc
            public void a() throws Throwable {
                de.this.d(bArr, str, str2);
            }
        });
    }

    protected void d() {
        a((a) null);
    }

    protected void a(final a aVar) {
        a(new fc() { // from class: com.flurry.sdk.de.3
            @Override // com.flurry.sdk.fc
            public void a() throws Throwable {
                de.this.f();
                if (aVar != null) {
                    aVar.a();
                }
            }
        });
    }

    protected boolean e() {
        return c() <= 5;
    }

    protected String a(String str, String str2) {
        return this.g + str + "_" + str2;
    }

    protected String d(byte[] bArr, String str, String str2) throws Throwable {
        String strA = a(str, str2);
        df dfVar = new df();
        dfVar.a(bArr);
        String strA2 = dfVar.a();
        this.f.a(dfVar, strA);
        return strA2;
    }

    protected void f() throws Throwable {
        if (!es.a().c()) {
            el.a(5, this.d, "Reports were not sent! No Internet connection!");
            return;
        }
        List<String> listA = this.f.a();
        if (listA == null || listA.isEmpty()) {
            el.a(4, this.d, "No more reports to send.");
            return;
        }
        for (String str : listA) {
            if (e()) {
                List<String> listC = this.f.c(str);
                el.a(4, this.d, "Number of not sent blocks = " + listC.size());
                int i = 0;
                while (true) {
                    int i2 = i;
                    if (i2 < listC.size()) {
                        String str2 = listC.get(i2);
                        if (!this.e.contains(str2)) {
                            if (e()) {
                                byte[] bArrB = new df(str2).b();
                                if (bArrB == null || bArrB.length == 0) {
                                    el.a(6, this.d, "Internal ERROR! Report is empty!");
                                    this.f.a(str2, str);
                                } else {
                                    this.e.add(str2);
                                    a(bArrB, str2, str);
                                }
                            }
                        }
                        i = i2 + 1;
                    }
                }
            } else {
                return;
            }
        }
    }

    protected void a(final String str, final String str2, int i) {
        a(new fc() { // from class: com.flurry.sdk.de.4
            @Override // com.flurry.sdk.fc
            public void a() {
                if (!de.this.f.a(str, str2)) {
                    el.a(6, de.this.d, "Internal error. Block wasn't deleted with id = " + str);
                }
                if (!de.this.e.remove(str)) {
                    el.a(6, de.this.d, "Internal error. Block with id = " + str + " was not in progress state");
                }
            }
        });
    }

    protected void b(final String str, String str2) {
        a(new fc() { // from class: com.flurry.sdk.de.5
            @Override // com.flurry.sdk.fc
            public void a() {
                if (!de.this.e.remove(str)) {
                    el.a(6, de.this.d, "Internal error. Block with id = " + str + " was not in progress state");
                }
            }
        });
    }

    protected void c(String str, String str2) {
        if (!this.f.a(str, str2)) {
            el.a(6, this.d, "Internal error. Block wasn't deleted with id = " + str);
        }
        if (!this.e.remove(str)) {
            el.a(6, this.d, "Internal error. Block with id = " + str + " was not in progress state");
        }
    }
}
