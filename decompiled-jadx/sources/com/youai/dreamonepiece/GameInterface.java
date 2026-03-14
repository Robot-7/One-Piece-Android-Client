package com.youai.dreamonepiece;

import android.os.Handler;
import android.view.View;
import com.youai.IGameActivity;
import com.youai.IPlatformLoginAndPay;
import com.youai.PlatformAndGameInfo;

/* JADX INFO: loaded from: classes.dex */
public interface GameInterface {
    public static final int GameAppStateID = 6;
    public static final int GameContextStateID = 5;
    public static final int GameLogoStateID = 1;
    public static final int GameStateIDMax = 7;
    public static final int GameStateIDMin = 0;
    public static final int GameUpdateStateID = 4;
    public static final int PlatformSDKStateID = 3;
    public static final int YouaiUpdateStateID = 2;

    public interface IDreamOnePiece extends IGameActivity, IGameAppStateCallback, IGameContextStateCallback, IGameLogoStateCallback, IGameUpdateStateCallback, IPlatformSDKStateCallback, IYouaiUpdateStateCallback {
    }

    public interface IGameAppStateCallback {
        void notifyEnterGameAppState(Handler handler);

        void notifyLoginResut(PlatformAndGameInfo.LoginInfo loginInfo);

        void notifyOnTempShortPause();

        void notifyPayRechargeResult(PlatformAndGameInfo.PayInfo payInfo);

        void notifyTryUserRegistSuccess();

        void requestBindTryToOkUser(String str, String str2);

        void showWaitingViewImp(boolean z, int i, String str);
    }

    public interface IGameContextStateCallback {
        void initCocos2dxAndroidContext(View view, View view2, Handler handler);
    }

    public interface IGameLogoStateCallback {
        void initAppDataPath(String str);
    }

    public interface IGameUpdateStateCallback {
        void notifyVersionCheckResult(PlatformAndGameInfo.VersionInfo versionInfo);
    }

    public interface IPlatformSDKStateCallback {
        void initPlatformSDK(IPlatformLoginAndPay iPlatformLoginAndPay);

        void notifyInitPlatformSDKComplete();
    }

    public interface IYouaiUpdateStateCallback {
    }
}
