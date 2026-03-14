.class public Lcom/youai/PlatformAndGameInfo$LoginInfo;
.super Ljava/lang/Object;
.source "PlatformAndGameInfo.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/youai/PlatformAndGameInfo;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "LoginInfo"
.end annotation


# instance fields
.field public account_nick_name:Ljava/lang/String;

.field public account_uid:J

.field public account_uid_str:Ljava/lang/String;

.field public account_user_name:Ljava/lang/String;

.field public login_result:I

.field public login_session:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 464
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 465
    const/4 v0, 0x1

    iput v0, p0, Lcom/youai/PlatformAndGameInfo$LoginInfo;->login_result:I

    .line 466
    return-void
.end method
