.class public Lcom/youai/sdks/PlatformSdk;
.super Ljava/lang/Object;
.source "PlatformSdk.java"


# static fields
.field private static final TAG:Ljava/lang/String; = "PlatformSdk"

.field private static volatile singleton:Lcom/youai/sdks/PlatformSdk;


# instance fields
.field private clazz:Ljava/lang/Class;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/Class",
            "<*>;"
        }
    .end annotation
.end field

.field private platformInfo:Lcom/youai/sdks/beans/PlatformInfo;

.field private platformInstance:Lcom/youai/sdks/platform/PlatformBase;


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 26
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 29
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/youai/sdks/PlatformSdk;->platformInstance:Lcom/youai/sdks/platform/PlatformBase;

    .line 26
    return-void
.end method

.method public static getInstance()Lcom/youai/sdks/PlatformSdk;
    .locals 2

    .prologue
    .line 35
    sget-object v0, Lcom/youai/sdks/PlatformSdk;->singleton:Lcom/youai/sdks/PlatformSdk;

    if-nez v0, :cond_1

    .line 36
    const-class v1, Lcom/youai/sdks/PlatformSdk;

    monitor-enter v1

    .line 37
    :try_start_0
    sget-object v0, Lcom/youai/sdks/PlatformSdk;->singleton:Lcom/youai/sdks/PlatformSdk;

    if-nez v0, :cond_0

    .line 38
    new-instance v0, Lcom/youai/sdks/PlatformSdk;

    invoke-direct {v0}, Lcom/youai/sdks/PlatformSdk;-><init>()V

    sput-object v0, Lcom/youai/sdks/PlatformSdk;->singleton:Lcom/youai/sdks/PlatformSdk;

    .line 36
    :cond_0
    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 42
    :cond_1
    sget-object v0, Lcom/youai/sdks/PlatformSdk;->singleton:Lcom/youai/sdks/PlatformSdk;

    return-object v0

    .line 36
    :catchall_0
    move-exception v0

    :try_start_1
    monitor-exit v1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v0
.end method

.method private initPlatformInstance(Lcom/youai/sdks/beans/PlatformInfo;)V
    .locals 4
    .param p1, "platformInfo"    # Lcom/youai/sdks/beans/PlatformInfo;

    .prologue
    .line 201
    iget-object v2, p0, Lcom/youai/sdks/PlatformSdk;->platformInstance:Lcom/youai/sdks/platform/PlatformBase;

    if-eqz v2, :cond_0

    .line 223
    :goto_0
    return-void

    .line 204
    :cond_0
    invoke-static {}, Lcom/youai/sdks/PlatformRegistery;->getInstance()Lcom/youai/sdks/PlatformRegistery;

    move-result-object v2

    .line 205
    iget v3, p1, Lcom/youai/sdks/beans/PlatformInfo;->platform:I

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-virtual {v2, v3}, Lcom/youai/sdks/PlatformRegistery;->getPlatformClassForType(Ljava/lang/Integer;)Ljava/lang/String;

    move-result-object v0

    .line 206
    .local v0, "className":Ljava/lang/String;
    new-instance v2, Ljava/lang/StringBuilder;

    const-string v3, "sdk init "

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Lcom/youai/sdks/utils/YALog;->i(Ljava/lang/String;)V

    .line 209
    :try_start_0
    invoke-static {v0}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v2

    iput-object v2, p0, Lcom/youai/sdks/PlatformSdk;->clazz:Ljava/lang/Class;

    .line 210
    iget-object v2, p0, Lcom/youai/sdks/PlatformSdk;->clazz:Ljava/lang/Class;

    invoke-virtual {v2}, Ljava/lang/Class;->newInstance()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/youai/sdks/platform/PlatformBase;

    iput-object v2, p0, Lcom/youai/sdks/PlatformSdk;->platformInstance:Lcom/youai/sdks/platform/PlatformBase;
    :try_end_0
    .catch Ljava/lang/ClassNotFoundException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/lang/InstantiationException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/IllegalAccessException; {:try_start_0 .. :try_end_0} :catch_2
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_3

    goto :goto_0

    .line 211
    :catch_0
    move-exception v1

    .line 212
    .local v1, "e":Ljava/lang/ClassNotFoundException;
    const-string v2, "PlatformSdk"

    const-string v3, "\u83b7\u53d6\u4e0d\u5230\u7c7b\u540d"

    invoke-static {v2, v3}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 213
    invoke-virtual {v1}, Ljava/lang/ClassNotFoundException;->printStackTrace()V

    goto :goto_0

    .line 214
    .end local v1    # "e":Ljava/lang/ClassNotFoundException;
    :catch_1
    move-exception v1

    .line 215
    .local v1, "e":Ljava/lang/InstantiationException;
    const-string v2, "PlatformSdk"

    const-string v3, "\u8fdd\u6cd5\u7684\u8bbf\u95ee\u5f02\u5e38\uff0c\u627e\u4e0d\u5230\u6784\u9020\u65b9\u6cd5"

    invoke-static {v2, v3}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 216
    invoke-virtual {v1}, Ljava/lang/InstantiationException;->printStackTrace()V

    goto :goto_0

    .line 217
    .end local v1    # "e":Ljava/lang/InstantiationException;
    :catch_2
    move-exception v1

    .line 218
    .local v1, "e":Ljava/lang/IllegalAccessException;
    const-string v2, "PlatformSdk"

    const-string v3, "\u8fdd\u6cd5\u7684\u8bbf\u95ee\u5f02\u5e38\uff0c\u627e\u4e0d\u5230\u6784\u9020\u65b9\u6cd5"

    invoke-static {v2, v3}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 219
    invoke-virtual {v1}, Ljava/lang/IllegalAccessException;->printStackTrace()V

    goto :goto_0

    .line 220
    .end local v1    # "e":Ljava/lang/IllegalAccessException;
    :catch_3
    move-exception v1

    .line 221
    .local v1, "e":Ljava/lang/Exception;
    const-string v2, "PlatformSdk"

    const-string v3, "\u521d\u59cb\u5316\u5931\u8d25"

    invoke-static {v2, v3}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0
.end method


# virtual methods
.method public attachBaseContext(Landroid/content/Context;Lcom/youai/sdks/beans/PlatformInfo;)V
    .locals 1
    .param p1, "base"    # Landroid/content/Context;
    .param p2, "platformInfo"    # Lcom/youai/sdks/beans/PlatformInfo;

    .prologue
    .line 134
    const-string v0, "attachBaseContext"

    invoke-static {v0}, Lcom/youai/sdks/utils/YALog;->i(Ljava/lang/String;)V

    .line 135
    iput-object p2, p0, Lcom/youai/sdks/PlatformSdk;->platformInfo:Lcom/youai/sdks/beans/PlatformInfo;

    .line 136
    invoke-direct {p0, p2}, Lcom/youai/sdks/PlatformSdk;->initPlatformInstance(Lcom/youai/sdks/beans/PlatformInfo;)V

    .line 137
    iget-object v0, p0, Lcom/youai/sdks/PlatformSdk;->platformInstance:Lcom/youai/sdks/platform/PlatformBase;

    invoke-virtual {v0, p1, p2}, Lcom/youai/sdks/platform/PlatformBase;->attachBaseContext(Landroid/content/Context;Lcom/youai/sdks/beans/PlatformInfo;)V

    .line 138
    return-void
.end method

.method public callCheckVersionUpate()V
    .locals 1

    .prologue
    .line 266
    const-string v0, "callCheckVersionUpate"

    invoke-static {v0}, Lcom/youai/sdks/utils/YALog;->i(Ljava/lang/String;)V

    .line 267
    iget-object v0, p0, Lcom/youai/sdks/PlatformSdk;->platformInstance:Lcom/youai/sdks/platform/PlatformBase;

    invoke-virtual {v0}, Lcom/youai/sdks/platform/PlatformBase;->callCheckVersionUpate()V

    .line 268
    return-void
.end method

.method public callToolBar(Z)V
    .locals 2
    .param p1, "visible"    # Z

    .prologue
    .line 69
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "callToolBar visible = "

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/youai/sdks/utils/YALog;->i(Ljava/lang/String;)V

    .line 71
    iget-object v0, p0, Lcom/youai/sdks/PlatformSdk;->platformInstance:Lcom/youai/sdks/platform/PlatformBase;

    invoke-virtual {v0, p1}, Lcom/youai/sdks/platform/PlatformBase;->callToolBar(Z)V

    .line 72
    return-void
.end method

.method public excute(Ljava/lang/String;Ljava/util/HashMap;Lcom/youai/sdks/callback/CallbackListener;)I
    .locals 8
    .param p1, "functionName"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;",
            "Lcom/youai/sdks/callback/CallbackListener",
            "<*>;)I"
        }
    .end annotation

    .prologue
    .local p2, "params":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;"
    .local p3, "callbackListener":Lcom/youai/sdks/callback/CallbackListener;, "Lcom/youai/sdks/callback/CallbackListener<*>;"
    const/4 v3, 0x0

    const/4 v2, -0x1

    .line 227
    iget-object v4, p0, Lcom/youai/sdks/PlatformSdk;->platformInstance:Lcom/youai/sdks/platform/PlatformBase;

    if-nez v4, :cond_0

    .line 247
    :goto_0
    return v2

    .line 231
    :cond_0
    :try_start_0
    iget-object v4, p0, Lcom/youai/sdks/PlatformSdk;->clazz:Ljava/lang/Class;

    .line 232
    const/4 v5, 0x2

    new-array v5, v5, [Ljava/lang/Class;

    const/4 v6, 0x0

    const-class v7, Ljava/util/HashMap;

    aput-object v7, v5, v6

    const/4 v6, 0x1

    const-class v7, Lcom/youai/sdks/callback/CallbackListener;

    aput-object v7, v5, v6

    .line 231
    invoke-virtual {v4, p1, v5}, Ljava/lang/Class;->getDeclaredMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v0

    .line 233
    .local v0, "declaredMethod":Ljava/lang/reflect/Method;
    iget-object v4, p0, Lcom/youai/sdks/PlatformSdk;->platformInstance:Lcom/youai/sdks/platform/PlatformBase;

    const/4 v5, 0x2

    new-array v5, v5, [Ljava/lang/Object;

    const/4 v6, 0x0

    aput-object p2, v5, v6

    const/4 v6, 0x1

    aput-object p3, v5, v6

    invoke-virtual {v0, v4, v5}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_0
    .catch Ljava/lang/NoSuchMethodException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/lang/IllegalArgumentException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/IllegalAccessException; {:try_start_0 .. :try_end_0} :catch_2
    .catch Ljava/lang/reflect/InvocationTargetException; {:try_start_0 .. :try_end_0} :catch_3

    move v2, v3

    .line 247
    goto :goto_0

    .line 234
    .end local v0    # "declaredMethod":Ljava/lang/reflect/Method;
    :catch_0
    move-exception v1

    .line 235
    .local v1, "e":Ljava/lang/NoSuchMethodException;
    invoke-virtual {v1}, Ljava/lang/NoSuchMethodException;->printStackTrace()V

    goto :goto_0

    .line 237
    .end local v1    # "e":Ljava/lang/NoSuchMethodException;
    :catch_1
    move-exception v1

    .line 238
    .local v1, "e":Ljava/lang/IllegalArgumentException;
    invoke-virtual {v1}, Ljava/lang/IllegalArgumentException;->printStackTrace()V

    goto :goto_0

    .line 240
    .end local v1    # "e":Ljava/lang/IllegalArgumentException;
    :catch_2
    move-exception v1

    .line 241
    .local v1, "e":Ljava/lang/IllegalAccessException;
    invoke-virtual {v1}, Ljava/lang/IllegalAccessException;->printStackTrace()V

    goto :goto_0

    .line 243
    .end local v1    # "e":Ljava/lang/IllegalAccessException;
    :catch_3
    move-exception v1

    .line 244
    .local v1, "e":Ljava/lang/reflect/InvocationTargetException;
    invoke-virtual {v1}, Ljava/lang/reflect/InvocationTargetException;->printStackTrace()V

    goto :goto_0
.end method

.method public getLoginInfo()Lcom/youai/sdks/beans/LoginInfo;
    .locals 1

    .prologue
    .line 84
    iget-object v0, p0, Lcom/youai/sdks/PlatformSdk;->platformInstance:Lcom/youai/sdks/platform/PlatformBase;

    invoke-virtual {v0}, Lcom/youai/sdks/platform/PlatformBase;->getLoginInfo()Lcom/youai/sdks/beans/LoginInfo;

    move-result-object v0

    return-object v0
.end method

.method public getPlatformName(I)Ljava/lang/String;
    .locals 2
    .param p1, "type"    # I

    .prologue
    .line 46
    invoke-static {}, Lcom/youai/sdks/PlatformRegistery;->getInstance()Lcom/youai/sdks/PlatformRegistery;

    move-result-object v0

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/youai/sdks/PlatformRegistery;->getPlatformClassForType(Ljava/lang/Integer;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public init(Landroid/app/Activity;Lcom/youai/sdks/beans/AppInfo;Lcom/youai/sdks/beans/PlatformInfo;Lcom/youai/sdks/callback/YASdkInterface;)V
    .locals 2
    .param p1, "activity"    # Landroid/app/Activity;
    .param p2, "appinfo"    # Lcom/youai/sdks/beans/AppInfo;
    .param p3, "platformInfo"    # Lcom/youai/sdks/beans/PlatformInfo;
    .param p4, "sdkListener"    # Lcom/youai/sdks/callback/YASdkInterface;

    .prologue
    .line 52
    iput-object p3, p0, Lcom/youai/sdks/PlatformSdk;->platformInfo:Lcom/youai/sdks/beans/PlatformInfo;

    .line 53
    iget-object v0, p0, Lcom/youai/sdks/PlatformSdk;->platformInfo:Lcom/youai/sdks/beans/PlatformInfo;

    invoke-static {v0}, Lcom/youai/sdks/utils/YALog;->i(Ljava/lang/Object;)V

    .line 54
    invoke-direct {p0, p3}, Lcom/youai/sdks/PlatformSdk;->initPlatformInstance(Lcom/youai/sdks/beans/PlatformInfo;)V

    .line 55
    iget-object v0, p0, Lcom/youai/sdks/PlatformSdk;->platformInstance:Lcom/youai/sdks/platform/PlatformBase;

    iget-object v1, p0, Lcom/youai/sdks/PlatformSdk;->platformInfo:Lcom/youai/sdks/beans/PlatformInfo;

    invoke-virtual {v0, p1, v1, p4}, Lcom/youai/sdks/platform/PlatformBase;->init(Landroid/app/Activity;Lcom/youai/sdks/beans/PlatformInfo;Lcom/youai/sdks/callback/YASdkInterface;)V

    .line 56
    return-void
.end method

.method public isTryUser()Z
    .locals 1

    .prologue
    .line 256
    const-string v0, "isTryUser"

    invoke-static {v0}, Lcom/youai/sdks/utils/YALog;->i(Ljava/lang/String;)V

    .line 257
    iget-object v0, p0, Lcom/youai/sdks/PlatformSdk;->platformInstance:Lcom/youai/sdks/platform/PlatformBase;

    invoke-virtual {v0}, Lcom/youai/sdks/platform/PlatformBase;->isTryUser()Z

    move-result v0

    return v0
.end method

.method public login(Landroid/app/Activity;)V
    .locals 1
    .param p1, "context"    # Landroid/app/Activity;

    .prologue
    .line 79
    const-string v0, "login"

    invoke-static {v0}, Lcom/youai/sdks/utils/YALog;->i(Ljava/lang/String;)V

    .line 80
    iget-object v0, p0, Lcom/youai/sdks/PlatformSdk;->platformInstance:Lcom/youai/sdks/platform/PlatformBase;

    invoke-virtual {v0, p1}, Lcom/youai/sdks/platform/PlatformBase;->callLogin(Landroid/app/Activity;)V

    .line 81
    return-void
.end method

.method public logout(Landroid/app/Activity;)V
    .locals 1
    .param p1, "context"    # Landroid/app/Activity;

    .prologue
    .line 88
    const-string v0, "logout"

    invoke-static {v0}, Lcom/youai/sdks/utils/YALog;->i(Ljava/lang/String;)V

    .line 89
    iget-object v0, p0, Lcom/youai/sdks/PlatformSdk;->platformInstance:Lcom/youai/sdks/platform/PlatformBase;

    invoke-virtual {v0, p1}, Lcom/youai/sdks/platform/PlatformBase;->callLogout(Landroid/app/Activity;)V

    .line 90
    return-void
.end method

.method public onActivityCreate(Landroid/app/Activity;Lcom/youai/sdks/beans/PlatformInfo;)V
    .locals 1
    .param p1, "activity"    # Landroid/app/Activity;
    .param p2, "platformInfo"    # Lcom/youai/sdks/beans/PlatformInfo;

    .prologue
    .line 146
    const-string v0, "onCreate"

    invoke-static {v0}, Lcom/youai/sdks/utils/YALog;->i(Ljava/lang/String;)V

    .line 147
    iget-object v0, p0, Lcom/youai/sdks/PlatformSdk;->platformInstance:Lcom/youai/sdks/platform/PlatformBase;

    invoke-virtual {v0, p1, p2}, Lcom/youai/sdks/platform/PlatformBase;->callCreate(Landroid/app/Activity;Lcom/youai/sdks/beans/PlatformInfo;)V

    .line 148
    return-void
.end method

.method public onActivityResult(IILandroid/content/Intent;)V
    .locals 1
    .param p1, "requestCode"    # I
    .param p2, "resultCode"    # I
    .param p3, "data"    # Landroid/content/Intent;

    .prologue
    .line 129
    const-string v0, "onActivityResult"

    invoke-static {v0}, Lcom/youai/sdks/utils/YALog;->i(Ljava/lang/String;)V

    .line 130
    iget-object v0, p0, Lcom/youai/sdks/PlatformSdk;->platformInstance:Lcom/youai/sdks/platform/PlatformBase;

    invoke-virtual {v0, p1, p2, p3}, Lcom/youai/sdks/platform/PlatformBase;->onActivityResult(IILandroid/content/Intent;)V

    .line 131
    return-void
.end method

.method public onApplicationCreate(Landroid/content/Context;Lcom/youai/sdks/beans/PlatformInfo;)V
    .locals 1
    .param p1, "base"    # Landroid/content/Context;
    .param p2, "platformInfo"    # Lcom/youai/sdks/beans/PlatformInfo;

    .prologue
    .line 141
    const-string v0, "ApplicationCreate"

    invoke-static {v0}, Lcom/youai/sdks/utils/YALog;->i(Ljava/lang/String;)V

    .line 142
    iget-object v0, p0, Lcom/youai/sdks/PlatformSdk;->platformInstance:Lcom/youai/sdks/platform/PlatformBase;

    invoke-virtual {v0, p1, p2}, Lcom/youai/sdks/platform/PlatformBase;->callCreate(Landroid/content/Context;Lcom/youai/sdks/beans/PlatformInfo;)V

    .line 143
    return-void
.end method

.method public onDestroy()V
    .locals 1

    .prologue
    .line 181
    const-string v0, "onDestroy"

    invoke-static {v0}, Lcom/youai/sdks/utils/YALog;->i(Ljava/lang/String;)V

    .line 182
    iget-object v0, p0, Lcom/youai/sdks/PlatformSdk;->platformInstance:Lcom/youai/sdks/platform/PlatformBase;

    invoke-virtual {v0}, Lcom/youai/sdks/platform/PlatformBase;->callDestroy()V

    .line 183
    return-void
.end method

.method public onDestroy(Landroid/app/Activity;)V
    .locals 1
    .param p1, "acitvity"    # Landroid/app/Activity;

    .prologue
    .line 186
    const-string v0, "onDestroy"

    invoke-static {v0}, Lcom/youai/sdks/utils/YALog;->i(Ljava/lang/String;)V

    .line 187
    iget-object v0, p0, Lcom/youai/sdks/PlatformSdk;->platformInstance:Lcom/youai/sdks/platform/PlatformBase;

    invoke-virtual {v0, p1}, Lcom/youai/sdks/platform/PlatformBase;->callDestroy(Landroid/app/Activity;)V

    .line 188
    return-void
.end method

.method public onGameExit()V
    .locals 1

    .prologue
    .line 251
    const-string v0, "onGameExit"

    invoke-static {v0}, Lcom/youai/sdks/utils/YALog;->i(Ljava/lang/String;)V

    .line 252
    iget-object v0, p0, Lcom/youai/sdks/PlatformSdk;->platformInstance:Lcom/youai/sdks/platform/PlatformBase;

    invoke-virtual {v0}, Lcom/youai/sdks/platform/PlatformBase;->onGameExit()V

    .line 253
    return-void
.end method

.method public onPause(Landroid/app/Activity;)V
    .locals 1
    .param p1, "activity"    # Landroid/app/Activity;

    .prologue
    .line 156
    const-string v0, "onPause"

    invoke-static {v0}, Lcom/youai/sdks/utils/YALog;->i(Ljava/lang/String;)V

    .line 157
    iget-object v0, p0, Lcom/youai/sdks/PlatformSdk;->platformInstance:Lcom/youai/sdks/platform/PlatformBase;

    invoke-virtual {v0, p1}, Lcom/youai/sdks/platform/PlatformBase;->callPause(Landroid/app/Activity;)V

    .line 158
    return-void
.end method

.method public onRestart()V
    .locals 1

    .prologue
    .line 171
    const-string v0, "onStart"

    invoke-static {v0}, Lcom/youai/sdks/utils/YALog;->i(Ljava/lang/String;)V

    .line 172
    iget-object v0, p0, Lcom/youai/sdks/PlatformSdk;->platformInstance:Lcom/youai/sdks/platform/PlatformBase;

    invoke-virtual {v0}, Lcom/youai/sdks/platform/PlatformBase;->callReStart()V

    .line 173
    return-void
.end method

.method public onRestart(Landroid/app/Activity;)V
    .locals 1
    .param p1, "activity"    # Landroid/app/Activity;

    .prologue
    .line 176
    const-string v0, "onStart"

    invoke-static {v0}, Lcom/youai/sdks/utils/YALog;->i(Ljava/lang/String;)V

    .line 177
    iget-object v0, p0, Lcom/youai/sdks/PlatformSdk;->platformInstance:Lcom/youai/sdks/platform/PlatformBase;

    invoke-virtual {v0, p1}, Lcom/youai/sdks/platform/PlatformBase;->callReStart(Landroid/app/Activity;)V

    .line 178
    return-void
.end method

.method public onResume(Landroid/app/Activity;)V
    .locals 1
    .param p1, "activity"    # Landroid/app/Activity;

    .prologue
    .line 151
    const-string v0, "onResume"

    invoke-static {v0}, Lcom/youai/sdks/utils/YALog;->i(Ljava/lang/String;)V

    .line 152
    iget-object v0, p0, Lcom/youai/sdks/PlatformSdk;->platformInstance:Lcom/youai/sdks/platform/PlatformBase;

    invoke-virtual {v0, p1}, Lcom/youai/sdks/platform/PlatformBase;->callResume(Landroid/app/Activity;)V

    .line 153
    return-void
.end method

.method public onStart()V
    .locals 1

    .prologue
    .line 161
    const-string v0, "onStart"

    invoke-static {v0}, Lcom/youai/sdks/utils/YALog;->i(Ljava/lang/String;)V

    .line 162
    iget-object v0, p0, Lcom/youai/sdks/PlatformSdk;->platformInstance:Lcom/youai/sdks/platform/PlatformBase;

    invoke-virtual {v0}, Lcom/youai/sdks/platform/PlatformBase;->callStart()V

    .line 163
    return-void
.end method

.method public onStart(Landroid/app/Activity;)V
    .locals 1
    .param p1, "activity"    # Landroid/app/Activity;

    .prologue
    .line 166
    const-string v0, "onStart"

    invoke-static {v0}, Lcom/youai/sdks/utils/YALog;->i(Ljava/lang/String;)V

    .line 167
    iget-object v0, p0, Lcom/youai/sdks/PlatformSdk;->platformInstance:Lcom/youai/sdks/platform/PlatformBase;

    invoke-virtual {v0, p1}, Lcom/youai/sdks/platform/PlatformBase;->callStart(Landroid/app/Activity;)V

    .line 168
    return-void
.end method

.method public onStop()V
    .locals 1

    .prologue
    .line 191
    const-string v0, "onStop"

    invoke-static {v0}, Lcom/youai/sdks/utils/YALog;->i(Ljava/lang/String;)V

    .line 192
    iget-object v0, p0, Lcom/youai/sdks/PlatformSdk;->platformInstance:Lcom/youai/sdks/platform/PlatformBase;

    invoke-virtual {v0}, Lcom/youai/sdks/platform/PlatformBase;->callStop()V

    .line 193
    return-void
.end method

.method public onStop(Landroid/app/Activity;)V
    .locals 1
    .param p1, "acitvity"    # Landroid/app/Activity;

    .prologue
    .line 196
    const-string v0, "onStop"

    invoke-static {v0}, Lcom/youai/sdks/utils/YALog;->i(Ljava/lang/String;)V

    .line 197
    iget-object v0, p0, Lcom/youai/sdks/PlatformSdk;->platformInstance:Lcom/youai/sdks/platform/PlatformBase;

    invoke-virtual {v0, p1}, Lcom/youai/sdks/platform/PlatformBase;->callStop(Landroid/app/Activity;)V

    .line 198
    return-void
.end method

.method public onWindowFocusChanged(Z)V
    .locals 1
    .param p1, "hasFocus"    # Z

    .prologue
    .line 271
    const-string v0, "onWindowFocusChanged"

    invoke-static {v0}, Lcom/youai/sdks/utils/YALog;->i(Ljava/lang/String;)V

    .line 272
    iget-object v0, p0, Lcom/youai/sdks/PlatformSdk;->platformInstance:Lcom/youai/sdks/platform/PlatformBase;

    invoke-virtual {v0, p1}, Lcom/youai/sdks/platform/PlatformBase;->onWindowFocusChanged(Z)V

    .line 273
    return-void
.end method

.method public reserve()V
    .locals 1

    .prologue
    .line 261
    const-string v0, "reserve"

    invoke-static {v0}, Lcom/youai/sdks/utils/YALog;->i(Ljava/lang/String;)V

    .line 262
    iget-object v0, p0, Lcom/youai/sdks/PlatformSdk;->platformInstance:Lcom/youai/sdks/platform/PlatformBase;

    invoke-virtual {v0}, Lcom/youai/sdks/platform/PlatformBase;->reserve()V

    .line 263
    return-void
.end method

.method public setDebugMode(Z)V
    .locals 1
    .param p1, "debug"    # Z

    .prologue
    .line 64
    iget-object v0, p0, Lcom/youai/sdks/PlatformSdk;->platformInstance:Lcom/youai/sdks/platform/PlatformBase;

    invoke-virtual {v0, p1}, Lcom/youai/sdks/platform/PlatformBase;->setDebugMode(Z)V

    .line 65
    sput-boolean p1, Lcom/youai/sdks/utils/YALog;->Debug:Z

    .line 66
    return-void
.end method

.method public setEnterGame(ZLorg/json/JSONObject;)V
    .locals 1
    .param p1, "flag"    # Z
    .param p2, "jsonData"    # Lorg/json/JSONObject;

    .prologue
    .line 124
    const-string v0, "setEnterGame"

    invoke-static {v0}, Lcom/youai/sdks/utils/YALog;->i(Ljava/lang/String;)V

    .line 125
    iget-object v0, p0, Lcom/youai/sdks/PlatformSdk;->platformInstance:Lcom/youai/sdks/platform/PlatformBase;

    invoke-virtual {v0, p1, p2}, Lcom/youai/sdks/platform/PlatformBase;->setEnteredGame(ZLorg/json/JSONObject;)V

    .line 126
    return-void
.end method

.method public setScreenOrientation(Lcom/youai/sdks/beans/PlatformContacts$ScreenOrientation;)V
    .locals 1
    .param p1, "orientation"    # Lcom/youai/sdks/beans/PlatformContacts$ScreenOrientation;

    .prologue
    .line 75
    iget-object v0, p0, Lcom/youai/sdks/PlatformSdk;->platformInstance:Lcom/youai/sdks/platform/PlatformBase;

    invoke-virtual {v0, p1}, Lcom/youai/sdks/platform/PlatformBase;->setScreenOrientation(Lcom/youai/sdks/beans/PlatformContacts$ScreenOrientation;)V

    .line 76
    return-void
.end method

.method public shareToThirdPlatForm(Landroid/app/Activity;Lcom/youai/sdks/beans/ShareInfo;)V
    .locals 1
    .param p1, "context"    # Landroid/app/Activity;
    .param p2, "shareInfo"    # Lcom/youai/sdks/beans/ShareInfo;

    .prologue
    .line 113
    invoke-static {p2}, Lcom/youai/sdks/utils/YALog;->i(Ljava/lang/Object;)V

    .line 114
    iget-object v0, p0, Lcom/youai/sdks/PlatformSdk;->platformInstance:Lcom/youai/sdks/platform/PlatformBase;

    invoke-virtual {v0, p1, p2}, Lcom/youai/sdks/platform/PlatformBase;->callPlatformSupportThirdShare(Landroid/app/Activity;Lcom/youai/sdks/beans/ShareInfo;)V

    .line 115
    return-void
.end method

.method public showBBS(Landroid/app/Activity;Ljava/lang/String;)V
    .locals 2
    .param p1, "context"    # Landroid/app/Activity;
    .param p2, "url"    # Ljava/lang/String;

    .prologue
    .line 98
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "showBBS : url = "

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/youai/sdks/utils/YALog;->i(Ljava/lang/String;)V

    .line 99
    iget-object v0, p0, Lcom/youai/sdks/PlatformSdk;->platformInstance:Lcom/youai/sdks/platform/PlatformBase;

    invoke-virtual {v0, p1, p2}, Lcom/youai/sdks/platform/PlatformBase;->callPlatformGameBBS(Landroid/app/Activity;Ljava/lang/String;)V

    .line 100
    return-void
.end method

.method public showEnterPlatform(Landroid/app/Activity;)V
    .locals 1
    .param p1, "context"    # Landroid/app/Activity;

    .prologue
    .line 103
    const-string v0, "showEnterPlatform"

    invoke-static {v0}, Lcom/youai/sdks/utils/YALog;->i(Ljava/lang/String;)V

    .line 104
    iget-object v0, p0, Lcom/youai/sdks/PlatformSdk;->platformInstance:Lcom/youai/sdks/platform/PlatformBase;

    invoke-virtual {v0, p1}, Lcom/youai/sdks/platform/PlatformBase;->callAccountManage(Landroid/app/Activity;)V

    .line 105
    return-void
.end method

.method public showFeedBack(Landroid/app/Activity;Lcom/youai/sdks/beans/YALastLoginHelp;)I
    .locals 1
    .param p1, "context"    # Landroid/app/Activity;
    .param p2, "yaLastLoginHelp"    # Lcom/youai/sdks/beans/YALastLoginHelp;

    .prologue
    .line 93
    const-string v0, "showFeedBack"

    invoke-static {v0}, Lcom/youai/sdks/utils/YALog;->i(Ljava/lang/String;)V

    .line 94
    iget-object v0, p0, Lcom/youai/sdks/PlatformSdk;->platformInstance:Lcom/youai/sdks/platform/PlatformBase;

    invoke-virtual {v0, p1, p2}, Lcom/youai/sdks/platform/PlatformBase;->callPlatformFeedback(Landroid/app/Activity;Lcom/youai/sdks/beans/YALastLoginHelp;)I

    move-result v0

    return v0
.end method

.method public showPay(Landroid/app/Activity;Lcom/youai/sdks/beans/PayInfo;)I
    .locals 1
    .param p1, "context"    # Landroid/app/Activity;
    .param p2, "buyInfo"    # Lcom/youai/sdks/beans/PayInfo;

    .prologue
    .line 108
    invoke-static {p2}, Lcom/youai/sdks/utils/YALog;->i(Ljava/lang/Object;)V

    .line 109
    iget-object v0, p0, Lcom/youai/sdks/PlatformSdk;->platformInstance:Lcom/youai/sdks/platform/PlatformBase;

    invoke-virtual {v0, p1, p2}, Lcom/youai/sdks/platform/PlatformBase;->callPayRecharge(Landroid/app/Activity;Lcom/youai/sdks/beans/PayInfo;)I

    move-result v0

    return v0
.end method

.method public switchAccount(Landroid/app/Activity;)V
    .locals 1
    .param p1, "context"    # Landroid/app/Activity;

    .prologue
    .line 118
    const-string v0, "Switch Account"

    invoke-static {v0}, Lcom/youai/sdks/utils/YALog;->i(Ljava/lang/String;)V

    .line 119
    iget-object v0, p0, Lcom/youai/sdks/PlatformSdk;->platformInstance:Lcom/youai/sdks/platform/PlatformBase;

    invoke-virtual {v0, p1}, Lcom/youai/sdks/platform/PlatformBase;->callAccountManage(Landroid/app/Activity;)V

    .line 121
    return-void
.end method

.method public unInit(Landroid/app/Activity;)V
    .locals 1
    .param p1, "activity"    # Landroid/app/Activity;

    .prologue
    .line 59
    const-string v0, "unInit"

    invoke-static {v0}, Lcom/youai/sdks/utils/YALog;->i(Ljava/lang/String;)V

    .line 60
    iget-object v0, p0, Lcom/youai/sdks/PlatformSdk;->platformInstance:Lcom/youai/sdks/platform/PlatformBase;

    invoke-virtual {v0}, Lcom/youai/sdks/platform/PlatformBase;->unInit()V

    .line 61
    return-void
.end method
