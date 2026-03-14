.class public Lcom/youai/dreamonepiece/GameAnnounceDialog;
.super Landroid/app/Dialog;
.source "GameAnnounceDialog.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/youai/dreamonepiece/GameAnnounceDialog$WeiboWebViewClient;
    }
.end annotation


# static fields
.field private static final TAG:Ljava/lang/String;

.field private static final mDefaultUrl:Ljava/lang/String; = "http://156.239.41.7:81/notice_android.php"

.field private static mRequestUrl:Ljava/lang/String;

.field private static mRes:Landroid/content/res/Resources;

.field private static theme:I


# instance fields
.field private boxRl:Landroid/widget/RelativeLayout;

.field lp:Landroid/widget/RelativeLayout$LayoutParams;

.field private mBtnOk:Landroid/widget/ImageButton;

.field private mContext:Landroid/content/Context;

.field private mSpinner:Landroid/app/ProgressDialog;

.field private mWebRl:Landroid/widget/RelativeLayout;

.field private mWebView:Landroid/webkit/WebView;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 36
    const-class v0, Lcom/youai/dreamonepiece/GameAnnounceDialog;

    invoke-virtual {v0}, Ljava/lang/Class;->toString()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/youai/dreamonepiece/GameAnnounceDialog;->TAG:Ljava/lang/String;

    .line 38
    const v0, 0x1030010

    sput v0, Lcom/youai/dreamonepiece/GameAnnounceDialog;->theme:I

    return-void
.end method

.method private constructor <init>(Landroid/app/Activity;)V
    .locals 2
    .param p1, "context"    # Landroid/app/Activity;

    .prologue
    const/4 v1, -0x1

    .line 72
    sget v0, Lcom/youai/dreamonepiece/GameAnnounceDialog;->theme:I

    invoke-direct {p0, p1, v0}, Landroid/app/Dialog;-><init>(Landroid/content/Context;I)V

    .line 41
    new-instance v0, Landroid/widget/RelativeLayout$LayoutParams;

    invoke-direct {v0, v1, v1}, Landroid/widget/RelativeLayout$LayoutParams;-><init>(II)V

    iput-object v0, p0, Lcom/youai/dreamonepiece/GameAnnounceDialog;->lp:Landroid/widget/RelativeLayout$LayoutParams;

    .line 73
    return-void
.end method

.method public constructor <init>(Landroid/app/Activity;Ljava/lang/String;)V
    .locals 2
    .param p1, "context"    # Landroid/app/Activity;
    .param p2, "url"    # Ljava/lang/String;

    .prologue
    const/4 v1, -0x1

    .line 47
    sget v0, Lcom/youai/dreamonepiece/GameAnnounceDialog;->theme:I

    invoke-direct {p0, p1, v0}, Landroid/app/Dialog;-><init>(Landroid/content/Context;I)V

    .line 41
    new-instance v0, Landroid/widget/RelativeLayout$LayoutParams;

    invoke-direct {v0, v1, v1}, Landroid/widget/RelativeLayout$LayoutParams;-><init>(II)V

    iput-object v0, p0, Lcom/youai/dreamonepiece/GameAnnounceDialog;->lp:Landroid/widget/RelativeLayout$LayoutParams;

    .line 48
    invoke-virtual {p1}, Landroid/app/Activity;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    sput-object v0, Lcom/youai/dreamonepiece/GameAnnounceDialog;->mRes:Landroid/content/res/Resources;

    .line 49
    iput-object p1, p0, Lcom/youai/dreamonepiece/GameAnnounceDialog;->mContext:Landroid/content/Context;

    .line 50
    const-string v0, ""

    invoke-virtual {p2, v0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_0

    if-eqz p2, :cond_0

    .line 51
    sput-object p2, Lcom/youai/dreamonepiece/GameAnnounceDialog;->mRequestUrl:Ljava/lang/String;

    .line 52
    invoke-virtual {p0}, Lcom/youai/dreamonepiece/GameAnnounceDialog;->show()V

    .line 58
    :goto_0
    return-void

    .line 54
    :cond_0
    invoke-virtual {p0}, Lcom/youai/dreamonepiece/GameAnnounceDialog;->cancel()V

    .line 55
    const-string v0, "http://156.239.41.7:81/notice_android.php"

    sput-object v0, Lcom/youai/dreamonepiece/GameAnnounceDialog;->mRequestUrl:Ljava/lang/String;

    goto :goto_0
.end method

.method static synthetic access$000(Lcom/youai/dreamonepiece/GameAnnounceDialog;)Landroid/app/ProgressDialog;
    .locals 1
    .param p0, "x0"    # Lcom/youai/dreamonepiece/GameAnnounceDialog;

    .prologue
    .line 29
    iget-object v0, p0, Lcom/youai/dreamonepiece/GameAnnounceDialog;->mSpinner:Landroid/app/ProgressDialog;

    return-object v0
.end method

.method static synthetic access$100(Lcom/youai/dreamonepiece/GameAnnounceDialog;)Landroid/webkit/WebView;
    .locals 1
    .param p0, "x0"    # Lcom/youai/dreamonepiece/GameAnnounceDialog;

    .prologue
    .line 29
    iget-object v0, p0, Lcom/youai/dreamonepiece/GameAnnounceDialog;->mWebView:Landroid/webkit/WebView;

    return-object v0
.end method

.method static synthetic access$200(Lcom/youai/dreamonepiece/GameAnnounceDialog;)Landroid/widget/RelativeLayout;
    .locals 1
    .param p0, "x0"    # Lcom/youai/dreamonepiece/GameAnnounceDialog;

    .prologue
    .line 29
    iget-object v0, p0, Lcom/youai/dreamonepiece/GameAnnounceDialog;->mWebRl:Landroid/widget/RelativeLayout;

    return-object v0
.end method

.method static synthetic access$400()Ljava/lang/String;
    .locals 1

    .prologue
    .line 29
    sget-object v0, Lcom/youai/dreamonepiece/GameAnnounceDialog;->TAG:Ljava/lang/String;

    return-object v0
.end method

.method static synthetic access$500(Lcom/youai/dreamonepiece/GameAnnounceDialog;)Landroid/widget/RelativeLayout;
    .locals 1
    .param p0, "x0"    # Lcom/youai/dreamonepiece/GameAnnounceDialog;

    .prologue
    .line 29
    iget-object v0, p0, Lcom/youai/dreamonepiece/GameAnnounceDialog;->boxRl:Landroid/widget/RelativeLayout;

    return-object v0
.end method

.method static synthetic access$600(Lcom/youai/dreamonepiece/GameAnnounceDialog;)Landroid/widget/ImageButton;
    .locals 1
    .param p0, "x0"    # Lcom/youai/dreamonepiece/GameAnnounceDialog;

    .prologue
    .line 29
    iget-object v0, p0, Lcom/youai/dreamonepiece/GameAnnounceDialog;->mBtnOk:Landroid/widget/ImageButton;

    return-object v0
.end method

.method private setUpWebView()V
    .locals 9
    .annotation build Landroid/annotation/SuppressLint;
        value = {
            "SetJavaScriptEnabled",
            "SdCardPath"
        }
    .end annotation

    .prologue
    const/4 v8, 0x0

    const/16 v7, 0x2d

    const/4 v6, 0x1

    .line 157
    const v4, 0x7f090010

    invoke-virtual {p0, v4}, Lcom/youai/dreamonepiece/GameAnnounceDialog;->findViewById(I)Landroid/view/View;

    move-result-object v4

    check-cast v4, Landroid/widget/RelativeLayout;

    iput-object v4, p0, Lcom/youai/dreamonepiece/GameAnnounceDialog;->mWebRl:Landroid/widget/RelativeLayout;

    .line 158
    const v4, 0x7f09000f

    invoke-virtual {p0, v4}, Lcom/youai/dreamonepiece/GameAnnounceDialog;->findViewById(I)Landroid/view/View;

    move-result-object v4

    check-cast v4, Landroid/widget/RelativeLayout;

    iput-object v4, p0, Lcom/youai/dreamonepiece/GameAnnounceDialog;->boxRl:Landroid/widget/RelativeLayout;

    .line 160
    new-instance v4, Landroid/webkit/WebView;

    invoke-virtual {p0}, Lcom/youai/dreamonepiece/GameAnnounceDialog;->getContext()Landroid/content/Context;

    move-result-object v5

    invoke-direct {v4, v5}, Landroid/webkit/WebView;-><init>(Landroid/content/Context;)V

    iput-object v4, p0, Lcom/youai/dreamonepiece/GameAnnounceDialog;->mWebView:Landroid/webkit/WebView;

    .line 165
    iget-object v4, p0, Lcom/youai/dreamonepiece/GameAnnounceDialog;->mWebView:Landroid/webkit/WebView;

    new-instance v5, Lcom/youai/dreamonepiece/GameAnnounceDialog$WeiboWebViewClient;

    invoke-direct {v5, p0, v8}, Lcom/youai/dreamonepiece/GameAnnounceDialog$WeiboWebViewClient;-><init>(Lcom/youai/dreamonepiece/GameAnnounceDialog;Lcom/youai/dreamonepiece/GameAnnounceDialog$1;)V

    invoke-virtual {v4, v5}, Landroid/webkit/WebView;->setWebViewClient(Landroid/webkit/WebViewClient;)V

    .line 166
    iget-object v4, p0, Lcom/youai/dreamonepiece/GameAnnounceDialog;->mWebView:Landroid/webkit/WebView;

    invoke-virtual {v4}, Landroid/webkit/WebView;->getSettings()Landroid/webkit/WebSettings;

    move-result-object v3

    .line 167
    .local v3, "webSettings":Landroid/webkit/WebSettings;
    invoke-virtual {v3, v6}, Landroid/webkit/WebSettings;->setDomStorageEnabled(Z)V

    .line 168
    invoke-virtual {v3, v6}, Landroid/webkit/WebSettings;->setJavaScriptEnabled(Z)V

    .line 169
    invoke-virtual {v3, v6}, Landroid/webkit/WebSettings;->setSupportMultipleWindows(Z)V

    .line 170
    invoke-virtual {v3, v6}, Landroid/webkit/WebSettings;->setJavaScriptCanOpenWindowsAutomatically(Z)V

    .line 171
    const-wide/32 v4, 0x1000000

    invoke-virtual {v3, v4, v5}, Landroid/webkit/WebSettings;->setAppCacheMaxSize(J)V

    .line 172
    invoke-virtual {v3, v6}, Landroid/webkit/WebSettings;->setAppCacheEnabled(Z)V

    .line 173
    iget-object v4, p0, Lcom/youai/dreamonepiece/GameAnnounceDialog;->mContext:Landroid/content/Context;

    invoke-virtual {v4}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v4

    invoke-virtual {v4}, Landroid/content/Context;->getCacheDir()Ljava/io/File;

    move-result-object v4

    invoke-virtual {v4}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v0

    .line 175
    .local v0, "appCachePath":Ljava/lang/String;
    invoke-virtual {v3, v0}, Landroid/webkit/WebSettings;->setAppCachePath(Ljava/lang/String;)V

    .line 176
    invoke-virtual {v3, v6}, Landroid/webkit/WebSettings;->setAllowFileAccess(Z)V

    .line 177
    const/4 v4, -0x1

    invoke-virtual {v3, v4}, Landroid/webkit/WebSettings;->setCacheMode(I)V

    .line 178
    const/4 v4, 0x0

    invoke-virtual {v3, v4}, Landroid/webkit/WebSettings;->setDatabaseEnabled(Z)V

    .line 179
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "/data/data/"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    iget-object v5, p0, Lcom/youai/dreamonepiece/GameAnnounceDialog;->mContext:Landroid/content/Context;

    invoke-virtual {v5}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, "/databases/"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .line 181
    .local v1, "databasePath":Ljava/lang/String;
    invoke-virtual {v3, v1}, Landroid/webkit/WebSettings;->setDatabasePath(Ljava/lang/String;)V

    .line 182
    invoke-virtual {v3, v6}, Landroid/webkit/WebSettings;->setGeolocationEnabled(Z)V

    .line 183
    invoke-virtual {v3, v6}, Landroid/webkit/WebSettings;->setSaveFormData(Z)V

    .line 184
    sget-object v4, Lcom/youai/dreamonepiece/GameAnnounceDialog;->mRequestUrl:Ljava/lang/String;

    if-eqz v4, :cond_0

    .line 185
    iget-object v4, p0, Lcom/youai/dreamonepiece/GameAnnounceDialog;->mWebView:Landroid/webkit/WebView;

    sget-object v5, Lcom/youai/dreamonepiece/GameAnnounceDialog;->mRequestUrl:Ljava/lang/String;

    invoke-virtual {v4, v5}, Landroid/webkit/WebView;->loadUrl(Ljava/lang/String;)V

    .line 186
    sput-object v8, Lcom/youai/dreamonepiece/GameAnnounceDialog;->mRequestUrl:Ljava/lang/String;

    .line 194
    :goto_0
    sget-object v4, Lcom/youai/dreamonepiece/GameAnnounceDialog;->mRes:Landroid/content/res/Resources;

    invoke-virtual {v4}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v4

    iget v2, v4, Landroid/util/DisplayMetrics;->densityDpi:I

    .line 195
    .local v2, "screenDensity":I
    sget-object v4, Lcom/youai/dreamonepiece/GameAnnounceDialog;->TAG:Ljava/lang/String;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "screenDensity"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 197
    sparse-switch v2, :sswitch_data_0

    .line 217
    iget-object v4, p0, Lcom/youai/dreamonepiece/GameAnnounceDialog;->mWebView:Landroid/webkit/WebView;

    invoke-virtual {v4, v7}, Landroid/webkit/WebView;->setInitialScale(I)V

    .line 221
    :goto_1
    iget-object v4, p0, Lcom/youai/dreamonepiece/GameAnnounceDialog;->mWebRl:Landroid/widget/RelativeLayout;

    iget-object v5, p0, Lcom/youai/dreamonepiece/GameAnnounceDialog;->mWebView:Landroid/webkit/WebView;

    iget-object v6, p0, Lcom/youai/dreamonepiece/GameAnnounceDialog;->lp:Landroid/widget/RelativeLayout$LayoutParams;

    invoke-virtual {v4, v5, v6}, Landroid/widget/RelativeLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 222
    return-void

    .line 188
    .end local v2    # "screenDensity":I
    :cond_0
    iget-object v4, p0, Lcom/youai/dreamonepiece/GameAnnounceDialog;->mWebView:Landroid/webkit/WebView;

    const-string v5, "http://156.239.41.7:81/notice_android.php"

    invoke-virtual {v4, v5}, Landroid/webkit/WebView;->loadUrl(Ljava/lang/String;)V

    goto :goto_0

    .line 202
    .restart local v2    # "screenDensity":I
    :sswitch_0
    iget-object v4, p0, Lcom/youai/dreamonepiece/GameAnnounceDialog;->mWebView:Landroid/webkit/WebView;

    const/16 v5, 0x1e

    invoke-virtual {v4, v5}, Landroid/webkit/WebView;->setInitialScale(I)V

    goto :goto_1

    .line 205
    :sswitch_1
    iget-object v4, p0, Lcom/youai/dreamonepiece/GameAnnounceDialog;->mWebView:Landroid/webkit/WebView;

    const/16 v5, 0x23

    invoke-virtual {v4, v5}, Landroid/webkit/WebView;->setInitialScale(I)V

    goto :goto_1

    .line 208
    :sswitch_2
    iget-object v4, p0, Lcom/youai/dreamonepiece/GameAnnounceDialog;->mWebView:Landroid/webkit/WebView;

    const/16 v5, 0x28

    invoke-virtual {v4, v5}, Landroid/webkit/WebView;->setInitialScale(I)V

    goto :goto_1

    .line 211
    :sswitch_3
    iget-object v4, p0, Lcom/youai/dreamonepiece/GameAnnounceDialog;->mWebView:Landroid/webkit/WebView;

    invoke-virtual {v4, v7}, Landroid/webkit/WebView;->setInitialScale(I)V

    goto :goto_1

    .line 214
    :sswitch_4
    iget-object v4, p0, Lcom/youai/dreamonepiece/GameAnnounceDialog;->mWebView:Landroid/webkit/WebView;

    const/16 v5, 0x32

    invoke-virtual {v4, v5}, Landroid/webkit/WebView;->setInitialScale(I)V

    goto :goto_1

    .line 197
    nop

    :sswitch_data_0
    .sparse-switch
        0x78 -> :sswitch_0
        0xa0 -> :sswitch_1
        0xf0 -> :sswitch_2
        0x140 -> :sswitch_3
        0x1e0 -> :sswitch_4
    .end sparse-switch
.end method


# virtual methods
.method public dismiss()V
    .locals 0

    .prologue
    .line 82
    invoke-super {p0}, Landroid/app/Dialog;->dismiss()V

    .line 84
    return-void
.end method

.method protected onBack()V
    .locals 1

    .prologue
    .line 143
    :try_start_0
    iget-object v0, p0, Lcom/youai/dreamonepiece/GameAnnounceDialog;->mSpinner:Landroid/app/ProgressDialog;

    invoke-virtual {v0}, Landroid/app/ProgressDialog;->dismiss()V

    .line 144
    iget-object v0, p0, Lcom/youai/dreamonepiece/GameAnnounceDialog;->mWebView:Landroid/webkit/WebView;

    if-eqz v0, :cond_0

    .line 145
    iget-object v0, p0, Lcom/youai/dreamonepiece/GameAnnounceDialog;->mWebView:Landroid/webkit/WebView;

    invoke-virtual {v0}, Landroid/webkit/WebView;->stopLoading()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 150
    :cond_0
    :goto_0
    invoke-virtual {p0}, Lcom/youai/dreamonepiece/GameAnnounceDialog;->cancel()V

    .line 151
    return-void

    .line 148
    :catch_0
    move-exception v0

    goto :goto_0
.end method

.method public onBackPressed()V
    .locals 0

    .prologue
    .line 78
    return-void
.end method

.method protected onCreate(Landroid/os/Bundle;)V
    .locals 2
    .param p1, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    const/4 v1, 0x0

    .line 114
    invoke-super {p0, p1}, Landroid/app/Dialog;->onCreate(Landroid/os/Bundle;)V

    .line 115
    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Lcom/youai/dreamonepiece/GameAnnounceDialog;->requestWindowFeature(I)Z

    .line 116
    invoke-virtual {p0}, Lcom/youai/dreamonepiece/GameAnnounceDialog;->getWindow()Landroid/view/Window;

    move-result-object v0

    invoke-virtual {v0, v1, v1}, Landroid/view/Window;->setFeatureDrawableAlpha(II)V

    .line 118
    const v0, 0x7f030001

    invoke-virtual {p0, v0}, Lcom/youai/dreamonepiece/GameAnnounceDialog;->setContentView(I)V

    .line 119
    const v0, 0x7f090011

    invoke-virtual {p0, v0}, Lcom/youai/dreamonepiece/GameAnnounceDialog;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/ImageButton;

    iput-object v0, p0, Lcom/youai/dreamonepiece/GameAnnounceDialog;->mBtnOk:Landroid/widget/ImageButton;

    .line 121
    iget-object v0, p0, Lcom/youai/dreamonepiece/GameAnnounceDialog;->mBtnOk:Landroid/widget/ImageButton;

    new-instance v1, Lcom/youai/dreamonepiece/GameAnnounceDialog$2;

    invoke-direct {v1, p0}, Lcom/youai/dreamonepiece/GameAnnounceDialog$2;-><init>(Lcom/youai/dreamonepiece/GameAnnounceDialog;)V

    invoke-virtual {v0, v1}, Landroid/widget/ImageButton;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 139
    return-void
.end method

.method public show()V
    .locals 2

    .prologue
    .line 88
    invoke-super {p0}, Landroid/app/Dialog;->show()V

    .line 89
    iget-object v0, p0, Lcom/youai/dreamonepiece/GameAnnounceDialog;->mContext:Landroid/content/Context;

    invoke-static {v0}, Lcom/youai/NetworkUtil;->detect(Landroid/content/Context;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 90
    invoke-virtual {p0}, Lcom/youai/dreamonepiece/GameAnnounceDialog;->dismiss()V

    .line 110
    :goto_0
    return-void

    .line 93
    :cond_0
    new-instance v0, Landroid/app/ProgressDialog;

    invoke-virtual {p0}, Lcom/youai/dreamonepiece/GameAnnounceDialog;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/app/ProgressDialog;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Lcom/youai/dreamonepiece/GameAnnounceDialog;->mSpinner:Landroid/app/ProgressDialog;

    .line 94
    iget-object v0, p0, Lcom/youai/dreamonepiece/GameAnnounceDialog;->mSpinner:Landroid/app/ProgressDialog;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Landroid/app/ProgressDialog;->requestWindowFeature(I)Z

    .line 95
    iget-object v0, p0, Lcom/youai/dreamonepiece/GameAnnounceDialog;->mSpinner:Landroid/app/ProgressDialog;

    const-string v1, "\u52a0\u8f7d\u4e2d..."

    invoke-virtual {v0, v1}, Landroid/app/ProgressDialog;->setMessage(Ljava/lang/CharSequence;)V

    .line 97
    iget-object v0, p0, Lcom/youai/dreamonepiece/GameAnnounceDialog;->mSpinner:Landroid/app/ProgressDialog;

    new-instance v1, Lcom/youai/dreamonepiece/GameAnnounceDialog$1;

    invoke-direct {v1, p0}, Lcom/youai/dreamonepiece/GameAnnounceDialog$1;-><init>(Lcom/youai/dreamonepiece/GameAnnounceDialog;)V

    invoke-virtual {v0, v1}, Landroid/app/ProgressDialog;->setOnKeyListener(Landroid/content/DialogInterface$OnKeyListener;)V

    .line 108
    invoke-direct {p0}, Lcom/youai/dreamonepiece/GameAnnounceDialog;->setUpWebView()V

    goto :goto_0
.end method
