.class Lcom/youai/dreamonepiece/GameAnnounceDialog$1;
.super Ljava/lang/Object;
.source "GameAnnounceDialog.java"

# interfaces
.implements Landroid/content/DialogInterface$OnKeyListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/youai/dreamonepiece/GameAnnounceDialog;->show()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/youai/dreamonepiece/GameAnnounceDialog;


# direct methods
.method constructor <init>(Lcom/youai/dreamonepiece/GameAnnounceDialog;)V
    .locals 0

    .prologue
    .line 97
    iput-object p1, p0, Lcom/youai/dreamonepiece/GameAnnounceDialog$1;->this$0:Lcom/youai/dreamonepiece/GameAnnounceDialog;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onKey(Landroid/content/DialogInterface;ILandroid/view/KeyEvent;)Z
    .locals 1
    .param p1, "dialog"    # Landroid/content/DialogInterface;
    .param p2, "keyCode"    # I
    .param p3, "event"    # Landroid/view/KeyEvent;

    .prologue
    .line 102
    iget-object v0, p0, Lcom/youai/dreamonepiece/GameAnnounceDialog$1;->this$0:Lcom/youai/dreamonepiece/GameAnnounceDialog;

    invoke-virtual {v0}, Lcom/youai/dreamonepiece/GameAnnounceDialog;->onBack()V

    .line 103
    const/4 v0, 0x0

    return v0
.end method
