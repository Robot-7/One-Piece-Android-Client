.class public Lcom/youai/dreamonepiece/FeedBackDialog;
.super Landroid/app/Dialog;
.source "FeedBackDialog.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/youai/dreamonepiece/FeedBackDialog$WeiboWebViewClient;,
        Lcom/youai/dreamonepiece/FeedBackDialog$InJavaScriptLocalObj;
    }
.end annotation


# static fields
.field private static AInstance:Lcom/youai/dreamonepiece/FeedBackDialog; = null

.field private static final BACKMAIN:I = 0x1

.field private static final TAG:Ljava/lang/String;

.field private static mRequestUrl:Ljava/lang/String;

.field private static mRes:Landroid/content/res/Resources;

.field private static theme:I


# instance fields
.field private boxRl:Landroid/widget/RelativeLayout;

.field lp:Landroid/widget/RelativeLayout$LayoutParams;

.field private mBtnOk:Landroid/widget/Button;

.field private mContext:Landroid/content/Context;

.field private mMainHandler:Landroid/os/Handler;

.field private mSpinner:Landroid/app/ProgressDialog;

.field private mWebView:Landroid/webkit/WebView;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 35
    const-class v0, Lcom/youai/dreamonepiece/FeedBackDialog;

    invoke-virtual {v0}, Ljava/lang/Class;->toString()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/youai/dreamonepiece/FeedBackDialog;->TAG:Ljava/lang/String;

    .line 37
    const v0, 0x1030010

    sput v0, Lcom/youai/dreamonepiece/FeedBackDialog;->theme:I

    .line 69
    const/4 v0, 0x0

    sput-object v0, Lcom/youai/dreamonepiece/FeedBackDialog;->AInstance:Lcom/youai/dreamonepiece/FeedBackDialog;

    return-void
.end method

.method private constructor <init>(Landroid/app/Activity;)V
    .locals 2
    .param p1, "context"    # Landroid/app/Activity;

    .prologue
    const/4 v1, -0x1

    .line 88
    sget v0, Lcom/youai/dreamonepiece/FeedBackDialog;->theme:I

    invoke-direct {p0, p1, v0}, Landroid/app/Dialog;-><init>(Landroid/content/Context;I)V

    .line 42
    new-instance v0, Landroid/widget/RelativeLayout$LayoutParams;

    invoke-direct {v0, v1, v1}, Landroid/widget/RelativeLayout$LayoutParams;-><init>(II)V

    iput-object v0, p0, Lcom/youai/dreamonepiece/FeedBackDialog;->lp:Landroid/widget/RelativeLayout$LayoutParams;

    .line 47
    new-instance v0, Lcom/youai/dreamonepiece/FeedBackDialog$1;

    invoke-direct {v0, p0}, Lcom/youai/dreamonepiece/FeedBackDialog$1;-><init>(Lcom/youai/dreamonepiece/FeedBackDialog;)V

    iput-object v0, p0, Lcom/youai/dreamonepiece/FeedBackDialog;->mMainHandler:Landroid/os/Handler;

    .line 89
    return-void
.end method

.method private constructor <init>(Landroid/app/Activity;Ljava/lang/String;)V
    .locals 2
    .param p1, "context"    # Landroid/app/Activity;
    .param p2, "url"    # Ljava/lang/String;

    .prologue
    const/4 v1, -0x1

    .line 61
    sget v0, Lcom/youai/dreamonepiece/FeedBackDialog;->theme:I

    invoke-direct {p0, p1, v0}, Landroid/app/Dialog;-><init>(Landroid/content/Context;I)V

    .line 42
    new-instance v0, Landroid/widget/RelativeLayout$LayoutParams;

    invoke-direct {v0, v1, v1}, Landroid/widget/RelativeLayout$LayoutParams;-><init>(II)V

    iput-object v0, p0, Lcom/youai/dreamonepiece/FeedBackDialog;->lp:Landroid/widget/RelativeLayout$LayoutParams;

    .line 47
    new-instance v0, Lcom/youai/dreamonepiece/FeedBackDialog$1;

    invoke-direct {v0, p0}, Lcom/youai/dreamonepiece/FeedBackDialog$1;-><init>(Lcom/youai/dreamonepiece/FeedBackDialog;)V

    iput-object v0, p0, Lcom/youai/dreamonepiece/FeedBackDialog;->mMainHandler:Landroid/os/Handler;

    .line 62
    invoke-virtual {p1}, Landroid/app/Activity;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    sput-object v0, Lcom/youai/dreamonepiece/FeedBackDialog;->mRes:Landroid/content/res/Resources;

    .line 63
    iput-object p1, p0, Lcom/youai/dreamonepiece/FeedBackDialog;->mContext:Landroid/content/Context;

    .line 64
    const-string v0, ""

    invoke-virtual {p2, v0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_0

    if-eqz p2, :cond_0

    .line 65
    sput-object p2, Lcom/youai/dreamonepiece/FeedBackDialog;->mRequestUrl:Ljava/lang/String;

    .line 67
    :cond_0
    return-void
.end method

.method static synthetic access$000()Ljava/lang/String;
    .locals 1

    .prologue
    .line 30
    sget-object v0, Lcom/youai/dreamonepiece/FeedBackDialog;->TAG:Ljava/lang/String;

    return-object v0
.end method

.method static synthetic access$100(Lcom/youai/dreamonepiece/FeedBackDialog;)Landroid/app/ProgressDialog;
    .locals 1
    .param p0, "x0"    # Lcom/youai/dreamonepiece/FeedBackDialog;

    .prologue
    .line 30
    iget-object v0, p0, Lcom/youai/dreamonepiece/FeedBackDialog;->mSpinner:Landroid/app/ProgressDialog;

    return-object v0
.end method

.method static synthetic access$200(Lcom/youai/dreamonepiece/FeedBackDialog;)Landroid/webkit/WebView;
    .locals 1
    .param p0, "x0"    # Lcom/youai/dreamonepiece/FeedBackDialog;

    .prologue
    .line 30
    iget-object v0, p0, Lcom/youai/dreamonepiece/FeedBackDialog;->mWebView:Landroid/webkit/WebView;

    return-object v0
.end method

.method static synthetic access$400(Lcom/youai/dreamonepiece/FeedBackDialog;)Landroid/os/Handler;
    .locals 1
    .param p0, "x0"    # Lcom/youai/dreamonepiece/FeedBackDialog;

    .prologue
    .line 30
    iget-object v0, p0, Lcom/youai/dreamonepiece/FeedBackDialog;->mMainHandler:Landroid/os/Handler;

    return-object v0
.end method

.method static synthetic access$500(Lcom/youai/dreamonepiece/FeedBackDialog;)Landroid/widget/RelativeLayout;
    .locals 1
    .param p0, "x0"    # Lcom/youai/dreamonepiece/FeedBackDialog;

    .prologue
    .line 30
    iget-object v0, p0, Lcom/youai/dreamonepiece/FeedBackDialog;->boxRl:Landroid/widget/RelativeLayout;

    return-object v0
.end method

.method public static getInstance(Landroid/app/Activity;Ljava/lang/String;)Lcom/youai/dreamonepiece/FeedBackDialog;
    .locals 2
    .param p0, "pContext"    # Landroid/app/Activity;
    .param p1, "url"    # Ljava/lang/String;

    .prologue
    const/4 v0, 0x0

    .line 72
    if-nez p0, :cond_0

    .line 84
    :goto_0
    return-object v0

    .line 74
    :cond_0
    invoke-virtual {p0}, Landroid/app/Activity;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    sput-object v1, Lcom/youai/dreamonepiece/FeedBackDialog;->mRes:Landroid/content/res/Resources;

    .line 75
    sget-object v1, Lcom/youai/dreamonepiece/FeedBackDialog;->AInstance:Lcom/youai/dreamonepiece/FeedBackDialog;

    if-nez v1, :cond_1

    sget-object v1, Lcom/youai/dreamonepiece/FeedBackDialog;->mRequestUrl:Ljava/lang/String;

    if-eq v1, p1, :cond_1

    const-string v1, ""

    invoke-virtual {p1, v1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :cond_1

    if-eqz p1, :cond_1

    .line 77
    new-instance v0, Lcom/youai/dreamonepiece/FeedBackDialog;

    invoke-direct {v0, p0, p1}, Lcom/youai/dreamonepiece/FeedBackDialog;-><init>(Landroid/app/Activity;Ljava/lang/String;)V

    sput-object v0, Lcom/youai/dreamonepiece/FeedBackDialog;->AInstance:Lcom/youai/dreamonepiece/FeedBackDialog;

    .line 84
    :goto_1
    sget-object v0, Lcom/youai/dreamonepiece/FeedBackDialog;->AInstance:Lcom/youai/dreamonepiece/FeedBackDialog;

    goto :goto_0

    .line 79
    :cond_1
    sput-object p1, Lcom/youai/dreamonepiece/FeedBackDialog;->mRequestUrl:Ljava/lang/String;

    .line 80
    sput-object v0, Lcom/youai/dreamonepiece/FeedBackDialog;->AInstance:Lcom/youai/dreamonepiece/FeedBackDialog;

    .line 81
    new-instance v0, Lcom/youai/dreamonepiece/FeedBackDialog;

    invoke-direct {v0, p0, p1}, Lcom/youai/dreamonepiece/FeedBackDialog;-><init>(Landroid/app/Activity;Ljava/lang/String;)V

    sput-object v0, Lcom/youai/dreamonepiece/FeedBackDialog;->AInstance:Lcom/youai/dreamonepiece/FeedBackDialog;

    goto :goto_1
.end method

.method private setUpWebView()V
    .locals 8
    .annotation build Landroid/annotation/SuppressLint;
        value = {
            "SetJavaScriptEnabled",
            "SdCardPath"
        }
    .end annotation

    .prologue
    const/4 v7, 0x1

    .line 174
    const v4, 0x7f09001b

    invoke-virtual {p0, v4}, Lcom/youai/dreamonepiece/FeedBackDialog;->findViewById(I)Landroid/view/View;

    move-result-object v4

    check-cast v4, Landroid/widget/RelativeLayout;

    iput-object v4, p0, Lcom/youai/dreamonepiece/FeedBackDialog;->boxRl:Landroid/widget/RelativeLayout;

    .line 175
    const v4, 0x7f09001c

    invoke-virtual {p0, v4}, Lcom/youai/dreamonepiece/FeedBackDialog;->findViewById(I)Landroid/view/View;

    move-result-object v4

    check-cast v4, Landroid/webkit/WebView;

    iput-object v4, p0, Lcom/youai/dreamonepiece/FeedBackDialog;->mWebView:Landroid/webkit/WebView;

    .line 177
    iget-object v4, p0, Lcom/youai/dreamonepiece/FeedBackDialog;->mWebView:Landroid/webkit/WebView;

    new-instance v5, Lcom/youai/dreamonepiece/FeedBackDialog$WeiboWebViewClient;

    const/4 v6, 0x0

    invoke-direct {v5, p0, v6}, Lcom/youai/dreamonepiece/FeedBackDialog$WeiboWebViewClient;-><init>(Lcom/youai/dreamonepiece/FeedBackDialog;Lcom/youai/dreamonepiece/FeedBackDialog$1;)V

    invoke-virtual {v4, v5}, Landroid/webkit/WebView;->setWebViewClient(Landroid/webkit/WebViewClient;)V

    .line 178
    iget-object v4, p0, Lcom/youai/dreamonepiece/FeedBackDialog;->mWebView:Landroid/webkit/WebView;

    invoke-virtual {v4}, Landroid/webkit/WebView;->getSettings()Landroid/webkit/WebSettings;

    move-result-object v3

    .line 179
    .local v3, "webSettings":Landroid/webkit/WebSettings;
    invoke-virtual {v3, v7}, Landroid/webkit/WebSettings;->setDomStorageEnabled(Z)V

    .line 180
    invoke-virtual {v3, v7}, Landroid/webkit/WebSettings;->setJavaScriptEnabled(Z)V

    .line 181
    invoke-virtual {v3, v7}, Landroid/webkit/WebSettings;->setSupportMultipleWindows(Z)V

    .line 182
    invoke-virtual {v3, v7}, Landroid/webkit/WebSettings;->setJavaScriptCanOpenWindowsAutomatically(Z)V

    .line 183
    const-wide/32 v4, 0x1000000

    invoke-virtual {v3, v4, v5}, Landroid/webkit/WebSettings;->setAppCacheMaxSize(J)V

    .line 184
    invoke-virtual {v3, v7}, Landroid/webkit/WebSettings;->setAppCacheEnabled(Z)V

    .line 185
    iget-object v4, p0, Lcom/youai/dreamonepiece/FeedBackDialog;->mContext:Landroid/content/Context;

    invoke-virtual {v4}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v4

    invoke-virtual {v4}, Landroid/content/Context;->getCacheDir()Ljava/io/File;

    move-result-object v4

    invoke-virtual {v4}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v0

    .line 187
    .local v0, "appCachePath":Ljava/lang/String;
    invoke-virtual {v3, v0}, Landroid/webkit/WebSettings;->setAppCachePath(Ljava/lang/String;)V

    .line 188
    invoke-virtual {v3, v7}, Landroid/webkit/WebSettings;->setAllowFileAccess(Z)V

    .line 189
    const/4 v4, -0x1

    invoke-virtual {v3, v4}, Landroid/webkit/WebSettings;->setCacheMode(I)V

    .line 190
    const/4 v4, 0x0

    invoke-virtual {v3, v4}, Landroid/webkit/WebSettings;->setDatabaseEnabled(Z)V

    .line 191
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "/data/data/"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    iget-object v5, p0, Lcom/youai/dreamonepiece/FeedBackDialog;->mContext:Landroid/content/Context;

    invoke-virtual {v5}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, "/databases/"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    .line 193
    .local v2, "databasePath":Ljava/lang/String;
    invoke-virtual {v3, v2}, Landroid/webkit/WebSettings;->setDatabasePath(Ljava/lang/String;)V

    .line 194
    invoke-virtual {v3, v7}, Landroid/webkit/WebSettings;->setGeolocationEnabled(Z)V

    .line 195
    invoke-virtual {v3, v7}, Landroid/webkit/WebSettings;->setSaveFormData(Z)V

    .line 196
    new-instance v1, Lcom/youai/dreamonepiece/FeedBackDialog$InJavaScriptLocalObj;

    invoke-direct {v1, p0}, Lcom/youai/dreamonepiece/FeedBackDialog$InJavaScriptLocalObj;-><init>(Lcom/youai/dreamonepiece/FeedBackDialog;)V

    .line 197
    .local v1, "backGameJs":Lcom/youai/dreamonepiece/FeedBackDialog$InJavaScriptLocalObj;
    iget-object v4, p0, Lcom/youai/dreamonepiece/FeedBackDialog;->mWebView:Landroid/webkit/WebView;

    const-string v5, "localjs"

    invoke-virtual {v4, v1, v5}, Landroid/webkit/WebView;->addJavascriptInterface(Ljava/lang/Object;Ljava/lang/String;)V

    .line 199
    iget-object v4, p0, Lcom/youai/dreamonepiece/FeedBackDialog;->mWebView:Landroid/webkit/WebView;

    sget-object v5, Lcom/youai/dreamonepiece/FeedBackDialog;->mRequestUrl:Ljava/lang/String;

    invoke-virtual {v4, v5}, Landroid/webkit/WebView;->loadUrl(Ljava/lang/String;)V

    .line 202
    return-void
.end method


# virtual methods
.method public dismiss()V
    .locals 0

    .prologue
    .line 99
    invoke-super {p0}, Landroid/app/Dialog;->dismiss()V

    .line 101
    return-void
.end method

.method protected onBack()V
    .locals 1

    .prologue
    .line 162
    :try_start_0
    iget-object v0, p0, Lcom/youai/dreamonepiece/FeedBackDialog;->mSpinner:Landroid/app/ProgressDialog;

    invoke-virtual {v0}, Landroid/app/ProgressDialog;->dismiss()V

    .line 163
    iget-object v0, p0, Lcom/youai/dreamonepiece/FeedBackDialog;->mWebView:Landroid/webkit/WebView;

    if-eqz v0, :cond_0

    .line 164
    iget-object v0, p0, Lcom/youai/dreamonepiece/FeedBackDialog;->mWebView:Landroid/webkit/WebView;

    invoke-virtual {v0}, Landroid/webkit/WebView;->stopLoading()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 169
    :cond_0
    :goto_0
    invoke-virtual {p0}, Lcom/youai/dreamonepiece/FeedBackDialog;->cancel()V

    .line 170
    return-void

    .line 167
    :catch_0
    move-exception v0

    goto :goto_0
.end method

.method public onBackPressed()V
    .locals 0

    .prologue
    .line 94
    invoke-virtual {p0}, Lcom/youai/dreamonepiece/FeedBackDialog;->onBack()V

    .line 95
    return-void
.end method

.method protected onCreate(Landroid/os/Bundle;)V
    .locals 2
    .param p1, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    const/4 v1, 0x0

    .line 135
    invoke-super {p0, p1}, Landroid/app/Dialog;->onCreate(Landroid/os/Bundle;)V

    .line 136
    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Lcom/youai/dreamonepiece/FeedBackDialog;->requestWindowFeature(I)Z

    .line 137
    invoke-virtual {p0}, Lcom/youai/dreamonepiece/FeedBackDialog;->getWindow()Landroid/view/Window;

    move-result-object v0

    invoke-virtual {v0, v1, v1}, Landroid/view/Window;->setFeatureDrawableAlpha(II)V

    .line 139
    const v0, 0x7f030003

    invoke-virtual {p0, v0}, Lcom/youai/dreamonepiece/FeedBackDialog;->setContentView(I)V

    .line 141
    const v0, 0x7f090019

    invoke-virtual {p0, v0}, Lcom/youai/dreamonepiece/FeedBackDialog;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/Button;

    iput-object v0, p0, Lcom/youai/dreamonepiece/FeedBackDialog;->mBtnOk:Landroid/widget/Button;

    .line 143
    iget-object v0, p0, Lcom/youai/dreamonepiece/FeedBackDialog;->mBtnOk:Landroid/widget/Button;

    new-instance v1, Lcom/youai/dreamonepiece/FeedBackDialog$3;

    invoke-direct {v1, p0}, Lcom/youai/dreamonepiece/FeedBackDialog$3;-><init>(Lcom/youai/dreamonepiece/FeedBackDialog;)V

    invoke-virtual {v0, v1}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 158
    return-void
.end method

.method public show()V
    .locals 2

    .prologue
    .line 105
    invoke-super {p0}, Landroid/app/Dialog;->show()V

    .line 106
    iget-object v0, p0, Lcom/youai/dreamonepiece/FeedBackDialog;->mContext:Landroid/content/Context;

    invoke-static {v0}, Lcom/youai/NetworkUtil;->detect(Landroid/content/Context;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 107
    invoke-virtual {p0}, Lcom/youai/dreamonepiece/FeedBackDialog;->dismiss()V

    .line 131
    :goto_0
    return-void

    .line 110
    :cond_0
    new-instance v0, Landroid/app/ProgressDialog;

    invoke-virtual {p0}, Lcom/youai/dreamonepiece/FeedBackDialog;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/app/ProgressDialog;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Lcom/youai/dreamonepiece/FeedBackDialog;->mSpinner:Landroid/app/ProgressDialog;

    .line 111
    iget-object v0, p0, Lcom/youai/dreamonepiece/FeedBackDialog;->mSpinner:Landroid/app/ProgressDialog;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Landroid/app/ProgressDialog;->requestWindowFeature(I)Z

    .line 112
    iget-object v0, p0, Lcom/youai/dreamonepiece/FeedBackDialog;->mSpinner:Landroid/app/ProgressDialog;

    const-string v1, "\u52a0\u8f7d\u4e2d..."

    invoke-virtual {v0, v1}, Landroid/app/ProgressDialog;->setMessage(Ljava/lang/CharSequence;)V

    .line 114
    iget-object v0, p0, Lcom/youai/dreamonepiece/FeedBackDialog;->mSpinner:Landroid/app/ProgressDialog;

    new-instance v1, Lcom/youai/dreamonepiece/FeedBackDialog$2;

    invoke-direct {v1, p0}, Lcom/youai/dreamonepiece/FeedBackDialog$2;-><init>(Lcom/youai/dreamonepiece/FeedBackDialog;)V

    invoke-virtual {v0, v1}, Landroid/app/ProgressDialog;->setOnKeyListener(Landroid/content/DialogInterface$OnKeyListener;)V

    .line 129
    invoke-direct {p0}, Lcom/youai/dreamonepiece/FeedBackDialog;->setUpWebView()V

    goto :goto_0
.end method
