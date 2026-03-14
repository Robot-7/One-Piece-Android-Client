package com.youai.dreamonepiece;

import android.util.Log;
import com.tencent.stat.common.StatConstants;
import com.youai.IGameActivity;
import com.youai.IGameActivityState;
import com.youai.IPlatformLoginAndPay;
import com.youai.IStateManager;
import com.youai.PlatformAndGameInfo;
import com.youai.dreamonepiece.GameInterface;

/* JADX INFO: loaded from: classes.dex */
public class GameUpdateState implements IGameActivityState {
    public static final String TAG = GameUpdateState.class.getSimpleName();
    private GameInterface.IGameUpdateStateCallback mCallback;
    private IGameActivity mGameActivity;
    private IPlatformLoginAndPay mPlatform;
    private IStateManager mStateMgr;

    @Override // com.youai.IGameActivityState
    public void enter() {
        Log.d(TAG, "enter GameUpdateState");
        int supportType = this.mPlatform.isSupportInSDKGameUpdate();
        if (supportType == 0) {
            PlatformAndGameInfo.VersionInfo versionInfo = new PlatformAndGameInfo.VersionInfo();
            versionInfo.update_info = 0;
            versionInfo.download_url = StatConstants.MTA_COOPERATION_TAG;
            this.mCallback.notifyVersionCheckResult(versionInfo);
        } else {
            this.mPlatform.setGameUpdateStateCallback(new GameUpdateStateCallback());
            this.mPlatform.callCheckVersionUpate();
        }
        this.mStateMgr.changeState(5);
    }

    @Override // com.youai.IGameActivityState
    public void exit() {
        this.mStateMgr = null;
        this.mGameActivity = null;
        this.mPlatform = null;
        Log.d(TAG, "exit GameUpdateState");
    }

    public GameUpdateState(IStateManager pStateMgr, IGameActivity pGameActivity, GameInterface.IGameUpdateStateCallback pCallback) {
        this.mStateMgr = pStateMgr;
        this.mGameActivity = pGameActivity;
        this.mCallback = pCallback;
        this.mPlatform = this.mGameActivity.getPlatformSDK();
    }

    private class GameUpdateStateCallback implements GameInterface.IGameUpdateStateCallback {
        private GameUpdateStateCallback() {
        }

        @Override // com.youai.dreamonepiece.GameInterface.IGameUpdateStateCallback
        public void notifyVersionCheckResult(PlatformAndGameInfo.VersionInfo versionInfo) {
            GameUpdateState.this.mCallback.notifyVersionCheckResult(versionInfo);
            if (versionInfo.update_info != 0 && versionInfo.update_info != 1 && versionInfo.update_info == 2) {
                System.exit(0);
            }
        }
    }
}
