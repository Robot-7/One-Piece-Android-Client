package com.testin.agent.base;

import android.app.Application;
import android.content.Context;
import com.tencent.stat.common.StatConstants;
import com.testin.agent.d.c;
import com.testin.agent.d.d;
import java.util.HashSet;
import java.util.LinkedList;
import java.util.Set;

/* JADX INFO: loaded from: classes.dex */
public class TestinGVariables extends Application {
    private static TestinGVariables n = null;
    public boolean a = false;
    public boolean b = true;
    public boolean c = true;
    public Context d = null;
    public String e = StatConstants.MTA_COOPERATION_TAG;
    public String f = StatConstants.MTA_COOPERATION_TAG;
    public String g = StatConstants.MTA_COOPERATION_TAG;
    private d l = null;
    public Long h = null;
    public Long i = null;
    public LinkedList j = new LinkedList();
    public Set k = new HashSet();
    private c m = null;

    private TestinGVariables() {
        d();
    }

    public static synchronized TestinGVariables c() {
        if (n == null) {
            n = new TestinGVariables();
        }
        return n;
    }

    private void d() {
        new a(this).start();
    }

    public d a() {
        return this.l;
    }

    public void a(c cVar) {
        this.m = cVar;
    }

    public void a(d dVar) {
        this.l = dVar;
    }

    public c b() {
        return this.m;
    }
}
