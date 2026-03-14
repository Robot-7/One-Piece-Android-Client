.class public Lcom/youai/sdks/utils/YAToast;
.super Ljava/lang/Object;
.source "YAToast.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 6
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static showMsg(Landroid/app/Activity;Ljava/lang/String;)V
    .locals 1
    .param p0, "activity"    # Landroid/app/Activity;
    .param p1, "message"    # Ljava/lang/String;

    .prologue
    .line 9
    if-eqz p0, :cond_0

    if-nez p1, :cond_1

    .line 24
    :cond_0
    :goto_0
    return-void

    .line 13
    :cond_1
    :try_start_0
    new-instance v0, Lcom/youai/sdks/utils/YAToast$1;

    invoke-direct {v0, p0, p1}, Lcom/youai/sdks/utils/YAToast$1;-><init>(Landroid/app/Activity;Ljava/lang/String;)V

    invoke-virtual {p0, v0}, Landroid/app/Activity;->runOnUiThread(Ljava/lang/Runnable;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 21
    :catch_0
    move-exception v0

    goto :goto_0
.end method
