.class public Lorg/cocos2dx/lib/Cocos2dxHandler$PayRechargeMessage;
.super Ljava/lang/Object;
.source "Cocos2dxHandler.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/cocos2dx/lib/Cocos2dxHandler;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "PayRechargeMessage"
.end annotation


# instance fields
.field public count:I

.field public description:Ljava/lang/String;

.field public orignalPrice:F

.field public price:F

.field public productId:Ljava/lang/String;

.field public productName:Ljava/lang/String;

.field public serial:Ljava/lang/String;


# direct methods
.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;FFILjava/lang/String;)V
    .locals 0
    .param p1, "serial"    # Ljava/lang/String;
    .param p2, "productId"    # Ljava/lang/String;
    .param p3, "productName"    # Ljava/lang/String;
    .param p4, "price"    # F
    .param p5, "orignalPrice"    # F
    .param p6, "count"    # I
    .param p7, "description"    # Ljava/lang/String;

    .prologue
    .line 316
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 318
    iput-object p1, p0, Lorg/cocos2dx/lib/Cocos2dxHandler$PayRechargeMessage;->serial:Ljava/lang/String;

    .line 319
    iput-object p2, p0, Lorg/cocos2dx/lib/Cocos2dxHandler$PayRechargeMessage;->productId:Ljava/lang/String;

    .line 320
    iput-object p3, p0, Lorg/cocos2dx/lib/Cocos2dxHandler$PayRechargeMessage;->productName:Ljava/lang/String;

    .line 321
    iput p4, p0, Lorg/cocos2dx/lib/Cocos2dxHandler$PayRechargeMessage;->price:F

    .line 322
    iput p5, p0, Lorg/cocos2dx/lib/Cocos2dxHandler$PayRechargeMessage;->orignalPrice:F

    .line 323
    iput p6, p0, Lorg/cocos2dx/lib/Cocos2dxHandler$PayRechargeMessage;->count:I

    .line 324
    iput-object p7, p0, Lorg/cocos2dx/lib/Cocos2dxHandler$PayRechargeMessage;->description:Ljava/lang/String;

    .line 325
    return-void
.end method
