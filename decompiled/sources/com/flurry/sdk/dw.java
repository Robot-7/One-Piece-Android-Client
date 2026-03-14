package com.flurry.sdk;

import android.os.Looper;
import com.google.android.gms.ads.identifier.AdvertisingIdClient;
import com.google.android.gms.common.GooglePlayServicesNotAvailableException;
import com.google.android.gms.common.GooglePlayServicesRepairableException;
import com.google.android.gms.common.GooglePlayServicesUtil;
import java.io.IOException;

/* JADX INFO: loaded from: classes.dex */
public class dw {
    private static final String a = dw.class.getSimpleName();

    public static synchronized AdvertisingIdClient.Info a() {
        if (Looper.getMainLooper().getThread() == Thread.currentThread()) {
            throw new IllegalStateException("Must be called from a background thread!");
        }
        return !b() ? null : c();
    }

    public static boolean b() {
        try {
            int iIsGooglePlayServicesAvailable = GooglePlayServicesUtil.isGooglePlayServicesAvailable(Cdo.a().b());
            if (iIsGooglePlayServicesAvailable == 0) {
                return true;
            }
            el.d(a, "Google Play Services not available - connection result: " + iIsGooglePlayServicesAvailable);
            return false;
        } catch (Exception e) {
            el.d(a, "Google Play Services not available - " + e);
            return false;
        }
    }

    private static AdvertisingIdClient.Info c() {
        try {
            return AdvertisingIdClient.getAdvertisingIdInfo(Cdo.a().b());
        } catch (IOException e) {
            el.a(6, a, "Exception in readAdvertisingInfo():" + e);
            return null;
        } catch (GooglePlayServicesRepairableException e2) {
            el.a(6, a, "Exception in readAdvertisingInfo():" + e2);
            return null;
        } catch (GooglePlayServicesNotAvailableException e3) {
            el.a(6, a, "Exception in readAdvertisingInfo():" + e3);
            return null;
        }
    }
}
