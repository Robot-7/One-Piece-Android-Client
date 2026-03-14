package com.youai;

import android.graphics.Bitmap;
import com.igexin.getuiext.data.Consts;
import com.tencent.stat.common.StatConstants;

/* JADX INFO: loaded from: classes.dex */
public class PlatformAndGameInfo {
    public static final int DoNotSupportUpdate = 0;
    public static final int SupportUpdateCheck = 1;
    public static final int SupportUpdateCheckAndDownload = 2;
    public static final int enDebugMode_Debug = 2;
    public static final int enDebugMode_Release = 1;
    public static final int enLoginResult_Failed = 1;
    public static final int enLoginResult_Success = 0;
    public static final String enPlatformName_360 = "Android_360";
    public static final String enPlatformName_91 = "Android_91";
    public static final String enPlatformName_Amazon = "Android_Amazon";
    public static final String enPlatformName_AnZhi = "Android_AnZhi";
    public static final String enPlatformName_AnZhiGG = "Android_AnZhiGG";
    public static final String enPlatformName_AndroidMarket91 = "Android_AndroidMarket91";
    public static final String enPlatformName_BaiDuGame = "Android_BaiDuGame";
    public static final String enPlatformName_BaiDuMobileGame = "Android_BaiDuMobile";
    public static final String enPlatformName_BaiduAppCenter = "Android_BaiduAppCenter";
    public static final String enPlatformName_BaiduDuoKu = "Android_BaiduDuoKu";
    public static final String enPlatformName_CMGE = "Android_CMGE";
    public static final String enPlatformName_ChuKong = "Android_ChuKong";
    public static final String enPlatformName_DangLe = "Android_DangLe";
    public static final String enPlatformName_Default = "Android_Default";
    public static final String enPlatformName_FeiLiu = "Android_FeiLiu";
    public static final String enPlatformName_FiveOne = "Android_51";
    public static final String enPlatformName_GTV = "Android_GTV";
    public static final String enPlatformName_Game2324 = "Android_2324";
    public static final String enPlatformName_Game4399 = "Android_Game4399";
    public static final String enPlatformName_HuaWei = "Android_HuaWei";
    public static final String enPlatformName_JiFeng = "Android_JiFeng";
    public static final String enPlatformName_JinShan = "Android_JinShan";
    public static final String enPlatformName_Jinli = "Android_Jinli";
    public static final String enPlatformName_JorGame = "Android_Zhuoran";
    public static final String enPlatformName_Keke = "Android_Keke";
    public static final String enPlatformName_KuGou = "Android_KuGou";
    public static final String enPlatformName_KuWo = "Android_KuWo";
    public static final String enPlatformName_Lenoq = "Android_YouaiLenoq";
    public static final String enPlatformName_Lenovo = "Android_YouaiLenov";
    public static final String enPlatformName_LvDouGame = "Android_LvDouGame";
    public static final String enPlatformName_Meizu = "Android_YouaiMeizu";
    public static final String enPlatformName_MengChengHuDong = "Android_MengChengHuDong";
    public static final String enPlatformName_Mumayi = "Android_Mumayi";
    public static final String enPlatformName_Nduo = "Android_YouaiNduoa";
    public static final String enPlatformName_Nduo2 = "Android_Nduo2";
    public static final String enPlatformName_Openqq = "Android_Openqq";
    public static final String enPlatformName_Oppo = "Android_Oppo";
    public static final String enPlatformName_Oupeng = "Android_OuPeng";
    public static final String enPlatformName_Pipaw = "Android_PiPaw";
    public static final String enPlatformName_PuidLogin = "PuidLogin";
    public static final String enPlatformName_Qitian = "Android_Qitian";
    public static final String enPlatformName_RenRen = "Android_RenRen";
    public static final String enPlatformName_Shuizhu = "Android_8868";
    public static final String enPlatformName_Sina = "Android_Sina";
    public static final String enPlatformName_Sjyx = "Android_Sjyx";
    public static final String enPlatformName_SouGou = "Android_SouGou";
    public static final String enPlatformName_Sqw = "Android_37wan";
    public static final String enPlatformName_Sqwan = "Android_37ww";
    public static final String enPlatformName_ThirdLogin = "Android_ThirdLogin";
    public static final String enPlatformName_TianYi = "Android_Youai189wo";
    public static final String enPlatformName_UC = "Android_UC";
    public static final String enPlatformName_Unicom = "Android_YouaiUnico";
    public static final String enPlatformName_Vivo = "Android_Vivo";
    public static final String enPlatformName_WanDouJia = "Android_WanDouJia";
    public static final String enPlatformName_XiaoMi = "Android_XiaoMi";
    public static final String enPlatformName_XunLei = "Android_XunLei";
    public static final String enPlatformName_YDMM = "Android_YouaiYdmm";
    public static final String enPlatformName_YingYongHui = "Android_YingYongHui";
    public static final String enPlatformName_YouLong = "Android_YouLong";
    public static final String enPlatformName_Youai = "Android_Youai";
    public static final String enPlatformName_YouaiCoolpay = "Android_Coolpay";
    public static final String enPlatformName_YouaiEloveGame = "Android_EloveGame";
    public static final String enPlatformName_YouaiGGENG = "Android_YouaiYingYu";
    public static final String enPlatformName_YouaiGGFT = "Android_YouaiGGTW";
    public static final String enPlatformName_YouaiGGKO = "Android_Youaikorean";
    public static final String enPlatformName_YouaiGGTop = "Android_YouaiGGTop";
    public static final String enPlatformName_YouaiGGWS = "Android_YouaiGGWS";
    public static final String enPlatformName_YouaiGGXMT = "Android_YouaiGGXMT";
    public static final String enPlatformName_YouaiGGZH = "Android_YouaiGGZH";
    public static final String enPlatformName_YouaiThai = "Android_YouaiThai";
    public static final String enPlatformShort_360 = "360_";
    public static final String enPlatformShort_91 = "91_";
    public static final String enPlatformShort_Amazon = "amazon_";
    public static final String enPlatformShort_AnZhi = "az_";
    public static final String enPlatformShort_AnZhiGG = "azgg_";
    public static final String enPlatformShort_AndroidMarket91 = "m91_";
    public static final String enPlatformShort_BaiDuGame = "bdgm_";
    public static final String enPlatformShort_BaiDuMobileGame = "bdmg_";
    public static final String enPlatformShort_BaiduAppCenter = "bdac_";
    public static final String enPlatformShort_BaiduDuoKu = "bddk_";
    public static final String enPlatformShort_CMGE = "cmge_";
    public static final String enPlatformShort_ChuKong = "ck_";
    public static final String enPlatformShort_DangLe = "dl_";
    public static final String enPlatformShort_Default = "default_";
    public static final String enPlatformShort_FeiLiu = "fl_";
    public static final String enPlatformShort_FiveOne = "51_";
    public static final String enPlatformShort_GTV = "gtv_";
    public static final String enPlatformShort_Game2324 = "2324_";
    public static final String enPlatformShort_Game4399 = "4399_";
    public static final String enPlatformShort_HuaWei = "hw_";
    public static final String enPlatformShort_JiFeng = "jf_";
    public static final String enPlatformShort_JinShan = "js_";
    public static final String enPlatformShort_Jinli = "jl_";
    public static final String enPlatformShort_JorGame = "zhuoran_";
    public static final String enPlatformShort_Keke = "keke_";
    public static final String enPlatformShort_KuGou = "kg_";
    public static final String enPlatformShort_KuWo = "kuwo_";
    public static final String enPlatformShort_Lenoq = "lenoq_";
    public static final String enPlatformShort_Lenovo = "lenovo_";
    public static final String enPlatformShort_LvDou = "ld_";
    public static final String enPlatformShort_Meizu = "meizu_";
    public static final String enPlatformShort_MengChengHuDong = "mchd_";
    public static final String enPlatformShort_Mumayi = "mumayi_";
    public static final String enPlatformShort_Nduo = "nduo_";
    public static final String enPlatformShort_Nduo2 = "nduo2_";
    public static final String enPlatformShort_OpenQq = "openqq_";
    public static final String enPlatformShort_Oppo = "oppo_";
    public static final String enPlatformShort_Oupeng = "oupeng_";
    public static final String enPlatformShort_Pipaw = "pipaw_";
    public static final String enPlatformShort_PuidLogin = "puidlogin_";
    public static final String enPlatformShort_Qitian = "qitian_";
    public static final String enPlatformShort_RenRen = "rr_";
    public static final String enPlatformShort_Shuizhu = "8868_";
    public static final String enPlatformShort_Sina = "sina_";
    public static final String enPlatformShort_Sjyx = "sjyx_";
    public static final String enPlatformShort_SouGou = "sg_";
    public static final String enPlatformShort_Sqw = "37wan_";
    public static final String enPlatformShort_Sqwan = "37ww_";
    public static final String enPlatformShort_ThirdLogin = "thl_";
    public static final String enPlatformShort_UC = "uc_";
    public static final String enPlatformShort_Unicom = "unicom_";
    public static final String enPlatformShort_Vivo = "vivo_";
    public static final String enPlatformShort_WanDouJia = "wdj_";
    public static final String enPlatformShort_XiaoMi = "xm_";
    public static final String enPlatformShort_XunLei = "xl_";
    public static final String enPlatformShort_YDMM = "ydmm_";
    public static final String enPlatformShort_YingYongHui = "yyh_";
    public static final String enPlatformShort_YouLong = "yl_";
    public static final String enPlatformShort_Youai = "ya_";
    public static final String enPlatformShort_YouaiCoolpay = "coolpay_";
    public static final String enPlatformShort_YouaiEloveGame = "elovegame_";
    public static final int enPlatform_360 = 3;
    public static final int enPlatform_91 = 1;
    public static final int enPlatform_Amazon = 66;
    public static final int enPlatform_AnZhi = 13;
    public static final int enPlatform_AnZhiGG = 133;
    public static final int enPlatform_AndroidMarket91 = 9;
    public static final int enPlatform_BaiDuGame = 24;
    public static final int enPlatform_BaiDuMobileGame = 33;
    public static final int enPlatform_BaiduAppCenter = 8;
    public static final int enPlatform_BaiduDuoKu = 7;
    public static final int enPlatform_CMGE = 34;
    public static final int enPlatform_ChuKong = 27;
    public static final int enPlatform_DangLe = 4;
    public static final int enPlatform_Default = 0;
    public static final int enPlatform_FeiLiu = 11;
    public static final int enPlatform_FiveOne = 51;
    public static final int enPlatform_GTV = 29;
    public static final int enPlatform_Game2324 = 50;
    public static final int enPlatform_Game4399 = 16;
    public static final int enPlatform_HuaWei = 31;
    public static final int enPlatform_JiFeng = 12;
    public static final int enPlatform_JinShan = 23;
    public static final int enPlatform_Jinli = 49;
    public static final int enPlatform_JorGame = 48;
    public static final int enPlatform_Keke = 43;
    public static final int enPlatform_KuGou = 30;
    public static final int enPlatform_KuWo = 10;
    public static final int enPlatform_Lenoq = 44;
    public static final int enPlatform_Lenovo = 37;
    public static final int enPlatform_LvDouGame = 25;
    public static final int enPlatform_Meizu = 41;
    public static final int enPlatform_MengChengHuDong = 59;
    public static final int enPlatform_Mumayi = 52;
    public static final int enPlatform_Nduo = 38;
    public static final int enPlatform_Nduo2 = 77;
    public static final int enPlatform_Openqq = 60;
    public static final int enPlatform_Oppo = 26;
    public static final int enPlatform_Oupeng = 40;
    public static final int enPlatform_Pipaw = 36;
    public static final int enPlatform_PuidLogin = -1;
    public static final int enPlatform_Qitian = 73;
    public static final int enPlatform_RenRen = 14;
    public static final int enPlatform_Shuizhu = 74;
    public static final int enPlatform_Sina = 15;
    public static final int enPlatform_Sjyx = 39;
    public static final int enPlatform_SouGou = 32;
    public static final int enPlatform_Sqw = 47;
    public static final int enPlatform_Sqwan = 42;
    public static final int enPlatform_Tencent_QQGame = 21;
    public static final int enPlatform_Tencent_WeChat = 20;
    public static final int enPlatform_ThirdLogin = 22;
    public static final int enPlatform_TianYi = 46;
    public static final int enPlatform_UC = 2;
    public static final int enPlatform_Unicom = 45;
    public static final int enPlatform_Vivo = 57;
    public static final int enPlatform_WanDouJia = 6;
    public static final int enPlatform_XiaoMi = 5;
    public static final int enPlatform_XunLei = 28;
    public static final int enPlatform_Ydmm = 35;
    public static final int enPlatform_YingYongHui = 17;
    public static final int enPlatform_YouLong = 78;
    public static final int enPlatform_Youai = 111;
    public static final int enPlatform_YouaiCooplay = 67;
    public static final int enPlatform_YouaiEloveGame = 61;
    public static final int enPlatform_YouaiGGEng = 63;
    public static final int enPlatform_YouaiGGFT = 53;
    public static final int enPlatform_YouaiGGKO = 64;
    public static final int enPlatform_YouaiGGTop = 58;
    public static final int enPlatform_YouaiGGWS = 56;
    public static final int enPlatform_YouaiGGXMT = 54;
    public static final int enPlatform_YouaiGGZH = 62;
    public static final int enPlatform_YouaiThai = 55;
    public static final int enScreenOrientation_Landscape = 2;
    public static final int enScreenOrientation_Portrait = 1;
    public static final int enUpdateInfo_Force = 2;
    public static final int enUpdateInfo_No = 0;
    public static final int enUpdateInfo_Suggest = 1;

    public static class GameInfo {
        public int app_id;
        public String app_id_str;
        public String app_key;
        public String app_secret;
        public int cp_id;
        public String cp_id_str;
        public int debug_mode;
        public int gameid;
        public String pay_addr;
        public String pay_id_str;
        public String platform_channel_str = StatConstants.MTA_COOPERATION_TAG;
        public int platform_type;
        public String platform_type_str;
        public String private_str;
        public String public_str;
        public int screen_orientation;
        public int svr_id;
        public int use_platform_sdk_type;
    }

    public static class LoginInfo {
        public String account_nick_name;
        public long account_uid;
        public String account_uid_str;
        public String account_user_name;
        public int login_result = 1;
        public String login_session;
    }

    public static class PayInfo {
        public int count;
        public String description;
        public String order_serial;
        public float orignal_price;
        public float price;
        public String product_id;
        public String product_name;
        public int result;
    }

    public static class ShareInfo {
        public Bitmap bitmap;
        public String content;
        public String img_path;
    }

    public static class VersionInfo {
        public String download_url;
        public int local_version_code;
        public int max_version_code;
        public int update_info;
    }

    public static String getPlatformTypeStr(int type) {
        if (type == 1) {
            return enPlatformName_91;
        }
        if (type == 2) {
            return enPlatformName_UC;
        }
        if (type == 3) {
            return enPlatformName_360;
        }
        if (type == 4) {
            return enPlatformName_DangLe;
        }
        if (type == 5) {
            return enPlatformName_XiaoMi;
        }
        if (type == 6) {
            return enPlatformName_WanDouJia;
        }
        if (type == 7) {
            return enPlatformName_BaiduDuoKu;
        }
        if (type == 8) {
            return enPlatformName_BaiduAppCenter;
        }
        if (type == 9) {
            return enPlatformName_AndroidMarket91;
        }
        if (type == 10) {
            return enPlatformName_KuWo;
        }
        if (type == 11) {
            return enPlatformName_FeiLiu;
        }
        if (type == 12) {
            return enPlatformName_JiFeng;
        }
        if (type == 13) {
            return enPlatformName_AnZhi;
        }
        if (type == 14) {
            return enPlatformName_RenRen;
        }
        if (type == 15) {
            return enPlatformName_Sina;
        }
        if (type == 16) {
            return enPlatformName_Game4399;
        }
        if (type == 17) {
            return enPlatformName_YingYongHui;
        }
        if (type == 26) {
            return enPlatformName_Oppo;
        }
        if (type == 22) {
            return enPlatformName_ThirdLogin;
        }
        if (type == 111) {
            return enPlatformName_Youai;
        }
        if (type == 24) {
            return enPlatformName_BaiDuGame;
        }
        if (type == 25) {
            return enPlatformName_LvDouGame;
        }
        if (type == 27) {
            return enPlatformName_ChuKong;
        }
        if (type == 29) {
            return enPlatformName_GTV;
        }
        if (type == 28) {
            return enPlatformName_XunLei;
        }
        if (type == 30) {
            return enPlatformName_KuGou;
        }
        if (type == 31) {
            return enPlatformName_HuaWei;
        }
        if (type == 32) {
            return enPlatformName_SouGou;
        }
        if (type == 33) {
            return enPlatformName_BaiDuMobileGame;
        }
        if (type == 34) {
            return enPlatformName_CMGE;
        }
        if (type == 36) {
            return enPlatformName_Pipaw;
        }
        if (type == 35) {
            return enPlatformName_YDMM;
        }
        if (type == 38) {
            return enPlatformName_Nduo;
        }
        if (type == 37) {
            return enPlatformName_Lenovo;
        }
        if (type == 43) {
            return enPlatformName_Keke;
        }
        if (type == 44) {
            return enPlatformName_Lenoq;
        }
        if (type == 45) {
            return enPlatformName_Unicom;
        }
        if (type == 40) {
            return enPlatformName_Oupeng;
        }
        if (type == 42) {
            return enPlatformName_Sqwan;
        }
        if (type == 46) {
            return enPlatformName_TianYi;
        }
        if (type == 41) {
            return enPlatformName_Meizu;
        }
        if (type == 39) {
            return enPlatformName_Sjyx;
        }
        if (type == 23) {
            return enPlatformName_JinShan;
        }
        if (type == 133) {
            return enPlatformName_AnZhiGG;
        }
        if (type == 47) {
            return enPlatformName_Sqwan;
        }
        if (type == 48) {
            return enPlatformName_JorGame;
        }
        if (type == 49) {
            return enPlatformName_Jinli;
        }
        if (type == 50) {
            return enPlatformName_Game2324;
        }
        if (type == 51) {
            return enPlatformName_FiveOne;
        }
        if (type == 52) {
            return enPlatformName_Mumayi;
        }
        if (type == 57) {
            return enPlatformName_Vivo;
        }
        if (type == 59) {
            return enPlatformName_MengChengHuDong;
        }
        if (type == 55) {
            return enPlatformName_YouaiThai;
        }
        if (type == 56) {
            return enPlatformName_YouaiGGWS;
        }
        if (type == 58) {
            return enPlatformName_YouaiGGTop;
        }
        if (type == 62) {
            return enPlatformName_YouaiGGZH;
        }
        if (type == 63) {
            return enPlatformName_YouaiGGENG;
        }
        if (type == 64) {
            return enPlatformName_YouaiGGKO;
        }
        if (type == 54) {
            return enPlatformName_YouaiGGXMT;
        }
        if (type == 61) {
            return enPlatformName_YouaiEloveGame;
        }
        if (type == 66) {
            return enPlatformName_Amazon;
        }
        if (type == 67) {
            return enPlatformName_YouaiCoolpay;
        }
        if (type == 74) {
            return enPlatformName_Shuizhu;
        }
        if (type == 73) {
            return enPlatformName_Qitian;
        }
        if (type == 60) {
            return enPlatformName_Openqq;
        }
        if (type == 77) {
            return enPlatformName_Nduo2;
        }
        if (type != 78) {
            return "Android_unkown";
        }
        return enPlatformName_YouLong;
    }

    public static int readGameInfoPlatformType(String str, int dfault) {
        if (str != null) {
            if (str.equals("1")) {
                return 1;
            }
            if (str.equals(Consts.BITYPE_UPDATE)) {
                return 2;
            }
            if (str.equals("20")) {
                return 20;
            }
            if (str.equals("21")) {
                return 21;
            }
            if (str.equals("14")) {
                return 14;
            }
            if (str.equals("22")) {
                return 22;
            }
            if ("enPlatform_WanDouJia".equals(str)) {
                return 6;
            }
            return dfault;
        }
        return dfault;
    }

    public static int readGameInfoUsePlatformSdkType(String str, int platform_type, int dfault) {
        int value = dfault;
        try {
            value = Integer.parseInt(str);
        } catch (NumberFormatException e) {
        }
        return (platform_type != 1 || value < 0 || value > 1) ? dfault : value;
    }
}
