.class final Lcom/tencent/wxop/stat/r;
.super Ljava/lang/Object;

# interfaces
.implements Lcom/tencent/wxop/stat/ak;


# instance fields
.field final synthetic bV:Lcom/tencent/wxop/stat/q;


# direct methods
.method constructor <init>(Lcom/tencent/wxop/stat/q;)V
    .locals 0

    iput-object p1, p0, Lcom/tencent/wxop/stat/r;->bV:Lcom/tencent/wxop/stat/q;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final B()V
    .locals 0

    invoke-static {}, Lcom/tencent/wxop/stat/f;->I()V

    return-void
.end method

.method public final ah()V
    .locals 2

    invoke-static {}, Lcom/tencent/wxop/stat/f;->H()V

    invoke-static {}, Lcom/tencent/wxop/stat/u;->ai()Lcom/tencent/wxop/stat/u;

    move-result-object v0

    invoke-virtual {v0}, Lcom/tencent/wxop/stat/u;->r()I

    move-result v0

    invoke-static {}, Lcom/tencent/wxop/stat/c;->o()I

    move-result v1

    if-lt v0, v1, :cond_0

    invoke-static {}, Lcom/tencent/wxop/stat/u;->ai()Lcom/tencent/wxop/stat/u;

    move-result-object v0

    invoke-static {}, Lcom/tencent/wxop/stat/c;->o()I

    move-result v1

    invoke-virtual {v0, v1}, Lcom/tencent/wxop/stat/u;->b(I)V

    :cond_0
    return-void
.end method
