.class Lcom/youai/dreamonepiece/LogcatHelper$1;
.super Ljava/lang/Thread;
.source "LogcatHelper.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/youai/dreamonepiece/LogcatHelper;->handleException(Ljava/lang/Throwable;)Z
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/youai/dreamonepiece/LogcatHelper;


# direct methods
.method constructor <init>(Lcom/youai/dreamonepiece/LogcatHelper;)V
    .locals 0

    .prologue
    .line 201
    iput-object p1, p0, Lcom/youai/dreamonepiece/LogcatHelper$1;->this$0:Lcom/youai/dreamonepiece/LogcatHelper;

    invoke-direct {p0}, Ljava/lang/Thread;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 3

    .prologue
    .line 203
    invoke-static {}, Landroid/os/Looper;->prepare()V

    .line 204
    iget-object v0, p0, Lcom/youai/dreamonepiece/LogcatHelper$1;->this$0:Lcom/youai/dreamonepiece/LogcatHelper;

    invoke-static {v0}, Lcom/youai/dreamonepiece/LogcatHelper;->access$000(Lcom/youai/dreamonepiece/LogcatHelper;)Landroid/content/Context;

    move-result-object v0

    const-string v1, "\u5f88\u62b1\u6b49,\u7a0b\u5e8f\u51fa\u73b0\u5f02\u5e38,\u5373\u5c06\u9000\u51fa,\u8bf7\u8054\u7cfb\u5ba2\u670d!"

    const/4 v2, 0x0

    invoke-static {v0, v1, v2}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v0

    invoke-virtual {v0}, Landroid/widget/Toast;->show()V

    .line 206
    invoke-static {}, Landroid/os/Looper;->loop()V

    .line 207
    return-void
.end method
