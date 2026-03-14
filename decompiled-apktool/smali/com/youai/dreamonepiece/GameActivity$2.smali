.class Lcom/youai/dreamonepiece/GameActivity$2;
.super Ljava/lang/Object;
.source "GameActivity.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/youai/dreamonepiece/GameActivity;->onKeyDown(ILandroid/view/KeyEvent;)Z
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
    .line 317
    iput-object p1, p0, Lcom/youai/dreamonepiece/GameActivity$2;->this$0:Lcom/youai/dreamonepiece/GameActivity;

    iput-object p2, p0, Lcom/youai/dreamonepiece/GameActivity$2;->val$theActivity:Lcom/youai/dreamonepiece/GameActivity;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 3

    .prologue
    .line 322
    invoke-static {}, Lorg/cocos2dx/lib/Cocos2dxHelper;->nativeGameSnapshot()Ljava/lang/String;

    move-result-object v0

    .line 324
    .local v0, "png_file":Ljava/lang/String;
    new-instance v1, Lcom/youai/PlatformAndGameInfo$ShareInfo;

    invoke-direct {v1}, Lcom/youai/PlatformAndGameInfo$ShareInfo;-><init>()V

    .line 325
    .local v1, "share":Lcom/youai/PlatformAndGameInfo$ShareInfo;
    const-string v2, "#\u4f1f\u5927\u822a\u8def##DreamOnePiece#@\u4f1f\u5927\u822a\u8defOnline"

    iput-object v2, v1, Lcom/youai/PlatformAndGameInfo$ShareInfo;->content:Ljava/lang/String;

    .line 326
    iput-object v0, v1, Lcom/youai/PlatformAndGameInfo$ShareInfo;->img_path:Ljava/lang/String;

    .line 328
    iget-object v2, p0, Lcom/youai/dreamonepiece/GameActivity$2;->val$theActivity:Lcom/youai/dreamonepiece/GameActivity;

    invoke-virtual {v2, v1}, Lcom/youai/dreamonepiece/GameActivity;->callSystemShare(Lcom/youai/PlatformAndGameInfo$ShareInfo;)V

    .line 329
    return-void
.end method
