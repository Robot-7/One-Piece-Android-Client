.class Lcom/youai/dreamonepiece/GameAppState$1;
.super Landroid/view/TouchDelegate;
.source "GameAppState.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/youai/dreamonepiece/GameAppState;->showWaitingViewImp(ZILjava/lang/String;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/youai/dreamonepiece/GameAppState;


# direct methods
.method constructor <init>(Lcom/youai/dreamonepiece/GameAppState;Landroid/graphics/Rect;Landroid/view/View;)V
    .locals 0
    .param p2, "x0"    # Landroid/graphics/Rect;
    .param p3, "x1"    # Landroid/view/View;

    .prologue
    .line 288
    iput-object p1, p0, Lcom/youai/dreamonepiece/GameAppState$1;->this$0:Lcom/youai/dreamonepiece/GameAppState;

    invoke-direct {p0, p2, p3}, Landroid/view/TouchDelegate;-><init>(Landroid/graphics/Rect;Landroid/view/View;)V

    return-void
.end method


# virtual methods
.method public onTouchEvent(Landroid/view/MotionEvent;)Z
    .locals 1
    .param p1, "event"    # Landroid/view/MotionEvent;

    .prologue
    .line 292
    const/4 v0, 0x1

    return v0
.end method
