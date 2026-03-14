package com.youai.dreamonepiece;

import android.os.Handler;
import android.os.Message;
import android.util.Log;
import android.widget.TextView;
import com.youai.IGameActivity;
import com.youai.IGameActivityState;
import com.youai.IStateManager;
import com.youai.dreamonepiece.GameInterface;
import com.youai.dreamonepiece.platform.pipaw.R;
import org.cocos2dx.lib.Cocos2dxEditText;
import org.cocos2dx.lib.Cocos2dxGLSurfaceView;

/* JADX INFO: loaded from: classes.dex */
public class GameContextState implements IGameActivityState {
    public static final String TAG = GameContextState.class.getSimpleName();
    private GameInterface.IGameContextStateCallback mCallback;
    private IGameActivity mGameActivity;
    private IStateManager mStateMgr;
    private TextView mText;
    private GameContextStateHandler mHandler = new GameContextStateHandler();
    private Runnable mUpdate = new Runnable() { // from class: com.youai.dreamonepiece.GameContextState.1
        private int ict = 0;

        @Override // java.lang.Runnable
        public void run() {
            if (this.ict == 0) {
                GameContextState.this.mText.setText("正在启动游戏.");
                this.ict = 1;
            } else if (this.ict == 1) {
                GameContextState.this.mText.setText("正在启动游戏..");
                this.ict = 2;
            } else if (this.ict == 2) {
                GameContextState.this.mText.setText("正在启动游戏...");
                this.ict = 0;
            }
            GameContextState.this.mGameActivity.getMainHandler().postDelayed(this, 300L);
        }
    };

    @Override // com.youai.IGameActivityState
    public void enter() {
        Log.d(TAG, "enter GameContextState");
        this.mGameActivity.getActivity().setContentView(R.layout.activity_game);
        this.mText = (TextView) this.mGameActivity.getActivity().findViewById(R.id.loading_game_textView);
        if (this.mText != null) {
            this.mGameActivity.getMainHandler().postDelayed(this.mUpdate, 300L);
        }
        Cocos2dxGLSurfaceView glView = (Cocos2dxGLSurfaceView) this.mGameActivity.getActivity().findViewById(R.id.GameApp_Cocos2dxGLSurfaceView);
        Cocos2dxEditText editText = (Cocos2dxEditText) this.mGameActivity.getActivity().findViewById(R.id.GameApp_Cocos2dxEditText);
        this.mCallback.initCocos2dxAndroidContext(glView, editText, this.mHandler);
    }

    @Override // com.youai.IGameActivityState
    public void exit() {
        this.mGameActivity.getMainHandler().removeCallbacks(this.mUpdate);
        this.mUpdate = null;
        if (this.mText != null) {
            this.mText.setVisibility(4);
            this.mText = null;
        }
        this.mStateMgr = null;
        this.mGameActivity = null;
        this.mCallback = null;
        this.mHandler = null;
        Log.d(TAG, "exit GameContextState");
    }

    public GameContextState(IStateManager pStateMgr, IGameActivity pGameActivity, GameInterface.IGameContextStateCallback pCallback) {
        this.mStateMgr = pStateMgr;
        this.mGameActivity = pGameActivity;
        this.mCallback = pCallback;
    }

    private class GameContextStateHandler extends Handler {
        private GameContextStateHandler() {
        }

        @Override // android.os.Handler
        public void handleMessage(Message msg) {
            if (msg.what == 0) {
                GameContextState.this.mStateMgr.changeState(6);
            }
        }
    }
}
