.class Lcom/youai/dreamonepiece/GameUpdateState$GameUpdateStateCallback;
.super Ljava/lang/Object;
.source "GameUpdateState.java"

# interfaces
.implements Lcom/youai/dreamonepiece/GameInterface$IGameUpdateStateCallback;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/youai/dreamonepiece/GameUpdateState;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "GameUpdateStateCallback"
.end annotation


# instance fields
.field final synthetic this$0:Lcom/youai/dreamonepiece/GameUpdateState;


# direct methods
.method private constructor <init>(Lcom/youai/dreamonepiece/GameUpdateState;)V
    .locals 0

    .prologue
    .line 80
    iput-object p1, p0, Lcom/youai/dreamonepiece/GameUpdateState$GameUpdateStateCallback;->this$0:Lcom/youai/dreamonepiece/GameUpdateState;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lcom/youai/dreamonepiece/GameUpdateState;Lcom/youai/dreamonepiece/GameUpdateState$1;)V
    .locals 0
    .param p1, "x0"    # Lcom/youai/dreamonepiece/GameUpdateState;
    .param p2, "x1"    # Lcom/youai/dreamonepiece/GameUpdateState$1;

    .prologue
    .line 80
    invoke-direct {p0, p1}, Lcom/youai/dreamonepiece/GameUpdateState$GameUpdateStateCallback;-><init>(Lcom/youai/dreamonepiece/GameUpdateState;)V

    return-void
.end method


# virtual methods
.method public notifyVersionCheckResult(Lcom/youai/PlatformAndGameInfo$VersionInfo;)V
    .locals 2
    .param p1, "versionInfo"    # Lcom/youai/PlatformAndGameInfo$VersionInfo;

    .prologue
    .line 84
    iget-object v0, p0, Lcom/youai/dreamonepiece/GameUpdateState$GameUpdateStateCallback;->this$0:Lcom/youai/dreamonepiece/GameUpdateState;

    invoke-static {v0}, Lcom/youai/dreamonepiece/GameUpdateState;->access$100(Lcom/youai/dreamonepiece/GameUpdateState;)Lcom/youai/dreamonepiece/GameInterface$IGameUpdateStateCallback;

    move-result-object v0

    invoke-interface {v0, p1}, Lcom/youai/dreamonepiece/GameInterface$IGameUpdateStateCallback;->notifyVersionCheckResult(Lcom/youai/PlatformAndGameInfo$VersionInfo;)V

    .line 86
    iget v0, p1, Lcom/youai/PlatformAndGameInfo$VersionInfo;->update_info:I

    if-nez v0, :cond_1

    .line 93
    :cond_0
    :goto_0
    return-void

    .line 88
    :cond_1
    iget v0, p1, Lcom/youai/PlatformAndGameInfo$VersionInfo;->update_info:I

    const/4 v1, 0x1

    if-eq v0, v1, :cond_0

    .line 90
    iget v0, p1, Lcom/youai/PlatformAndGameInfo$VersionInfo;->update_info:I

    const/4 v1, 0x2

    if-ne v0, v1, :cond_0

    .line 91
    const/4 v0, 0x0

    invoke-static {v0}, Ljava/lang/System;->exit(I)V

    goto :goto_0
.end method
