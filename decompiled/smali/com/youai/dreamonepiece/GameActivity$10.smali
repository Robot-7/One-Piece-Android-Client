.class final Lcom/youai/dreamonepiece/GameActivity$10;
.super Ljava/lang/Object;
.source "GameActivity.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/youai/dreamonepiece/GameActivity;->playMovie(Ljava/lang/String;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = null
.end annotation


# instance fields
.field final synthetic val$fileName:Ljava/lang/String;


# direct methods
.method constructor <init>(Ljava/lang/String;)V
    .locals 0

    .prologue
    .line 922
    iput-object p1, p0, Lcom/youai/dreamonepiece/GameActivity$10;->val$fileName:Ljava/lang/String;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 5

    .prologue
    const/4 v4, 0x0

    .line 926
    invoke-static {}, Lcom/youai/dreamonepiece/GameActivity;->access$100()Ljava/lang/String;

    move-result-object v1

    iget-object v2, p0, Lcom/youai/dreamonepiece/GameActivity$10;->val$fileName:Ljava/lang/String;

    invoke-static {v1, v2}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 928
    invoke-static {}, Lcom/youai/dreamonepiece/GameActivity;->access$200()Lcom/youai/WorldVideoView;

    move-result-object v1

    if-nez v1, :cond_0

    .line 929
    sget-object v1, Lcom/youai/dreamonepiece/GameActivity;->mGameApp:Lcom/youai/dreamonepiece/GameActivity;

    const v2, 0x7f09000b

    invoke-virtual {v1, v2}, Lcom/youai/dreamonepiece/GameActivity;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Lcom/youai/WorldVideoView;

    invoke-static {v1}, Lcom/youai/dreamonepiece/GameActivity;->access$202(Lcom/youai/WorldVideoView;)Lcom/youai/WorldVideoView;

    .line 931
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "android.resource://"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    sget-object v2, Lcom/youai/dreamonepiece/GameActivity;->mGameApp:Lcom/youai/dreamonepiece/GameActivity;

    invoke-virtual {v2}, Lcom/youai/dreamonepiece/GameActivity;->getPackageName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "/"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const v2, 0x7f050002

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 933
    .local v0, "uri":Ljava/lang/String;
    invoke-static {}, Lcom/youai/dreamonepiece/GameActivity;->access$200()Lcom/youai/WorldVideoView;

    move-result-object v1

    invoke-static {v0}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v2

    invoke-virtual {v1, v2}, Lcom/youai/WorldVideoView;->setVideoURI(Landroid/net/Uri;)V

    .line 936
    .end local v0    # "uri":Ljava/lang/String;
    :cond_0
    sget-object v1, Lcom/youai/dreamonepiece/GameActivity;->mGameApp:Lcom/youai/dreamonepiece/GameActivity;

    const v2, 0x7f09000c

    invoke-virtual {v1, v2}, Lcom/youai/dreamonepiece/GameActivity;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/ImageButton;

    invoke-static {v1}, Lcom/youai/dreamonepiece/GameActivity;->access$302(Landroid/widget/ImageButton;)Landroid/widget/ImageButton;

    .line 938
    iget-object v1, p0, Lcom/youai/dreamonepiece/GameActivity$10;->val$fileName:Ljava/lang/String;

    const-string v2, "movie"

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_1

    .line 939
    invoke-static {}, Lcom/youai/dreamonepiece/GameActivity;->access$200()Lcom/youai/WorldVideoView;

    move-result-object v1

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    sget-object v3, Lcom/youai/dreamonepiece/GameActivity;->mGameApp:Lcom/youai/dreamonepiece/GameActivity;

    iget-object v3, v3, Lcom/youai/dreamonepiece/GameActivity;->mAppDataExternalStorageResourcesFullPath:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "/movie/"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-object v3, p0, Lcom/youai/dreamonepiece/GameActivity$10;->val$fileName:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, ".mp4"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v2

    invoke-virtual {v1, v2}, Lcom/youai/WorldVideoView;->setVideoURI(Landroid/net/Uri;)V

    .line 943
    :cond_1
    invoke-static {}, Lcom/youai/dreamonepiece/GameActivity;->access$200()Lcom/youai/WorldVideoView;

    move-result-object v1

    invoke-virtual {v1, v4}, Lcom/youai/WorldVideoView;->setVisibility(I)V

    .line 944
    invoke-static {}, Lcom/youai/dreamonepiece/GameActivity;->access$200()Lcom/youai/WorldVideoView;

    move-result-object v1

    sget-object v2, Lcom/youai/dreamonepiece/GameActivity;->mGameApp:Lcom/youai/dreamonepiece/GameActivity;

    invoke-virtual {v1, v2}, Lcom/youai/WorldVideoView;->setOnCompletionListener(Landroid/media/MediaPlayer$OnCompletionListener;)V

    .line 945
    invoke-static {}, Lcom/youai/dreamonepiece/GameActivity;->access$200()Lcom/youai/WorldVideoView;

    move-result-object v1

    new-instance v2, Lcom/youai/dreamonepiece/GameActivity$10$1;

    invoke-direct {v2, p0}, Lcom/youai/dreamonepiece/GameActivity$10$1;-><init>(Lcom/youai/dreamonepiece/GameActivity$10;)V

    invoke-virtual {v1, v2}, Lcom/youai/WorldVideoView;->setOnErrorListener(Landroid/media/MediaPlayer$OnErrorListener;)V

    .line 953
    invoke-static {}, Lcom/youai/dreamonepiece/GameActivity;->access$300()Landroid/widget/ImageButton;

    move-result-object v1

    invoke-virtual {v1, v4}, Landroid/widget/ImageButton;->setVisibility(I)V

    .line 954
    invoke-static {}, Lcom/youai/dreamonepiece/GameActivity;->access$300()Landroid/widget/ImageButton;

    move-result-object v1

    new-instance v2, Lcom/youai/dreamonepiece/GameActivity$10$2;

    invoke-direct {v2, p0}, Lcom/youai/dreamonepiece/GameActivity$10$2;-><init>(Lcom/youai/dreamonepiece/GameActivity$10;)V

    invoke-virtual {v1, v2}, Landroid/widget/ImageButton;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 960
    invoke-static {}, Lcom/youai/dreamonepiece/GameActivity;->access$200()Lcom/youai/WorldVideoView;

    move-result-object v1

    invoke-virtual {v1}, Lcom/youai/WorldVideoView;->start()V

    .line 963
    invoke-static {}, Lcom/youai/dreamonepiece/GameActivity;->access$200()Lcom/youai/WorldVideoView;

    move-result-object v1

    const/4 v2, 0x1

    invoke-virtual {v1, v2}, Lcom/youai/WorldVideoView;->setZOrderMediaOverlay(Z)V

    .line 964
    return-void
.end method
