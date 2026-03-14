.class public Lcom/pipaw/pipawpay/l;
.super Landroid/widget/BaseAdapter;


# instance fields
.field final synthetic a:Lcom/pipaw/pipawpay/PipawUserActivity;

.field private b:Landroid/content/Context;

.field private c:Landroid/view/LayoutInflater;

.field private d:Ljava/util/List;


# direct methods
.method public constructor <init>(Lcom/pipaw/pipawpay/PipawUserActivity;Landroid/content/Context;Ljava/util/List;)V
    .locals 1

    iput-object p1, p0, Lcom/pipaw/pipawpay/l;->a:Lcom/pipaw/pipawpay/PipawUserActivity;

    invoke-direct {p0}, Landroid/widget/BaseAdapter;-><init>()V

    iput-object p2, p0, Lcom/pipaw/pipawpay/l;->b:Landroid/content/Context;

    invoke-static {p2}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object v0

    iput-object v0, p0, Lcom/pipaw/pipawpay/l;->c:Landroid/view/LayoutInflater;

    iput-object p3, p0, Lcom/pipaw/pipawpay/l;->d:Ljava/util/List;

    return-void
.end method

.method static synthetic a(Lcom/pipaw/pipawpay/l;)Landroid/content/Context;
    .locals 1

    iget-object v0, p0, Lcom/pipaw/pipawpay/l;->b:Landroid/content/Context;

    return-object v0
.end method

.method static synthetic b(Lcom/pipaw/pipawpay/l;)Lcom/pipaw/pipawpay/PipawUserActivity;
    .locals 1

    iget-object v0, p0, Lcom/pipaw/pipawpay/l;->a:Lcom/pipaw/pipawpay/PipawUserActivity;

    return-object v0
.end method


# virtual methods
.method public getCount()I
    .locals 1

    iget-object v0, p0, Lcom/pipaw/pipawpay/l;->d:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    return v0
.end method

.method public getItem(I)Ljava/lang/Object;
    .locals 1

    iget-object v0, p0, Lcom/pipaw/pipawpay/l;->d:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method public getItemId(I)J
    .locals 2

    int-to-long v0, p1

    return-wide v0
.end method

.method public getView(ILandroid/view/View;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 4

    const/4 v3, 0x0

    if-nez p2, :cond_0

    iget-object v0, p0, Lcom/pipaw/pipawpay/l;->c:Landroid/view/LayoutInflater;

    iget-object v1, p0, Lcom/pipaw/pipawpay/l;->b:Landroid/content/Context;

    const-string v2, "pipaw_user_item"

    invoke-static {v1, v2}, Lcom/pipaw/a/h;->c(Landroid/content/Context;Ljava/lang/String;)I

    move-result v1

    invoke-virtual {v0, v1, v3}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    move-result-object p2

    new-instance v1, Lcom/pipaw/pipawpay/n;

    invoke-direct {v1, p0, v3}, Lcom/pipaw/pipawpay/n;-><init>(Lcom/pipaw/pipawpay/l;Lcom/pipaw/pipawpay/n;)V

    iget-object v0, p0, Lcom/pipaw/pipawpay/l;->b:Landroid/content/Context;

    const-string v2, "username_tv"

    invoke-static {v0, v2}, Lcom/pipaw/a/h;->b(Landroid/content/Context;Ljava/lang/String;)I

    move-result v0

    invoke-virtual {p2, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, v1, Lcom/pipaw/pipawpay/n;->a:Landroid/widget/TextView;

    iget-object v0, p0, Lcom/pipaw/pipawpay/l;->b:Landroid/content/Context;

    const-string v2, "delete_iv"

    invoke-static {v0, v2}, Lcom/pipaw/a/h;->b(Landroid/content/Context;Ljava/lang/String;)I

    move-result v0

    invoke-virtual {p2, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/ImageView;

    iput-object v0, v1, Lcom/pipaw/pipawpay/n;->b:Landroid/widget/ImageView;

    invoke-virtual {p2, v1}, Landroid/view/View;->setTag(Ljava/lang/Object;)V

    :goto_0
    iget-object v0, p0, Lcom/pipaw/pipawpay/l;->d:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    iget-object v2, v1, Lcom/pipaw/pipawpay/n;->a:Landroid/widget/TextView;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    iget-object v1, v1, Lcom/pipaw/pipawpay/n;->b:Landroid/widget/ImageView;

    new-instance v2, Lcom/pipaw/pipawpay/m;

    invoke-direct {v2, p0, v0}, Lcom/pipaw/pipawpay/m;-><init>(Lcom/pipaw/pipawpay/l;Ljava/lang/String;)V

    invoke-virtual {v1, v2}, Landroid/widget/ImageView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    return-object p2

    :cond_0
    invoke-virtual {p2}, Landroid/view/View;->getTag()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/pipaw/pipawpay/n;

    move-object v1, v0

    goto :goto_0
.end method
