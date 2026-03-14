.class Lcom/youai/dreamonepiece/GameActivity$5;
.super Ljava/lang/Object;
.source "GameActivity.java"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/youai/dreamonepiece/GameActivity;->showExitDialog()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/youai/dreamonepiece/GameActivity;


# direct methods
.method constructor <init>(Lcom/youai/dreamonepiece/GameActivity;)V
    .locals 0

    .prologue
    .line 388
    iput-object p1, p0, Lcom/youai/dreamonepiece/GameActivity$5;->this$0:Lcom/youai/dreamonepiece/GameActivity;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;I)V
    .locals 1
    .param p1, "dialog"    # Landroid/content/DialogInterface;
    .param p2, "which"    # I

    .prologue
    .line 392
    iget-object v0, p0, Lcom/youai/dreamonepiece/GameActivity$5;->this$0:Lcom/youai/dreamonepiece/GameActivity;

    invoke-virtual {v0}, Lcom/youai/dreamonepiece/GameActivity;->finish()V

    .line 393
    return-void
.end method
