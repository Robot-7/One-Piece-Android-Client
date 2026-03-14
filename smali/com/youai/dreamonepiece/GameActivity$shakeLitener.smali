.class Lcom/youai/dreamonepiece/GameActivity$shakeLitener;
.super Ljava/lang/Object;
.source "GameActivity.java"

# interfaces
.implements Lcom/youai/ShakeLisenter$OnShakeListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/youai/dreamonepiece/GameActivity;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "shakeLitener"
.end annotation


# instance fields
.field final synthetic this$0:Lcom/youai/dreamonepiece/GameActivity;


# direct methods
.method private constructor <init>(Lcom/youai/dreamonepiece/GameActivity;)V
    .locals 0

    .prologue
    .line 1259
    iput-object p1, p0, Lcom/youai/dreamonepiece/GameActivity$shakeLitener;->this$0:Lcom/youai/dreamonepiece/GameActivity;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lcom/youai/dreamonepiece/GameActivity;Lcom/youai/dreamonepiece/GameActivity$1;)V
    .locals 0
    .param p1, "x0"    # Lcom/youai/dreamonepiece/GameActivity;
    .param p2, "x1"    # Lcom/youai/dreamonepiece/GameActivity$1;

    .prologue
    .line 1259
    invoke-direct {p0, p1}, Lcom/youai/dreamonepiece/GameActivity$shakeLitener;-><init>(Lcom/youai/dreamonepiece/GameActivity;)V

    return-void
.end method


# virtual methods
.method public onShake()V
    .locals 2

    .prologue
    .line 1263
    invoke-static {}, Lcom/youai/dreamonepiece/GameActivity;->access$100()Ljava/lang/String;

    move-result-object v0

    const-string v1, "onShake"

    invoke-static {v0, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 1264
    invoke-static {}, Lcom/youai/dreamonepiece/GameActivity;->nativeOnMotionShake()V

    .line 1265
    return-void
.end method
