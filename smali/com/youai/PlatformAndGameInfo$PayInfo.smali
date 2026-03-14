.class public Lcom/youai/PlatformAndGameInfo$PayInfo;
.super Ljava/lang/Object;
.source "PlatformAndGameInfo.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/youai/PlatformAndGameInfo;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "PayInfo"
.end annotation


# instance fields
.field public count:I

.field public description:Ljava/lang/String;

.field public order_serial:Ljava/lang/String;

.field public orignal_price:F

.field public price:F

.field public product_id:Ljava/lang/String;

.field public product_name:Ljava/lang/String;

.field public result:I


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 503
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 505
    return-void
.end method
