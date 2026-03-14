.class Lcom/youai/NetworkUtil$1;
.super Ljava/lang/Object;
.source "NetworkUtil.java"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/youai/NetworkUtil;->CheckNetwork(Landroid/content/Context;)Z
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/youai/NetworkUtil;


# direct methods
.method constructor <init>(Lcom/youai/NetworkUtil;)V
    .locals 0

    .prologue
    .line 76
    iput-object p1, p0, Lcom/youai/NetworkUtil$1;->this$0:Lcom/youai/NetworkUtil;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;I)V
    .locals 0
    .param p1, "dialog"    # Landroid/content/DialogInterface;
    .param p2, "which"    # I

    .prologue
    .line 79
    return-void
.end method
