.class final Lcom/youai/GameActivityHelper$4;
.super Ljava/lang/Object;
.source "GameActivityHelper.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/youai/GameActivityHelper;->openWeChat(Landroid/content/Context;Landroid/os/Handler;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = null
.end annotation


# instance fields
.field final synthetic val$pContext:Landroid/content/Context;

.field final synthetic val$pMainHandler:Landroid/os/Handler;


# direct methods
.method constructor <init>(Landroid/content/Context;Landroid/os/Handler;)V
    .locals 0

    .prologue
    .line 151
    iput-object p1, p0, Lcom/youai/GameActivityHelper$4;->val$pContext:Landroid/content/Context;

    iput-object p2, p0, Lcom/youai/GameActivityHelper$4;->val$pMainHandler:Landroid/os/Handler;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 2

    .prologue
    .line 154
    iget-object v0, p0, Lcom/youai/GameActivityHelper$4;->val$pContext:Landroid/content/Context;

    sput-object v0, Lcom/youai/GameActivityHelper;->mContext:Landroid/content/Context;

    .line 155
    iget-object v0, p0, Lcom/youai/GameActivityHelper$4;->val$pContext:Landroid/content/Context;

    iget-object v1, p0, Lcom/youai/GameActivityHelper$4;->val$pMainHandler:Landroid/os/Handler;

    invoke-static {v0, v1}, Lcom/youai/GameActivityHelper;->noWeChatDialog(Landroid/content/Context;Landroid/os/Handler;)V

    .line 156
    return-void
.end method
