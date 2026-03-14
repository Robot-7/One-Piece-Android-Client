.class Lcom/pipaw/pipawpay/k;
.super Landroid/os/AsyncTask;


# instance fields
.field final synthetic a:Lcom/pipaw/pipawpay/PipawUserActivity;

.field private b:Ljava/lang/String;

.field private c:Ljava/lang/String;


# direct methods
.method public constructor <init>(Lcom/pipaw/pipawpay/PipawUserActivity;Ljava/lang/String;Ljava/lang/String;)V
    .locals 0

    iput-object p1, p0, Lcom/pipaw/pipawpay/k;->a:Lcom/pipaw/pipawpay/PipawUserActivity;

    invoke-direct {p0}, Landroid/os/AsyncTask;-><init>()V

    iput-object p2, p0, Lcom/pipaw/pipawpay/k;->b:Ljava/lang/String;

    iput-object p3, p0, Lcom/pipaw/pipawpay/k;->c:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method protected varargs a([Ljava/lang/String;)Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lcom/pipaw/pipawpay/k;->a:Lcom/pipaw/pipawpay/PipawUserActivity;

    invoke-static {v0, p1}, Lcom/pipaw/pipawpay/PipawUserActivity;->a(Lcom/pipaw/pipawpay/PipawUserActivity;[Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method protected a(Ljava/lang/String;)V
    .locals 8

    iget-object v0, p0, Lcom/pipaw/pipawpay/k;->a:Lcom/pipaw/pipawpay/PipawUserActivity;

    invoke-static {v0}, Lcom/pipaw/pipawpay/PipawUserActivity;->a(Lcom/pipaw/pipawpay/PipawUserActivity;)Landroid/app/ProgressDialog;

    move-result-object v0

    invoke-static {v0}, Lcom/pipaw/a/f;->a(Landroid/app/ProgressDialog;)V

    invoke-static {p1}, Lcom/pipaw/a/j;->a(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/pipaw/pipawpay/k;->a:Lcom/pipaw/pipawpay/PipawUserActivity;

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

    const-string v1, "uid"

    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    const-string v2, "username"

    invoke-virtual {v0, v2}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    const-string v3, "sid"

    invoke-virtual {v0, v3}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    const-string v4, "time"

    invoke-virtual {v0, v4}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    const-string v5, "is_bind"

    invoke-virtual {v0, v5}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    const-string v5, "-1"

    invoke-virtual {v3, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_2

    iget-object v0, p0, Lcom/pipaw/pipawpay/k;->a:Lcom/pipaw/pipawpay/PipawUserActivity;

    const-string v1, "\u5e10\u53f7\u4e0d\u5b58\u5728"

    invoke-static {v0, v1}, Lcom/pipaw/a/k;->a(Landroid/content/Context;Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception v0

    invoke-static {}, Lcom/pipaw/pipawpay/PipawUserActivity;->a()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1, v0}, Lcom/pipaw/a/d;->a(Ljava/lang/String;Ljava/lang/Throwable;)I

    iget-object v0, p0, Lcom/pipaw/pipawpay/k;->a:Lcom/pipaw/pipawpay/PipawUserActivity;

    const-string v1, "\u7cfb\u7edf\u5f02\u5e38"

    invoke-static {v0, v1}, Lcom/pipaw/a/k;->a(Landroid/content/Context;Ljava/lang/String;)V

    goto :goto_0

    :cond_2
    :try_start_1
    const-string v5, "-2"

    invoke-virtual {v3, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_3

    iget-object v0, p0, Lcom/pipaw/pipawpay/k;->a:Lcom/pipaw/pipawpay/PipawUserActivity;

    const-string v1, "\u5e10\u53f7\u6216\u5bc6\u7801\u9519\u8bef"

    invoke-static {v0, v1}, Lcom/pipaw/a/k;->a(Landroid/content/Context;Ljava/lang/String;)V

    goto :goto_0

    :cond_3
    iget-object v5, p0, Lcom/pipaw/pipawpay/k;->a:Lcom/pipaw/pipawpay/PipawUserActivity;

    const-string v6, "pipaw"

    const-string v7, "uid"

    invoke-static {v5, v6, v7, v1}, Lcom/pipaw/a/i;->b(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    invoke-static {v3}, Lcom/pipaw/pipawpay/a;->a(Ljava/lang/String;)V

    invoke-static {v4}, Lcom/pipaw/pipawpay/a;->b(Ljava/lang/String;)V

    new-instance v1, Lorg/json/JSONObject;

    invoke-direct {v1}, Lorg/json/JSONObject;-><init>()V

    const-string v5, "username"

    invoke-virtual {v1, v5, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    const-string v2, "sid"

    invoke-virtual {v1, v2, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    const-string v2, "time"

    invoke-virtual {v1, v2, v4}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    iget-object v2, p0, Lcom/pipaw/pipawpay/k;->a:Lcom/pipaw/pipawpay/PipawUserActivity;

    invoke-virtual {v1}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v2, v1}, Lcom/pipaw/pipawpay/PipawUserActivity;->a(Lcom/pipaw/pipawpay/PipawUserActivity;Ljava/lang/String;)V

    iget-object v1, p0, Lcom/pipaw/pipawpay/k;->a:Lcom/pipaw/pipawpay/PipawUserActivity;

    invoke-static {v1}, Lcom/pipaw/pipawpay/PipawUserActivity;->b(Lcom/pipaw/pipawpay/PipawUserActivity;)Landroid/widget/CheckBox;

    move-result-object v1

    invoke-virtual {v1}, Landroid/widget/CheckBox;->isChecked()Z

    move-result v1

    if-eqz v1, :cond_4

    iget-object v1, p0, Lcom/pipaw/pipawpay/k;->a:Lcom/pipaw/pipawpay/PipawUserActivity;

    iget-object v2, p0, Lcom/pipaw/pipawpay/k;->b:Ljava/lang/String;

    iget-object v3, p0, Lcom/pipaw/pipawpay/k;->c:Ljava/lang/String;

    const/4 v4, 0x1

    invoke-static {v1, v2, v3, v4}, Lcom/pipaw/pipawpay/a;->a(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Z)V

    :goto_1
    iget-object v1, p0, Lcom/pipaw/pipawpay/k;->a:Lcom/pipaw/pipawpay/PipawUserActivity;

    const-string v2, "\u767b\u5f55\u6210\u529f"

    invoke-static {v1, v2}, Lcom/pipaw/a/k;->a(Landroid/content/Context;Ljava/lang/String;)V

    const-string v1, "1"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_5

    iget-object v0, p0, Lcom/pipaw/pipawpay/k;->a:Lcom/pipaw/pipawpay/PipawUserActivity;

    const/16 v1, 0x7d1

    iget-object v2, p0, Lcom/pipaw/pipawpay/k;->a:Lcom/pipaw/pipawpay/PipawUserActivity;

    invoke-static {v2}, Lcom/pipaw/pipawpay/PipawUserActivity;->c(Lcom/pipaw/pipawpay/PipawUserActivity;)Ljava/lang/String;

    move-result-object v2

    invoke-static {v0, v1, v2}, Lcom/pipaw/pipawpay/PipawUserActivity;->a(Lcom/pipaw/pipawpay/PipawUserActivity;ILjava/lang/String;)V

    goto/16 :goto_0

    :cond_4
    iget-object v1, p0, Lcom/pipaw/pipawpay/k;->a:Lcom/pipaw/pipawpay/PipawUserActivity;

    iget-object v2, p0, Lcom/pipaw/pipawpay/k;->b:Ljava/lang/String;

    iget-object v3, p0, Lcom/pipaw/pipawpay/k;->c:Ljava/lang/String;

    const/4 v4, 0x0

    invoke-static {v1, v2, v3, v4}, Lcom/pipaw/pipawpay/a;->a(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Z)V

    goto :goto_1

    :cond_5
    const-string v1, "0"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/pipaw/pipawpay/k;->a:Lcom/pipaw/pipawpay/PipawUserActivity;

    iget-object v1, p0, Lcom/pipaw/pipawpay/k;->b:Ljava/lang/String;

    invoke-static {v0, v1}, Lcom/pipaw/pipawpay/a;->c(Landroid/content/Context;Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_6

    iget-object v0, p0, Lcom/pipaw/pipawpay/k;->a:Lcom/pipaw/pipawpay/PipawUserActivity;

    const/16 v1, 0x7d1

    iget-object v2, p0, Lcom/pipaw/pipawpay/k;->a:Lcom/pipaw/pipawpay/PipawUserActivity;

    invoke-static {v2}, Lcom/pipaw/pipawpay/PipawUserActivity;->c(Lcom/pipaw/pipawpay/PipawUserActivity;)Ljava/lang/String;

    move-result-object v2

    invoke-static {v0, v1, v2}, Lcom/pipaw/pipawpay/PipawUserActivity;->a(Lcom/pipaw/pipawpay/PipawUserActivity;ILjava/lang/String;)V

    goto/16 :goto_0

    :cond_6
    iget-object v0, p0, Lcom/pipaw/pipawpay/k;->a:Lcom/pipaw/pipawpay/PipawUserActivity;

    invoke-static {v0}, Lcom/pipaw/pipawpay/PipawUserActivity;->d(Lcom/pipaw/pipawpay/PipawUserActivity;)V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    goto/16 :goto_0
.end method

.method protected varargs synthetic doInBackground([Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1

    check-cast p1, [Ljava/lang/String;

    invoke-virtual {p0, p1}, Lcom/pipaw/pipawpay/k;->a([Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method protected synthetic onPostExecute(Ljava/lang/Object;)V
    .locals 0

    check-cast p1, Ljava/lang/String;

    invoke-virtual {p0, p1}, Lcom/pipaw/pipawpay/k;->a(Ljava/lang/String;)V

    return-void
.end method
