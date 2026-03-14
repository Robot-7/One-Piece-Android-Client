.class public Lcom/youai/PlatformAndGameInfo$GameInfo;
.super Ljava/lang/Object;
.source "PlatformAndGameInfo.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/youai/PlatformAndGameInfo;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "GameInfo"
.end annotation


# instance fields
.field public app_id:I

.field public app_id_str:Ljava/lang/String;

.field public app_key:Ljava/lang/String;

.field public app_secret:Ljava/lang/String;

.field public cp_id:I

.field public cp_id_str:Ljava/lang/String;

.field public debug_mode:I

.field public gameid:I

.field public pay_addr:Ljava/lang/String;

.field public pay_id_str:Ljava/lang/String;

.field public platform_channel_str:Ljava/lang/String;

.field public platform_type:I

.field public platform_type_str:Ljava/lang/String;

.field public private_str:Ljava/lang/String;

.field public public_str:Ljava/lang/String;

.field public screen_orientation:I

.field public svr_id:I

.field public use_platform_sdk_type:I


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 258
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 237
    const-string v0, ""

    iput-object v0, p0, Lcom/youai/PlatformAndGameInfo$GameInfo;->platform_channel_str:Ljava/lang/String;

    .line 260
    return-void
.end method
