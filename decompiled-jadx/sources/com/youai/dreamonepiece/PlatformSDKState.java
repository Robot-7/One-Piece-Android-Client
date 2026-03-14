package com.youai.dreamonepiece;

import android.os.Handler;
import android.os.Message;
import android.util.Log;
import com.youai.IGameActivity;
import com.youai.IGameActivityState;
import com.youai.IPlatformLoginAndPay;
import com.youai.IStateManager;
import com.youai.PlatformAndGameInfo;
import com.youai.dreamonepiece.GameInterface;
import com.youai.dreamonepiece.platform.PlatformSDKLoginAndPay;

/* JADX INFO: loaded from: classes.dex */
public class PlatformSDKState implements IGameActivityState {
    private static final int PlatformSDKState_MainThreadMsg_DoInitAfterSetView = 0;
    public static final String TAG = PlatformSDKState.class.getSimpleName();
    private GameInterface.IPlatformSDKStateCallback mCallback;
    private IGameActivity mGameActivity;
    private PlatformAndGameInfo.GameInfo mGameInfo;
    private PlatformSDKStateHandler mHandler;
    private IPlatformLoginAndPay mPlatform;
    private IStateManager mStateMgr;

    @Override // com.youai.IGameActivityState
    public void enter() {
        Log.d(TAG, "enter PlatformSDKState");
        this.mGameInfo = this.mGameActivity.getGameInfo();
        this.mPlatform = createPlatformSDKByType(this.mGameInfo.platform_type);
        this.mCallback.initPlatformSDK(this.mPlatform);
        this.mPlatform.setPlatformSDKStateCallback(new PlatformSDKStateCallback());
        this.mHandler = new PlatformSDKStateHandler();
        int layoutId = this.mPlatform.getPlatformLogoLayoutId();
        if (layoutId == -1) {
            this.mPlatform.init(this.mGameActivity, this.mGameInfo);
        } else if (layoutId == 0) {
            this.mPlatform.init(this.mGameActivity, this.mGameInfo);
        } else {
            this.mGameActivity.getActivity().setContentView(layoutId);
            this.mHandler.sendEmptyMessageDelayed(0, 1500L);
        }
    }

    @Override // com.youai.IGameActivityState
    public void exit() {
        this.mStateMgr = null;
        this.mGameActivity = null;
        this.mCallback = null;
        this.mPlatform.setPlatformSDKStateCallback(null);
        this.mPlatform = null;
        this.mGameInfo = null;
        this.mHandler.removeMessages(0);
        this.mHandler = null;
        Log.d(TAG, "exit PlatformSDKState");
    }

    public PlatformSDKState(IStateManager pStateMgr, IGameActivity pGameActivity, GameInterface.IPlatformSDKStateCallback pCallback) {
        this.mStateMgr = pStateMgr;
        this.mGameActivity = pGameActivity;
        this.mCallback = pCallback;
    }

    private IPlatformLoginAndPay createPlatformSDKByType(int type) {
        IPlatformLoginAndPay platform = PlatformSDKLoginAndPay.getInstance();
        return platform;
    }

    private class PlatformSDKStateHandler extends Handler {
        private PlatformSDKStateHandler() {
        }

        @Override // android.os.Handler
        public void handleMessage(Message msg) {
            if (msg.what == 0) {
                PlatformSDKState.this.mPlatform.init(PlatformSDKState.this.mGameActivity, PlatformSDKState.this.mGameInfo);
            }
        }
    }

    private class PlatformSDKStateCallback implements GameInterface.IPlatformSDKStateCallback {
        private PlatformSDKStateCallback() {
        }

        @Override // com.youai.dreamonepiece.GameInterface.IPlatformSDKStateCallback
        public void initPlatformSDK(IPlatformLoginAndPay platform) {
        }

        @Override // com.youai.dreamonepiece.GameInterface.IPlatformSDKStateCallback
        public void notifyInitPlatformSDKComplete() {
            PlatformSDKState.this.mCallback.notifyInitPlatformSDKComplete();
            PlatformSDKState.this.mStateMgr.changeState(4);
        }
    }
}
