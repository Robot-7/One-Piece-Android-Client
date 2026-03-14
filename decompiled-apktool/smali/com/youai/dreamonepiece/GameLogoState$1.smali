.class Lcom/youai/dreamonepiece/GameLogoState$1;
.super Ljava/lang/Thread;
.source "GameLogoState.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/youai/dreamonepiece/GameLogoState;->removeExistDirtyFileDirectory()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/youai/dreamonepiece/GameLogoState;


# direct methods
.method constructor <init>(Lcom/youai/dreamonepiece/GameLogoState;Ljava/lang/String;)V
    .locals 0
    .param p2, "x0"    # Ljava/lang/String;

    .prologue
    .line 185
    iput-object p1, p0, Lcom/youai/dreamonepiece/GameLogoState$1;->this$0:Lcom/youai/dreamonepiece/GameLogoState;

    invoke-direct {p0, p2}, Ljava/lang/Thread;-><init>(Ljava/lang/String;)V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 12

    .prologue
    const-wide/16 v10, 0x1f4

    const/4 v9, 0x0

    .line 189
    new-instance v4, Ljava/io/File;

    iget-object v7, p0, Lcom/youai/dreamonepiece/GameLogoState$1;->this$0:Lcom/youai/dreamonepiece/GameLogoState;

    invoke-static {v7}, Lcom/youai/dreamonepiece/GameLogoState;->access$000(Lcom/youai/dreamonepiece/GameLogoState;)Lcom/youai/IGameActivity;

    move-result-object v7

    invoke-interface {v7}, Lcom/youai/IGameActivity;->getAppFilesResourcesPath()Ljava/lang/String;

    move-result-object v7

    invoke-direct {v4, v7}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 191
    .local v4, "rootfiles":Ljava/io/File;
    invoke-static {v4}, Lcom/youai/StorageUtil;->removeFileDirectory(Ljava/io/File;)V

    .line 192
    const/4 v4, 0x0

    .line 193
    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    invoke-static {}, Landroid/os/Environment;->getExternalStorageDirectory()Ljava/io/File;

    move-result-object v8

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v7

    sget-object v8, Ljava/io/File;->separator:Ljava/lang/String;

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string v8, "Android"

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    sget-object v8, Ljava/io/File;->separator:Ljava/lang/String;

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string v8, "data"

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    sget-object v8, Ljava/io/File;->separator:Ljava/lang/String;

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    iget-object v8, p0, Lcom/youai/dreamonepiece/GameLogoState$1;->this$0:Lcom/youai/dreamonepiece/GameLogoState;

    invoke-static {v8}, Lcom/youai/dreamonepiece/GameLogoState;->access$000(Lcom/youai/dreamonepiece/GameLogoState;)Lcom/youai/IGameActivity;

    move-result-object v8

    invoke-interface {v8}, Lcom/youai/IGameActivity;->getActivity()Lcom/youai/dreamonepiece/GameActivity;

    move-result-object v8

    invoke-virtual {v8}, Lcom/youai/dreamonepiece/GameActivity;->getPackageName()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    sget-object v8, Ljava/io/File;->separator:Ljava/lang/String;

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string v8, "files"

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    sget-object v8, Ljava/io/File;->separator:Ljava/lang/String;

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string v8, "assets"

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    .line 198
    .local v3, "path":Ljava/lang/String;
    new-instance v6, Ljava/io/File;

    invoke-direct {v6, v3}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 199
    .local v6, "tmp":Ljava/io/File;
    invoke-virtual {v6}, Ljava/io/File;->exists()Z

    move-result v7

    if-eqz v7, :cond_0

    .line 200
    invoke-static {v6}, Lcom/youai/StorageUtil;->removeFileDirectory(Ljava/io/File;)V

    .line 204
    :cond_0
    const-wide/16 v7, 0x1f4

    :try_start_0
    invoke-static {v7, v8}, Ljava/lang/Thread;->sleep(J)V
    :try_end_0
    .catch Ljava/lang/InterruptedException; {:try_start_0 .. :try_end_0} :catch_0

    .line 210
    :goto_0
    invoke-static {}, Ljava/lang/System;->gc()V

    .line 212
    iget-object v7, p0, Lcom/youai/dreamonepiece/GameLogoState$1;->this$0:Lcom/youai/dreamonepiece/GameLogoState;

    invoke-static {v7}, Lcom/youai/dreamonepiece/GameLogoState;->access$000(Lcom/youai/dreamonepiece/GameLogoState;)Lcom/youai/IGameActivity;

    move-result-object v7

    invoke-interface {v7}, Lcom/youai/IGameActivity;->getActivity()Lcom/youai/dreamonepiece/GameActivity;

    move-result-object v7

    const-string v8, "ResourcesInfo"

    invoke-virtual {v7, v8, v9}, Lcom/youai/dreamonepiece/GameActivity;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v5

    .line 216
    .local v5, "sp":Landroid/content/SharedPreferences;
    invoke-interface {v5}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v1

    .line 217
    .local v1, "edit":Landroid/content/SharedPreferences$Editor;
    const-string v7, "UnzipedAssets"

    invoke-interface {v1, v7, v9}, Landroid/content/SharedPreferences$Editor;->putBoolean(Ljava/lang/String;Z)Landroid/content/SharedPreferences$Editor;

    .line 218
    invoke-interface {v1}, Landroid/content/SharedPreferences$Editor;->apply()V

    .line 220
    iget-object v7, p0, Lcom/youai/dreamonepiece/GameLogoState$1;->this$0:Lcom/youai/dreamonepiece/GameLogoState;

    invoke-static {v7, v9}, Lcom/youai/dreamonepiece/GameLogoState;->access$102(Lcom/youai/dreamonepiece/GameLogoState;Z)Z

    .line 222
    invoke-interface {v5}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v2

    .line 223
    .local v2, "edit1":Landroid/content/SharedPreferences$Editor;
    const-string v7, "StorageFullPath"

    const-string v8, ""

    invoke-interface {v2, v7, v8}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    .line 224
    invoke-interface {v2}, Landroid/content/SharedPreferences$Editor;->apply()V

    .line 226
    iget-object v7, p0, Lcom/youai/dreamonepiece/GameLogoState$1;->this$0:Lcom/youai/dreamonepiece/GameLogoState;

    invoke-static {v7}, Lcom/youai/dreamonepiece/GameLogoState;->access$200(Lcom/youai/dreamonepiece/GameLogoState;)V

    .line 228
    iget-object v7, p0, Lcom/youai/dreamonepiece/GameLogoState$1;->this$0:Lcom/youai/dreamonepiece/GameLogoState;

    invoke-static {v7}, Lcom/youai/dreamonepiece/GameLogoState;->access$400(Lcom/youai/dreamonepiece/GameLogoState;)Lcom/youai/dreamonepiece/GameInterface$IGameLogoStateCallback;

    move-result-object v7

    iget-object v8, p0, Lcom/youai/dreamonepiece/GameLogoState$1;->this$0:Lcom/youai/dreamonepiece/GameLogoState;

    invoke-static {v8}, Lcom/youai/dreamonepiece/GameLogoState;->access$300(Lcom/youai/dreamonepiece/GameLogoState;)Ljava/lang/String;

    move-result-object v8

    invoke-interface {v7, v8}, Lcom/youai/dreamonepiece/GameInterface$IGameLogoStateCallback;->initAppDataPath(Ljava/lang/String;)V

    .line 230
    iget-object v7, p0, Lcom/youai/dreamonepiece/GameLogoState$1;->this$0:Lcom/youai/dreamonepiece/GameLogoState;

    invoke-static {v7}, Lcom/youai/dreamonepiece/GameLogoState;->access$500(Lcom/youai/dreamonepiece/GameLogoState;)V

    .line 232
    iget-object v7, p0, Lcom/youai/dreamonepiece/GameLogoState$1;->this$0:Lcom/youai/dreamonepiece/GameLogoState;

    invoke-static {v7}, Lcom/youai/dreamonepiece/GameLogoState;->access$600(Lcom/youai/dreamonepiece/GameLogoState;)Lcom/youai/dreamonepiece/GameLogoState$GameLogoStateHandler;

    move-result-object v7

    const/4 v8, 0x4

    invoke-virtual {v7, v8, v10, v11}, Lcom/youai/dreamonepiece/GameLogoState$GameLogoStateHandler;->sendEmptyMessageDelayed(IJ)Z

    .line 235
    return-void

    .line 205
    .end local v1    # "edit":Landroid/content/SharedPreferences$Editor;
    .end local v2    # "edit1":Landroid/content/SharedPreferences$Editor;
    .end local v5    # "sp":Landroid/content/SharedPreferences;
    :catch_0
    move-exception v0

    .line 207
    .local v0, "e":Ljava/lang/InterruptedException;
    invoke-virtual {v0}, Ljava/lang/InterruptedException;->printStackTrace()V

    goto :goto_0
.end method
