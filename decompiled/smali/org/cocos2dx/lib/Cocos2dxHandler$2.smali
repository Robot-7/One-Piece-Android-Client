.class Lorg/cocos2dx/lib/Cocos2dxHandler$2;
.super Ljava/lang/Object;
.source "Cocos2dxHandler.java"

# interfaces
.implements Landroid/content/DialogInterface$OnCancelListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lorg/cocos2dx/lib/Cocos2dxHandler;->showDialog(Landroid/os/Message;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lorg/cocos2dx/lib/Cocos2dxHandler;

.field private final synthetic val$tag:I


# direct methods
.method constructor <init>(Lorg/cocos2dx/lib/Cocos2dxHandler;I)V
    .locals 0

    .prologue
    .line 1
    iput-object p1, p0, Lorg/cocos2dx/lib/Cocos2dxHandler$2;->this$0:Lorg/cocos2dx/lib/Cocos2dxHandler;

    iput p2, p0, Lorg/cocos2dx/lib/Cocos2dxHandler$2;->val$tag:I

    .line 165
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onCancel(Landroid/content/DialogInterface;)V
    .locals 4
    .param p1, "dialog"    # Landroid/content/DialogInterface;

    .prologue
    .line 171
    iget v0, p0, Lorg/cocos2dx/lib/Cocos2dxHandler$2;->val$tag:I

    const/16 v1, 0x6e

    if-eq v0, v1, :cond_0

    iget v0, p0, Lorg/cocos2dx/lib/Cocos2dxHandler$2;->val$tag:I

    const/16 v1, 0x64

    if-ne v0, v1, :cond_1

    .line 173
    :cond_0
    iget-object v0, p0, Lorg/cocos2dx/lib/Cocos2dxHandler$2;->this$0:Lorg/cocos2dx/lib/Cocos2dxHandler;

    invoke-static {v0}, Lorg/cocos2dx/lib/Cocos2dxHandler;->access$0(Lorg/cocos2dx/lib/Cocos2dxHandler;)Ljava/lang/ref/WeakReference;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/cocos2dx/lib/Cocos2dxActivity;

    const-string v1, "\u60a8\u53d6\u6d88\u4e86\u66f4\u65b0\u786e\u8ba4"

    invoke-virtual {v0, v1}, Lorg/cocos2dx/lib/Cocos2dxActivity;->showToastMsgImp(Ljava/lang/String;)V

    .line 174
    iget-object v0, p0, Lorg/cocos2dx/lib/Cocos2dxHandler$2;->this$0:Lorg/cocos2dx/lib/Cocos2dxHandler;

    invoke-static {v0}, Lorg/cocos2dx/lib/Cocos2dxHandler;->access$0(Lorg/cocos2dx/lib/Cocos2dxHandler;)Ljava/lang/ref/WeakReference;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/cocos2dx/lib/Cocos2dxActivity;

    const/4 v1, 0x1

    const/4 v2, -0x1

    const-string v3, "\u6e38\u620f\u9700\u8981\u66f4\u65b0\uff0c\u60a8\u53d6\u6d88\u4e86\u66f4\u65b0\u786e\u8ba4\uff0c\u8bf7\u91cd\u542f\uff01"

    invoke-virtual {v0, v1, v2, v3}, Lorg/cocos2dx/lib/Cocos2dxActivity;->showWaitingView(ZILjava/lang/String;)V

    .line 176
    :cond_1
    return-void
.end method
