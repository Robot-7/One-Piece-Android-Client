package com.youai.dreamonepiece;

import com.youai.IGameActivityState;
import com.youai.IStateManager;
import com.youai.dreamonepiece.GameInterface;

/* JADX INFO: loaded from: classes.dex */
public class GameStateManager implements IStateManager {
    private int mCurrentStateID = 0;
    private GameInterface.IDreamOnePiece mGameActivity;
    private IGameActivityState[] mStates;

    @Override // com.youai.IStateManager
    public void changeState(int stateID) {
        if (stateID >= 0 && stateID < 7) {
            if (this.mStates[stateID] == null) {
                this.mStates[stateID] = createStateByID(stateID);
            }
            if (this.mStates[this.mCurrentStateID] != null) {
                this.mStates[this.mCurrentStateID].exit();
            }
            this.mCurrentStateID = stateID;
            if (this.mStates[stateID] != null) {
                this.mStates[stateID].enter();
            }
        }
    }

    public GameStateManager(int count, GameInterface.IDreamOnePiece pGameActivity) {
        this.mStates = null;
        this.mGameActivity = null;
        this.mStates = new IGameActivityState[count];
        this.mGameActivity = pGameActivity;
    }

    private IGameActivityState createStateByID(int stateID) {
        switch (stateID) {
            case 1:
                IGameActivityState pState = new GameLogoState(this, this.mGameActivity, this.mGameActivity);
                return pState;
            case 2:
                IGameActivityState pState2 = new YouaiUpdateState(this, this.mGameActivity, this.mGameActivity);
                return pState2;
            case 3:
                IGameActivityState pState3 = new PlatformSDKState(this, this.mGameActivity, this.mGameActivity);
                return pState3;
            case 4:
                IGameActivityState pState4 = new GameUpdateState(this, this.mGameActivity, this.mGameActivity);
                return pState4;
            case 5:
                IGameActivityState pState5 = new GameContextState(this, this.mGameActivity, this.mGameActivity);
                return pState5;
            case 6:
                IGameActivityState pState6 = new GameAppState(this, this.mGameActivity, this.mGameActivity);
                return pState6;
            default:
                return null;
        }
    }
}
