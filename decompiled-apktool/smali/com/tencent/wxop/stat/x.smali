.class final Lcom/tencent/wxop/stat/x;
.super Ljava/lang/Object;

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field final synthetic cj:Lcom/tencent/wxop/stat/u;


# direct methods
.method constructor <init>(Lcom/tencent/wxop/stat/u;)V
    .locals 0

    iput-object p1, p0, Lcom/tencent/wxop/stat/x;->cj:Lcom/tencent/wxop/stat/u;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 1

    iget-object v0, p0, Lcom/tencent/wxop/stat/x;->cj:Lcom/tencent/wxop/stat/u;

    invoke-static {v0}, Lcom/tencent/wxop/stat/u;->a(Lcom/tencent/wxop/stat/u;)V

    return-void
.end method
