package com.youai.dreamonepiece;

import android.util.Log;
import com.youai.IGameActivity;
import com.youai.IGameActivityState;
import com.youai.IStateManager;
import com.youai.dreamonepiece.GameInterface;

/* JADX INFO: loaded from: classes.dex */
public class YouaiUpdateState implements IGameActivityState {
    public static final String TAG = YouaiUpdateState.class.getSimpleName();
    private GameInterface.IYouaiUpdateStateCallback mCallback;
    private IGameActivity mGameActivity;
    private IStateManager mStateMgr;

    @Override // com.youai.IGameActivityState
    public void enter() {
        Log.d(TAG, "enter YouaiUpdateState");
        this.mStateMgr.changeState(3);
    }

    @Override // com.youai.IGameActivityState
    public void exit() {
        this.mStateMgr = null;
        this.mGameActivity = null;
        this.mCallback = null;
        Log.d(TAG, "exit YouaiUpdateState");
    }

    public YouaiUpdateState(IStateManager pStateMgr, IGameActivity pGameActivity, GameInterface.IYouaiUpdateStateCallback pCallback) {
        this.mStateMgr = pStateMgr;
        this.mGameActivity = pGameActivity;
        this.mCallback = pCallback;
    }
}
