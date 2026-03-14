.class Lcom/youai/dreamonepiece/Ordercomparator;
.super Ljava/lang/Object;
.source "YouaiLastLoginHelp.java"

# interfaces
.implements Ljava/util/Comparator;


# direct methods
.method constructor <init>()V
    .locals 0

    .prologue
    .line 865
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public compare(Ljava/lang/Object;Ljava/lang/Object;)I
    .locals 5
    .param p1, "o1"    # Ljava/lang/Object;
    .param p2, "o2"    # Ljava/lang/Object;

    .prologue
    .line 868
    check-cast p1, Lcom/youai/dreamonepiece/YouaiServerInfo;

    .end local p1    # "o1":Ljava/lang/Object;
    invoke-virtual {p1}, Lcom/youai/dreamonepiece/YouaiServerInfo;->getLastLoginTime()Ljava/lang/Long;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/Long;->longValue()J

    move-result-wide v0

    .line 869
    .local v0, "time1":J
    check-cast p2, Lcom/youai/dreamonepiece/YouaiServerInfo;

    .end local p2    # "o2":Ljava/lang/Object;
    invoke-virtual {p2}, Lcom/youai/dreamonepiece/YouaiServerInfo;->getLastLoginTime()Ljava/lang/Long;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/Long;->longValue()J

    move-result-wide v2

    .line 870
    .local v2, "time2":J
    cmp-long v4, v0, v2

    if-lez v4, :cond_0

    .line 871
    const/4 v4, -0x1

    .line 875
    :goto_0
    return v4

    .line 872
    :cond_0
    cmp-long v4, v0, v2

    if-gez v4, :cond_1

    .line 873
    const/4 v4, 0x1

    goto :goto_0

    .line 875
    :cond_1
    const/4 v4, 0x0

    goto :goto_0
.end method
