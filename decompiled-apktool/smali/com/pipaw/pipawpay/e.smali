.class Lcom/pipaw/pipawpay/e;
.super Ljava/lang/Object;

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field final synthetic a:Lcom/pipaw/pipawpay/PipawSDK;

.field private final synthetic b:I

.field private final synthetic c:Ljava/lang/String;


# direct methods
.method constructor <init>(Lcom/pipaw/pipawpay/PipawSDK;ILjava/lang/String;)V
    .locals 0

    iput-object p1, p0, Lcom/pipaw/pipawpay/e;->a:Lcom/pipaw/pipawpay/PipawSDK;

    iput p2, p0, Lcom/pipaw/pipawpay/e;->b:I

    iput-object p3, p0, Lcom/pipaw/pipawpay/e;->c:Ljava/lang/String;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 4

    const/4 v3, 0x0

    iget-object v0, p0, Lcom/pipaw/pipawpay/e;->a:Lcom/pipaw/pipawpay/PipawSDK;

    invoke-static {v0}, Lcom/pipaw/pipawpay/PipawSDK;->access$4(Lcom/pipaw/pipawpay/PipawSDK;)Lcom/pipaw/pipawpay/PipawLoginListener;

    move-result-object v0

    iget v1, p0, Lcom/pipaw/pipawpay/e;->b:I

    iget-object v2, p0, Lcom/pipaw/pipawpay/e;->c:Ljava/lang/String;

    invoke-interface {v0, v1, v2}, Lcom/pipaw/pipawpay/PipawLoginListener;->callback(ILjava/lang/String;)V

    iget-object v0, p0, Lcom/pipaw/pipawpay/e;->a:Lcom/pipaw/pipawpay/PipawSDK;

    invoke-static {v0, v3}, Lcom/pipaw/pipawpay/PipawSDK;->access$5(Lcom/pipaw/pipawpay/PipawSDK;Lcom/pipaw/pipawpay/PipawLoginListener;)V

    iget-object v0, p0, Lcom/pipaw/pipawpay/e;->a:Lcom/pipaw/pipawpay/PipawSDK;

    invoke-static {v0, v3}, Lcom/pipaw/pipawpay/PipawSDK;->access$6(Lcom/pipaw/pipawpay/PipawSDK;Landroid/app/Activity;)V

    return-void
.end method
