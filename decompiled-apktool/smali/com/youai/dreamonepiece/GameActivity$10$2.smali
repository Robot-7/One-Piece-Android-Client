.class Lcom/youai/dreamonepiece/GameActivity$10$2;
.super Ljava/lang/Object;
.source "GameActivity.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/youai/dreamonepiece/GameActivity$10;->run()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/youai/dreamonepiece/GameActivity$10;


# direct methods
.method constructor <init>(Lcom/youai/dreamonepiece/GameActivity$10;)V
    .locals 0

    .prologue
    .line 954
    iput-object p1, p0, Lcom/youai/dreamonepiece/GameActivity$10$2;->this$0:Lcom/youai/dreamonepiece/GameActivity$10;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 0
    .param p1, "v"    # Landroid/view/View;

    .prologue
    .line 957
    invoke-static {}, Lcom/youai/dreamonepiece/GameActivity;->stopMovieClick()V

    .line 958
    return-void
.end method
