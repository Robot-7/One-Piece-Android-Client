.class public abstract Lcom/youaiAnalysis/AnalysisBaseAdapter;
.super Ljava/lang/Object;
.source "AnalysisBaseAdapter.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 9
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 11
    return-void
.end method


# virtual methods
.method public converData(Landroid/app/Activity;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 0
    .param p1, "context"    # Landroid/app/Activity;
    .param p2, "appkey"    # Ljava/lang/String;
    .param p3, "platform_type_str"    # Ljava/lang/String;
    .param p4, "sdkVersion"    # Ljava/lang/String;

    .prologue
    .line 52
    return-void
.end method

.method public abstract initAdapter()Lcom/youaiAnalysis/AnalysisBaseAdapter;
.end method

.method public login(Landroid/content/Context;)V
    .locals 0
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 59
    return-void
.end method

.method public onCreate(Landroid/content/Context;)V
    .locals 0
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 18
    return-void
.end method

.method public onDestroy()V
    .locals 0

    .prologue
    .line 29
    return-void
.end method

.method public onEnvent(Landroid/app/Activity;Ljava/lang/String;)V
    .locals 0
    .param p1, "context"    # Landroid/app/Activity;
    .param p2, "envent"    # Ljava/lang/String;

    .prologue
    .line 40
    return-void
.end method

.method public onEventBegin(Landroid/app/Activity;Ljava/lang/String;)V
    .locals 0
    .param p1, "context"    # Landroid/app/Activity;
    .param p2, "envent"    # Ljava/lang/String;

    .prologue
    .line 44
    return-void
.end method

.method public onEventEnd(Landroid/app/Activity;Ljava/lang/String;)V
    .locals 0
    .param p1, "context"    # Landroid/app/Activity;
    .param p2, "envent"    # Ljava/lang/String;

    .prologue
    .line 48
    return-void
.end method

.method public onPause(Landroid/content/Context;)V
    .locals 0
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 26
    return-void
.end method

.method public onResume(Landroid/content/Context;)V
    .locals 0
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 22
    return-void
.end method

.method public onStart(Landroid/content/Context;)V
    .locals 0
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 32
    return-void
.end method

.method public onStop(Landroid/content/Context;)V
    .locals 0
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 35
    return-void
.end method

.method public payAcount(Landroid/content/Context;Ljava/lang/String;DLjava/lang/String;Ljava/lang/String;)V
    .locals 0
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "orderId"    # Ljava/lang/String;
    .param p3, "currencyAmount"    # D
    .param p5, "currencyType"    # Ljava/lang/String;
    .param p6, "paymentType"    # Ljava/lang/String;

    .prologue
    .line 71
    return-void
.end method

.method public purchase(Landroid/content/Context;F)V
    .locals 0
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "price"    # F

    .prologue
    .line 62
    return-void
.end method

.method public register(Landroid/content/Context;Ljava/lang/String;)V
    .locals 0
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "type"    # Ljava/lang/String;

    .prologue
    .line 56
    return-void
.end method

.method public setDeviceTrackingDisabled(Z)V
    .locals 0
    .param p1, "boo"    # Z

    .prologue
    .line 74
    return-void
.end method
