.class final Lcom/tencent/wxop/stat/af;
.super Ljava/lang/Object;

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field final synthetic cq:Lcom/tencent/wxop/stat/aa;


# direct methods
.method constructor <init>(Lcom/tencent/wxop/stat/aa;)V
    .locals 0

    iput-object p1, p0, Lcom/tencent/wxop/stat/af;->cq:Lcom/tencent/wxop/stat/aa;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 1

    iget-object v0, p0, Lcom/tencent/wxop/stat/af;->cq:Lcom/tencent/wxop/stat/aa;

    iget-object v0, v0, Lcom/tencent/wxop/stat/aa;->cm:Lcom/tencent/wxop/stat/h;

    invoke-virtual {v0}, Lcom/tencent/wxop/stat/h;->Z()V

    return-void
.end method
