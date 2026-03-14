.class public Lcom/pipaw/pipawpay/b;
.super Ljava/lang/Object;


# direct methods
.method public static a(Landroid/content/Context;Ljava/lang/Boolean;)V
    .locals 3

    const-string v0, "pipaw"

    const-string v1, "pipaw_app_launch"

    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v2

    invoke-static {p0, v0, v1, v2}, Lcom/pipaw/a/i;->b(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Z)V

    return-void
.end method

.method public static a(Landroid/content/Context;)Z
    .locals 3

    const-string v0, "pipaw"

    const-string v1, "pipaw_app_launch"

    const/4 v2, 0x0

    invoke-static {p0, v0, v1, v2}, Lcom/pipaw/a/i;->a(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Z)Z

    move-result v0

    return v0
.end method
