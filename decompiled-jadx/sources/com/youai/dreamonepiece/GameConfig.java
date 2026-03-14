package com.youai.dreamonepiece;

import android.text.TextUtils;
import android.util.Log;
import com.youai.IGameActivity;
import com.youai.PlatformAndGameInfo;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.util.Properties;
import org.json.JSONException;
import org.json.JSONObject;

/* JADX INFO: loaded from: classes.dex */
public class GameConfig {
    private IGameActivity mGameActivity;
    public PlatformAndGameInfo.GameInfo mGameInfo;

    public static native int nativeReadGameAppID(int i);

    public static native String nativeReadGameAppKey(int i);

    public static native String nativeReadGameAppSecret(int i);

    public static native String nativeReadGamePlatformInfo(int i);

    public GameConfig(IGameActivity gameActivity, int platform_type) {
        long start = System.currentTimeMillis();
        this.mGameActivity = gameActivity;
        this.mGameInfo = new PlatformAndGameInfo.GameInfo();
        this.mGameInfo.platform_type = platform_type;
        this.mGameInfo.platform_type_str = PlatformAndGameInfo.getPlatformTypeStr(platform_type);
        loadGameConfig();
        long end = System.currentTimeMillis();
        long span = end - start;
        Log.e("GameConfig", "GameConfig cost time: " + span + " millis");
    }

    private void parseGamePlatformInfo(String infoStr) {
        if (!TextUtils.isEmpty(infoStr)) {
            try {
                JSONObject dataJsonObj = new JSONObject(infoStr);
                if (this.mGameInfo.platform_type == 1 || this.mGameInfo.platform_type == 5 || this.mGameInfo.platform_type == 6) {
                    this.mGameInfo.app_id = dataJsonObj.getInt("appid");
                    this.mGameInfo.app_key = dataJsonObj.getString("appkey");
                } else if (this.mGameInfo.platform_type == 2 || this.mGameInfo.platform_type == 4) {
                    this.mGameInfo.app_id = dataJsonObj.getInt("appid");
                    this.mGameInfo.app_key = dataJsonObj.getString("appkey");
                    this.mGameInfo.cp_id = dataJsonObj.getInt("cpid");
                    this.mGameInfo.svr_id = dataJsonObj.getInt("svrid");
                } else if (this.mGameInfo.platform_type == 7 || this.mGameInfo.platform_type == 14) {
                    this.mGameInfo.app_id = dataJsonObj.getInt("appid");
                    this.mGameInfo.app_key = dataJsonObj.getString("appkey");
                    this.mGameInfo.app_secret = dataJsonObj.getString("appsecret");
                } else if (this.mGameInfo.platform_type == 111) {
                    this.mGameInfo.app_id = dataJsonObj.getInt("appid");
                    this.mGameInfo.app_key = dataJsonObj.getString("appkey");
                    this.mGameInfo.app_secret = dataJsonObj.getString("appsecret");
                } else if (this.mGameInfo.platform_type == 17) {
                    this.mGameInfo.app_id_str = dataJsonObj.getString("appid");
                    this.mGameInfo.app_key = dataJsonObj.getString("appkey");
                } else if (this.mGameInfo.platform_type == 13) {
                    this.mGameInfo.app_key = dataJsonObj.getString("appkey");
                    this.mGameInfo.app_secret = dataJsonObj.getString("appsecret");
                } else if (this.mGameInfo.platform_type == 23) {
                    this.mGameInfo.app_id_str = dataJsonObj.getString("appid");
                    this.mGameInfo.app_key = dataJsonObj.getString("appkey");
                    this.mGameInfo.app_secret = dataJsonObj.getString("appsecret");
                } else if (this.mGameInfo.platform_type == 16) {
                    this.mGameInfo.app_id_str = dataJsonObj.getString("appid");
                    this.mGameInfo.app_key = dataJsonObj.getString("appkey");
                    this.mGameInfo.app_secret = dataJsonObj.getString("appsecret");
                } else if (this.mGameInfo.platform_type == 10) {
                    this.mGameInfo.app_id_str = dataJsonObj.getString("appid");
                    this.mGameInfo.app_key = dataJsonObj.getString("appkey");
                    this.mGameInfo.app_secret = dataJsonObj.getString("appsecret");
                } else if (this.mGameInfo.platform_type == 24) {
                    this.mGameInfo.app_key = dataJsonObj.getString("appkey");
                    this.mGameInfo.app_secret = dataJsonObj.getString("appsecret");
                } else if (this.mGameInfo.platform_type == 26 || this.mGameInfo.platform_type == 43) {
                    this.mGameInfo.app_key = dataJsonObj.getString("appkey");
                    this.mGameInfo.app_secret = dataJsonObj.getString("appsecret");
                    this.mGameInfo.pay_addr = dataJsonObj.getString("payaddr");
                } else if (this.mGameInfo.platform_type == 25) {
                    this.mGameInfo.app_id = dataJsonObj.getInt("appid");
                    this.mGameInfo.app_key = dataJsonObj.getString("appkey");
                    this.mGameInfo.pay_addr = dataJsonObj.getString("payaddr");
                } else if (this.mGameInfo.platform_type == 27) {
                    this.mGameInfo.app_id_str = dataJsonObj.getString("appid");
                    this.mGameInfo.app_key = dataJsonObj.getString("appkey");
                    this.mGameInfo.app_secret = dataJsonObj.getString("appsecret");
                } else if (this.mGameInfo.platform_type == 29) {
                    this.mGameInfo.app_id_str = dataJsonObj.getString("appid");
                    this.mGameInfo.app_key = dataJsonObj.getString("appkey");
                    this.mGameInfo.app_secret = dataJsonObj.getString("appsecret");
                    this.mGameInfo.svr_id = dataJsonObj.getInt("svrid");
                } else if (this.mGameInfo.platform_type == 27) {
                    this.mGameInfo.app_id_str = dataJsonObj.getString("appid");
                    this.mGameInfo.app_key = dataJsonObj.getString("appkey");
                } else if (this.mGameInfo.platform_type == 28) {
                    this.mGameInfo.app_id = dataJsonObj.getInt("appid");
                    this.mGameInfo.app_id_str = dataJsonObj.getString("cpid");
                } else if (this.mGameInfo.platform_type == 30) {
                    this.mGameInfo.app_id = dataJsonObj.getInt("appid");
                    this.mGameInfo.gameid = dataJsonObj.getInt("gameid");
                    this.mGameInfo.app_key = dataJsonObj.getString("appkey");
                } else if (this.mGameInfo.platform_type == 31) {
                    this.mGameInfo.app_id_str = dataJsonObj.getString("appid");
                    this.mGameInfo.pay_id_str = dataJsonObj.getString("payid");
                    this.mGameInfo.private_str = dataJsonObj.getString("private");
                    this.mGameInfo.public_str = dataJsonObj.getString("public");
                    this.mGameInfo.pay_addr = dataJsonObj.getString("payaddr");
                    this.mGameInfo.app_secret = dataJsonObj.getString("buoykey");
                    this.mGameInfo.cp_id_str = dataJsonObj.getString("cpid");
                } else if (this.mGameInfo.platform_type == 32) {
                    this.mGameInfo.app_id = dataJsonObj.getInt("appid");
                    this.mGameInfo.app_key = dataJsonObj.getString("appkey");
                    this.mGameInfo.app_secret = dataJsonObj.getString("appsecret");
                    this.mGameInfo.pay_addr = dataJsonObj.getString("payaddr");
                } else if (this.mGameInfo.platform_type == 35) {
                    this.mGameInfo.app_id = dataJsonObj.getInt("appid");
                    this.mGameInfo.app_key = dataJsonObj.getString("appkey");
                    this.mGameInfo.app_secret = dataJsonObj.getString("appsecret");
                    this.mGameInfo.pay_id_str = dataJsonObj.getString("payid");
                    this.mGameInfo.private_str = dataJsonObj.getString("private");
                } else if (this.mGameInfo.platform_type == 33) {
                    this.mGameInfo.app_id_str = dataJsonObj.getString("appid");
                    this.mGameInfo.app_key = dataJsonObj.getString("appkey");
                    this.mGameInfo.pay_addr = dataJsonObj.getString("payaddr");
                } else if (this.mGameInfo.platform_type == 34) {
                    this.mGameInfo.app_id_str = dataJsonObj.getString("appid");
                } else if (this.mGameInfo.platform_type == 36) {
                    this.mGameInfo.cp_id = dataJsonObj.getInt("cpid");
                    this.mGameInfo.gameid = dataJsonObj.getInt("gameid");
                    this.mGameInfo.app_id_str = dataJsonObj.getString("appid");
                    this.mGameInfo.private_str = dataJsonObj.getString("privateKey");
                } else if (this.mGameInfo.platform_type == 38) {
                    this.mGameInfo.app_id_str = dataJsonObj.getString("waresid");
                    this.mGameInfo.app_id = dataJsonObj.getInt("appid");
                    this.mGameInfo.app_key = dataJsonObj.getString("appkey");
                    this.mGameInfo.app_secret = dataJsonObj.getString("appsecret");
                } else if (this.mGameInfo.platform_type == 37) {
                    this.mGameInfo.app_id = dataJsonObj.getInt("appid");
                    this.mGameInfo.app_key = dataJsonObj.getString("appkey");
                    this.mGameInfo.app_secret = dataJsonObj.getString("app_secret");
                    this.mGameInfo.pay_id_str = dataJsonObj.getString("pay_id_str");
                    this.mGameInfo.public_str = dataJsonObj.getString("public_str");
                } else if (this.mGameInfo.platform_type == 44) {
                    this.mGameInfo.app_id = dataJsonObj.getInt("appid");
                    this.mGameInfo.app_key = dataJsonObj.getString("appkey");
                    this.mGameInfo.app_secret = dataJsonObj.getString("app_secret");
                    this.mGameInfo.pay_id_str = dataJsonObj.getString("pay_id_str");
                    this.mGameInfo.public_str = dataJsonObj.getString("public_str");
                } else if (this.mGameInfo.platform_type == 40) {
                    this.mGameInfo.app_id_str = dataJsonObj.getString("appid");
                    this.mGameInfo.app_key = dataJsonObj.getString("appkey");
                } else if (this.mGameInfo.platform_type == 39) {
                    this.mGameInfo.app_id = dataJsonObj.getInt("appid");
                    this.mGameInfo.app_key = dataJsonObj.getString("appkey");
                } else if (this.mGameInfo.platform_type == 42) {
                    this.mGameInfo.app_id = dataJsonObj.getInt("appid");
                    this.mGameInfo.app_secret = dataJsonObj.getString("appsecret");
                } else if (this.mGameInfo.platform_type == 133) {
                    this.mGameInfo.app_key = dataJsonObj.getString("appkey");
                    this.mGameInfo.app_secret = dataJsonObj.getString("appsecret");
                } else if (this.mGameInfo.platform_type == 41) {
                    this.mGameInfo.app_id = dataJsonObj.getInt("appid");
                    this.mGameInfo.app_key = dataJsonObj.getString("appkey");
                    this.mGameInfo.app_secret = dataJsonObj.getString("appsecret");
                } else if (this.mGameInfo.platform_type == 46) {
                    this.mGameInfo.app_id = dataJsonObj.getInt("appid");
                    this.mGameInfo.app_key = dataJsonObj.getString("appkey");
                    this.mGameInfo.app_secret = dataJsonObj.getString("appsecret");
                    this.mGameInfo.pay_id_str = dataJsonObj.getString("pay_id_str");
                    this.mGameInfo.private_str = dataJsonObj.getString("privateKey");
                } else if (this.mGameInfo.platform_type == 47) {
                    this.mGameInfo.app_id = dataJsonObj.getInt("appid");
                    this.mGameInfo.app_key = dataJsonObj.getString("appkey");
                    this.mGameInfo.app_secret = dataJsonObj.getString("appsecret");
                } else if (this.mGameInfo.platform_type == 48) {
                    this.mGameInfo.app_id_str = dataJsonObj.getString("appid");
                    this.mGameInfo.app_key = dataJsonObj.getString("appkey");
                    this.mGameInfo.private_str = dataJsonObj.getString("private");
                } else if (this.mGameInfo.platform_type != 49) {
                    if (this.mGameInfo.platform_type == 50) {
                        this.mGameInfo.app_id = dataJsonObj.getInt("appid");
                        this.mGameInfo.app_key = dataJsonObj.getString("appkey");
                        this.mGameInfo.cp_id = dataJsonObj.getInt("cpid");
                    } else if (this.mGameInfo.platform_type == 51) {
                        this.mGameInfo.app_key = dataJsonObj.getString("appkey");
                        this.mGameInfo.public_str = dataJsonObj.getString("publicKey");
                    } else if (this.mGameInfo.platform_type == 52) {
                        this.mGameInfo.app_key = dataJsonObj.getString("appkey");
                    } else if (this.mGameInfo.platform_type == 53) {
                        this.mGameInfo.app_id_str = dataJsonObj.getString("appid");
                        this.mGameInfo.app_key = dataJsonObj.getString("appkey");
                        this.mGameInfo.app_secret = dataJsonObj.getString("appsecret");
                        this.mGameInfo.pay_addr = dataJsonObj.getString("rechargeurl");
                        this.mGameInfo.public_str = dataJsonObj.getString("public_str");
                    } else if (this.mGameInfo.platform_type == 54) {
                        this.mGameInfo.app_id_str = dataJsonObj.getString("appid");
                        this.mGameInfo.app_key = dataJsonObj.getString("appkey");
                        this.mGameInfo.app_secret = dataJsonObj.getString("appsecret");
                        this.mGameInfo.pay_addr = dataJsonObj.getString("rechargeurl");
                        this.mGameInfo.public_str = dataJsonObj.getString("public_str");
                    } else if (this.mGameInfo.platform_type == 57) {
                        this.mGameInfo.app_id = dataJsonObj.getInt("appid");
                        this.mGameInfo.app_key = dataJsonObj.getString("storekey");
                        this.mGameInfo.app_secret = dataJsonObj.getString("storeid");
                        this.mGameInfo.pay_addr = dataJsonObj.getString("payaddr");
                    } else if (this.mGameInfo.platform_type == 59) {
                        this.mGameInfo.app_id_str = dataJsonObj.getString("appid");
                        this.mGameInfo.app_key = dataJsonObj.getString("appkey");
                        this.mGameInfo.app_secret = dataJsonObj.getString("appsecret");
                    } else if (this.mGameInfo.platform_type == 61) {
                        this.mGameInfo.app_id = dataJsonObj.getInt("appid");
                        this.mGameInfo.app_key = dataJsonObj.getString("appkey");
                        this.mGameInfo.app_secret = dataJsonObj.getString("appsecret");
                    } else if (this.mGameInfo.platform_type == 67) {
                        this.mGameInfo.app_id = dataJsonObj.getInt("appid");
                        this.mGameInfo.app_key = dataJsonObj.getString("appkey");
                        this.mGameInfo.app_secret = dataJsonObj.getString("appsecret");
                        this.mGameInfo.app_id_str = dataJsonObj.getString("appid_cool");
                        this.mGameInfo.public_str = dataJsonObj.getString("appkey_cool");
                        this.mGameInfo.pay_addr = dataJsonObj.getString("rechargeurl");
                    } else if (this.mGameInfo.platform_type == 60) {
                        this.mGameInfo.app_id = dataJsonObj.getInt("appid");
                        this.mGameInfo.pay_id_str = dataJsonObj.getString("pay_id_str");
                    } else if (this.mGameInfo.platform_type == 74) {
                        this.mGameInfo.gameid = dataJsonObj.getInt("gameid");
                        this.mGameInfo.cp_id = dataJsonObj.getInt("cpid");
                        this.mGameInfo.app_key = dataJsonObj.getString("key");
                        this.mGameInfo.pay_addr = dataJsonObj.getString("rechargeurl");
                        this.mGameInfo.pay_id_str = dataJsonObj.getString("validateurl");
                    } else if (this.mGameInfo.platform_type == 73) {
                        this.mGameInfo.app_id = dataJsonObj.getInt("appid");
                        this.mGameInfo.app_key = dataJsonObj.getString("appkey");
                    } else if (this.mGameInfo.platform_type == 77) {
                        this.mGameInfo.app_key = "youaidreamonepiece";
                    } else if (this.mGameInfo.platform_type == 78) {
                        this.mGameInfo.app_id = dataJsonObj.getInt("appid");
                        this.mGameInfo.app_key = dataJsonObj.getString("appkey");
                    }
                }
            } catch (JSONException e) {
                e.printStackTrace();
            }
        }
    }

    public void loadGameConfig() {
        File cfg = new File(this.mGameActivity.getAppFilesRootPath() + "/game.properties");
        if (cfg.exists()) {
            Properties cfgIni = new Properties();
            String platformType = null;
            String usePlatformSdkType = null;
            try {
                cfgIni.load(new FileInputStream(cfg));
                platformType = cfgIni.getProperty("platformType", null);
                usePlatformSdkType = cfgIni.getProperty("usePlatformSdkType", null);
            } catch (FileNotFoundException e) {
            } catch (IOException e2) {
            }
            this.mGameInfo.platform_type = PlatformAndGameInfo.readGameInfoPlatformType(platformType, this.mGameInfo.platform_type);
            this.mGameInfo.use_platform_sdk_type = PlatformAndGameInfo.readGameInfoUsePlatformSdkType(usePlatformSdkType, this.mGameInfo.platform_type, this.mGameInfo.use_platform_sdk_type);
        }
    }
}
