.class Lcom/pipaw/pipawpay/o;
.super Landroid/os/AsyncTask;


# instance fields
.field final synthetic a:Lcom/pipaw/pipawpay/PipawUserActivity;


# direct methods
.method constructor <init>(Lcom/pipaw/pipawpay/PipawUserActivity;)V
    .locals 0

    iput-object p1, p0, Lcom/pipaw/pipawpay/o;->a:Lcom/pipaw/pipawpay/PipawUserActivity;

    invoke-direct {p0}, Landroid/os/AsyncTask;-><init>()V

    return-void
.end method


# virtual methods
.method protected varargs a([Ljava/lang/String;)Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lcom/pipaw/pipawpay/o;->a:Lcom/pipaw/pipawpay/PipawUserActivity;

    invoke-static {v0, p1}, Lcom/pipaw/pipawpay/PipawUserActivity;->g(Lcom/pipaw/pipawpay/PipawUserActivity;[Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method protected a(Ljava/lang/String;)V
    .locals 4

    iget-object v0, p0, Lcom/pipaw/pipawpay/o;->a:Lcom/pipaw/pipawpay/PipawUserActivity;

    invoke-static {v0}, Lcom/pipaw/pipawpay/PipawUserActivity;->a(Lcom/pipaw/pipawpay/PipawUserActivity;)Landroid/app/ProgressDialog;

    move-result-object v0

    invoke-static {v0}, Lcom/pipaw/a/f;->a(Landroid/app/ProgressDialog;)V

    invoke-static {p1}, Lcom/pipaw/a/j;->a(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/pipaw/pipawpay/o;->a:Lcom/pipaw/pipawpay/PipawUserActivity;

    const-string v1, "\u7f51\u7edc\u8fde\u63a5\u5f02\u5e38"

    invoke-static {v0, v1}, Lcom/pipaw/a/k;->a(Landroid/content/Context;Ljava/lang/String;)V

    :goto_0
    invoke-super {p0, p1}, Landroid/os/AsyncTask;->onPostExecute(Ljava/lang/Object;)V

    return-void

    :cond_0
    :try_start_0
    new-instance v0, Lorg/json/JSONObject;

    invoke-direct {v0, p1}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    const-string v1, "uid"

    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    move-result v0

    const/4 v1, -0x1

    if-ne v0, v1, :cond_1

    iget-object v0, p0, Lcom/pipaw/pipawpay/o;->a:Lcom/pipaw/pipawpay/PipawUserActivity;

    const-string v1, "\u8be5\u5e10\u53f7\u4e0d\u5408\u6cd5"

    invoke-static {v0, v1}, Lcom/pipaw/a/k;->a(Landroid/content/Context;Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception v0

    invoke-static {}, Lcom/pipaw/pipawpay/PipawUserActivity;->a()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1, v0}, Lcom/pipaw/a/d;->a(Ljava/lang/String;Ljava/lang/Throwable;)I

    iget-object v0, p0, Lcom/pipaw/pipawpay/o;->a:Lcom/pipaw/pipawpay/PipawUserActivity;

    const-string v1, "\u7cfb\u7edf\u5f02\u5e38"

    invoke-static {v0, v1}, Lcom/pipaw/a/k;->a(Landroid/content/Context;Ljava/lang/String;)V

    goto :goto_0

    :cond_1
    const/4 v1, -0x2

    if-ne v0, v1, :cond_2

    :try_start_1
    iget-object v0, p0, Lcom/pipaw/pipawpay/o;->a:Lcom/pipaw/pipawpay/PipawUserActivity;

    const-string v1, "\u8be5\u5e10\u53f7\u5305\u542b\u4e0d\u5141\u8bb8\u6ce8\u518c\u7684\u8bcd\u8bed"

    invoke-static {v0, v1}, Lcom/pipaw/a/k;->a(Landroid/content/Context;Ljava/lang/String;)V

    goto :goto_0

    :cond_2
    const/4 v1, -0x3

    if-ne v0, v1, :cond_3

    iget-object v0, p0, Lcom/pipaw/pipawpay/o;->a:Lcom/pipaw/pipawpay/PipawUserActivity;

    const-string v1, "\u8be5\u5e10\u53f7\u5df2\u7ecf\u5b58\u5728"

    invoke-static {v0, v1}, Lcom/pipaw/a/k;->a(Landroid/content/Context;Ljava/lang/String;)V

    goto :goto_0

    :cond_3
    const/4 v1, -0x7

    if-ne v0, v1, :cond_4

    iget-object v0, p0, Lcom/pipaw/pipawpay/o;->a:Lcom/pipaw/pipawpay/PipawUserActivity;

    const-string v1, "\u5bc6\u7801\u4e0d\u5408\u6cd5"

    invoke-static {v0, v1}, Lcom/pipaw/a/k;->a(Landroid/content/Context;Ljava/lang/String;)V

    goto :goto_0

    :cond_4
    if-lez v0, :cond_5

    iget-object v0, p0, Lcom/pipaw/pipawpay/o;->a:Lcom/pipaw/pipawpay/PipawUserActivity;

    const-string v1, "\u6ce8\u518c\u6210\u529f"

    invoke-static {v0, v1}, Lcom/pipaw/a/k;->a(Landroid/content/Context;Ljava/lang/String;)V

    iget-object v0, p0, Lcom/pipaw/pipawpay/o;->a:Lcom/pipaw/pipawpay/PipawUserActivity;

    iget-object v1, p0, Lcom/pipaw/pipawpay/o;->a:Lcom/pipaw/pipawpay/PipawUserActivity;

    invoke-static {v1}, Lcom/pipaw/pipawpay/PipawUserActivity;->f(Lcom/pipaw/pipawpay/PipawUserActivity;)Ljava/lang/String;

    move-result-object v1

    iget-object v2, p0, Lcom/pipaw/pipawpay/o;->a:Lcom/pipaw/pipawpay/PipawUserActivity;

    invoke-static {v2}, Lcom/pipaw/pipawpay/PipawUserActivity;->g(Lcom/pipaw/pipawpay/PipawUserActivity;)Ljava/lang/String;

    move-result-object v2

    const/4 v3, 0x1

    invoke-static {v0, v1, v2, v3}, Lcom/pipaw/pipawpay/a;->a(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Z)V

    iget-object v0, p0, Lcom/pipaw/pipawpay/o;->a:Lcom/pipaw/pipawpay/PipawUserActivity;

    iget-object v1, p0, Lcom/pipaw/pipawpay/o;->a:Lcom/pipaw/pipawpay/PipawUserActivity;

    invoke-static {v1}, Lcom/pipaw/pipawpay/PipawUserActivity;->f(Lcom/pipaw/pipawpay/PipawUserActivity;)Ljava/lang/String;

    move-result-object v1

    iget-object v2, p0, Lcom/pipaw/pipawpay/o;->a:Lcom/pipaw/pipawpay/PipawUserActivity;

    invoke-static {v2}, Lcom/pipaw/pipawpay/PipawUserActivity;->g(Lcom/pipaw/pipawpay/PipawUserActivity;)Ljava/lang/String;

    move-result-object v2

    invoke-static {v0, v1, v2}, Lcom/pipaw/pipawpay/PipawUserActivity;->a(Lcom/pipaw/pipawpay/PipawUserActivity;Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0

    :cond_5
    iget-object v0, p0, Lcom/pipaw/pipawpay/o;->a:Lcom/pipaw/pipawpay/PipawUserActivity;

    const-string v1, "\u6ce8\u518c\u4e0d\u6210\u529f"

    invoke-static {v0, v1}, Lcom/pipaw/a/k;->a(Landroid/content/Context;Ljava/lang/String;)V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    goto :goto_0
.end method

.method protected varargs synthetic doInBackground([Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1

    check-cast p1, [Ljava/lang/String;

    invoke-virtual {p0, p1}, Lcom/pipaw/pipawpay/o;->a([Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method protected synthetic onPostExecute(Ljava/lang/Object;)V
    .locals 0

    check-cast p1, Ljava/lang/String;

    invoke-virtual {p0, p1}, Lcom/pipaw/pipawpay/o;->a(Ljava/lang/String;)V

    return-void
.end method
