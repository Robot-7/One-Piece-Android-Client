package com.flurry.sdk;

import android.app.Activity;
import android.content.Context;
import android.location.Location;
import android.os.Bundle;
import android.os.SystemClock;
import com.flurry.android.impl.analytics.FlurryAnalyticsModule;
import com.flurry.sdk.cx;
import com.flurry.sdk.dm;
import com.flurry.sdk.dq;
import com.google.android.gms.ads.identifier.AdvertisingIdClient;
import com.pipaw.pipawpay.PipawSDK;
import com.tencent.stat.common.StatConstants;
import java.io.DataInputStream;
import java.io.DataOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.lang.ref.WeakReference;
import java.nio.ByteBuffer;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.TimeZone;
import java.util.concurrent.atomic.AtomicInteger;

/* JADX INFO: loaded from: classes.dex */
public class dj implements dm.b, dq.a {
    private Location D;
    private boolean E;
    private String F;
    private byte G;
    private long H;
    private long I;
    private boolean L;
    private int M;
    private int O;
    private int P;
    private Map<String, List<String>> R;
    private dm S;
    private int T;
    private final String k;
    private String l;
    private WeakReference<Context> m;
    private List<dh> o;
    private boolean q;
    private long r;
    private AdvertisingIdClient.Info t;
    private byte[] u;
    private String v;
    private long w;
    private long x;
    private long y;
    private long z;
    private static final String g = dj.class.getSimpleName();
    static int a = 100;
    static int b = 10;
    static int c = PipawSDK.PAY_CANCEL;
    static int d = 160000;
    static int e = 50;
    static int f = 20;
    private final AtomicInteger h = new AtomicInteger(0);
    private final AtomicInteger i = new AtomicInteger(0);
    private final AtomicInteger j = new AtomicInteger(0);
    private File n = null;
    private final Map<dr, ByteBuffer> p = new HashMap();
    private List<dh> s = new ArrayList();
    private String A = StatConstants.MTA_COOPERATION_TAG;
    private String B = StatConstants.MTA_COOPERATION_TAG;
    private byte C = -1;
    private final Map<String, cx.a> J = new HashMap();
    private final List<db> K = new ArrayList();
    private final List<da> N = new ArrayList();
    private final cy Q = new cy();
    private boolean U = false;

    Map<String, List<String>> a() {
        return this.R;
    }

    public void a(fc fcVar) {
        Cdo.a().c(fcVar);
    }

    public void b() {
        this.q = true;
    }

    public dj(String str) {
        el.a(4, g, "Creating new Flurry session");
        this.k = str;
        this.m = new WeakReference<>(null);
    }

    private void u() {
        dq dqVarA = dp.a();
        this.G = ((Byte) dqVarA.a("Gender")).byteValue();
        dqVarA.a("Gender", (dq.a) this);
        el.a(4, g, "initSettings, Gender = " + ((int) this.G));
        this.F = (String) dqVarA.a("UserId");
        dqVarA.a("UserId", (dq.a) this);
        el.a(4, g, "initSettings, UserId = " + this.F);
        this.E = ((Boolean) dqVarA.a("LogEvents")).booleanValue();
        dqVarA.a("LogEvents", (dq.a) this);
        el.a(4, g, "initSettings, LogEvents = " + this.E);
        this.H = ((Long) dqVarA.a("Age")).longValue();
        dqVarA.a("Age", (dq.a) this);
        el.a(4, g, "initSettings, BirthDate = " + this.H);
        this.I = ((Long) dqVarA.a("ContinueSessionMillis")).longValue();
        dqVarA.a("ContinueSessionMillis", (dq.a) this);
        el.a(4, g, "initSettings, ContinueSessionMillis = " + this.I);
    }

    @Override // com.flurry.sdk.dq.a
    public void a(String str, Object obj) {
        if (str.equals("Gender")) {
            this.G = ((Byte) obj).byteValue();
            el.a(4, g, "onSettingUpdate, Gender = " + ((int) this.G));
            return;
        }
        if (str.equals("UserId")) {
            this.F = (String) obj;
            el.a(4, g, "onSettingUpdate, UserId = " + this.F);
            return;
        }
        if (str.equals("LogEvents")) {
            this.E = ((Boolean) obj).booleanValue();
            el.a(4, g, "onSettingUpdate, LogEvents = " + this.E);
        } else if (str.equals("Age")) {
            this.H = ((Long) obj).longValue();
            el.a(4, g, "onSettingUpdate, Birthdate = " + this.H);
        } else if (str.equals("ContinueSessionMillis")) {
            this.I = ((Long) obj).longValue();
            el.a(4, g, "onSettingUpdate, ContinueSessionMillis = " + this.I);
        } else {
            el.a(6, g, "onSettingUpdate internal error!");
        }
    }

    public synchronized void a(Context context) {
        el.a(4, g, "Initializing new Flurry session with context:" + context);
        this.m = new WeakReference<>(context);
        this.S = new dm(this);
        this.n = context.getFileStreamPath(F());
        this.l = eb.a();
        this.y = -1L;
        this.O = 0;
        this.B = TimeZone.getDefault().getID();
        this.A = Locale.getDefault().getLanguage() + "_" + Locale.getDefault().getCountry();
        this.L = true;
        this.M = 0;
        this.P = 0;
        this.R = d(context);
        u();
        long jElapsedRealtime = SystemClock.elapsedRealtime();
        this.w = System.currentTimeMillis();
        this.x = jElapsedRealtime;
        a(new fc() { // from class: com.flurry.sdk.dj.1
            @Override // com.flurry.sdk.fc
            public void a() {
                dj.this.t = dw.a();
            }
        });
        a(new fc() { // from class: com.flurry.sdk.dj.2
            @Override // com.flurry.sdk.fc
            public void a() {
                dj.this.u = dy.a();
            }
        });
        a(new fc() { // from class: com.flurry.sdk.dj.3
            @Override // com.flurry.sdk.fc
            public void a() {
                dj.this.v = ea.a();
            }
        });
        a(new fc() { // from class: com.flurry.sdk.dj.4
            @Override // com.flurry.sdk.fc
            public void a() {
                dj.this.C();
            }
        });
        a(new fc() { // from class: com.flurry.sdk.dj.5
            @Override // com.flurry.sdk.fc
            public void a() {
                dj.this.v();
            }
        });
        em.a().a(this, context);
        this.U = true;
    }

    public synchronized void b(Context context) {
        if (this.U) {
            el.d(g, "Start session with context: " + context + " count:" + g());
            this.m = new WeakReference<>(context);
            if (this.S.b()) {
                this.S.a();
            }
            D();
            dz.a().c();
            this.D = dz.a().f();
            em.a().b(this, context);
        }
    }

    public synchronized void c(Context context) {
        if (this.U) {
            em.a().c(this, context);
            this.D = dz.a().f();
            z();
            E();
            el.d(g, "End session with context: " + context + " count:" + g());
            this.y = SystemClock.elapsedRealtime() - this.x;
            a(this.y);
            w();
            if (g() == 0) {
                this.S.a(this.I);
            }
        }
    }

    public synchronized void c() {
        if (this.U) {
            el.d(g, "Finalize session");
            if (this.S.b()) {
                this.S.a();
            }
            if (g() != 0) {
                el.a(6, g, "Session with apiKey = " + j() + " was ended while getSessionCount() is not 0");
            }
            this.T = 0;
            x();
            em.a().a(this);
            a(new fc() { // from class: com.flurry.sdk.dj.6
                @Override // com.flurry.sdk.fc
                public void a() {
                    dl.a().a(dj.this.j());
                }
            });
            dp.a().b("Gender", (dq.a) this);
            dp.a().b("UserId", (dq.a) this);
            dp.a().b("Age", (dq.a) this);
            dp.a().b("LogEvents", (dq.a) this);
            dp.a().b("ContinueSessionMillis", (dq.a) this);
        }
    }

    private Map<String, List<String>> d(Context context) {
        Bundle extras;
        if (!(context instanceof Activity) || (extras = ((Activity) context).getIntent().getExtras()) == null) {
            return null;
        }
        el.a(3, g, "Launch Options Bundle is present " + extras.toString());
        HashMap map = new HashMap();
        for (String str : extras.keySet()) {
            if (str != null) {
                Object obj = extras.get(str);
                String string = obj != null ? obj.toString() : "null";
                map.put(str, new ArrayList(Arrays.asList(string)));
                el.a(3, g, "Launch options Key: " + str + ". Its value: " + string);
            }
        }
        return map;
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void v() {
        try {
            if (this.v != null) {
                el.a(3, g, "Fetched phone id");
                a(dr.PhoneId, ByteBuffer.wrap(this.v.getBytes()));
            }
            if (this.u != null) {
                el.a(3, g, "Fetched hashed IMEI");
                a(dr.Sha1Imei, ByteBuffer.wrap(this.u));
            }
            if (this.t != null) {
                el.a(3, g, "Fetched advertising id");
                a(dr.AndroidAdvertisingId, ByteBuffer.wrap(this.t.getId().getBytes()));
            }
            A();
        } catch (Throwable th) {
            el.a(6, g, StatConstants.MTA_COOPERATION_TAG, th);
        }
    }

    private synchronized void a(long j) {
        for (db dbVar : this.K) {
            if (dbVar.a() && !dbVar.b()) {
                dbVar.a(j);
            }
        }
    }

    private void w() {
        a(new fc() { // from class: com.flurry.sdk.dj.7
            @Override // com.flurry.sdk.fc
            public void a() {
                dh dhVarD = dj.this.d();
                dj.this.s.clear();
                dj.this.s.add(dhVarD);
                dj.this.B();
            }
        });
    }

    private void x() {
        a(new fc() { // from class: com.flurry.sdk.dj.8
            @Override // com.flurry.sdk.fc
            public void a() {
                dj.this.y();
            }
        });
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void y() {
        boolean z;
        try {
            synchronized (this) {
                z = this.s.size() > 0;
            }
            if (z) {
                A();
            }
        } catch (Throwable th) {
            el.a(6, g, StatConstants.MTA_COOPERATION_TAG, th);
        }
    }

    private void z() {
        a(new fc() { // from class: com.flurry.sdk.dj.9
            @Override // com.flurry.sdk.fc
            public void a() {
                dz.a().d();
            }
        });
    }

    synchronized dh d() {
        dh dhVar;
        di diVar = new di();
        diVar.a(this.l);
        diVar.a(this.w);
        diVar.b(this.y);
        diVar.c(this.z);
        diVar.b(k());
        diVar.c(l());
        diVar.a((int) this.C);
        diVar.d(h());
        diVar.a(this.D);
        diVar.b(f());
        diVar.a(this.G);
        diVar.a(Long.valueOf(this.H));
        diVar.a(t());
        diVar.a(r());
        diVar.a(this.L);
        diVar.b(s());
        diVar.c(this.O);
        try {
            dhVar = new dh(diVar);
        } catch (IOException e2) {
            e2.printStackTrace();
            dhVar = null;
        }
        if (dhVar == null) {
            el.d(g, "New session report wasn't created");
        }
        return dhVar;
    }

    public synchronized void e() {
        this.P++;
    }

    int f() {
        return this.P;
    }

    public synchronized void a(String str, Map<String, String> map, boolean z) {
        long jElapsedRealtime = SystemClock.elapsedRealtime() - this.x;
        String strA = fb.a(str);
        if (strA.length() != 0) {
            cx.a aVar = this.J.get(strA);
            if (aVar == null) {
                if (this.J.size() < a) {
                    cx.a aVar2 = new cx.a();
                    aVar2.a = 1;
                    this.J.put(strA, aVar2);
                    el.d(g, "Event count started: " + strA);
                } else {
                    el.d(g, "Too many different events. Event not counted: " + strA);
                }
            } else {
                aVar.a++;
                el.d(g, "Event count incremented: " + strA);
            }
            if (this.E && this.K.size() < c && this.M < d) {
                Map<String, String> mapEmptyMap = map == null ? Collections.emptyMap() : map;
                if (mapEmptyMap.size() > b) {
                    el.d(g, "MaxEventParams exceeded: " + mapEmptyMap.size());
                } else {
                    db dbVar = new db(G(), strA, mapEmptyMap, jElapsedRealtime, z);
                    if (dbVar.d() + this.M <= d) {
                        this.K.add(dbVar);
                        this.M = dbVar.d() + this.M;
                    } else {
                        this.M = d;
                        this.L = false;
                        el.d(g, "Event Log size exceeded. No more event details logged.");
                    }
                }
            } else {
                this.L = false;
            }
        }
    }

    /* JADX WARN: Code restructure failed: missing block: B:11:0x0026, code lost:
    
        if (r9.size() <= 0) goto L19;
     */
    /* JADX WARN: Code restructure failed: missing block: B:13:0x002c, code lost:
    
        if (r7.M >= com.flurry.sdk.dj.d) goto L19;
     */
    /* JADX WARN: Code restructure failed: missing block: B:14:0x002e, code lost:
    
        r3 = r7.M - r0.d();
        r4 = new java.util.HashMap(r0.c());
        r0.a(r9);
     */
    /* JADX WARN: Code restructure failed: missing block: B:15:0x0048, code lost:
    
        if ((r0.d() + r3) > com.flurry.sdk.dj.d) goto L27;
     */
    /* JADX WARN: Code restructure failed: missing block: B:17:0x0054, code lost:
    
        if (r0.c().size() <= com.flurry.sdk.dj.b) goto L22;
     */
    /* JADX WARN: Code restructure failed: missing block: B:18:0x0056, code lost:
    
        com.flurry.sdk.el.d(com.flurry.sdk.dj.g, "MaxEventParams exceeded on endEvent: " + r0.c().size());
        r0.b(r4);
     */
    /* JADX WARN: Code restructure failed: missing block: B:19:0x0079, code lost:
    
        r0.a(r1);
     */
    /* JADX WARN: Code restructure failed: missing block: B:22:0x007e, code lost:
    
        r7.M = r3 + r0.d();
     */
    /* JADX WARN: Code restructure failed: missing block: B:27:0x0089, code lost:
    
        r0.b(r4);
        r7.L = false;
        r7.M = com.flurry.sdk.dj.d;
        com.flurry.sdk.el.d(com.flurry.sdk.dj.g, "Event Log size exceeded. No more event details logged.");
     */
    /* JADX WARN: Code restructure failed: missing block: B:8:0x0019, code lost:
    
        r1 = android.os.SystemClock.elapsedRealtime() - r7.x;
     */
    /* JADX WARN: Code restructure failed: missing block: B:9:0x0020, code lost:
    
        if (r9 == null) goto L19;
     */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public synchronized void a(java.lang.String r8, java.util.Map<java.lang.String, java.lang.String> r9) {
        /*
            r7 = this;
            monitor-enter(r7)
            java.util.List<com.flurry.sdk.db> r0 = r7.K     // Catch: java.lang.Throwable -> L86
            java.util.Iterator r1 = r0.iterator()     // Catch: java.lang.Throwable -> L86
        L7:
            boolean r0 = r1.hasNext()     // Catch: java.lang.Throwable -> L86
            if (r0 == 0) goto L7c
            java.lang.Object r0 = r1.next()     // Catch: java.lang.Throwable -> L86
            com.flurry.sdk.db r0 = (com.flurry.sdk.db) r0     // Catch: java.lang.Throwable -> L86
            boolean r2 = r0.a(r8)     // Catch: java.lang.Throwable -> L86
            if (r2 == 0) goto L7
            long r1 = android.os.SystemClock.elapsedRealtime()     // Catch: java.lang.Throwable -> L86
            long r3 = r7.x     // Catch: java.lang.Throwable -> L86
            long r1 = r1 - r3
            if (r9 == 0) goto L79
            int r3 = r9.size()     // Catch: java.lang.Throwable -> L86
            if (r3 <= 0) goto L79
            int r3 = r7.M     // Catch: java.lang.Throwable -> L86
            int r4 = com.flurry.sdk.dj.d     // Catch: java.lang.Throwable -> L86
            if (r3 >= r4) goto L79
            int r3 = r7.M     // Catch: java.lang.Throwable -> L86
            int r4 = r0.d()     // Catch: java.lang.Throwable -> L86
            int r3 = r3 - r4
            java.util.HashMap r4 = new java.util.HashMap     // Catch: java.lang.Throwable -> L86
            java.util.Map r5 = r0.c()     // Catch: java.lang.Throwable -> L86
            r4.<init>(r5)     // Catch: java.lang.Throwable -> L86
            r0.a(r9)     // Catch: java.lang.Throwable -> L86
            int r5 = r0.d()     // Catch: java.lang.Throwable -> L86
            int r5 = r5 + r3
            int r6 = com.flurry.sdk.dj.d     // Catch: java.lang.Throwable -> L86
            if (r5 > r6) goto L89
            java.util.Map r5 = r0.c()     // Catch: java.lang.Throwable -> L86
            int r5 = r5.size()     // Catch: java.lang.Throwable -> L86
            int r6 = com.flurry.sdk.dj.b     // Catch: java.lang.Throwable -> L86
            if (r5 <= r6) goto L7e
            java.lang.String r3 = com.flurry.sdk.dj.g     // Catch: java.lang.Throwable -> L86
            java.lang.StringBuilder r5 = new java.lang.StringBuilder     // Catch: java.lang.Throwable -> L86
            r5.<init>()     // Catch: java.lang.Throwable -> L86
            java.lang.String r6 = "MaxEventParams exceeded on endEvent: "
            java.lang.StringBuilder r5 = r5.append(r6)     // Catch: java.lang.Throwable -> L86
            java.util.Map r6 = r0.c()     // Catch: java.lang.Throwable -> L86
            int r6 = r6.size()     // Catch: java.lang.Throwable -> L86
            java.lang.StringBuilder r5 = r5.append(r6)     // Catch: java.lang.Throwable -> L86
            java.lang.String r5 = r5.toString()     // Catch: java.lang.Throwable -> L86
            com.flurry.sdk.el.d(r3, r5)     // Catch: java.lang.Throwable -> L86
            r0.b(r4)     // Catch: java.lang.Throwable -> L86
        L79:
            r0.a(r1)     // Catch: java.lang.Throwable -> L86
        L7c:
            monitor-exit(r7)
            return
        L7e:
            int r4 = r0.d()     // Catch: java.lang.Throwable -> L86
            int r3 = r3 + r4
            r7.M = r3     // Catch: java.lang.Throwable -> L86
            goto L79
        L86:
            r0 = move-exception
            monitor-exit(r7)
            throw r0
        L89:
            r0.b(r4)     // Catch: java.lang.Throwable -> L86
            r3 = 0
            r7.L = r3     // Catch: java.lang.Throwable -> L86
            int r3 = com.flurry.sdk.dj.d     // Catch: java.lang.Throwable -> L86
            r7.M = r3     // Catch: java.lang.Throwable -> L86
            java.lang.String r3 = com.flurry.sdk.dj.g     // Catch: java.lang.Throwable -> L86
            java.lang.String r4 = "Event Log size exceeded. No more event details logged."
            com.flurry.sdk.el.d(r3, r4)     // Catch: java.lang.Throwable -> L86
            goto L79
        */
        throw new UnsupportedOperationException("Method not decompiled: com.flurry.sdk.dj.a(java.lang.String, java.util.Map):void");
    }

    /* JADX WARN: Removed duplicated region for block: B:13:0x0059  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public synchronized void a(java.lang.String r10, java.lang.String r11, java.lang.String r12, java.lang.Throwable r13) {
        /*
            r9 = this;
            r0 = 0
            monitor-enter(r9)
            if (r10 == 0) goto L59
            java.lang.String r1 = "uncaught"
            boolean r1 = r1.equals(r10)     // Catch: java.lang.Throwable -> L9f
            if (r1 == 0) goto L59
            r1 = 1
        Ld:
            int r2 = r9.O     // Catch: java.lang.Throwable -> L9f
            int r2 = r2 + 1
            r9.O = r2     // Catch: java.lang.Throwable -> L9f
            java.util.List<com.flurry.sdk.da> r2 = r9.N     // Catch: java.lang.Throwable -> L9f
            int r2 = r2.size()     // Catch: java.lang.Throwable -> L9f
            int r3 = com.flurry.sdk.dj.e     // Catch: java.lang.Throwable -> L9f
            if (r2 >= r3) goto L5b
            long r0 = java.lang.System.currentTimeMillis()     // Catch: java.lang.Throwable -> L9f
            java.lang.Long r2 = java.lang.Long.valueOf(r0)     // Catch: java.lang.Throwable -> L9f
            com.flurry.sdk.da r0 = new com.flurry.sdk.da     // Catch: java.lang.Throwable -> L9f
            int r1 = r9.H()     // Catch: java.lang.Throwable -> L9f
            long r2 = r2.longValue()     // Catch: java.lang.Throwable -> L9f
            r4 = r10
            r5 = r11
            r6 = r12
            r7 = r13
            r0.<init>(r1, r2, r4, r5, r6, r7)     // Catch: java.lang.Throwable -> L9f
            java.util.List<com.flurry.sdk.da> r1 = r9.N     // Catch: java.lang.Throwable -> L9f
            r1.add(r0)     // Catch: java.lang.Throwable -> L9f
            java.lang.String r1 = com.flurry.sdk.dj.g     // Catch: java.lang.Throwable -> L9f
            java.lang.StringBuilder r2 = new java.lang.StringBuilder     // Catch: java.lang.Throwable -> L9f
            r2.<init>()     // Catch: java.lang.Throwable -> L9f
            java.lang.String r3 = "Error logged: "
            java.lang.StringBuilder r2 = r2.append(r3)     // Catch: java.lang.Throwable -> L9f
            java.lang.String r0 = r0.c()     // Catch: java.lang.Throwable -> L9f
            java.lang.StringBuilder r0 = r2.append(r0)     // Catch: java.lang.Throwable -> L9f
            java.lang.String r0 = r0.toString()     // Catch: java.lang.Throwable -> L9f
            com.flurry.sdk.el.d(r1, r0)     // Catch: java.lang.Throwable -> L9f
        L57:
            monitor-exit(r9)
            return
        L59:
            r1 = r0
            goto Ld
        L5b:
            if (r1 == 0) goto La6
            r8 = r0
        L5e:
            java.util.List<com.flurry.sdk.da> r0 = r9.N     // Catch: java.lang.Throwable -> L9f
            int r0 = r0.size()     // Catch: java.lang.Throwable -> L9f
            if (r8 >= r0) goto L57
            java.util.List<com.flurry.sdk.da> r0 = r9.N     // Catch: java.lang.Throwable -> L9f
            java.lang.Object r0 = r0.get(r8)     // Catch: java.lang.Throwable -> L9f
            com.flurry.sdk.da r0 = (com.flurry.sdk.da) r0     // Catch: java.lang.Throwable -> L9f
            java.lang.String r1 = r0.c()     // Catch: java.lang.Throwable -> L9f
            if (r1 == 0) goto La2
            java.lang.String r1 = "uncaught"
            java.lang.String r0 = r0.c()     // Catch: java.lang.Throwable -> L9f
            boolean r0 = r1.equals(r0)     // Catch: java.lang.Throwable -> L9f
            if (r0 != 0) goto La2
            long r0 = java.lang.System.currentTimeMillis()     // Catch: java.lang.Throwable -> L9f
            java.lang.Long r2 = java.lang.Long.valueOf(r0)     // Catch: java.lang.Throwable -> L9f
            com.flurry.sdk.da r0 = new com.flurry.sdk.da     // Catch: java.lang.Throwable -> L9f
            int r1 = r9.H()     // Catch: java.lang.Throwable -> L9f
            long r2 = r2.longValue()     // Catch: java.lang.Throwable -> L9f
            r4 = r10
            r5 = r11
            r6 = r12
            r7 = r13
            r0.<init>(r1, r2, r4, r5, r6, r7)     // Catch: java.lang.Throwable -> L9f
            java.util.List<com.flurry.sdk.da> r1 = r9.N     // Catch: java.lang.Throwable -> L9f
            r1.set(r8, r0)     // Catch: java.lang.Throwable -> L9f
            goto L57
        L9f:
            r0 = move-exception
            monitor-exit(r9)
            throw r0
        La2:
            int r0 = r8 + 1
            r8 = r0
            goto L5e
        La6:
            java.lang.String r0 = com.flurry.sdk.dj.g     // Catch: java.lang.Throwable -> L9f
            java.lang.String r1 = "Max errors logged. No more errors logged."
            com.flurry.sdk.el.d(r0, r1)     // Catch: java.lang.Throwable -> L9f
            goto L57
        */
        throw new UnsupportedOperationException("Method not decompiled: com.flurry.sdk.dj.a(java.lang.String, java.lang.String, java.lang.String, java.lang.Throwable):void");
    }

    private void A() {
        try {
            el.a(3, g, "generating agent report");
            dc dcVar = new dc(this.k, this.l, this.q, o(), this.r, this.w, this.s, p(), this.Q.a(false), a(), cx.a().b(), System.currentTimeMillis());
            this.o = new ArrayList(this.s);
            if (dcVar != null && dcVar.a() != null) {
                el.a(3, g, "generated report of size " + dcVar.a().length + " with " + this.s.size() + " reports.");
                a(dcVar.a());
                this.s.removeAll(this.o);
                this.o = null;
                B();
            } else {
                el.d(g, "Error generating report");
            }
        } catch (Throwable th) {
            el.a(6, g, StatConstants.MTA_COOPERATION_TAG, th);
        }
    }

    private void a(byte[] bArr) {
        FlurryAnalyticsModule.getInstance().a().b(bArr, this.k, StatConstants.MTA_COOPERATION_TAG + dn.a().b());
    }

    /* JADX INFO: Access modifiers changed from: private */
    public synchronized void B() {
        if (!fa.a(this.n)) {
            el.d(g, "Error persisting report: could not create directory");
        } else {
            try {
                DataOutputStream dataOutputStream = new DataOutputStream(new FileOutputStream(this.n));
                dk dkVar = new dk();
                dkVar.a(this.q);
                dkVar.a(this.r);
                dkVar.a(this.s);
                dkVar.a(dataOutputStream, this.k, i());
            } catch (Exception e2) {
                el.b(g, "Error saving persistent data", e2);
            }
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public synchronized void C() {
        DataInputStream dataInputStream;
        FileInputStream fileInputStream;
        boolean z;
        FileInputStream fileInputStream2 = null;
        synchronized (this) {
            el.a(4, g, "Loading persistent data: " + this.n.getAbsolutePath());
            if (this.n.exists()) {
                try {
                    fileInputStream = new FileInputStream(this.n);
                    try {
                        dataInputStream = new DataInputStream(fileInputStream);
                        try {
                            dk dkVar = new dk();
                            dkVar.a(dataInputStream, this.k);
                            this.q = dkVar.a();
                            this.r = dkVar.c();
                            this.s = dkVar.b();
                            z = true;
                            fb.a(dataInputStream);
                            fb.a(fileInputStream);
                        } catch (Exception e2) {
                            e = e2;
                            fileInputStream2 = fileInputStream;
                            try {
                                el.b(g, "Error loading persistent data", e);
                                fb.a(dataInputStream);
                                fb.a(fileInputStream2);
                                z = false;
                            } catch (Throwable th) {
                                th = th;
                                fileInputStream = fileInputStream2;
                                fb.a(dataInputStream);
                                fb.a(fileInputStream);
                                throw th;
                            }
                        } catch (Throwable th2) {
                            th = th2;
                            fb.a(dataInputStream);
                            fb.a(fileInputStream);
                            throw th;
                        }
                    } catch (Exception e3) {
                        e = e3;
                        dataInputStream = null;
                        fileInputStream2 = fileInputStream;
                    } catch (Throwable th3) {
                        th = th3;
                        dataInputStream = null;
                    }
                } catch (Exception e4) {
                    e = e4;
                    dataInputStream = null;
                } catch (Throwable th4) {
                    th = th4;
                    dataInputStream = null;
                    fileInputStream = null;
                }
                if (!z) {
                    el.a(3, g, "Deleting agent cache file");
                    this.n.delete();
                }
            } else {
                el.a(4, g, "Agent cache file doesn't exist.");
                z = false;
            }
            if (!z) {
                this.q = false;
                this.r = this.w;
            }
        }
    }

    private void D() {
        this.T++;
    }

    private void E() {
        if (this.T > 0) {
            this.T--;
        }
    }

    int g() {
        return this.T;
    }

    private String F() {
        return ".flurryagent." + Integer.toString(this.k.hashCode(), 16);
    }

    private int G() {
        return this.h.incrementAndGet();
    }

    private int H() {
        return this.i.incrementAndGet();
    }

    String h() {
        return this.F == null ? StatConstants.MTA_COOPERATION_TAG : this.F;
    }

    public String i() {
        return this.v;
    }

    public String j() {
        return this.k;
    }

    public String k() {
        return this.A;
    }

    public String l() {
        return this.B;
    }

    public long m() {
        return this.w;
    }

    public long n() {
        return this.x;
    }

    public boolean o() {
        return this.t == null || !this.t.isLimitAdTrackingEnabled();
    }

    private void a(dr drVar, ByteBuffer byteBuffer) {
        synchronized (this.p) {
            this.p.put(drVar, byteBuffer);
        }
    }

    public Map<dr, ByteBuffer> p() {
        return new HashMap(this.p);
    }

    @Override // com.flurry.sdk.dm.b
    public void q() {
        c();
    }

    List<db> r() {
        return this.K;
    }

    List<da> s() {
        return this.N;
    }

    Map<String, cx.a> t() {
        return this.J;
    }
}
