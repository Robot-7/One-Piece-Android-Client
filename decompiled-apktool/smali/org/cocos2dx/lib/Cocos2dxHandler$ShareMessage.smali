.class public Lorg/cocos2dx/lib/Cocos2dxHandler$ShareMessage;
.super Ljava/lang/Object;
.source "Cocos2dxHandler.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/cocos2dx/lib/Cocos2dxHandler;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "ShareMessage"
.end annotation


# instance fields
.field public content:Ljava/lang/String;

.field public imgPath:Ljava/lang/String;


# direct methods
.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;)V
    .locals 0
    .param p1, "content"    # Ljava/lang/String;
    .param p2, "imgPath"    # Ljava/lang/String;

    .prologue
    .line 300
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 301
    iput-object p1, p0, Lorg/cocos2dx/lib/Cocos2dxHandler$ShareMessage;->content:Ljava/lang/String;

    .line 302
    iput-object p2, p0, Lorg/cocos2dx/lib/Cocos2dxHandler$ShareMessage;->imgPath:Ljava/lang/String;

    .line 303
    return-void
.end method
