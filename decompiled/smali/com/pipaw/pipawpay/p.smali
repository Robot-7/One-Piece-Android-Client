.class Lcom/pipaw/pipawpay/p;
.super Landroid/os/AsyncTask;


# instance fields
.field final synthetic a:Lcom/pipaw/pipawpay/PipawUserActivity;


# direct methods
.method constructor <init>(Lcom/pipaw/pipawpay/PipawUserActivity;)V
    .locals 0

    iput-object p1, p0, Lcom/pipaw/pipawpay/p;->a:Lcom/pipaw/pipawpay/PipawUserActivity;

    invoke-direct {p0}, Landroid/os/AsyncTask;-><init>()V

    return-void
.end method


# virtual methods
.method protected varargs a([Ljava/lang/String;)Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lcom/pipaw/pipawpay/p;->a:Lcom/pipaw/pipawpay/PipawUserActivity;

    invoke-static {v0, p1}, Lcom/pipaw/pipawpay/PipawUserActivity;->e(Lcom/pipaw/pipawpay/PipawUserActivity;[Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method protected a(Ljava/lang/String;)V
    .locals 2

    iget-object v0, p0, Lcom/pipaw/pipawpay/p;->a:Lcom/pipaw/pipawpay/PipawUserActivity;

    invoke-static {v0}, Lcom/pipaw/pipawpay/PipawUserActivity;->a(Lcom/pipaw/pipawpay/PipawUserActivity;)Landroid/app/ProgressDialog;

    move-result-object v0

    invoke-static {v0}, Lcom/pipaw/a/f;->a(Landroid/app/ProgressDialog;)V

    invoke-static {p1}, Lcom/pipaw/a/j;->a(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/pipaw/pipawpay/p;->a:Lcom/pipaw/pipawpay/PipawUserActivity;

    const-string v1, "\u7f51\u7edc\u8fde\u63a5\u5f02\u5e38"

    invoke-static {v0, v1}, Lcom/pipaw/a/k;->a(Landroid/content/Context;Ljava/lang/String;)V

    :cond_0
    :goto_0
    invoke-super {p0, p1}, Landroid/os/AsyncTask;->onPostExecute(Ljava/lang/Object;)V

    return-void

    :cond_1
    :try_start_0
    new-instance v0, Lorg/json/JSONObject;

    invoke-direct {v0, p1}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    const-string v1, "status"

    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    const-string v1, "1"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2

    iget-object v0, p0, Lcom/pipaw/pipawpay/p;->a:Lcom/pipaw/pipawpay/PipawUserActivity;

    invoke-static {v0}, Lcom/pipaw/pipawpay/PipawUserActivity;->e(Lcom/pipaw/pipawpay/PipawUserActivity;)V

    iget-object v0, p0, Lcom/pipaw/pipawpay/p;->a:Lcom/pipaw/pipawpay/PipawUserActivity;

    const-string v1, "\u4fee\u6539\u6210\u529f"

    invoke-static {v0, v1}, Lcom/pipaw/a/k;->a(Landroid/content/Context;Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception v0

    invoke-static {}, Lcom/pipaw/pipawpay/PipawUserActivity;->a()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1, v0}, Lcom/pipaw/a/d;->a(Ljava/lang/String;Ljava/lang/Throwable;)I

    iget-object v0, p0, Lcom/pipaw/pipawpay/p;->a:Lcom/pipaw/pipawpay/PipawUserActivity;

    const-string v1, "\u7cfb\u7edf\u5f02\u5e38"

    invoke-static {v0, v1}, Lcom/pipaw/a/k;->a(Landroid/content/Context;Ljava/lang/String;)V

    goto :goto_0

    :cond_2
    :try_start_1
    const-string v1, "0"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_3

    iget-object v0, p0, Lcom/pipaw/pipawpay/p;->a:Lcom/pipaw/pipawpay/PipawUserActivity;

    invoke-static {v0}, Lcom/pipaw/pipawpay/PipawUserActivity;->e(Lcom/pipaw/pipawpay/PipawUserActivity;)V

    iget-object v0, p0, Lcom/pipaw/pipawpay/p;->a:Lcom/pipaw/pipawpay/PipawUserActivity;

    const-string v1, "\u4fee\u6539\u5931\u8d25,\u8bf7\u91cd\u8bd5."

    invoke-static {v0, v1}, Lcom/pipaw/a/k;->a(Landroid/content/Context;Ljava/lang/String;)V

    goto :goto_0

    :cond_3
    const-string v1, "-9"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/pipaw/pipawpay/p;->a:Lcom/pipaw/pipawpay/PipawUserActivity;

    const-string v1, "\u4fee\u6539\u8d85\u65f6,\u8bf7\u91cd\u8bd5."

    invoke-static {v0, v1}, Lcom/pipaw/a/k;->a(Landroid/content/Context;Ljava/lang/String;)V

    iget-object v0, p0, Lcom/pipaw/pipawpay/p;->a:Lcom/pipaw/pipawpay/PipawUserActivity;

    invoke-static {v0}, Lcom/pipaw/pipawpay/PipawUserActivity;->e(Lcom/pipaw/pipawpay/PipawUserActivity;)V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    goto :goto_0
.end method

.method protected varargs synthetic doInBackground([Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1

    check-cast p1, [Ljava/lang/String;

    invoke-virtual {p0, p1}, Lcom/pipaw/pipawpay/p;->a([Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method protected synthetic onPostExecute(Ljava/lang/Object;)V
    .locals 0

    check-cast p1, Ljava/lang/String;

    invoke-virtual {p0, p1}, Lcom/pipaw/pipawpay/p;->a(Ljava/lang/String;)V

    return-void
.end method
