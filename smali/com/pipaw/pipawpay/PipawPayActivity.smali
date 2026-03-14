.class public Lcom/pipaw/pipawpay/PipawPayActivity;
.super Landroid/app/Activity;

# interfaces
.implements Landroid/view/View$OnClickListener;


# static fields
.field private static final a:Ljava/lang/String;


# instance fields
.field private b:Lcom/pipaw/pipawpay/PipawPayRequest;

.field private c:Ljava/lang/String;

.field private d:Ljava/lang/String;

.field private e:Ljava/lang/String;

.field private f:Ljava/lang/String;

.field private g:Ljava/lang/String;

.field private h:Ljava/lang/String;

.field private i:Ljava/lang/String;

.field private j:Ljava/lang/String;

.field private k:Ljava/lang/String;

.field private l:Ljava/lang/String;

.field private m:I

.field private n:Landroid/widget/ImageView;

.field private o:Landroid/widget/TextView;

.field private p:Landroid/widget/ProgressBar;

.field private q:Landroid/webkit/WebView;

.field private r:Ljava/lang/String;

.field private s:Ljava/lang/String;

.field private t:Ljava/lang/String;

.field private u:Ljava/lang/String;

.field private v:Landroid/webkit/WebViewClient;

.field private w:Landroid/webkit/WebChromeClient;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    const-class v0, Lcom/pipaw/pipawpay/PipawPayActivity;

    invoke-static {v0}, Lcom/pipaw/a/d;->a(Ljava/lang/Class;)Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/pipaw/pipawpay/PipawPayActivity;->a:Ljava/lang/String;

    return-void
.end method

.method public constructor <init>()V
    .locals 1

    invoke-direct {p0}, Landroid/app/Activity;-><init>()V

    const-string v0, "true"

    iput-object v0, p0, Lcom/pipaw/pipawpay/PipawPayActivity;->g:Ljava/lang/String;

    new-instance v0, Lcom/pipaw/pipawpay/PipawPayActivity$1;

    invoke-direct {v0, p0}, Lcom/pipaw/pipawpay/PipawPayActivity$1;-><init>(Lcom/pipaw/pipawpay/PipawPayActivity;)V

    iput-object v0, p0, Lcom/pipaw/pipawpay/PipawPayActivity;->v:Landroid/webkit/WebViewClient;

    new-instance v0, Lcom/pipaw/pipawpay/PipawPayActivity$2;

    invoke-direct {v0, p0}, Lcom/pipaw/pipawpay/PipawPayActivity$2;-><init>(Lcom/pipaw/pipawpay/PipawPayActivity;)V

    iput-object v0, p0, Lcom/pipaw/pipawpay/PipawPayActivity;->w:Landroid/webkit/WebChromeClient;

    return-void
.end method

.method static synthetic a(Lcom/pipaw/pipawpay/PipawPayActivity;)Landroid/widget/ProgressBar;
    .locals 1

    iget-object v0, p0, Lcom/pipaw/pipawpay/PipawPayActivity;->p:Landroid/widget/ProgressBar;

    return-object v0
.end method

.method static synthetic a()Ljava/lang/String;
    .locals 1

    sget-object v0, Lcom/pipaw/pipawpay/PipawPayActivity;->a:Ljava/lang/String;

    return-object v0
.end method

.method private a(ILjava/lang/String;)V
    .locals 2

    invoke-static {}, Lcom/pipaw/pipawpay/PipawSDK;->getInstance()Lcom/pipaw/pipawpay/PipawSDK;

    move-result-object v0

    invoke-virtual {v0, p1, p2}, Lcom/pipaw/pipawpay/PipawSDK;->payCallback(ILjava/lang/String;)V

    sget-object v0, Lcom/pipaw/pipawpay/PipawPayActivity;->a:Ljava/lang/String;

    const-string v1, "finish"

    invoke-static {v0, v1}, Lcom/pipaw/a/d;->a(Ljava/lang/String;Ljava/lang/String;)I

    invoke-virtual {p0}, Lcom/pipaw/pipawpay/PipawPayActivity;->finish()V

    return-void
.end method

.method static synthetic a(Lcom/pipaw/pipawpay/PipawPayActivity;ILjava/lang/String;)V
    .locals 0

    invoke-direct {p0, p1, p2}, Lcom/pipaw/pipawpay/PipawPayActivity;->a(ILjava/lang/String;)V

    return-void
.end method

.method private b()V
    .locals 8

    new-instance v4, Lcom/pipaw/pipawpay/PipawPayActivity$3;

    invoke-direct {v4, p0}, Lcom/pipaw/pipawpay/PipawPayActivity$3;-><init>(Lcom/pipaw/pipawpay/PipawPayActivity;)V

    const-string v1, "\u63d0\u793a"

    const-string v2, "\u786e\u5b9a\u53d6\u6d88\u672c\u6b21\u652f\u4ed8\uff1f"

    const-string v3, "\u786e\u5b9a"

    const-string v5, "\u53d6\u6d88"

    const/4 v6, 0x0

    const/4 v7, 0x0

    move-object v0, p0

    invoke-static/range {v0 .. v7}, Lcom/pipaw/a/a;->a(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Landroid/content/DialogInterface$OnClickListener;Ljava/lang/String;Landroid/content/DialogInterface$OnClickListener;Z)V

    return-void
.end method

.method private c()Z
    .locals 3

    const/4 v0, 0x0

    iget-object v1, p0, Lcom/pipaw/pipawpay/PipawPayActivity;->b:Lcom/pipaw/pipawpay/PipawPayRequest;

    if-nez v1, :cond_1

    :cond_0
    :goto_0
    return v0

    :cond_1
    iget-object v1, p0, Lcom/pipaw/pipawpay/PipawPayActivity;->b:Lcom/pipaw/pipawpay/PipawPayRequest;

    invoke-virtual {v1}, Lcom/pipaw/pipawpay/PipawPayRequest;->getExtraParam()Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lcom/pipaw/pipawpay/PipawPayActivity;->l:Ljava/lang/String;

    iget-object v1, p0, Lcom/pipaw/pipawpay/PipawPayActivity;->l:Ljava/lang/String;

    invoke-static {v1}, Lcom/pipaw/a/j;->a(Ljava/lang/CharSequence;)Z

    move-result v1

    if-eqz v1, :cond_2

    const-string v1, ""

    iput-object v1, p0, Lcom/pipaw/pipawpay/PipawPayActivity;->l:Ljava/lang/String;

    :cond_2
    iget-object v1, p0, Lcom/pipaw/pipawpay/PipawPayActivity;->b:Lcom/pipaw/pipawpay/PipawPayRequest;

    invoke-virtual {v1}, Lcom/pipaw/pipawpay/PipawPayRequest;->getMerchantId()Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lcom/pipaw/pipawpay/PipawPayActivity;->c:Ljava/lang/String;

    iget-object v1, p0, Lcom/pipaw/pipawpay/PipawPayActivity;->b:Lcom/pipaw/pipawpay/PipawPayRequest;

    invoke-virtual {v1}, Lcom/pipaw/pipawpay/PipawPayRequest;->getMerchantAppId()Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lcom/pipaw/pipawpay/PipawPayActivity;->d:Ljava/lang/String;

    iget-object v1, p0, Lcom/pipaw/pipawpay/PipawPayActivity;->b:Lcom/pipaw/pipawpay/PipawPayRequest;

    invoke-virtual {v1}, Lcom/pipaw/pipawpay/PipawPayRequest;->getAppId()Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lcom/pipaw/pipawpay/PipawPayActivity;->e:Ljava/lang/String;

    iget-object v1, p0, Lcom/pipaw/pipawpay/PipawPayActivity;->b:Lcom/pipaw/pipawpay/PipawPayRequest;

    invoke-virtual {v1}, Lcom/pipaw/pipawpay/PipawPayRequest;->getPayerId()Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lcom/pipaw/pipawpay/PipawPayActivity;->f:Ljava/lang/String;

    iget-object v1, p0, Lcom/pipaw/pipawpay/PipawPayActivity;->b:Lcom/pipaw/pipawpay/PipawPayRequest;

    invoke-virtual {v1}, Lcom/pipaw/pipawpay/PipawPayRequest;->getExOrderNo()Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lcom/pipaw/pipawpay/PipawPayActivity;->h:Ljava/lang/String;

    iget-object v1, p0, Lcom/pipaw/pipawpay/PipawPayActivity;->b:Lcom/pipaw/pipawpay/PipawPayRequest;

    invoke-virtual {v1}, Lcom/pipaw/pipawpay/PipawPayRequest;->getSubject()Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lcom/pipaw/pipawpay/PipawPayActivity;->i:Ljava/lang/String;

    iget-object v1, p0, Lcom/pipaw/pipawpay/PipawPayActivity;->b:Lcom/pipaw/pipawpay/PipawPayRequest;

    invoke-virtual {v1}, Lcom/pipaw/pipawpay/PipawPayRequest;->getPrice()Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lcom/pipaw/pipawpay/PipawPayActivity;->j:Ljava/lang/String;

    iget-object v1, p0, Lcom/pipaw/pipawpay/PipawPayActivity;->b:Lcom/pipaw/pipawpay/PipawPayRequest;

    invoke-virtual {v1}, Lcom/pipaw/pipawpay/PipawPayRequest;->getMerchantSign()Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lcom/pipaw/pipawpay/PipawPayActivity;->k:Ljava/lang/String;

    iget-object v1, p0, Lcom/pipaw/pipawpay/PipawPayActivity;->c:Ljava/lang/String;

    invoke-static {v1}, Lcom/pipaw/a/j;->a(Ljava/lang/CharSequence;)Z

    move-result v1

    if-nez v1, :cond_0

    iget-object v1, p0, Lcom/pipaw/pipawpay/PipawPayActivity;->d:Ljava/lang/String;

    invoke-static {v1}, Lcom/pipaw/a/j;->a(Ljava/lang/CharSequence;)Z

    move-result v1

    if-nez v1, :cond_0

    iget-object v1, p0, Lcom/pipaw/pipawpay/PipawPayActivity;->e:Ljava/lang/String;

    invoke-static {v1}, Lcom/pipaw/a/j;->a(Ljava/lang/CharSequence;)Z

    move-result v1

    if-nez v1, :cond_0

    iget-object v1, p0, Lcom/pipaw/pipawpay/PipawPayActivity;->f:Ljava/lang/String;

    const/16 v2, 0xf

    invoke-static {v1, v2}, Lcom/pipaw/a/j;->a(Ljava/lang/CharSequence;I)Z

    move-result v1

    if-eqz v1, :cond_0

    iget-object v1, p0, Lcom/pipaw/pipawpay/PipawPayActivity;->h:Ljava/lang/String;

    const/16 v2, 0x32

    invoke-static {v1, v2}, Lcom/pipaw/a/j;->a(Ljava/lang/CharSequence;I)Z

    move-result v1

    if-eqz v1, :cond_0

    iget-object v1, p0, Lcom/pipaw/pipawpay/PipawPayActivity;->i:Ljava/lang/String;

    const/16 v2, 0x1e

    invoke-static {v1, v2}, Lcom/pipaw/a/j;->a(Ljava/lang/CharSequence;I)Z

    move-result v1

    if-eqz v1, :cond_0

    iget-object v1, p0, Lcom/pipaw/pipawpay/PipawPayActivity;->j:Ljava/lang/String;

    invoke-static {v1}, Lcom/pipaw/a/j;->a(Ljava/lang/CharSequence;)Z

    move-result v1

    if-nez v1, :cond_0

    iget-object v1, p0, Lcom/pipaw/pipawpay/PipawPayActivity;->k:Ljava/lang/String;

    invoke-static {v1}, Lcom/pipaw/a/j;->a(Ljava/lang/CharSequence;)Z

    move-result v1

    if-nez v1, :cond_0

    const/4 v0, 0x1

    goto/16 :goto_0
.end method

.method private d()Ljava/lang/String;
    .locals 7

    :try_start_0
    new-instance v2, Ljava/util/HashMap;

    invoke-direct {v2}, Ljava/util/HashMap;-><init>()V

    const-string v0, "merchantId"

    iget-object v1, p0, Lcom/pipaw/pipawpay/PipawPayActivity;->c:Ljava/lang/String;

    invoke-interface {v2, v0, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string v0, "merchantAppId"

    iget-object v1, p0, Lcom/pipaw/pipawpay/PipawPayActivity;->d:Ljava/lang/String;

    invoke-interface {v2, v0, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string v0, "appId"

    iget-object v1, p0, Lcom/pipaw/pipawpay/PipawPayActivity;->e:Ljava/lang/String;

    invoke-interface {v2, v0, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string v0, "payerId"

    iget-object v1, p0, Lcom/pipaw/pipawpay/PipawPayActivity;->f:Ljava/lang/String;

    invoke-interface {v2, v0, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string v0, "isPipawId"

    iget-object v1, p0, Lcom/pipaw/pipawpay/PipawPayActivity;->g:Ljava/lang/String;

    invoke-interface {v2, v0, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string v0, "exOrderNo"

    iget-object v1, p0, Lcom/pipaw/pipawpay/PipawPayActivity;->h:Ljava/lang/String;

    invoke-interface {v2, v0, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string v0, "subject"

    iget-object v1, p0, Lcom/pipaw/pipawpay/PipawPayActivity;->i:Ljava/lang/String;

    invoke-interface {v2, v0, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string v0, "amount"

    iget-object v1, p0, Lcom/pipaw/pipawpay/PipawPayActivity;->j:Ljava/lang/String;

    invoke-interface {v2, v0, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string v0, "extraParam"

    iget-object v1, p0, Lcom/pipaw/pipawpay/PipawPayActivity;->l:Ljava/lang/String;

    invoke-interface {v2, v0, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string v0, "merchantSign"

    iget-object v1, p0, Lcom/pipaw/pipawpay/PipawPayActivity;->k:Ljava/lang/String;

    invoke-interface {v2, v0, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string v0, "channelId"

    iget v1, p0, Lcom/pipaw/pipawpay/PipawPayActivity;->m:I

    invoke-static {v1}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v1

    invoke-interface {v2, v0, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string v0, "pipawUid"

    iget-object v1, p0, Lcom/pipaw/pipawpay/PipawPayActivity;->r:Ljava/lang/String;

    invoke-interface {v2, v0, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string v0, "pipawUsername"

    iget-object v1, p0, Lcom/pipaw/pipawpay/PipawPayActivity;->s:Ljava/lang/String;

    invoke-interface {v2, v0, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string v0, "sid"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v3, p0, Lcom/pipaw/pipawpay/PipawPayActivity;->t:Ljava/lang/String;

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-interface {v2, v0, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string v0, "time"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v3, p0, Lcom/pipaw/pipawpay/PipawPayActivity;->u:Ljava/lang/String;

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-interface {v2, v0, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string v0, "version"

    const-string v1, "2.4"

    invoke-interface {v2, v0, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    new-instance v3, Ljava/lang/StringBuffer;

    invoke-direct {v3}, Ljava/lang/StringBuffer;-><init>()V

    invoke-interface {v2}, Ljava/util/Map;->keySet()Ljava/util/Set;

    move-result-object v1

    const/4 v0, 0x1

    invoke-interface {v1}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v4

    move v1, v0

    :goto_0
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-nez v0, :cond_0

    invoke-virtual {v3}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v0

    :goto_1
    return-object v0

    :cond_0
    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    if-eqz v1, :cond_1

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-static {v0}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v5

    invoke-direct {v1, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v5, "="

    invoke-virtual {v1, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-interface {v2, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v3, v0}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    const/4 v0, 0x0

    move v1, v0

    goto :goto_0

    :cond_1
    new-instance v5, Ljava/lang/StringBuilder;

    const-string v6, "&"

    invoke-direct {v5, v6}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v5, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, "="

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-interface {v2, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    invoke-virtual {v5, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v3, v0}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception v0

    sget-object v1, Lcom/pipaw/pipawpay/PipawPayActivity;->a:Ljava/lang/String;

    invoke-static {v1, v0}, Lcom/pipaw/a/d;->a(Ljava/lang/String;Ljava/lang/Throwable;)I

    const-string v0, ""

    goto :goto_1
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 2

    invoke-virtual {p1}, Landroid/view/View;->getId()I

    move-result v0

    const-string v1, "back_iv"

    invoke-static {p0, v1}, Lcom/pipaw/a/h;->b(Landroid/content/Context;Ljava/lang/String;)I

    move-result v1

    if-ne v0, v1, :cond_0

    invoke-direct {p0}, Lcom/pipaw/pipawpay/PipawPayActivity;->b()V

    :cond_0
    return-void
.end method

.method protected onCreate(Landroid/os/Bundle;)V
    .locals 5

    const/16 v4, 0x3ea

    const/4 v3, 0x0

    invoke-super {p0, p1}, Landroid/app/Activity;->onCreate(Landroid/os/Bundle;)V

    const-string v0, "pipaw_pay"

    invoke-static {p0, v0}, Lcom/pipaw/a/h;->c(Landroid/content/Context;Ljava/lang/String;)I

    move-result v0

    invoke-virtual {p0, v0}, Lcom/pipaw/pipawpay/PipawPayActivity;->setContentView(I)V

    invoke-virtual {p0}, Lcom/pipaw/pipawpay/PipawPayActivity;->getIntent()Landroid/content/Intent;

    move-result-object v0

    const-string v1, "pay_request"

    invoke-virtual {v0, v1}, Landroid/content/Intent;->getParcelableExtra(Ljava/lang/String;)Landroid/os/Parcelable;

    move-result-object v0

    check-cast v0, Lcom/pipaw/pipawpay/PipawPayRequest;

    iput-object v0, p0, Lcom/pipaw/pipawpay/PipawPayActivity;->b:Lcom/pipaw/pipawpay/PipawPayRequest;

    const-string v0, "PIPAW_ID"

    invoke-static {p0, v0}, Lcom/pipaw/a/g;->a(Landroid/content/Context;Ljava/lang/String;)I

    move-result v0

    iput v0, p0, Lcom/pipaw/pipawpay/PipawPayActivity;->m:I

    iget v0, p0, Lcom/pipaw/pipawpay/PipawPayActivity;->m:I

    if-nez v0, :cond_0

    const/4 v0, -0x1

    iput v0, p0, Lcom/pipaw/pipawpay/PipawPayActivity;->m:I

    :cond_0
    const-string v0, "pipaw"

    const-string v1, "uid"

    const-string v2, ""

    invoke-static {p0, v0, v1, v2}, Lcom/pipaw/a/i;->a(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/pipaw/pipawpay/PipawPayActivity;->r:Ljava/lang/String;

    const-string v0, "pipaw"

    const-string v1, "pipawun"

    const-string v2, ""

    invoke-static {p0, v0, v1, v2}, Lcom/pipaw/a/i;->a(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/pipaw/pipawpay/PipawPayActivity;->s:Ljava/lang/String;

    invoke-static {}, Lcom/pipaw/pipawpay/a;->a()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/pipaw/pipawpay/PipawPayActivity;->t:Ljava/lang/String;

    invoke-static {}, Lcom/pipaw/pipawpay/a;->b()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/pipaw/pipawpay/PipawPayActivity;->u:Ljava/lang/String;

    iget-object v0, p0, Lcom/pipaw/pipawpay/PipawPayActivity;->r:Ljava/lang/String;

    invoke-static {v0}, Lcom/pipaw/a/j;->a(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_1

    iget-object v0, p0, Lcom/pipaw/pipawpay/PipawPayActivity;->s:Ljava/lang/String;

    invoke-static {v0}, Lcom/pipaw/a/j;->a(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_3

    :cond_1
    const-string v0, "\u7528\u6237\u672a\u767b\u5f55"

    invoke-direct {p0, v4, v0}, Lcom/pipaw/pipawpay/PipawPayActivity;->a(ILjava/lang/String;)V

    :cond_2
    :goto_0
    return-void

    :cond_3
    invoke-direct {p0}, Lcom/pipaw/pipawpay/PipawPayActivity;->c()Z

    move-result v0

    if-nez v0, :cond_4

    const-string v0, "\u6570\u636e\u683c\u5f0f\u4e0d\u6b63\u786e"

    invoke-direct {p0, v4, v0}, Lcom/pipaw/pipawpay/PipawPayActivity;->a(ILjava/lang/String;)V

    goto :goto_0

    :cond_4
    const-string v0, "back_iv"

    invoke-static {p0, v0}, Lcom/pipaw/a/h;->b(Landroid/content/Context;Ljava/lang/String;)I

    move-result v0

    invoke-virtual {p0, v0}, Lcom/pipaw/pipawpay/PipawPayActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/ImageView;

    iput-object v0, p0, Lcom/pipaw/pipawpay/PipawPayActivity;->n:Landroid/widget/ImageView;

    iget-object v0, p0, Lcom/pipaw/pipawpay/PipawPayActivity;->n:Landroid/widget/ImageView;

    invoke-virtual {v0, p0}, Landroid/widget/ImageView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    const-string v0, "title_tv"

    invoke-static {p0, v0}, Lcom/pipaw/a/h;->b(Landroid/content/Context;Ljava/lang/String;)I

    move-result v0

    invoke-virtual {p0, v0}, Lcom/pipaw/pipawpay/PipawPayActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/pipaw/pipawpay/PipawPayActivity;->o:Landroid/widget/TextView;

    iget-object v0, p0, Lcom/pipaw/pipawpay/PipawPayActivity;->o:Landroid/widget/TextView;

    const-string v1, "\u7435\u7436\u7f51\u652f\u4ed8\u4e2d\u5fc3"

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    sget v0, Lcom/pipaw/pipawpay/R$id;->progressBar:I

    invoke-virtual {p0, v0}, Lcom/pipaw/pipawpay/PipawPayActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/ProgressBar;

    iput-object v0, p0, Lcom/pipaw/pipawpay/PipawPayActivity;->p:Landroid/widget/ProgressBar;

    const-string v0, "webView"

    invoke-static {p0, v0}, Lcom/pipaw/a/h;->b(Landroid/content/Context;Ljava/lang/String;)I

    move-result v0

    invoke-virtual {p0, v0}, Lcom/pipaw/pipawpay/PipawPayActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/webkit/WebView;

    iput-object v0, p0, Lcom/pipaw/pipawpay/PipawPayActivity;->q:Landroid/webkit/WebView;

    iget-object v0, p0, Lcom/pipaw/pipawpay/PipawPayActivity;->q:Landroid/webkit/WebView;

    invoke-virtual {v0, v3}, Landroid/webkit/WebView;->setVerticalScrollBarEnabled(Z)V

    iget-object v0, p0, Lcom/pipaw/pipawpay/PipawPayActivity;->q:Landroid/webkit/WebView;

    invoke-virtual {v0}, Landroid/webkit/WebView;->getSettings()Landroid/webkit/WebSettings;

    move-result-object v0

    invoke-virtual {v0, v3}, Landroid/webkit/WebSettings;->setSupportZoom(Z)V

    iget-object v0, p0, Lcom/pipaw/pipawpay/PipawPayActivity;->q:Landroid/webkit/WebView;

    invoke-virtual {v0}, Landroid/webkit/WebView;->getSettings()Landroid/webkit/WebSettings;

    move-result-object v0

    invoke-virtual {v0, v3}, Landroid/webkit/WebSettings;->setSaveFormData(Z)V

    iget-object v0, p0, Lcom/pipaw/pipawpay/PipawPayActivity;->q:Landroid/webkit/WebView;

    invoke-virtual {v0}, Landroid/webkit/WebView;->getSettings()Landroid/webkit/WebSettings;

    move-result-object v0

    invoke-virtual {v0, v3}, Landroid/webkit/WebSettings;->setSavePassword(Z)V

    iget-object v0, p0, Lcom/pipaw/pipawpay/PipawPayActivity;->q:Landroid/webkit/WebView;

    invoke-virtual {v0}, Landroid/webkit/WebView;->getSettings()Landroid/webkit/WebSettings;

    move-result-object v0

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Landroid/webkit/WebSettings;->setJavaScriptEnabled(Z)V

    iget-object v0, p0, Lcom/pipaw/pipawpay/PipawPayActivity;->q:Landroid/webkit/WebView;

    invoke-virtual {v0}, Landroid/webkit/WebView;->getSettings()Landroid/webkit/WebSettings;

    move-result-object v0

    const-string v1, "UTF-8"

    invoke-virtual {v0, v1}, Landroid/webkit/WebSettings;->setDefaultTextEncodingName(Ljava/lang/String;)V

    new-instance v0, Lcom/pipaw/pipawpay/PipawPayActivity$PayJs;

    invoke-direct {v0, p0, p0}, Lcom/pipaw/pipawpay/PipawPayActivity$PayJs;-><init>(Lcom/pipaw/pipawpay/PipawPayActivity;Lcom/pipaw/pipawpay/PipawPayActivity;)V

    iget-object v1, p0, Lcom/pipaw/pipawpay/PipawPayActivity;->q:Landroid/webkit/WebView;

    const-string v2, "pay"

    invoke-virtual {v1, v0, v2}, Landroid/webkit/WebView;->addJavascriptInterface(Ljava/lang/Object;Ljava/lang/String;)V

    iget-object v0, p0, Lcom/pipaw/pipawpay/PipawPayActivity;->q:Landroid/webkit/WebView;

    iget-object v1, p0, Lcom/pipaw/pipawpay/PipawPayActivity;->v:Landroid/webkit/WebViewClient;

    invoke-virtual {v0, v1}, Landroid/webkit/WebView;->setWebViewClient(Landroid/webkit/WebViewClient;)V

    iget-object v0, p0, Lcom/pipaw/pipawpay/PipawPayActivity;->q:Landroid/webkit/WebView;

    iget-object v1, p0, Lcom/pipaw/pipawpay/PipawPayActivity;->w:Landroid/webkit/WebChromeClient;

    invoke-virtual {v0, v1}, Landroid/webkit/WebView;->setWebChromeClient(Landroid/webkit/WebChromeClient;)V

    iget-object v0, p0, Lcom/pipaw/pipawpay/PipawPayActivity;->q:Landroid/webkit/WebView;

    invoke-virtual {v0}, Landroid/webkit/WebView;->requestFocus()Z

    invoke-direct {p0}, Lcom/pipaw/pipawpay/PipawPayActivity;->d()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/pipaw/a/j;->a(Ljava/lang/CharSequence;)Z

    move-result v1

    if-nez v1, :cond_2

    iget-object v1, p0, Lcom/pipaw/pipawpay/PipawPayActivity;->q:Landroid/webkit/WebView;

    const-string v2, "http://sdk.pipaw.com/wap/order"

    const-string v3, "UTF-8"

    invoke-static {v0, v3}, Lorg/apache/http/util/EncodingUtils;->getBytes(Ljava/lang/String;Ljava/lang/String;)[B

    move-result-object v0

    invoke-virtual {v1, v2, v0}, Landroid/webkit/WebView;->postUrl(Ljava/lang/String;[B)V

    goto/16 :goto_0
.end method

.method public onKeyDown(ILandroid/view/KeyEvent;)Z
    .locals 1

    const/4 v0, 0x4

    if-ne p1, v0, :cond_0

    invoke-direct {p0}, Lcom/pipaw/pipawpay/PipawPayActivity;->b()V

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    invoke-super {p0, p1, p2}, Landroid/app/Activity;->onKeyDown(ILandroid/view/KeyEvent;)Z

    move-result v0

    goto :goto_0
.end method
