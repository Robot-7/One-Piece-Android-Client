package com.youai.dreamonepiece.platform;

import android.app.Application;
import android.content.Context;
import android.content.pm.ApplicationInfo;
import android.content.pm.PackageManager;
import com.youai.GameMaincpp;
import com.youai.dreamonepiece.LogcatHelper;
import com.youai.sdks.PlatformSdk;

/* JADX INFO: loaded from: classes.dex */
public class PlatformSDKApplication extends Application {
    public void initWithManifest() {
        try {
            ApplicationInfo appInfo = getPackageManager().getApplicationInfo(getPackageName(), 128);
            int plat = appInfo.metaData.getInt("YA_PLATFORM");
            PlatformSDKActivity.platformInfo = GameMaincpp.getPlatformInfoByType(plat);
        } catch (PackageManager.NameNotFoundException e) {
            e.printStackTrace();
        }
    }

    @Override // android.content.ContextWrapper
    protected void attachBaseContext(Context base) {
        super.attachBaseContext(base);
        initWithManifest();
        PlatformSdk.getInstance().attachBaseContext(base, PlatformSDKActivity.platformInfo);
    }

    @Override // android.app.Application
    public void onCreate() {
        super.onCreate();
        PlatformSdk.getInstance().onApplicationCreate(this, PlatformSDKActivity.platformInfo);
        LogcatHelper.getInstance(this).start();
    }
}
