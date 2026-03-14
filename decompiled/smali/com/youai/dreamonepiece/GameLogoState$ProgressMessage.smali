.class Lcom/youai/dreamonepiece/GameLogoState$ProgressMessage;
.super Ljava/lang/Object;
.source "GameLogoState.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/youai/dreamonepiece/GameLogoState;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "ProgressMessage"
.end annotation


# instance fields
.field public progress:I

.field public text:Ljava/lang/String;


# direct methods
.method public constructor <init>(ILjava/lang/String;)V
    .locals 0
    .param p1, "progress"    # I
    .param p2, "text"    # Ljava/lang/String;

    .prologue
    .line 1366
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 1367
    iput p1, p0, Lcom/youai/dreamonepiece/GameLogoState$ProgressMessage;->progress:I

    .line 1368
    iput-object p2, p0, Lcom/youai/dreamonepiece/GameLogoState$ProgressMessage;->text:Ljava/lang/String;

    .line 1369
    return-void
.end method
