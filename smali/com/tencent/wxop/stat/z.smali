.class final Lcom/tencent/wxop/stat/z;
.super Ljava/lang/Object;

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field final synthetic O:Lcom/tencent/wxop/stat/ai;

.field final synthetic cl:Lcom/tencent/wxop/stat/u;


# direct methods
.method constructor <init>(Lcom/tencent/wxop/stat/u;Lcom/tencent/wxop/stat/ai;)V
    .locals 0

    iput-object p1, p0, Lcom/tencent/wxop/stat/z;->cl:Lcom/tencent/wxop/stat/u;

    iput-object p2, p0, Lcom/tencent/wxop/stat/z;->O:Lcom/tencent/wxop/stat/ai;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 2

    iget-object v0, p0, Lcom/tencent/wxop/stat/z;->cl:Lcom/tencent/wxop/stat/u;

    iget-object v1, p0, Lcom/tencent/wxop/stat/z;->O:Lcom/tencent/wxop/stat/ai;

    invoke-static {v0, v1}, Lcom/tencent/wxop/stat/u;->a(Lcom/tencent/wxop/stat/u;Lcom/tencent/wxop/stat/ai;)V

    return-void
.end method
