.class Lcom/pipaw/pipawpay/g;
.super Ljava/lang/Object;

# interfaces
.implements Landroid/widget/AdapterView$OnItemClickListener;


# instance fields
.field final synthetic a:Lcom/pipaw/pipawpay/PipawUserActivity;


# direct methods
.method constructor <init>(Lcom/pipaw/pipawpay/PipawUserActivity;)V
    .locals 0

    iput-object p1, p0, Lcom/pipaw/pipawpay/g;->a:Lcom/pipaw/pipawpay/PipawUserActivity;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onItemClick(Landroid/widget/AdapterView;Landroid/view/View;IJ)V
    .locals 3

    :try_start_0
    invoke-virtual {p1, p3}, Landroid/widget/AdapterView;->getItemAtPosition(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    iget-object v1, p0, Lcom/pipaw/pipawpay/g;->a:Lcom/pipaw/pipawpay/PipawUserActivity;

    invoke-static {v1}, Lcom/pipaw/pipawpay/PipawUserActivity;->i(Lcom/pipaw/pipawpay/PipawUserActivity;)Landroid/widget/EditText;

    move-result-object v1

    if-eqz v1, :cond_0

    iget-object v1, p0, Lcom/pipaw/pipawpay/g;->a:Lcom/pipaw/pipawpay/PipawUserActivity;

    invoke-static {v1}, Lcom/pipaw/pipawpay/PipawUserActivity;->i(Lcom/pipaw/pipawpay/PipawUserActivity;)Landroid/widget/EditText;

    move-result-object v1

    invoke-virtual {v1, v0}, Landroid/widget/EditText;->setText(Ljava/lang/CharSequence;)V

    iget-object v1, p0, Lcom/pipaw/pipawpay/g;->a:Lcom/pipaw/pipawpay/PipawUserActivity;

    invoke-static {v1}, Lcom/pipaw/pipawpay/PipawUserActivity;->i(Lcom/pipaw/pipawpay/PipawUserActivity;)Landroid/widget/EditText;

    move-result-object v1

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v2

    invoke-virtual {v1, v2}, Landroid/widget/EditText;->setSelection(I)V

    :cond_0
    iget-object v1, p0, Lcom/pipaw/pipawpay/g;->a:Lcom/pipaw/pipawpay/PipawUserActivity;

    invoke-static {v1}, Lcom/pipaw/pipawpay/PipawUserActivity;->j(Lcom/pipaw/pipawpay/PipawUserActivity;)Landroid/widget/EditText;

    move-result-object v1

    if-eqz v1, :cond_1

    iget-object v1, p0, Lcom/pipaw/pipawpay/g;->a:Lcom/pipaw/pipawpay/PipawUserActivity;

    invoke-static {v1, v0}, Lcom/pipaw/pipawpay/a;->b(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    iget-object v1, p0, Lcom/pipaw/pipawpay/g;->a:Lcom/pipaw/pipawpay/PipawUserActivity;

    invoke-static {v1}, Lcom/pipaw/pipawpay/PipawUserActivity;->j(Lcom/pipaw/pipawpay/PipawUserActivity;)Landroid/widget/EditText;

    move-result-object v1

    invoke-virtual {v1, v0}, Landroid/widget/EditText;->setText(Ljava/lang/CharSequence;)V

    iget-object v1, p0, Lcom/pipaw/pipawpay/g;->a:Lcom/pipaw/pipawpay/PipawUserActivity;

    invoke-static {v1}, Lcom/pipaw/pipawpay/PipawUserActivity;->j(Lcom/pipaw/pipawpay/PipawUserActivity;)Landroid/widget/EditText;

    move-result-object v1

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v0

    invoke-virtual {v1, v0}, Landroid/widget/EditText;->setSelection(I)V

    :cond_1
    iget-object v0, p0, Lcom/pipaw/pipawpay/g;->a:Lcom/pipaw/pipawpay/PipawUserActivity;

    invoke-static {v0}, Lcom/pipaw/pipawpay/PipawUserActivity;->h(Lcom/pipaw/pipawpay/PipawUserActivity;)Landroid/widget/PopupWindow;

    move-result-object v0

    invoke-virtual {v0}, Landroid/widget/PopupWindow;->dismiss()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    :goto_0
    return-void

    :catch_0
    move-exception v0

    invoke-static {}, Lcom/pipaw/pipawpay/PipawUserActivity;->a()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1, v0}, Lcom/pipaw/a/d;->a(Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_0
.end method
