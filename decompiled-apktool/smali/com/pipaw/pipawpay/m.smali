.class Lcom/pipaw/pipawpay/m;
.super Ljava/lang/Object;

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field final synthetic a:Lcom/pipaw/pipawpay/l;

.field private final synthetic b:Ljava/lang/String;


# direct methods
.method constructor <init>(Lcom/pipaw/pipawpay/l;Ljava/lang/String;)V
    .locals 0

    iput-object p1, p0, Lcom/pipaw/pipawpay/m;->a:Lcom/pipaw/pipawpay/l;

    iput-object p2, p0, Lcom/pipaw/pipawpay/m;->b:Ljava/lang/String;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 2

    iget-object v0, p0, Lcom/pipaw/pipawpay/m;->a:Lcom/pipaw/pipawpay/l;

    invoke-static {v0}, Lcom/pipaw/pipawpay/l;->a(Lcom/pipaw/pipawpay/l;)Landroid/content/Context;

    move-result-object v0

    iget-object v1, p0, Lcom/pipaw/pipawpay/m;->b:Ljava/lang/String;

    invoke-static {v0, v1}, Lcom/pipaw/pipawpay/a;->a(Landroid/content/Context;Ljava/lang/String;)V

    iget-object v0, p0, Lcom/pipaw/pipawpay/m;->a:Lcom/pipaw/pipawpay/l;

    invoke-static {v0}, Lcom/pipaw/pipawpay/l;->b(Lcom/pipaw/pipawpay/l;)Lcom/pipaw/pipawpay/PipawUserActivity;

    move-result-object v0

    invoke-static {v0}, Lcom/pipaw/pipawpay/PipawUserActivity;->h(Lcom/pipaw/pipawpay/PipawUserActivity;)Landroid/widget/PopupWindow;

    move-result-object v0

    invoke-virtual {v0}, Landroid/widget/PopupWindow;->dismiss()V

    iget-object v0, p0, Lcom/pipaw/pipawpay/m;->a:Lcom/pipaw/pipawpay/l;

    invoke-static {v0}, Lcom/pipaw/pipawpay/l;->b(Lcom/pipaw/pipawpay/l;)Lcom/pipaw/pipawpay/PipawUserActivity;

    move-result-object v0

    const/4 v1, 0x0

    invoke-static {v0, v1}, Lcom/pipaw/pipawpay/PipawUserActivity;->a(Lcom/pipaw/pipawpay/PipawUserActivity;Landroid/widget/PopupWindow;)V

    return-void
.end method
