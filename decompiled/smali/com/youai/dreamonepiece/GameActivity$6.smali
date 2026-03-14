.class Lcom/youai/dreamonepiece/GameActivity$6;
.super Ljava/lang/Object;
.source "GameActivity.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/youai/dreamonepiece/GameActivity;->onKeyLongPress(ILandroid/view/KeyEvent;)Z
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/youai/dreamonepiece/GameActivity;

.field final synthetic val$theActivity:Lcom/youai/dreamonepiece/GameActivity;


# direct methods
.method constructor <init>(Lcom/youai/dreamonepiece/GameActivity;Lcom/youai/dreamonepiece/GameActivity;)V
    .locals 0

    .prologue
    .line 426
    iput-object p1, p0, Lcom/youai/dreamonepiece/GameActivity$6;->this$0:Lcom/youai/dreamonepiece/GameActivity;

    iput-object p2, p0, Lcom/youai/dreamonepiece/GameActivity$6;->val$theActivity:Lcom/youai/dreamonepiece/GameActivity;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 3

    .prologue
    .line 431
    invoke-static {}, Lorg/cocos2dx/lib/Cocos2dxHelper;->nativeGameSnapshot()Ljava/lang/String;

    move-result-object v0

    .line 433
    .local v0, "png_file":Ljava/lang/String;
    iget-object v1, p0, Lcom/youai/dreamonepiece/GameActivity$6;->val$theActivity:Lcom/youai/dreamonepiece/GameActivity;

    const-string v2, "#\u4f1f\u5927\u822a\u8def##DreamOnePiece#@\u4f1f\u5927\u822a\u8defOnline"

    invoke-virtual {v1, v2, v0}, Lcom/youai/dreamonepiece/GameActivity;->callPlatformSupportThirdShare(Ljava/lang/String;Ljava/lang/String;)V

    .line 436
    return-void
.end method
