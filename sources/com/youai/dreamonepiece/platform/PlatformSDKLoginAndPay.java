package com.youai.dreamonepiece.platform;

import android.app.Activity;
import android.content.res.AssetManager;
import android.widget.Toast;
import com.tencent.stat.common.StatConstants;
import com.youai.GameMaincpp;
import com.youai.IGameActivity;
import com.youai.IPlatformLoginAndPay;
import com.youai.PlatformAndGameInfo;
import com.youai.dreamonepiece.FeedBackDialog;
import com.youai.dreamonepiece.GameActivity;
import com.youai.dreamonepiece.GameInterface;
import com.youai.dreamonepiece.LastLoginHelp;
import com.youai.dreamonepiece.YouaiConfig;
import com.youai.dreamonepiece.platform.pipaw.R;
import com.youai.sdks.PlatformSdk;
import com.youai.sdks.beans.LoginInfo;
import com.youai.sdks.beans.PayInfo;
import com.youai.sdks.beans.PlatformContacts;
import com.youai.sdks.beans.ShareInfo;
import com.youai.sdks.beans.YALastLoginHelp;
import com.youai.sdks.callback.YASdkInterface;
import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.UnsupportedEncodingException;
import java.util.Iterator;
import java.util.UUID;
import org.cocos2dx.lib.Cocos2dxHelper;
import org.json.JSONException;
import org.json.JSONObject;

/* JADX INFO: loaded from: classes.dex */
public class PlatformSDKLoginAndPay implements IPlatformLoginAndPay {
    private static PlatformSDKLoginAndPay mInstance = null;
    private GameInterface.IPlatformSDKStateCallback mCallback1;
    private GameInterface.IGameUpdateStateCallback mCallback2;
    private GameInterface.IGameAppStateCallback mCallback3;
    private IGameActivity mGameActivity;
    private Activity game_ctx = null;
    private PlatformAndGameInfo.GameInfo game_info = null;
    private PlatformAndGameInfo.LoginInfo login_info = new PlatformAndGameInfo.LoginInfo();
    private PlatformAndGameInfo.VersionInfo version_info = null;
    private PlatformAndGameInfo.PayInfo pay_info = null;
    private boolean isLogin = false;
    YASdkInterface yaSdkInterface = new YASdkInterface() { // from class: com.youai.dreamonepiece.platform.PlatformSDKLoginAndPay.1
        @Override // com.youai.sdks.callback.YAOnSwitchAccountListener
        public void onSwitchAccount(PlatformContacts.SwitchAccount code) {
            if (code != PlatformContacts.SwitchAccount.USER_SWITCH_ACCOUNT) {
                if (code == PlatformContacts.SwitchAccount.USER_SWITCH_ACCOUNT_RESTART) {
                    GameActivity.requestRestart();
                    return;
                }
                if (code != PlatformContacts.SwitchAccount.USER_SWITCH_ACCOUNT_CANCEL && code == PlatformContacts.SwitchAccount.USER_SWITCH_ACCOUNT_SUCCESS) {
                    LoginInfo logininfo = PlatformSdk.getInstance().getLoginInfo();
                    PlatformSDKLoginAndPay.this.login_info = new PlatformAndGameInfo.LoginInfo();
                    PlatformSDKLoginAndPay.this.login_info.account_uid_str = logininfo.uId;
                    PlatformSDKLoginAndPay.this.login_info.account_nick_name = logininfo.uName;
                    PlatformSDKLoginAndPay.this.login_info.login_session = logininfo.sessionId;
                    PlatformSDKLoginAndPay.this.login_info.login_result = 0;
                    PlatformSDKLoginAndPay.this.isLogin = true;
                    PlatformSDKLoginAndPay.this.notifyLoginResult(PlatformSDKLoginAndPay.this.login_info);
                }
            }
        }

        @Override // com.youai.sdks.callback.YAOnPauseListener
        public void onPauseComplete() {
        }

        @Override // com.youai.sdks.callback.YAOnPlatformBackListener
        public void onPlatformBackground() {
        }

        @Override // com.youai.sdks.callback.YAOnPayProcessListener
        public void finishPayProcess(PlatformContacts.PayState code, String dis) {
            if (dis != null) {
                if (code == PlatformContacts.PayState.Pay_Success) {
                    PlatformSDKLoginAndPay.getInstance().pay_info = new PlatformAndGameInfo.PayInfo();
                    PlatformSDKLoginAndPay.getInstance().pay_info.result = 0;
                    PlatformSDKLoginAndPay.getInstance().notifyPayRechargeRequestResult(PlatformSDKLoginAndPay.getInstance().pay_info);
                } else if (code == PlatformContacts.PayState.Pay_Failure || code == PlatformContacts.PayState.Pay_Asyn_Sms_Sent || code == PlatformContacts.PayState.Pay_Cancel || code == PlatformContacts.PayState.Pay_Request_Submitted) {
                }
                if (dis != null && !dis.equals(StatConstants.MTA_COOPERATION_TAG)) {
                    Toast.makeText(PlatformSDKLoginAndPay.this.game_ctx, dis, 0).show();
                }
            }
        }

        @Override // com.youai.sdks.callback.YAOnLoginProcessListener
        public void finishLoginProcess(PlatformContacts.LoginState code, String dis) {
            if (code == PlatformContacts.LoginState.Login_Success) {
                LoginInfo logininfo = PlatformSdk.getInstance().getLoginInfo();
                PlatformSDKLoginAndPay.this.login_info = new PlatformAndGameInfo.LoginInfo();
                PlatformSDKLoginAndPay.this.login_info.account_uid_str = logininfo.uId;
                PlatformSDKLoginAndPay.this.login_info.account_nick_name = logininfo.uName;
                PlatformSDKLoginAndPay.this.login_info.login_session = logininfo.sessionId;
                PlatformSDKLoginAndPay.this.login_info.login_result = 0;
                PlatformSDKLoginAndPay.this.isLogin = true;
                PlatformSDKLoginAndPay.this.notifyLoginResult(PlatformSDKLoginAndPay.this.login_info);
            } else {
                PlatformSDKLoginAndPay.this.login_info = new PlatformAndGameInfo.LoginInfo();
                PlatformSDKLoginAndPay.this.login_info.account_uid_str = StatConstants.MTA_COOPERATION_TAG;
                PlatformSDKLoginAndPay.this.login_info.account_nick_name = StatConstants.MTA_COOPERATION_TAG;
                PlatformSDKLoginAndPay.this.login_info.login_session = StatConstants.MTA_COOPERATION_TAG;
                PlatformSDKLoginAndPay.this.login_info.login_result = 1;
                PlatformSDKLoginAndPay.this.isLogin = false;
                PlatformSDKLoginAndPay.this.notifyLoginResult(PlatformSDKLoginAndPay.this.login_info);
            }
            if (dis != null && !dis.equals(StatConstants.MTA_COOPERATION_TAG)) {
                Toast.makeText(PlatformSDKLoginAndPay.this.game_ctx, dis, 0).show();
            }
        }

        @Override // com.youai.sdks.callback.YAOnInitCompleteListener
        public void onInitComplete(int arg0) {
            if (arg0 == 1) {
                PlatformSDKLoginAndPay.this.mCallback1.notifyInitPlatformSDKComplete();
            } else {
                Toast.makeText(PlatformSDKLoginAndPay.this.mGameActivity.getActivity(), "平台初始化失败！", 0).show();
            }
        }

        @Override // com.youai.sdks.callback.YAOnExitCompleteListener
        public void onExitComplete() {
            PlatformSDKLoginAndPay.this.game_ctx.finish();
            System.exit(0);
        }

        @Override // com.youai.sdks.callback.YAOnLogoutProcessListener
        public void finishLogoutProcess(PlatformContacts.LoginState code, String dis) {
            if (code == PlatformContacts.LoginState.Login_Not) {
                PlatformSDKLoginAndPay.this.isLogin = false;
                PlatformSDKLoginAndPay.this.login_info.login_result = 1;
            }
            if (dis != null && !dis.equals(StatConstants.MTA_COOPERATION_TAG)) {
                Toast.makeText(PlatformSDKLoginAndPay.this.game_ctx, dis, 0).show();
            }
        }

        @Override // com.youai.sdks.callback.YAOnTryUserToOKLinstener
        public void onTryUserToOK() {
        }
    };

    private PlatformSDKLoginAndPay() {
    }

    public static PlatformSDKLoginAndPay getInstance() {
        if (mInstance == null) {
            synchronized (PlatformSDKLoginAndPay.class) {
                mInstance = new PlatformSDKLoginAndPay();
            }
        }
        return mInstance;
    }

    @Override // com.youai.IPlatformLoginAndPay
    public void init(IGameActivity game_ctx, PlatformAndGameInfo.GameInfo game_info) {
        this.game_info = game_info;
        this.mGameActivity = game_ctx;
        game_info.use_platform_sdk_type = 1;
        game_info.debug_mode = 1;
        this.game_ctx = game_ctx.getActivity();
        this.game_info.platform_type = Integer.valueOf(GameMaincpp.enPlatform).intValue();
        this.game_info.platform_type_str = PlatformSDKActivity.platformInfo.platformName;
        this.isLogin = false;
        PlatformSdk.getInstance().init(game_ctx.getActivity(), null, PlatformSDKActivity.platformInfo, this.yaSdkInterface);
    }

    @Override // com.youai.IPlatformLoginAndPay
    public void setPlatformSDKStateCallback(GameInterface.IPlatformSDKStateCallback callback1) {
        this.mCallback1 = callback1;
    }

    @Override // com.youai.IPlatformLoginAndPay
    public void setGameUpdateStateCallback(GameInterface.IGameUpdateStateCallback callback2) {
        this.mCallback2 = callback2;
    }

    @Override // com.youai.IPlatformLoginAndPay
    public void setGameAppStateCallback(GameInterface.IGameAppStateCallback callback3) {
        this.mCallback3 = callback3;
    }

    @Override // com.youai.IPlatformLoginAndPay
    public int isSupportInSDKGameUpdate() {
        return 0;
    }

    @Override // com.youai.IPlatformLoginAndPay
    public int getPlatformLogoLayoutId() {
        return R.layout.logo_platform;
    }

    @Override // com.youai.IPlatformLoginAndPay
    public void unInit() {
        PlatformSdk.getInstance().unInit(this.game_ctx);
        this.mGameActivity = null;
        this.mCallback1 = null;
        this.mCallback2 = null;
        this.mCallback3 = null;
        this.game_ctx = null;
        this.game_info = null;
        this.login_info = null;
        this.version_info = null;
        this.pay_info = null;
    }

    @Override // com.youai.IPlatformLoginAndPay
    public PlatformAndGameInfo.GameInfo getGameInfo() {
        return this.game_info;
    }

    @Override // com.youai.IPlatformLoginAndPay
    public void callLogin() {
        this.mCallback3.showWaitingViewImp(true, -1, "正在登录");
        PlatformSdk.getInstance().login(this.game_ctx);
        this.mCallback3.showWaitingViewImp(false, -1, "正在登录");
    }

    @Override // com.youai.IPlatformLoginAndPay
    public void notifyLoginResult(PlatformAndGameInfo.LoginInfo login_result) {
        this.login_info = null;
        this.login_info = login_result;
        if (login_result != null) {
            if (PlatformSDKActivity.platformInfo.enShortName == null || StatConstants.MTA_COOPERATION_TAG.equals(PlatformSDKActivity.platformInfo.enShortName)) {
                this.mCallback3.notifyLoginResut(this.login_info);
                return;
            }
            this.login_info.account_uid_str = PlatformSDKActivity.platformInfo.enShortName + this.login_info.account_uid_str;
            this.mCallback3.notifyLoginResut(this.login_info);
        }
    }

    @Override // com.youai.IPlatformLoginAndPay
    public PlatformAndGameInfo.LoginInfo getLoginInfo() {
        if (this.isLogin) {
            this.login_info.login_result = 0;
        } else {
            this.login_info.login_result = 1;
        }
        return this.login_info;
    }

    @Override // com.youai.IPlatformLoginAndPay
    public void onLoginGame() {
        JSONObject jsonData = new JSONObject();
        try {
            jsonData.put("roldId", LastLoginHelp.mPlayerId);
            jsonData.put("roldName", LastLoginHelp.mPlayerName);
            jsonData.put("roldLevel", LastLoginHelp.mlv);
            jsonData.put("zoneId", LastLoginHelp.mServerID);
            jsonData.put("zoneName", "梦想" + LastLoginHelp.mServerID + "服");
            jsonData.put("viplvl", LastLoginHelp.mVipLvl);
        } catch (Exception e) {
            e.printStackTrace();
        }
        PlatformSdk.getInstance().setEnterGame(true, jsonData);
    }

    @Override // com.youai.IPlatformLoginAndPay
    public void callLogout() {
        if (PlatformSdk.getInstance() != null) {
            PlatformSdk.getInstance().logout(this.game_ctx);
        }
    }

    @Override // com.youai.IPlatformLoginAndPay
    public void callCheckVersionUpate() {
        PlatformSdk.getInstance().callCheckVersionUpate();
    }

    @Override // com.youai.IPlatformLoginAndPay
    public void notifyVersionUpateInfo(PlatformAndGameInfo.VersionInfo version_info) {
        this.version_info = null;
        this.version_info = version_info;
        if (version_info != null) {
            this.mCallback2.notifyVersionCheckResult(version_info);
        }
    }

    @Override // com.youai.IPlatformLoginAndPay
    public int callPayRecharge(PlatformAndGameInfo.PayInfo pay_info) {
        this.pay_info = null;
        this.pay_info = pay_info;
        PayInfo payinfo = new PayInfo();
        payinfo.count = pay_info.count;
        payinfo.description = pay_info.description;
        payinfo.order_serial = pay_info.order_serial;
        payinfo.orignal_price = pay_info.orignal_price;
        payinfo.price = pay_info.price;
        payinfo.product_id = pay_info.product_id;
        payinfo.product_name = pay_info.product_name;
        payinfo.waresId = getWaresId(pay_info);
        PlatformSdk.getInstance().showPay(this.game_ctx, payinfo);
        return 0;
    }

    @Override // com.youai.IPlatformLoginAndPay
    public void notifyPayRechargeRequestResult(PlatformAndGameInfo.PayInfo pay_info) {
        this.mCallback3.notifyPayRechargeResult(pay_info);
    }

    @Override // com.youai.IPlatformLoginAndPay
    public void callAccountManage() {
        PlatformSdk.getInstance().switchAccount(this.game_ctx);
    }

    @Override // com.youai.IPlatformLoginAndPay
    public String generateNewOrderSerial() {
        return UUID.randomUUID().toString().replace("-", StatConstants.MTA_COOPERATION_TAG);
    }

    @Override // com.youai.IPlatformLoginAndPay
    public void callPlatformFeedback() {
        if (Cocos2dxHelper.nativeHasEnterMainFrame()) {
            YALastLoginHelp yaLastLoginHelp = new YALastLoginHelp();
            yaLastLoginHelp.mPuid = LastLoginHelp.mPuid;
            yaLastLoginHelp.mGameid = LastLoginHelp.mGameid;
            yaLastLoginHelp.mServerID = LastLoginHelp.mServerID;
            yaLastLoginHelp.mPlayerId = LastLoginHelp.mPlayerId;
            yaLastLoginHelp.mPlayerName = LastLoginHelp.mPlayerName;
            yaLastLoginHelp.mVipLvl = LastLoginHelp.mVipLvl;
            yaLastLoginHelp.mPlatform = LastLoginHelp.mPlatform;
            if (PlatformSdk.getInstance().showFeedBack(this.game_ctx, yaLastLoginHelp) == 0) {
                String _url = YouaiConfig.UrlFeedBack + "?puid=" + LastLoginHelp.mPuid + "&gameId=" + LastLoginHelp.mGameid + "&serverId=" + LastLoginHelp.mServerID + "&playerId=" + LastLoginHelp.mPlayerId + "&playerName=" + LastLoginHelp.mPlayerName + "&vipLvl=" + LastLoginHelp.mVipLvl + "&platformId=" + LastLoginHelp.mPlatform;
                FeedBackDialog.getInstance(this.game_ctx, _url).show();
            }
        }
    }

    @Override // com.youai.IPlatformLoginAndPay
    public void callPlatformSupportThirdShare(PlatformAndGameInfo.ShareInfo share_info) {
        ShareInfo shareinfo = new ShareInfo();
        shareinfo.bitmap = share_info.bitmap;
        shareinfo.content = share_info.content;
        shareinfo.img_path = share_info.img_path;
        PlatformSdk.getInstance().shareToThirdPlatForm(this.game_ctx, shareinfo);
    }

    @Override // com.youai.IPlatformLoginAndPay
    public void callPlatformGameBBS() {
        InputStream inputStream = this.game_ctx.getResources().openRawResource(R.raw.bbsconfig);
        String url = getString(inputStream);
        PlatformSdk.getInstance().showBBS(this.game_ctx, url);
    }

    private String getString(InputStream inputStream) {
        InputStreamReader inputStreamReader = null;
        try {
            InputStreamReader inputStreamReader2 = new InputStreamReader(inputStream, "utf-8");
            inputStreamReader = inputStreamReader2;
        } catch (UnsupportedEncodingException e1) {
            e1.printStackTrace();
        }
        BufferedReader reader = new BufferedReader(inputStreamReader);
        StringBuffer sb = new StringBuffer(StatConstants.MTA_COOPERATION_TAG);
        while (true) {
            try {
                String line = reader.readLine();
                if (line == null) {
                    break;
                }
                sb.append(line);
                sb.append("\n");
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
        return sb.toString();
    }

    @Override // com.youai.IPlatformLoginAndPay
    public void onGamePause() {
    }

    @Override // com.youai.IPlatformLoginAndPay
    public void onGameResume() {
    }

    @Override // com.youai.IPlatformLoginAndPay
    public void onGameExit() {
        PlatformSdk.getInstance().onGameExit();
    }

    @Override // com.youai.IPlatformLoginAndPay
    public void callToolBar(boolean visible) {
        PlatformSdk.getInstance().callToolBar(visible);
    }

    @Override // com.youai.IPlatformLoginAndPay
    public boolean isTryUser() {
        return false;
    }

    @Override // com.youai.IPlatformLoginAndPay
    public void callBindTryToOkUser() {
    }

    @Override // com.youai.IPlatformLoginAndPay
    public void receiveGameSvrBindTryToOkUserResult(int result) {
    }

    private String getWaresId(PlatformAndGameInfo.PayInfo payInfo) {
        boolean exist = false;
        String waresId = "0";
        try {
            AssetManager manager = this.game_ctx.getAssets();
            String[] names = manager.list(StatConstants.MTA_COOPERATION_TAG);
            int i = 0;
            while (true) {
                if (i >= names.length) {
                    break;
                }
                if (!names[i].equals("PayInfo.txt".trim())) {
                    i++;
                } else {
                    exist = true;
                    break;
                }
            }
            if (!exist) {
                return "0";
            }
            InputStreamReader inputReader = new InputStreamReader(this.game_ctx.getResources().getAssets().open("PayInfo.txt"));
            BufferedReader bufReader = new BufferedReader(inputReader);
            String Result = StatConstants.MTA_COOPERATION_TAG;
            while (true) {
                String line = bufReader.readLine();
                if (line == null) {
                    break;
                }
                Result = Result + line;
            }
            if (Result == StatConstants.MTA_COOPERATION_TAG) {
                return "0";
            }
            JSONObject jsonObject = new JSONObject(Result);
            Iterator<String> itKeys = jsonObject.keys();
            while (itKeys.hasNext()) {
                if (payInfo.product_id.equals(itKeys.next())) {
                    waresId = jsonObject.getString(payInfo.product_id);
                }
            }
        } catch (IOException e) {
            e.printStackTrace();
        } catch (JSONException e2) {
            e2.printStackTrace();
        }
        return waresId;
    }
}
