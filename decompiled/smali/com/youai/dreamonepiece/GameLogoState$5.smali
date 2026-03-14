.class Lcom/youai/dreamonepiece/GameLogoState$5;
.super Ljava/lang/Object;
.source "GameLogoState.java"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/youai/dreamonepiece/GameLogoState;->showDialog(Lcom/youai/dreamonepiece/GameLogoState$DialogMessage;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/youai/dreamonepiece/GameLogoState;

.field final synthetic val$tag:I

.field final synthetic val$theActivity:Lcom/youai/IGameActivity;


# direct methods
.method constructor <init>(Lcom/youai/dreamonepiece/GameLogoState;ILcom/youai/IGameActivity;)V
    .locals 0

    .prologue
    .line 1320
    iput-object p1, p0, Lcom/youai/dreamonepiece/GameLogoState$5;->this$0:Lcom/youai/dreamonepiece/GameLogoState;

    iput p2, p0, Lcom/youai/dreamonepiece/GameLogoState$5;->val$tag:I

    iput-object p3, p0, Lcom/youai/dreamonepiece/GameLogoState$5;->val$theActivity:Lcom/youai/IGameActivity;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;I)V
    .locals 2
    .param p1, "dialog"    # Landroid/content/DialogInterface;
    .param p2, "which"    # I

    .prologue
    .line 1325
    iget v0, p0, Lcom/youai/dreamonepiece/GameLogoState$5;->val$tag:I

    const/4 v1, 0x1

    if-eq v0, v1, :cond_0

    iget v0, p0, Lcom/youai/dreamonepiece/GameLogoState$5;->val$tag:I

    const/4 v1, 0x6

    if-ne v0, v1, :cond_1

    .line 1327
    :cond_0
    iget-object v0, p0, Lcom/youai/dreamonepiece/GameLogoState$5;->val$theActivity:Lcom/youai/IGameActivity;

    invoke-interface {v0}, Lcom/youai/IGameActivity;->requestDestroy()V

    .line 1330
    :cond_1
    return-void
.end method
