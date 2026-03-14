.class public Lorg/cocos2dx/lib/Cocos2dxGLSurfaceView;
.super Landroid/opengl/GLSurfaceView;
.source "Cocos2dxGLSurfaceView.java"


# static fields
.field private static final HANDLER_CLOSE_IME_KEYBOARD:I = 0x3

.field private static final HANDLER_OPEN_IME_KEYBOARD:I = 0x2

.field private static final TAG:Ljava/lang/String;

.field private static mCocos2dxGLSurfaceView:Lorg/cocos2dx/lib/Cocos2dxGLSurfaceView;

.field private static sCocos2dxTextInputWraper:Lorg/cocos2dx/lib/Cocos2dxTextInputWraper;

.field private static sHandler:Landroid/os/Handler;


# instance fields
.field private mCocos2dxEditText:Lorg/cocos2dx/lib/Cocos2dxEditText;

.field private mCocos2dxRenderer:Lorg/cocos2dx/lib/Cocos2dxRenderer;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 46
    const-class v0, Lorg/cocos2dx/lib/Cocos2dxGLSurfaceView;

    .line 47
    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v0

    .line 46
    sput-object v0, Lorg/cocos2dx/lib/Cocos2dxGLSurfaceView;->TAG:Ljava/lang/String;

    .line 60
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;)V
    .locals 0
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 71
    invoke-direct {p0, p1}, Landroid/opengl/GLSurfaceView;-><init>(Landroid/content/Context;)V

    .line 73
    invoke-virtual {p0}, Lorg/cocos2dx/lib/Cocos2dxGLSurfaceView;->initView()V

    .line 74
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;

    .prologue
    .line 78
    invoke-direct {p0, p1, p2}, Landroid/opengl/GLSurfaceView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 80
    invoke-virtual {p0}, Lorg/cocos2dx/lib/Cocos2dxGLSurfaceView;->initView()V

    .line 81
    return-void
.end method

.method static synthetic access$0(Lorg/cocos2dx/lib/Cocos2dxGLSurfaceView;)Lorg/cocos2dx/lib/Cocos2dxEditText;
    .locals 1

    .prologue
    .line 63
    iget-object v0, p0, Lorg/cocos2dx/lib/Cocos2dxGLSurfaceView;->mCocos2dxEditText:Lorg/cocos2dx/lib/Cocos2dxEditText;

    return-object v0
.end method

.method static synthetic access$1()Lorg/cocos2dx/lib/Cocos2dxTextInputWraper;
    .locals 1

    .prologue
    .line 60
    sget-object v0, Lorg/cocos2dx/lib/Cocos2dxGLSurfaceView;->sCocos2dxTextInputWraper:Lorg/cocos2dx/lib/Cocos2dxTextInputWraper;

    return-object v0
.end method

.method static synthetic access$2()Lorg/cocos2dx/lib/Cocos2dxGLSurfaceView;
    .locals 1

    .prologue
    .line 59
    sget-object v0, Lorg/cocos2dx/lib/Cocos2dxGLSurfaceView;->mCocos2dxGLSurfaceView:Lorg/cocos2dx/lib/Cocos2dxGLSurfaceView;

    return-object v0
.end method

.method static synthetic access$3(Lorg/cocos2dx/lib/Cocos2dxGLSurfaceView;)Lorg/cocos2dx/lib/Cocos2dxRenderer;
    .locals 1

    .prologue
    .line 62
    iget-object v0, p0, Lorg/cocos2dx/lib/Cocos2dxGLSurfaceView;->mCocos2dxRenderer:Lorg/cocos2dx/lib/Cocos2dxRenderer;

    return-object v0
.end method

.method public static closeIMEKeyboard()V
    .locals 2

    .prologue
    .line 457
    new-instance v0, Landroid/os/Message;

    invoke-direct {v0}, Landroid/os/Message;-><init>()V

    .line 458
    .local v0, "msg":Landroid/os/Message;
    const/4 v1, 0x3

    iput v1, v0, Landroid/os/Message;->what:I

    .line 459
    sget-object v1, Lorg/cocos2dx/lib/Cocos2dxGLSurfaceView;->sHandler:Landroid/os/Handler;

    invoke-virtual {v1, v0}, Landroid/os/Handler;->sendMessage(Landroid/os/Message;)Z

    .line 460
    return-void
.end method

.method private static dumpMotionEvent(Landroid/view/MotionEvent;)V
    .locals 9
    .param p0, "event"    # Landroid/view/MotionEvent;

    .prologue
    const/4 v8, 0x6

    const/4 v7, 0x5

    .line 493
    const/16 v5, 0xa

    new-array v3, v5, [Ljava/lang/String;

    const/4 v5, 0x0

    const-string v6, "DOWN"

    aput-object v6, v3, v5

    const/4 v5, 0x1

    const-string v6, "UP"

    aput-object v6, v3, v5

    const/4 v5, 0x2

    const-string v6, "MOVE"

    aput-object v6, v3, v5

    const/4 v5, 0x3

    const-string v6, "CANCEL"

    aput-object v6, v3, v5

    const/4 v5, 0x4

    const-string v6, "OUTSIDE"

    aput-object v6, v3, v5

    const-string v5, "POINTER_DOWN"

    aput-object v5, v3, v7

    .line 494
    const-string v5, "POINTER_UP"

    aput-object v5, v3, v8

    const/4 v5, 0x7

    const-string v6, "7?"

    aput-object v6, v3, v5

    const/16 v5, 0x8

    const-string v6, "8?"

    aput-object v6, v3, v5

    const/16 v5, 0x9

    const-string v6, "9?"

    aput-object v6, v3, v5

    .line 495
    .local v3, "names":[Ljava/lang/String;
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    .line 496
    .local v4, "sb":Ljava/lang/StringBuilder;
    invoke-virtual {p0}, Landroid/view/MotionEvent;->getAction()I

    move-result v0

    .line 497
    .local v0, "action":I
    and-int/lit16 v1, v0, 0xff

    .line 498
    .local v1, "actionCode":I
    const-string v5, "event ACTION_"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    aget-object v6, v3, v1

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 499
    if-eq v1, v7, :cond_0

    .line 500
    if-ne v1, v8, :cond_1

    .line 502
    :cond_0
    const-string v5, "(pid "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    .line 503
    shr-int/lit8 v6, v0, 0x8

    .line 502
    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 504
    const-string v5, ")"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 506
    :cond_1
    const-string v5, "["

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 507
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_0
    invoke-virtual {p0}, Landroid/view/MotionEvent;->getPointerCount()I

    move-result v5

    if-lt v2, v5, :cond_2

    .line 518
    const-string v5, "]"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 520
    return-void

    .line 509
    :cond_2
    const-string v5, "#"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 510
    const-string v5, "(pid "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {p0, v2}, Landroid/view/MotionEvent;->getPointerId(I)I

    move-result v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 511
    const-string v5, ")="

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {p0, v2}, Landroid/view/MotionEvent;->getX(I)F

    move-result v6

    float-to-int v6, v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 512
    const-string v5, ","

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {p0, v2}, Landroid/view/MotionEvent;->getY(I)F

    move-result v6

    float-to-int v6, v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 513
    add-int/lit8 v5, v2, 0x1

    invoke-virtual {p0}, Landroid/view/MotionEvent;->getPointerCount()I

    move-result v6

    if-ge v5, v6, :cond_3

    .line 515
    const-string v5, ";"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 507
    :cond_3
    add-int/lit8 v2, v2, 0x1

    goto :goto_0
.end method

.method private getContentText()Ljava/lang/String;
    .locals 1

    .prologue
    .line 182
    iget-object v0, p0, Lorg/cocos2dx/lib/Cocos2dxGLSurfaceView;->mCocos2dxRenderer:Lorg/cocos2dx/lib/Cocos2dxRenderer;

    invoke-virtual {v0}, Lorg/cocos2dx/lib/Cocos2dxRenderer;->getContentText()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static getInstance()Lorg/cocos2dx/lib/Cocos2dxGLSurfaceView;
    .locals 1

    .prologue
    .line 157
    sget-object v0, Lorg/cocos2dx/lib/Cocos2dxGLSurfaceView;->mCocos2dxGLSurfaceView:Lorg/cocos2dx/lib/Cocos2dxGLSurfaceView;

    return-object v0
.end method

.method private static final isAndroidEmulator()Z
    .locals 6

    .prologue
    .line 524
    sget-object v1, Landroid/os/Build;->MODEL:Ljava/lang/String;

    .line 525
    .local v1, "model":Ljava/lang/String;
    sget-object v3, Lorg/cocos2dx/lib/Cocos2dxGLSurfaceView;->TAG:Ljava/lang/String;

    new-instance v4, Ljava/lang/StringBuilder;

    const-string v5, "model="

    invoke-direct {v4, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v4, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 526
    sget-object v2, Landroid/os/Build;->PRODUCT:Ljava/lang/String;

    .line 527
    .local v2, "product":Ljava/lang/String;
    sget-object v3, Lorg/cocos2dx/lib/Cocos2dxGLSurfaceView;->TAG:Ljava/lang/String;

    new-instance v4, Ljava/lang/StringBuilder;

    const-string v5, "product="

    invoke-direct {v4, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 528
    const/4 v0, 0x0

    .line 529
    .local v0, "isEmulator":Z
    if-eqz v2, :cond_0

    .line 531
    const-string v3, "sdk"

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_1

    const-string v3, "_sdk"

    invoke-virtual {v2, v3}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v3

    if-nez v3, :cond_1

    .line 532
    const-string v3, "sdk_"

    invoke-virtual {v2, v3}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v3

    if-nez v3, :cond_1

    .line 531
    const/4 v0, 0x0

    .line 534
    :cond_0
    :goto_0
    sget-object v3, Lorg/cocos2dx/lib/Cocos2dxGLSurfaceView;->TAG:Ljava/lang/String;

    new-instance v4, Ljava/lang/StringBuilder;

    const-string v5, "isEmulator="

    invoke-direct {v4, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 535
    sget-object v3, Lorg/cocos2dx/lib/Cocos2dxGLSurfaceView;->TAG:Ljava/lang/String;

    new-instance v4, Ljava/lang/StringBuilder;

    const-string v5, "CPU_ABI:"

    invoke-direct {v4, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    sget-object v5, Landroid/os/Build;->CPU_ABI:Ljava/lang/String;

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, ",CPU_ABI2:"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    sget-object v5, Landroid/os/Build;->CPU_ABI2:Ljava/lang/String;

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    .line 536
    const-string v5, ",DEVICE:"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    sget-object v5, Landroid/os/Build;->DEVICE:Ljava/lang/String;

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, ",HARDWARE:"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    sget-object v5, Landroid/os/Build;->HARDWARE:Ljava/lang/String;

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    .line 535
    invoke-static {v3, v4}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 537
    sget-object v3, Lorg/cocos2dx/lib/Cocos2dxGLSurfaceView;->TAG:Ljava/lang/String;

    new-instance v4, Ljava/lang/StringBuilder;

    const-string v5, "ID:"

    invoke-direct {v4, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    sget-object v5, Landroid/os/Build;->ID:Ljava/lang/String;

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, ",PRODUCT:"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    sget-object v5, Landroid/os/Build;->PRODUCT:Ljava/lang/String;

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 538
    return v0

    .line 531
    :cond_1
    const/4 v0, 0x1

    goto :goto_0
.end method

.method public static openIMEKeyboard()V
    .locals 2

    .prologue
    .line 449
    new-instance v0, Landroid/os/Message;

    invoke-direct {v0}, Landroid/os/Message;-><init>()V

    .line 450
    .local v0, "msg":Landroid/os/Message;
    const/4 v1, 0x2

    iput v1, v0, Landroid/os/Message;->what:I

    .line 451
    sget-object v1, Lorg/cocos2dx/lib/Cocos2dxGLSurfaceView;->mCocos2dxGLSurfaceView:Lorg/cocos2dx/lib/Cocos2dxGLSurfaceView;

    invoke-direct {v1}, Lorg/cocos2dx/lib/Cocos2dxGLSurfaceView;->getContentText()Ljava/lang/String;

    move-result-object v1

    iput-object v1, v0, Landroid/os/Message;->obj:Ljava/lang/Object;

    .line 452
    sget-object v1, Lorg/cocos2dx/lib/Cocos2dxGLSurfaceView;->sHandler:Landroid/os/Handler;

    invoke-virtual {v1, v0}, Landroid/os/Handler;->sendMessage(Landroid/os/Message;)Z

    .line 453
    return-void
.end method

.method public static queueAccelerometer(FFFJ)V
    .locals 7
    .param p0, "x"    # F
    .param p1, "y"    # F
    .param p2, "z"    # F
    .param p3, "timestamp"    # J

    .prologue
    .line 163
    sget-object v6, Lorg/cocos2dx/lib/Cocos2dxGLSurfaceView;->mCocos2dxGLSurfaceView:Lorg/cocos2dx/lib/Cocos2dxGLSurfaceView;

    new-instance v0, Lorg/cocos2dx/lib/Cocos2dxGLSurfaceView$2;

    move v1, p0

    move v2, p1

    move v3, p2

    move-wide v4, p3

    invoke-direct/range {v0 .. v5}, Lorg/cocos2dx/lib/Cocos2dxGLSurfaceView$2;-><init>(FFFJ)V

    invoke-virtual {v6, v0}, Lorg/cocos2dx/lib/Cocos2dxGLSurfaceView;->queueEvent(Ljava/lang/Runnable;)V

    .line 172
    return-void
.end method


# virtual methods
.method public deleteBackward()V
    .locals 1

    .prologue
    .line 478
    new-instance v0, Lorg/cocos2dx/lib/Cocos2dxGLSurfaceView$13;

    invoke-direct {v0, p0}, Lorg/cocos2dx/lib/Cocos2dxGLSurfaceView$13;-><init>(Lorg/cocos2dx/lib/Cocos2dxGLSurfaceView;)V

    invoke-virtual {p0, v0}, Lorg/cocos2dx/lib/Cocos2dxGLSurfaceView;->queueEvent(Ljava/lang/Runnable;)V

    .line 488
    return-void
.end method

.method public getCocos2dxEditText()Lorg/cocos2dx/lib/Cocos2dxEditText;
    .locals 1

    .prologue
    .line 187
    iget-object v0, p0, Lorg/cocos2dx/lib/Cocos2dxGLSurfaceView;->mCocos2dxEditText:Lorg/cocos2dx/lib/Cocos2dxEditText;

    return-object v0
.end method

.method protected initView()V
    .locals 7

    .prologue
    const/16 v1, 0x8

    .line 85
    const/4 v0, 0x2

    invoke-virtual {p0, v0}, Lorg/cocos2dx/lib/Cocos2dxGLSurfaceView;->setEGLContextClientVersion(I)V

    .line 86
    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Lorg/cocos2dx/lib/Cocos2dxGLSurfaceView;->setFocusableInTouchMode(Z)V

    .line 88
    sput-object p0, Lorg/cocos2dx/lib/Cocos2dxGLSurfaceView;->mCocos2dxGLSurfaceView:Lorg/cocos2dx/lib/Cocos2dxGLSurfaceView;

    .line 89
    new-instance v0, Lorg/cocos2dx/lib/Cocos2dxTextInputWraper;

    invoke-direct {v0, p0}, Lorg/cocos2dx/lib/Cocos2dxTextInputWraper;-><init>(Lorg/cocos2dx/lib/Cocos2dxGLSurfaceView;)V

    sput-object v0, Lorg/cocos2dx/lib/Cocos2dxGLSurfaceView;->sCocos2dxTextInputWraper:Lorg/cocos2dx/lib/Cocos2dxTextInputWraper;

    .line 92
    new-instance v0, Lorg/cocos2dx/lib/Cocos2dxGLSurfaceView$1;

    invoke-direct {v0, p0}, Lorg/cocos2dx/lib/Cocos2dxGLSurfaceView$1;-><init>(Lorg/cocos2dx/lib/Cocos2dxGLSurfaceView;)V

    sput-object v0, Lorg/cocos2dx/lib/Cocos2dxGLSurfaceView;->sHandler:Landroid/os/Handler;

    .line 145
    invoke-static {}, Lorg/cocos2dx/lib/Cocos2dxGLSurfaceView;->isAndroidEmulator()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 146
    const/16 v5, 0x10

    const/4 v6, 0x0

    move-object v0, p0

    move v2, v1

    move v3, v1

    move v4, v1

    invoke-virtual/range {v0 .. v6}, Lorg/cocos2dx/lib/Cocos2dxGLSurfaceView;->setEGLConfigChooser(IIIIII)V

    .line 148
    :cond_0
    new-instance v0, Lorg/cocos2dx/lib/Cocos2dxRenderer;

    invoke-direct {v0}, Lorg/cocos2dx/lib/Cocos2dxRenderer;-><init>()V

    invoke-virtual {p0, v0}, Lorg/cocos2dx/lib/Cocos2dxGLSurfaceView;->setCocos2dxRenderer(Lorg/cocos2dx/lib/Cocos2dxRenderer;)V

    .line 149
    return-void
.end method

.method public insertText(Ljava/lang/String;)V
    .locals 1
    .param p1, "pText"    # Ljava/lang/String;

    .prologue
    .line 464
    new-instance v0, Lorg/cocos2dx/lib/Cocos2dxGLSurfaceView$12;

    invoke-direct {v0, p0, p1}, Lorg/cocos2dx/lib/Cocos2dxGLSurfaceView$12;-><init>(Lorg/cocos2dx/lib/Cocos2dxGLSurfaceView;Ljava/lang/String;)V

    invoke-virtual {p0, v0}, Lorg/cocos2dx/lib/Cocos2dxGLSurfaceView;->queueEvent(Ljava/lang/Runnable;)V

    .line 474
    return-void
.end method

.method public onKeyDown(ILandroid/view/KeyEvent;)Z
    .locals 4
    .param p1, "pKeyCode"    # I
    .param p2, "pKeyEvent"    # Landroid/view/KeyEvent;

    .prologue
    const/4 v1, 0x1

    .line 411
    sparse-switch p1, :sswitch_data_0

    .line 435
    invoke-super {p0, p1, p2}, Landroid/opengl/GLSurfaceView;->onKeyDown(ILandroid/view/KeyEvent;)Z

    move-result v0

    :goto_0
    return v0

    .line 416
    :sswitch_0
    sget-object v0, Lorg/cocos2dx/lib/Cocos2dxGLSurfaceView;->TAG:Ljava/lang/String;

    new-instance v2, Ljava/lang/StringBuilder;

    const-string v3, "onKeyDown, keyCode: "

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-static {p1}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v0, v2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 419
    invoke-virtual {p0}, Lorg/cocos2dx/lib/Cocos2dxGLSurfaceView;->getContext()Landroid/content/Context;

    move-result-object v0

    check-cast v0, Landroid/app/Activity;

    invoke-virtual {v0, p1, p2}, Landroid/app/Activity;->onKeyDown(ILandroid/view/KeyEvent;)Z

    move-result v0

    if-eqz v0, :cond_0

    move v0, v1

    .line 420
    goto :goto_0

    .line 423
    :cond_0
    new-instance v0, Lorg/cocos2dx/lib/Cocos2dxGLSurfaceView$11;

    invoke-direct {v0, p0, p1}, Lorg/cocos2dx/lib/Cocos2dxGLSurfaceView$11;-><init>(Lorg/cocos2dx/lib/Cocos2dxGLSurfaceView;I)V

    invoke-virtual {p0, v0}, Lorg/cocos2dx/lib/Cocos2dxGLSurfaceView;->queueEvent(Ljava/lang/Runnable;)V

    move v0, v1

    .line 433
    goto :goto_0

    .line 411
    nop

    :sswitch_data_0
    .sparse-switch
        0x4 -> :sswitch_0
        0x52 -> :sswitch_0
    .end sparse-switch
.end method

.method public onKeyLongPress(ILandroid/view/KeyEvent;)Z
    .locals 3
    .param p1, "keyCode"    # I
    .param p2, "event"    # Landroid/view/KeyEvent;

    .prologue
    .line 391
    sparse-switch p1, :sswitch_data_0

    .line 404
    :cond_0
    invoke-super {p0, p1, p2}, Landroid/opengl/GLSurfaceView;->onKeyLongPress(ILandroid/view/KeyEvent;)Z

    move-result v0

    :goto_0
    return v0

    .line 396
    :sswitch_0
    sget-object v0, Lorg/cocos2dx/lib/Cocos2dxGLSurfaceView;->TAG:Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "onKeyLongPress, keyCode: "

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-static {p1}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 398
    invoke-virtual {p0}, Lorg/cocos2dx/lib/Cocos2dxGLSurfaceView;->getContext()Landroid/content/Context;

    move-result-object v0

    check-cast v0, Landroid/app/Activity;

    invoke-virtual {v0, p1, p2}, Landroid/app/Activity;->onKeyLongPress(ILandroid/view/KeyEvent;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 399
    const/4 v0, 0x1

    goto :goto_0

    .line 391
    :sswitch_data_0
    .sparse-switch
        0x4 -> :sswitch_0
        0x52 -> :sswitch_0
    .end sparse-switch
.end method

.method public onPause()V
    .locals 1

    .prologue
    .line 232
    new-instance v0, Lorg/cocos2dx/lib/Cocos2dxGLSurfaceView$4;

    invoke-direct {v0, p0}, Lorg/cocos2dx/lib/Cocos2dxGLSurfaceView$4;-><init>(Lorg/cocos2dx/lib/Cocos2dxGLSurfaceView;)V

    invoke-virtual {p0, v0}, Lorg/cocos2dx/lib/Cocos2dxGLSurfaceView;->queueEvent(Ljava/lang/Runnable;)V

    .line 243
    return-void
.end method

.method public onResume()V
    .locals 1

    .prologue
    .line 216
    invoke-super {p0}, Landroid/opengl/GLSurfaceView;->onResume()V

    .line 218
    new-instance v0, Lorg/cocos2dx/lib/Cocos2dxGLSurfaceView$3;

    invoke-direct {v0, p0}, Lorg/cocos2dx/lib/Cocos2dxGLSurfaceView$3;-><init>(Lorg/cocos2dx/lib/Cocos2dxGLSurfaceView;)V

    invoke-virtual {p0, v0}, Lorg/cocos2dx/lib/Cocos2dxGLSurfaceView;->queueEvent(Ljava/lang/Runnable;)V

    .line 227
    return-void
.end method

.method protected onSizeChanged(IIII)V
    .locals 1
    .param p1, "pNewSurfaceWidth"    # I
    .param p2, "pNewSurfaceHeight"    # I
    .param p3, "pOldSurfaceWidth"    # I
    .param p4, "pOldSurfaceHeight"    # I

    .prologue
    .line 381
    invoke-virtual {p0}, Lorg/cocos2dx/lib/Cocos2dxGLSurfaceView;->isInEditMode()Z

    move-result v0

    if-nez v0, :cond_0

    .line 383
    iget-object v0, p0, Lorg/cocos2dx/lib/Cocos2dxGLSurfaceView;->mCocos2dxRenderer:Lorg/cocos2dx/lib/Cocos2dxRenderer;

    invoke-virtual {v0, p1, p2}, Lorg/cocos2dx/lib/Cocos2dxRenderer;->setScreenWidthAndHeight(II)V

    .line 386
    :cond_0
    return-void
.end method

.method public onTouchEvent(Landroid/view/MotionEvent;)Z
    .locals 24
    .param p1, "pMotionEvent"    # Landroid/view/MotionEvent;

    .prologue
    .line 249
    invoke-virtual/range {p1 .. p1}, Landroid/view/MotionEvent;->getPointerCount()I

    move-result v12

    .line 250
    .local v12, "pointerNumber":I
    new-array v9, v12, [I

    .line 251
    .local v9, "ids":[I
    new-array v0, v12, [F

    move-object/from16 v17, v0

    .line 252
    .local v17, "xs":[F
    new-array v0, v12, [F

    move-object/from16 v22, v0

    .line 254
    .local v22, "ys":[F
    const/4 v4, 0x0

    .local v4, "i":I
    :goto_0
    if-lt v4, v12, :cond_0

    .line 261
    invoke-virtual/range {p1 .. p1}, Landroid/view/MotionEvent;->getAction()I

    move-result v23

    move/from16 v0, v23

    and-int/lit16 v0, v0, 0xff

    move/from16 v23, v0

    packed-switch v23, :pswitch_data_0

    .line 366
    :goto_1
    :pswitch_0
    invoke-static/range {p1 .. p1}, Lorg/cocos2dx/lib/Cocos2dxGLSurfaceView;->dumpMotionEvent(Landroid/view/MotionEvent;)V

    .line 369
    const/16 v23, 0x1

    return v23

    .line 256
    :cond_0
    move-object/from16 v0, p1

    invoke-virtual {v0, v4}, Landroid/view/MotionEvent;->getPointerId(I)I

    move-result v23

    aput v23, v9, v4

    .line 257
    move-object/from16 v0, p1

    invoke-virtual {v0, v4}, Landroid/view/MotionEvent;->getX(I)F

    move-result v23

    aput v23, v17, v4

    .line 258
    move-object/from16 v0, p1

    invoke-virtual {v0, v4}, Landroid/view/MotionEvent;->getY(I)F

    move-result v23

    aput v23, v22, v4

    .line 254
    add-int/lit8 v4, v4, 0x1

    goto :goto_0

    .line 264
    :pswitch_1
    invoke-virtual/range {p1 .. p1}, Landroid/view/MotionEvent;->getAction()I

    move-result v23

    shr-int/lit8 v11, v23, 0x8

    .line 266
    .local v11, "indexPointerDown":I
    move-object/from16 v0, p1

    invoke-virtual {v0, v11}, Landroid/view/MotionEvent;->getPointerId(I)I

    move-result v6

    .line 267
    .local v6, "idPointerDown":I
    move-object/from16 v0, p1

    invoke-virtual {v0, v11}, Landroid/view/MotionEvent;->getX(I)F

    move-result v14

    .line 268
    .local v14, "xPointerDown":F
    move-object/from16 v0, p1

    invoke-virtual {v0, v11}, Landroid/view/MotionEvent;->getY(I)F

    move-result v19

    .line 270
    .local v19, "yPointerDown":F
    new-instance v23, Lorg/cocos2dx/lib/Cocos2dxGLSurfaceView$5;

    move-object/from16 v0, v23

    move-object/from16 v1, p0

    move/from16 v2, v19

    invoke-direct {v0, v1, v6, v14, v2}, Lorg/cocos2dx/lib/Cocos2dxGLSurfaceView$5;-><init>(Lorg/cocos2dx/lib/Cocos2dxGLSurfaceView;IFF)V

    move-object/from16 v0, p0

    move-object/from16 v1, v23

    invoke-virtual {v0, v1}, Lorg/cocos2dx/lib/Cocos2dxGLSurfaceView;->queueEvent(Ljava/lang/Runnable;)V

    goto :goto_1

    .line 285
    .end local v6    # "idPointerDown":I
    .end local v11    # "indexPointerDown":I
    .end local v14    # "xPointerDown":F
    .end local v19    # "yPointerDown":F
    :pswitch_2
    const/16 v23, 0x0

    move-object/from16 v0, p1

    move/from16 v1, v23

    invoke-virtual {v0, v1}, Landroid/view/MotionEvent;->getPointerId(I)I

    move-result v5

    .line 286
    .local v5, "idDown":I
    const/16 v23, 0x0

    aget v13, v17, v23

    .line 287
    .local v13, "xDown":F
    const/16 v23, 0x0

    aget v18, v22, v23

    .line 289
    .local v18, "yDown":F
    new-instance v23, Lorg/cocos2dx/lib/Cocos2dxGLSurfaceView$6;

    move-object/from16 v0, v23

    move-object/from16 v1, p0

    move/from16 v2, v18

    invoke-direct {v0, v1, v5, v13, v2}, Lorg/cocos2dx/lib/Cocos2dxGLSurfaceView$6;-><init>(Lorg/cocos2dx/lib/Cocos2dxGLSurfaceView;IFF)V

    move-object/from16 v0, p0

    move-object/from16 v1, v23

    invoke-virtual {v0, v1}, Lorg/cocos2dx/lib/Cocos2dxGLSurfaceView;->queueEvent(Ljava/lang/Runnable;)V

    goto :goto_1

    .line 302
    .end local v5    # "idDown":I
    .end local v13    # "xDown":F
    .end local v18    # "yDown":F
    :pswitch_3
    new-instance v23, Lorg/cocos2dx/lib/Cocos2dxGLSurfaceView$7;

    move-object/from16 v0, v23

    move-object/from16 v1, p0

    move-object/from16 v2, v17

    move-object/from16 v3, v22

    invoke-direct {v0, v1, v9, v2, v3}, Lorg/cocos2dx/lib/Cocos2dxGLSurfaceView$7;-><init>(Lorg/cocos2dx/lib/Cocos2dxGLSurfaceView;[I[F[F)V

    move-object/from16 v0, p0

    move-object/from16 v1, v23

    invoke-virtual {v0, v1}, Lorg/cocos2dx/lib/Cocos2dxGLSurfaceView;->queueEvent(Ljava/lang/Runnable;)V

    goto/16 :goto_1

    .line 315
    :pswitch_4
    invoke-virtual/range {p1 .. p1}, Landroid/view/MotionEvent;->getAction()I

    move-result v23

    shr-int/lit8 v10, v23, 0x8

    .line 316
    .local v10, "indexPointUp":I
    move-object/from16 v0, p1

    invoke-virtual {v0, v10}, Landroid/view/MotionEvent;->getPointerId(I)I

    move-result v7

    .line 317
    .local v7, "idPointerUp":I
    move-object/from16 v0, p1

    invoke-virtual {v0, v10}, Landroid/view/MotionEvent;->getX(I)F

    move-result v15

    .line 318
    .local v15, "xPointerUp":F
    move-object/from16 v0, p1

    invoke-virtual {v0, v10}, Landroid/view/MotionEvent;->getY(I)F

    move-result v20

    .line 320
    .local v20, "yPointerUp":F
    new-instance v23, Lorg/cocos2dx/lib/Cocos2dxGLSurfaceView$8;

    move-object/from16 v0, v23

    move-object/from16 v1, p0

    move/from16 v2, v20

    invoke-direct {v0, v1, v7, v15, v2}, Lorg/cocos2dx/lib/Cocos2dxGLSurfaceView$8;-><init>(Lorg/cocos2dx/lib/Cocos2dxGLSurfaceView;IFF)V

    move-object/from16 v0, p0

    move-object/from16 v1, v23

    invoke-virtual {v0, v1}, Lorg/cocos2dx/lib/Cocos2dxGLSurfaceView;->queueEvent(Ljava/lang/Runnable;)V

    goto/16 :goto_1

    .line 334
    .end local v7    # "idPointerUp":I
    .end local v10    # "indexPointUp":I
    .end local v15    # "xPointerUp":F
    .end local v20    # "yPointerUp":F
    :pswitch_5
    const/16 v23, 0x0

    move-object/from16 v0, p1

    move/from16 v1, v23

    invoke-virtual {v0, v1}, Landroid/view/MotionEvent;->getPointerId(I)I

    move-result v8

    .line 335
    .local v8, "idUp":I
    const/16 v23, 0x0

    aget v16, v17, v23

    .line 336
    .local v16, "xUp":F
    const/16 v23, 0x0

    aget v21, v22, v23

    .line 338
    .local v21, "yUp":F
    new-instance v23, Lorg/cocos2dx/lib/Cocos2dxGLSurfaceView$9;

    move-object/from16 v0, v23

    move-object/from16 v1, p0

    move/from16 v2, v16

    move/from16 v3, v21

    invoke-direct {v0, v1, v8, v2, v3}, Lorg/cocos2dx/lib/Cocos2dxGLSurfaceView$9;-><init>(Lorg/cocos2dx/lib/Cocos2dxGLSurfaceView;IFF)V

    move-object/from16 v0, p0

    move-object/from16 v1, v23

    invoke-virtual {v0, v1}, Lorg/cocos2dx/lib/Cocos2dxGLSurfaceView;->queueEvent(Ljava/lang/Runnable;)V

    goto/16 :goto_1

    .line 351
    .end local v8    # "idUp":I
    .end local v16    # "xUp":F
    .end local v21    # "yUp":F
    :pswitch_6
    new-instance v23, Lorg/cocos2dx/lib/Cocos2dxGLSurfaceView$10;

    move-object/from16 v0, v23

    move-object/from16 v1, p0

    move-object/from16 v2, v17

    move-object/from16 v3, v22

    invoke-direct {v0, v1, v9, v2, v3}, Lorg/cocos2dx/lib/Cocos2dxGLSurfaceView$10;-><init>(Lorg/cocos2dx/lib/Cocos2dxGLSurfaceView;[I[F[F)V

    move-object/from16 v0, p0

    move-object/from16 v1, v23

    invoke-virtual {v0, v1}, Lorg/cocos2dx/lib/Cocos2dxGLSurfaceView;->queueEvent(Ljava/lang/Runnable;)V

    goto/16 :goto_1

    .line 261
    nop

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_2
        :pswitch_5
        :pswitch_3
        :pswitch_6
        :pswitch_0
        :pswitch_1
        :pswitch_4
    .end packed-switch
.end method

.method public setCocos2dxEditText(Lorg/cocos2dx/lib/Cocos2dxEditText;)V
    .locals 2
    .param p1, "pCocos2dxEditText"    # Lorg/cocos2dx/lib/Cocos2dxEditText;

    .prologue
    .line 192
    iput-object p1, p0, Lorg/cocos2dx/lib/Cocos2dxGLSurfaceView;->mCocos2dxEditText:Lorg/cocos2dx/lib/Cocos2dxEditText;

    .line 193
    iget-object v0, p0, Lorg/cocos2dx/lib/Cocos2dxGLSurfaceView;->mCocos2dxEditText:Lorg/cocos2dx/lib/Cocos2dxEditText;

    if-eqz v0, :cond_0

    .line 194
    sget-object v0, Lorg/cocos2dx/lib/Cocos2dxGLSurfaceView;->sCocos2dxTextInputWraper:Lorg/cocos2dx/lib/Cocos2dxTextInputWraper;

    if-eqz v0, :cond_0

    .line 196
    iget-object v0, p0, Lorg/cocos2dx/lib/Cocos2dxGLSurfaceView;->mCocos2dxEditText:Lorg/cocos2dx/lib/Cocos2dxEditText;

    .line 197
    sget-object v1, Lorg/cocos2dx/lib/Cocos2dxGLSurfaceView;->sCocos2dxTextInputWraper:Lorg/cocos2dx/lib/Cocos2dxTextInputWraper;

    invoke-virtual {v0, v1}, Lorg/cocos2dx/lib/Cocos2dxEditText;->setOnEditorActionListener(Landroid/widget/TextView$OnEditorActionListener;)V

    .line 198
    iget-object v0, p0, Lorg/cocos2dx/lib/Cocos2dxGLSurfaceView;->mCocos2dxEditText:Lorg/cocos2dx/lib/Cocos2dxEditText;

    invoke-virtual {v0, p0}, Lorg/cocos2dx/lib/Cocos2dxEditText;->setCocos2dxGLSurfaceView(Lorg/cocos2dx/lib/Cocos2dxGLSurfaceView;)V

    .line 199
    invoke-virtual {p0}, Lorg/cocos2dx/lib/Cocos2dxGLSurfaceView;->requestFocus()Z

    .line 201
    :cond_0
    return-void
.end method

.method public setCocos2dxRenderer(Lorg/cocos2dx/lib/Cocos2dxRenderer;)V
    .locals 1
    .param p1, "renderer"    # Lorg/cocos2dx/lib/Cocos2dxRenderer;

    .prologue
    .line 176
    iput-object p1, p0, Lorg/cocos2dx/lib/Cocos2dxGLSurfaceView;->mCocos2dxRenderer:Lorg/cocos2dx/lib/Cocos2dxRenderer;

    .line 177
    iget-object v0, p0, Lorg/cocos2dx/lib/Cocos2dxGLSurfaceView;->mCocos2dxRenderer:Lorg/cocos2dx/lib/Cocos2dxRenderer;

    invoke-virtual {p0, v0}, Lorg/cocos2dx/lib/Cocos2dxGLSurfaceView;->setRenderer(Landroid/opengl/GLSurfaceView$Renderer;)V

    .line 178
    return-void
.end method

.method public surfaceCreated(Landroid/view/SurfaceHolder;)V
    .locals 0
    .param p1, "holder"    # Landroid/view/SurfaceHolder;

    .prologue
    .line 210
    invoke-super {p0, p1}, Landroid/opengl/GLSurfaceView;->surfaceCreated(Landroid/view/SurfaceHolder;)V

    .line 211
    return-void
.end method
