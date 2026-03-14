package com.igexin.push.core.bean;

/* JADX INFO: loaded from: classes.dex */
public class k extends BaseAction {
    private String a;
    private boolean b;
    private boolean c;
    private String d;

    public String a() {
        return this.a;
    }

    public void a(String str) {
        this.a = str;
    }

    public void a(boolean z) {
        this.b = z;
    }

    public String b() {
        return this.d;
    }

    public void b(String str) {
        this.d = str;
    }

    public void b(boolean z) {
        this.c = z;
    }

    public String c() {
        String strK;
        String str = this.a;
        if (this.b) {
            str = str.indexOf("?") > 0 ? str + "&cid=" + com.igexin.push.core.g.u : str + "?cid=" + com.igexin.push.core.g.u;
        }
        return (!this.c || (strK = com.igexin.push.core.f.a().k()) == null) ? str : str.indexOf("?") > 0 ? str + "&nettype=" + strK : str + "?nettype=" + strK;
    }
}
