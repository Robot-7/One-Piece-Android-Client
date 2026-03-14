.class public Lcom/youai/GameActivityHelper;
.super Ljava/lang/Object;
.source "GameActivityHelper.java"


# static fields
.field static mContext:Landroid/content/Context;


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 20
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static isInstallWeChat(Landroid/content/Context;Landroid/os/Handler;)Z
    .locals 6
    .param p0, "pContext"    # Landroid/content/Context;
    .param p1, "pMainHandler"    # Landroid/os/Handler;

    .prologue
    const/4 v2, 0x0

    .line 118
    :try_start_0
    invoke-virtual {p0}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v3

    const-string v4, "com.tencent.mm"

    const/4 v5, 0x0

    invoke-virtual {v3, v4, v5}, Landroid/content/pm/PackageManager;->getPackageInfo(Ljava/lang/String;I)Landroid/content/pm/PackageInfo;
    :try_end_0
    .catch Landroid/content/pm/PackageManager$NameNotFoundException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v1

    .line 124
    .local v1, "packageInfo":Landroid/content/pm/PackageInfo;
    :goto_0
    if-nez v1, :cond_0

    .line 127
    :goto_1
    return v2

    .line 120
    .end local v1    # "packageInfo":Landroid/content/pm/PackageInfo;
    :catch_0
    move-exception v0

    .line 121
    .local v0, "e":Landroid/content/pm/PackageManager$NameNotFoundException;
    const/4 v1, 0x0

    .restart local v1    # "packageInfo":Landroid/content/pm/PackageInfo;
    goto :goto_0

    .line 127
    .end local v0    # "e":Landroid/content/pm/PackageManager$NameNotFoundException;
    :cond_0
    const/4 v2, 0x1

    goto :goto_1
.end method

.method public static noWeChatDialog(Landroid/content/Context;Landroid/os/Handler;)V
    .locals 1
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "pMainHandler"    # Landroid/os/Handler;

    .prologue
    .line 78
    new-instance v0, Lcom/youai/GameActivityHelper$2;

    invoke-direct {v0, p0}, Lcom/youai/GameActivityHelper$2;-><init>(Landroid/content/Context;)V

    invoke-virtual {p1, v0}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 112
    return-void
.end method

.method public static openCLD(Ljava/lang/String;Landroid/content/Context;)V
    .locals 12
    .param p0, "packageName"    # Ljava/lang/String;
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    const/4 v11, 0x0

    .line 42
    invoke-virtual {p1}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v5

    .line 43
    .local v5, "packageManager":Landroid/content/pm/PackageManager;
    const/4 v6, 0x0

    .line 47
    .local v6, "pi":Landroid/content/pm/PackageInfo;
    const/4 v9, 0x0

    :try_start_0
    invoke-virtual {v5, p0, v9}, Landroid/content/pm/PackageManager;->getPackageInfo(Ljava/lang/String;I)Landroid/content/pm/PackageInfo;
    :try_end_0
    .catch Landroid/content/pm/PackageManager$NameNotFoundException; {:try_start_0 .. :try_end_0} :catch_1

    move-result-object v6

    .line 51
    :goto_0
    new-instance v7, Landroid/content/Intent;

    const-string v9, "android.intent.action.MAIN"

    const/4 v10, 0x0

    invoke-direct {v7, v9, v10}, Landroid/content/Intent;-><init>(Ljava/lang/String;Landroid/net/Uri;)V

    .line 52
    .local v7, "resolveIntent":Landroid/content/Intent;
    const-string v9, "android.intent.category.LAUNCHER"

    invoke-virtual {v7, v9}, Landroid/content/Intent;->addCategory(Ljava/lang/String;)Landroid/content/Intent;

    .line 53
    iget-object v9, v6, Landroid/content/pm/PackageInfo;->packageName:Ljava/lang/String;

    invoke-virtual {v7, v9}, Landroid/content/Intent;->setPackage(Ljava/lang/String;)Landroid/content/Intent;

    .line 55
    invoke-virtual {v5, v7, v11}, Landroid/content/pm/PackageManager;->queryIntentActivities(Landroid/content/Intent;I)Ljava/util/List;

    move-result-object v0

    .line 58
    .local v0, "apps":Ljava/util/List;, "Ljava/util/List<Landroid/content/pm/ResolveInfo;>;"
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v9

    invoke-interface {v9}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Landroid/content/pm/ResolveInfo;

    .line 59
    .local v8, "ri":Landroid/content/pm/ResolveInfo;
    if-eqz v8, :cond_0

    .line 60
    iget-object v9, v8, Landroid/content/pm/ResolveInfo;->activityInfo:Landroid/content/pm/ActivityInfo;

    iget-object v1, v9, Landroid/content/pm/ActivityInfo;->name:Ljava/lang/String;

    .line 61
    .local v1, "className":Ljava/lang/String;
    new-instance v4, Landroid/content/Intent;

    const-string v9, "android.intent.action.MAIN"

    invoke-direct {v4, v9}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 62
    .local v4, "intent":Landroid/content/Intent;
    const-string v9, "android.intent.category.LAUNCHER"

    invoke-virtual {v4, v9}, Landroid/content/Intent;->addCategory(Ljava/lang/String;)Landroid/content/Intent;

    .line 63
    new-instance v2, Landroid/content/ComponentName;

    invoke-direct {v2, p0, v1}, Landroid/content/ComponentName;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 64
    .local v2, "cn":Landroid/content/ComponentName;
    invoke-virtual {v4, v2}, Landroid/content/Intent;->setComponent(Landroid/content/ComponentName;)Landroid/content/Intent;

    .line 65
    const/high16 v9, 0x10000000

    invoke-virtual {v4, v9}, Landroid/content/Intent;->setFlags(I)Landroid/content/Intent;

    .line 66
    const-string v9, "android.intent.action.VIEW"

    invoke-virtual {v4, v9}, Landroid/content/Intent;->setAction(Ljava/lang/String;)Landroid/content/Intent;

    .line 68
    :try_start_1
    invoke-virtual {p1, v4}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    .line 74
    .end local v1    # "className":Ljava/lang/String;
    .end local v2    # "cn":Landroid/content/ComponentName;
    .end local v4    # "intent":Landroid/content/Intent;
    :cond_0
    :goto_1
    return-void

    .line 69
    .restart local v1    # "className":Ljava/lang/String;
    .restart local v2    # "cn":Landroid/content/ComponentName;
    .restart local v4    # "intent":Landroid/content/Intent;
    :catch_0
    move-exception v3

    .line 70
    .local v3, "e":Ljava/lang/Exception;
    const-string v9, "GameActivityHelp"

    invoke-virtual {v3}, Ljava/lang/Exception;->toString()Ljava/lang/String;

    move-result-object v10

    invoke-static {v9, v10}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_1

    .line 48
    .end local v0    # "apps":Ljava/util/List;, "Ljava/util/List<Landroid/content/pm/ResolveInfo;>;"
    .end local v1    # "className":Ljava/lang/String;
    .end local v2    # "cn":Landroid/content/ComponentName;
    .end local v3    # "e":Ljava/lang/Exception;
    .end local v4    # "intent":Landroid/content/Intent;
    .end local v7    # "resolveIntent":Landroid/content/Intent;
    .end local v8    # "ri":Landroid/content/pm/ResolveInfo;
    :catch_1
    move-exception v9

    goto :goto_0
.end method

.method public static openWeChat(Landroid/content/Context;Landroid/os/Handler;)V
    .locals 1
    .param p0, "pContext"    # Landroid/content/Context;
    .param p1, "pMainHandler"    # Landroid/os/Handler;

    .prologue
    .line 134
    invoke-static {p0, p1}, Lcom/youai/GameActivityHelper;->isInstallWeChat(Landroid/content/Context;Landroid/os/Handler;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 135
    new-instance v0, Lcom/youai/GameActivityHelper$3;

    invoke-direct {v0, p0}, Lcom/youai/GameActivityHelper$3;-><init>(Landroid/content/Context;)V

    invoke-virtual {p1, v0}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 160
    :goto_0
    return-void

    .line 151
    :cond_0
    new-instance v0, Lcom/youai/GameActivityHelper$4;

    invoke-direct {v0, p0, p1}, Lcom/youai/GameActivityHelper$4;-><init>(Landroid/content/Context;Landroid/os/Handler;)V

    invoke-virtual {p1, v0}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    goto :goto_0
.end method

.method public static requestRestart(Landroid/content/Context;Landroid/os/Handler;)V
    .locals 1
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "pManHandler"    # Landroid/os/Handler;

    .prologue
    .line 27
    new-instance v0, Lcom/youai/GameActivityHelper$1;

    invoke-direct {v0, p0}, Lcom/youai/GameActivityHelper$1;-><init>(Landroid/content/Context;)V

    invoke-virtual {p1, v0}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 39
    return-void
.end method
