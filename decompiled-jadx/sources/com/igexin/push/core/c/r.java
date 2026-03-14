package com.igexin.push.core.c;

import com.igexin.getuiext.data.Consts;
import java.util.List;

/* JADX INFO: loaded from: classes.dex */
public class r {
    private static List c;
    private static int a = 0;
    private static int b = 0;
    private static t d = t.NORMAL;
    private static int e = 0;

    public static void a() {
        String strE = e();
        if (strE == null) {
            if (!com.igexin.push.a.k.j) {
                int i = a + 1;
                a = i;
                a = i % com.igexin.push.a.k.a.length;
                strE = com.igexin.push.a.k.a[a];
            } else if (d == t.BACKUP) {
                int i2 = a + 1;
                a = i2;
                a = i2 % com.igexin.push.a.k.c.length;
                strE = com.igexin.push.a.k.c[a];
            } else {
                int i3 = a + 1;
                a = i3;
                a = i3 % com.igexin.push.a.k.a.length;
                strE = com.igexin.push.a.k.a[a];
            }
        }
        com.igexin.push.core.g.a = strE;
    }

    /* JADX WARN: Can't fix incorrect switch cases order, some code will duplicate */
    private static void a(t tVar) {
        if (com.igexin.push.a.k.j) {
            if (d != tVar) {
                a((List) null);
            }
            switch (tVar) {
                case NORMAL:
                    com.igexin.push.core.g.a = com.igexin.push.a.k.a[0];
                    com.igexin.push.core.g.b = com.igexin.push.a.k.b;
                    break;
                case BACKUP:
                    if (d != tVar) {
                        f.a().d(System.currentTimeMillis());
                    }
                    com.igexin.push.core.g.a = com.igexin.push.a.k.c[0];
                    com.igexin.push.core.g.b = com.igexin.push.a.k.d;
                    break;
                case TRY_NORMAL:
                    if (d != tVar) {
                        e = 0;
                    }
                    com.igexin.push.core.g.a = com.igexin.push.a.k.a[0];
                    com.igexin.push.core.g.b = com.igexin.push.a.k.b;
                    break;
            }
            d = tVar;
        }
    }

    public static void a(List list) {
        c = list;
        b = 0;
    }

    public static void b() {
        switch (d) {
            case BACKUP:
                if (System.currentTimeMillis() - com.igexin.push.core.g.T > Consts.TIME_24HOUR) {
                    a(t.TRY_NORMAL);
                }
                break;
        }
    }

    public static void c() {
        switch (d) {
            case NORMAL:
                f.a().b(System.currentTimeMillis());
                break;
            case TRY_NORMAL:
                a(t.NORMAL);
                break;
        }
    }

    public static void d() {
        f();
        if (com.igexin.push.core.g.o) {
            f.a().b(System.currentTimeMillis());
        }
        switch (d) {
            case TRY_NORMAL:
                int i = e + 1;
                e = i;
                if (i >= 10) {
                    a(t.BACKUP);
                }
                break;
        }
    }

    private static String e() {
        if (c != null) {
            long jCurrentTimeMillis = System.currentTimeMillis();
            while (!c.isEmpty()) {
                if (b >= c.size()) {
                    b = 0;
                }
                u uVar = (u) c.get(b);
                if (uVar.b >= jCurrentTimeMillis) {
                    b++;
                    return uVar.a;
                }
                c.remove(uVar);
            }
        }
        return null;
    }

    private static void f() {
        switch (d) {
            case NORMAL:
                long jCurrentTimeMillis = System.currentTimeMillis();
                if (jCurrentTimeMillis - com.igexin.push.core.g.S > 1296000000) {
                    if (jCurrentTimeMillis - com.igexin.push.core.g.T <= Consts.TIME_24HOUR) {
                        a(t.BACKUP);
                    } else {
                        a(t.TRY_NORMAL);
                    }
                }
                break;
            case BACKUP:
                if (System.currentTimeMillis() - com.igexin.push.core.g.T > Consts.TIME_24HOUR) {
                    a(t.TRY_NORMAL);
                }
                break;
        }
    }
}
