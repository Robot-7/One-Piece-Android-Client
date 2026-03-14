.class final Lcom/tencent/wxop/stat/an;
.super Ljava/lang/Object;

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field final synthetic bc:Ljava/util/List;

.field final synthetic ck:Lcom/tencent/wxop/stat/ak;

.field final synthetic dm:Lcom/tencent/wxop/stat/al;


# direct methods
.method constructor <init>(Lcom/tencent/wxop/stat/al;Ljava/util/List;Lcom/tencent/wxop/stat/ak;)V
    .locals 0

    iput-object p1, p0, Lcom/tencent/wxop/stat/an;->dm:Lcom/tencent/wxop/stat/al;

    iput-object p2, p0, Lcom/tencent/wxop/stat/an;->bc:Ljava/util/List;

    iput-object p3, p0, Lcom/tencent/wxop/stat/an;->ck:Lcom/tencent/wxop/stat/ak;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 3

    iget-object v0, p0, Lcom/tencent/wxop/stat/an;->dm:Lcom/tencent/wxop/stat/al;

    iget-object v1, p0, Lcom/tencent/wxop/stat/an;->bc:Ljava/util/List;

    iget-object v2, p0, Lcom/tencent/wxop/stat/an;->ck:Lcom/tencent/wxop/stat/ak;

    invoke-virtual {v0, v1, v2}, Lcom/tencent/wxop/stat/al;->a(Ljava/util/List;Lcom/tencent/wxop/stat/ak;)V

    return-void
.end method
