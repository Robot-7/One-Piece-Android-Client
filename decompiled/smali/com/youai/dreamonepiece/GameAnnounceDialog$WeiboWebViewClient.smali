.class Lcom/youai/dreamonepiece/GameAnnounceDialog$WeiboWebViewClient;
.super Landroid/webkit/WebViewClient;
.source "GameAnnounceDialog.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/youai/dreamonepiece/GameAnnounceDialog;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "WeiboWebViewClient"
.end annotation


# instance fields
.field haveErr:Z

.field final synthetic this$0:Lcom/youai/dreamonepiece/GameAnnounceDialog;


# direct methods
.method private constructor <init>(Lcom/youai/dreamonepiece/GameAnnounceDialog;)V
    .locals 1

    .prologue
    .line 224
    iput-object p1, p0, Lcom/youai/dreamonepiece/GameAnnounceDialog$WeiboWebViewClient;->this$0:Lcom/youai/dreamonepiece/GameAnnounceDialog;

    invoke-direct {p0}, Landroid/webkit/WebViewClient;-><init>()V

    .line 225
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/youai/dreamonepiece/GameAnnounceDialog$WeiboWebViewClient;->haveErr:Z

    return-void
.end method

.method synthetic constructor <init>(Lcom/youai/dreamonepiece/GameAnnounceDialog;Lcom/youai/dreamonepiece/GameAnnounceDialog$1;)V
    .locals 0
    .param p1, "x0"    # Lcom/youai/dreamonepiece/GameAnnounceDialog;
    .param p2, "x1"    # Lcom/youai/dreamonepiece/GameAnnounceDialog$1;

    .prologue
    .line 224
    invoke-direct {p0, p1}, Lcom/youai/dreamonepiece/GameAnnounceDialog$WeiboWebViewClient;-><init>(Lcom/youai/dreamonepiece/GameAnnounceDialog;)V

    return-void
.end method


# virtual methods
.method public onPageFinished(Landroid/webkit/WebView;Ljava/lang/String;)V
    .locals 5
    .param p1, "view"    # Landroid/webkit/WebView;
    .param p2, "url"    # Ljava/lang/String;

    .prologue
    const/4 v4, 0x4

    const/4 v3, 0x0

    .line 252
    invoke-static {}, Lcom/youai/dreamonepiece/GameAnnounceDialog;->access$400()Ljava/lang/String;

    move-result-object v0

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "onPageFinished URL: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 253
    invoke-super {p0, p1, p2}, Landroid/webkit/WebViewClient;->onPageFinished(Landroid/webkit/WebView;Ljava/lang/String;)V

    .line 254
    iget-object v0, p0, Lcom/youai/dreamonepiece/GameAnnounceDialog$WeiboWebViewClient;->this$0:Lcom/youai/dreamonepiece/GameAnnounceDialog;

    invoke-static {v0}, Lcom/youai/dreamonepiece/GameAnnounceDialog;->access$000(Lcom/youai/dreamonepiece/GameAnnounceDialog;)Landroid/app/ProgressDialog;

    move-result-object v0

    invoke-virtual {v0}, Landroid/app/ProgressDialog;->isShowing()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 255
    iget-object v0, p0, Lcom/youai/dreamonepiece/GameAnnounceDialog$WeiboWebViewClient;->this$0:Lcom/youai/dreamonepiece/GameAnnounceDialog;

    invoke-static {v0}, Lcom/youai/dreamonepiece/GameAnnounceDialog;->access$000(Lcom/youai/dreamonepiece/GameAnnounceDialog;)Landroid/app/ProgressDialog;

    move-result-object v0

    invoke-virtual {v0}, Landroid/app/ProgressDialog;->dismiss()V

    .line 258
    :cond_0
    iget-boolean v0, p0, Lcom/youai/dreamonepiece/GameAnnounceDialog$WeiboWebViewClient;->haveErr:Z

    if-eqz v0, :cond_1

    .line 259
    iget-object v0, p0, Lcom/youai/dreamonepiece/GameAnnounceDialog$WeiboWebViewClient;->this$0:Lcom/youai/dreamonepiece/GameAnnounceDialog;

    invoke-virtual {v0}, Lcom/youai/dreamonepiece/GameAnnounceDialog;->onBack()V

    .line 260
    iget-object v0, p0, Lcom/youai/dreamonepiece/GameAnnounceDialog$WeiboWebViewClient;->this$0:Lcom/youai/dreamonepiece/GameAnnounceDialog;

    invoke-static {v0}, Lcom/youai/dreamonepiece/GameAnnounceDialog;->access$500(Lcom/youai/dreamonepiece/GameAnnounceDialog;)Landroid/widget/RelativeLayout;

    move-result-object v0

    invoke-virtual {v0, v4}, Landroid/widget/RelativeLayout;->setVisibility(I)V

    .line 261
    iget-object v0, p0, Lcom/youai/dreamonepiece/GameAnnounceDialog$WeiboWebViewClient;->this$0:Lcom/youai/dreamonepiece/GameAnnounceDialog;

    invoke-static {v0}, Lcom/youai/dreamonepiece/GameAnnounceDialog;->access$100(Lcom/youai/dreamonepiece/GameAnnounceDialog;)Landroid/webkit/WebView;

    move-result-object v0

    invoke-virtual {v0, v4}, Landroid/webkit/WebView;->setVisibility(I)V

    .line 262
    iget-object v0, p0, Lcom/youai/dreamonepiece/GameAnnounceDialog$WeiboWebViewClient;->this$0:Lcom/youai/dreamonepiece/GameAnnounceDialog;

    invoke-static {v0}, Lcom/youai/dreamonepiece/GameAnnounceDialog;->access$600(Lcom/youai/dreamonepiece/GameAnnounceDialog;)Landroid/widget/ImageButton;

    move-result-object v0

    invoke-virtual {v0, v4}, Landroid/widget/ImageButton;->setVisibility(I)V

    .line 263
    iget-object v0, p0, Lcom/youai/dreamonepiece/GameAnnounceDialog$WeiboWebViewClient;->this$0:Lcom/youai/dreamonepiece/GameAnnounceDialog;

    invoke-static {v0}, Lcom/youai/dreamonepiece/GameAnnounceDialog;->access$200(Lcom/youai/dreamonepiece/GameAnnounceDialog;)Landroid/widget/RelativeLayout;

    move-result-object v0

    invoke-virtual {v0, v4}, Landroid/widget/RelativeLayout;->setVisibility(I)V

    .line 273
    :goto_0
    iput-boolean v3, p0, Lcom/youai/dreamonepiece/GameAnnounceDialog$WeiboWebViewClient;->haveErr:Z

    .line 275
    return-void

    .line 266
    :cond_1
    iget-object v0, p0, Lcom/youai/dreamonepiece/GameAnnounceDialog$WeiboWebViewClient;->this$0:Lcom/youai/dreamonepiece/GameAnnounceDialog;

    invoke-static {v0}, Lcom/youai/dreamonepiece/GameAnnounceDialog;->access$500(Lcom/youai/dreamonepiece/GameAnnounceDialog;)Landroid/widget/RelativeLayout;

    move-result-object v0

    invoke-virtual {v0, v3}, Landroid/widget/RelativeLayout;->setVisibility(I)V

    .line 267
    iget-object v0, p0, Lcom/youai/dreamonepiece/GameAnnounceDialog$WeiboWebViewClient;->this$0:Lcom/youai/dreamonepiece/GameAnnounceDialog;

    invoke-static {v0}, Lcom/youai/dreamonepiece/GameAnnounceDialog;->access$100(Lcom/youai/dreamonepiece/GameAnnounceDialog;)Landroid/webkit/WebView;

    move-result-object v0

    invoke-virtual {v0, v3}, Landroid/webkit/WebView;->setVisibility(I)V

    .line 268
    iget-object v0, p0, Lcom/youai/dreamonepiece/GameAnnounceDialog$WeiboWebViewClient;->this$0:Lcom/youai/dreamonepiece/GameAnnounceDialog;

    invoke-static {v0}, Lcom/youai/dreamonepiece/GameAnnounceDialog;->access$600(Lcom/youai/dreamonepiece/GameAnnounceDialog;)Landroid/widget/ImageButton;

    move-result-object v0

    invoke-virtual {v0, v3}, Landroid/widget/ImageButton;->setVisibility(I)V

    .line 269
    iget-object v0, p0, Lcom/youai/dreamonepiece/GameAnnounceDialog$WeiboWebViewClient;->this$0:Lcom/youai/dreamonepiece/GameAnnounceDialog;

    invoke-static {v0}, Lcom/youai/dreamonepiece/GameAnnounceDialog;->access$200(Lcom/youai/dreamonepiece/GameAnnounceDialog;)Landroid/widget/RelativeLayout;

    move-result-object v0

    invoke-virtual {v0, v3}, Landroid/widget/RelativeLayout;->setVisibility(I)V

    goto :goto_0
.end method

.method public onPageStarted(Landroid/webkit/WebView;Ljava/lang/String;Landroid/graphics/Bitmap;)V
    .locals 1
    .param p1, "view"    # Landroid/webkit/WebView;
    .param p2, "url"    # Ljava/lang/String;
    .param p3, "favicon"    # Landroid/graphics/Bitmap;

    .prologue
    .line 246
    invoke-super {p0, p1, p2, p3}, Landroid/webkit/WebViewClient;->onPageStarted(Landroid/webkit/WebView;Ljava/lang/String;Landroid/graphics/Bitmap;)V

    .line 247
    iget-object v0, p0, Lcom/youai/dreamonepiece/GameAnnounceDialog$WeiboWebViewClient;->this$0:Lcom/youai/dreamonepiece/GameAnnounceDialog;

    invoke-static {v0}, Lcom/youai/dreamonepiece/GameAnnounceDialog;->access$000(Lcom/youai/dreamonepiece/GameAnnounceDialog;)Landroid/app/ProgressDialog;

    move-result-object v0

    invoke-virtual {v0}, Landroid/app/ProgressDialog;->show()V

    .line 248
    return-void
.end method

.method public onReceivedError(Landroid/webkit/WebView;ILjava/lang/String;Ljava/lang/String;)V
    .locals 3
    .param p1, "view"    # Landroid/webkit/WebView;
    .param p2, "errorCode"    # I
    .param p3, "description"    # Ljava/lang/String;
    .param p4, "failingUrl"    # Ljava/lang/String;

    .prologue
    .line 237
    invoke-super {p0, p1, p2, p3, p4}, Landroid/webkit/WebViewClient;->onReceivedError(Landroid/webkit/WebView;ILjava/lang/String;Ljava/lang/String;)V

    .line 238
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/youai/dreamonepiece/GameAnnounceDialog$WeiboWebViewClient;->haveErr:Z

    .line 239
    const-string v0, "error"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "error+"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 241
    return-void
.end method

.method public shouldOverrideUrlLoading(Landroid/webkit/WebView;Ljava/lang/String;)Z
    .locals 3
    .param p1, "view"    # Landroid/webkit/WebView;
    .param p2, "url"    # Ljava/lang/String;

    .prologue
    .line 229
    invoke-static {}, Lcom/youai/dreamonepiece/GameAnnounceDialog;->access$400()Ljava/lang/String;

    move-result-object v0

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "shouldOverrideUrlLoading URL: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 231
    invoke-super {p0, p1, p2}, Landroid/webkit/WebViewClient;->shouldOverrideUrlLoading(Landroid/webkit/WebView;Ljava/lang/String;)Z

    move-result v0

    return v0
.end method
