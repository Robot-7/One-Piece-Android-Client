package org.cocos2dx.lib;

import android.app.Activity;
import android.content.Context;
import android.content.Intent;
import android.net.Uri;
import android.os.Bundle;
import android.os.Handler;
import android.os.Message;
import android.util.Log;
import android.view.KeyEvent;
import android.view.View;
import com.tencent.stat.common.StatConstants;
import org.cocos2dx.lib.Cocos2dxHandler;
import org.cocos2dx.lib.Cocos2dxHelper;

/* JADX INFO: loaded from: classes.dex */
public abstract class Cocos2dxActivity extends Activity implements Cocos2dxHelper.Cocos2dxHelperListener {
    private static final String TAG = Cocos2dxActivity.class.getSimpleName();
    private static Context sContext = null;
    public Cocos2dxGLSurfaceView mGLSurfaceView;
    public Handler mGameAppStateHandler;
    private Cocos2dxHandler mHandler;
    protected boolean mIsCocos2dxSurfaceViewCreated = false;
    protected boolean mIsRenderCocos2dxView = false;
    public String mAppDataExternalStorageFullPath = null;
    public String mAppDataExternalStorageResourcesFullPath = null;
    public String mAppDataExternalStorageCacheFullPath = null;
    protected boolean mIsOnPause = false;
    protected boolean mIsTempShortPause = false;
    private long mLastLowMemoryNanoTime = System.nanoTime();

    public static Context getContext() {
        return sContext;
    }

    public View getCocos2dxGLSurfaceView() {
        return this.mGLSurfaceView;
    }

    public Handler getMainThreadHandler() {
        return this.mHandler;
    }

    @Override // android.app.Activity
    protected void onCreate(Bundle savedInstanceState) {
        Log.d(TAG, "2\t\tcall Cocos2dxActivity.onCreate");
        super.onCreate(savedInstanceState);
        getWindow().setFlags(128, 128);
        sContext = this;
        this.mHandler = new Cocos2dxHandler(this);
    }

    @Override // android.app.Activity
    protected void onDestroy() {
        super.onDestroy();
        Log.d(TAG, "call Cocos2dxActivity.onDestroy");
        if (this.mIsCocos2dxSurfaceViewCreated) {
            Cocos2dxHelper.onPause();
            this.mGLSurfaceView.onPause();
            Cocos2dxHelper.nativeGameDestroy();
        }
        this.mIsCocos2dxSurfaceViewCreated = false;
        sContext = null;
    }

    @Override // android.app.Activity
    protected void onRestart() {
        Log.d(TAG, "call Cocos2dxActivity.onRestart");
        super.onRestart();
    }

    @Override // android.app.Activity
    protected void onResume() {
        Log.d(TAG, "call Cocos2dxActivity.onResume");
        super.onResume();
        if (this.mIsCocos2dxSurfaceViewCreated && this.mIsRenderCocos2dxView && this.mIsOnPause) {
            this.mIsOnPause = false;
            this.mIsTempShortPause = false;
            Cocos2dxHelper.onResume();
            this.mGLSurfaceView.onResume();
            if (this.mGameAppStateHandler != null) {
                this.mGameAppStateHandler.sendEmptyMessage(16);
            }
        }
        this.mIsRenderCocos2dxView = true;
    }

    @Override // android.app.Activity
    protected void onPause() {
        Log.d(TAG, "call Cocos2dxActivity.onPause");
        super.onPause();
        if (this.mIsCocos2dxSurfaceViewCreated && this.mIsRenderCocos2dxView && !this.mIsOnPause) {
            this.mIsOnPause = true;
            if (this.mGameAppStateHandler != null) {
                this.mGameAppStateHandler.sendEmptyMessage(15);
            }
            Cocos2dxHelper.onPause();
            this.mGLSurfaceView.onPause();
        }
    }

    @Override // android.app.Activity
    protected void onStart() {
        Log.d(TAG, "call Cocos2dxActivity.onStart");
        super.onStart();
        if (this.mIsCocos2dxSurfaceViewCreated && this.mIsRenderCocos2dxView && this.mIsOnPause) {
            this.mIsOnPause = false;
            this.mIsTempShortPause = false;
            Cocos2dxHelper.onResume();
            this.mGLSurfaceView.onResume();
            if (this.mGameAppStateHandler != null) {
                this.mGameAppStateHandler.sendEmptyMessage(16);
            }
        }
        this.mIsRenderCocos2dxView = true;
    }

    @Override // android.app.Activity
    protected void onStop() {
        Log.d(TAG, "call Cocos2dxActivity.onStop");
        super.onPause();
        if (this.mIsCocos2dxSurfaceViewCreated && this.mIsRenderCocos2dxView && !this.mIsOnPause) {
            this.mIsOnPause = true;
            if (this.mGameAppStateHandler != null) {
                this.mGameAppStateHandler.sendEmptyMessage(15);
            }
            Cocos2dxHelper.onPause();
            this.mGLSurfaceView.onPause();
        }
    }

    @Override // android.app.Activity, android.view.KeyEvent.Callback
    public boolean onKeyDown(int keyCode, KeyEvent event) {
        if (keyCode == 4) {
            showQuestionDialog(getResources().getString(R.string.app_exit_title), getResources().getString(R.string.app_exit_msg), 1, StatConstants.MTA_COOPERATION_TAG, StatConstants.MTA_COOPERATION_TAG);
            return true;
        }
        if (keyCode == 82) {
            super.onKeyDown(keyCode, event);
            return true;
        }
        return super.onKeyDown(keyCode, event);
    }

    @Override // org.cocos2dx.lib.Cocos2dxHelper.Cocos2dxHelperListener
    public void showDialog(String pTitle, String pMessage, int msgId, String positiveCallback) {
        Message msg = new Message();
        msg.what = 1;
        msg.obj = new Cocos2dxHandler.DialogMessage(pTitle, pMessage, msgId, positiveCallback, StatConstants.MTA_COOPERATION_TAG);
        this.mHandler.sendMessage(msg);
    }

    @Override // org.cocos2dx.lib.Cocos2dxHelper.Cocos2dxHelperListener
    public void showQuestionDialog(String pTitle, String pMessage, int msgId, String positiveCallback, String negativeCallback) {
        Message msg = new Message();
        msg.what = 3;
        msg.obj = new Cocos2dxHandler.DialogMessage(pTitle, pMessage, msgId, positiveCallback, negativeCallback);
        this.mHandler.sendMessage(msg);
    }

    @Override // org.cocos2dx.lib.Cocos2dxHelper.Cocos2dxHelperListener
    public void showEditTextDialog(String pTitle, String pContent, int pInputMode, int pInputFlag, int pReturnType, int pMaxLength) {
        Message msg = new Message();
        msg.what = 2;
        msg.obj = new Cocos2dxHandler.EditBoxMessage(pTitle, pContent, pInputMode, pInputFlag, pReturnType, pMaxLength);
        this.mHandler.sendMessage(msg);
    }

    @Override // org.cocos2dx.lib.Cocos2dxHelper.Cocos2dxHelperListener
    public void runOnGLThread(Runnable pRunnable) {
        this.mGLSurfaceView.queueEvent(pRunnable);
    }

    public void callPlatformLogin() {
        this.mGameAppStateHandler.sendEmptyMessage(7);
    }

    @Override // org.cocos2dx.lib.Cocos2dxHelper.Cocos2dxHelperListener
    public void callPlatformLogout() {
        this.mGameAppStateHandler.sendEmptyMessage(8);
    }

    @Override // org.cocos2dx.lib.Cocos2dxHelper.Cocos2dxHelperListener
    public void callPlatformAccountManage() {
        this.mGameAppStateHandler.sendEmptyMessage(9);
    }

    @Override // org.cocos2dx.lib.Cocos2dxHelper.Cocos2dxHelperListener
    public void callPlatformPayRecharge(String serial, String productId, String productName, float price, float orignalPrice, int count, String description) {
        Message msg = new Message();
        msg.what = 10;
        msg.obj = new Cocos2dxHandler.PayRechargeMessage(serial, productId, productName, price, orignalPrice, count, description);
        this.mGameAppStateHandler.sendMessage(msg);
    }

    public boolean getPlatformLoginStatus() {
        return true;
    }

    public String getPlatformLoginUin() {
        return StatConstants.MTA_COOPERATION_TAG;
    }

    public String getPlatformLoginSessionId() {
        return StatConstants.MTA_COOPERATION_TAG;
    }

    public String getPlatformUserNickName() {
        return StatConstants.MTA_COOPERATION_TAG;
    }

    public void callPlatformInit() {
    }

    public String generateNewOrderSerial() {
        return null;
    }

    @Override // org.cocos2dx.lib.Cocos2dxHelper.Cocos2dxHelperListener
    public void callPlatformFeedback() {
        this.mGameAppStateHandler.sendEmptyMessage(11);
    }

    @Override // org.cocos2dx.lib.Cocos2dxHelper.Cocos2dxHelperListener
    public void callPlatformSupportThirdShare(String content, String imgPath) {
        Message msg = new Message();
        msg.what = 12;
        msg.obj = new Cocos2dxHandler.ShareMessage(content, imgPath);
        this.mGameAppStateHandler.sendMessage(msg);
    }

    @Override // org.cocos2dx.lib.Cocos2dxHelper.Cocos2dxHelperListener
    public void callPlatformGameBBS(String url) {
        this.mGameAppStateHandler.sendEmptyMessage(13);
    }

    @Override // org.cocos2dx.lib.Cocos2dxHelper.Cocos2dxHelperListener
    public boolean getIsOnTempShortPause() {
        return this.mIsTempShortPause;
    }

    public void openUrlOutside(String url) {
        if (!url.isEmpty()) {
            this.mIsTempShortPause = true;
            Uri uri = Uri.parse(url);
            Intent it = new Intent("android.intent.action.VIEW", uri);
            startActivity(it);
        }
    }

    @Override // org.cocos2dx.lib.Cocos2dxHelper.Cocos2dxHelperListener
    public void showWaitingView(boolean show, int progress, String text) {
        if (this.mGameAppStateHandler != null) {
            Message msg = new Message();
            msg.what = 14;
            msg.obj = new Cocos2dxHandler.ShowWaitingViewMessage(show, progress, text);
            this.mGameAppStateHandler.sendMessage(msg);
        }
    }

    public void initAndroidContext(View glView, View editText) {
        Cocos2dxHelper.init(this, this, this.mAppDataExternalStorageFullPath);
        this.mGLSurfaceView = (Cocos2dxGLSurfaceView) glView;
        this.mGLSurfaceView.setCocos2dxEditText((Cocos2dxEditText) editText);
    }

    protected void setOnTempShortPause(boolean pause) {
        this.mIsTempShortPause = pause;
        this.mIsRenderCocos2dxView = !pause;
        Log.d(TAG, "mIsTempShortPause: " + String.valueOf(pause));
    }

    protected void setGameAppStateHandler(Handler handler) {
        this.mGameAppStateHandler = handler;
        this.mIsCocos2dxSurfaceViewCreated = true;
        this.mIsRenderCocos2dxView = true;
    }

    public void onTimeToShowCocos2dxContentView() {
    }

    protected void destroy() {
        if (this.mGameAppStateHandler != null) {
            this.mGameAppStateHandler.removeMessages(15);
        }
        this.mGameAppStateHandler = null;
        super.finish();
    }

    public void showToastMsgImp(String msg) {
    }

    @Override // android.app.Activity, android.content.ComponentCallbacks
    public void onLowMemory() {
        if (this.mIsCocos2dxSurfaceViewCreated) {
            long timestamp = System.nanoTime();
            if (timestamp - this.mLastLowMemoryNanoTime > -777252864) {
                this.mHandler.sendEmptyMessageDelayed(18, 1000L);
                this.mLastLowMemoryNanoTime = timestamp;
            }
        }
        super.onLowMemory();
    }

    public void onLowMemoryImp() {
        runOnGLThread(new Runnable() { // from class: org.cocos2dx.lib.Cocos2dxActivity.1
            @Override // java.lang.Runnable
            public void run() {
                Cocos2dxHelper.nativePurgeCachedData();
            }
        });
    }
}
