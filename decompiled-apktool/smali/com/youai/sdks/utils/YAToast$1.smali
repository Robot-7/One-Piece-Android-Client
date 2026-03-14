.class Lcom/youai/sdks/utils/YAToast$1;
.super Ljava/lang/Object;
.source "YAToast.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/youai/sdks/utils/YAToast;->showMsg(Landroid/app/Activity;Ljava/lang/String;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field private final synthetic val$activity:Landroid/app/Activity;

.field private final synthetic val$message:Ljava/lang/String;


# direct methods
.method constructor <init>(Landroid/app/Activity;Ljava/lang/String;)V
    .locals 0

    .prologue
    .line 1
    iput-object p1, p0, Lcom/youai/sdks/utils/YAToast$1;->val$activity:Landroid/app/Activity;

    iput-object p2, p0, Lcom/youai/sdks/utils/YAToast$1;->val$message:Ljava/lang/String;

    .line 13
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 3

    .prologue
    .line 17
    iget-object v0, p0, Lcom/youai/sdks/utils/YAToast$1;->val$activity:Landroid/app/Activity;

    iget-object v1, p0, Lcom/youai/sdks/utils/YAToast$1;->val$message:Ljava/lang/String;

    const/4 v2, 0x0

    invoke-static {v0, v1, v2}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v0

    .line 18
    invoke-virtual {v0}, Landroid/widget/Toast;->show()V

    .line 19
    return-void
.end method
