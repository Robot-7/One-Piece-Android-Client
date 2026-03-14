package com.tencent.mm.sdk.openapi;

import android.app.Activity;
import android.app.Application;
import android.app.Service;
import android.content.Context;
import android.content.Intent;
import android.content.pm.PackageInfo;
import android.content.pm.PackageManager;
import android.database.Cursor;
import android.net.Uri;
import android.os.Build;
import android.os.Bundle;
import android.os.Handler;
import android.os.Looper;
import android.util.Log;
import com.tencent.mm.sdk.a.a;
import com.tencent.mm.sdk.a.a.a;
import com.tencent.mm.sdk.a.a.b;
import com.tencent.mm.sdk.b.a;
import com.tencent.mm.sdk.constants.ConstantsAPI;
import com.tencent.mm.sdk.modelbase.BaseReq;
import com.tencent.mm.sdk.modelbase.BaseResp;
import com.tencent.mm.sdk.modelbiz.AddCardToWXCardPackage;
import com.tencent.mm.sdk.modelmsg.GetMessageFromWX;
import com.tencent.mm.sdk.modelmsg.LaunchFromWX;
import com.tencent.mm.sdk.modelmsg.SendAuth;
import com.tencent.mm.sdk.modelmsg.SendMessageToWX;
import com.tencent.mm.sdk.modelmsg.ShowMessageFromWX;
import com.tencent.mm.sdk.modelpay.PayResp;
import com.tencent.wxop.stat.c;
import com.tencent.wxop.stat.d;
import com.tencent.wxop.stat.e;

/* JADX INFO: loaded from: classes.dex */
final class WXApiImplV10 implements IWXAPI {
    private static final String TAG = "MicroMsg.SDK.WXApiImplV10";
    private static ActivityLifecycleCb activityCb = null;
    private static String wxappPayEntryClassname = null;
    private String appId;
    private boolean checkSignature;
    private Context context;
    private boolean detached = false;

    private static final class ActivityLifecycleCb implements Application.ActivityLifecycleCallbacks {
        private static final int DELAYED = 800;
        private static final String TAG = "MicroMsg.SDK.WXApiImplV10.ActivityLifecycleCb";
        private Context context;
        private Handler handler;
        private boolean isForeground;
        private Runnable onPausedRunnable;
        private Runnable onResumedRunnable;

        private ActivityLifecycleCb(Context context) {
            this.isForeground = false;
            this.handler = new Handler(Looper.getMainLooper());
            this.onPausedRunnable = new Runnable() { // from class: com.tencent.mm.sdk.openapi.WXApiImplV10.ActivityLifecycleCb.1
                @Override // java.lang.Runnable
                public void run() {
                    if (WXApiImplV10.activityCb == null || !ActivityLifecycleCb.this.isForeground) {
                        return;
                    }
                    Log.v(ActivityLifecycleCb.TAG, "WXStat trigger onBackground");
                    e.d(ActivityLifecycleCb.this.context, "onBackground_WX");
                    ActivityLifecycleCb.this.isForeground = false;
                }
            };
            this.onResumedRunnable = new Runnable() { // from class: com.tencent.mm.sdk.openapi.WXApiImplV10.ActivityLifecycleCb.2
                @Override // java.lang.Runnable
                public void run() {
                    if (WXApiImplV10.activityCb == null || ActivityLifecycleCb.this.isForeground) {
                        return;
                    }
                    Log.v(ActivityLifecycleCb.TAG, "WXStat trigger onForeground");
                    e.d(ActivityLifecycleCb.this.context, "onForeground_WX");
                    ActivityLifecycleCb.this.isForeground = true;
                }
            };
            this.context = context;
        }

        public final void detach() {
            this.handler.removeCallbacks(this.onResumedRunnable);
            this.handler.removeCallbacks(this.onPausedRunnable);
            this.context = null;
        }

        @Override // android.app.Application.ActivityLifecycleCallbacks
        public final void onActivityCreated(Activity activity, Bundle bundle) {
        }

        @Override // android.app.Application.ActivityLifecycleCallbacks
        public final void onActivityDestroyed(Activity activity) {
        }

        @Override // android.app.Application.ActivityLifecycleCallbacks
        public final void onActivityPaused(Activity activity) {
            Log.v(TAG, activity.getComponentName().getClassName() + "  onActivityPaused");
            this.handler.removeCallbacks(this.onResumedRunnable);
            this.handler.postDelayed(this.onPausedRunnable, 800L);
        }

        @Override // android.app.Application.ActivityLifecycleCallbacks
        public final void onActivityResumed(Activity activity) {
            Log.v(TAG, activity.getComponentName().getClassName() + "  onActivityResumed");
            this.handler.removeCallbacks(this.onPausedRunnable);
            this.handler.postDelayed(this.onResumedRunnable, 800L);
        }

        @Override // android.app.Application.ActivityLifecycleCallbacks
        public final void onActivitySaveInstanceState(Activity activity, Bundle bundle) {
        }

        @Override // android.app.Application.ActivityLifecycleCallbacks
        public final void onActivityStarted(Activity activity) {
        }

        @Override // android.app.Application.ActivityLifecycleCallbacks
        public final void onActivityStopped(Activity activity) {
        }
    }

    WXApiImplV10(Context context, String str, boolean z) {
        this.checkSignature = false;
        a.d(TAG, "<init>, appId = " + str + ", checkSignature = " + z);
        this.context = context;
        this.appId = str;
        this.checkSignature = z;
    }

    private boolean checkSumConsistent(byte[] bArr, byte[] bArr2) {
        if (bArr == null || bArr.length == 0 || bArr2 == null || bArr2.length == 0) {
            a.a(TAG, "checkSumConsistent fail, invalid arguments");
            return false;
        }
        if (bArr.length != bArr2.length) {
            a.a(TAG, "checkSumConsistent fail, length is different");
            return false;
        }
        for (int i = 0; i < bArr.length; i++) {
            if (bArr[i] != bArr2[i]) {
                return false;
            }
        }
        return true;
    }

    private void initMta(Context context, String str) {
        String str2 = "AWXOP" + str;
        c.b(context, str2);
        c.w();
        c.a(d.PERIOD);
        c.t();
        c.c(context, "Wechat_Sdk");
        try {
            e.a(context, str2, "2.0.2");
        } catch (com.tencent.wxop.stat.a e) {
            e.printStackTrace();
        }
    }

    private boolean sendAddCardToWX(Context context, Bundle bundle) {
        Cursor cursorQuery = context.getContentResolver().query(Uri.parse("content://com.tencent.mm.sdk.comm.provider/addCardToWX"), null, null, new String[]{this.appId, bundle.getString("_wxapi_add_card_to_wx_card_list"), bundle.getString("_wxapi_basereq_transaction")}, null);
        if (cursorQuery != null) {
            cursorQuery.close();
        }
        return true;
    }

    private boolean sendJumpToBizProfileReq(Context context, Bundle bundle) {
        Cursor cursorQuery = context.getContentResolver().query(Uri.parse("content://com.tencent.mm.sdk.comm.provider/jumpToBizProfile"), null, null, new String[]{this.appId, bundle.getString("_wxapi_jump_to_biz_profile_req_to_user_name"), bundle.getString("_wxapi_jump_to_biz_profile_req_ext_msg"), new StringBuilder().append(bundle.getInt("_wxapi_jump_to_biz_profile_req_scene")).toString(), new StringBuilder().append(bundle.getInt("_wxapi_jump_to_biz_profile_req_profile_type")).toString()}, null);
        if (cursorQuery != null) {
            cursorQuery.close();
        }
        return true;
    }

    private boolean sendJumpToBizWebviewReq(Context context, Bundle bundle) {
        Cursor cursorQuery = context.getContentResolver().query(Uri.parse("content://com.tencent.mm.sdk.comm.provider/jumpToBizProfile"), null, null, new String[]{this.appId, bundle.getString("_wxapi_jump_to_biz_webview_req_to_user_name"), bundle.getString("_wxapi_jump_to_biz_webview_req_ext_msg"), new StringBuilder().append(bundle.getInt("_wxapi_jump_to_biz_webview_req_scene")).toString()}, null);
        if (cursorQuery != null) {
            cursorQuery.close();
        }
        return true;
    }

    private boolean sendPayReq(Context context, Bundle bundle) {
        if (wxappPayEntryClassname == null) {
            wxappPayEntryClassname = new MMSharedPreferences(context).getString("_wxapp_pay_entry_classname_", null);
            a.d(TAG, "pay, set wxappPayEntryClassname = " + wxappPayEntryClassname);
            if (wxappPayEntryClassname == null) {
                a.a(TAG, "pay fail, wxappPayEntryClassname is null");
                return false;
            }
        }
        a.C0002a c0002a = new a.C0002a();
        c0002a.n = bundle;
        c0002a.k = ConstantsAPI.WXApp.WXAPP_PACKAGE_NAME;
        c0002a.l = wxappPayEntryClassname;
        return com.tencent.mm.sdk.a.a.a(context, c0002a);
    }

    @Override // com.tencent.mm.sdk.openapi.IWXAPI
    public final void detach() {
        com.tencent.mm.sdk.b.a.d(TAG, "detach");
        this.detached = true;
        if (activityCb != null && Build.VERSION.SDK_INT >= 14) {
            if (this.context instanceof Activity) {
                ((Activity) this.context).getApplication().unregisterActivityLifecycleCallbacks(activityCb);
            } else if (this.context instanceof Service) {
                ((Service) this.context).getApplication().unregisterActivityLifecycleCallbacks(activityCb);
            }
            activityCb.detach();
        }
        this.context = null;
    }

    @Override // com.tencent.mm.sdk.openapi.IWXAPI
    public final int getWXAppSupportAPI() {
        if (this.detached) {
            throw new IllegalStateException("getWXAppSupportAPI fail, WXMsgImpl has been detached");
        }
        if (isWXAppInstalled()) {
            return new MMSharedPreferences(this.context).getInt("_build_info_sdk_int_", 0);
        }
        com.tencent.mm.sdk.b.a.a(TAG, "open wx app failed, not installed or signature check failed");
        return 0;
    }

    @Override // com.tencent.mm.sdk.openapi.IWXAPI
    public final boolean handleIntent(Intent intent, IWXAPIEventHandler iWXAPIEventHandler) {
        if (!WXApiImplComm.isIntentFromWx(intent, ConstantsAPI.Token.WX_TOKEN_VALUE_MSG)) {
            com.tencent.mm.sdk.b.a.c(TAG, "handleIntent fail, intent not from weixin msg");
            return false;
        }
        if (this.detached) {
            throw new IllegalStateException("handleIntent fail, WXMsgImpl has been detached");
        }
        String stringExtra = intent.getStringExtra(ConstantsAPI.CONTENT);
        int intExtra = intent.getIntExtra(ConstantsAPI.SDK_VERSION, 0);
        String stringExtra2 = intent.getStringExtra(ConstantsAPI.APP_PACKAGE);
        if (stringExtra2 == null || stringExtra2.length() == 0) {
            com.tencent.mm.sdk.b.a.a(TAG, "invalid argument");
            return false;
        }
        if (!checkSumConsistent(intent.getByteArrayExtra(ConstantsAPI.CHECK_SUM), b.a(stringExtra, intExtra, stringExtra2))) {
            com.tencent.mm.sdk.b.a.a(TAG, "checksum fail");
            return false;
        }
        int intExtra2 = intent.getIntExtra("_wxapi_command_type", 0);
        switch (intExtra2) {
            case 1:
                iWXAPIEventHandler.onResp(new SendAuth.Resp(intent.getExtras()));
                return true;
            case 2:
                iWXAPIEventHandler.onResp(new SendMessageToWX.Resp(intent.getExtras()));
                return true;
            case 3:
                iWXAPIEventHandler.onReq(new GetMessageFromWX.Req(intent.getExtras()));
                return true;
            case 4:
                iWXAPIEventHandler.onReq(new ShowMessageFromWX.Req(intent.getExtras()));
                return true;
            case 5:
                iWXAPIEventHandler.onResp(new PayResp(intent.getExtras()));
                return true;
            case 6:
                iWXAPIEventHandler.onReq(new LaunchFromWX.Req(intent.getExtras()));
                return true;
            case 7:
            case 8:
            default:
                com.tencent.mm.sdk.b.a.a(TAG, "unknown cmd = " + intExtra2);
                return false;
            case 9:
                iWXAPIEventHandler.onResp(new AddCardToWXCardPackage.Resp(intent.getExtras()));
                return true;
        }
    }

    @Override // com.tencent.mm.sdk.openapi.IWXAPI
    public final boolean isWXAppInstalled() {
        if (this.detached) {
            throw new IllegalStateException("isWXAppInstalled fail, WXMsgImpl has been detached");
        }
        try {
            PackageInfo packageInfo = this.context.getPackageManager().getPackageInfo(ConstantsAPI.WXApp.WXAPP_PACKAGE_NAME, 64);
            if (packageInfo == null) {
                return false;
            }
            return WXApiImplComm.validateAppSignature(this.context, packageInfo.signatures, this.checkSignature);
        } catch (PackageManager.NameNotFoundException e) {
            return false;
        }
    }

    @Override // com.tencent.mm.sdk.openapi.IWXAPI
    public final boolean isWXAppSupportAPI() {
        if (this.detached) {
            throw new IllegalStateException("isWXAppSupportAPI fail, WXMsgImpl has been detached");
        }
        return getWXAppSupportAPI() >= 570490883;
    }

    @Override // com.tencent.mm.sdk.openapi.IWXAPI
    public final boolean openWXApp() {
        if (this.detached) {
            throw new IllegalStateException("openWXApp fail, WXMsgImpl has been detached");
        }
        if (!isWXAppInstalled()) {
            com.tencent.mm.sdk.b.a.a(TAG, "open wx app failed, not installed or signature check failed");
            return false;
        }
        try {
            this.context.startActivity(this.context.getPackageManager().getLaunchIntentForPackage(ConstantsAPI.WXApp.WXAPP_PACKAGE_NAME));
            return true;
        } catch (Exception e) {
            com.tencent.mm.sdk.b.a.a(TAG, "startActivity fail, exception = " + e.getMessage());
            return false;
        }
    }

    @Override // com.tencent.mm.sdk.openapi.IWXAPI
    public final boolean registerApp(String str) {
        if (this.detached) {
            throw new IllegalStateException("registerApp fail, WXMsgImpl has been detached");
        }
        if (!WXApiImplComm.validateAppSignatureForPackage(this.context, ConstantsAPI.WXApp.WXAPP_PACKAGE_NAME, this.checkSignature)) {
            com.tencent.mm.sdk.b.a.a(TAG, "register app failed for wechat app signature check failed");
            return false;
        }
        if (activityCb == null && Build.VERSION.SDK_INT >= 14) {
            if (this.context instanceof Activity) {
                initMta(this.context, str);
                activityCb = new ActivityLifecycleCb(this.context);
                ((Activity) this.context).getApplication().registerActivityLifecycleCallbacks(activityCb);
            } else if (this.context instanceof Service) {
                initMta(this.context, str);
                activityCb = new ActivityLifecycleCb(this.context);
                ((Service) this.context).getApplication().registerActivityLifecycleCallbacks(activityCb);
            } else {
                com.tencent.mm.sdk.b.a.b(TAG, "context is not instanceof Activity or Service, disable WXStat");
            }
        }
        com.tencent.mm.sdk.b.a.d(TAG, "registerApp, appId = " + str);
        if (str != null) {
            this.appId = str;
        }
        com.tencent.mm.sdk.b.a.d(TAG, "register app " + this.context.getPackageName());
        a.C0003a c0003a = new a.C0003a();
        c0003a.o = ConstantsAPI.WXApp.WXAPP_PACKAGE_NAME;
        c0003a.p = ConstantsAPI.ACTION_HANDLE_APP_REGISTER;
        c0003a.m = "weixin://registerapp?appid=" + this.appId;
        return com.tencent.mm.sdk.a.a.a.a(this.context, c0003a);
    }

    @Override // com.tencent.mm.sdk.openapi.IWXAPI
    public final boolean sendReq(BaseReq baseReq) {
        if (this.detached) {
            throw new IllegalStateException("sendReq fail, WXMsgImpl has been detached");
        }
        if (!WXApiImplComm.validateAppSignatureForPackage(this.context, ConstantsAPI.WXApp.WXAPP_PACKAGE_NAME, this.checkSignature)) {
            com.tencent.mm.sdk.b.a.a(TAG, "sendReq failed for wechat app signature check failed");
            return false;
        }
        if (!baseReq.checkArgs()) {
            com.tencent.mm.sdk.b.a.a(TAG, "sendReq checkArgs fail");
            return false;
        }
        com.tencent.mm.sdk.b.a.d(TAG, "sendReq, req type = " + baseReq.getType());
        Bundle bundle = new Bundle();
        baseReq.toBundle(bundle);
        if (baseReq.getType() == 5) {
            return sendPayReq(this.context, bundle);
        }
        if (baseReq.getType() == 7) {
            return sendJumpToBizProfileReq(this.context, bundle);
        }
        if (baseReq.getType() == 8) {
            return sendJumpToBizWebviewReq(this.context, bundle);
        }
        if (baseReq.getType() == 9) {
            return sendAddCardToWX(this.context, bundle);
        }
        a.C0002a c0002a = new a.C0002a();
        c0002a.n = bundle;
        c0002a.m = "weixin://sendreq?appid=" + this.appId;
        c0002a.k = ConstantsAPI.WXApp.WXAPP_PACKAGE_NAME;
        c0002a.l = ConstantsAPI.WXApp.WXAPP_MSG_ENTRY_CLASSNAME;
        return com.tencent.mm.sdk.a.a.a(this.context, c0002a);
    }

    @Override // com.tencent.mm.sdk.openapi.IWXAPI
    public final boolean sendResp(BaseResp baseResp) {
        if (this.detached) {
            throw new IllegalStateException("sendResp fail, WXMsgImpl has been detached");
        }
        if (!WXApiImplComm.validateAppSignatureForPackage(this.context, ConstantsAPI.WXApp.WXAPP_PACKAGE_NAME, this.checkSignature)) {
            com.tencent.mm.sdk.b.a.a(TAG, "sendResp failed for wechat app signature check failed");
            return false;
        }
        if (!baseResp.checkArgs()) {
            com.tencent.mm.sdk.b.a.a(TAG, "sendResp checkArgs fail");
            return false;
        }
        Bundle bundle = new Bundle();
        baseResp.toBundle(bundle);
        a.C0002a c0002a = new a.C0002a();
        c0002a.n = bundle;
        c0002a.m = "weixin://sendresp?appid=" + this.appId;
        c0002a.k = ConstantsAPI.WXApp.WXAPP_PACKAGE_NAME;
        c0002a.l = ConstantsAPI.WXApp.WXAPP_MSG_ENTRY_CLASSNAME;
        return com.tencent.mm.sdk.a.a.a(this.context, c0002a);
    }

    @Override // com.tencent.mm.sdk.openapi.IWXAPI
    public final void unregisterApp() {
        if (this.detached) {
            throw new IllegalStateException("unregisterApp fail, WXMsgImpl has been detached");
        }
        if (!WXApiImplComm.validateAppSignatureForPackage(this.context, ConstantsAPI.WXApp.WXAPP_PACKAGE_NAME, this.checkSignature)) {
            com.tencent.mm.sdk.b.a.a(TAG, "unregister app failed for wechat app signature check failed");
            return;
        }
        com.tencent.mm.sdk.b.a.d(TAG, "unregisterApp, appId = " + this.appId);
        if (this.appId == null || this.appId.length() == 0) {
            com.tencent.mm.sdk.b.a.a(TAG, "unregisterApp fail, appId is empty");
            return;
        }
        com.tencent.mm.sdk.b.a.d(TAG, "unregister app " + this.context.getPackageName());
        a.C0003a c0003a = new a.C0003a();
        c0003a.o = ConstantsAPI.WXApp.WXAPP_PACKAGE_NAME;
        c0003a.p = ConstantsAPI.ACTION_HANDLE_APP_UNREGISTER;
        c0003a.m = "weixin://unregisterapp?appid=" + this.appId;
        com.tencent.mm.sdk.a.a.a.a(this.context, c0003a);
    }
}
