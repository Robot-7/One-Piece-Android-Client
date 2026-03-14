.class public Lcom/youai/PlatformAndGameInfo$VersionInfo;
.super Ljava/lang/Object;
.source "PlatformAndGameInfo.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/youai/PlatformAndGameInfo;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "VersionInfo"
.end annotation


# instance fields
.field public download_url:Ljava/lang/String;

.field public local_version_code:I

.field public max_version_code:I

.field public update_info:I


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 484
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 486
    return-void
.end method
