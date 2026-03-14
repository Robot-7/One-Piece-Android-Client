package com.youai.dreamonepiece;

import android.app.ActivityManager;
import android.app.AlertDialog;
import android.content.Context;
import android.content.DialogInterface;
import android.content.Intent;
import android.graphics.Bitmap;
import android.graphics.BitmapFactory;
import android.media.MediaPlayer;
import android.net.Uri;
import android.os.Build;
import android.os.Bundle;
import android.os.Handler;
import android.os.Message;
import android.os.Process;
import android.os.StrictMode;
import android.os.SystemClock;
import android.util.Log;
import android.view.KeyEvent;
import android.view.View;
import android.view.WindowManager;
import android.widget.ImageButton;
import android.widget.Toast;
import com.igexin.download.Downloads;
import com.tencent.mm.sdk.modelmsg.SendMessageToWX;
import com.tencent.mm.sdk.modelmsg.WXImageObject;
import com.tencent.mm.sdk.modelmsg.WXMediaMessage;
import com.tencent.mm.sdk.modelmsg.WXTextObject;
import com.tencent.mm.sdk.modelmsg.WXWebpageObject;
import com.tencent.mm.sdk.openapi.IWXAPI;
import com.youai.DeviceUtil;
import com.youai.GameActivityHelper;
import com.youai.IPlatformLoginAndPay;
import com.youai.IStateManager;
import com.youai.NetworkUtil;
import com.youai.PlatformAndGameInfo;
import com.youai.ShakeLisenter;
import com.youai.WXUtil;
import com.youai.WorldVideoView;
import com.youai.dreamonepiece.GameInterface;
import com.youai.dreamonepiece.platform.pipaw.R;
import java.io.File;
import java.util.ArrayList;
import org.cocos2dx.lib.Cocos2dxActivity;
import org.cocos2dx.lib.Cocos2dxHelper;
import org.codehaus.jackson.util.MinimalPrettyPrinter;

/* JADX INFO: loaded from: classes.dex */
public class GameActivity extends Cocos2dxActivity implements MediaPlayer.OnCompletionListener, GameInterface.IDreamOnePiece {
    private static final String TAG;
    public static IWXAPI api;
    private static ImageButton buttonStopMovie;
    private static boolean canPressBack;
    static Context mContext;
    static GameActivity mGameApp;
    static Handler mHandler;
    private static WorldVideoView videoWorldView;
    public static boolean weChatHave;
    private Handler mGameContextStateHandler;
    private PlatformAndGameInfo.VersionInfo mVersionResult;
    private DownloadApk updateApk;
    protected GameConfig mGameCfg = null;
    private IStateManager mStateMgr = new GameStateManager(7, this);
    protected IPlatformLoginAndPay mPlatform = null;
    private long mLastMenuKeyDownTimeMillis = 0;
    private long mRecentPressMenuKeyDownCount = 0;
    private boolean mHaveEnteredGameAppState = false;
    private ShakeLisenter mShakeListener = null;
    private boolean videoWorldViewPause = false;

    public static native void nativeNotifyTryUserRegistSuccess();

    public static native void nativeOnMotionShake();

    public static native void nativeOnPlayMovieEnd();

    public static native void nativeOnShareEngineMessage(boolean z);

    public static native void nativeRequestGameSvrBindTryToOkUser(String str, String str2);

    static {
        System.loadLibrary("DreamOnePiece");
        TAG = GameActivity.class.getSimpleName();
        canPressBack = true;
        weChatHave = false;
    }

    public static void setWeChat(boolean pWeChat) {
        weChatHave = pWeChat;
    }

    public static void requestRestart() {
        GameActivityHelper.requestRestart(getContext(), mHandler);
    }

    public static void openWeChat() {
        GameActivityHelper.openWeChat(getContext(), mHandler);
    }

    public static int getMobileNetType() {
        int type = NetworkUtil.getMobileNetType(mContext);
        Log.e(TAG, "getMobileNetType:" + type);
        return type;
    }

    public static int getMobileNetISP() {
        int isp = NetworkUtil.getMobileNetISP(mContext);
        Log.e(TAG, "getMobileNetISP:" + isp);
        return isp;
    }

    public static void callToolBar(boolean visible) {
        Message msg = new Message();
        Bundle bundle = new Bundle();
        bundle.putBoolean(GameAppState.HANDLER_MSG_TO_MAINTHREAD_CallNd91_TOOLBAR_KEY, visible);
        msg.setData(bundle);
        msg.what = 30;
        mGameApp.mGameAppStateHandler.sendMessage(msg);
    }

    @Override // org.cocos2dx.lib.Cocos2dxActivity, android.app.Activity
    protected void onCreate(Bundle savedInstanceState) {
        long start = System.currentTimeMillis();
        super.onCreate(savedInstanceState);
        mHandler = getMainHandler();
        mContext = getActivity();
        mGameApp = this;
        this.mStateMgr.changeState(1);
        this.mShakeListener = new ShakeLisenter(this);
        this.mShakeListener.setOnShakeListener(new shakeLitener());
        StrictMode.setThreadPolicy(new StrictMode.ThreadPolicy.Builder().detectNetwork().build());
        AnalyticsToolHelp.onCreate(this, getGameInfo());
        long end = System.currentTimeMillis();
        long span = end - start;
        Log.e(TAG, "onCreate cost time: " + span + " millis");
    }

    @Override // org.cocos2dx.lib.Cocos2dxActivity, android.app.Activity
    protected void onDestroy() {
        super.onDestroy();
        if (this.updateApk != null) {
            this.updateApk.onDestroy();
            this.updateApk = null;
        }
        Log.d(TAG, "call onDestroy and System exit");
        Process.killProcess(Process.myPid());
    }

    @Override // org.cocos2dx.lib.Cocos2dxActivity
    protected void destroy() {
        Log.d(TAG, "call destroy");
        AnalyticsToolHelp.onStop();
        if (this.mPlatform != null) {
            Log.d(TAG, "mPlatform.unInit");
            this.mPlatform.unInit();
            this.mPlatform = null;
        }
        super.destroy();
        this.mStateMgr.changeState(0);
        this.mStateMgr = null;
    }

    @Override // org.cocos2dx.lib.Cocos2dxActivity, android.app.Activity
    protected void onStart() {
        super.onStart();
        AnalyticsToolHelp.onStart();
        Log.d(TAG, "call onStart");
    }

    @Override // org.cocos2dx.lib.Cocos2dxActivity, android.app.Activity
    protected void onResume() {
        super.onResume();
        mContext = getActivity();
        if (weChatHave) {
            mGameApp.runOnGLThread(new Runnable() { // from class: com.youai.dreamonepiece.GameActivity.1
                @Override // java.lang.Runnable
                public void run() {
                    GameActivity.nativeOnShareEngineMessage(true);
                }
            });
            weChatHave = false;
        }
        AnalyticsToolHelp.onResume();
    }

    @Override // org.cocos2dx.lib.Cocos2dxActivity, android.app.Activity
    protected void onPause() {
        if (videoWorldView != null && videoWorldView.isPlaying()) {
            stopMovie();
        }
        super.onPause();
        AnalyticsToolHelp.onPause();
    }

    @Override // org.cocos2dx.lib.Cocos2dxActivity, android.app.Activity
    protected void onStop() {
        super.onStop();
        AnalyticsToolHelp.onStop();
        Log.d(TAG, "call onStop");
    }

    @Override // org.cocos2dx.lib.Cocos2dxActivity, android.app.Activity, android.view.KeyEvent.Callback
    public boolean onKeyDown(int keyCode, KeyEvent event) {
        Log.e(TAG, "onKeyDown, keyCode: " + String.valueOf(keyCode) + " getDownTime: " + String.valueOf(event.getDownTime()));
        if (keyCode == 26) {
            if (event.isLongPress()) {
                Log.d(TAG, "KEYCODE_POWER isLongPress");
                if (!this.mIsCocos2dxSurfaceViewCreated) {
                    super.onLowMemory();
                }
                return true;
            }
        } else {
            if (keyCode == 82) {
                if (this.mIsTempShortPause || this.mIsOnPause || !this.mIsCocos2dxSurfaceViewCreated) {
                    return super.onKeyDown(keyCode, event);
                }
                long nowtime = SystemClock.elapsedRealtime();
                if (nowtime - this.mLastMenuKeyDownTimeMillis < 3000 && this.mRecentPressMenuKeyDownCount > 0) {
                    this.mRecentPressMenuKeyDownCount = 0L;
                    Toast.makeText(this, "正在截屏", 0).show();
                    super.runOnGLThread(new Runnable() { // from class: com.youai.dreamonepiece.GameActivity.2
                        @Override // java.lang.Runnable
                        public void run() {
                            String png_file = Cocos2dxHelper.nativeGameSnapshot();
                            PlatformAndGameInfo.ShareInfo share = new PlatformAndGameInfo.ShareInfo();
                            share.content = "#伟大航路##DreamOnePiece#@伟大航路Online";
                            share.img_path = png_file;
                            this.callSystemShare(share);
                        }
                    });
                    return true;
                }
                if (nowtime - this.mLastMenuKeyDownTimeMillis < 3000) {
                    return super.onKeyDown(keyCode, event);
                }
                this.mLastMenuKeyDownTimeMillis = nowtime;
                if (this.mRecentPressMenuKeyDownCount < 1) {
                    Toast.makeText(this, "再按一次截屏分享", 0).show();
                    this.mRecentPressMenuKeyDownCount++;
                    return super.onKeyDown(keyCode, event);
                }
                Toast.makeText(this, "再按一次截屏分享", 0).show();
                return super.onKeyDown(keyCode, event);
            }
            if (keyCode == 4) {
                if (!canPressBack) {
                    return true;
                }
                if ((this.mGameCfg.mGameInfo.platform_type == 1 || this.mGameCfg.mGameInfo.platform_type == 3 || this.mGameCfg.mGameInfo.platform_type == 2 || this.mGameCfg.mGameInfo.platform_type == 32 || this.mGameCfg.mGameInfo.platform_type == 23 || this.mGameCfg.mGameInfo.platform_type == 73 || this.mGameCfg.mGameInfo.platform_type == 61) && this.mPlatform != null) {
                    super.setOnTempShortPause(true);
                    this.mPlatform.onGameExit();
                    return true;
                }
                showExitDialog();
                return true;
            }
        }
        Log.e(TAG, "onKeyDown, voloum keyCode: " + String.valueOf(keyCode) + " getDownTime: " + String.valueOf(event.getDownTime()));
        return super.onKeyDown(keyCode, event);
    }

    private void showExitDialog() {
        AlertDialog dlg = new AlertDialog.Builder(this).setTitle(R.string.app_name).setMessage(R.string.app_exit_msg).setPositiveButton("确定", new DialogInterface.OnClickListener() { // from class: com.youai.dreamonepiece.GameActivity.5
            @Override // android.content.DialogInterface.OnClickListener
            public void onClick(DialogInterface dialog, int which) {
                GameActivity.this.finish();
            }
        }).setNegativeButton("取消", new DialogInterface.OnClickListener() { // from class: com.youai.dreamonepiece.GameActivity.4
            @Override // android.content.DialogInterface.OnClickListener
            public void onClick(DialogInterface dialog, int which) {
            }
        }).setOnCancelListener(new DialogInterface.OnCancelListener() { // from class: com.youai.dreamonepiece.GameActivity.3
            @Override // android.content.DialogInterface.OnCancelListener
            public void onCancel(DialogInterface dialog) {
            }
        }).create();
        dlg.setCanceledOnTouchOutside(false);
        WindowManager.LayoutParams lp = dlg.getWindow().getAttributes();
        dlg.getWindow().setAttributes(lp);
        dlg.show();
    }

    @Override // android.app.Activity, android.view.KeyEvent.Callback
    public boolean onKeyLongPress(int keyCode, KeyEvent event) {
        Log.d(TAG, "onKeyLongPress, keyCode: " + String.valueOf(keyCode));
        if (this.mIsTempShortPause || this.mIsOnPause) {
            return super.onKeyDown(keyCode, event);
        }
        if (keyCode == 82) {
            final GameActivity theActivity = (GameActivity) Cocos2dxActivity.getContext();
            super.runOnGLThread(new Runnable() { // from class: com.youai.dreamonepiece.GameActivity.6
                @Override // java.lang.Runnable
                public void run() {
                    String png_file = Cocos2dxHelper.nativeGameSnapshot();
                    theActivity.callPlatformSupportThirdShare("#伟大航路##DreamOnePiece#@伟大航路Online", png_file);
                }
            });
            return true;
        }
        return super.onKeyLongPress(keyCode, event);
    }

    public void callSystemShare(final PlatformAndGameInfo.ShareInfo share) {
        if (share != null) {
            super.setOnTempShortPause(true);
            new Thread(new Runnable() { // from class: com.youai.dreamonepiece.GameActivity.7
                @Override // java.lang.Runnable
                public void run() {
                    Intent intent1 = new Intent("android.intent.action.SEND");
                    Intent intent = new Intent("android.intent.action.SEND_MULTIPLE");
                    intent.setType("image/png");
                    intent1.setType("image/png");
                    intent.putExtra("android.intent.extra.SUBJECT", "分享伟大航路");
                    intent.putExtra("android.intent.extra.TEXT", share.content);
                    intent1.putExtra("android.intent.extra.SUBJECT", "分享伟大航路");
                    intent1.putExtra("android.intent.extra.TEXT", share.content);
                    intent1.putExtra("android.intent.extra.STREAM", Uri.parse("file:///" + share.img_path));
                    ArrayList<Uri> arrayUri = new ArrayList<>();
                    arrayUri.add(Uri.parse("file:///" + share.img_path));
                    intent.putExtra("android.intent.extra.STREAM", arrayUri);
                    intent.setFlags(268435456);
                    intent1.setFlags(268435456);
                    Cocos2dxActivity.getContext().startActivity(Intent.createChooser(intent1, "分享"));
                    Log.d("callSystemShare", "android.intent.action.SEND");
                }
            }).start();
        }
    }

    @Override // org.cocos2dx.lib.Cocos2dxActivity, org.cocos2dx.lib.Cocos2dxHelper.Cocos2dxHelperListener
    public boolean getPlatformLoginStatus() {
        PlatformAndGameInfo.LoginInfo login_info;
        return (this.mPlatform == null || (login_info = this.mPlatform.getLoginInfo()) == null || login_info.login_result != 0) ? false : true;
    }

    @Override // org.cocos2dx.lib.Cocos2dxActivity, org.cocos2dx.lib.Cocos2dxHelper.Cocos2dxHelperListener
    public String getPlatformLoginUin() {
        if (this.mPlatform == null) {
            return DeviceUtil.getDeviceUUID(this);
        }
        PlatformAndGameInfo.LoginInfo login_info = this.mPlatform.getLoginInfo();
        if (login_info == null) {
            return DeviceUtil.getDeviceUUID(this);
        }
        return login_info.account_uid_str;
    }

    @Override // org.cocos2dx.lib.Cocos2dxActivity, org.cocos2dx.lib.Cocos2dxHelper.Cocos2dxHelperListener
    public String getPlatformLoginSessionId() {
        if (this.mPlatform == null) {
            return DeviceUtil.generateUUID();
        }
        PlatformAndGameInfo.LoginInfo login_info = this.mPlatform.getLoginInfo();
        if (login_info == null) {
            return DeviceUtil.generateUUID();
        }
        return login_info.login_session;
    }

    @Override // org.cocos2dx.lib.Cocos2dxActivity, org.cocos2dx.lib.Cocos2dxHelper.Cocos2dxHelperListener
    public String getPlatformUserNickName() {
        if (this.mPlatform == null) {
            return DeviceUtil.getDeviceProductName(this);
        }
        PlatformAndGameInfo.LoginInfo login_info = this.mPlatform.getLoginInfo();
        if (login_info == null) {
            return DeviceUtil.getDeviceProductName(this);
        }
        return login_info.account_nick_name;
    }

    @Override // org.cocos2dx.lib.Cocos2dxActivity, org.cocos2dx.lib.Cocos2dxHelper.Cocos2dxHelperListener
    public String generateNewOrderSerial() {
        return this.mPlatform.generateNewOrderSerial();
    }

    @Override // org.cocos2dx.lib.Cocos2dxActivity, org.cocos2dx.lib.Cocos2dxHelper.Cocos2dxHelperListener
    public void openUrlOutside(String url) {
        if (!url.isEmpty()) {
            if (url.endsWith(".apk")) {
                this.updateApk = new DownloadApk(getActivity(), url);
            } else {
                super.openUrlOutside(url);
            }
        }
    }

    @Override // org.cocos2dx.lib.Cocos2dxActivity
    public void onTimeToShowCocos2dxContentView() {
        this.mGameContextStateHandler.sendEmptyMessageDelayed(0, 0L);
    }

    @Override // com.youai.IGameActivity
    public GameActivity getActivity() {
        return this;
    }

    @Override // com.youai.IGameActivity
    public IPlatformLoginAndPay getPlatformSDK() {
        return this.mPlatform;
    }

    @Override // com.youai.dreamonepiece.GameInterface.IGameLogoStateCallback
    public void initAppDataPath(String fullPath) {
        this.mAppDataExternalStorageFullPath = fullPath;
        this.mAppDataExternalStorageResourcesFullPath = this.mAppDataExternalStorageFullPath + "/Assets";
        this.mAppDataExternalStorageCacheFullPath = this.mAppDataExternalStorageFullPath + "/Cache";
        File tempDir = new File(this.mAppDataExternalStorageFullPath);
        if (!tempDir.exists()) {
            tempDir.mkdirs();
        }
        if (!tempDir.exists()) {
            Log.e(TAG, "mAppDataExternalStorageFullPath: " + tempDir.getAbsolutePath() + " is not OK!");
        } else {
            Log.d(TAG, "mAppDataExternalStorageFullPath: " + tempDir.getAbsolutePath());
        }
        File tempDir2 = new File(this.mAppDataExternalStorageCacheFullPath);
        if (!tempDir2.exists()) {
            tempDir2.mkdirs();
        }
        if (!tempDir2.exists()) {
            Log.e(TAG, "AppDataExternalStorageCacheFullPath: " + tempDir2.getAbsolutePath() + " is not OK!");
        } else {
            Log.d(TAG, "AppDataExternalStorageCacheFullPath: " + tempDir2.getAbsolutePath());
        }
        File tempDir3 = new File(this.mAppDataExternalStorageResourcesFullPath);
        if (!tempDir3.exists()) {
            tempDir3.mkdirs();
        }
        if (!tempDir3.exists()) {
            Log.e(TAG, "AppDataExternalStorageResourcesFullPath: " + tempDir3.getAbsolutePath() + " is not OK!");
        } else {
            Log.d(TAG, "AppDataExternalStorageResourcesFullPath: " + tempDir3.getAbsolutePath());
        }
    }

    @Override // com.youai.IGameActivity
    public String getAppFilesRootPath() {
        return this.mAppDataExternalStorageFullPath;
    }

    @Override // com.youai.IGameActivity
    public String getAppFilesResourcesPath() {
        return this.mAppDataExternalStorageResourcesFullPath;
    }

    @Override // com.youai.IGameActivity
    public String getAppFilesCachePath() {
        return this.mAppDataExternalStorageCacheFullPath;
    }

    @Override // com.youai.IGameActivity
    public void requestDestroy() {
        destroy();
    }

    @Override // com.youai.IGameActivity
    public PlatformAndGameInfo.GameInfo getGameInfo() {
        return this.mGameCfg.mGameInfo;
    }

    @Override // com.youai.dreamonepiece.GameInterface.IPlatformSDKStateCallback
    public void initPlatformSDK(IPlatformLoginAndPay platform) {
        this.mPlatform = platform;
    }

    @Override // com.youai.dreamonepiece.GameInterface.IPlatformSDKStateCallback
    public void notifyInitPlatformSDKComplete() {
        Log.d(TAG, "notifyInitPlatformSDKComplete");
    }

    @Override // com.youai.dreamonepiece.GameInterface.IGameUpdateStateCallback
    public void notifyVersionCheckResult(PlatformAndGameInfo.VersionInfo versionInfo) {
        Log.d(TAG, "notifyVersionCheckResult");
        if (this.mHaveEnteredGameAppState) {
            if (versionInfo.update_info == 0) {
                Cocos2dxHelper.nativeNotifyPlatformGameUpdateResult(versionInfo.update_info, versionInfo.max_version_code, versionInfo.local_version_code, versionInfo.download_url);
                return;
            }
            if (versionInfo.update_info == 1) {
                Cocos2dxHelper.nativeNotifyPlatformGameUpdateResult(versionInfo.update_info, versionInfo.max_version_code, versionInfo.local_version_code, versionInfo.download_url);
                return;
            } else {
                if (versionInfo.update_info == 2) {
                    Log.w(TAG, "notifyVersionCheckResult: enUpdateInfo_Force");
                    showWaitingView(true, -1, "需要强制版本更新，请下载新版本重新安装");
                    return;
                }
                return;
            }
        }
        this.mVersionResult = versionInfo;
    }

    @Override // com.youai.dreamonepiece.GameInterface.IGameContextStateCallback
    public void initCocos2dxAndroidContext(View glView, View editText, Handler handler) {
        this.mGameContextStateHandler = handler;
        super.initAndroidContext(glView, editText);
    }

    @Override // com.youai.IGameActivity
    public Handler getMainHandler() {
        return super.getMainThreadHandler();
    }

    @Override // org.cocos2dx.lib.Cocos2dxActivity, org.cocos2dx.lib.Cocos2dxHelper.Cocos2dxHelperListener
    public void callPlatformLogin() {
        super.callPlatformLogin();
        if (this.mPlatform.getGameInfo().platform_type == 14) {
            this.mIsRenderCocos2dxView = false;
        }
    }

    @Override // com.youai.dreamonepiece.GameInterface.IGameAppStateCallback
    public void notifyEnterGameAppState(Handler handler) {
        Log.d(TAG, "notifyEnterGameAppState");
        this.mHaveEnteredGameAppState = true;
        if (this.mVersionResult != null) {
            notifyVersionCheckResult(this.mVersionResult);
            this.mVersionResult = null;
        }
        super.setGameAppStateHandler(handler);
    }

    @Override // com.youai.dreamonepiece.GameInterface.IGameAppStateCallback
    public void notifyOnTempShortPause() {
        super.setOnTempShortPause(true);
    }

    @Override // com.youai.dreamonepiece.GameInterface.IGameAppStateCallback
    public void notifyLoginResut(PlatformAndGameInfo.LoginInfo result) {
        Log.d(TAG, "notifyLoginResut");
        super.setOnTempShortPause(false);
        Cocos2dxHelper.nativeNotifyPlatformLoginResult(0, String.valueOf(result.account_uid), result.login_session, result.account_nick_name);
    }

    @Override // com.youai.dreamonepiece.GameInterface.IGameAppStateCallback
    public void notifyPayRechargeResult(PlatformAndGameInfo.PayInfo result) {
        Log.d(TAG, "notifyPayRechargeResult");
        Cocos2dxHelper.nativeNotifyPlatformPayResult(result.result, result.order_serial, result.product_id, result.product_name, result.price, result.orignal_price, result.count, result.description);
    }

    @Override // com.youai.dreamonepiece.GameInterface.IGameAppStateCallback
    public void showWaitingViewImp(boolean show, int progress, String text) {
        super.showWaitingView(show, progress, text);
    }

    @Override // org.cocos2dx.lib.Cocos2dxHelper.Cocos2dxHelperListener
    public String getDeviceID() {
        return DeviceUtil.getDeviceUUID(this);
    }

    @Override // org.cocos2dx.lib.Cocos2dxHelper.Cocos2dxHelperListener
    public String getPlatformInfo() {
        if (this.mPlatform == null) {
            return "AndroidPlatform";
        }
        String temp = Build.MANUFACTURER + Build.MODEL;
        return temp.replaceAll(MinimalPrettyPrinter.DEFAULT_ROOT_VALUE_SEPARATOR, "-") + "_" + Build.VERSION.SDK_INT;
    }

    @Override // org.cocos2dx.lib.Cocos2dxHelper.Cocos2dxHelperListener
    public String getClientChannel() {
        return this.mPlatform != null ? this.mPlatform.getGameInfo().platform_type_str : "Android";
    }

    @Override // org.cocos2dx.lib.Cocos2dxHelper.Cocos2dxHelperListener
    public void notifyEnterGame() {
    }

    @Override // com.youai.IGameActivity
    public void showToastMsg(String str) {
        Message msg = new Message();
        msg.obj = str;
        msg.what = 17;
        super.getMainThreadHandler().sendMessage(msg);
    }

    @Override // org.cocos2dx.lib.Cocos2dxActivity
    public void showToastMsgImp(String msg) {
        Toast.makeText(this, msg, 0).show();
    }

    @Override // org.cocos2dx.lib.Cocos2dxHelper.Cocos2dxHelperListener
    public int getPlatformId() {
        if (this.mPlatform != null) {
            return this.mPlatform.getGameInfo().platform_type;
        }
        return 0;
    }

    public static void stopMovieClick() {
        buttonStopMovie.setVisibility(4);
        mGameApp.mGLSurfaceView.setVisibility(0);
        videoWorldView.stopPlayback();
        mGameApp.mGLSurfaceView.queueEvent(new Runnable() { // from class: com.youai.dreamonepiece.GameActivity.8
            @Override // java.lang.Runnable
            public void run() {
                GameActivity.nativeOnPlayMovieEnd();
            }
        });
        videoWorldView.setVisibility(4);
    }

    public static void stopMovie() {
        buttonStopMovie.setVisibility(4);
        mGameApp.mGLSurfaceView.setVisibility(0);
        videoWorldView.stopPlayback();
        mGameApp.mGLSurfaceView.queueEvent(new Runnable() { // from class: com.youai.dreamonepiece.GameActivity.9
            @Override // java.lang.Runnable
            public void run() {
                GameActivity.nativeOnPlayMovieEnd();
            }
        });
        videoWorldView.setVisibility(4);
    }

    public static void playMovie(final String fileName) {
        mGameApp.getMainHandler().post(new Runnable() { // from class: com.youai.dreamonepiece.GameActivity.10
            @Override // java.lang.Runnable
            public void run() {
                Log.i(GameActivity.TAG, fileName);
                if (GameActivity.videoWorldView == null) {
                    WorldVideoView unused = GameActivity.videoWorldView = (WorldVideoView) GameActivity.mGameApp.findViewById(R.id.worldvideoview);
                    String uri = "android.resource://" + GameActivity.mGameApp.getPackageName() + "/" + R.raw.movie;
                    GameActivity.videoWorldView.setVideoURI(Uri.parse(uri));
                }
                ImageButton unused2 = GameActivity.buttonStopMovie = (ImageButton) GameActivity.mGameApp.findViewById(R.id.buttonstopmovie);
                if (!fileName.equals("movie")) {
                    GameActivity.videoWorldView.setVideoURI(Uri.parse(GameActivity.mGameApp.mAppDataExternalStorageResourcesFullPath + "/movie/" + fileName + ".mp4"));
                }
                GameActivity.videoWorldView.setVisibility(0);
                GameActivity.videoWorldView.setOnCompletionListener(GameActivity.mGameApp);
                GameActivity.videoWorldView.setOnErrorListener(new MediaPlayer.OnErrorListener() { // from class: com.youai.dreamonepiece.GameActivity.10.1
                    @Override // android.media.MediaPlayer.OnErrorListener
                    public boolean onError(MediaPlayer mp, int what, int extra) {
                        GameActivity.stopMovieClick();
                        return true;
                    }
                });
                GameActivity.buttonStopMovie.setVisibility(0);
                GameActivity.buttonStopMovie.setOnClickListener(new View.OnClickListener() { // from class: com.youai.dreamonepiece.GameActivity.10.2
                    @Override // android.view.View.OnClickListener
                    public void onClick(View v) {
                        GameActivity.stopMovieClick();
                    }
                });
                GameActivity.videoWorldView.start();
                GameActivity.videoWorldView.setZOrderMediaOverlay(true);
            }
        });
        mGameApp.getMainHandler().postDelayed(new Runnable() { // from class: com.youai.dreamonepiece.GameActivity.11
            @Override // java.lang.Runnable
            public void run() {
                if (!GameActivity.videoWorldView.isPlaying()) {
                    GameActivity.stopMovieClick();
                }
            }
        }, 800L);
    }

    private static void shareToPerson(String shareContent) {
        if (!GameActivityHelper.isInstallWeChat(mContext, mHandler)) {
            GameActivityHelper.noWeChatDialog(mContext, mHandler);
            return;
        }
        if (api != null) {
            WXTextObject textObj = new WXTextObject();
            textObj.text = shareContent;
            WXMediaMessage msg = new WXMediaMessage();
            msg.mediaObject = textObj;
            msg.description = shareContent;
            SendMessageToWX.Req req = new SendMessageToWX.Req();
            req.transaction = String.valueOf(System.currentTimeMillis());
            req.message = msg;
            req.scene = 0;
            api.sendReq(req);
        }
    }

    private static void shareToPerson(String shareImgPath, String shareContent) {
        if (!GameActivityHelper.isInstallWeChat(mContext, mHandler)) {
            GameActivityHelper.noWeChatDialog(mContext, mHandler);
            return;
        }
        if (api != null) {
            WXImageObject imgObj = new WXImageObject();
            imgObj.setImagePath(shareImgPath);
            WXMediaMessage msg = new WXMediaMessage();
            msg.mediaObject = imgObj;
            msg.description = shareContent;
            msg.title = "test title";
            Bitmap bmp = BitmapFactory.decodeFile(shareImgPath);
            Bitmap thumbBmp = Bitmap.createScaledBitmap(bmp, 100, 100, true);
            if (bmp != thumbBmp) {
                bmp.recycle();
            }
            msg.thumbData = WXUtil.bmpToByteArray(thumbBmp, true);
            SendMessageToWX.Req req = new SendMessageToWX.Req();
            req.transaction = String.valueOf(System.currentTimeMillis());
            req.message = msg;
            req.scene = 0;
            api.sendReq(req);
        }
    }

    public static void shareToFriends(String shareImgPath, String shareContent) {
        if (!GameActivityHelper.isInstallWeChat(mContext, mHandler)) {
            GameActivityHelper.noWeChatDialog(mContext, mHandler);
            return;
        }
        if (api != null) {
            WXImageObject imgObj = new WXImageObject();
            imgObj.setImagePath(shareImgPath);
            WXWebpageObject webpage = new WXWebpageObject();
            webpage.webpageUrl = "http://baike.baidu.com/cms/rc/240x112ewmdtz.jpg";
            WXMediaMessage msg = new WXMediaMessage();
            msg.mediaObject = imgObj;
            msg.description = shareContent;
            msg.title = shareContent;
            Bitmap bmp = BitmapFactory.decodeFile(shareImgPath);
            Bitmap thumbBmp = Bitmap.createScaledBitmap(bmp, 100, 100, true);
            if (bmp != thumbBmp) {
                bmp.recycle();
            }
            msg.thumbData = WXUtil.bmpToByteArray(thumbBmp, true);
            SendMessageToWX.Req req = new SendMessageToWX.Req();
            req.transaction = String.valueOf(System.currentTimeMillis());
            req.message = msg;
            req.scene = 1;
            api.sendReq(req);
        }
    }

    public static void shareToFriends(String shareContent) {
        if (!GameActivityHelper.isInstallWeChat(mContext, mHandler)) {
            GameActivityHelper.noWeChatDialog(mContext, mHandler);
            return;
        }
        if (api != null) {
            WXTextObject textObj = new WXTextObject();
            textObj.text = shareContent;
            WXMediaMessage msg = new WXMediaMessage();
            msg.mediaObject = textObj;
            msg.description = shareContent;
            SendMessageToWX.Req req = new SendMessageToWX.Req();
            req.transaction = String.valueOf(System.currentTimeMillis());
            req.message = msg;
            req.scene = 1;
            api.sendReq(req);
        }
    }

    @Override // org.cocos2dx.lib.Cocos2dxHelper.Cocos2dxHelperListener
    public void pushSysNotification(String pTitle, final String msg, final int pInstantMinite) {
        final String strTitle = getString(R.string.app_name);
        if (!isWorked()) {
            startService(new Intent(this, (Class<?>) NotificationService.class));
            Runnable pushRunable = new Runnable() { // from class: com.youai.dreamonepiece.GameActivity.12
                @Override // java.lang.Runnable
                public void run() {
                    Intent myIntent = new Intent();
                    myIntent.setAction("com.youai.dreamonepiece.notificationservice");
                    myIntent.putExtra("message", msg);
                    myIntent.putExtra(Downloads.COLUMN_TITLE, strTitle);
                    myIntent.putExtra("delayminite", pInstantMinite);
                    GameActivity.this.sendBroadcast(myIntent);
                    Log.i("GameActivity", "pushSysNotification");
                }
            };
            getMainHandler().post(pushRunable);
            return;
        }
        Intent myIntent = new Intent();
        myIntent.setAction("com.youai.dreamonepiece.notificationservice");
        myIntent.putExtra("message", msg);
        myIntent.putExtra(Downloads.COLUMN_TITLE, strTitle);
        myIntent.putExtra("delayminite", pInstantMinite);
        sendBroadcast(myIntent);
        Log.i("GameActivity", "pushSysNotification");
    }

    public boolean isWorked() {
        ActivityManager myManager = (ActivityManager) getSystemService("activity");
        ArrayList<ActivityManager.RunningServiceInfo> runningService = (ArrayList) myManager.getRunningServices(Integer.MAX_VALUE);
        for (int i = 0; i < runningService.size(); i++) {
            if (runningService.get(i).service.getClassName().toString().equals("com.youai.dreamonepiece.notificationservice")) {
                return true;
            }
        }
        return false;
    }

    @Override // org.cocos2dx.lib.Cocos2dxHelper.Cocos2dxHelperListener
    public void ShowAnnounce(final String pAnnounceUrl) {
        Runnable dialogRun = new Runnable() { // from class: com.youai.dreamonepiece.GameActivity.13
            @Override // java.lang.Runnable
            public void run() {
                new GameAnnounceDialog(GameActivity.this.getActivity(), pAnnounceUrl);
            }
        };
        getMainHandler().post(dialogRun);
    }

    @Override // org.cocos2dx.lib.Cocos2dxHelper.Cocos2dxHelperListener
    public void clearSysNotification() {
        Log.i("GameActivity", "clearSysNotification");
        if (!isWorked()) {
            startService(new Intent(this, (Class<?>) NotificationService.class));
            Runnable pushRunable = new Runnable() { // from class: com.youai.dreamonepiece.GameActivity.14
                @Override // java.lang.Runnable
                public void run() {
                    Intent myIntent = new Intent();
                    myIntent.setAction("com.youai.dreamonepiece.notificationservice");
                    myIntent.putExtra("clear", true);
                    GameActivity.this.sendBroadcast(myIntent);
                    Log.i("GameActivity", "clearSysNotification");
                }
            };
            getMainHandler().post(pushRunable);
        } else {
            Intent myIntent = new Intent();
            myIntent.setAction("com.youai.dreamonepiece.notificationservice");
            myIntent.putExtra("clear", true);
            sendBroadcast(myIntent);
            Log.i("GameActivity", "clearSysNotification");
        }
    }

    @Override // com.youai.dreamonepiece.GameInterface.IGameAppStateCallback
    public void requestBindTryToOkUser(String tryUin, String okUin) {
        nativeRequestGameSvrBindTryToOkUser(tryUin, okUin);
    }

    public static boolean isPlatformTryUser() {
        return mGameApp.getPlatformSDK().isTryUser();
    }

    public static void callPlatformBindUser() {
        mGameApp.getPlatformSDK().callBindTryToOkUser();
    }

    public static boolean isCanPressBack() {
        return canPressBack;
    }

    public static void setCanPressBack(boolean canPressBack2) {
        canPressBack = canPressBack2;
    }

    @Override // android.media.MediaPlayer.OnCompletionListener
    public void onCompletion(MediaPlayer mp) {
        Log.i(TAG, "nativeOnPlayMovieEnd");
        buttonStopMovie.setVisibility(4);
        mGameApp.mGLSurfaceView.setVisibility(0);
        videoWorldView.stopPlayback();
        mGameApp.mGLSurfaceView.queueEvent(new Runnable() { // from class: com.youai.dreamonepiece.GameActivity.15
            @Override // java.lang.Runnable
            public void run() {
                GameActivity.nativeOnPlayMovieEnd();
            }
        });
        videoWorldView.setVisibility(4);
    }

    private class shakeLitener implements ShakeLisenter.OnShakeListener {
        private shakeLitener() {
        }

        @Override // com.youai.ShakeLisenter.OnShakeListener
        public void onShake() {
            Log.i(GameActivity.TAG, "onShake");
            GameActivity.nativeOnMotionShake();
        }
    }

    public static void receiveGameSvrBindTryToOkUserResult(int result) {
        mGameApp.getPlatformSDK().receiveGameSvrBindTryToOkUserResult(result);
    }

    @Override // com.youai.dreamonepiece.GameInterface.IGameAppStateCallback
    public void notifyTryUserRegistSuccess() {
        nativeNotifyTryUserRegistSuccess();
    }
}
