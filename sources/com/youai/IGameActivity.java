package com.youai;

import android.os.Handler;
import com.youai.PlatformAndGameInfo;
import com.youai.dreamonepiece.GameActivity;

/* JADX INFO: loaded from: classes.dex */
public interface IGameActivity {
    GameActivity getActivity();

    String getAppFilesCachePath();

    String getAppFilesResourcesPath();

    String getAppFilesRootPath();

    PlatformAndGameInfo.GameInfo getGameInfo();

    Handler getMainHandler();

    IPlatformLoginAndPay getPlatformSDK();

    void requestDestroy();

    void showToastMsg(String str);
}
