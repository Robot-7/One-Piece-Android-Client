package com.youai.dreamonepiece;

import android.app.Activity;
import android.graphics.Rect;
import android.os.Handler;
import android.os.Message;
import android.util.Log;
import android.view.MotionEvent;
import android.view.TouchDelegate;
import android.view.View;
import android.widget.ProgressBar;
import android.widget.TextView;
import com.tencent.stat.common.StatConstants;
import com.youai.IGameActivity;
import com.youai.IGameActivityState;
import com.youai.IPlatformLoginAndPay;
import com.youai.IStateManager;
import com.youai.IniFileUtil;
import com.youai.PlatformAndGameInfo;
import com.youai.dreamonepiece.GameInterface;
import com.youai.dreamonepiece.platform.pipaw.R;
import java.io.File;
import org.cocos2dx.lib.Cocos2dxHandler;

/* JADX INFO: loaded from: classes.dex */
public class GameAppState implements IGameActivityState {
    public static final int HANDLER_MSG_TO_MAINTHREAD_CallNd91_TOOLBAR = 30;
    public static final String HANDLER_MSG_TO_MAINTHREAD_CallNd91_TOOLBAR_KEY = "ToolBar";
    public static final String TAG = GameAppState.class.getSimpleName();
    private Activity mActivity;
    private GameInterface.IGameAppStateCallback mCallback;
    private IGameActivity mGameActivity;
    private TouchDelegate mOurTouchDelegate;
    private TouchDelegate mOwnTouchDelegate;
    private IPlatformLoginAndPay mPlatform;
    private ProgressBar mProgress;
    private IStateManager mStateMgr;
    private TextView mWaitingText;
    private View mWaitingView;

    @Override // com.youai.IGameActivityState
    public void enter() {
        this.mGameActivity.getActivity();
        GameActivity.setCanPressBack(true);
        Log.d(TAG, "enter GameAppState");
        this.mWaitingView = this.mActivity.findViewById(R.id.GameApp_WaitingFrameLayout);
        this.mWaitingView.setBackgroundColor(1074728719);
        this.mProgress = (ProgressBar) this.mActivity.findViewById(R.id.waiting_progressBar);
        this.mWaitingText = (TextView) this.mActivity.findViewById(R.id.waiting_text);
        this.mWaitingText.setTextColor(-131587);
        View logoImg = this.mActivity.findViewById(R.id.GameApp_LogoRelativeLayout);
        logoImg.setVisibility(4);
        this.mCallback.notifyEnterGameAppState(new GameAppStateHandler());
        this.mPlatform.setGameAppStateCallback(new GameAppStateCallback());
        showWaitingViewImp(true, -1, StatConstants.MTA_COOPERATION_TAG);
    }

    @Override // com.youai.IGameActivityState
    public void exit() {
        this.mStateMgr = null;
        this.mGameActivity = null;
        this.mCallback = null;
        this.mActivity = null;
        this.mPlatform.setGameAppStateCallback(null);
        this.mPlatform = null;
        this.mWaitingView = null;
        this.mProgress = null;
        this.mWaitingText = null;
        this.mOwnTouchDelegate = null;
        this.mOurTouchDelegate = null;
        Log.d(TAG, "exit GameAppState");
    }

    public GameAppState(IStateManager pStateMgr, IGameActivity pGameActivity, GameInterface.IGameAppStateCallback pCallback) {
        this.mStateMgr = pStateMgr;
        this.mGameActivity = pGameActivity;
        this.mCallback = pCallback;
        this.mActivity = this.mGameActivity.getActivity();
        this.mPlatform = this.mGameActivity.getPlatformSDK();
    }

    private class GameAppStateHandler extends Handler {
        private GameAppStateHandler() {
        }

        @Override // android.os.Handler
        public void handleMessage(Message msg) {
            if (msg.what == 7) {
                GameAppState.this.mCallback.notifyOnTempShortPause();
                GameAppState.this.mPlatform.callLogin();
                return;
            }
            if (msg.what == 8) {
                GameAppState.this.mPlatform.callLogout();
                return;
            }
            if (msg.what == 9) {
                GameAppState.this.mCallback.notifyOnTempShortPause();
                GameAppState.this.mPlatform.callAccountManage();
                return;
            }
            if (msg.what == 10) {
                GameAppState.this.mCallback.notifyOnTempShortPause();
                Cocos2dxHandler.PayRechargeMessage obj = (Cocos2dxHandler.PayRechargeMessage) msg.obj;
                PlatformAndGameInfo.PayInfo pay_info = new PlatformAndGameInfo.PayInfo();
                pay_info.order_serial = obj.serial;
                pay_info.product_id = obj.productId;
                pay_info.product_name = obj.productName;
                pay_info.price = obj.price;
                pay_info.orignal_price = obj.orignalPrice;
                pay_info.count = obj.count;
                pay_info.description = obj.description;
                if (pay_info.order_serial.isEmpty()) {
                    pay_info.order_serial = GameAppState.this.mPlatform.generateNewOrderSerial();
                }
                GameAppState.this.mPlatform.callPayRecharge(pay_info);
                return;
            }
            if (msg.what == 11) {
                GameAppState.this.mCallback.notifyOnTempShortPause();
                GameAppState.this.mPlatform.callPlatformFeedback();
                return;
            }
            if (msg.what == 12) {
                GameAppState.this.mCallback.notifyOnTempShortPause();
                Cocos2dxHandler.ShareMessage obj2 = (Cocos2dxHandler.ShareMessage) msg.obj;
                PlatformAndGameInfo.ShareInfo share_info = new PlatformAndGameInfo.ShareInfo();
                share_info.img_path = obj2.imgPath;
                share_info.content = obj2.content;
                GameAppState.this.mPlatform.callPlatformSupportThirdShare(share_info);
                return;
            }
            if (msg.what == 13) {
                GameAppState.this.mCallback.notifyOnTempShortPause();
                GameAppState.this.mPlatform.callPlatformGameBBS();
                return;
            }
            if (msg.what == 14) {
                Cocos2dxHandler.ShowWaitingViewMessage obj3 = (Cocos2dxHandler.ShowWaitingViewMessage) msg.obj;
                GameAppState.this.showWaitingViewImp(obj3.show, obj3.progress, obj3.text);
            } else {
                if (msg.what == 15) {
                    GameAppState.this.mPlatform.onGamePause();
                    return;
                }
                if (msg.what == 16) {
                    GameAppState.this.mPlatform.onGameResume();
                } else if (msg.what == 30) {
                    boolean visible = msg.getData().getBoolean(GameAppState.HANDLER_MSG_TO_MAINTHREAD_CallNd91_TOOLBAR_KEY);
                    GameAppState.this.mPlatform.callToolBar(visible);
                }
            }
        }
    }

    private class GameAppStateCallback implements GameInterface.IGameAppStateCallback {
        private GameAppStateCallback() {
        }

        @Override // com.youai.dreamonepiece.GameInterface.IGameAppStateCallback
        public void notifyEnterGameAppState(Handler handler) {
        }

        @Override // com.youai.dreamonepiece.GameInterface.IGameAppStateCallback
        public void notifyOnTempShortPause() {
            GameAppState.this.mCallback.notifyOnTempShortPause();
        }

        @Override // com.youai.dreamonepiece.GameInterface.IGameAppStateCallback
        public void notifyLoginResut(PlatformAndGameInfo.LoginInfo result) {
            showWaitingViewImp(false, -1, StatConstants.MTA_COOPERATION_TAG);
            if (result.login_result == 0) {
                File rootfiles = new File(GameAppState.this.mGameActivity.getAppFilesResourcesPath());
                if (rootfiles != null) {
                    File dynamicFile = new File(rootfiles.getAbsoluteFile() + File.separator + "dynamic.ini");
                    if (dynamicFile.exists() && dynamicFile.isFile()) {
                        String _youaiUrl = IniFileUtil.GetPrivateProfileString(dynamicFile.getAbsolutePath(), "YouaiUrl", "rootUrl", "1");
                        if (_youaiUrl.equals("0")) {
                            YouaiConfig.urlroot = YouaiConfig.urlrootDebug;
                        } else {
                            YouaiConfig.urlroot = YouaiConfig.urlrootRelease;
                        }
                        YouaiConfig.reCreate();
                    }
                }
                GameAppState.this.mCallback.notifyLoginResut(result);
            }
        }

        @Override // com.youai.dreamonepiece.GameInterface.IGameAppStateCallback
        public void notifyPayRechargeResult(PlatformAndGameInfo.PayInfo result) {
            GameAppState.this.mCallback.notifyPayRechargeResult(result);
        }

        @Override // com.youai.dreamonepiece.GameInterface.IGameAppStateCallback
        public void showWaitingViewImp(boolean show, int progress, String text) {
            GameAppState.this.mCallback.showWaitingViewImp(show, progress, text);
        }

        @Override // com.youai.dreamonepiece.GameInterface.IGameAppStateCallback
        public void requestBindTryToOkUser(String tryUin, String okUin) {
        }

        @Override // com.youai.dreamonepiece.GameInterface.IGameAppStateCallback
        public void notifyTryUserRegistSuccess() {
            GameAppState.this.mCallback.notifyTryUserRegistSuccess();
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void showWaitingViewImp(boolean show, int progress, String text) {
        if (this.mWaitingView != null) {
            if (this.mOwnTouchDelegate == null) {
                this.mOwnTouchDelegate = this.mWaitingView.getTouchDelegate();
            }
            if (this.mOurTouchDelegate == null) {
                Rect rt = new Rect();
                rt.left = 0;
                rt.top = 0;
                rt.bottom = this.mWaitingView.getHeight();
                rt.right = this.mWaitingView.getWidth();
                this.mOurTouchDelegate = new TouchDelegate(rt, this.mWaitingView) { // from class: com.youai.dreamonepiece.GameAppState.1
                    @Override // android.view.TouchDelegate
                    public boolean onTouchEvent(MotionEvent event) {
                        return true;
                    }
                };
            }
            if (show) {
                this.mWaitingView.setVisibility(0);
                this.mWaitingText.setText(text);
                this.mWaitingView.setTouchDelegate(this.mOurTouchDelegate);
            } else {
                this.mWaitingView.setVisibility(4);
                this.mWaitingText.setText(StatConstants.MTA_COOPERATION_TAG);
                this.mWaitingView.setTouchDelegate(this.mOwnTouchDelegate);
            }
        }
    }
}
