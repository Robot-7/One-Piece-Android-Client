.class Lcom/youai/dreamonepiece/GameLogoState$DialogMessage;
.super Ljava/lang/Object;
.source "GameLogoState.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/youai/dreamonepiece/GameLogoState;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "DialogMessage"
.end annotation


# instance fields
.field public message:Ljava/lang/String;

.field public msgId:I

.field public titile:Ljava/lang/String;


# direct methods
.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;I)V
    .locals 0
    .param p1, "title"    # Ljava/lang/String;
    .param p2, "message"    # Ljava/lang/String;
    .param p3, "msgId"    # I

    .prologue
    .line 1381
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 1382
    iput-object p1, p0, Lcom/youai/dreamonepiece/GameLogoState$DialogMessage;->titile:Ljava/lang/String;

    .line 1383
    iput-object p2, p0, Lcom/youai/dreamonepiece/GameLogoState$DialogMessage;->message:Ljava/lang/String;

    .line 1384
    iput p3, p0, Lcom/youai/dreamonepiece/GameLogoState$DialogMessage;->msgId:I

    .line 1385
    return-void
.end method
