.class Lorg/cocos2dx/lib/Cocos2dxHandler$1;
.super Ljava/lang/Object;
.source "Cocos2dxHandler.java"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


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
    iput-object p1, p0, Lorg/cocos2dx/lib/Cocos2dxHandler$1;->this$0:Lorg/cocos2dx/lib/Cocos2dxHandler;

    iput p2, p0, Lorg/cocos2dx/lib/Cocos2dxHandler$1;->val$tag:I

    .line 155
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;I)V
    .locals 1
    .param p1, "dialog"    # Landroid/content/DialogInterface;
    .param p2, "which"    # I

    .prologue
    .line 160
    iget v0, p0, Lorg/cocos2dx/lib/Cocos2dxHandler$1;->val$tag:I

    if-ltz v0, :cond_0

    .line 161
    iget v0, p0, Lorg/cocos2dx/lib/Cocos2dxHandler$1;->val$tag:I

    invoke-static {v0}, Lorg/cocos2dx/lib/Cocos2dxHelper;->nativeDialogOkCallback(I)V

    .line 163
    :cond_0
    return-void
.end method
