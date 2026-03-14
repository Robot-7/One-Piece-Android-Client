package com.youai.sdks;

import android.app.Activity;
import android.content.Context;
import android.content.Intent;
import android.util.Log;
import com.youai.sdks.beans.AppInfo;
import com.youai.sdks.beans.LoginInfo;
import com.youai.sdks.beans.PayInfo;
import com.youai.sdks.beans.PlatformContacts;
import com.youai.sdks.beans.PlatformInfo;
import com.youai.sdks.beans.ShareInfo;
import com.youai.sdks.beans.YALastLoginHelp;
import com.youai.sdks.callback.CallbackListener;
import com.youai.sdks.callback.YASdkInterface;
import com.youai.sdks.platform.PlatformBase;
import com.youai.sdks.utils.YALog;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.util.HashMap;
import org.json.JSONObject;

/* JADX INFO: loaded from: classes.dex */
public class PlatformSdk {
    private static final String TAG = "PlatformSdk";
    private static volatile PlatformSdk singleton;
    private Class<?> clazz;
    private PlatformInfo platformInfo;
    private PlatformBase platformInstance = null;

    public static PlatformSdk getInstance() {
        if (singleton == null) {
            synchronized (PlatformSdk.class) {
                if (singleton == null) {
                    singleton = new PlatformSdk();
                }
            }
        }
        return singleton;
    }

    public String getPlatformName(int type) {
        return PlatformRegistery.getInstance().getPlatformClassForType(Integer.valueOf(type));
    }

    public void init(Activity activity, AppInfo appinfo, PlatformInfo platformInfo, YASdkInterface sdkListener) {
        this.platformInfo = platformInfo;
        YALog.i(this.platformInfo);
        initPlatformInstance(platformInfo);
        this.platformInstance.init(activity, this.platformInfo, sdkListener);
    }

    public void unInit(Activity activity) {
        YALog.i("unInit");
        this.platformInstance.unInit();
    }

    public void setDebugMode(boolean debug) {
        this.platformInstance.setDebugMode(debug);
        YALog.Debug = debug;
    }

    public void callToolBar(boolean visible) {
        YALog.i("callToolBar visible = " + visible);
        this.platformInstance.callToolBar(visible);
    }

    public void setScreenOrientation(PlatformContacts.ScreenOrientation orientation) {
        this.platformInstance.setScreenOrientation(orientation);
    }

    public void login(Activity context) {
        YALog.i("login");
        this.platformInstance.callLogin(context);
    }

    public LoginInfo getLoginInfo() {
        return this.platformInstance.getLoginInfo();
    }

    public void logout(Activity context) {
        YALog.i("logout");
        this.platformInstance.callLogout(context);
    }

    public int showFeedBack(Activity context, YALastLoginHelp yaLastLoginHelp) {
        YALog.i("showFeedBack");
        return this.platformInstance.callPlatformFeedback(context, yaLastLoginHelp);
    }

    public void showBBS(Activity context, String url) {
        YALog.i("showBBS : url = " + url);
        this.platformInstance.callPlatformGameBBS(context, url);
    }

    public void showEnterPlatform(Activity context) {
        YALog.i("showEnterPlatform");
        this.platformInstance.callAccountManage(context);
    }

    public int showPay(Activity context, PayInfo buyInfo) {
        YALog.i(buyInfo);
        return this.platformInstance.callPayRecharge(context, buyInfo);
    }

    public void shareToThirdPlatForm(Activity context, ShareInfo shareInfo) {
        YALog.i(shareInfo);
        this.platformInstance.callPlatformSupportThirdShare(context, shareInfo);
    }

    public void switchAccount(Activity context) {
        YALog.i("Switch Account");
        this.platformInstance.callAccountManage(context);
    }

    public void setEnterGame(boolean flag, JSONObject jsonData) {
        YALog.i("setEnterGame");
        this.platformInstance.setEnteredGame(flag, jsonData);
    }

    public void onActivityResult(int requestCode, int resultCode, Intent data) {
        YALog.i("onActivityResult");
        this.platformInstance.onActivityResult(requestCode, resultCode, data);
    }

    public void attachBaseContext(Context base, PlatformInfo platformInfo) {
        YALog.i("attachBaseContext");
        this.platformInfo = platformInfo;
        initPlatformInstance(platformInfo);
        this.platformInstance.attachBaseContext(base, platformInfo);
    }

    public void onApplicationCreate(Context base, PlatformInfo platformInfo) {
        YALog.i("ApplicationCreate");
        this.platformInstance.callCreate(base, platformInfo);
    }

    public void onActivityCreate(Activity activity, PlatformInfo platformInfo) {
        YALog.i("onCreate");
        this.platformInstance.callCreate(activity, platformInfo);
    }

    public void onResume(Activity activity) {
        YALog.i("onResume");
        this.platformInstance.callResume(activity);
    }

    public void onPause(Activity activity) {
        YALog.i("onPause");
        this.platformInstance.callPause(activity);
    }

    public void onStart() {
        YALog.i("onStart");
        this.platformInstance.callStart();
    }

    public void onStart(Activity activity) {
        YALog.i("onStart");
        this.platformInstance.callStart(activity);
    }

    public void onRestart() {
        YALog.i("onStart");
        this.platformInstance.callReStart();
    }

    public void onRestart(Activity activity) {
        YALog.i("onStart");
        this.platformInstance.callReStart(activity);
    }

    public void onDestroy() {
        YALog.i("onDestroy");
        this.platformInstance.callDestroy();
    }

    public void onDestroy(Activity acitvity) {
        YALog.i("onDestroy");
        this.platformInstance.callDestroy(acitvity);
    }

    public void onStop() {
        YALog.i("onStop");
        this.platformInstance.callStop();
    }

    public void onStop(Activity acitvity) {
        YALog.i("onStop");
        this.platformInstance.callStop(acitvity);
    }

    private void initPlatformInstance(PlatformInfo platformInfo) {
        if (this.platformInstance == null) {
            String className = PlatformRegistery.getInstance().getPlatformClassForType(Integer.valueOf(platformInfo.platform));
            YALog.i("sdk init " + className);
            try {
                this.clazz = Class.forName(className);
                this.platformInstance = (PlatformBase) this.clazz.newInstance();
            } catch (ClassNotFoundException e) {
                Log.e(TAG, "获取不到类名");
                e.printStackTrace();
            } catch (IllegalAccessException e2) {
                Log.e(TAG, "违法的访问异常，找不到构造方法");
                e2.printStackTrace();
            } catch (InstantiationException e3) {
                Log.e(TAG, "违法的访问异常，找不到构造方法");
                e3.printStackTrace();
            } catch (Exception e4) {
                Log.e(TAG, "初始化失败");
            }
        }
    }

    public int excute(String functionName, HashMap<String, Object> params, CallbackListener<?> callbackListener) {
        if (this.platformInstance == null) {
            return -1;
        }
        try {
            Method declaredMethod = this.clazz.getDeclaredMethod(functionName, HashMap.class, CallbackListener.class);
            declaredMethod.invoke(this.platformInstance, params, callbackListener);
            return 0;
        } catch (IllegalAccessException e) {
            e.printStackTrace();
            return -1;
        } catch (IllegalArgumentException e2) {
            e2.printStackTrace();
            return -1;
        } catch (NoSuchMethodException e3) {
            e3.printStackTrace();
            return -1;
        } catch (InvocationTargetException e4) {
            e4.printStackTrace();
            return -1;
        }
    }

    public void onGameExit() {
        YALog.i("onGameExit");
        this.platformInstance.onGameExit();
    }

    public boolean isTryUser() {
        YALog.i("isTryUser");
        return this.platformInstance.isTryUser();
    }

    public void reserve() {
        YALog.i("reserve");
        this.platformInstance.reserve();
    }

    public void callCheckVersionUpate() {
        YALog.i("callCheckVersionUpate");
        this.platformInstance.callCheckVersionUpate();
    }

    public void onWindowFocusChanged(boolean hasFocus) {
        YALog.i("onWindowFocusChanged");
        this.platformInstance.onWindowFocusChanged(hasFocus);
    }
}
