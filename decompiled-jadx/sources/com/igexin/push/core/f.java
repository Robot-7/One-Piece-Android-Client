package com.igexin.push.core;

import android.content.Context;
import android.content.Intent;
import android.content.IntentFilter;
import android.content.pm.PackageInfo;
import android.content.pm.ServiceInfo;
import android.net.ConnectivityManager;
import android.net.NetworkInfo;
import android.net.wifi.WifiInfo;
import android.net.wifi.WifiManager;
import android.os.Handler;
import android.os.Message;
import android.os.Process;
import com.igexin.sdk.PushConsts;
import com.igexin.sdk.PushService;
import java.io.BufferedReader;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.util.ArrayList;
import java.util.List;
import java.util.concurrent.ConcurrentLinkedQueue;

/* JADX INFO: loaded from: classes.dex */
public class f implements com.igexin.a.a.d.a.c {
    private static f l;
    private Context a;
    private Handler c;
    private com.igexin.push.core.a.f e;
    private ConnectivityManager f;
    private com.igexin.a.a.b.d g;
    private com.igexin.a.a.b.c h;
    private com.igexin.push.d.j i;
    private com.igexin.push.d.c j;
    private com.igexin.push.b.b k;
    private ConcurrentLinkedQueue d = new ConcurrentLinkedQueue();
    private h b = new h();

    private f() {
    }

    public static f a() {
        if (l == null) {
            l = new f();
        }
        return l;
    }

    private void n() {
        String packageName = this.a.getPackageName();
        List<PackageInfo> installedPackages = this.a.getPackageManager().getInstalledPackages(4);
        if (installedPackages != null) {
            for (PackageInfo packageInfo : installedPackages) {
                if ((packageInfo.applicationInfo.flags & 1) == 0 || (packageInfo.applicationInfo.flags & 128) == 1) {
                    ServiceInfo[] serviceInfoArr = packageInfo.services;
                    if (serviceInfoArr != null) {
                        for (ServiceInfo serviceInfo : serviceInfoArr) {
                            if (a.o.equals(serviceInfo.name) || a.n.equals(serviceInfo.name) || a.p.equals(serviceInfo.name)) {
                                String str = packageInfo.packageName;
                                if (!packageName.equals(str)) {
                                    com.igexin.push.core.c.f.a().c().put(str, serviceInfo.name);
                                }
                            }
                        }
                    }
                }
            }
        }
    }

    private boolean o() {
        IntentFilter intentFilter = new IntentFilter();
        intentFilter.addAction(PushConsts.ACTION_BROADCAST_NETWORK_CHANGE);
        intentFilter.addAction("com.igexin.sdk.action.snlrefresh");
        intentFilter.addAction("com.igexin.sdk.action.snlretire");
        intentFilter.addAction(g.W);
        intentFilter.addAction("com.igexin.sdk.action.execute");
        intentFilter.addAction("com.igexin.sdk.action.doaction");
        intentFilter.addAction("android.intent.action.TIME_SET");
        intentFilter.addAction("android.intent.action.SCREEN_ON");
        intentFilter.addAction("android.intent.action.SCREEN_OFF");
        if (this.a.registerReceiver(n.a(), intentFilter) == null) {
            com.igexin.a.a.c.a.a("CoreLogic|InternalPublicReceiver|Failed");
        }
        IntentFilter intentFilter2 = new IntentFilter();
        intentFilter2.addDataScheme("package");
        intentFilter2.addAction("android.intent.action.PACKAGE_ADDED");
        intentFilter2.addAction("android.intent.action.PACKAGE_REMOVED");
        if (this.a.registerReceiver(m.a(), intentFilter2) != null) {
            return true;
        }
        com.igexin.a.a.c.a.a("CoreLogic|InternalPackageReceiver|Failed");
        return true;
    }

    public void a(e eVar) {
        this.c = eVar;
    }

    public boolean a(Context context) {
        this.a = context;
        this.b.start();
        return true;
    }

    public boolean a(Intent intent) {
        if (g.i == null) {
            return false;
        }
        g.i.sendBroadcast(intent);
        return true;
    }

    public boolean a(Message message) {
        if (g.j.get()) {
            this.c.sendMessage(message);
        } else {
            this.d.add(message);
        }
        return true;
    }

    @Override // com.igexin.a.a.d.a.c
    public boolean a(com.igexin.a.a.d.a.f fVar, com.igexin.a.a.d.e eVar) {
        if (this.e != null) {
            return this.e.a(fVar);
        }
        return false;
    }

    @Override // com.igexin.a.a.d.a.c
    public boolean a(com.igexin.a.a.d.d dVar, com.igexin.a.a.d.e eVar) {
        if (this.e != null) {
            return this.e.a(dVar);
        }
        return false;
    }

    public boolean a(com.igexin.push.e.b.h hVar) {
        if (hVar != null) {
            return com.igexin.a.a.b.d.c().a((com.igexin.a.a.d.d) hVar, false, true);
        }
        return false;
    }

    public boolean a(String str) {
        String strG = com.igexin.push.core.a.f.a().g("ss");
        if (g.i != null && this.j != null) {
            new com.igexin.sdk.a.d(g.i).b();
            g.l = false;
            g.p = false;
            com.igexin.push.d.a aVar = new com.igexin.push.d.a();
            aVar.a(c.stop);
            this.j.a(aVar);
            if (strG != null && "1".equals(strG)) {
                try {
                    InputStream inputStream = Runtime.getRuntime().exec("ps").getInputStream();
                    if (inputStream != null) {
                        String packageName = g.i.getPackageName();
                        BufferedReader bufferedReader = new BufferedReader(new InputStreamReader(inputStream));
                        ArrayList arrayList = new ArrayList();
                        while (true) {
                            String line = bufferedReader.readLine();
                            if (line == null) {
                                break;
                            }
                            String[] strArrSplit = line.split("\\s+");
                            arrayList.add(strArrSplit);
                            if (line.indexOf(packageName + "/files/gdaemon") != -1 && strArrSplit.length > 0) {
                                Process.killProcess(Integer.valueOf(strArrSplit[1]).intValue());
                                break;
                            }
                        }
                        bufferedReader.close();
                        inputStream.close();
                    }
                } catch (Exception e) {
                }
                c();
            }
        }
        return true;
    }

    public boolean a(boolean z) {
        if (g.i != null && this.j != null) {
            new com.igexin.sdk.a.d(g.i).a();
            g.l = true;
            if (!new com.igexin.sdk.a.b(g.i).b()) {
                new com.igexin.sdk.a.c(g.i).a();
                g.m = true;
                new com.igexin.sdk.a.b(g.i).a();
            }
            if (z) {
                new com.igexin.sdk.a.c(g.i).a();
                g.m = true;
            }
            com.igexin.push.d.a aVar = new com.igexin.push.d.a();
            aVar.a(c.start);
            this.j.a(aVar);
        }
        return true;
    }

    public void b() {
        WifiInfo connectionInfo;
        try {
            this.f = (ConnectivityManager) this.a.getSystemService("connectivity");
            g.a(this.a);
            this.k = new com.igexin.push.b.b(this.a);
            com.igexin.push.a.i.a().b();
            o();
            this.g = com.igexin.a.a.b.d.c();
            this.g.a((com.igexin.a.a.d.a.b) new com.igexin.push.c.a(this.a, h()));
            this.g.a((com.igexin.a.a.d.a.c) this);
            this.g.a(this.a);
            com.igexin.push.b.a aVar = new com.igexin.push.b.a();
            aVar.a(com.igexin.push.core.c.f.a());
            aVar.a(com.igexin.push.core.c.c.a());
            aVar.a(com.igexin.push.core.c.b.a());
            aVar.a(com.igexin.push.core.b.e.a());
            aVar.a(com.igexin.push.a.a.a());
            this.g.a((com.igexin.a.a.d.d) aVar, true, false);
            com.igexin.a.a.b.d.c().a(com.igexin.a.b.a.a(g.C.getBytes()));
            g.af = this.g.a((com.igexin.a.a.d.d) com.igexin.push.e.b.d.g(), false, true);
            g.ag = this.g.a((com.igexin.a.a.d.d) com.igexin.push.e.b.f.g(), true, true);
            g.ah = this.g.a((com.igexin.a.a.d.d) com.igexin.push.e.b.e.g(), false, true);
            g.ai = this.g.a((com.igexin.a.a.d.d) com.igexin.push.e.b.g.g(), false, true);
            g.aj = this.g.a((com.igexin.a.a.d.d) com.igexin.push.e.b.a.g(), false, true);
            g.ak = this.g.a((com.igexin.a.a.d.d) com.igexin.push.e.b.b.g(), false, true);
            this.e = com.igexin.push.core.a.f.a();
            try {
                if (this.e.E() && (connectionInfo = ((WifiManager) this.a.getSystemService("wifi")).getConnectionInfo()) != null) {
                    g.z = connectionInfo.getMacAddress();
                }
            } catch (Exception e) {
            }
            this.i = new com.igexin.push.d.j();
            this.i.a(this.a, this.g, this.e);
            this.j = new com.igexin.push.d.c();
            this.j.a(this.a);
            com.igexin.push.d.a aVar2 = new com.igexin.push.d.a();
            aVar2.a(c.start);
            this.j.a(aVar2);
            com.igexin.push.e.b.g.g().h();
            g.j.set(true);
            for (Message message : this.d) {
                if (this.c != null) {
                    this.c.sendMessage(message);
                }
            }
            com.igexin.push.core.a.f.a().u();
            this.e.a(Process.myPid());
            n();
            com.igexin.push.extension.a.a().a(this.a);
        } catch (Exception e2) {
            com.igexin.a.a.c.a.a("CoreLogic|init|failed");
        }
    }

    public boolean b(String str) {
        if (g.i == null || this.j == null) {
            return true;
        }
        new com.igexin.sdk.a.c(g.i).b();
        g.m = false;
        g.p = false;
        com.igexin.push.d.a aVar = new com.igexin.push.d.a();
        aVar.a(c.stop);
        this.j.a(aVar);
        return true;
    }

    public void c() {
        this.a.stopService(new Intent(this.a, (Class<?>) PushService.class));
    }

    public com.igexin.a.a.b.c d() {
        if (this.h == null) {
            this.h = com.igexin.push.c.a.c.a();
        }
        return this.h;
    }

    public com.igexin.push.d.j e() {
        return this.i;
    }

    public com.igexin.push.d.c f() {
        return this.j;
    }

    public com.igexin.push.core.a.f g() {
        return this.e;
    }

    public ConnectivityManager h() {
        return this.f;
    }

    public com.igexin.push.b.b i() {
        return this.k;
    }

    public void j() {
        try {
            this.a.unregisterReceiver(m.a());
            this.a.unregisterReceiver(n.a());
            this.a.unregisterReceiver(com.igexin.a.a.b.d.c());
        } catch (Exception e) {
        }
        com.igexin.push.extension.a.a().b();
    }

    public String k() {
        NetworkInfo activeNetworkInfo;
        if (this.f == null || (activeNetworkInfo = this.f.getActiveNetworkInfo()) == null) {
            return null;
        }
        if (activeNetworkInfo.getType() == 1) {
            return "wifi";
        }
        if (activeNetworkInfo.getType() == 0) {
            return "mobile";
        }
        return null;
    }

    @Override // com.igexin.a.a.d.a.c
    public boolean l() {
        return true;
    }

    @Override // com.igexin.a.a.d.a.c
    public long m() {
        return 94808L;
    }
}
