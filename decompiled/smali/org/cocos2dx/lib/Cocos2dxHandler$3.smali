.class Lorg/cocos2dx/lib/Cocos2dxHandler$3;
.super Ljava/lang/Object;
.source "Cocos2dxHandler.java"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lorg/cocos2dx/lib/Cocos2dxHandler;->showQuestionDialog(Landroid/os/Message;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lorg/cocos2dx/lib/Cocos2dxHandler;

.field private final synthetic val$dialogMessage:Lorg/cocos2dx/lib/Cocos2dxHandler$DialogMessage;

.field private final synthetic val$theActivity:Lorg/cocos2dx/lib/Cocos2dxActivity;


# direct methods
.method constructor <init>(Lorg/cocos2dx/lib/Cocos2dxHandler;Lorg/cocos2dx/lib/Cocos2dxHandler$DialogMessage;Lorg/cocos2dx/lib/Cocos2dxActivity;)V
    .locals 0

    .prologue
    .line 1
    iput-object p1, p0, Lorg/cocos2dx/lib/Cocos2dxHandler$3;->this$0:Lorg/cocos2dx/lib/Cocos2dxHandler;

    iput-object p2, p0, Lorg/cocos2dx/lib/Cocos2dxHandler$3;->val$dialogMessage:Lorg/cocos2dx/lib/Cocos2dxHandler$DialogMessage;

    iput-object p3, p0, Lorg/cocos2dx/lib/Cocos2dxHandler$3;->val$theActivity:Lorg/cocos2dx/lib/Cocos2dxActivity;

    .line 196
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;I)V
    .locals 2
    .param p1, "dialog"    # Landroid/content/DialogInterface;
    .param p2, "which"    # I

    .prologue
    .line 201
    iget-object v0, p0, Lorg/cocos2dx/lib/Cocos2dxHandler$3;->val$dialogMessage:Lorg/cocos2dx/lib/Cocos2dxHandler$DialogMessage;

    iget v0, v0, Lorg/cocos2dx/lib/Cocos2dxHandler$DialogMessage;->msgId:I

    const/4 v1, 0x1

    if-ne v0, v1, :cond_0

    .line 202
    iget-object v0, p0, Lorg/cocos2dx/lib/Cocos2dxHandler$3;->val$theActivity:Lorg/cocos2dx/lib/Cocos2dxActivity;

    invoke-virtual {v0}, Lorg/cocos2dx/lib/Cocos2dxActivity;->destroy()V

    .line 205
    :cond_0
    return-void
.end method
