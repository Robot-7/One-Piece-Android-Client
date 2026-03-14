.class public Lorg/cocos2dx/lib/Cocos2dxHandler$ProgressMessage;
.super Ljava/lang/Object;
.source "Cocos2dxHandler.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/cocos2dx/lib/Cocos2dxHandler;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "ProgressMessage"
.end annotation


# instance fields
.field public progress:I

.field public text:Ljava/lang/String;


# direct methods
.method public constructor <init>(ILjava/lang/String;)V
    .locals 0
    .param p1, "progress"    # I
    .param p2, "text"    # Ljava/lang/String;

    .prologue
    .line 290
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 291
    iput p1, p0, Lorg/cocos2dx/lib/Cocos2dxHandler$ProgressMessage;->progress:I

    .line 292
    iput-object p2, p0, Lorg/cocos2dx/lib/Cocos2dxHandler$ProgressMessage;->text:Ljava/lang/String;

    .line 293
    return-void
.end method
