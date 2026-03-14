.class Lcom/pipaw/pipawpay/PipawPayActivity$1;
.super Landroid/webkit/WebViewClient;


# instance fields
.field final synthetic this$0:Lcom/pipaw/pipawpay/PipawPayActivity;


# direct methods
.method constructor <init>(Lcom/pipaw/pipawpay/PipawPayActivity;)V
    .locals 0

    iput-object p1, p0, Lcom/pipaw/pipawpay/PipawPayActivity$1;->this$0:Lcom/pipaw/pipawpay/PipawPayActivity;

    invoke-direct {p0}, Landroid/webkit/WebViewClient;-><init>()V

    return-void
.end method


# virtual methods
.method public shouldOverrideUrlLoading(Landroid/webkit/WebView;Ljava/lang/String;)Z
    .locals 1

    invoke-super {p0, p1, p2}, Landroid/webkit/WebViewClient;->shouldOverrideUrlLoading(Landroid/webkit/WebView;Ljava/lang/String;)Z

    move-result v0

    return v0
.end method
