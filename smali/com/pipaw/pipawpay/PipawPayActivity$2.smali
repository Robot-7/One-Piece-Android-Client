.class Lcom/pipaw/pipawpay/PipawPayActivity$2;
.super Landroid/webkit/WebChromeClient;


# instance fields
.field final synthetic this$0:Lcom/pipaw/pipawpay/PipawPayActivity;


# direct methods
.method constructor <init>(Lcom/pipaw/pipawpay/PipawPayActivity;)V
    .locals 0

    iput-object p1, p0, Lcom/pipaw/pipawpay/PipawPayActivity$2;->this$0:Lcom/pipaw/pipawpay/PipawPayActivity;

    invoke-direct {p0}, Landroid/webkit/WebChromeClient;-><init>()V

    return-void
.end method


# virtual methods
.method public onJsAlert(Landroid/webkit/WebView;Ljava/lang/String;Ljava/lang/String;Landroid/webkit/JsResult;)Z
    .locals 3

    new-instance v0, Landroid/app/AlertDialog$Builder;

    iget-object v1, p0, Lcom/pipaw/pipawpay/PipawPayActivity$2;->this$0:Lcom/pipaw/pipawpay/PipawPayActivity;

    invoke-direct {v0, v1}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    const-string v1, "\u63d0\u793a"

    invoke-virtual {v0, v1}, Landroid/app/AlertDialog$Builder;->setTitle(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    invoke-virtual {v0, p3}, Landroid/app/AlertDialog$Builder;->setMessage(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    const-string v1, "\u786e\u8ba4"

    new-instance v2, Lcom/pipaw/pipawpay/PipawPayActivity$2$1;

    invoke-direct {v2, p0}, Lcom/pipaw/pipawpay/PipawPayActivity$2$1;-><init>(Lcom/pipaw/pipawpay/PipawPayActivity$2;)V

    invoke-virtual {v0, v1, v2}, Landroid/app/AlertDialog$Builder;->setPositiveButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    invoke-virtual {v0}, Landroid/app/AlertDialog$Builder;->create()Landroid/app/AlertDialog;

    move-result-object v0

    invoke-virtual {v0}, Landroid/app/AlertDialog;->show()V

    invoke-virtual {p4}, Landroid/webkit/JsResult;->confirm()V

    const/4 v0, 0x1

    return v0
.end method

.method public onProgressChanged(Landroid/webkit/WebView;I)V
    .locals 3

    invoke-static {}, Lcom/pipaw/pipawpay/PipawPayActivity;->a()Ljava/lang/String;

    move-result-object v0

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "newProgress "

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/pipaw/a/d;->a(Ljava/lang/String;Ljava/lang/String;)I

    iget-object v0, p0, Lcom/pipaw/pipawpay/PipawPayActivity$2;->this$0:Lcom/pipaw/pipawpay/PipawPayActivity;

    invoke-static {v0}, Lcom/pipaw/pipawpay/PipawPayActivity;->a(Lcom/pipaw/pipawpay/PipawPayActivity;)Landroid/widget/ProgressBar;

    move-result-object v0

    invoke-virtual {v0, p2}, Landroid/widget/ProgressBar;->setProgress(I)V

    const/16 v0, 0x64

    if-ne p2, v0, :cond_0

    iget-object v0, p0, Lcom/pipaw/pipawpay/PipawPayActivity$2;->this$0:Lcom/pipaw/pipawpay/PipawPayActivity;

    invoke-static {v0}, Lcom/pipaw/pipawpay/PipawPayActivity;->a(Lcom/pipaw/pipawpay/PipawPayActivity;)Landroid/widget/ProgressBar;

    move-result-object v0

    const/16 v1, 0x8

    invoke-virtual {v0, v1}, Landroid/widget/ProgressBar;->setVisibility(I)V

    :goto_0
    invoke-super {p0, p1, p2}, Landroid/webkit/WebChromeClient;->onProgressChanged(Landroid/webkit/WebView;I)V

    return-void

    :cond_0
    iget-object v0, p0, Lcom/pipaw/pipawpay/PipawPayActivity$2;->this$0:Lcom/pipaw/pipawpay/PipawPayActivity;

    invoke-static {v0}, Lcom/pipaw/pipawpay/PipawPayActivity;->a(Lcom/pipaw/pipawpay/PipawPayActivity;)Landroid/widget/ProgressBar;

    move-result-object v0

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/widget/ProgressBar;->setVisibility(I)V

    goto :goto_0
.end method
