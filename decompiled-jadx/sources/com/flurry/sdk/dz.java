package com.flurry.sdk;

import android.content.Context;
import android.location.Criteria;
import android.location.Location;
import android.location.LocationListener;
import android.location.LocationManager;
import android.os.Bundle;
import android.os.Looper;
import android.text.TextUtils;
import com.flurry.sdk.dq;
import com.flurry.sdk.ey;

/* JADX INFO: loaded from: classes.dex */
public class dz implements dq.a, ey.a {
    private static final String c = dz.class.getSimpleName();
    private static dz q;
    boolean b;
    private LocationManager i;
    private Criteria j;
    private Location k;
    private String m;
    private volatile Location p;
    private final int d = 3;
    private final long e = 10000;
    private final long f = 90000;
    private final long g = 0;
    private long h = 0;
    boolean a = false;
    private int n = 0;
    private int o = 0;
    private a l = new a();

    static /* synthetic */ int a(dz dzVar) {
        int i = dzVar.o + 1;
        dzVar.o = i;
        return i;
    }

    private dz() {
        dq dqVarA = dp.a();
        this.j = (Criteria) dqVarA.a("LocationCriteria");
        dqVarA.a("LocationCriteria", (dq.a) this);
        el.a(4, c, "initSettings, LocationCriteria = " + this.j);
        this.b = ((Boolean) dqVarA.a("ReportLocation")).booleanValue();
        dqVarA.a("ReportLocation", (dq.a) this);
        el.a(4, c, "initSettings, ReportLocation = " + this.b);
    }

    public static synchronized dz a() {
        if (q == null) {
            q = new dz();
        }
        return q;
    }

    public synchronized void b() {
        if (this.i == null) {
            this.i = (LocationManager) Cdo.a().b().getSystemService("location");
        }
    }

    public synchronized void c() {
        el.a(4, c, "Location provider subscribed");
        this.n++;
        if (!this.a && this.o < 3) {
            j();
        }
    }

    public synchronized void d() {
        el.a(4, c, "Location provider unsubscribed");
        if (this.n <= 0) {
            el.a(6, c, "Error! Unsubscribed too many times!");
        } else {
            this.n--;
            if (this.n == 0) {
                i();
            }
        }
    }

    public void a(float f, float f2) {
        this.p = new Location("Explicit");
        this.p.setLatitude(f);
        this.p.setLongitude(f2);
    }

    public void e() {
        this.p = null;
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void i() {
        this.i.removeUpdates(this.l);
        this.a = false;
        this.o = 0;
        this.h = 0L;
        m();
        el.a(4, c, "LocationProvider stopped");
    }

    private void j() {
        if (this.b && this.p == null) {
            Context contextB = Cdo.a().b();
            if (contextB.checkCallingOrSelfPermission("android.permission.ACCESS_FINE_LOCATION") == 0 || contextB.checkCallingOrSelfPermission("android.permission.ACCESS_COARSE_LOCATION") == 0) {
                i();
                String strK = k();
                a(strK);
                this.k = b(strK);
                this.h = System.currentTimeMillis() + 90000;
                l();
                this.a = true;
                el.a(4, c, "LocationProvider started");
            }
        }
    }

    private String k() {
        String bestProvider;
        Criteria criteria = this.j;
        if (criteria == null) {
            criteria = new Criteria();
        }
        if (TextUtils.isEmpty(this.m)) {
            bestProvider = this.i.getBestProvider(criteria, true);
        } else {
            bestProvider = this.m;
        }
        el.a(4, c, "provider = " + bestProvider);
        return bestProvider;
    }

    private void a(String str) {
        if (!TextUtils.isEmpty(str)) {
            this.i.requestLocationUpdates(str, 10000L, 0.0f, this.l, Looper.getMainLooper());
        }
    }

    private Location b(String str) {
        if (TextUtils.isEmpty(str)) {
            return null;
        }
        return this.i.getLastKnownLocation(str);
    }

    public Location f() {
        Location location = null;
        if (this.p != null) {
            return this.p;
        }
        if (this.b) {
            Location locationB = b(k());
            if (locationB != null) {
                this.k = locationB;
            }
            location = this.k;
        }
        el.a(4, c, "getLocation() = " + location);
        return location;
    }

    public void g() {
        this.n = 0;
        i();
    }

    @Override // com.flurry.sdk.ey.a
    public void a(ey eyVar) {
        if (this.h > 0 && this.h < System.currentTimeMillis()) {
            el.a(4, c, "No location received in 90 seconds , stopping LocationManager");
            i();
        }
    }

    private void l() {
        el.a(4, c, "Register location timer");
        ex.a().a(this);
    }

    private void m() {
        el.a(4, c, "Unregister location timer");
        ex.a().b(this);
    }

    class a implements LocationListener {
        public a() {
        }

        @Override // android.location.LocationListener
        public void onStatusChanged(String str, int i, Bundle bundle) {
        }

        @Override // android.location.LocationListener
        public void onProviderEnabled(String str) {
        }

        @Override // android.location.LocationListener
        public void onProviderDisabled(String str) {
        }

        @Override // android.location.LocationListener
        public void onLocationChanged(Location location) {
            if (location != null) {
                dz.this.k = location;
            }
            el.a(4, dz.c, "Location received");
            if (dz.a(dz.this) >= 3) {
                el.a(4, dz.c, "Max location reports reached, stopping");
                dz.this.i();
            }
        }
    }

    @Override // com.flurry.sdk.dq.a
    public void a(String str, Object obj) {
        if (str.equals("LocationCriteria")) {
            this.j = (Criteria) obj;
            el.a(4, c, "onSettingUpdate, LocationCriteria = " + this.j);
            if (this.a) {
                j();
                return;
            }
            return;
        }
        if (str.equals("ReportLocation")) {
            this.b = ((Boolean) obj).booleanValue();
            el.a(4, c, "onSettingUpdate, ReportLocation = " + this.b);
            if (this.b) {
                if (!this.a && this.n > 0) {
                    j();
                    return;
                }
                return;
            }
            i();
            return;
        }
        el.a(6, c, "LocationProvider internal error! Had to be LocationCriteria or ReportLocation key.");
    }
}
