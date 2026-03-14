.class public Lcom/youai/PlatformAndGameInfo;
.super Ljava/lang/Object;
.source "PlatformAndGameInfo.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/youai/PlatformAndGameInfo$ShareInfo;,
        Lcom/youai/PlatformAndGameInfo$PayInfo;,
        Lcom/youai/PlatformAndGameInfo$VersionInfo;,
        Lcom/youai/PlatformAndGameInfo$LoginInfo;,
        Lcom/youai/PlatformAndGameInfo$GameInfo;
    }
.end annotation


# static fields
.field public static final DoNotSupportUpdate:I = 0x0

.field public static final SupportUpdateCheck:I = 0x1

.field public static final SupportUpdateCheckAndDownload:I = 0x2

.field public static final enDebugMode_Debug:I = 0x2

.field public static final enDebugMode_Release:I = 0x1

.field public static final enLoginResult_Failed:I = 0x1

.field public static final enLoginResult_Success:I = 0x0

.field public static final enPlatformName_360:Ljava/lang/String; = "Android_360"

.field public static final enPlatformName_91:Ljava/lang/String; = "Android_91"

.field public static final enPlatformName_Amazon:Ljava/lang/String; = "Android_Amazon"

.field public static final enPlatformName_AnZhi:Ljava/lang/String; = "Android_AnZhi"

.field public static final enPlatformName_AnZhiGG:Ljava/lang/String; = "Android_AnZhiGG"

.field public static final enPlatformName_AndroidMarket91:Ljava/lang/String; = "Android_AndroidMarket91"

.field public static final enPlatformName_BaiDuGame:Ljava/lang/String; = "Android_BaiDuGame"

.field public static final enPlatformName_BaiDuMobileGame:Ljava/lang/String; = "Android_BaiDuMobile"

.field public static final enPlatformName_BaiduAppCenter:Ljava/lang/String; = "Android_BaiduAppCenter"

.field public static final enPlatformName_BaiduDuoKu:Ljava/lang/String; = "Android_BaiduDuoKu"

.field public static final enPlatformName_CMGE:Ljava/lang/String; = "Android_CMGE"

.field public static final enPlatformName_ChuKong:Ljava/lang/String; = "Android_ChuKong"

.field public static final enPlatformName_DangLe:Ljava/lang/String; = "Android_DangLe"

.field public static final enPlatformName_Default:Ljava/lang/String; = "Android_Default"

.field public static final enPlatformName_FeiLiu:Ljava/lang/String; = "Android_FeiLiu"

.field public static final enPlatformName_FiveOne:Ljava/lang/String; = "Android_51"

.field public static final enPlatformName_GTV:Ljava/lang/String; = "Android_GTV"

.field public static final enPlatformName_Game2324:Ljava/lang/String; = "Android_2324"

.field public static final enPlatformName_Game4399:Ljava/lang/String; = "Android_Game4399"

.field public static final enPlatformName_HuaWei:Ljava/lang/String; = "Android_HuaWei"

.field public static final enPlatformName_JiFeng:Ljava/lang/String; = "Android_JiFeng"

.field public static final enPlatformName_JinShan:Ljava/lang/String; = "Android_JinShan"

.field public static final enPlatformName_Jinli:Ljava/lang/String; = "Android_Jinli"

.field public static final enPlatformName_JorGame:Ljava/lang/String; = "Android_Zhuoran"

.field public static final enPlatformName_Keke:Ljava/lang/String; = "Android_Keke"

.field public static final enPlatformName_KuGou:Ljava/lang/String; = "Android_KuGou"

.field public static final enPlatformName_KuWo:Ljava/lang/String; = "Android_KuWo"

.field public static final enPlatformName_Lenoq:Ljava/lang/String; = "Android_YouaiLenoq"

.field public static final enPlatformName_Lenovo:Ljava/lang/String; = "Android_YouaiLenov"

.field public static final enPlatformName_LvDouGame:Ljava/lang/String; = "Android_LvDouGame"

.field public static final enPlatformName_Meizu:Ljava/lang/String; = "Android_YouaiMeizu"

.field public static final enPlatformName_MengChengHuDong:Ljava/lang/String; = "Android_MengChengHuDong"

.field public static final enPlatformName_Mumayi:Ljava/lang/String; = "Android_Mumayi"

.field public static final enPlatformName_Nduo:Ljava/lang/String; = "Android_YouaiNduoa"

.field public static final enPlatformName_Nduo2:Ljava/lang/String; = "Android_Nduo2"

.field public static final enPlatformName_Openqq:Ljava/lang/String; = "Android_Openqq"

.field public static final enPlatformName_Oppo:Ljava/lang/String; = "Android_Oppo"

.field public static final enPlatformName_Oupeng:Ljava/lang/String; = "Android_OuPeng"

.field public static final enPlatformName_Pipaw:Ljava/lang/String; = "Android_PiPaw"

.field public static final enPlatformName_PuidLogin:Ljava/lang/String; = "PuidLogin"

.field public static final enPlatformName_Qitian:Ljava/lang/String; = "Android_Qitian"

.field public static final enPlatformName_RenRen:Ljava/lang/String; = "Android_RenRen"

.field public static final enPlatformName_Shuizhu:Ljava/lang/String; = "Android_8868"

.field public static final enPlatformName_Sina:Ljava/lang/String; = "Android_Sina"

.field public static final enPlatformName_Sjyx:Ljava/lang/String; = "Android_Sjyx"

.field public static final enPlatformName_SouGou:Ljava/lang/String; = "Android_SouGou"

.field public static final enPlatformName_Sqw:Ljava/lang/String; = "Android_37wan"

.field public static final enPlatformName_Sqwan:Ljava/lang/String; = "Android_37ww"

.field public static final enPlatformName_ThirdLogin:Ljava/lang/String; = "Android_ThirdLogin"

.field public static final enPlatformName_TianYi:Ljava/lang/String; = "Android_Youai189wo"

.field public static final enPlatformName_UC:Ljava/lang/String; = "Android_UC"

.field public static final enPlatformName_Unicom:Ljava/lang/String; = "Android_YouaiUnico"

.field public static final enPlatformName_Vivo:Ljava/lang/String; = "Android_Vivo"

.field public static final enPlatformName_WanDouJia:Ljava/lang/String; = "Android_WanDouJia"

.field public static final enPlatformName_XiaoMi:Ljava/lang/String; = "Android_XiaoMi"

.field public static final enPlatformName_XunLei:Ljava/lang/String; = "Android_XunLei"

.field public static final enPlatformName_YDMM:Ljava/lang/String; = "Android_YouaiYdmm"

.field public static final enPlatformName_YingYongHui:Ljava/lang/String; = "Android_YingYongHui"

.field public static final enPlatformName_YouLong:Ljava/lang/String; = "Android_YouLong"

.field public static final enPlatformName_Youai:Ljava/lang/String; = "Android_Youai"

.field public static final enPlatformName_YouaiCoolpay:Ljava/lang/String; = "Android_Coolpay"

.field public static final enPlatformName_YouaiEloveGame:Ljava/lang/String; = "Android_EloveGame"

.field public static final enPlatformName_YouaiGGENG:Ljava/lang/String; = "Android_YouaiYingYu"

.field public static final enPlatformName_YouaiGGFT:Ljava/lang/String; = "Android_YouaiGGTW"

.field public static final enPlatformName_YouaiGGKO:Ljava/lang/String; = "Android_Youaikorean"

.field public static final enPlatformName_YouaiGGTop:Ljava/lang/String; = "Android_YouaiGGTop"

.field public static final enPlatformName_YouaiGGWS:Ljava/lang/String; = "Android_YouaiGGWS"

.field public static final enPlatformName_YouaiGGXMT:Ljava/lang/String; = "Android_YouaiGGXMT"

.field public static final enPlatformName_YouaiGGZH:Ljava/lang/String; = "Android_YouaiGGZH"

.field public static final enPlatformName_YouaiThai:Ljava/lang/String; = "Android_YouaiThai"

.field public static final enPlatformShort_360:Ljava/lang/String; = "360_"

.field public static final enPlatformShort_91:Ljava/lang/String; = "91_"

.field public static final enPlatformShort_Amazon:Ljava/lang/String; = "amazon_"

.field public static final enPlatformShort_AnZhi:Ljava/lang/String; = "az_"

.field public static final enPlatformShort_AnZhiGG:Ljava/lang/String; = "azgg_"

.field public static final enPlatformShort_AndroidMarket91:Ljava/lang/String; = "m91_"

.field public static final enPlatformShort_BaiDuGame:Ljava/lang/String; = "bdgm_"

.field public static final enPlatformShort_BaiDuMobileGame:Ljava/lang/String; = "bdmg_"

.field public static final enPlatformShort_BaiduAppCenter:Ljava/lang/String; = "bdac_"

.field public static final enPlatformShort_BaiduDuoKu:Ljava/lang/String; = "bddk_"

.field public static final enPlatformShort_CMGE:Ljava/lang/String; = "cmge_"

.field public static final enPlatformShort_ChuKong:Ljava/lang/String; = "ck_"

.field public static final enPlatformShort_DangLe:Ljava/lang/String; = "dl_"

.field public static final enPlatformShort_Default:Ljava/lang/String; = "default_"

.field public static final enPlatformShort_FeiLiu:Ljava/lang/String; = "fl_"

.field public static final enPlatformShort_FiveOne:Ljava/lang/String; = "51_"

.field public static final enPlatformShort_GTV:Ljava/lang/String; = "gtv_"

.field public static final enPlatformShort_Game2324:Ljava/lang/String; = "2324_"

.field public static final enPlatformShort_Game4399:Ljava/lang/String; = "4399_"

.field public static final enPlatformShort_HuaWei:Ljava/lang/String; = "hw_"

.field public static final enPlatformShort_JiFeng:Ljava/lang/String; = "jf_"

.field public static final enPlatformShort_JinShan:Ljava/lang/String; = "js_"

.field public static final enPlatformShort_Jinli:Ljava/lang/String; = "jl_"

.field public static final enPlatformShort_JorGame:Ljava/lang/String; = "zhuoran_"

.field public static final enPlatformShort_Keke:Ljava/lang/String; = "keke_"

.field public static final enPlatformShort_KuGou:Ljava/lang/String; = "kg_"

.field public static final enPlatformShort_KuWo:Ljava/lang/String; = "kuwo_"

.field public static final enPlatformShort_Lenoq:Ljava/lang/String; = "lenoq_"

.field public static final enPlatformShort_Lenovo:Ljava/lang/String; = "lenovo_"

.field public static final enPlatformShort_LvDou:Ljava/lang/String; = "ld_"

.field public static final enPlatformShort_Meizu:Ljava/lang/String; = "meizu_"

.field public static final enPlatformShort_MengChengHuDong:Ljava/lang/String; = "mchd_"

.field public static final enPlatformShort_Mumayi:Ljava/lang/String; = "mumayi_"

.field public static final enPlatformShort_Nduo:Ljava/lang/String; = "nduo_"

.field public static final enPlatformShort_Nduo2:Ljava/lang/String; = "nduo2_"

.field public static final enPlatformShort_OpenQq:Ljava/lang/String; = "openqq_"

.field public static final enPlatformShort_Oppo:Ljava/lang/String; = "oppo_"

.field public static final enPlatformShort_Oupeng:Ljava/lang/String; = "oupeng_"

.field public static final enPlatformShort_Pipaw:Ljava/lang/String; = "pipaw_"

.field public static final enPlatformShort_PuidLogin:Ljava/lang/String; = "puidlogin_"

.field public static final enPlatformShort_Qitian:Ljava/lang/String; = "qitian_"

.field public static final enPlatformShort_RenRen:Ljava/lang/String; = "rr_"

.field public static final enPlatformShort_Shuizhu:Ljava/lang/String; = "8868_"

.field public static final enPlatformShort_Sina:Ljava/lang/String; = "sina_"

.field public static final enPlatformShort_Sjyx:Ljava/lang/String; = "sjyx_"

.field public static final enPlatformShort_SouGou:Ljava/lang/String; = "sg_"

.field public static final enPlatformShort_Sqw:Ljava/lang/String; = "37wan_"

.field public static final enPlatformShort_Sqwan:Ljava/lang/String; = "37ww_"

.field public static final enPlatformShort_ThirdLogin:Ljava/lang/String; = "thl_"

.field public static final enPlatformShort_UC:Ljava/lang/String; = "uc_"

.field public static final enPlatformShort_Unicom:Ljava/lang/String; = "unicom_"

.field public static final enPlatformShort_Vivo:Ljava/lang/String; = "vivo_"

.field public static final enPlatformShort_WanDouJia:Ljava/lang/String; = "wdj_"

.field public static final enPlatformShort_XiaoMi:Ljava/lang/String; = "xm_"

.field public static final enPlatformShort_XunLei:Ljava/lang/String; = "xl_"

.field public static final enPlatformShort_YDMM:Ljava/lang/String; = "ydmm_"

.field public static final enPlatformShort_YingYongHui:Ljava/lang/String; = "yyh_"

.field public static final enPlatformShort_YouLong:Ljava/lang/String; = "yl_"

.field public static final enPlatformShort_Youai:Ljava/lang/String; = "ya_"

.field public static final enPlatformShort_YouaiCoolpay:Ljava/lang/String; = "coolpay_"

.field public static final enPlatformShort_YouaiEloveGame:Ljava/lang/String; = "elovegame_"

.field public static final enPlatform_360:I = 0x3

.field public static final enPlatform_91:I = 0x1

.field public static final enPlatform_Amazon:I = 0x42

.field public static final enPlatform_AnZhi:I = 0xd

.field public static final enPlatform_AnZhiGG:I = 0x85

.field public static final enPlatform_AndroidMarket91:I = 0x9

.field public static final enPlatform_BaiDuGame:I = 0x18

.field public static final enPlatform_BaiDuMobileGame:I = 0x21

.field public static final enPlatform_BaiduAppCenter:I = 0x8

.field public static final enPlatform_BaiduDuoKu:I = 0x7

.field public static final enPlatform_CMGE:I = 0x22

.field public static final enPlatform_ChuKong:I = 0x1b

.field public static final enPlatform_DangLe:I = 0x4

.field public static final enPlatform_Default:I = 0x0

.field public static final enPlatform_FeiLiu:I = 0xb

.field public static final enPlatform_FiveOne:I = 0x33

.field public static final enPlatform_GTV:I = 0x1d

.field public static final enPlatform_Game2324:I = 0x32

.field public static final enPlatform_Game4399:I = 0x10

.field public static final enPlatform_HuaWei:I = 0x1f

.field public static final enPlatform_JiFeng:I = 0xc

.field public static final enPlatform_JinShan:I = 0x17

.field public static final enPlatform_Jinli:I = 0x31

.field public static final enPlatform_JorGame:I = 0x30

.field public static final enPlatform_Keke:I = 0x2b

.field public static final enPlatform_KuGou:I = 0x1e

.field public static final enPlatform_KuWo:I = 0xa

.field public static final enPlatform_Lenoq:I = 0x2c

.field public static final enPlatform_Lenovo:I = 0x25

.field public static final enPlatform_LvDouGame:I = 0x19

.field public static final enPlatform_Meizu:I = 0x29

.field public static final enPlatform_MengChengHuDong:I = 0x3b

.field public static final enPlatform_Mumayi:I = 0x34

.field public static final enPlatform_Nduo:I = 0x26

.field public static final enPlatform_Nduo2:I = 0x4d

.field public static final enPlatform_Openqq:I = 0x3c

.field public static final enPlatform_Oppo:I = 0x1a

.field public static final enPlatform_Oupeng:I = 0x28

.field public static final enPlatform_Pipaw:I = 0x24

.field public static final enPlatform_PuidLogin:I = -0x1

.field public static final enPlatform_Qitian:I = 0x49

.field public static final enPlatform_RenRen:I = 0xe

.field public static final enPlatform_Shuizhu:I = 0x4a

.field public static final enPlatform_Sina:I = 0xf

.field public static final enPlatform_Sjyx:I = 0x27

.field public static final enPlatform_SouGou:I = 0x20

.field public static final enPlatform_Sqw:I = 0x2f

.field public static final enPlatform_Sqwan:I = 0x2a

.field public static final enPlatform_Tencent_QQGame:I = 0x15

.field public static final enPlatform_Tencent_WeChat:I = 0x14

.field public static final enPlatform_ThirdLogin:I = 0x16

.field public static final enPlatform_TianYi:I = 0x2e

.field public static final enPlatform_UC:I = 0x2

.field public static final enPlatform_Unicom:I = 0x2d

.field public static final enPlatform_Vivo:I = 0x39

.field public static final enPlatform_WanDouJia:I = 0x6

.field public static final enPlatform_XiaoMi:I = 0x5

.field public static final enPlatform_XunLei:I = 0x1c

.field public static final enPlatform_Ydmm:I = 0x23

.field public static final enPlatform_YingYongHui:I = 0x11

.field public static final enPlatform_YouLong:I = 0x4e

.field public static final enPlatform_Youai:I = 0x6f

.field public static final enPlatform_YouaiCooplay:I = 0x43

.field public static final enPlatform_YouaiEloveGame:I = 0x3d

.field public static final enPlatform_YouaiGGEng:I = 0x3f

.field public static final enPlatform_YouaiGGFT:I = 0x35

.field public static final enPlatform_YouaiGGKO:I = 0x40

.field public static final enPlatform_YouaiGGTop:I = 0x3a

.field public static final enPlatform_YouaiGGWS:I = 0x38

.field public static final enPlatform_YouaiGGXMT:I = 0x36

.field public static final enPlatform_YouaiGGZH:I = 0x3e

.field public static final enPlatform_YouaiThai:I = 0x37

.field public static final enScreenOrientation_Landscape:I = 0x2

.field public static final enScreenOrientation_Portrait:I = 0x1

.field public static final enUpdateInfo_Force:I = 0x2

.field public static final enUpdateInfo_No:I = 0x0

.field public static final enUpdateInfo_Suggest:I = 0x1


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 10
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 511
    return-void
.end method

.method public static getPlatformTypeStr(I)Ljava/lang/String;
    .locals 2
    .param p0, "type"    # I

    .prologue
    .line 265
    const-string v0, "Android_unkown"

    .line 267
    .local v0, "ret":Ljava/lang/String;
    const/4 v1, 0x1

    if-ne p0, v1, :cond_1

    .line 268
    const-string v0, "Android_91"

    .line 402
    :cond_0
    :goto_0
    return-object v0

    .line 269
    :cond_1
    const/4 v1, 0x2

    if-ne p0, v1, :cond_2

    .line 270
    const-string v0, "Android_UC"

    goto :goto_0

    .line 271
    :cond_2
    const/4 v1, 0x3

    if-ne p0, v1, :cond_3

    .line 272
    const-string v0, "Android_360"

    goto :goto_0

    .line 273
    :cond_3
    const/4 v1, 0x4

    if-ne p0, v1, :cond_4

    .line 274
    const-string v0, "Android_DangLe"

    goto :goto_0

    .line 275
    :cond_4
    const/4 v1, 0x5

    if-ne p0, v1, :cond_5

    .line 276
    const-string v0, "Android_XiaoMi"

    goto :goto_0

    .line 277
    :cond_5
    const/4 v1, 0x6

    if-ne p0, v1, :cond_6

    .line 278
    const-string v0, "Android_WanDouJia"

    goto :goto_0

    .line 279
    :cond_6
    const/4 v1, 0x7

    if-ne p0, v1, :cond_7

    .line 280
    const-string v0, "Android_BaiduDuoKu"

    goto :goto_0

    .line 281
    :cond_7
    const/16 v1, 0x8

    if-ne p0, v1, :cond_8

    .line 282
    const-string v0, "Android_BaiduAppCenter"

    goto :goto_0

    .line 283
    :cond_8
    const/16 v1, 0x9

    if-ne p0, v1, :cond_9

    .line 284
    const-string v0, "Android_AndroidMarket91"

    goto :goto_0

    .line 285
    :cond_9
    const/16 v1, 0xa

    if-ne p0, v1, :cond_a

    .line 286
    const-string v0, "Android_KuWo"

    goto :goto_0

    .line 287
    :cond_a
    const/16 v1, 0xb

    if-ne p0, v1, :cond_b

    .line 288
    const-string v0, "Android_FeiLiu"

    goto :goto_0

    .line 289
    :cond_b
    const/16 v1, 0xc

    if-ne p0, v1, :cond_c

    .line 290
    const-string v0, "Android_JiFeng"

    goto :goto_0

    .line 291
    :cond_c
    const/16 v1, 0xd

    if-ne p0, v1, :cond_d

    .line 292
    const-string v0, "Android_AnZhi"

    goto :goto_0

    .line 293
    :cond_d
    const/16 v1, 0xe

    if-ne p0, v1, :cond_e

    .line 294
    const-string v0, "Android_RenRen"

    goto :goto_0

    .line 295
    :cond_e
    const/16 v1, 0xf

    if-ne p0, v1, :cond_f

    .line 296
    const-string v0, "Android_Sina"

    goto :goto_0

    .line 297
    :cond_f
    const/16 v1, 0x10

    if-ne p0, v1, :cond_10

    .line 298
    const-string v0, "Android_Game4399"

    goto :goto_0

    .line 299
    :cond_10
    const/16 v1, 0x11

    if-ne p0, v1, :cond_11

    .line 300
    const-string v0, "Android_YingYongHui"

    goto :goto_0

    .line 301
    :cond_11
    const/16 v1, 0x1a

    if-ne p0, v1, :cond_12

    .line 302
    const-string v0, "Android_Oppo"

    goto :goto_0

    .line 303
    :cond_12
    const/16 v1, 0x16

    if-ne p0, v1, :cond_13

    .line 304
    const-string v0, "Android_ThirdLogin"

    goto :goto_0

    .line 305
    :cond_13
    const/16 v1, 0x6f

    if-ne p0, v1, :cond_14

    .line 306
    const-string v0, "Android_Youai"

    goto :goto_0

    .line 307
    :cond_14
    const/16 v1, 0x18

    if-ne p0, v1, :cond_15

    .line 308
    const-string v0, "Android_BaiDuGame"

    goto/16 :goto_0

    .line 309
    :cond_15
    const/16 v1, 0x19

    if-ne p0, v1, :cond_16

    .line 310
    const-string v0, "Android_LvDouGame"

    goto/16 :goto_0

    .line 311
    :cond_16
    const/16 v1, 0x1b

    if-ne p0, v1, :cond_17

    .line 312
    const-string v0, "Android_ChuKong"

    goto/16 :goto_0

    .line 313
    :cond_17
    const/16 v1, 0x1d

    if-ne p0, v1, :cond_18

    .line 314
    const-string v0, "Android_GTV"

    goto/16 :goto_0

    .line 315
    :cond_18
    const/16 v1, 0x1c

    if-ne p0, v1, :cond_19

    .line 316
    const-string v0, "Android_XunLei"

    goto/16 :goto_0

    .line 317
    :cond_19
    const/16 v1, 0x1e

    if-ne p0, v1, :cond_1a

    .line 318
    const-string v0, "Android_KuGou"

    goto/16 :goto_0

    .line 319
    :cond_1a
    const/16 v1, 0x1f

    if-ne p0, v1, :cond_1b

    .line 320
    const-string v0, "Android_HuaWei"

    goto/16 :goto_0

    .line 321
    :cond_1b
    const/16 v1, 0x20

    if-ne p0, v1, :cond_1c

    .line 322
    const-string v0, "Android_SouGou"

    goto/16 :goto_0

    .line 323
    :cond_1c
    const/16 v1, 0x21

    if-ne p0, v1, :cond_1d

    .line 324
    const-string v0, "Android_BaiDuMobile"

    goto/16 :goto_0

    .line 325
    :cond_1d
    const/16 v1, 0x22

    if-ne p0, v1, :cond_1e

    .line 326
    const-string v0, "Android_CMGE"

    goto/16 :goto_0

    .line 327
    :cond_1e
    const/16 v1, 0x24

    if-ne p0, v1, :cond_1f

    .line 328
    const-string v0, "Android_PiPaw"

    goto/16 :goto_0

    .line 329
    :cond_1f
    const/16 v1, 0x23

    if-ne p0, v1, :cond_20

    .line 330
    const-string v0, "Android_YouaiYdmm"

    goto/16 :goto_0

    .line 331
    :cond_20
    const/16 v1, 0x26

    if-ne p0, v1, :cond_21

    .line 332
    const-string v0, "Android_YouaiNduoa"

    goto/16 :goto_0

    .line 333
    :cond_21
    const/16 v1, 0x25

    if-ne p0, v1, :cond_22

    .line 334
    const-string v0, "Android_YouaiLenov"

    goto/16 :goto_0

    .line 335
    :cond_22
    const/16 v1, 0x2b

    if-ne p0, v1, :cond_23

    .line 336
    const-string v0, "Android_Keke"

    goto/16 :goto_0

    .line 337
    :cond_23
    const/16 v1, 0x2c

    if-ne p0, v1, :cond_24

    .line 338
    const-string v0, "Android_YouaiLenoq"

    goto/16 :goto_0

    .line 339
    :cond_24
    const/16 v1, 0x2d

    if-ne p0, v1, :cond_25

    .line 340
    const-string v0, "Android_YouaiUnico"

    goto/16 :goto_0

    .line 341
    :cond_25
    const/16 v1, 0x28

    if-ne p0, v1, :cond_26

    .line 342
    const-string v0, "Android_OuPeng"

    goto/16 :goto_0

    .line 343
    :cond_26
    const/16 v1, 0x2a

    if-ne p0, v1, :cond_27

    .line 344
    const-string v0, "Android_37ww"

    goto/16 :goto_0

    .line 345
    :cond_27
    const/16 v1, 0x2e

    if-ne p0, v1, :cond_28

    .line 346
    const-string v0, "Android_Youai189wo"

    goto/16 :goto_0

    .line 347
    :cond_28
    const/16 v1, 0x29

    if-ne p0, v1, :cond_29

    .line 348
    const-string v0, "Android_YouaiMeizu"

    goto/16 :goto_0

    .line 349
    :cond_29
    const/16 v1, 0x27

    if-ne p0, v1, :cond_2a

    .line 350
    const-string v0, "Android_Sjyx"

    goto/16 :goto_0

    .line 351
    :cond_2a
    const/16 v1, 0x17

    if-ne p0, v1, :cond_2b

    .line 352
    const-string v0, "Android_JinShan"

    goto/16 :goto_0

    .line 353
    :cond_2b
    const/16 v1, 0x85

    if-ne p0, v1, :cond_2c

    .line 354
    const-string v0, "Android_AnZhiGG"

    goto/16 :goto_0

    .line 355
    :cond_2c
    const/16 v1, 0x2f

    if-ne p0, v1, :cond_2d

    .line 356
    const-string v0, "Android_37ww"

    goto/16 :goto_0

    .line 357
    :cond_2d
    const/16 v1, 0x30

    if-ne p0, v1, :cond_2e

    .line 358
    const-string v0, "Android_Zhuoran"

    goto/16 :goto_0

    .line 359
    :cond_2e
    const/16 v1, 0x31

    if-ne p0, v1, :cond_2f

    .line 360
    const-string v0, "Android_Jinli"

    goto/16 :goto_0

    .line 361
    :cond_2f
    const/16 v1, 0x32

    if-ne p0, v1, :cond_30

    .line 362
    const-string v0, "Android_2324"

    goto/16 :goto_0

    .line 363
    :cond_30
    const/16 v1, 0x33

    if-ne p0, v1, :cond_31

    .line 364
    const-string v0, "Android_51"

    goto/16 :goto_0

    .line 365
    :cond_31
    const/16 v1, 0x34

    if-ne p0, v1, :cond_32

    .line 366
    const-string v0, "Android_Mumayi"

    goto/16 :goto_0

    .line 367
    :cond_32
    const/16 v1, 0x39

    if-ne p0, v1, :cond_33

    .line 368
    const-string v0, "Android_Vivo"

    goto/16 :goto_0

    .line 369
    :cond_33
    const/16 v1, 0x3b

    if-ne p0, v1, :cond_34

    .line 370
    const-string v0, "Android_MengChengHuDong"

    goto/16 :goto_0

    .line 371
    :cond_34
    const/16 v1, 0x37

    if-ne p0, v1, :cond_35

    .line 372
    const-string v0, "Android_YouaiThai"

    goto/16 :goto_0

    .line 373
    :cond_35
    const/16 v1, 0x38

    if-ne p0, v1, :cond_36

    .line 374
    const-string v0, "Android_YouaiGGWS"

    goto/16 :goto_0

    .line 375
    :cond_36
    const/16 v1, 0x3a

    if-ne p0, v1, :cond_37

    .line 376
    const-string v0, "Android_YouaiGGTop"

    goto/16 :goto_0

    .line 377
    :cond_37
    const/16 v1, 0x3e

    if-ne p0, v1, :cond_38

    .line 378
    const-string v0, "Android_YouaiGGZH"

    goto/16 :goto_0

    .line 379
    :cond_38
    const/16 v1, 0x3f

    if-ne p0, v1, :cond_39

    .line 380
    const-string v0, "Android_YouaiYingYu"

    goto/16 :goto_0

    .line 381
    :cond_39
    const/16 v1, 0x40

    if-ne p0, v1, :cond_3a

    .line 382
    const-string v0, "Android_Youaikorean"

    goto/16 :goto_0

    .line 383
    :cond_3a
    const/16 v1, 0x36

    if-ne p0, v1, :cond_3b

    .line 384
    const-string v0, "Android_YouaiGGXMT"

    goto/16 :goto_0

    .line 385
    :cond_3b
    const/16 v1, 0x3d

    if-ne p0, v1, :cond_3c

    .line 386
    const-string v0, "Android_EloveGame"

    goto/16 :goto_0

    .line 387
    :cond_3c
    const/16 v1, 0x42

    if-ne p0, v1, :cond_3d

    .line 388
    const-string v0, "Android_Amazon"

    goto/16 :goto_0

    .line 389
    :cond_3d
    const/16 v1, 0x43

    if-ne p0, v1, :cond_3e

    .line 390
    const-string v0, "Android_Coolpay"

    goto/16 :goto_0

    .line 391
    :cond_3e
    const/16 v1, 0x4a

    if-ne p0, v1, :cond_3f

    .line 392
    const-string v0, "Android_8868"

    goto/16 :goto_0

    .line 393
    :cond_3f
    const/16 v1, 0x49

    if-ne p0, v1, :cond_40

    .line 394
    const-string v0, "Android_Qitian"

    goto/16 :goto_0

    .line 395
    :cond_40
    const/16 v1, 0x3c

    if-ne p0, v1, :cond_41

    .line 396
    const-string v0, "Android_Openqq"

    goto/16 :goto_0

    .line 397
    :cond_41
    const/16 v1, 0x4d

    if-ne p0, v1, :cond_42

    .line 398
    const-string v0, "Android_Nduo2"

    goto/16 :goto_0

    .line 399
    :cond_42
    const/16 v1, 0x4e

    if-ne p0, v1, :cond_0

    .line 400
    const-string v0, "Android_YouLong"

    goto/16 :goto_0
.end method

.method public static readGameInfoPlatformType(Ljava/lang/String;I)I
    .locals 1
    .param p0, "str"    # Ljava/lang/String;
    .param p1, "dfault"    # I

    .prologue
    .line 408
    if-nez p0, :cond_1

    .line 425
    .end local p1    # "dfault":I
    :cond_0
    :goto_0
    return p1

    .line 410
    .restart local p1    # "dfault":I
    :cond_1
    const-string v0, "1"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_2

    .line 411
    const/4 p1, 0x1

    goto :goto_0

    .line 412
    :cond_2
    const-string v0, "2"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_3

    .line 413
    const/4 p1, 0x2

    goto :goto_0

    .line 414
    :cond_3
    const-string v0, "20"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_4

    .line 415
    const/16 p1, 0x14

    goto :goto_0

    .line 416
    :cond_4
    const-string v0, "21"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_5

    .line 417
    const/16 p1, 0x15

    goto :goto_0

    .line 418
    :cond_5
    const-string v0, "14"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_6

    .line 419
    const/16 p1, 0xe

    goto :goto_0

    .line 420
    :cond_6
    const-string v0, "22"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_7

    .line 421
    const/16 p1, 0x16

    goto :goto_0

    .line 422
    :cond_7
    const-string v0, "enPlatform_WanDouJia"

    invoke-virtual {v0, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 423
    const/4 p1, 0x6

    goto :goto_0
.end method

.method public static readGameInfoUsePlatformSdkType(Ljava/lang/String;II)I
    .locals 3
    .param p0, "str"    # Ljava/lang/String;
    .param p1, "platform_type"    # I
    .param p2, "dfault"    # I

    .prologue
    const/4 v2, 0x1

    .line 432
    move v0, p2

    .line 434
    .local v0, "value":I
    :try_start_0
    invoke-static {p0}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I
    :try_end_0
    .catch Ljava/lang/NumberFormatException; {:try_start_0 .. :try_end_0} :catch_0

    move-result v0

    .line 439
    :goto_0
    if-ne p1, v2, :cond_0

    .line 440
    if-ltz v0, :cond_0

    if-le v0, v2, :cond_1

    .line 445
    .end local p2    # "dfault":I
    :cond_0
    :goto_1
    return p2

    .restart local p2    # "dfault":I
    :cond_1
    move p2, v0

    .line 442
    goto :goto_1

    .line 435
    :catch_0
    move-exception v1

    goto :goto_0
.end method
