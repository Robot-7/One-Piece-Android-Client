.class public Lorg/cocos2dx/lib/Cocos2dxHandler$ShowWaitingViewMessage;
.super Ljava/lang/Object;
.source "Cocos2dxHandler.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/cocos2dx/lib/Cocos2dxHandler;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "ShowWaitingViewMessage"
.end annotation


# instance fields
.field public progress:I

.field public show:Z

.field public text:Ljava/lang/String;


# direct methods
.method public constructor <init>(ZILjava/lang/String;)V
    .locals 0
    .param p1, "show"    # Z
    .param p2, "progress"    # I
    .param p3, "text"    # Ljava/lang/String;

    .prologue
    .line 334
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 335
    iput-boolean p1, p0, Lorg/cocos2dx/lib/Cocos2dxHandler$ShowWaitingViewMessage;->show:Z

    .line 336
    iput p2, p0, Lorg/cocos2dx/lib/Cocos2dxHandler$ShowWaitingViewMessage;->progress:I

    .line 337
    iput-object p3, p0, Lorg/cocos2dx/lib/Cocos2dxHandler$ShowWaitingViewMessage;->text:Ljava/lang/String;

    .line 338
    return-void
.end method
