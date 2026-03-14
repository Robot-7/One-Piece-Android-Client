.class Lcom/youai/dreamonepiece/GameActivity$13;
.super Ljava/lang/Object;
.source "GameActivity.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/youai/dreamonepiece/GameActivity;->ShowAnnounce(Ljava/lang/String;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/youai/dreamonepiece/GameActivity;

.field final synthetic val$pAnnounceUrl:Ljava/lang/String;


# direct methods
.method constructor <init>(Lcom/youai/dreamonepiece/GameActivity;Ljava/lang/String;)V
    .locals 0

    .prologue
    .line 1173
    iput-object p1, p0, Lcom/youai/dreamonepiece/GameActivity$13;->this$0:Lcom/youai/dreamonepiece/GameActivity;

    iput-object p2, p0, Lcom/youai/dreamonepiece/GameActivity$13;->val$pAnnounceUrl:Ljava/lang/String;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 3

    .prologue
    .line 1177
    new-instance v0, Lcom/youai/dreamonepiece/GameAnnounceDialog;

    iget-object v1, p0, Lcom/youai/dreamonepiece/GameActivity$13;->this$0:Lcom/youai/dreamonepiece/GameActivity;

    invoke-virtual {v1}, Lcom/youai/dreamonepiece/GameActivity;->getActivity()Lcom/youai/dreamonepiece/GameActivity;

    move-result-object v1

    iget-object v2, p0, Lcom/youai/dreamonepiece/GameActivity$13;->val$pAnnounceUrl:Ljava/lang/String;

    invoke-direct {v0, v1, v2}, Lcom/youai/dreamonepiece/GameAnnounceDialog;-><init>(Landroid/app/Activity;Ljava/lang/String;)V

    .line 1180
    .local v0, "dialog":Lcom/youai/dreamonepiece/GameAnnounceDialog;
    return-void
.end method
