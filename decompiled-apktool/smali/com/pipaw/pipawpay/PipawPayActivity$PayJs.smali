.class Lcom/pipaw/pipawpay/PipawPayActivity$PayJs;
.super Ljava/lang/Object;


# instance fields
.field private activity:Lcom/pipaw/pipawpay/PipawPayActivity;

.field final synthetic this$0:Lcom/pipaw/pipawpay/PipawPayActivity;


# direct methods
.method public constructor <init>(Lcom/pipaw/pipawpay/PipawPayActivity;Lcom/pipaw/pipawpay/PipawPayActivity;)V
    .locals 0

    iput-object p1, p0, Lcom/pipaw/pipawpay/PipawPayActivity$PayJs;->this$0:Lcom/pipaw/pipawpay/PipawPayActivity;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p2, p0, Lcom/pipaw/pipawpay/PipawPayActivity$PayJs;->activity:Lcom/pipaw/pipawpay/PipawPayActivity;

    return-void
.end method


# virtual methods
.method public payClose()V
    .locals 1
    .annotation runtime Landroid/webkit/JavascriptInterface;
    .end annotation

    invoke-static {}, Lcom/pipaw/pipawpay/PipawPayActivity;->a()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/pipaw/a/d;->a(Ljava/lang/String;)V

    iget-object v0, p0, Lcom/pipaw/pipawpay/PipawPayActivity$PayJs;->activity:Lcom/pipaw/pipawpay/PipawPayActivity;

    invoke-virtual {v0}, Lcom/pipaw/pipawpay/PipawPayActivity;->finish()V

    return-void
.end method

.method public payFail(Ljava/lang/String;)V
    .locals 3
    .annotation runtime Landroid/webkit/JavascriptInterface;
    .end annotation

    invoke-static {}, Lcom/pipaw/pipawpay/PipawPayActivity;->a()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/pipaw/a/d;->a(Ljava/lang/String;)V

    iget-object v0, p0, Lcom/pipaw/pipawpay/PipawPayActivity$PayJs;->activity:Lcom/pipaw/pipawpay/PipawPayActivity;

    const/16 v1, 0x3ea

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v0, v1, v2}, Lcom/pipaw/pipawpay/PipawPayActivity;->a(Lcom/pipaw/pipawpay/PipawPayActivity;ILjava/lang/String;)V

    return-void
.end method

.method public paySuccess()V
    .locals 3
    .annotation runtime Landroid/webkit/JavascriptInterface;
    .end annotation

    invoke-static {}, Lcom/pipaw/pipawpay/PipawPayActivity;->a()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/pipaw/a/d;->a(Ljava/lang/String;)V

    iget-object v0, p0, Lcom/pipaw/pipawpay/PipawPayActivity$PayJs;->activity:Lcom/pipaw/pipawpay/PipawPayActivity;

    const/16 v1, 0x3e9

    const-string v2, ""

    invoke-static {v0, v1, v2}, Lcom/pipaw/pipawpay/PipawPayActivity;->a(Lcom/pipaw/pipawpay/PipawPayActivity;ILjava/lang/String;)V

    return-void
.end method
