package com.youai.sdks.beans;

/* JADX INFO: loaded from: classes.dex */
public class PlatformContacts {
    public static final int PLATFORM_INIT_FAILED = 0;
    public static final int PLATFORM_INIT_SUCCESS = 1;

    public enum LoginState {
        Login_Not,
        Login_Success,
        Login_CheckToken,
        Login_Guest,
        Login_Error,
        Login_Cancel;

        /* JADX INFO: renamed from: values, reason: to resolve conflict with enum method */
        public static LoginState[] valuesCustom() {
            LoginState[] loginStateArrValuesCustom = values();
            int length = loginStateArrValuesCustom.length;
            LoginState[] loginStateArr = new LoginState[length];
            System.arraycopy(loginStateArrValuesCustom, 0, loginStateArr, 0, length);
            return loginStateArr;
        }
    }

    public enum PayState {
        Pay_Failure,
        Pay_Success,
        Pay_Cancel,
        Pay_Asyn_Sms_Sent,
        Pay_Request_Submitted;

        /* JADX INFO: renamed from: values, reason: to resolve conflict with enum method */
        public static PayState[] valuesCustom() {
            PayState[] payStateArrValuesCustom = values();
            int length = payStateArrValuesCustom.length;
            PayState[] payStateArr = new PayState[length];
            System.arraycopy(payStateArrValuesCustom, 0, payStateArr, 0, length);
            return payStateArr;
        }
    }

    public enum ScreenOrientation {
        SCREEN_ORIENTATION_PORTRAIT,
        SCREEN_ORIENTATION_LANDSCAPE,
        SCREEN_ORIENTATION_AUTO;

        /* JADX INFO: renamed from: values, reason: to resolve conflict with enum method */
        public static ScreenOrientation[] valuesCustom() {
            ScreenOrientation[] screenOrientationArrValuesCustom = values();
            int length = screenOrientationArrValuesCustom.length;
            ScreenOrientation[] screenOrientationArr = new ScreenOrientation[length];
            System.arraycopy(screenOrientationArrValuesCustom, 0, screenOrientationArr, 0, length);
            return screenOrientationArr;
        }
    }

    public enum SwitchAccount {
        USER_SWITCH_ACCOUNT,
        USER_SWITCH_ACCOUNT_RESTART,
        USER_SWITCH_ACCOUNT_SUCCESS,
        USER_SWITCH_ACCOUNT_CANCEL;

        /* JADX INFO: renamed from: values, reason: to resolve conflict with enum method */
        public static SwitchAccount[] valuesCustom() {
            SwitchAccount[] switchAccountArrValuesCustom = values();
            int length = switchAccountArrValuesCustom.length;
            SwitchAccount[] switchAccountArr = new SwitchAccount[length];
            System.arraycopy(switchAccountArrValuesCustom, 0, switchAccountArr, 0, length);
            return switchAccountArr;
        }
    }

    public class Platforms {
        public static final int Platform2Funfun_T = 92;
        public static final int Platform2Funfun_Y = 91;
        public static final int Platform360 = 3;
        public static final int Platform49App = 10;
        public static final int Platform91 = 1;
        public static final int PlatformAbroad = 100;
        public static final int PlatformAnZhi = 13;
        public static final int PlatformAnZhiGG = 133;
        public static final int PlatformBDYD = 82;
        public static final int PlatformBaiDuGame = 24;
        public static final int PlatformBaiDuMobileGame = 33;
        public static final int PlatformBaiduDuoKu = 7;
        public static final int PlatformBaofeng = 86;
        public static final int PlatformCMGE = 34;
        public static final int PlatformChukong = 27;
        public static final int PlatformCoolpay = 67;
        public static final int PlatformDangLe = 4;
        public static final int PlatformDefault = 0;
        public static final int PlatformDoudou = 89;
        public static final int PlatformEfun = 90;
        public static final int PlatformFeiLiu = 68;
        public static final int PlatformFiveOne = 51;
        public static final int PlatformGTV = 29;
        public static final int PlatformGame2324 = 50;
        public static final int PlatformGame4399 = 16;
        public static final int PlatformHTC = 65;
        public static final int PlatformHuaWei = 31;
        public static final int PlatformItools = 80;
        public static final int PlatformJifeng = 69;
        public static final int PlatformJinShan = 23;
        public static final int PlatformJinli = 49;
        public static final int PlatformKeke = 43;
        public static final int PlatformKuGou = 30;
        public static final int PlatformKuWo = 10;
        public static final int PlatformLenoq = 44;
        public static final int PlatformLenovo = 18;
        public static final int PlatformLenovoHZW = 37;
        public static final int PlatformLoq = 0;
        public static final int PlatformLvDouGame = 25;
        public static final int PlatformMZW = 102;
        public static final int PlatformMeizu = 41;
        public static final int PlatformMengChengHuDong = 59;
        public static final int PlatformMumayi = 52;
        public static final int PlatformMycard = 101;
        public static final int PlatformNduo = 38;
        public static final int PlatformNduoHZW = 93;
        public static final int PlatformOpenqq = 81;
        public static final int PlatformOppo = 26;
        public static final int PlatformOupeng = 40;
        public static final int PlatformOupg = 0;
        public static final int PlatformPPS = 83;
        public static final int PlatformPPTV = 85;
        public static final int PlatformPipaw = 36;
        public static final int PlatformPuidLogin = -1;
        public static final int PlatformQitian = 73;
        public static final int PlatformRGame = 88;
        public static final int PlatformRR = 0;
        public static final int PlatformRenren = 14;
        public static final int PlatformShuizhu = 74;
        public static final int PlatformSina = 15;
        public static final int PlatformSjyx = 39;
        public static final int PlatformSouGou = 32;
        public static final int PlatformSqw = 47;
        public static final int PlatformSqwMzHZW = 94;
        public static final int PlatformSqwan = 42;
        public static final int PlatformTencent_QQGame = 21;
        public static final int PlatformTencent_WeChat = 20;
        public static final int PlatformThirdLogin = 22;
        public static final int PlatformTianYi = 46;
        public static final int PlatformUC = 2;
        public static final int PlatformUnicom = 45;
        public static final int PlatformVivo = 57;
        public static final int PlatformWanDouJia = 6;
        public static final int PlatformXiaoMi = 5;
        public static final int PlatformXunLei = 28;
        public static final int PlatformYDMM = 35;
        public static final int PlatformYLYX = 64;
        public static final int PlatformYingYongHui = 17;
        public static final int PlatformYouai = 111;
        public static final int PlatformYouaiEloveGame = 61;
        public static final int PlatformYouaiGGFT = 53;
        public static final int PlatformYouaiGGTop = 58;
        public static final int PlatformYouaiGGWS = 56;
        public static final int PlatformYouaiGGXMT = 54;
        public static final int PlatformYouaiGGZH = 62;
        public static final int PlatformYouaiThai = 55;
        public static final int PlatformYouaiYingYu = 63;
        public static final int PlatformYouku = 84;
        public static final int PlatformZhuoran = 48;
        public static final int Platformanzhi = 11;
        public static final int Platformgame4399 = 9;
        public static final int Platformgionee = 8;
        public static final int Platformkingsoft = 107;
        public static final int Platformkupai = 75;
        public static final int Platformsqww = 12;

        public Platforms() {
        }
    }
}
