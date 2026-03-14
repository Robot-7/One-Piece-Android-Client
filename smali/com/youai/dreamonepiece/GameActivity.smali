.class public Lcom/youai/dreamonepiece/GameActivity;
.super Lorg/cocos2dx/lib/Cocos2dxActivity;
.source "GameActivity.java"

# interfaces
.implements Landroid/media/MediaPlayer$OnCompletionListener;
.implements Lcom/youai/dreamonepiece/GameInterface$IDreamOnePiece;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/youai/dreamonepiece/GameActivity$shakeLitener;
    }
.end annotation


# static fields
.field private static final TAG:Ljava/lang/String;

.field public static api:Lcom/tencent/mm/sdk/openapi/IWXAPI;

.field private static buttonStopMovie:Landroid/widget/ImageButton;

.field private static canPressBack:Z

.field static mContext:Landroid/content/Context;

.field static mGameApp:Lcom/youai/dreamonepiece/GameActivity;

.field static mHandler:Landroid/os/Handler;

.field private static videoWorldView:Lcom/youai/WorldVideoView;

.field public static weChatHave:Z


# instance fields
.field protected mGameCfg:Lcom/youai/dreamonepiece/GameConfig;

.field private mGameContextStateHandler:Landroid/os/Handler;

.field private mHaveEnteredGameAppState:Z

.field private mLastMenuKeyDownTimeMillis:J

.field protected mPlatform:Lcom/youai/IPlatformLoginAndPay;

.field private mRecentPressMenuKeyDownCount:J

.field private mShakeListener:Lcom/youai/ShakeLisenter;

.field private mStateMgr:Lcom/youai/IStateManager;

.field private mVersionResult:Lcom/youai/PlatformAndGameInfo$VersionInfo;

.field private updateApk:Lcom/youai/dreamonepiece/DownloadApk;

.field private videoWorldViewPause:Z


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 74
    const-string v0, "DreamOnePiece"

    invoke-static {v0}, Ljava/lang/System;->loadLibrary(Ljava/lang/String;)V

    .line 79
    const-class v0, Lcom/youai/dreamonepiece/GameActivity;

    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/youai/dreamonepiece/GameActivity;->TAG:Ljava/lang/String;

    .line 99
    const/4 v0, 0x1

    sput-boolean v0, Lcom/youai/dreamonepiece/GameActivity;->canPressBack:Z

    .line 100
    const/4 v0, 0x0

    sput-boolean v0, Lcom/youai/dreamonepiece/GameActivity;->weChatHave:Z

    return-void
.end method

.method public constructor <init>()V
    .locals 6

    .prologue
    const-wide/16 v4, 0x0

    const/4 v3, 0x0

    const/4 v2, 0x0

    .line 68
    invoke-direct {p0}, Lorg/cocos2dx/lib/Cocos2dxActivity;-><init>()V

    .line 82
    iput-object v2, p0, Lcom/youai/dreamonepiece/GameActivity;->mGameCfg:Lcom/youai/dreamonepiece/GameConfig;

    .line 83
    new-instance v0, Lcom/youai/dreamonepiece/GameStateManager;

    const/4 v1, 0x7

    invoke-direct {v0, v1, p0}, Lcom/youai/dreamonepiece/GameStateManager;-><init>(ILcom/youai/dreamonepiece/GameInterface$IDreamOnePiece;)V

    iput-object v0, p0, Lcom/youai/dreamonepiece/GameActivity;->mStateMgr:Lcom/youai/IStateManager;

    .line 85
    iput-object v2, p0, Lcom/youai/dreamonepiece/GameActivity;->mPlatform:Lcom/youai/IPlatformLoginAndPay;

    .line 89
    iput-wide v4, p0, Lcom/youai/dreamonepiece/GameActivity;->mLastMenuKeyDownTimeMillis:J

    .line 90
    iput-wide v4, p0, Lcom/youai/dreamonepiece/GameActivity;->mRecentPressMenuKeyDownCount:J

    .line 92
    iput-boolean v3, p0, Lcom/youai/dreamonepiece/GameActivity;->mHaveEnteredGameAppState:Z

    .line 96
    iput-object v2, p0, Lcom/youai/dreamonepiece/GameActivity;->mShakeListener:Lcom/youai/ShakeLisenter;

    .line 97
    iput-boolean v3, p0, Lcom/youai/dreamonepiece/GameActivity;->videoWorldViewPause:Z

    .line 1259
    return-void
.end method

.method static synthetic access$100()Ljava/lang/String;
    .locals 1

    .prologue
    .line 68
    sget-object v0, Lcom/youai/dreamonepiece/GameActivity;->TAG:Ljava/lang/String;

    return-object v0
.end method

.method static synthetic access$200()Lcom/youai/WorldVideoView;
    .locals 1

    .prologue
    .line 68
    sget-object v0, Lcom/youai/dreamonepiece/GameActivity;->videoWorldView:Lcom/youai/WorldVideoView;

    return-object v0
.end method

.method static synthetic access$202(Lcom/youai/WorldVideoView;)Lcom/youai/WorldVideoView;
    .locals 0
    .param p0, "x0"    # Lcom/youai/WorldVideoView;

    .prologue
    .line 68
    sput-object p0, Lcom/youai/dreamonepiece/GameActivity;->videoWorldView:Lcom/youai/WorldVideoView;

    return-object p0
.end method

.method static synthetic access$300()Landroid/widget/ImageButton;
    .locals 1

    .prologue
    .line 68
    sget-object v0, Lcom/youai/dreamonepiece/GameActivity;->buttonStopMovie:Landroid/widget/ImageButton;

    return-object v0
.end method

.method static synthetic access$302(Landroid/widget/ImageButton;)Landroid/widget/ImageButton;
    .locals 0
    .param p0, "x0"    # Landroid/widget/ImageButton;

    .prologue
    .line 68
    sput-object p0, Lcom/youai/dreamonepiece/GameActivity;->buttonStopMovie:Landroid/widget/ImageButton;

    return-object p0
.end method

.method public static callPlatformBindUser()V
    .locals 1

    .prologue
    .line 1232
    sget-object v0, Lcom/youai/dreamonepiece/GameActivity;->mGameApp:Lcom/youai/dreamonepiece/GameActivity;

    invoke-virtual {v0}, Lcom/youai/dreamonepiece/GameActivity;->getPlatformSDK()Lcom/youai/IPlatformLoginAndPay;

    move-result-object v0

    invoke-interface {v0}, Lcom/youai/IPlatformLoginAndPay;->callBindTryToOkUser()V

    .line 1233
    return-void
.end method

.method public static callToolBar(Z)V
    .locals 3
    .param p0, "visible"    # Z

    .prologue
    .line 137
    new-instance v1, Landroid/os/Message;

    invoke-direct {v1}, Landroid/os/Message;-><init>()V

    .line 138
    .local v1, "msg":Landroid/os/Message;
    new-instance v0, Landroid/os/Bundle;

    invoke-direct {v0}, Landroid/os/Bundle;-><init>()V

    .line 139
    .local v0, "bundle":Landroid/os/Bundle;
    const-string v2, "ToolBar"

    invoke-virtual {v0, v2, p0}, Landroid/os/Bundle;->putBoolean(Ljava/lang/String;Z)V

    .line 142
    invoke-virtual {v1, v0}, Landroid/os/Message;->setData(Landroid/os/Bundle;)V

    .line 143
    const/16 v2, 0x1e

    iput v2, v1, Landroid/os/Message;->what:I

    .line 144
    sget-object v2, Lcom/youai/dreamonepiece/GameActivity;->mGameApp:Lcom/youai/dreamonepiece/GameActivity;

    iget-object v2, v2, Lcom/youai/dreamonepiece/GameActivity;->mGameAppStateHandler:Landroid/os/Handler;

    invoke-virtual {v2, v1}, Landroid/os/Handler;->sendMessage(Landroid/os/Message;)Z

    .line 146
    return-void
.end method

.method public static getMobileNetISP()I
    .locals 4

    .prologue
    .line 125
    sget-object v1, Lcom/youai/dreamonepiece/GameActivity;->mContext:Landroid/content/Context;

    invoke-static {v1}, Lcom/youai/NetworkUtil;->getMobileNetISP(Landroid/content/Context;)I

    move-result v0

    .line 126
    .local v0, "isp":I
    sget-object v1, Lcom/youai/dreamonepiece/GameActivity;->TAG:Ljava/lang/String;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "getMobileNetISP:"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 127
    return v0
.end method

.method public static getMobileNetType()I
    .locals 4

    .prologue
    .line 118
    sget-object v1, Lcom/youai/dreamonepiece/GameActivity;->mContext:Landroid/content/Context;

    invoke-static {v1}, Lcom/youai/NetworkUtil;->getMobileNetType(Landroid/content/Context;)I

    move-result v0

    .line 119
    .local v0, "type":I
    sget-object v1, Lcom/youai/dreamonepiece/GameActivity;->TAG:Ljava/lang/String;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "getMobileNetType:"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 120
    return v0
.end method

.method public static isCanPressBack()Z
    .locals 1

    .prologue
    .line 1236
    sget-boolean v0, Lcom/youai/dreamonepiece/GameActivity;->canPressBack:Z

    return v0
.end method

.method public static isPlatformTryUser()Z
    .locals 1

    .prologue
    .line 1225
    sget-object v0, Lcom/youai/dreamonepiece/GameActivity;->mGameApp:Lcom/youai/dreamonepiece/GameActivity;

    invoke-virtual {v0}, Lcom/youai/dreamonepiece/GameActivity;->getPlatformSDK()Lcom/youai/IPlatformLoginAndPay;

    move-result-object v0

    invoke-interface {v0}, Lcom/youai/IPlatformLoginAndPay;->isTryUser()Z

    move-result v0

    return v0
.end method

.method public static native nativeNotifyTryUserRegistSuccess()V
.end method

.method public static native nativeOnMotionShake()V
.end method

.method public static native nativeOnPlayMovieEnd()V
.end method

.method public static native nativeOnShareEngineMessage(Z)V
.end method

.method public static native nativeRequestGameSvrBindTryToOkUser(Ljava/lang/String;Ljava/lang/String;)V
.end method

.method public static openWeChat()V
    .locals 2

    .prologue
    .line 113
    invoke-static {}, Lcom/youai/dreamonepiece/GameActivity;->getContext()Landroid/content/Context;

    move-result-object v0

    sget-object v1, Lcom/youai/dreamonepiece/GameActivity;->mHandler:Landroid/os/Handler;

    invoke-static {v0, v1}, Lcom/youai/GameActivityHelper;->openWeChat(Landroid/content/Context;Landroid/os/Handler;)V

    .line 114
    return-void
.end method

.method public static playMovie(Ljava/lang/String;)V
    .locals 4
    .param p0, "fileName"    # Ljava/lang/String;

    .prologue
    .line 922
    sget-object v0, Lcom/youai/dreamonepiece/GameActivity;->mGameApp:Lcom/youai/dreamonepiece/GameActivity;

    invoke-virtual {v0}, Lcom/youai/dreamonepiece/GameActivity;->getMainHandler()Landroid/os/Handler;

    move-result-object v0

    new-instance v1, Lcom/youai/dreamonepiece/GameActivity$10;

    invoke-direct {v1, p0}, Lcom/youai/dreamonepiece/GameActivity$10;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 967
    sget-object v0, Lcom/youai/dreamonepiece/GameActivity;->mGameApp:Lcom/youai/dreamonepiece/GameActivity;

    invoke-virtual {v0}, Lcom/youai/dreamonepiece/GameActivity;->getMainHandler()Landroid/os/Handler;

    move-result-object v0

    new-instance v1, Lcom/youai/dreamonepiece/GameActivity$11;

    invoke-direct {v1}, Lcom/youai/dreamonepiece/GameActivity$11;-><init>()V

    const-wide/16 v2, 0x320

    invoke-virtual {v0, v1, v2, v3}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 976
    return-void
.end method

.method public static receiveGameSvrBindTryToOkUserResult(I)V
    .locals 1
    .param p0, "result"    # I

    .prologue
    .line 1279
    sget-object v0, Lcom/youai/dreamonepiece/GameActivity;->mGameApp:Lcom/youai/dreamonepiece/GameActivity;

    invoke-virtual {v0}, Lcom/youai/dreamonepiece/GameActivity;->getPlatformSDK()Lcom/youai/IPlatformLoginAndPay;

    move-result-object v0

    invoke-interface {v0, p0}, Lcom/youai/IPlatformLoginAndPay;->receiveGameSvrBindTryToOkUserResult(I)V

    .line 1280
    return-void
.end method

.method public static requestRestart()V
    .locals 2

    .prologue
    .line 108
    invoke-static {}, Lcom/youai/dreamonepiece/GameActivity;->getContext()Landroid/content/Context;

    move-result-object v0

    sget-object v1, Lcom/youai/dreamonepiece/GameActivity;->mHandler:Landroid/os/Handler;

    invoke-static {v0, v1}, Lcom/youai/GameActivityHelper;->requestRestart(Landroid/content/Context;Landroid/os/Handler;)V

    .line 109
    return-void
.end method

.method public static setCanPressBack(Z)V
    .locals 0
    .param p0, "canPressBack"    # Z

    .prologue
    .line 1240
    sput-boolean p0, Lcom/youai/dreamonepiece/GameActivity;->canPressBack:Z

    .line 1241
    return-void
.end method

.method public static setWeChat(Z)V
    .locals 0
    .param p0, "pWeChat"    # Z

    .prologue
    .line 103
    sput-boolean p0, Lcom/youai/dreamonepiece/GameActivity;->weChatHave:Z

    .line 104
    return-void
.end method

.method public static shareToFriends(Ljava/lang/String;)V
    .locals 5
    .param p0, "shareContent"    # Ljava/lang/String;

    .prologue
    .line 1093
    sget-object v3, Lcom/youai/dreamonepiece/GameActivity;->mContext:Landroid/content/Context;

    sget-object v4, Lcom/youai/dreamonepiece/GameActivity;->mHandler:Landroid/os/Handler;

    invoke-static {v3, v4}, Lcom/youai/GameActivityHelper;->isInstallWeChat(Landroid/content/Context;Landroid/os/Handler;)Z

    move-result v3

    if-nez v3, :cond_1

    .line 1094
    sget-object v3, Lcom/youai/dreamonepiece/GameActivity;->mContext:Landroid/content/Context;

    sget-object v4, Lcom/youai/dreamonepiece/GameActivity;->mHandler:Landroid/os/Handler;

    invoke-static {v3, v4}, Lcom/youai/GameActivityHelper;->noWeChatDialog(Landroid/content/Context;Landroid/os/Handler;)V

    .line 1110
    :cond_0
    :goto_0
    return-void

    .line 1097
    :cond_1
    sget-object v3, Lcom/youai/dreamonepiece/GameActivity;->api:Lcom/tencent/mm/sdk/openapi/IWXAPI;

    if-eqz v3, :cond_0

    .line 1100
    new-instance v2, Lcom/tencent/mm/sdk/modelmsg/WXTextObject;

    invoke-direct {v2}, Lcom/tencent/mm/sdk/modelmsg/WXTextObject;-><init>()V

    .line 1101
    .local v2, "textObj":Lcom/tencent/mm/sdk/modelmsg/WXTextObject;
    iput-object p0, v2, Lcom/tencent/mm/sdk/modelmsg/WXTextObject;->text:Ljava/lang/String;

    .line 1102
    new-instance v0, Lcom/tencent/mm/sdk/modelmsg/WXMediaMessage;

    invoke-direct {v0}, Lcom/tencent/mm/sdk/modelmsg/WXMediaMessage;-><init>()V

    .line 1103
    .local v0, "msg":Lcom/tencent/mm/sdk/modelmsg/WXMediaMessage;
    iput-object v2, v0, Lcom/tencent/mm/sdk/modelmsg/WXMediaMessage;->mediaObject:Lcom/tencent/mm/sdk/modelmsg/WXMediaMessage$IMediaObject;

    .line 1104
    iput-object p0, v0, Lcom/tencent/mm/sdk/modelmsg/WXMediaMessage;->description:Ljava/lang/String;

    .line 1105
    new-instance v1, Lcom/tencent/mm/sdk/modelmsg/SendMessageToWX$Req;

    invoke-direct {v1}, Lcom/tencent/mm/sdk/modelmsg/SendMessageToWX$Req;-><init>()V

    .line 1106
    .local v1, "req":Lcom/tencent/mm/sdk/modelmsg/SendMessageToWX$Req;
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v3

    invoke-static {v3, v4}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object v3

    iput-object v3, v1, Lcom/tencent/mm/sdk/modelmsg/SendMessageToWX$Req;->transaction:Ljava/lang/String;

    .line 1107
    iput-object v0, v1, Lcom/tencent/mm/sdk/modelmsg/SendMessageToWX$Req;->message:Lcom/tencent/mm/sdk/modelmsg/WXMediaMessage;

    .line 1108
    const/4 v3, 0x1

    iput v3, v1, Lcom/tencent/mm/sdk/modelmsg/SendMessageToWX$Req;->scene:I

    .line 1109
    sget-object v3, Lcom/youai/dreamonepiece/GameActivity;->api:Lcom/tencent/mm/sdk/openapi/IWXAPI;

    invoke-interface {v3, v1}, Lcom/tencent/mm/sdk/openapi/IWXAPI;->sendReq(Lcom/tencent/mm/sdk/modelbase/BaseReq;)Z

    goto :goto_0
.end method

.method public static shareToFriends(Ljava/lang/String;Ljava/lang/String;)V
    .locals 11
    .param p0, "shareImgPath"    # Ljava/lang/String;
    .param p1, "shareContent"    # Ljava/lang/String;

    .prologue
    const/16 v10, 0x64

    const/4 v9, 0x1

    .line 1040
    sget-object v7, Lcom/youai/dreamonepiece/GameActivity;->mContext:Landroid/content/Context;

    sget-object v8, Lcom/youai/dreamonepiece/GameActivity;->mHandler:Landroid/os/Handler;

    invoke-static {v7, v8}, Lcom/youai/GameActivityHelper;->isInstallWeChat(Landroid/content/Context;Landroid/os/Handler;)Z

    move-result v7

    if-nez v7, :cond_1

    .line 1041
    sget-object v7, Lcom/youai/dreamonepiece/GameActivity;->mContext:Landroid/content/Context;

    sget-object v8, Lcom/youai/dreamonepiece/GameActivity;->mHandler:Landroid/os/Handler;

    invoke-static {v7, v8}, Lcom/youai/GameActivityHelper;->noWeChatDialog(Landroid/content/Context;Landroid/os/Handler;)V

    .line 1088
    :cond_0
    :goto_0
    return-void

    .line 1044
    :cond_1
    sget-object v7, Lcom/youai/dreamonepiece/GameActivity;->api:Lcom/tencent/mm/sdk/openapi/IWXAPI;

    if-eqz v7, :cond_0

    .line 1046
    const/16 v0, 0x64

    .line 1047
    .local v0, "THUMB_SIZE":I
    new-instance v2, Lcom/tencent/mm/sdk/modelmsg/WXImageObject;

    invoke-direct {v2}, Lcom/tencent/mm/sdk/modelmsg/WXImageObject;-><init>()V

    .line 1048
    .local v2, "imgObj":Lcom/tencent/mm/sdk/modelmsg/WXImageObject;
    invoke-virtual {v2, p0}, Lcom/tencent/mm/sdk/modelmsg/WXImageObject;->setImagePath(Ljava/lang/String;)V

    .line 1050
    new-instance v6, Lcom/tencent/mm/sdk/modelmsg/WXWebpageObject;

    invoke-direct {v6}, Lcom/tencent/mm/sdk/modelmsg/WXWebpageObject;-><init>()V

    .line 1051
    .local v6, "webpage":Lcom/tencent/mm/sdk/modelmsg/WXWebpageObject;
    const-string v7, "http://baike.baidu.com/cms/rc/240x112ewmdtz.jpg"

    iput-object v7, v6, Lcom/tencent/mm/sdk/modelmsg/WXWebpageObject;->webpageUrl:Ljava/lang/String;

    .line 1052
    new-instance v3, Lcom/tencent/mm/sdk/modelmsg/WXMediaMessage;

    invoke-direct {v3}, Lcom/tencent/mm/sdk/modelmsg/WXMediaMessage;-><init>()V

    .line 1054
    .local v3, "msg":Lcom/tencent/mm/sdk/modelmsg/WXMediaMessage;
    iput-object v2, v3, Lcom/tencent/mm/sdk/modelmsg/WXMediaMessage;->mediaObject:Lcom/tencent/mm/sdk/modelmsg/WXMediaMessage$IMediaObject;

    .line 1055
    iput-object p1, v3, Lcom/tencent/mm/sdk/modelmsg/WXMediaMessage;->description:Ljava/lang/String;

    .line 1056
    iput-object p1, v3, Lcom/tencent/mm/sdk/modelmsg/WXMediaMessage;->title:Ljava/lang/String;

    .line 1058
    invoke-static {p0}, Landroid/graphics/BitmapFactory;->decodeFile(Ljava/lang/String;)Landroid/graphics/Bitmap;

    move-result-object v1

    .line 1059
    .local v1, "bmp":Landroid/graphics/Bitmap;
    invoke-static {v1, v10, v10, v9}, Landroid/graphics/Bitmap;->createScaledBitmap(Landroid/graphics/Bitmap;IIZ)Landroid/graphics/Bitmap;

    move-result-object v5

    .line 1061
    .local v5, "thumbBmp":Landroid/graphics/Bitmap;
    if-ne v1, v5, :cond_2

    .line 1082
    :goto_1
    invoke-static {v5, v9}, Lcom/youai/WXUtil;->bmpToByteArray(Landroid/graphics/Bitmap;Z)[B

    move-result-object v7

    iput-object v7, v3, Lcom/tencent/mm/sdk/modelmsg/WXMediaMessage;->thumbData:[B

    .line 1083
    new-instance v4, Lcom/tencent/mm/sdk/modelmsg/SendMessageToWX$Req;

    invoke-direct {v4}, Lcom/tencent/mm/sdk/modelmsg/SendMessageToWX$Req;-><init>()V

    .line 1084
    .local v4, "req":Lcom/tencent/mm/sdk/modelmsg/SendMessageToWX$Req;
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v7

    invoke-static {v7, v8}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object v7

    iput-object v7, v4, Lcom/tencent/mm/sdk/modelmsg/SendMessageToWX$Req;->transaction:Ljava/lang/String;

    .line 1085
    iput-object v3, v4, Lcom/tencent/mm/sdk/modelmsg/SendMessageToWX$Req;->message:Lcom/tencent/mm/sdk/modelmsg/WXMediaMessage;

    .line 1086
    iput v9, v4, Lcom/tencent/mm/sdk/modelmsg/SendMessageToWX$Req;->scene:I

    .line 1087
    sget-object v7, Lcom/youai/dreamonepiece/GameActivity;->api:Lcom/tencent/mm/sdk/openapi/IWXAPI;

    invoke-interface {v7, v4}, Lcom/tencent/mm/sdk/openapi/IWXAPI;->sendReq(Lcom/tencent/mm/sdk/modelbase/BaseReq;)Z

    goto :goto_0

    .line 1064
    .end local v4    # "req":Lcom/tencent/mm/sdk/modelmsg/SendMessageToWX$Req;
    :cond_2
    invoke-virtual {v1}, Landroid/graphics/Bitmap;->recycle()V

    goto :goto_1
.end method

.method private static shareToPerson(Ljava/lang/String;)V
    .locals 5
    .param p0, "shareContent"    # Ljava/lang/String;

    .prologue
    .line 984
    sget-object v3, Lcom/youai/dreamonepiece/GameActivity;->mContext:Landroid/content/Context;

    sget-object v4, Lcom/youai/dreamonepiece/GameActivity;->mHandler:Landroid/os/Handler;

    invoke-static {v3, v4}, Lcom/youai/GameActivityHelper;->isInstallWeChat(Landroid/content/Context;Landroid/os/Handler;)Z

    move-result v3

    if-nez v3, :cond_1

    .line 985
    sget-object v3, Lcom/youai/dreamonepiece/GameActivity;->mContext:Landroid/content/Context;

    sget-object v4, Lcom/youai/dreamonepiece/GameActivity;->mHandler:Landroid/os/Handler;

    invoke-static {v3, v4}, Lcom/youai/GameActivityHelper;->noWeChatDialog(Landroid/content/Context;Landroid/os/Handler;)V

    .line 1001
    :cond_0
    :goto_0
    return-void

    .line 988
    :cond_1
    sget-object v3, Lcom/youai/dreamonepiece/GameActivity;->api:Lcom/tencent/mm/sdk/openapi/IWXAPI;

    if-eqz v3, :cond_0

    .line 990
    new-instance v2, Lcom/tencent/mm/sdk/modelmsg/WXTextObject;

    invoke-direct {v2}, Lcom/tencent/mm/sdk/modelmsg/WXTextObject;-><init>()V

    .line 991
    .local v2, "textObj":Lcom/tencent/mm/sdk/modelmsg/WXTextObject;
    iput-object p0, v2, Lcom/tencent/mm/sdk/modelmsg/WXTextObject;->text:Ljava/lang/String;

    .line 992
    new-instance v0, Lcom/tencent/mm/sdk/modelmsg/WXMediaMessage;

    invoke-direct {v0}, Lcom/tencent/mm/sdk/modelmsg/WXMediaMessage;-><init>()V

    .line 993
    .local v0, "msg":Lcom/tencent/mm/sdk/modelmsg/WXMediaMessage;
    iput-object v2, v0, Lcom/tencent/mm/sdk/modelmsg/WXMediaMessage;->mediaObject:Lcom/tencent/mm/sdk/modelmsg/WXMediaMessage$IMediaObject;

    .line 994
    iput-object p0, v0, Lcom/tencent/mm/sdk/modelmsg/WXMediaMessage;->description:Ljava/lang/String;

    .line 995
    new-instance v1, Lcom/tencent/mm/sdk/modelmsg/SendMessageToWX$Req;

    invoke-direct {v1}, Lcom/tencent/mm/sdk/modelmsg/SendMessageToWX$Req;-><init>()V

    .line 996
    .local v1, "req":Lcom/tencent/mm/sdk/modelmsg/SendMessageToWX$Req;
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v3

    invoke-static {v3, v4}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object v3

    iput-object v3, v1, Lcom/tencent/mm/sdk/modelmsg/SendMessageToWX$Req;->transaction:Ljava/lang/String;

    .line 997
    iput-object v0, v1, Lcom/tencent/mm/sdk/modelmsg/SendMessageToWX$Req;->message:Lcom/tencent/mm/sdk/modelmsg/WXMediaMessage;

    .line 998
    const/4 v3, 0x0

    iput v3, v1, Lcom/tencent/mm/sdk/modelmsg/SendMessageToWX$Req;->scene:I

    .line 1000
    sget-object v3, Lcom/youai/dreamonepiece/GameActivity;->api:Lcom/tencent/mm/sdk/openapi/IWXAPI;

    invoke-interface {v3, v1}, Lcom/tencent/mm/sdk/openapi/IWXAPI;->sendReq(Lcom/tencent/mm/sdk/modelbase/BaseReq;)Z

    goto :goto_0
.end method

.method private static shareToPerson(Ljava/lang/String;Ljava/lang/String;)V
    .locals 10
    .param p0, "shareImgPath"    # Ljava/lang/String;
    .param p1, "shareContent"    # Ljava/lang/String;

    .prologue
    const/16 v9, 0x64

    const/4 v8, 0x1

    .line 1005
    sget-object v6, Lcom/youai/dreamonepiece/GameActivity;->mContext:Landroid/content/Context;

    sget-object v7, Lcom/youai/dreamonepiece/GameActivity;->mHandler:Landroid/os/Handler;

    invoke-static {v6, v7}, Lcom/youai/GameActivityHelper;->isInstallWeChat(Landroid/content/Context;Landroid/os/Handler;)Z

    move-result v6

    if-nez v6, :cond_1

    .line 1006
    sget-object v6, Lcom/youai/dreamonepiece/GameActivity;->mContext:Landroid/content/Context;

    sget-object v7, Lcom/youai/dreamonepiece/GameActivity;->mHandler:Landroid/os/Handler;

    invoke-static {v6, v7}, Lcom/youai/GameActivityHelper;->noWeChatDialog(Landroid/content/Context;Landroid/os/Handler;)V

    .line 1036
    :cond_0
    :goto_0
    return-void

    .line 1009
    :cond_1
    sget-object v6, Lcom/youai/dreamonepiece/GameActivity;->api:Lcom/tencent/mm/sdk/openapi/IWXAPI;

    if-eqz v6, :cond_0

    .line 1011
    const/16 v0, 0x64

    .line 1012
    .local v0, "THUMB_SIZE":I
    new-instance v2, Lcom/tencent/mm/sdk/modelmsg/WXImageObject;

    invoke-direct {v2}, Lcom/tencent/mm/sdk/modelmsg/WXImageObject;-><init>()V

    .line 1013
    .local v2, "imgObj":Lcom/tencent/mm/sdk/modelmsg/WXImageObject;
    invoke-virtual {v2, p0}, Lcom/tencent/mm/sdk/modelmsg/WXImageObject;->setImagePath(Ljava/lang/String;)V

    .line 1014
    new-instance v3, Lcom/tencent/mm/sdk/modelmsg/WXMediaMessage;

    invoke-direct {v3}, Lcom/tencent/mm/sdk/modelmsg/WXMediaMessage;-><init>()V

    .line 1016
    .local v3, "msg":Lcom/tencent/mm/sdk/modelmsg/WXMediaMessage;
    iput-object v2, v3, Lcom/tencent/mm/sdk/modelmsg/WXMediaMessage;->mediaObject:Lcom/tencent/mm/sdk/modelmsg/WXMediaMessage$IMediaObject;

    .line 1017
    iput-object p1, v3, Lcom/tencent/mm/sdk/modelmsg/WXMediaMessage;->description:Ljava/lang/String;

    .line 1018
    const-string v6, "test title"

    iput-object v6, v3, Lcom/tencent/mm/sdk/modelmsg/WXMediaMessage;->title:Ljava/lang/String;

    .line 1020
    invoke-static {p0}, Landroid/graphics/BitmapFactory;->decodeFile(Ljava/lang/String;)Landroid/graphics/Bitmap;

    move-result-object v1

    .line 1021
    .local v1, "bmp":Landroid/graphics/Bitmap;
    invoke-static {v1, v9, v9, v8}, Landroid/graphics/Bitmap;->createScaledBitmap(Landroid/graphics/Bitmap;IIZ)Landroid/graphics/Bitmap;

    move-result-object v5

    .line 1023
    .local v5, "thumbBmp":Landroid/graphics/Bitmap;
    if-ne v1, v5, :cond_2

    .line 1029
    :goto_1
    invoke-static {v5, v8}, Lcom/youai/WXUtil;->bmpToByteArray(Landroid/graphics/Bitmap;Z)[B

    move-result-object v6

    iput-object v6, v3, Lcom/tencent/mm/sdk/modelmsg/WXMediaMessage;->thumbData:[B

    .line 1030
    new-instance v4, Lcom/tencent/mm/sdk/modelmsg/SendMessageToWX$Req;

    invoke-direct {v4}, Lcom/tencent/mm/sdk/modelmsg/SendMessageToWX$Req;-><init>()V

    .line 1031
    .local v4, "req":Lcom/tencent/mm/sdk/modelmsg/SendMessageToWX$Req;
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v6

    invoke-static {v6, v7}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object v6

    iput-object v6, v4, Lcom/tencent/mm/sdk/modelmsg/SendMessageToWX$Req;->transaction:Ljava/lang/String;

    .line 1032
    iput-object v3, v4, Lcom/tencent/mm/sdk/modelmsg/SendMessageToWX$Req;->message:Lcom/tencent/mm/sdk/modelmsg/WXMediaMessage;

    .line 1033
    const/4 v6, 0x0

    iput v6, v4, Lcom/tencent/mm/sdk/modelmsg/SendMessageToWX$Req;->scene:I

    .line 1034
    sget-object v6, Lcom/youai/dreamonepiece/GameActivity;->api:Lcom/tencent/mm/sdk/openapi/IWXAPI;

    invoke-interface {v6, v4}, Lcom/tencent/mm/sdk/openapi/IWXAPI;->sendReq(Lcom/tencent/mm/sdk/modelbase/BaseReq;)Z

    goto :goto_0

    .line 1026
    .end local v4    # "req":Lcom/tencent/mm/sdk/modelmsg/SendMessageToWX$Req;
    :cond_2
    invoke-virtual {v1}, Landroid/graphics/Bitmap;->recycle()V

    goto :goto_1
.end method

.method private showExitDialog()V
    .locals 5

    .prologue
    .line 386
    new-instance v2, Landroid/app/AlertDialog$Builder;

    invoke-direct {v2, p0}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    const v3, 0x7f0a0023

    invoke-virtual {v2, v3}, Landroid/app/AlertDialog$Builder;->setTitle(I)Landroid/app/AlertDialog$Builder;

    move-result-object v2

    const v3, 0x7f0a0003

    invoke-virtual {v2, v3}, Landroid/app/AlertDialog$Builder;->setMessage(I)Landroid/app/AlertDialog$Builder;

    move-result-object v2

    const-string v3, "\u786e\u5b9a"

    new-instance v4, Lcom/youai/dreamonepiece/GameActivity$5;

    invoke-direct {v4, p0}, Lcom/youai/dreamonepiece/GameActivity$5;-><init>(Lcom/youai/dreamonepiece/GameActivity;)V

    invoke-virtual {v2, v3, v4}, Landroid/app/AlertDialog$Builder;->setPositiveButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v2

    const-string v3, "\u53d6\u6d88"

    new-instance v4, Lcom/youai/dreamonepiece/GameActivity$4;

    invoke-direct {v4, p0}, Lcom/youai/dreamonepiece/GameActivity$4;-><init>(Lcom/youai/dreamonepiece/GameActivity;)V

    invoke-virtual {v2, v3, v4}, Landroid/app/AlertDialog$Builder;->setNegativeButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v2

    new-instance v3, Lcom/youai/dreamonepiece/GameActivity$3;

    invoke-direct {v3, p0}, Lcom/youai/dreamonepiece/GameActivity$3;-><init>(Lcom/youai/dreamonepiece/GameActivity;)V

    invoke-virtual {v2, v3}, Landroid/app/AlertDialog$Builder;->setOnCancelListener(Landroid/content/DialogInterface$OnCancelListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v2

    invoke-virtual {v2}, Landroid/app/AlertDialog$Builder;->create()Landroid/app/AlertDialog;

    move-result-object v0

    .line 409
    .local v0, "dlg":Landroid/app/AlertDialog;
    const/4 v2, 0x0

    invoke-virtual {v0, v2}, Landroid/app/AlertDialog;->setCanceledOnTouchOutside(Z)V

    .line 410
    invoke-virtual {v0}, Landroid/app/AlertDialog;->getWindow()Landroid/view/Window;

    move-result-object v2

    invoke-virtual {v2}, Landroid/view/Window;->getAttributes()Landroid/view/WindowManager$LayoutParams;

    move-result-object v1

    .line 411
    .local v1, "lp":Landroid/view/WindowManager$LayoutParams;
    invoke-virtual {v0}, Landroid/app/AlertDialog;->getWindow()Landroid/view/Window;

    move-result-object v2

    invoke-virtual {v2, v1}, Landroid/view/Window;->setAttributes(Landroid/view/WindowManager$LayoutParams;)V

    .line 412
    invoke-virtual {v0}, Landroid/app/AlertDialog;->show()V

    .line 413
    return-void
.end method

.method public static stopMovie()V
    .locals 3

    .prologue
    const/4 v2, 0x4

    .line 908
    sget-object v0, Lcom/youai/dreamonepiece/GameActivity;->buttonStopMovie:Landroid/widget/ImageButton;

    invoke-virtual {v0, v2}, Landroid/widget/ImageButton;->setVisibility(I)V

    .line 909
    sget-object v0, Lcom/youai/dreamonepiece/GameActivity;->mGameApp:Lcom/youai/dreamonepiece/GameActivity;

    iget-object v0, v0, Lcom/youai/dreamonepiece/GameActivity;->mGLSurfaceView:Lorg/cocos2dx/lib/Cocos2dxGLSurfaceView;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lorg/cocos2dx/lib/Cocos2dxGLSurfaceView;->setVisibility(I)V

    .line 910
    sget-object v0, Lcom/youai/dreamonepiece/GameActivity;->videoWorldView:Lcom/youai/WorldVideoView;

    invoke-virtual {v0}, Lcom/youai/WorldVideoView;->stopPlayback()V

    .line 911
    sget-object v0, Lcom/youai/dreamonepiece/GameActivity;->mGameApp:Lcom/youai/dreamonepiece/GameActivity;

    iget-object v0, v0, Lcom/youai/dreamonepiece/GameActivity;->mGLSurfaceView:Lorg/cocos2dx/lib/Cocos2dxGLSurfaceView;

    new-instance v1, Lcom/youai/dreamonepiece/GameActivity$9;

    invoke-direct {v1}, Lcom/youai/dreamonepiece/GameActivity$9;-><init>()V

    invoke-virtual {v0, v1}, Lorg/cocos2dx/lib/Cocos2dxGLSurfaceView;->queueEvent(Ljava/lang/Runnable;)V

    .line 917
    sget-object v0, Lcom/youai/dreamonepiece/GameActivity;->videoWorldView:Lcom/youai/WorldVideoView;

    invoke-virtual {v0, v2}, Lcom/youai/WorldVideoView;->setVisibility(I)V

    .line 918
    return-void
.end method

.method public static stopMovieClick()V
    .locals 3

    .prologue
    const/4 v2, 0x4

    .line 893
    sget-object v0, Lcom/youai/dreamonepiece/GameActivity;->buttonStopMovie:Landroid/widget/ImageButton;

    invoke-virtual {v0, v2}, Landroid/widget/ImageButton;->setVisibility(I)V

    .line 894
    sget-object v0, Lcom/youai/dreamonepiece/GameActivity;->mGameApp:Lcom/youai/dreamonepiece/GameActivity;

    iget-object v0, v0, Lcom/youai/dreamonepiece/GameActivity;->mGLSurfaceView:Lorg/cocos2dx/lib/Cocos2dxGLSurfaceView;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lorg/cocos2dx/lib/Cocos2dxGLSurfaceView;->setVisibility(I)V

    .line 895
    sget-object v0, Lcom/youai/dreamonepiece/GameActivity;->videoWorldView:Lcom/youai/WorldVideoView;

    invoke-virtual {v0}, Lcom/youai/WorldVideoView;->stopPlayback()V

    .line 896
    sget-object v0, Lcom/youai/dreamonepiece/GameActivity;->mGameApp:Lcom/youai/dreamonepiece/GameActivity;

    iget-object v0, v0, Lcom/youai/dreamonepiece/GameActivity;->mGLSurfaceView:Lorg/cocos2dx/lib/Cocos2dxGLSurfaceView;

    new-instance v1, Lcom/youai/dreamonepiece/GameActivity$8;

    invoke-direct {v1}, Lcom/youai/dreamonepiece/GameActivity$8;-><init>()V

    invoke-virtual {v0, v1}, Lorg/cocos2dx/lib/Cocos2dxGLSurfaceView;->queueEvent(Ljava/lang/Runnable;)V

    .line 902
    sget-object v0, Lcom/youai/dreamonepiece/GameActivity;->videoWorldView:Lcom/youai/WorldVideoView;

    invoke-virtual {v0, v2}, Lcom/youai/WorldVideoView;->setVisibility(I)V

    .line 904
    return-void
.end method


# virtual methods
.method public ShowAnnounce(Ljava/lang/String;)V
    .locals 2
    .param p1, "pAnnounceUrl"    # Ljava/lang/String;

    .prologue
    .line 1173
    new-instance v0, Lcom/youai/dreamonepiece/GameActivity$13;

    invoke-direct {v0, p0, p1}, Lcom/youai/dreamonepiece/GameActivity$13;-><init>(Lcom/youai/dreamonepiece/GameActivity;Ljava/lang/String;)V

    .line 1182
    .local v0, "dialogRun":Ljava/lang/Runnable;
    invoke-virtual {p0}, Lcom/youai/dreamonepiece/GameActivity;->getMainHandler()Landroid/os/Handler;

    move-result-object v1

    invoke-virtual {v1, v0}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 1184
    return-void
.end method

.method public callPlatformLogin()V
    .locals 2

    .prologue
    .line 769
    invoke-super {p0}, Lorg/cocos2dx/lib/Cocos2dxActivity;->callPlatformLogin()V

    .line 771
    iget-object v0, p0, Lcom/youai/dreamonepiece/GameActivity;->mPlatform:Lcom/youai/IPlatformLoginAndPay;

    invoke-interface {v0}, Lcom/youai/IPlatformLoginAndPay;->getGameInfo()Lcom/youai/PlatformAndGameInfo$GameInfo;

    move-result-object v0

    iget v0, v0, Lcom/youai/PlatformAndGameInfo$GameInfo;->platform_type:I

    const/16 v1, 0xe

    if-ne v0, v1, :cond_0

    .line 772
    const/4 v0, 0x0

    iput-boolean v0, p0, Lorg/cocos2dx/lib/Cocos2dxActivity;->mIsRenderCocos2dxView:Z

    .line 775
    :cond_0
    return-void
.end method

.method public callSystemShare(Lcom/youai/PlatformAndGameInfo$ShareInfo;)V
    .locals 3
    .param p1, "share"    # Lcom/youai/PlatformAndGameInfo$ShareInfo;

    .prologue
    .line 449
    if-nez p1, :cond_0

    .line 518
    :goto_0
    return-void

    .line 452
    :cond_0
    const/4 v1, 0x1

    invoke-super {p0, v1}, Lorg/cocos2dx/lib/Cocos2dxActivity;->setOnTempShortPause(Z)V

    .line 454
    move-object v0, p0

    .line 456
    .local v0, "theActivity":Lcom/youai/dreamonepiece/GameActivity;
    new-instance v1, Ljava/lang/Thread;

    new-instance v2, Lcom/youai/dreamonepiece/GameActivity$7;

    invoke-direct {v2, p0, p1}, Lcom/youai/dreamonepiece/GameActivity$7;-><init>(Lcom/youai/dreamonepiece/GameActivity;Lcom/youai/PlatformAndGameInfo$ShareInfo;)V

    invoke-direct {v1, v2}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;)V

    invoke-virtual {v1}, Ljava/lang/Thread;->start()V

    goto :goto_0
.end method

.method public clearSysNotification()V
    .locals 4

    .prologue
    .line 1188
    const-string v2, "GameActivity"

    const-string v3, "clearSysNotification"

    invoke-static {v2, v3}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 1189
    invoke-virtual {p0}, Lcom/youai/dreamonepiece/GameActivity;->isWorked()Z

    move-result v2

    if-nez v2, :cond_0

    .line 1190
    new-instance v2, Landroid/content/Intent;

    const-class v3, Lcom/youai/dreamonepiece/NotificationService;

    invoke-direct {v2, p0, v3}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    invoke-virtual {p0, v2}, Lcom/youai/dreamonepiece/GameActivity;->startService(Landroid/content/Intent;)Landroid/content/ComponentName;

    .line 1193
    new-instance v1, Lcom/youai/dreamonepiece/GameActivity$14;

    invoke-direct {v1, p0}, Lcom/youai/dreamonepiece/GameActivity$14;-><init>(Lcom/youai/dreamonepiece/GameActivity;)V

    .line 1203
    .local v1, "pushRunable":Ljava/lang/Runnable;
    invoke-virtual {p0}, Lcom/youai/dreamonepiece/GameActivity;->getMainHandler()Landroid/os/Handler;

    move-result-object v2

    invoke-virtual {v2, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 1211
    .end local v1    # "pushRunable":Ljava/lang/Runnable;
    :goto_0
    return-void

    .line 1205
    :cond_0
    new-instance v0, Landroid/content/Intent;

    invoke-direct {v0}, Landroid/content/Intent;-><init>()V

    .line 1206
    .local v0, "myIntent":Landroid/content/Intent;
    const-string v2, "com.youai.dreamonepiece.notificationservice"

    invoke-virtual {v0, v2}, Landroid/content/Intent;->setAction(Ljava/lang/String;)Landroid/content/Intent;

    .line 1207
    const-string v2, "clear"

    const/4 v3, 0x1

    invoke-virtual {v0, v2, v3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    .line 1208
    invoke-virtual {p0, v0}, Lcom/youai/dreamonepiece/GameActivity;->sendBroadcast(Landroid/content/Intent;)V

    .line 1209
    const-string v2, "GameActivity"

    const-string v3, "clearSysNotification"

    invoke-static {v2, v3}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0
.end method

.method protected destroy()V
    .locals 3

    .prologue
    const/4 v2, 0x0

    .line 221
    sget-object v0, Lcom/youai/dreamonepiece/GameActivity;->TAG:Ljava/lang/String;

    const-string v1, "call destroy"

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 223
    invoke-static {}, Lcom/youai/dreamonepiece/AnalyticsToolHelp;->onStop()V

    .line 225
    iget-object v0, p0, Lcom/youai/dreamonepiece/GameActivity;->mPlatform:Lcom/youai/IPlatformLoginAndPay;

    if-eqz v0, :cond_0

    .line 226
    sget-object v0, Lcom/youai/dreamonepiece/GameActivity;->TAG:Ljava/lang/String;

    const-string v1, "mPlatform.unInit"

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 228
    iget-object v0, p0, Lcom/youai/dreamonepiece/GameActivity;->mPlatform:Lcom/youai/IPlatformLoginAndPay;

    invoke-interface {v0}, Lcom/youai/IPlatformLoginAndPay;->unInit()V

    .line 229
    iput-object v2, p0, Lcom/youai/dreamonepiece/GameActivity;->mPlatform:Lcom/youai/IPlatformLoginAndPay;

    .line 232
    :cond_0
    invoke-super {p0}, Lorg/cocos2dx/lib/Cocos2dxActivity;->destroy()V

    .line 234
    iget-object v0, p0, Lcom/youai/dreamonepiece/GameActivity;->mStateMgr:Lcom/youai/IStateManager;

    const/4 v1, 0x0

    invoke-interface {v0, v1}, Lcom/youai/IStateManager;->changeState(I)V

    .line 235
    iput-object v2, p0, Lcom/youai/dreamonepiece/GameActivity;->mStateMgr:Lcom/youai/IStateManager;

    .line 237
    return-void
.end method

.method public generateNewOrderSerial()Ljava/lang/String;
    .locals 1

    .prologue
    .line 586
    iget-object v0, p0, Lcom/youai/dreamonepiece/GameActivity;->mPlatform:Lcom/youai/IPlatformLoginAndPay;

    invoke-interface {v0}, Lcom/youai/IPlatformLoginAndPay;->generateNewOrderSerial()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getActivity()Lcom/youai/dreamonepiece/GameActivity;
    .locals 0

    .prologue
    .line 611
    return-object p0
.end method

.method public getAppFilesCachePath()Ljava/lang/String;
    .locals 1

    .prologue
    .line 693
    iget-object v0, p0, Lcom/youai/dreamonepiece/GameActivity;->mAppDataExternalStorageCacheFullPath:Ljava/lang/String;

    return-object v0
.end method

.method public getAppFilesResourcesPath()Ljava/lang/String;
    .locals 1

    .prologue
    .line 688
    iget-object v0, p0, Lcom/youai/dreamonepiece/GameActivity;->mAppDataExternalStorageResourcesFullPath:Ljava/lang/String;

    return-object v0
.end method

.method public getAppFilesRootPath()Ljava/lang/String;
    .locals 1

    .prologue
    .line 683
    iget-object v0, p0, Lcom/youai/dreamonepiece/GameActivity;->mAppDataExternalStorageFullPath:Ljava/lang/String;

    return-object v0
.end method

.method public getClientChannel()Ljava/lang/String;
    .locals 1

    .prologue
    .line 856
    iget-object v0, p0, Lcom/youai/dreamonepiece/GameActivity;->mPlatform:Lcom/youai/IPlatformLoginAndPay;

    if-eqz v0, :cond_0

    .line 858
    iget-object v0, p0, Lcom/youai/dreamonepiece/GameActivity;->mPlatform:Lcom/youai/IPlatformLoginAndPay;

    invoke-interface {v0}, Lcom/youai/IPlatformLoginAndPay;->getGameInfo()Lcom/youai/PlatformAndGameInfo$GameInfo;

    move-result-object v0

    iget-object v0, v0, Lcom/youai/PlatformAndGameInfo$GameInfo;->platform_type_str:Ljava/lang/String;

    .line 861
    :goto_0
    return-object v0

    :cond_0
    const-string v0, "Android"

    goto :goto_0
.end method

.method public getDeviceID()Ljava/lang/String;
    .locals 1

    .prologue
    .line 837
    invoke-static {p0}, Lcom/youai/DeviceUtil;->getDeviceUUID(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getGameInfo()Lcom/youai/PlatformAndGameInfo$GameInfo;
    .locals 1

    .prologue
    .line 707
    iget-object v0, p0, Lcom/youai/dreamonepiece/GameActivity;->mGameCfg:Lcom/youai/dreamonepiece/GameConfig;

    iget-object v0, v0, Lcom/youai/dreamonepiece/GameConfig;->mGameInfo:Lcom/youai/PlatformAndGameInfo$GameInfo;

    return-object v0
.end method

.method public getMainHandler()Landroid/os/Handler;
    .locals 1

    .prologue
    .line 760
    invoke-super {p0}, Lorg/cocos2dx/lib/Cocos2dxActivity;->getMainThreadHandler()Landroid/os/Handler;

    move-result-object v0

    return-object v0
.end method

.method public getPlatformId()I
    .locals 1

    .prologue
    .line 886
    iget-object v0, p0, Lcom/youai/dreamonepiece/GameActivity;->mPlatform:Lcom/youai/IPlatformLoginAndPay;

    if-eqz v0, :cond_0

    .line 887
    iget-object v0, p0, Lcom/youai/dreamonepiece/GameActivity;->mPlatform:Lcom/youai/IPlatformLoginAndPay;

    invoke-interface {v0}, Lcom/youai/IPlatformLoginAndPay;->getGameInfo()Lcom/youai/PlatformAndGameInfo$GameInfo;

    move-result-object v0

    iget v0, v0, Lcom/youai/PlatformAndGameInfo$GameInfo;->platform_type:I

    .line 889
    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public getPlatformInfo()Ljava/lang/String;
    .locals 4

    .prologue
    .line 842
    iget-object v2, p0, Lcom/youai/dreamonepiece/GameActivity;->mPlatform:Lcom/youai/IPlatformLoginAndPay;

    if-eqz v2, :cond_0

    .line 843
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    sget-object v3, Landroid/os/Build;->MANUFACTURER:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    sget-object v3, Landroid/os/Build;->MODEL:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .line 844
    .local v1, "temp":Ljava/lang/String;
    const-string v2, " "

    const-string v3, "-"

    invoke-virtual {v1, v2, v3}, Ljava/lang/String;->replaceAll(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 845
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "_"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    sget v3, Landroid/os/Build$VERSION;->SDK_INT:I

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 850
    .end local v1    # "temp":Ljava/lang/String;
    :goto_0
    return-object v0

    :cond_0
    const-string v0, "AndroidPlatform"

    goto :goto_0
.end method

.method public getPlatformLoginSessionId()Ljava/lang/String;
    .locals 2

    .prologue
    .line 556
    iget-object v1, p0, Lcom/youai/dreamonepiece/GameActivity;->mPlatform:Lcom/youai/IPlatformLoginAndPay;

    if-nez v1, :cond_0

    .line 557
    invoke-static {}, Lcom/youai/DeviceUtil;->generateUUID()Ljava/lang/String;

    move-result-object v1

    .line 565
    :goto_0
    return-object v1

    .line 560
    :cond_0
    iget-object v1, p0, Lcom/youai/dreamonepiece/GameActivity;->mPlatform:Lcom/youai/IPlatformLoginAndPay;

    invoke-interface {v1}, Lcom/youai/IPlatformLoginAndPay;->getLoginInfo()Lcom/youai/PlatformAndGameInfo$LoginInfo;

    move-result-object v0

    .line 561
    .local v0, "login_info":Lcom/youai/PlatformAndGameInfo$LoginInfo;
    if-nez v0, :cond_1

    .line 562
    invoke-static {}, Lcom/youai/DeviceUtil;->generateUUID()Ljava/lang/String;

    move-result-object v1

    goto :goto_0

    .line 565
    :cond_1
    iget-object v1, v0, Lcom/youai/PlatformAndGameInfo$LoginInfo;->login_session:Ljava/lang/String;

    goto :goto_0
.end method

.method public getPlatformLoginStatus()Z
    .locals 3

    .prologue
    const/4 v1, 0x0

    .line 523
    iget-object v2, p0, Lcom/youai/dreamonepiece/GameActivity;->mPlatform:Lcom/youai/IPlatformLoginAndPay;

    if-nez v2, :cond_1

    .line 535
    :cond_0
    :goto_0
    return v1

    .line 528
    :cond_1
    iget-object v2, p0, Lcom/youai/dreamonepiece/GameActivity;->mPlatform:Lcom/youai/IPlatformLoginAndPay;

    invoke-interface {v2}, Lcom/youai/IPlatformLoginAndPay;->getLoginInfo()Lcom/youai/PlatformAndGameInfo$LoginInfo;

    move-result-object v0

    .line 529
    .local v0, "login_info":Lcom/youai/PlatformAndGameInfo$LoginInfo;
    if-eqz v0, :cond_0

    .line 532
    iget v2, v0, Lcom/youai/PlatformAndGameInfo$LoginInfo;->login_result:I

    if-nez v2, :cond_0

    .line 533
    const/4 v1, 0x1

    goto :goto_0
.end method

.method public getPlatformLoginUin()Ljava/lang/String;
    .locals 2

    .prologue
    .line 541
    iget-object v1, p0, Lcom/youai/dreamonepiece/GameActivity;->mPlatform:Lcom/youai/IPlatformLoginAndPay;

    if-nez v1, :cond_0

    .line 542
    invoke-static {p0}, Lcom/youai/DeviceUtil;->getDeviceUUID(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v1

    .line 550
    :goto_0
    return-object v1

    .line 545
    :cond_0
    iget-object v1, p0, Lcom/youai/dreamonepiece/GameActivity;->mPlatform:Lcom/youai/IPlatformLoginAndPay;

    invoke-interface {v1}, Lcom/youai/IPlatformLoginAndPay;->getLoginInfo()Lcom/youai/PlatformAndGameInfo$LoginInfo;

    move-result-object v0

    .line 546
    .local v0, "login_info":Lcom/youai/PlatformAndGameInfo$LoginInfo;
    if-nez v0, :cond_1

    .line 547
    invoke-static {p0}, Lcom/youai/DeviceUtil;->getDeviceUUID(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v1

    goto :goto_0

    .line 550
    :cond_1
    iget-object v1, v0, Lcom/youai/PlatformAndGameInfo$LoginInfo;->account_uid_str:Ljava/lang/String;

    goto :goto_0
.end method

.method public getPlatformSDK()Lcom/youai/IPlatformLoginAndPay;
    .locals 1

    .prologue
    .line 617
    iget-object v0, p0, Lcom/youai/dreamonepiece/GameActivity;->mPlatform:Lcom/youai/IPlatformLoginAndPay;

    return-object v0
.end method

.method public getPlatformUserNickName()Ljava/lang/String;
    .locals 2

    .prologue
    .line 571
    iget-object v1, p0, Lcom/youai/dreamonepiece/GameActivity;->mPlatform:Lcom/youai/IPlatformLoginAndPay;

    if-nez v1, :cond_0

    .line 572
    invoke-static {p0}, Lcom/youai/DeviceUtil;->getDeviceProductName(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v1

    .line 580
    :goto_0
    return-object v1

    .line 575
    :cond_0
    iget-object v1, p0, Lcom/youai/dreamonepiece/GameActivity;->mPlatform:Lcom/youai/IPlatformLoginAndPay;

    invoke-interface {v1}, Lcom/youai/IPlatformLoginAndPay;->getLoginInfo()Lcom/youai/PlatformAndGameInfo$LoginInfo;

    move-result-object v0

    .line 576
    .local v0, "login_info":Lcom/youai/PlatformAndGameInfo$LoginInfo;
    if-nez v0, :cond_1

    .line 577
    invoke-static {p0}, Lcom/youai/DeviceUtil;->getDeviceProductName(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v1

    goto :goto_0

    .line 580
    :cond_1
    iget-object v1, v0, Lcom/youai/PlatformAndGameInfo$LoginInfo;->account_nick_name:Ljava/lang/String;

    goto :goto_0
.end method

.method public initAppDataPath(Ljava/lang/String;)V
    .locals 4
    .param p1, "fullPath"    # Ljava/lang/String;

    .prologue
    .line 623
    iput-object p1, p0, Lcom/youai/dreamonepiece/GameActivity;->mAppDataExternalStorageFullPath:Ljava/lang/String;

    .line 624
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v2, p0, Lcom/youai/dreamonepiece/GameActivity;->mAppDataExternalStorageFullPath:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "/Assets"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lcom/youai/dreamonepiece/GameActivity;->mAppDataExternalStorageResourcesFullPath:Ljava/lang/String;

    .line 626
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v2, p0, Lcom/youai/dreamonepiece/GameActivity;->mAppDataExternalStorageFullPath:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "/Cache"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lcom/youai/dreamonepiece/GameActivity;->mAppDataExternalStorageCacheFullPath:Ljava/lang/String;

    .line 633
    new-instance v0, Ljava/io/File;

    iget-object v1, p0, Lcom/youai/dreamonepiece/GameActivity;->mAppDataExternalStorageFullPath:Ljava/lang/String;

    invoke-direct {v0, v1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 634
    .local v0, "tempDir":Ljava/io/File;
    invoke-virtual {v0}, Ljava/io/File;->exists()Z

    move-result v1

    if-nez v1, :cond_0

    .line 635
    invoke-virtual {v0}, Ljava/io/File;->mkdirs()Z

    .line 637
    :cond_0
    invoke-virtual {v0}, Ljava/io/File;->exists()Z

    move-result v1

    if-nez v1, :cond_3

    .line 638
    sget-object v1, Lcom/youai/dreamonepiece/GameActivity;->TAG:Ljava/lang/String;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "mAppDataExternalStorageFullPath: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v0}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, " is not OK!"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 647
    :goto_0
    const/4 v0, 0x0

    .line 649
    new-instance v0, Ljava/io/File;

    .end local v0    # "tempDir":Ljava/io/File;
    iget-object v1, p0, Lcom/youai/dreamonepiece/GameActivity;->mAppDataExternalStorageCacheFullPath:Ljava/lang/String;

    invoke-direct {v0, v1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 650
    .restart local v0    # "tempDir":Ljava/io/File;
    invoke-virtual {v0}, Ljava/io/File;->exists()Z

    move-result v1

    if-nez v1, :cond_1

    .line 651
    invoke-virtual {v0}, Ljava/io/File;->mkdirs()Z

    .line 653
    :cond_1
    invoke-virtual {v0}, Ljava/io/File;->exists()Z

    move-result v1

    if-nez v1, :cond_4

    .line 654
    sget-object v1, Lcom/youai/dreamonepiece/GameActivity;->TAG:Ljava/lang/String;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "AppDataExternalStorageCacheFullPath: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v0}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, " is not OK!"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 662
    :goto_1
    const/4 v0, 0x0

    .line 664
    new-instance v0, Ljava/io/File;

    .end local v0    # "tempDir":Ljava/io/File;
    iget-object v1, p0, Lcom/youai/dreamonepiece/GameActivity;->mAppDataExternalStorageResourcesFullPath:Ljava/lang/String;

    invoke-direct {v0, v1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 665
    .restart local v0    # "tempDir":Ljava/io/File;
    invoke-virtual {v0}, Ljava/io/File;->exists()Z

    move-result v1

    if-nez v1, :cond_2

    .line 666
    invoke-virtual {v0}, Ljava/io/File;->mkdirs()Z

    .line 668
    :cond_2
    invoke-virtual {v0}, Ljava/io/File;->exists()Z

    move-result v1

    if-nez v1, :cond_5

    .line 669
    sget-object v1, Lcom/youai/dreamonepiece/GameActivity;->TAG:Ljava/lang/String;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "AppDataExternalStorageResourcesFullPath: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v0}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, " is not OK!"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 677
    :goto_2
    const/4 v0, 0x0

    .line 679
    return-void

    .line 642
    :cond_3
    sget-object v1, Lcom/youai/dreamonepiece/GameActivity;->TAG:Ljava/lang/String;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "mAppDataExternalStorageFullPath: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v0}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    goto/16 :goto_0

    .line 658
    :cond_4
    sget-object v1, Lcom/youai/dreamonepiece/GameActivity;->TAG:Ljava/lang/String;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "AppDataExternalStorageCacheFullPath: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v0}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_1

    .line 673
    :cond_5
    sget-object v1, Lcom/youai/dreamonepiece/GameActivity;->TAG:Ljava/lang/String;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "AppDataExternalStorageResourcesFullPath: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v0}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_2
.end method

.method public initCocos2dxAndroidContext(Landroid/view/View;Landroid/view/View;Landroid/os/Handler;)V
    .locals 0
    .param p1, "glView"    # Landroid/view/View;
    .param p2, "editText"    # Landroid/view/View;
    .param p3, "handler"    # Landroid/os/Handler;

    .prologue
    .line 753
    iput-object p3, p0, Lcom/youai/dreamonepiece/GameActivity;->mGameContextStateHandler:Landroid/os/Handler;

    .line 754
    invoke-super {p0, p1, p2}, Lorg/cocos2dx/lib/Cocos2dxActivity;->initAndroidContext(Landroid/view/View;Landroid/view/View;)V

    .line 755
    return-void
.end method

.method public initPlatformSDK(Lcom/youai/IPlatformLoginAndPay;)V
    .locals 0
    .param p1, "platform"    # Lcom/youai/IPlatformLoginAndPay;

    .prologue
    .line 713
    iput-object p1, p0, Lcom/youai/dreamonepiece/GameActivity;->mPlatform:Lcom/youai/IPlatformLoginAndPay;

    .line 714
    return-void
.end method

.method public isWorked()Z
    .locals 5

    .prologue
    .line 1155
    const-string v3, "activity"

    invoke-virtual {p0, v3}, Lcom/youai/dreamonepiece/GameActivity;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/app/ActivityManager;

    .line 1157
    .local v1, "myManager":Landroid/app/ActivityManager;
    const v3, 0x7fffffff

    invoke-virtual {v1, v3}, Landroid/app/ActivityManager;->getRunningServices(I)Ljava/util/List;

    move-result-object v2

    check-cast v2, Ljava/util/ArrayList;

    .line 1159
    .local v2, "runningService":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Landroid/app/ActivityManager$RunningServiceInfo;>;"
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    move-result v3

    if-ge v0, v3, :cond_1

    .line 1160
    invoke-virtual {v2, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Landroid/app/ActivityManager$RunningServiceInfo;

    iget-object v3, v3, Landroid/app/ActivityManager$RunningServiceInfo;->service:Landroid/content/ComponentName;

    invoke-virtual {v3}, Landroid/content/ComponentName;->getClassName()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/String;->toString()Ljava/lang/String;

    move-result-object v3

    const-string v4, "com.youai.dreamonepiece.notificationservice"

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_0

    .line 1162
    const/4 v3, 0x1

    .line 1165
    :goto_1
    return v3

    .line 1159
    :cond_0
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 1165
    :cond_1
    const/4 v3, 0x0

    goto :goto_1
.end method

.method public notifyEnterGame()V
    .locals 0

    .prologue
    .line 867
    return-void
.end method

.method public notifyEnterGameAppState(Landroid/os/Handler;)V
    .locals 2
    .param p1, "handler"    # Landroid/os/Handler;

    .prologue
    .line 779
    sget-object v0, Lcom/youai/dreamonepiece/GameActivity;->TAG:Ljava/lang/String;

    const-string v1, "notifyEnterGameAppState"

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 781
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/youai/dreamonepiece/GameActivity;->mHaveEnteredGameAppState:Z

    .line 782
    iget-object v0, p0, Lcom/youai/dreamonepiece/GameActivity;->mVersionResult:Lcom/youai/PlatformAndGameInfo$VersionInfo;

    if-eqz v0, :cond_0

    .line 783
    iget-object v0, p0, Lcom/youai/dreamonepiece/GameActivity;->mVersionResult:Lcom/youai/PlatformAndGameInfo$VersionInfo;

    invoke-virtual {p0, v0}, Lcom/youai/dreamonepiece/GameActivity;->notifyVersionCheckResult(Lcom/youai/PlatformAndGameInfo$VersionInfo;)V

    .line 784
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/youai/dreamonepiece/GameActivity;->mVersionResult:Lcom/youai/PlatformAndGameInfo$VersionInfo;

    .line 787
    :cond_0
    invoke-super {p0, p1}, Lorg/cocos2dx/lib/Cocos2dxActivity;->setGameAppStateHandler(Landroid/os/Handler;)V

    .line 789
    return-void
.end method

.method public notifyInitPlatformSDKComplete()V
    .locals 2

    .prologue
    .line 718
    sget-object v0, Lcom/youai/dreamonepiece/GameActivity;->TAG:Ljava/lang/String;

    const-string v1, "notifyInitPlatformSDKComplete"

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 719
    return-void
.end method

.method public notifyLoginResut(Lcom/youai/PlatformAndGameInfo$LoginInfo;)V
    .locals 4
    .param p1, "result"    # Lcom/youai/PlatformAndGameInfo$LoginInfo;

    .prologue
    const/4 v3, 0x0

    .line 799
    sget-object v0, Lcom/youai/dreamonepiece/GameActivity;->TAG:Ljava/lang/String;

    const-string v1, "notifyLoginResut"

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 801
    invoke-super {p0, v3}, Lorg/cocos2dx/lib/Cocos2dxActivity;->setOnTempShortPause(Z)V

    .line 806
    iget-wide v0, p1, Lcom/youai/PlatformAndGameInfo$LoginInfo;->account_uid:J

    invoke-static {v0, v1}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object v0

    iget-object v1, p1, Lcom/youai/PlatformAndGameInfo$LoginInfo;->login_session:Ljava/lang/String;

    iget-object v2, p1, Lcom/youai/PlatformAndGameInfo$LoginInfo;->account_nick_name:Ljava/lang/String;

    invoke-static {v3, v0, v1, v2}, Lorg/cocos2dx/lib/Cocos2dxHelper;->nativeNotifyPlatformLoginResult(ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 810
    return-void
.end method

.method public notifyOnTempShortPause()V
    .locals 1

    .prologue
    .line 794
    const/4 v0, 0x1

    invoke-super {p0, v0}, Lorg/cocos2dx/lib/Cocos2dxActivity;->setOnTempShortPause(Z)V

    .line 795
    return-void
.end method

.method public notifyPayRechargeResult(Lcom/youai/PlatformAndGameInfo$PayInfo;)V
    .locals 8
    .param p1, "result"    # Lcom/youai/PlatformAndGameInfo$PayInfo;

    .prologue
    .line 814
    sget-object v0, Lcom/youai/dreamonepiece/GameActivity;->TAG:Ljava/lang/String;

    const-string v1, "notifyPayRechargeResult"

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 822
    iget v0, p1, Lcom/youai/PlatformAndGameInfo$PayInfo;->result:I

    iget-object v1, p1, Lcom/youai/PlatformAndGameInfo$PayInfo;->order_serial:Ljava/lang/String;

    iget-object v2, p1, Lcom/youai/PlatformAndGameInfo$PayInfo;->product_id:Ljava/lang/String;

    iget-object v3, p1, Lcom/youai/PlatformAndGameInfo$PayInfo;->product_name:Ljava/lang/String;

    iget v4, p1, Lcom/youai/PlatformAndGameInfo$PayInfo;->price:F

    iget v5, p1, Lcom/youai/PlatformAndGameInfo$PayInfo;->orignal_price:F

    iget v6, p1, Lcom/youai/PlatformAndGameInfo$PayInfo;->count:I

    iget-object v7, p1, Lcom/youai/PlatformAndGameInfo$PayInfo;->description:Ljava/lang/String;

    invoke-static/range {v0 .. v7}, Lorg/cocos2dx/lib/Cocos2dxHelper;->nativeNotifyPlatformPayResult(ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;FFILjava/lang/String;)V

    .line 827
    return-void
.end method

.method public notifyTryUserRegistSuccess()V
    .locals 0

    .prologue
    .line 1284
    invoke-static {}, Lcom/youai/dreamonepiece/GameActivity;->nativeNotifyTryUserRegistSuccess()V

    .line 1285
    return-void
.end method

.method public notifyVersionCheckResult(Lcom/youai/PlatformAndGameInfo$VersionInfo;)V
    .locals 4
    .param p1, "versionInfo"    # Lcom/youai/PlatformAndGameInfo$VersionInfo;

    .prologue
    const/4 v2, 0x1

    .line 723
    sget-object v0, Lcom/youai/dreamonepiece/GameActivity;->TAG:Ljava/lang/String;

    const-string v1, "notifyVersionCheckResult"

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 725
    iget-boolean v0, p0, Lcom/youai/dreamonepiece/GameActivity;->mHaveEnteredGameAppState:Z

    if-eqz v0, :cond_3

    .line 726
    iget v0, p1, Lcom/youai/PlatformAndGameInfo$VersionInfo;->update_info:I

    if-nez v0, :cond_1

    .line 727
    iget v0, p1, Lcom/youai/PlatformAndGameInfo$VersionInfo;->update_info:I

    iget v1, p1, Lcom/youai/PlatformAndGameInfo$VersionInfo;->max_version_code:I

    iget v2, p1, Lcom/youai/PlatformAndGameInfo$VersionInfo;->local_version_code:I

    iget-object v3, p1, Lcom/youai/PlatformAndGameInfo$VersionInfo;->download_url:Ljava/lang/String;

    invoke-static {v0, v1, v2, v3}, Lorg/cocos2dx/lib/Cocos2dxHelper;->nativeNotifyPlatformGameUpdateResult(IIILjava/lang/String;)V

    .line 747
    :cond_0
    :goto_0
    return-void

    .line 731
    :cond_1
    iget v0, p1, Lcom/youai/PlatformAndGameInfo$VersionInfo;->update_info:I

    if-ne v0, v2, :cond_2

    .line 732
    iget v0, p1, Lcom/youai/PlatformAndGameInfo$VersionInfo;->update_info:I

    iget v1, p1, Lcom/youai/PlatformAndGameInfo$VersionInfo;->max_version_code:I

    iget v2, p1, Lcom/youai/PlatformAndGameInfo$VersionInfo;->local_version_code:I

    iget-object v3, p1, Lcom/youai/PlatformAndGameInfo$VersionInfo;->download_url:Ljava/lang/String;

    invoke-static {v0, v1, v2, v3}, Lorg/cocos2dx/lib/Cocos2dxHelper;->nativeNotifyPlatformGameUpdateResult(IIILjava/lang/String;)V

    goto :goto_0

    .line 736
    :cond_2
    iget v0, p1, Lcom/youai/PlatformAndGameInfo$VersionInfo;->update_info:I

    const/4 v1, 0x2

    if-ne v0, v1, :cond_0

    .line 737
    sget-object v0, Lcom/youai/dreamonepiece/GameActivity;->TAG:Ljava/lang/String;

    const-string v1, "notifyVersionCheckResult: enUpdateInfo_Force"

    invoke-static {v0, v1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 739
    const/4 v0, -0x1

    const-string v1, "\u9700\u8981\u5f3a\u5236\u7248\u672c\u66f4\u65b0\uff0c\u8bf7\u4e0b\u8f7d\u65b0\u7248\u672c\u91cd\u65b0\u5b89\u88c5"

    invoke-virtual {p0, v2, v0, v1}, Lcom/youai/dreamonepiece/GameActivity;->showWaitingView(ZILjava/lang/String;)V

    goto :goto_0

    .line 745
    :cond_3
    iput-object p1, p0, Lcom/youai/dreamonepiece/GameActivity;->mVersionResult:Lcom/youai/PlatformAndGameInfo$VersionInfo;

    goto :goto_0
.end method

.method public onCompletion(Landroid/media/MediaPlayer;)V
    .locals 3
    .param p1, "mp"    # Landroid/media/MediaPlayer;

    .prologue
    const/4 v2, 0x4

    .line 1245
    sget-object v0, Lcom/youai/dreamonepiece/GameActivity;->TAG:Ljava/lang/String;

    const-string v1, "nativeOnPlayMovieEnd"

    invoke-static {v0, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 1246
    sget-object v0, Lcom/youai/dreamonepiece/GameActivity;->buttonStopMovie:Landroid/widget/ImageButton;

    invoke-virtual {v0, v2}, Landroid/widget/ImageButton;->setVisibility(I)V

    .line 1247
    sget-object v0, Lcom/youai/dreamonepiece/GameActivity;->mGameApp:Lcom/youai/dreamonepiece/GameActivity;

    iget-object v0, v0, Lcom/youai/dreamonepiece/GameActivity;->mGLSurfaceView:Lorg/cocos2dx/lib/Cocos2dxGLSurfaceView;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lorg/cocos2dx/lib/Cocos2dxGLSurfaceView;->setVisibility(I)V

    .line 1248
    sget-object v0, Lcom/youai/dreamonepiece/GameActivity;->videoWorldView:Lcom/youai/WorldVideoView;

    invoke-virtual {v0}, Lcom/youai/WorldVideoView;->stopPlayback()V

    .line 1249
    sget-object v0, Lcom/youai/dreamonepiece/GameActivity;->mGameApp:Lcom/youai/dreamonepiece/GameActivity;

    iget-object v0, v0, Lcom/youai/dreamonepiece/GameActivity;->mGLSurfaceView:Lorg/cocos2dx/lib/Cocos2dxGLSurfaceView;

    new-instance v1, Lcom/youai/dreamonepiece/GameActivity$15;

    invoke-direct {v1, p0}, Lcom/youai/dreamonepiece/GameActivity$15;-><init>(Lcom/youai/dreamonepiece/GameActivity;)V

    invoke-virtual {v0, v1}, Lorg/cocos2dx/lib/Cocos2dxGLSurfaceView;->queueEvent(Ljava/lang/Runnable;)V

    .line 1256
    sget-object v0, Lcom/youai/dreamonepiece/GameActivity;->videoWorldView:Lcom/youai/WorldVideoView;

    invoke-virtual {v0, v2}, Lcom/youai/WorldVideoView;->setVisibility(I)V

    .line 1257
    return-void
.end method

.method protected onCreate(Landroid/os/Bundle;)V
    .locals 9
    .param p1, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    .line 158
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v4

    .line 160
    .local v4, "start":J
    invoke-super {p0, p1}, Lorg/cocos2dx/lib/Cocos2dxActivity;->onCreate(Landroid/os/Bundle;)V

    .line 162
    invoke-virtual {p0}, Lcom/youai/dreamonepiece/GameActivity;->getMainHandler()Landroid/os/Handler;

    move-result-object v6

    sput-object v6, Lcom/youai/dreamonepiece/GameActivity;->mHandler:Landroid/os/Handler;

    .line 163
    invoke-virtual {p0}, Lcom/youai/dreamonepiece/GameActivity;->getActivity()Lcom/youai/dreamonepiece/GameActivity;

    move-result-object v6

    sput-object v6, Lcom/youai/dreamonepiece/GameActivity;->mContext:Landroid/content/Context;

    .line 164
    sput-object p0, Lcom/youai/dreamonepiece/GameActivity;->mGameApp:Lcom/youai/dreamonepiece/GameActivity;

    .line 165
    iget-object v6, p0, Lcom/youai/dreamonepiece/GameActivity;->mStateMgr:Lcom/youai/IStateManager;

    const/4 v7, 0x1

    invoke-interface {v6, v7}, Lcom/youai/IStateManager;->changeState(I)V

    .line 167
    new-instance v6, Lcom/youai/ShakeLisenter;

    invoke-direct {v6, p0}, Lcom/youai/ShakeLisenter;-><init>(Landroid/content/Context;)V

    iput-object v6, p0, Lcom/youai/dreamonepiece/GameActivity;->mShakeListener:Lcom/youai/ShakeLisenter;

    .line 168
    iget-object v6, p0, Lcom/youai/dreamonepiece/GameActivity;->mShakeListener:Lcom/youai/ShakeLisenter;

    new-instance v7, Lcom/youai/dreamonepiece/GameActivity$shakeLitener;

    const/4 v8, 0x0

    invoke-direct {v7, p0, v8}, Lcom/youai/dreamonepiece/GameActivity$shakeLitener;-><init>(Lcom/youai/dreamonepiece/GameActivity;Lcom/youai/dreamonepiece/GameActivity$1;)V

    invoke-virtual {v6, v7}, Lcom/youai/ShakeLisenter;->setOnShakeListener(Lcom/youai/ShakeLisenter$OnShakeListener;)V

    .line 176
    new-instance v6, Landroid/os/StrictMode$ThreadPolicy$Builder;

    invoke-direct {v6}, Landroid/os/StrictMode$ThreadPolicy$Builder;-><init>()V

    invoke-virtual {v6}, Landroid/os/StrictMode$ThreadPolicy$Builder;->detectNetwork()Landroid/os/StrictMode$ThreadPolicy$Builder;

    move-result-object v6

    invoke-virtual {v6}, Landroid/os/StrictMode$ThreadPolicy$Builder;->build()Landroid/os/StrictMode$ThreadPolicy;

    move-result-object v6

    invoke-static {v6}, Landroid/os/StrictMode;->setThreadPolicy(Landroid/os/StrictMode$ThreadPolicy;)V

    .line 185
    invoke-virtual {p0}, Lcom/youai/dreamonepiece/GameActivity;->getGameInfo()Lcom/youai/PlatformAndGameInfo$GameInfo;

    move-result-object v6

    invoke-static {p0, v6}, Lcom/youai/dreamonepiece/AnalyticsToolHelp;->onCreate(Landroid/content/Context;Lcom/youai/PlatformAndGameInfo$GameInfo;)V

    .line 194
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    .line 195
    .local v0, "end":J
    sub-long v2, v0, v4

    .line 196
    .local v2, "span":J
    sget-object v6, Lcom/youai/dreamonepiece/GameActivity;->TAG:Ljava/lang/String;

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "onCreate cost time: "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, v2, v3}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string v8, " millis"

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-static {v6, v7}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 198
    return-void
.end method

.method protected onDestroy()V
    .locals 2

    .prologue
    .line 202
    invoke-super {p0}, Lorg/cocos2dx/lib/Cocos2dxActivity;->onDestroy()V

    .line 203
    iget-object v0, p0, Lcom/youai/dreamonepiece/GameActivity;->updateApk:Lcom/youai/dreamonepiece/DownloadApk;

    if-eqz v0, :cond_0

    .line 204
    iget-object v0, p0, Lcom/youai/dreamonepiece/GameActivity;->updateApk:Lcom/youai/dreamonepiece/DownloadApk;

    invoke-virtual {v0}, Lcom/youai/dreamonepiece/DownloadApk;->onDestroy()V

    .line 205
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/youai/dreamonepiece/GameActivity;->updateApk:Lcom/youai/dreamonepiece/DownloadApk;

    .line 208
    :cond_0
    sget-object v0, Lcom/youai/dreamonepiece/GameActivity;->TAG:Ljava/lang/String;

    const-string v1, "call onDestroy and System exit"

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 214
    invoke-static {}, Landroid/os/Process;->myPid()I

    move-result v0

    invoke-static {v0}, Landroid/os/Process;->killProcess(I)V

    .line 216
    return-void
.end method

.method public onKeyDown(ILandroid/view/KeyEvent;)Z
    .locals 7
    .param p1, "keyCode"    # I
    .param p2, "event"    # Landroid/view/KeyEvent;

    .prologue
    .line 289
    sget-object v3, Lcom/youai/dreamonepiece/GameActivity;->TAG:Ljava/lang/String;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "onKeyDown, keyCode: "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-static {p1}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, " getDownTime: "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {p2}, Landroid/view/KeyEvent;->getDownTime()J

    move-result-wide v5

    invoke-static {v5, v6}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 292
    const/16 v3, 0x1a

    if-ne p1, v3, :cond_1

    .line 293
    invoke-virtual {p2}, Landroid/view/KeyEvent;->isLongPress()Z

    move-result v3

    if-eqz v3, :cond_c

    .line 294
    sget-object v3, Lcom/youai/dreamonepiece/GameActivity;->TAG:Ljava/lang/String;

    const-string v4, "KEYCODE_POWER isLongPress"

    invoke-static {v3, v4}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 295
    iget-boolean v3, p0, Lcom/youai/dreamonepiece/GameActivity;->mIsCocos2dxSurfaceViewCreated:Z

    if-nez v3, :cond_0

    .line 296
    invoke-super {p0}, Lorg/cocos2dx/lib/Cocos2dxActivity;->onLowMemory()V

    .line 298
    :cond_0
    const/4 v3, 0x1

    .line 382
    :goto_0
    return v3

    .line 300
    :cond_1
    const/16 v3, 0x52

    if-ne p1, v3, :cond_7

    .line 302
    iget-boolean v3, p0, Lcom/youai/dreamonepiece/GameActivity;->mIsTempShortPause:Z

    if-nez v3, :cond_2

    iget-boolean v3, p0, Lcom/youai/dreamonepiece/GameActivity;->mIsOnPause:Z

    if-nez v3, :cond_2

    iget-boolean v3, p0, Lcom/youai/dreamonepiece/GameActivity;->mIsCocos2dxSurfaceViewCreated:Z

    if-nez v3, :cond_3

    .line 304
    :cond_2
    invoke-super {p0, p1, p2}, Lorg/cocos2dx/lib/Cocos2dxActivity;->onKeyDown(ILandroid/view/KeyEvent;)Z

    move-result v3

    goto :goto_0

    .line 306
    :cond_3
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide v0

    .line 308
    .local v0, "nowtime":J
    iget-wide v3, p0, Lcom/youai/dreamonepiece/GameActivity;->mLastMenuKeyDownTimeMillis:J

    sub-long v3, v0, v3

    const-wide/16 v5, 0xbb8

    cmp-long v3, v3, v5

    if-gez v3, :cond_4

    iget-wide v3, p0, Lcom/youai/dreamonepiece/GameActivity;->mRecentPressMenuKeyDownCount:J

    const-wide/16 v5, 0x0

    cmp-long v3, v3, v5

    if-lez v3, :cond_4

    .line 311
    const-wide/16 v3, 0x0

    iput-wide v3, p0, Lcom/youai/dreamonepiece/GameActivity;->mRecentPressMenuKeyDownCount:J

    .line 312
    const-string v3, "\u6b63\u5728\u622a\u5c4f"

    const/4 v4, 0x0

    invoke-static {p0, v3, v4}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v3

    invoke-virtual {v3}, Landroid/widget/Toast;->show()V

    .line 314
    move-object v2, p0

    .line 317
    .local v2, "theActivity":Lcom/youai/dreamonepiece/GameActivity;
    new-instance v3, Lcom/youai/dreamonepiece/GameActivity$2;

    invoke-direct {v3, p0, v2}, Lcom/youai/dreamonepiece/GameActivity$2;-><init>(Lcom/youai/dreamonepiece/GameActivity;Lcom/youai/dreamonepiece/GameActivity;)V

    invoke-super {p0, v3}, Lorg/cocos2dx/lib/Cocos2dxActivity;->runOnGLThread(Ljava/lang/Runnable;)V

    .line 334
    const/4 v3, 0x1

    goto :goto_0

    .line 337
    .end local v2    # "theActivity":Lcom/youai/dreamonepiece/GameActivity;
    :cond_4
    iget-wide v3, p0, Lcom/youai/dreamonepiece/GameActivity;->mLastMenuKeyDownTimeMillis:J

    sub-long v3, v0, v3

    const-wide/16 v5, 0xbb8

    cmp-long v3, v3, v5

    if-gez v3, :cond_5

    .line 338
    invoke-super {p0, p1, p2}, Lorg/cocos2dx/lib/Cocos2dxActivity;->onKeyDown(ILandroid/view/KeyEvent;)Z

    move-result v3

    goto :goto_0

    .line 340
    :cond_5
    iput-wide v0, p0, Lcom/youai/dreamonepiece/GameActivity;->mLastMenuKeyDownTimeMillis:J

    .line 342
    iget-wide v3, p0, Lcom/youai/dreamonepiece/GameActivity;->mRecentPressMenuKeyDownCount:J

    const-wide/16 v5, 0x1

    cmp-long v3, v3, v5

    if-gez v3, :cond_6

    .line 344
    const-string v3, "\u518d\u6309\u4e00\u6b21\u622a\u5c4f\u5206\u4eab"

    const/4 v4, 0x0

    invoke-static {p0, v3, v4}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v3

    invoke-virtual {v3}, Landroid/widget/Toast;->show()V

    .line 346
    iget-wide v3, p0, Lcom/youai/dreamonepiece/GameActivity;->mRecentPressMenuKeyDownCount:J

    const-wide/16 v5, 0x1

    add-long/2addr v3, v5

    iput-wide v3, p0, Lcom/youai/dreamonepiece/GameActivity;->mRecentPressMenuKeyDownCount:J

    .line 348
    invoke-super {p0, p1, p2}, Lorg/cocos2dx/lib/Cocos2dxActivity;->onKeyDown(ILandroid/view/KeyEvent;)Z

    move-result v3

    goto :goto_0

    .line 350
    :cond_6
    const-string v3, "\u518d\u6309\u4e00\u6b21\u622a\u5c4f\u5206\u4eab"

    const/4 v4, 0x0

    invoke-static {p0, v3, v4}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v3

    invoke-virtual {v3}, Landroid/widget/Toast;->show()V

    .line 351
    invoke-super {p0, p1, p2}, Lorg/cocos2dx/lib/Cocos2dxActivity;->onKeyDown(ILandroid/view/KeyEvent;)Z

    move-result v3

    goto/16 :goto_0

    .line 353
    .end local v0    # "nowtime":J
    :cond_7
    const/4 v3, 0x4

    if-ne p1, v3, :cond_c

    .line 355
    sget-boolean v3, Lcom/youai/dreamonepiece/GameActivity;->canPressBack:Z

    if-nez v3, :cond_8

    .line 356
    const/4 v3, 0x1

    goto/16 :goto_0

    .line 359
    :cond_8
    iget-object v3, p0, Lcom/youai/dreamonepiece/GameActivity;->mGameCfg:Lcom/youai/dreamonepiece/GameConfig;

    iget-object v3, v3, Lcom/youai/dreamonepiece/GameConfig;->mGameInfo:Lcom/youai/PlatformAndGameInfo$GameInfo;

    iget v3, v3, Lcom/youai/PlatformAndGameInfo$GameInfo;->platform_type:I

    const/4 v4, 0x1

    if-eq v3, v4, :cond_9

    iget-object v3, p0, Lcom/youai/dreamonepiece/GameActivity;->mGameCfg:Lcom/youai/dreamonepiece/GameConfig;

    iget-object v3, v3, Lcom/youai/dreamonepiece/GameConfig;->mGameInfo:Lcom/youai/PlatformAndGameInfo$GameInfo;

    iget v3, v3, Lcom/youai/PlatformAndGameInfo$GameInfo;->platform_type:I

    const/4 v4, 0x3

    if-eq v3, v4, :cond_9

    iget-object v3, p0, Lcom/youai/dreamonepiece/GameActivity;->mGameCfg:Lcom/youai/dreamonepiece/GameConfig;

    iget-object v3, v3, Lcom/youai/dreamonepiece/GameConfig;->mGameInfo:Lcom/youai/PlatformAndGameInfo$GameInfo;

    iget v3, v3, Lcom/youai/PlatformAndGameInfo$GameInfo;->platform_type:I

    const/4 v4, 0x2

    if-eq v3, v4, :cond_9

    iget-object v3, p0, Lcom/youai/dreamonepiece/GameActivity;->mGameCfg:Lcom/youai/dreamonepiece/GameConfig;

    iget-object v3, v3, Lcom/youai/dreamonepiece/GameConfig;->mGameInfo:Lcom/youai/PlatformAndGameInfo$GameInfo;

    iget v3, v3, Lcom/youai/PlatformAndGameInfo$GameInfo;->platform_type:I

    const/16 v4, 0x20

    if-eq v3, v4, :cond_9

    iget-object v3, p0, Lcom/youai/dreamonepiece/GameActivity;->mGameCfg:Lcom/youai/dreamonepiece/GameConfig;

    iget-object v3, v3, Lcom/youai/dreamonepiece/GameConfig;->mGameInfo:Lcom/youai/PlatformAndGameInfo$GameInfo;

    iget v3, v3, Lcom/youai/PlatformAndGameInfo$GameInfo;->platform_type:I

    const/16 v4, 0x17

    if-eq v3, v4, :cond_9

    iget-object v3, p0, Lcom/youai/dreamonepiece/GameActivity;->mGameCfg:Lcom/youai/dreamonepiece/GameConfig;

    iget-object v3, v3, Lcom/youai/dreamonepiece/GameConfig;->mGameInfo:Lcom/youai/PlatformAndGameInfo$GameInfo;

    iget v3, v3, Lcom/youai/PlatformAndGameInfo$GameInfo;->platform_type:I

    const/16 v4, 0x49

    if-eq v3, v4, :cond_9

    iget-object v3, p0, Lcom/youai/dreamonepiece/GameActivity;->mGameCfg:Lcom/youai/dreamonepiece/GameConfig;

    iget-object v3, v3, Lcom/youai/dreamonepiece/GameConfig;->mGameInfo:Lcom/youai/PlatformAndGameInfo$GameInfo;

    iget v3, v3, Lcom/youai/PlatformAndGameInfo$GameInfo;->platform_type:I

    const/16 v4, 0x3d

    if-ne v3, v4, :cond_b

    .line 366
    :cond_9
    iget-object v3, p0, Lcom/youai/dreamonepiece/GameActivity;->mPlatform:Lcom/youai/IPlatformLoginAndPay;

    if-eqz v3, :cond_a

    .line 367
    const/4 v3, 0x1

    invoke-super {p0, v3}, Lorg/cocos2dx/lib/Cocos2dxActivity;->setOnTempShortPause(Z)V

    .line 368
    iget-object v3, p0, Lcom/youai/dreamonepiece/GameActivity;->mPlatform:Lcom/youai/IPlatformLoginAndPay;

    invoke-interface {v3}, Lcom/youai/IPlatformLoginAndPay;->onGameExit()V

    .line 369
    const/4 v3, 0x1

    goto/16 :goto_0

    .line 371
    :cond_a
    invoke-direct {p0}, Lcom/youai/dreamonepiece/GameActivity;->showExitDialog()V

    .line 376
    :goto_1
    const/4 v3, 0x1

    goto/16 :goto_0

    .line 374
    :cond_b
    invoke-direct {p0}, Lcom/youai/dreamonepiece/GameActivity;->showExitDialog()V

    goto :goto_1

    .line 379
    :cond_c
    sget-object v3, Lcom/youai/dreamonepiece/GameActivity;->TAG:Ljava/lang/String;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "onKeyDown, voloum keyCode: "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-static {p1}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, " getDownTime: "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {p2}, Landroid/view/KeyEvent;->getDownTime()J

    move-result-wide v5

    invoke-static {v5, v6}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 382
    invoke-super {p0, p1, p2}, Lorg/cocos2dx/lib/Cocos2dxActivity;->onKeyDown(ILandroid/view/KeyEvent;)Z

    move-result v3

    goto/16 :goto_0
.end method

.method public onKeyLongPress(ILandroid/view/KeyEvent;)Z
    .locals 4
    .param p1, "keyCode"    # I
    .param p2, "event"    # Landroid/view/KeyEvent;

    .prologue
    .line 417
    sget-object v1, Lcom/youai/dreamonepiece/GameActivity;->TAG:Ljava/lang/String;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "onKeyLongPress, keyCode: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-static {p1}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 419
    iget-boolean v1, p0, Lcom/youai/dreamonepiece/GameActivity;->mIsTempShortPause:Z

    if-nez v1, :cond_0

    iget-boolean v1, p0, Lcom/youai/dreamonepiece/GameActivity;->mIsOnPause:Z

    if-eqz v1, :cond_1

    .line 420
    :cond_0
    invoke-super {p0, p1, p2}, Lorg/cocos2dx/lib/Cocos2dxActivity;->onKeyDown(ILandroid/view/KeyEvent;)Z

    move-result v1

    .line 443
    :goto_0
    return v1

    .line 422
    :cond_1
    const/16 v1, 0x52

    if-ne p1, v1, :cond_2

    .line 423
    invoke-static {}, Lorg/cocos2dx/lib/Cocos2dxActivity;->getContext()Landroid/content/Context;

    move-result-object v0

    check-cast v0, Lcom/youai/dreamonepiece/GameActivity;

    .line 426
    .local v0, "theActivity":Lcom/youai/dreamonepiece/GameActivity;
    new-instance v1, Lcom/youai/dreamonepiece/GameActivity$6;

    invoke-direct {v1, p0, v0}, Lcom/youai/dreamonepiece/GameActivity$6;-><init>(Lcom/youai/dreamonepiece/GameActivity;Lcom/youai/dreamonepiece/GameActivity;)V

    invoke-super {p0, v1}, Lorg/cocos2dx/lib/Cocos2dxActivity;->runOnGLThread(Ljava/lang/Runnable;)V

    .line 440
    const/4 v1, 0x1

    goto :goto_0

    .line 443
    .end local v0    # "theActivity":Lcom/youai/dreamonepiece/GameActivity;
    :cond_2
    invoke-super {p0, p1, p2}, Lorg/cocos2dx/lib/Cocos2dxActivity;->onKeyLongPress(ILandroid/view/KeyEvent;)Z

    move-result v1

    goto :goto_0
.end method

.method protected onPause()V
    .locals 1

    .prologue
    .line 270
    sget-object v0, Lcom/youai/dreamonepiece/GameActivity;->videoWorldView:Lcom/youai/WorldVideoView;

    if-eqz v0, :cond_0

    sget-object v0, Lcom/youai/dreamonepiece/GameActivity;->videoWorldView:Lcom/youai/WorldVideoView;

    invoke-virtual {v0}, Lcom/youai/WorldVideoView;->isPlaying()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 271
    invoke-static {}, Lcom/youai/dreamonepiece/GameActivity;->stopMovie()V

    .line 272
    :cond_0
    invoke-super {p0}, Lorg/cocos2dx/lib/Cocos2dxActivity;->onPause()V

    .line 273
    invoke-static {}, Lcom/youai/dreamonepiece/AnalyticsToolHelp;->onPause()V

    .line 275
    return-void
.end method

.method protected onResume()V
    .locals 2

    .prologue
    .line 252
    invoke-super {p0}, Lorg/cocos2dx/lib/Cocos2dxActivity;->onResume()V

    .line 253
    invoke-virtual {p0}, Lcom/youai/dreamonepiece/GameActivity;->getActivity()Lcom/youai/dreamonepiece/GameActivity;

    move-result-object v0

    sput-object v0, Lcom/youai/dreamonepiece/GameActivity;->mContext:Landroid/content/Context;

    .line 254
    sget-boolean v0, Lcom/youai/dreamonepiece/GameActivity;->weChatHave:Z

    if-eqz v0, :cond_0

    .line 255
    sget-object v0, Lcom/youai/dreamonepiece/GameActivity;->mGameApp:Lcom/youai/dreamonepiece/GameActivity;

    new-instance v1, Lcom/youai/dreamonepiece/GameActivity$1;

    invoke-direct {v1, p0}, Lcom/youai/dreamonepiece/GameActivity$1;-><init>(Lcom/youai/dreamonepiece/GameActivity;)V

    invoke-virtual {v0, v1}, Lcom/youai/dreamonepiece/GameActivity;->runOnGLThread(Ljava/lang/Runnable;)V

    .line 263
    const/4 v0, 0x0

    sput-boolean v0, Lcom/youai/dreamonepiece/GameActivity;->weChatHave:Z

    .line 265
    :cond_0
    invoke-static {}, Lcom/youai/dreamonepiece/AnalyticsToolHelp;->onResume()V

    .line 266
    return-void
.end method

.method protected onStart()V
    .locals 2

    .prologue
    .line 242
    invoke-super {p0}, Lorg/cocos2dx/lib/Cocos2dxActivity;->onStart()V

    .line 243
    invoke-static {}, Lcom/youai/dreamonepiece/AnalyticsToolHelp;->onStart()V

    .line 245
    sget-object v0, Lcom/youai/dreamonepiece/GameActivity;->TAG:Ljava/lang/String;

    const-string v1, "call onStart"

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 248
    return-void
.end method

.method protected onStop()V
    .locals 2

    .prologue
    .line 280
    invoke-super {p0}, Lorg/cocos2dx/lib/Cocos2dxActivity;->onStop()V

    .line 281
    invoke-static {}, Lcom/youai/dreamonepiece/AnalyticsToolHelp;->onStop()V

    .line 283
    sget-object v0, Lcom/youai/dreamonepiece/GameActivity;->TAG:Ljava/lang/String;

    const-string v1, "call onStop"

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 285
    return-void
.end method

.method public onTimeToShowCocos2dxContentView()V
    .locals 4

    .prologue
    .line 604
    iget-object v0, p0, Lcom/youai/dreamonepiece/GameActivity;->mGameContextStateHandler:Landroid/os/Handler;

    const/4 v1, 0x0

    const-wide/16 v2, 0x0

    invoke-virtual {v0, v1, v2, v3}, Landroid/os/Handler;->sendEmptyMessageDelayed(IJ)Z

    .line 606
    return-void
.end method

.method public openUrlOutside(Ljava/lang/String;)V
    .locals 2
    .param p1, "url"    # Ljava/lang/String;

    .prologue
    .line 592
    invoke-virtual {p1}, Ljava/lang/String;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 600
    :goto_0
    return-void

    .line 595
    :cond_0
    const-string v0, ".apk"

    invoke-virtual {p1, v0}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 596
    new-instance v0, Lcom/youai/dreamonepiece/DownloadApk;

    invoke-virtual {p0}, Lcom/youai/dreamonepiece/GameActivity;->getActivity()Lcom/youai/dreamonepiece/GameActivity;

    move-result-object v1

    invoke-direct {v0, v1, p1}, Lcom/youai/dreamonepiece/DownloadApk;-><init>(Lcom/youai/dreamonepiece/GameActivity;Ljava/lang/String;)V

    iput-object v0, p0, Lcom/youai/dreamonepiece/GameActivity;->updateApk:Lcom/youai/dreamonepiece/DownloadApk;

    goto :goto_0

    .line 598
    :cond_1
    invoke-super {p0, p1}, Lorg/cocos2dx/lib/Cocos2dxActivity;->openUrlOutside(Ljava/lang/String;)V

    goto :goto_0
.end method

.method public pushSysNotification(Ljava/lang/String;Ljava/lang/String;I)V
    .locals 5
    .param p1, "pTitle"    # Ljava/lang/String;
    .param p2, "msg"    # Ljava/lang/String;
    .param p3, "pInstantMinite"    # I

    .prologue
    .line 1119
    const v3, 0x7f0a0023

    invoke-virtual {p0, v3}, Lcom/youai/dreamonepiece/GameActivity;->getString(I)Ljava/lang/String;

    move-result-object v2

    .line 1121
    .local v2, "strTitle":Ljava/lang/String;
    invoke-virtual {p0}, Lcom/youai/dreamonepiece/GameActivity;->isWorked()Z

    move-result v3

    if-nez v3, :cond_0

    .line 1122
    new-instance v3, Landroid/content/Intent;

    const-class v4, Lcom/youai/dreamonepiece/NotificationService;

    invoke-direct {v3, p0, v4}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    invoke-virtual {p0, v3}, Lcom/youai/dreamonepiece/GameActivity;->startService(Landroid/content/Intent;)Landroid/content/ComponentName;

    .line 1125
    new-instance v1, Lcom/youai/dreamonepiece/GameActivity$12;

    invoke-direct {v1, p0, p2, v2, p3}, Lcom/youai/dreamonepiece/GameActivity$12;-><init>(Lcom/youai/dreamonepiece/GameActivity;Ljava/lang/String;Ljava/lang/String;I)V

    .line 1137
    .local v1, "pushRunable":Ljava/lang/Runnable;
    invoke-virtual {p0}, Lcom/youai/dreamonepiece/GameActivity;->getMainHandler()Landroid/os/Handler;

    move-result-object v3

    invoke-virtual {v3, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 1151
    .end local v1    # "pushRunable":Ljava/lang/Runnable;
    :goto_0
    return-void

    .line 1139
    :cond_0
    new-instance v0, Landroid/content/Intent;

    invoke-direct {v0}, Landroid/content/Intent;-><init>()V

    .line 1140
    .local v0, "myIntent":Landroid/content/Intent;
    const-string v3, "com.youai.dreamonepiece.notificationservice"

    invoke-virtual {v0, v3}, Landroid/content/Intent;->setAction(Ljava/lang/String;)Landroid/content/Intent;

    .line 1141
    const-string v3, "message"

    invoke-virtual {v0, v3, p2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 1142
    const-string v3, "title"

    invoke-virtual {v0, v3, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 1143
    const-string v3, "delayminite"

    invoke-virtual {v0, v3, p3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    .line 1144
    invoke-virtual {p0, v0}, Lcom/youai/dreamonepiece/GameActivity;->sendBroadcast(Landroid/content/Intent;)V

    .line 1145
    const-string v3, "GameActivity"

    const-string v4, "pushSysNotification"

    invoke-static {v3, v4}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0
.end method

.method public requestBindTryToOkUser(Ljava/lang/String;Ljava/lang/String;)V
    .locals 0
    .param p1, "tryUin"    # Ljava/lang/String;
    .param p2, "okUin"    # Ljava/lang/String;

    .prologue
    .line 1218
    invoke-static {p1, p2}, Lcom/youai/dreamonepiece/GameActivity;->nativeRequestGameSvrBindTryToOkUser(Ljava/lang/String;Ljava/lang/String;)V

    .line 1219
    return-void
.end method

.method public requestDestroy()V
    .locals 0

    .prologue
    .line 701
    invoke-virtual {p0}, Lcom/youai/dreamonepiece/GameActivity;->destroy()V

    .line 702
    return-void
.end method

.method public showToastMsg(Ljava/lang/String;)V
    .locals 2
    .param p1, "str"    # Ljava/lang/String;

    .prologue
    .line 872
    new-instance v0, Landroid/os/Message;

    invoke-direct {v0}, Landroid/os/Message;-><init>()V

    .line 873
    .local v0, "msg":Landroid/os/Message;
    iput-object p1, v0, Landroid/os/Message;->obj:Ljava/lang/Object;

    .line 874
    const/16 v1, 0x11

    iput v1, v0, Landroid/os/Message;->what:I

    .line 876
    invoke-super {p0}, Lorg/cocos2dx/lib/Cocos2dxActivity;->getMainThreadHandler()Landroid/os/Handler;

    move-result-object v1

    invoke-virtual {v1, v0}, Landroid/os/Handler;->sendMessage(Landroid/os/Message;)Z

    .line 877
    return-void
.end method

.method public showToastMsgImp(Ljava/lang/String;)V
    .locals 1
    .param p1, "msg"    # Ljava/lang/String;

    .prologue
    .line 881
    const/4 v0, 0x0

    invoke-static {p0, p1, v0}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v0

    invoke-virtual {v0}, Landroid/widget/Toast;->show()V

    .line 882
    return-void
.end method

.method public showWaitingViewImp(ZILjava/lang/String;)V
    .locals 0
    .param p1, "show"    # Z
    .param p2, "progress"    # I
    .param p3, "text"    # Ljava/lang/String;

    .prologue
    .line 831
    invoke-super {p0, p1, p2, p3}, Lorg/cocos2dx/lib/Cocos2dxActivity;->showWaitingView(ZILjava/lang/String;)V

    .line 832
    return-void
.end method
