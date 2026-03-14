.class final Lcom/youai/dreamonepiece/YouaiLastLoginHelp$1;
.super Ljava/lang/Object;
.source "YouaiLastLoginHelp.java"

# interfaces
.implements Lcom/youai/dreamonepiece/YouaiLastLoginHelp$RequestListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/youai/dreamonepiece/YouaiLastLoginHelp;->updateServerInfo(ILcom/youai/dreamonepiece/YouaiServerInfo;Z)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = null
.end annotation


# direct methods
.method constructor <init>()V
    .locals 0

    .prologue
    .line 120
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onComplete(Ljava/lang/String;)V
    .locals 1
    .param p1, "response"    # Ljava/lang/String;

    .prologue
    .line 124
    const-string v0, "YouaiLastLoginHelp"

    invoke-static {v0, p1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 125
    return-void
.end method

.method public onError(Ljava/lang/Exception;)V
    .locals 2
    .param p1, "e"    # Ljava/lang/Exception;

    .prologue
    .line 134
    const-string v0, "YouaiLastLoginHelp"

    const-string v1, "Exception"

    invoke-static {v0, v1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 135
    return-void
.end method

.method public onIOException(Ljava/io/IOException;)V
    .locals 2
    .param p1, "e"    # Ljava/io/IOException;

    .prologue
    .line 129
    const-string v0, "YouaiLastLoginHelp"

    const-string v1, "IOException"

    invoke-static {v0, v1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 130
    return-void
.end method
