.class final Lcom/tencent/wxop/stat/ac;
.super Ljava/lang/Object;

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field final synthetic aI:I

.field final synthetic cl:Lcom/tencent/wxop/stat/u;


# direct methods
.method constructor <init>(Lcom/tencent/wxop/stat/u;I)V
    .locals 0

    iput-object p1, p0, Lcom/tencent/wxop/stat/ac;->cl:Lcom/tencent/wxop/stat/u;

    iput p2, p0, Lcom/tencent/wxop/stat/ac;->aI:I

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 3

    iget-object v0, p0, Lcom/tencent/wxop/stat/ac;->cl:Lcom/tencent/wxop/stat/u;

    iget v1, p0, Lcom/tencent/wxop/stat/ac;->aI:I

    const/4 v2, 0x1

    invoke-static {v0, v1, v2}, Lcom/tencent/wxop/stat/u;->a(Lcom/tencent/wxop/stat/u;IZ)V

    iget-object v0, p0, Lcom/tencent/wxop/stat/ac;->cl:Lcom/tencent/wxop/stat/u;

    iget v1, p0, Lcom/tencent/wxop/stat/ac;->aI:I

    const/4 v2, 0x0

    invoke-static {v0, v1, v2}, Lcom/tencent/wxop/stat/u;->a(Lcom/tencent/wxop/stat/u;IZ)V

    return-void
.end method
