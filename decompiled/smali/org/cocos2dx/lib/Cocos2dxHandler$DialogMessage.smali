.class public Lorg/cocos2dx/lib/Cocos2dxHandler$DialogMessage;
.super Ljava/lang/Object;
.source "Cocos2dxHandler.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/cocos2dx/lib/Cocos2dxHandler;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "DialogMessage"
.end annotation


# instance fields
.field public message:Ljava/lang/String;

.field public msgId:I

.field public negativeCallback:Ljava/lang/String;

.field public positiveCallback:Ljava/lang/String;

.field public titile:Ljava/lang/String;


# direct methods
.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;ILjava/lang/String;Ljava/lang/String;)V
    .locals 0
    .param p1, "title"    # Ljava/lang/String;
    .param p2, "message"    # Ljava/lang/String;
    .param p3, "msgId"    # I
    .param p4, "positiveCallback"    # Ljava/lang/String;
    .param p5, "negativeCallback"    # Ljava/lang/String;

    .prologue
    .line 258
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 260
    iput-object p1, p0, Lorg/cocos2dx/lib/Cocos2dxHandler$DialogMessage;->titile:Ljava/lang/String;

    .line 261
    iput-object p2, p0, Lorg/cocos2dx/lib/Cocos2dxHandler$DialogMessage;->message:Ljava/lang/String;

    .line 262
    iput p3, p0, Lorg/cocos2dx/lib/Cocos2dxHandler$DialogMessage;->msgId:I

    .line 263
    iput-object p4, p0, Lorg/cocos2dx/lib/Cocos2dxHandler$DialogMessage;->positiveCallback:Ljava/lang/String;

    .line 264
    iput-object p5, p0, Lorg/cocos2dx/lib/Cocos2dxHandler$DialogMessage;->negativeCallback:Ljava/lang/String;

    .line 265
    return-void
.end method
