.class Lcom/youai/dreamonepiece/GameAppState$GameAppStateCallback;
.super Ljava/lang/Object;
.source "GameAppState.java"

# interfaces
.implements Lcom/youai/dreamonepiece/GameInterface$IGameAppStateCallback;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/youai/dreamonepiece/GameAppState;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "GameAppStateCallback"
.end annotation


# instance fields
.field final synthetic this$0:Lcom/youai/dreamonepiece/GameAppState;


# direct methods
.method private constructor <init>(Lcom/youai/dreamonepiece/GameAppState;)V
    .locals 0

    .prologue
    .line 199
    iput-object p1, p0, Lcom/youai/dreamonepiece/GameAppState$GameAppStateCallback;->this$0:Lcom/youai/dreamonepiece/GameAppState;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lcom/youai/dreamonepiece/GameAppState;Lcom/youai/dreamonepiece/GameAppState$1;)V
    .locals 0
    .param p1, "x0"    # Lcom/youai/dreamonepiece/GameAppState;
    .param p2, "x1"    # Lcom/youai/dreamonepiece/GameAppState$1;

    .prologue
    .line 199
    invoke-direct {p0, p1}, Lcom/youai/dreamonepiece/GameAppState$GameAppStateCallback;-><init>(Lcom/youai/dreamonepiece/GameAppState;)V

    return-void
.end method


# virtual methods
.method public notifyEnterGameAppState(Landroid/os/Handler;)V
    .locals 0
    .param p1, "handler"    # Landroid/os/Handler;

    .prologue
    .line 205
    return-void
.end method

.method public notifyLoginResut(Lcom/youai/PlatformAndGameInfo$LoginInfo;)V
    .locals 7
    .param p1, "result"    # Lcom/youai/PlatformAndGameInfo$LoginInfo;

    .prologue
    .line 215
    const/4 v3, 0x0

    const/4 v4, -0x1

    const-string v5, ""

    invoke-virtual {p0, v3, v4, v5}, Lcom/youai/dreamonepiece/GameAppState$GameAppStateCallback;->showWaitingViewImp(ZILjava/lang/String;)V

    .line 217
    iget v3, p1, Lcom/youai/PlatformAndGameInfo$LoginInfo;->login_result:I

    if-nez v3, :cond_1

    .line 218
    new-instance v2, Ljava/io/File;

    iget-object v3, p0, Lcom/youai/dreamonepiece/GameAppState$GameAppStateCallback;->this$0:Lcom/youai/dreamonepiece/GameAppState;

    invoke-static {v3}, Lcom/youai/dreamonepiece/GameAppState;->access$500(Lcom/youai/dreamonepiece/GameAppState;)Lcom/youai/IGameActivity;

    move-result-object v3

    invoke-interface {v3}, Lcom/youai/IGameActivity;->getAppFilesResourcesPath()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 220
    .local v2, "rootfiles":Ljava/io/File;
    if-eqz v2, :cond_0

    .line 221
    new-instance v1, Ljava/io/File;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v2}, Ljava/io/File;->getAbsoluteFile()Ljava/io/File;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v3

    sget-object v4, Ljava/io/File;->separator:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, "dynamic.ini"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v1, v3}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 223
    .local v1, "dynamicFile":Ljava/io/File;
    invoke-virtual {v1}, Ljava/io/File;->exists()Z

    move-result v3

    if-eqz v3, :cond_0

    invoke-virtual {v1}, Ljava/io/File;->isFile()Z

    move-result v3

    if-eqz v3, :cond_0

    .line 224
    invoke-virtual {v1}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v3

    const-string v4, "YouaiUrl"

    const-string v5, "rootUrl"

    const-string v6, "1"

    invoke-static {v3, v4, v5, v6}, Lcom/youai/IniFileUtil;->GetPrivateProfileString(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 227
    .local v0, "_youaiUrl":Ljava/lang/String;
    const-string v3, "0"

    invoke-virtual {v0, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_2

    .line 228
    sget-object v3, Lcom/youai/dreamonepiece/YouaiConfig;->urlrootDebug:Ljava/lang/String;

    sput-object v3, Lcom/youai/dreamonepiece/YouaiConfig;->urlroot:Ljava/lang/String;

    .line 233
    :goto_0
    invoke-static {}, Lcom/youai/dreamonepiece/YouaiConfig;->reCreate()V

    .line 237
    .end local v0    # "_youaiUrl":Ljava/lang/String;
    .end local v1    # "dynamicFile":Ljava/io/File;
    :cond_0
    iget-object v3, p0, Lcom/youai/dreamonepiece/GameAppState$GameAppStateCallback;->this$0:Lcom/youai/dreamonepiece/GameAppState;

    invoke-static {v3}, Lcom/youai/dreamonepiece/GameAppState;->access$200(Lcom/youai/dreamonepiece/GameAppState;)Lcom/youai/dreamonepiece/GameInterface$IGameAppStateCallback;

    move-result-object v3

    invoke-interface {v3, p1}, Lcom/youai/dreamonepiece/GameInterface$IGameAppStateCallback;->notifyLoginResut(Lcom/youai/PlatformAndGameInfo$LoginInfo;)V

    .line 240
    .end local v2    # "rootfiles":Ljava/io/File;
    :cond_1
    return-void

    .line 230
    .restart local v0    # "_youaiUrl":Ljava/lang/String;
    .restart local v1    # "dynamicFile":Ljava/io/File;
    .restart local v2    # "rootfiles":Ljava/io/File;
    :cond_2
    sget-object v3, Lcom/youai/dreamonepiece/YouaiConfig;->urlrootRelease:Ljava/lang/String;

    sput-object v3, Lcom/youai/dreamonepiece/YouaiConfig;->urlroot:Ljava/lang/String;

    goto :goto_0
.end method

.method public notifyOnTempShortPause()V
    .locals 1

    .prologue
    .line 210
    iget-object v0, p0, Lcom/youai/dreamonepiece/GameAppState$GameAppStateCallback;->this$0:Lcom/youai/dreamonepiece/GameAppState;

    invoke-static {v0}, Lcom/youai/dreamonepiece/GameAppState;->access$200(Lcom/youai/dreamonepiece/GameAppState;)Lcom/youai/dreamonepiece/GameInterface$IGameAppStateCallback;

    move-result-object v0

    invoke-interface {v0}, Lcom/youai/dreamonepiece/GameInterface$IGameAppStateCallback;->notifyOnTempShortPause()V

    .line 211
    return-void
.end method

.method public notifyPayRechargeResult(Lcom/youai/PlatformAndGameInfo$PayInfo;)V
    .locals 1
    .param p1, "result"    # Lcom/youai/PlatformAndGameInfo$PayInfo;

    .prologue
    .line 245
    iget-object v0, p0, Lcom/youai/dreamonepiece/GameAppState$GameAppStateCallback;->this$0:Lcom/youai/dreamonepiece/GameAppState;

    invoke-static {v0}, Lcom/youai/dreamonepiece/GameAppState;->access$200(Lcom/youai/dreamonepiece/GameAppState;)Lcom/youai/dreamonepiece/GameInterface$IGameAppStateCallback;

    move-result-object v0

    invoke-interface {v0, p1}, Lcom/youai/dreamonepiece/GameInterface$IGameAppStateCallback;->notifyPayRechargeResult(Lcom/youai/PlatformAndGameInfo$PayInfo;)V

    .line 246
    return-void
.end method

.method public notifyTryUserRegistSuccess()V
    .locals 1

    .prologue
    .line 263
    iget-object v0, p0, Lcom/youai/dreamonepiece/GameAppState$GameAppStateCallback;->this$0:Lcom/youai/dreamonepiece/GameAppState;

    invoke-static {v0}, Lcom/youai/dreamonepiece/GameAppState;->access$200(Lcom/youai/dreamonepiece/GameAppState;)Lcom/youai/dreamonepiece/GameInterface$IGameAppStateCallback;

    move-result-object v0

    invoke-interface {v0}, Lcom/youai/dreamonepiece/GameInterface$IGameAppStateCallback;->notifyTryUserRegistSuccess()V

    .line 264
    return-void
.end method

.method public requestBindTryToOkUser(Ljava/lang/String;Ljava/lang/String;)V
    .locals 0
    .param p1, "tryUin"    # Ljava/lang/String;
    .param p2, "okUin"    # Ljava/lang/String;

    .prologue
    .line 259
    return-void
.end method

.method public showWaitingViewImp(ZILjava/lang/String;)V
    .locals 1
    .param p1, "show"    # Z
    .param p2, "progress"    # I
    .param p3, "text"    # Ljava/lang/String;

    .prologue
    .line 253
    iget-object v0, p0, Lcom/youai/dreamonepiece/GameAppState$GameAppStateCallback;->this$0:Lcom/youai/dreamonepiece/GameAppState;

    invoke-static {v0}, Lcom/youai/dreamonepiece/GameAppState;->access$200(Lcom/youai/dreamonepiece/GameAppState;)Lcom/youai/dreamonepiece/GameInterface$IGameAppStateCallback;

    move-result-object v0

    invoke-interface {v0, p1, p2, p3}, Lcom/youai/dreamonepiece/GameInterface$IGameAppStateCallback;->showWaitingViewImp(ZILjava/lang/String;)V

    .line 254
    return-void
.end method
