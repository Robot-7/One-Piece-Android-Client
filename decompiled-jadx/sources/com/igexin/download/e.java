package com.igexin.download;

import android.content.ComponentName;
import android.content.ServiceConnection;
import android.os.IBinder;
import java.lang.reflect.InvocationTargetException;

/* JADX INFO: loaded from: classes.dex */
public class e implements ServiceConnection {
    final /* synthetic */ DownloadService a;

    public e(DownloadService downloadService) {
        this.a = downloadService;
    }

    public void a() {
        synchronized (this.a) {
            if (this.a.h != null) {
                this.a.h = null;
                try {
                    this.a.unbindService(this);
                } catch (IllegalArgumentException e) {
                }
            }
        }
    }

    @Override // android.content.ServiceConnection
    public void onServiceConnected(ComponentName componentName, IBinder iBinder) {
        this.a.g = false;
        synchronized (this.a) {
            try {
                this.a.h = Class.forName("android.media.IMediaScannerService").getField("Stub").getType().getMethod("asInterface", IBinder.class).invoke(null, iBinder);
                if (this.a.h != null) {
                    this.a.a();
                }
            } catch (ClassNotFoundException e) {
            } catch (IllegalAccessException e2) {
            } catch (IllegalArgumentException e3) {
            } catch (NoSuchFieldException e4) {
            } catch (NoSuchMethodException e5) {
            } catch (SecurityException e6) {
            } catch (InvocationTargetException e7) {
            }
        }
    }

    @Override // android.content.ServiceConnection
    public void onServiceDisconnected(ComponentName componentName) {
        synchronized (this.a) {
            this.a.h = null;
        }
    }
}
