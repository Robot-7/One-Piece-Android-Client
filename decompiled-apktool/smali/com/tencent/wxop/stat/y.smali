.class final Lcom/tencent/wxop/stat/y;
.super Ljava/lang/Object;

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field final synthetic bP:Lcom/tencent/wxop/stat/a/d;

.field final synthetic bR:Z

.field final synthetic ba:Z

.field final synthetic cg:Lcom/tencent/wxop/stat/u;

.field final synthetic ck:Lcom/tencent/wxop/stat/ak;


# direct methods
.method constructor <init>(Lcom/tencent/wxop/stat/u;Lcom/tencent/wxop/stat/a/d;Lcom/tencent/wxop/stat/ak;ZZ)V
    .locals 0

    iput-object p1, p0, Lcom/tencent/wxop/stat/y;->cg:Lcom/tencent/wxop/stat/u;

    iput-object p2, p0, Lcom/tencent/wxop/stat/y;->bP:Lcom/tencent/wxop/stat/a/d;

    iput-object p3, p0, Lcom/tencent/wxop/stat/y;->ck:Lcom/tencent/wxop/stat/ak;

    iput-boolean p4, p0, Lcom/tencent/wxop/stat/y;->bR:Z

    iput-boolean p5, p0, Lcom/tencent/wxop/stat/y;->ba:Z

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 5

    iget-object v0, p0, Lcom/tencent/wxop/stat/y;->cg:Lcom/tencent/wxop/stat/u;

    iget-object v1, p0, Lcom/tencent/wxop/stat/y;->bP:Lcom/tencent/wxop/stat/a/d;

    iget-object v2, p0, Lcom/tencent/wxop/stat/y;->ck:Lcom/tencent/wxop/stat/ak;

    iget-boolean v3, p0, Lcom/tencent/wxop/stat/y;->bR:Z

    iget-boolean v4, p0, Lcom/tencent/wxop/stat/y;->ba:Z

    invoke-static {v0, v1, v2, v3, v4}, Lcom/tencent/wxop/stat/u;->a(Lcom/tencent/wxop/stat/u;Lcom/tencent/wxop/stat/a/d;Lcom/tencent/wxop/stat/ak;ZZ)V

    return-void
.end method
