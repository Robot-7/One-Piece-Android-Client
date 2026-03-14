package com.youai.dreamonepiece.platform;

import android.content.Intent;
import android.content.pm.ApplicationInfo;
import android.content.pm.PackageManager;
import android.os.Bundle;
import com.tencent.mm.sdk.openapi.WXAPIFactory;
import com.tencent.stat.common.StatConstants;
import com.testin.agent.TestinAgent;
import com.youai.GameMaincpp;
import com.youai.dreamonepiece.GameActivity;
import com.youai.dreamonepiece.GameConfig;
import com.youai.dreamonepiece.YouaiConfig;
import com.youai.push.pushsdk.PushManager;
import com.youai.sdks.PlatformSdk;
import com.youai.sdks.beans.PlatformInfo;
import com.youaiAnalysis.AnalysisManager;

/* JADX INFO: loaded from: classes.dex */
public class PlatformSDKActivity extends GameActivity {
    public static PlatformInfo platformInfo;
    private boolean doInitWeChat = false;

    public PlatformSDKActivity() {
        this.mGameCfg = new GameConfig(this, Integer.valueOf(GameMaincpp.enPlatform).intValue());
    }

    @Override // com.youai.dreamonepiece.GameActivity, org.cocos2dx.lib.Cocos2dxActivity, android.app.Activity
    protected void onCreate(Bundle savedInstanceState) {
        String WX_APP_ID;
        super.onCreate(savedInstanceState);
        PushManager.getInstance().onCreate(this);
        AnalysisManager.getInstance().onCreate(this);
        PlatformSdk.getInstance().onActivityCreate(this, platformInfo);
        TestinAgent.init(this);
        if (!this.doInitWeChat) {
            ApplicationInfo appInfo = null;
            try {
                appInfo = getPackageManager().getApplicationInfo(getPackageName(), 128);
            } catch (PackageManager.NameNotFoundException e) {
            }
            if (appInfo != null && appInfo.metaData != null && (WX_APP_ID = appInfo.metaData.getString("WX_APP_ID")) != null) {
                YouaiConfig.WX_APP_ID = WX_APP_ID;
            }
            this.doInitWeChat = true;
        }
        if (YouaiConfig.WX_APP_ID != null && !YouaiConfig.WX_APP_ID.equals(StatConstants.MTA_COOPERATION_TAG)) {
            api = WXAPIFactory.createWXAPI(this, YouaiConfig.WX_APP_ID, false);
            api.registerApp(YouaiConfig.WX_APP_ID);
        }
    }

    @Override // android.app.Activity
    protected void onActivityResult(int requestCode, int resultCode, Intent data) {
        PlatformSdk.getInstance().onActivityResult(requestCode, resultCode, data);
    }

    @Override // android.app.Activity, android.view.Window.Callback
    public void onWindowFocusChanged(boolean hasFocus) {
        super.onWindowFocusChanged(hasFocus);
        PlatformSdk.getInstance().onWindowFocusChanged(hasFocus);
    }

    @Override // com.youai.dreamonepiece.GameActivity, org.cocos2dx.lib.Cocos2dxActivity, android.app.Activity
    protected void onResume() {
        super.onResume();
        PlatformSdk.getInstance().onResume(this);
        AnalysisManager.getInstance().onResume(this);
    }

    @Override // com.youai.dreamonepiece.GameActivity, org.cocos2dx.lib.Cocos2dxActivity, android.app.Activity
    protected void onPause() {
        super.onPause();
        PlatformSdk.getInstance().onPause(this);
        AnalysisManager.getInstance().onPause(this);
    }

    @Override // com.youai.dreamonepiece.GameActivity, org.cocos2dx.lib.Cocos2dxActivity, android.app.Activity
    protected void onStart() {
        super.onStart();
        TestinAgent.onStart(this);
        AnalysisManager.getInstance().onStart(this);
        PlatformSdk.getInstance().onStart(this);
    }

    @Override // org.cocos2dx.lib.Cocos2dxActivity, android.app.Activity
    protected void onRestart() {
        super.onStart();
        PlatformSdk.getInstance().onRestart(this);
    }

    @Override // com.youai.dreamonepiece.GameActivity, org.cocos2dx.lib.Cocos2dxActivity, android.app.Activity
    protected void onStop() {
        super.onStop();
        TestinAgent.onStop(this);
        AnalysisManager.getInstance().onStop(this);
        PlatformSdk.getInstance().onStop(this);
    }

    @Override // com.youai.dreamonepiece.GameActivity, org.cocos2dx.lib.Cocos2dxActivity, android.app.Activity
    protected void onDestroy() {
        super.onDestroy();
        PlatformSdk.getInstance().onDestroy(this);
        AnalysisManager.getInstance().onDestroy();
    }
}
