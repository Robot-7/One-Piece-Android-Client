.class final Lcom/youai/dreamonepiece/LastLoginHelp$1;
.super Ljava/lang/Object;
.source "LastLoginHelp.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/youai/dreamonepiece/LastLoginHelp;->updateServerInfo(ILjava/lang/String;IIIIIZ)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = null
.end annotation


# direct methods
.method constructor <init>()V
    .locals 0

    .prologue
    .line 65
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 1

    .prologue
    .line 68
    sget-object v0, Lcom/youai/dreamonepiece/LastLoginHelp;->mGameActivity:Lcom/youai/dreamonepiece/GameActivity;

    invoke-virtual {v0}, Lcom/youai/dreamonepiece/GameActivity;->getPlatformSDK()Lcom/youai/IPlatformLoginAndPay;

    move-result-object v0

    invoke-interface {v0}, Lcom/youai/IPlatformLoginAndPay;->onLoginGame()V

    .line 69
    return-void
.end method
