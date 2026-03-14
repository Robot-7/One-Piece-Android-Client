.class public abstract Lorg/cocos2dx/lib/Cocos2dxActivity;
.super Landroid/app/Activity;
.source "Cocos2dxActivity.java"

# interfaces
.implements Lorg/cocos2dx/lib/Cocos2dxHelper$Cocos2dxHelperListener;


# static fields
.field private static final TAG:Ljava/lang/String;

.field private static sContext:Landroid/content/Context;


# instance fields
.field public mAppDataExternalStorageCacheFullPath:Ljava/lang/String;

.field public mAppDataExternalStorageFullPath:Ljava/lang/String;

.field public mAppDataExternalStorageResourcesFullPath:Ljava/lang/String;

.field public mGLSurfaceView:Lorg/cocos2dx/lib/Cocos2dxGLSurfaceView;

.field public mGameAppStateHandler:Landroid/os/Handler;

.field private mHandler:Lorg/cocos2dx/lib/Cocos2dxHandler;

.field protected mIsCocos2dxSurfaceViewCreated:Z

.field protected mIsOnPause:Z

.field protected mIsRenderCocos2dxView:Z

.field protected mIsTempShortPause:Z

.field private mLastLowMemoryNanoTime:J


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 50
    const-class v0, Lorg/cocos2dx/lib/Cocos2dxActivity;

    .line 51
    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v0

    .line 50
    sput-object v0, Lorg/cocos2dx/lib/Cocos2dxActivity;->TAG:Ljava/lang/String;

    .line 61
    const/4 v0, 0x0

    sput-object v0, Lorg/cocos2dx/lib/Cocos2dxActivity;->sContext:Landroid/content/Context;

    return-void
.end method

.method public constructor <init>()V
    .locals 2

    .prologue
    const/4 v1, 0x0

    const/4 v0, 0x0

    .line 42
    invoke-direct {p0}, Landroid/app/Activity;-><init>()V

    .line 63
    iput-boolean v0, p0, Lorg/cocos2dx/lib/Cocos2dxActivity;->mIsCocos2dxSurfaceViewCreated:Z

    .line 64
    iput-boolean v0, p0, Lorg/cocos2dx/lib/Cocos2dxActivity;->mIsRenderCocos2dxView:Z

    .line 66
    iput-object v1, p0, Lorg/cocos2dx/lib/Cocos2dxActivity;->mAppDataExternalStorageFullPath:Ljava/lang/String;

    .line 67
    iput-object v1, p0, Lorg/cocos2dx/lib/Cocos2dxActivity;->mAppDataExternalStorageResourcesFullPath:Ljava/lang/String;

    .line 68
    iput-object v1, p0, Lorg/cocos2dx/lib/Cocos2dxActivity;->mAppDataExternalStorageCacheFullPath:Ljava/lang/String;

    .line 71
    iput-boolean v0, p0, Lorg/cocos2dx/lib/Cocos2dxActivity;->mIsOnPause:Z

    .line 75
    iput-boolean v0, p0, Lorg/cocos2dx/lib/Cocos2dxActivity;->mIsTempShortPause:Z

    .line 76
    invoke-static {}, Ljava/lang/System;->nanoTime()J

    move-result-wide v0

    iput-wide v0, p0, Lorg/cocos2dx/lib/Cocos2dxActivity;->mLastLowMemoryNanoTime:J

    .line 42
    return-void
.end method

.method public static getContext()Landroid/content/Context;
    .locals 1

    .prologue
    .line 82
    sget-object v0, Lorg/cocos2dx/lib/Cocos2dxActivity;->sContext:Landroid/content/Context;

    return-object v0
.end method


# virtual methods
.method public callPlatformAccountManage()V
    .locals 2

    .prologue
    .line 348
    iget-object v0, p0, Lorg/cocos2dx/lib/Cocos2dxActivity;->mGameAppStateHandler:Landroid/os/Handler;

    .line 349
    const/16 v1, 0x9

    invoke-virtual {v0, v1}, Landroid/os/Handler;->sendEmptyMessage(I)Z

    .line 350
    return-void
.end method

.method public callPlatformFeedback()V
    .locals 2

    .prologue
    .line 407
    iget-object v0, p0, Lorg/cocos2dx/lib/Cocos2dxActivity;->mGameAppStateHandler:Landroid/os/Handler;

    .line 408
    const/16 v1, 0xb

    invoke-virtual {v0, v1}, Landroid/os/Handler;->sendEmptyMessage(I)Z

    .line 409
    return-void
.end method

.method public callPlatformGameBBS(Ljava/lang/String;)V
    .locals 2
    .param p1, "url"    # Ljava/lang/String;

    .prologue
    .line 423
    iget-object v0, p0, Lorg/cocos2dx/lib/Cocos2dxActivity;->mGameAppStateHandler:Landroid/os/Handler;

    .line 424
    const/16 v1, 0xd

    invoke-virtual {v0, v1}, Landroid/os/Handler;->sendEmptyMessage(I)Z

    .line 425
    return-void
.end method

.method public callPlatformInit()V
    .locals 0

    .prologue
    .line 395
    return-void
.end method

.method public callPlatformLogin()V
    .locals 2

    .prologue
    .line 334
    iget-object v0, p0, Lorg/cocos2dx/lib/Cocos2dxActivity;->mGameAppStateHandler:Landroid/os/Handler;

    .line 335
    const/4 v1, 0x7

    invoke-virtual {v0, v1}, Landroid/os/Handler;->sendEmptyMessage(I)Z

    .line 336
    return-void
.end method

.method public callPlatformLogout()V
    .locals 2

    .prologue
    .line 341
    iget-object v0, p0, Lorg/cocos2dx/lib/Cocos2dxActivity;->mGameAppStateHandler:Landroid/os/Handler;

    .line 342
    const/16 v1, 0x8

    invoke-virtual {v0, v1}, Landroid/os/Handler;->sendEmptyMessage(I)Z

    .line 343
    return-void
.end method

.method public callPlatformPayRecharge(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;FFILjava/lang/String;)V
    .locals 9
    .param p1, "serial"    # Ljava/lang/String;
    .param p2, "productId"    # Ljava/lang/String;
    .param p3, "productName"    # Ljava/lang/String;
    .param p4, "price"    # F
    .param p5, "orignalPrice"    # F
    .param p6, "count"    # I
    .param p7, "description"    # Ljava/lang/String;

    .prologue
    .line 357
    new-instance v8, Landroid/os/Message;

    invoke-direct {v8}, Landroid/os/Message;-><init>()V

    .line 358
    .local v8, "msg":Landroid/os/Message;
    const/16 v0, 0xa

    iput v0, v8, Landroid/os/Message;->what:I

    .line 359
    new-instance v0, Lorg/cocos2dx/lib/Cocos2dxHandler$PayRechargeMessage;

    move-object v1, p1

    move-object v2, p2

    move-object v3, p3

    move v4, p4

    move v5, p5

    move v6, p6

    move-object/from16 v7, p7

    .line 360
    invoke-direct/range {v0 .. v7}, Lorg/cocos2dx/lib/Cocos2dxHandler$PayRechargeMessage;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;FFILjava/lang/String;)V

    .line 359
    iput-object v0, v8, Landroid/os/Message;->obj:Ljava/lang/Object;

    .line 361
    iget-object v0, p0, Lorg/cocos2dx/lib/Cocos2dxActivity;->mGameAppStateHandler:Landroid/os/Handler;

    invoke-virtual {v0, v8}, Landroid/os/Handler;->sendMessage(Landroid/os/Message;)Z

    .line 362
    return-void
.end method

.method public callPlatformSupportThirdShare(Ljava/lang/String;Ljava/lang/String;)V
    .locals 2
    .param p1, "content"    # Ljava/lang/String;
    .param p2, "imgPath"    # Ljava/lang/String;

    .prologue
    .line 414
    new-instance v0, Landroid/os/Message;

    invoke-direct {v0}, Landroid/os/Message;-><init>()V

    .line 415
    .local v0, "msg":Landroid/os/Message;
    const/16 v1, 0xc

    iput v1, v0, Landroid/os/Message;->what:I

    .line 416
    new-instance v1, Lorg/cocos2dx/lib/Cocos2dxHandler$ShareMessage;

    invoke-direct {v1, p1, p2}, Lorg/cocos2dx/lib/Cocos2dxHandler$ShareMessage;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    iput-object v1, v0, Landroid/os/Message;->obj:Ljava/lang/Object;

    .line 417
    iget-object v1, p0, Lorg/cocos2dx/lib/Cocos2dxActivity;->mGameAppStateHandler:Landroid/os/Handler;

    invoke-virtual {v1, v0}, Landroid/os/Handler;->sendMessage(Landroid/os/Message;)Z

    .line 418
    return-void
.end method

.method protected destroy()V
    .locals 2

    .prologue
    .line 505
    iget-object v0, p0, Lorg/cocos2dx/lib/Cocos2dxActivity;->mGameAppStateHandler:Landroid/os/Handler;

    if-eqz v0, :cond_0

    .line 506
    iget-object v0, p0, Lorg/cocos2dx/lib/Cocos2dxActivity;->mGameAppStateHandler:Landroid/os/Handler;

    const/16 v1, 0xf

    invoke-virtual {v0, v1}, Landroid/os/Handler;->removeMessages(I)V

    .line 507
    :cond_0
    const/4 v0, 0x0

    iput-object v0, p0, Lorg/cocos2dx/lib/Cocos2dxActivity;->mGameAppStateHandler:Landroid/os/Handler;

    .line 511
    invoke-super {p0}, Landroid/app/Activity;->finish()V

    .line 512
    return-void
.end method

.method public generateNewOrderSerial()Ljava/lang/String;
    .locals 1

    .prologue
    .line 401
    const/4 v0, 0x0

    return-object v0
.end method

.method public getCocos2dxGLSurfaceView()Landroid/view/View;
    .locals 1

    .prologue
    .line 87
    iget-object v0, p0, Lorg/cocos2dx/lib/Cocos2dxActivity;->mGLSurfaceView:Lorg/cocos2dx/lib/Cocos2dxGLSurfaceView;

    return-object v0
.end method

.method public getIsOnTempShortPause()Z
    .locals 1

    .prologue
    .line 429
    iget-boolean v0, p0, Lorg/cocos2dx/lib/Cocos2dxActivity;->mIsTempShortPause:Z

    return v0
.end method

.method public getMainThreadHandler()Landroid/os/Handler;
    .locals 1

    .prologue
    .line 95
    iget-object v0, p0, Lorg/cocos2dx/lib/Cocos2dxActivity;->mHandler:Lorg/cocos2dx/lib/Cocos2dxHandler;

    return-object v0
.end method

.method public getPlatformLoginSessionId()Ljava/lang/String;
    .locals 1

    .prologue
    .line 379
    const-string v0, ""

    return-object v0
.end method

.method public getPlatformLoginStatus()Z
    .locals 1

    .prologue
    .line 367
    const/4 v0, 0x1

    return v0
.end method

.method public getPlatformLoginUin()Ljava/lang/String;
    .locals 1

    .prologue
    .line 373
    const-string v0, ""

    return-object v0
.end method

.method public getPlatformUserNickName()Ljava/lang/String;
    .locals 1

    .prologue
    .line 385
    const-string v0, ""

    return-object v0
.end method

.method public initAndroidContext(Landroid/view/View;Landroid/view/View;)V
    .locals 1
    .param p1, "glView"    # Landroid/view/View;
    .param p2, "editText"    # Landroid/view/View;

    .prologue
    .line 469
    iget-object v0, p0, Lorg/cocos2dx/lib/Cocos2dxActivity;->mAppDataExternalStorageFullPath:Ljava/lang/String;

    invoke-static {p0, p0, v0}, Lorg/cocos2dx/lib/Cocos2dxHelper;->init(Landroid/content/Context;Lorg/cocos2dx/lib/Cocos2dxHelper$Cocos2dxHelperListener;Ljava/lang/String;)V

    .line 474
    check-cast p1, Lorg/cocos2dx/lib/Cocos2dxGLSurfaceView;

    .end local p1    # "glView":Landroid/view/View;
    iput-object p1, p0, Lorg/cocos2dx/lib/Cocos2dxActivity;->mGLSurfaceView:Lorg/cocos2dx/lib/Cocos2dxGLSurfaceView;

    .line 477
    iget-object v0, p0, Lorg/cocos2dx/lib/Cocos2dxActivity;->mGLSurfaceView:Lorg/cocos2dx/lib/Cocos2dxGLSurfaceView;

    check-cast p2, Lorg/cocos2dx/lib/Cocos2dxEditText;

    .end local p2    # "editText":Landroid/view/View;
    invoke-virtual {v0, p2}, Lorg/cocos2dx/lib/Cocos2dxGLSurfaceView;->setCocos2dxEditText(Lorg/cocos2dx/lib/Cocos2dxEditText;)V

    .line 481
    return-void
.end method

.method protected onCreate(Landroid/os/Bundle;)V
    .locals 3
    .param p1, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    const/16 v2, 0x80

    .line 106
    sget-object v0, Lorg/cocos2dx/lib/Cocos2dxActivity;->TAG:Ljava/lang/String;

    const-string v1, "2\t\tcall Cocos2dxActivity.onCreate"

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 108
    invoke-super {p0, p1}, Landroid/app/Activity;->onCreate(Landroid/os/Bundle;)V

    .line 111
    invoke-virtual {p0}, Lorg/cocos2dx/lib/Cocos2dxActivity;->getWindow()Landroid/view/Window;

    move-result-object v0

    invoke-virtual {v0, v2, v2}, Landroid/view/Window;->setFlags(II)V

    .line 114
    sput-object p0, Lorg/cocos2dx/lib/Cocos2dxActivity;->sContext:Landroid/content/Context;

    .line 119
    new-instance v0, Lorg/cocos2dx/lib/Cocos2dxHandler;

    invoke-direct {v0, p0}, Lorg/cocos2dx/lib/Cocos2dxHandler;-><init>(Lorg/cocos2dx/lib/Cocos2dxActivity;)V

    iput-object v0, p0, Lorg/cocos2dx/lib/Cocos2dxActivity;->mHandler:Lorg/cocos2dx/lib/Cocos2dxHandler;

    .line 122
    return-void
.end method

.method protected onDestroy()V
    .locals 2

    .prologue
    .line 127
    invoke-super {p0}, Landroid/app/Activity;->onDestroy()V

    .line 128
    sget-object v0, Lorg/cocos2dx/lib/Cocos2dxActivity;->TAG:Ljava/lang/String;

    const-string v1, "call Cocos2dxActivity.onDestroy"

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 130
    iget-boolean v0, p0, Lorg/cocos2dx/lib/Cocos2dxActivity;->mIsCocos2dxSurfaceViewCreated:Z

    if-eqz v0, :cond_0

    .line 132
    invoke-static {}, Lorg/cocos2dx/lib/Cocos2dxHelper;->onPause()V

    .line 133
    iget-object v0, p0, Lorg/cocos2dx/lib/Cocos2dxActivity;->mGLSurfaceView:Lorg/cocos2dx/lib/Cocos2dxGLSurfaceView;

    invoke-virtual {v0}, Lorg/cocos2dx/lib/Cocos2dxGLSurfaceView;->onPause()V

    .line 135
    invoke-static {}, Lorg/cocos2dx/lib/Cocos2dxHelper;->nativeGameDestroy()V

    .line 139
    :cond_0
    const/4 v0, 0x0

    iput-boolean v0, p0, Lorg/cocos2dx/lib/Cocos2dxActivity;->mIsCocos2dxSurfaceViewCreated:Z

    .line 141
    const/4 v0, 0x0

    sput-object v0, Lorg/cocos2dx/lib/Cocos2dxActivity;->sContext:Landroid/content/Context;

    .line 144
    return-void
.end method

.method public onKeyDown(ILandroid/view/KeyEvent;)Z
    .locals 6
    .param p1, "keyCode"    # I
    .param p2, "event"    # Landroid/view/KeyEvent;

    .prologue
    const/4 v3, 0x1

    .line 271
    const/4 v0, 0x4

    if-ne p1, v0, :cond_0

    .line 275
    invoke-virtual {p0}, Lorg/cocos2dx/lib/Cocos2dxActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    sget v1, Lorg/cocos2dx/lib/R$string;->app_exit_title:I

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v1

    .line 276
    invoke-virtual {p0}, Lorg/cocos2dx/lib/Cocos2dxActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    sget v2, Lorg/cocos2dx/lib/R$string;->app_exit_msg:I

    invoke-virtual {v0, v2}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v2

    .line 278
    const-string v4, ""

    const-string v5, ""

    move-object v0, p0

    .line 274
    invoke-virtual/range {v0 .. v5}, Lorg/cocos2dx/lib/Cocos2dxActivity;->showQuestionDialog(Ljava/lang/String;Ljava/lang/String;ILjava/lang/String;Ljava/lang/String;)V

    .line 287
    :goto_0
    return v3

    .line 281
    :cond_0
    const/16 v0, 0x52

    if-ne p1, v0, :cond_1

    .line 283
    invoke-super {p0, p1, p2}, Landroid/app/Activity;->onKeyDown(ILandroid/view/KeyEvent;)Z

    goto :goto_0

    .line 287
    :cond_1
    invoke-super {p0, p1, p2}, Landroid/app/Activity;->onKeyDown(ILandroid/view/KeyEvent;)Z

    move-result v3

    goto :goto_0
.end method

.method public onLowMemory()V
    .locals 8

    .prologue
    .line 522
    iget-boolean v4, p0, Lorg/cocos2dx/lib/Cocos2dxActivity;->mIsCocos2dxSurfaceViewCreated:Z

    if-eqz v4, :cond_0

    .line 524
    invoke-static {}, Ljava/lang/System;->nanoTime()J

    move-result-wide v2

    .line 525
    .local v2, "timestamp":J
    const-wide/32 v0, -0x2e53f000

    .line 526
    .local v0, "timedelt":J
    iget-wide v4, p0, Lorg/cocos2dx/lib/Cocos2dxActivity;->mLastLowMemoryNanoTime:J

    sub-long v4, v2, v4

    const-wide/32 v6, -0x2e53f000

    cmp-long v4, v4, v6

    if-lez v4, :cond_0

    .line 531
    iget-object v4, p0, Lorg/cocos2dx/lib/Cocos2dxActivity;->mHandler:Lorg/cocos2dx/lib/Cocos2dxHandler;

    const/16 v5, 0x12

    const-wide/16 v6, 0x3e8

    invoke-virtual {v4, v5, v6, v7}, Lorg/cocos2dx/lib/Cocos2dxHandler;->sendEmptyMessageDelayed(IJ)Z

    .line 533
    iput-wide v2, p0, Lorg/cocos2dx/lib/Cocos2dxActivity;->mLastLowMemoryNanoTime:J

    .line 537
    .end local v0    # "timedelt":J
    .end local v2    # "timestamp":J
    :cond_0
    invoke-super {p0}, Landroid/app/Activity;->onLowMemory()V

    .line 538
    return-void
.end method

.method public onLowMemoryImp()V
    .locals 1

    .prologue
    .line 542
    new-instance v0, Lorg/cocos2dx/lib/Cocos2dxActivity$1;

    invoke-direct {v0, p0}, Lorg/cocos2dx/lib/Cocos2dxActivity$1;-><init>(Lorg/cocos2dx/lib/Cocos2dxActivity;)V

    invoke-virtual {p0, v0}, Lorg/cocos2dx/lib/Cocos2dxActivity;->runOnGLThread(Ljava/lang/Runnable;)V

    .line 552
    return-void
.end method

.method protected onPause()V
    .locals 2

    .prologue
    .line 193
    sget-object v0, Lorg/cocos2dx/lib/Cocos2dxActivity;->TAG:Ljava/lang/String;

    const-string v1, "call Cocos2dxActivity.onPause"

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 195
    invoke-super {p0}, Landroid/app/Activity;->onPause()V

    .line 197
    iget-boolean v0, p0, Lorg/cocos2dx/lib/Cocos2dxActivity;->mIsCocos2dxSurfaceViewCreated:Z

    if-eqz v0, :cond_1

    iget-boolean v0, p0, Lorg/cocos2dx/lib/Cocos2dxActivity;->mIsRenderCocos2dxView:Z

    if-eqz v0, :cond_1

    iget-boolean v0, p0, Lorg/cocos2dx/lib/Cocos2dxActivity;->mIsOnPause:Z

    if-nez v0, :cond_1

    .line 199
    const/4 v0, 0x1

    iput-boolean v0, p0, Lorg/cocos2dx/lib/Cocos2dxActivity;->mIsOnPause:Z

    .line 201
    iget-object v0, p0, Lorg/cocos2dx/lib/Cocos2dxActivity;->mGameAppStateHandler:Landroid/os/Handler;

    if-eqz v0, :cond_0

    .line 203
    iget-object v0, p0, Lorg/cocos2dx/lib/Cocos2dxActivity;->mGameAppStateHandler:Landroid/os/Handler;

    .line 204
    const/16 v1, 0xf

    invoke-virtual {v0, v1}, Landroid/os/Handler;->sendEmptyMessage(I)Z

    .line 207
    :cond_0
    invoke-static {}, Lorg/cocos2dx/lib/Cocos2dxHelper;->onPause()V

    .line 208
    iget-object v0, p0, Lorg/cocos2dx/lib/Cocos2dxActivity;->mGLSurfaceView:Lorg/cocos2dx/lib/Cocos2dxGLSurfaceView;

    invoke-virtual {v0}, Lorg/cocos2dx/lib/Cocos2dxGLSurfaceView;->onPause()V

    .line 212
    :cond_1
    return-void
.end method

.method protected onRestart()V
    .locals 2

    .prologue
    .line 158
    sget-object v0, Lorg/cocos2dx/lib/Cocos2dxActivity;->TAG:Ljava/lang/String;

    const-string v1, "call Cocos2dxActivity.onRestart"

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 159
    invoke-super {p0}, Landroid/app/Activity;->onRestart()V

    .line 161
    return-void
.end method

.method protected onResume()V
    .locals 3

    .prologue
    const/4 v2, 0x0

    .line 167
    sget-object v0, Lorg/cocos2dx/lib/Cocos2dxActivity;->TAG:Ljava/lang/String;

    const-string v1, "call Cocos2dxActivity.onResume"

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 169
    invoke-super {p0}, Landroid/app/Activity;->onResume()V

    .line 171
    iget-boolean v0, p0, Lorg/cocos2dx/lib/Cocos2dxActivity;->mIsCocos2dxSurfaceViewCreated:Z

    if-eqz v0, :cond_0

    iget-boolean v0, p0, Lorg/cocos2dx/lib/Cocos2dxActivity;->mIsRenderCocos2dxView:Z

    if-eqz v0, :cond_0

    iget-boolean v0, p0, Lorg/cocos2dx/lib/Cocos2dxActivity;->mIsOnPause:Z

    if-eqz v0, :cond_0

    .line 173
    iput-boolean v2, p0, Lorg/cocos2dx/lib/Cocos2dxActivity;->mIsOnPause:Z

    .line 174
    iput-boolean v2, p0, Lorg/cocos2dx/lib/Cocos2dxActivity;->mIsTempShortPause:Z

    .line 176
    invoke-static {}, Lorg/cocos2dx/lib/Cocos2dxHelper;->onResume()V

    .line 177
    iget-object v0, p0, Lorg/cocos2dx/lib/Cocos2dxActivity;->mGLSurfaceView:Lorg/cocos2dx/lib/Cocos2dxGLSurfaceView;

    invoke-virtual {v0}, Lorg/cocos2dx/lib/Cocos2dxGLSurfaceView;->onResume()V

    .line 179
    iget-object v0, p0, Lorg/cocos2dx/lib/Cocos2dxActivity;->mGameAppStateHandler:Landroid/os/Handler;

    if-eqz v0, :cond_0

    .line 181
    iget-object v0, p0, Lorg/cocos2dx/lib/Cocos2dxActivity;->mGameAppStateHandler:Landroid/os/Handler;

    .line 182
    const/16 v1, 0x10

    invoke-virtual {v0, v1}, Landroid/os/Handler;->sendEmptyMessage(I)Z

    .line 185
    :cond_0
    const/4 v0, 0x1

    iput-boolean v0, p0, Lorg/cocos2dx/lib/Cocos2dxActivity;->mIsRenderCocos2dxView:Z

    .line 187
    return-void
.end method

.method protected onStart()V
    .locals 3

    .prologue
    const/4 v2, 0x0

    .line 218
    sget-object v0, Lorg/cocos2dx/lib/Cocos2dxActivity;->TAG:Ljava/lang/String;

    const-string v1, "call Cocos2dxActivity.onStart"

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 220
    invoke-super {p0}, Landroid/app/Activity;->onStart()V

    .line 222
    iget-boolean v0, p0, Lorg/cocos2dx/lib/Cocos2dxActivity;->mIsCocos2dxSurfaceViewCreated:Z

    if-eqz v0, :cond_0

    iget-boolean v0, p0, Lorg/cocos2dx/lib/Cocos2dxActivity;->mIsRenderCocos2dxView:Z

    if-eqz v0, :cond_0

    iget-boolean v0, p0, Lorg/cocos2dx/lib/Cocos2dxActivity;->mIsOnPause:Z

    if-eqz v0, :cond_0

    .line 224
    iput-boolean v2, p0, Lorg/cocos2dx/lib/Cocos2dxActivity;->mIsOnPause:Z

    .line 225
    iput-boolean v2, p0, Lorg/cocos2dx/lib/Cocos2dxActivity;->mIsTempShortPause:Z

    .line 227
    invoke-static {}, Lorg/cocos2dx/lib/Cocos2dxHelper;->onResume()V

    .line 228
    iget-object v0, p0, Lorg/cocos2dx/lib/Cocos2dxActivity;->mGLSurfaceView:Lorg/cocos2dx/lib/Cocos2dxGLSurfaceView;

    invoke-virtual {v0}, Lorg/cocos2dx/lib/Cocos2dxGLSurfaceView;->onResume()V

    .line 230
    iget-object v0, p0, Lorg/cocos2dx/lib/Cocos2dxActivity;->mGameAppStateHandler:Landroid/os/Handler;

    if-eqz v0, :cond_0

    .line 232
    iget-object v0, p0, Lorg/cocos2dx/lib/Cocos2dxActivity;->mGameAppStateHandler:Landroid/os/Handler;

    .line 233
    const/16 v1, 0x10

    invoke-virtual {v0, v1}, Landroid/os/Handler;->sendEmptyMessage(I)Z

    .line 236
    :cond_0
    const/4 v0, 0x1

    iput-boolean v0, p0, Lorg/cocos2dx/lib/Cocos2dxActivity;->mIsRenderCocos2dxView:Z

    .line 239
    return-void
.end method

.method protected onStop()V
    .locals 2

    .prologue
    .line 245
    sget-object v0, Lorg/cocos2dx/lib/Cocos2dxActivity;->TAG:Ljava/lang/String;

    const-string v1, "call Cocos2dxActivity.onStop"

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 247
    invoke-super {p0}, Landroid/app/Activity;->onPause()V

    .line 249
    iget-boolean v0, p0, Lorg/cocos2dx/lib/Cocos2dxActivity;->mIsCocos2dxSurfaceViewCreated:Z

    if-eqz v0, :cond_1

    iget-boolean v0, p0, Lorg/cocos2dx/lib/Cocos2dxActivity;->mIsRenderCocos2dxView:Z

    if-eqz v0, :cond_1

    iget-boolean v0, p0, Lorg/cocos2dx/lib/Cocos2dxActivity;->mIsOnPause:Z

    if-nez v0, :cond_1

    .line 251
    const/4 v0, 0x1

    iput-boolean v0, p0, Lorg/cocos2dx/lib/Cocos2dxActivity;->mIsOnPause:Z

    .line 253
    iget-object v0, p0, Lorg/cocos2dx/lib/Cocos2dxActivity;->mGameAppStateHandler:Landroid/os/Handler;

    if-eqz v0, :cond_0

    .line 255
    iget-object v0, p0, Lorg/cocos2dx/lib/Cocos2dxActivity;->mGameAppStateHandler:Landroid/os/Handler;

    .line 256
    const/16 v1, 0xf

    invoke-virtual {v0, v1}, Landroid/os/Handler;->sendEmptyMessage(I)Z

    .line 259
    :cond_0
    invoke-static {}, Lorg/cocos2dx/lib/Cocos2dxHelper;->onPause()V

    .line 260
    iget-object v0, p0, Lorg/cocos2dx/lib/Cocos2dxActivity;->mGLSurfaceView:Lorg/cocos2dx/lib/Cocos2dxGLSurfaceView;

    invoke-virtual {v0}, Lorg/cocos2dx/lib/Cocos2dxGLSurfaceView;->onPause()V

    .line 264
    :cond_1
    return-void
.end method

.method public onTimeToShowCocos2dxContentView()V
    .locals 0

    .prologue
    .line 501
    return-void
.end method

.method public openUrlOutside(Ljava/lang/String;)V
    .locals 3
    .param p1, "url"    # Ljava/lang/String;

    .prologue
    .line 434
    invoke-virtual {p1}, Ljava/lang/String;->isEmpty()Z

    move-result v2

    if-eqz v2, :cond_0

    .line 442
    :goto_0
    return-void

    .line 437
    :cond_0
    const/4 v2, 0x1

    iput-boolean v2, p0, Lorg/cocos2dx/lib/Cocos2dxActivity;->mIsTempShortPause:Z

    .line 439
    invoke-static {p1}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v1

    .line 440
    .local v1, "uri":Landroid/net/Uri;
    new-instance v0, Landroid/content/Intent;

    const-string v2, "android.intent.action.VIEW"

    invoke-direct {v0, v2, v1}, Landroid/content/Intent;-><init>(Ljava/lang/String;Landroid/net/Uri;)V

    .line 441
    .local v0, "it":Landroid/content/Intent;
    invoke-virtual {p0, v0}, Lorg/cocos2dx/lib/Cocos2dxActivity;->startActivity(Landroid/content/Intent;)V

    goto :goto_0
.end method

.method public runOnGLThread(Ljava/lang/Runnable;)V
    .locals 1
    .param p1, "pRunnable"    # Ljava/lang/Runnable;

    .prologue
    .line 328
    iget-object v0, p0, Lorg/cocos2dx/lib/Cocos2dxActivity;->mGLSurfaceView:Lorg/cocos2dx/lib/Cocos2dxGLSurfaceView;

    invoke-virtual {v0, p1}, Lorg/cocos2dx/lib/Cocos2dxGLSurfaceView;->queueEvent(Ljava/lang/Runnable;)V

    .line 329
    return-void
.end method

.method protected setGameAppStateHandler(Landroid/os/Handler;)V
    .locals 1
    .param p1, "handler"    # Landroid/os/Handler;

    .prologue
    const/4 v0, 0x1

    .line 493
    iput-object p1, p0, Lorg/cocos2dx/lib/Cocos2dxActivity;->mGameAppStateHandler:Landroid/os/Handler;

    .line 494
    iput-boolean v0, p0, Lorg/cocos2dx/lib/Cocos2dxActivity;->mIsCocos2dxSurfaceViewCreated:Z

    .line 495
    iput-boolean v0, p0, Lorg/cocos2dx/lib/Cocos2dxActivity;->mIsRenderCocos2dxView:Z

    .line 496
    return-void
.end method

.method protected setOnTempShortPause(Z)V
    .locals 3
    .param p1, "pause"    # Z

    .prologue
    .line 485
    iput-boolean p1, p0, Lorg/cocos2dx/lib/Cocos2dxActivity;->mIsTempShortPause:Z

    .line 486
    if-eqz p1, :cond_0

    const/4 v0, 0x0

    :goto_0
    iput-boolean v0, p0, Lorg/cocos2dx/lib/Cocos2dxActivity;->mIsRenderCocos2dxView:Z

    .line 488
    sget-object v0, Lorg/cocos2dx/lib/Cocos2dxActivity;->TAG:Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "mIsTempShortPause: "

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-static {p1}, Ljava/lang/String;->valueOf(Z)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 489
    return-void

    .line 486
    :cond_0
    const/4 v0, 0x1

    goto :goto_0
.end method

.method public showDialog(Ljava/lang/String;Ljava/lang/String;ILjava/lang/String;)V
    .locals 7
    .param p1, "pTitle"    # Ljava/lang/String;
    .param p2, "pMessage"    # Ljava/lang/String;
    .param p3, "msgId"    # I
    .param p4, "positiveCallback"    # Ljava/lang/String;

    .prologue
    .line 294
    new-instance v6, Landroid/os/Message;

    invoke-direct {v6}, Landroid/os/Message;-><init>()V

    .line 295
    .local v6, "msg":Landroid/os/Message;
    const/4 v0, 0x1

    iput v0, v6, Landroid/os/Message;->what:I

    .line 296
    new-instance v0, Lorg/cocos2dx/lib/Cocos2dxHandler$DialogMessage;

    .line 297
    const-string v5, ""

    move-object v1, p1

    move-object v2, p2

    move v3, p3

    move-object v4, p4

    invoke-direct/range {v0 .. v5}, Lorg/cocos2dx/lib/Cocos2dxHandler$DialogMessage;-><init>(Ljava/lang/String;Ljava/lang/String;ILjava/lang/String;Ljava/lang/String;)V

    .line 296
    iput-object v0, v6, Landroid/os/Message;->obj:Ljava/lang/Object;

    .line 298
    iget-object v0, p0, Lorg/cocos2dx/lib/Cocos2dxActivity;->mHandler:Lorg/cocos2dx/lib/Cocos2dxHandler;

    invoke-virtual {v0, v6}, Lorg/cocos2dx/lib/Cocos2dxHandler;->sendMessage(Landroid/os/Message;)Z

    .line 299
    return-void
.end method

.method public showEditTextDialog(Ljava/lang/String;Ljava/lang/String;IIII)V
    .locals 8
    .param p1, "pTitle"    # Ljava/lang/String;
    .param p2, "pContent"    # Ljava/lang/String;
    .param p3, "pInputMode"    # I
    .param p4, "pInputFlag"    # I
    .param p5, "pReturnType"    # I
    .param p6, "pMaxLength"    # I

    .prologue
    .line 318
    new-instance v7, Landroid/os/Message;

    invoke-direct {v7}, Landroid/os/Message;-><init>()V

    .line 319
    .local v7, "msg":Landroid/os/Message;
    const/4 v0, 0x2

    iput v0, v7, Landroid/os/Message;->what:I

    .line 320
    new-instance v0, Lorg/cocos2dx/lib/Cocos2dxHandler$EditBoxMessage;

    move-object v1, p1

    move-object v2, p2

    move v3, p3

    move v4, p4

    move v5, p5

    move v6, p6

    .line 321
    invoke-direct/range {v0 .. v6}, Lorg/cocos2dx/lib/Cocos2dxHandler$EditBoxMessage;-><init>(Ljava/lang/String;Ljava/lang/String;IIII)V

    .line 320
    iput-object v0, v7, Landroid/os/Message;->obj:Ljava/lang/Object;

    .line 322
    iget-object v0, p0, Lorg/cocos2dx/lib/Cocos2dxActivity;->mHandler:Lorg/cocos2dx/lib/Cocos2dxHandler;

    invoke-virtual {v0, v7}, Lorg/cocos2dx/lib/Cocos2dxHandler;->sendMessage(Landroid/os/Message;)Z

    .line 323
    return-void
.end method

.method public showQuestionDialog(Ljava/lang/String;Ljava/lang/String;ILjava/lang/String;Ljava/lang/String;)V
    .locals 7
    .param p1, "pTitle"    # Ljava/lang/String;
    .param p2, "pMessage"    # Ljava/lang/String;
    .param p3, "msgId"    # I
    .param p4, "positiveCallback"    # Ljava/lang/String;
    .param p5, "negativeCallback"    # Ljava/lang/String;

    .prologue
    .line 306
    new-instance v6, Landroid/os/Message;

    invoke-direct {v6}, Landroid/os/Message;-><init>()V

    .line 307
    .local v6, "msg":Landroid/os/Message;
    const/4 v0, 0x3

    iput v0, v6, Landroid/os/Message;->what:I

    .line 308
    new-instance v0, Lorg/cocos2dx/lib/Cocos2dxHandler$DialogMessage;

    move-object v1, p1

    move-object v2, p2

    move v3, p3

    move-object v4, p4

    move-object v5, p5

    .line 309
    invoke-direct/range {v0 .. v5}, Lorg/cocos2dx/lib/Cocos2dxHandler$DialogMessage;-><init>(Ljava/lang/String;Ljava/lang/String;ILjava/lang/String;Ljava/lang/String;)V

    .line 308
    iput-object v0, v6, Landroid/os/Message;->obj:Ljava/lang/Object;

    .line 310
    iget-object v0, p0, Lorg/cocos2dx/lib/Cocos2dxActivity;->mHandler:Lorg/cocos2dx/lib/Cocos2dxHandler;

    invoke-virtual {v0, v6}, Lorg/cocos2dx/lib/Cocos2dxHandler;->sendMessage(Landroid/os/Message;)Z

    .line 311
    return-void
.end method

.method public showToastMsgImp(Ljava/lang/String;)V
    .locals 0
    .param p1, "msg"    # Ljava/lang/String;

    .prologue
    .line 517
    return-void
.end method

.method public showWaitingView(ZILjava/lang/String;)V
    .locals 2
    .param p1, "show"    # Z
    .param p2, "progress"    # I
    .param p3, "text"    # Ljava/lang/String;

    .prologue
    .line 446
    iget-object v1, p0, Lorg/cocos2dx/lib/Cocos2dxActivity;->mGameAppStateHandler:Landroid/os/Handler;

    if-eqz v1, :cond_0

    .line 448
    new-instance v0, Landroid/os/Message;

    invoke-direct {v0}, Landroid/os/Message;-><init>()V

    .line 449
    .local v0, "msg":Landroid/os/Message;
    const/16 v1, 0xe

    iput v1, v0, Landroid/os/Message;->what:I

    .line 450
    new-instance v1, Lorg/cocos2dx/lib/Cocos2dxHandler$ShowWaitingViewMessage;

    .line 451
    invoke-direct {v1, p1, p2, p3}, Lorg/cocos2dx/lib/Cocos2dxHandler$ShowWaitingViewMessage;-><init>(ZILjava/lang/String;)V

    .line 450
    iput-object v1, v0, Landroid/os/Message;->obj:Ljava/lang/Object;

    .line 452
    iget-object v1, p0, Lorg/cocos2dx/lib/Cocos2dxActivity;->mGameAppStateHandler:Landroid/os/Handler;

    invoke-virtual {v1, v0}, Landroid/os/Handler;->sendMessage(Landroid/os/Message;)Z

    .line 454
    .end local v0    # "msg":Landroid/os/Message;
    :cond_0
    return-void
.end method
