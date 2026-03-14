.class public Lcom/pipaw/pipawpay/PipawSDK;
.super Ljava/lang/Object;


# static fields
.field public static final LOGIN_EXIT:I = 0x7d0

.field public static final LOGIN_FAIL:I = 0x7d2

.field public static final LOGIN_SUCCESS:I = 0x7d1

.field public static final PAY_CANCEL:I = 0x3e8

.field public static final PAY_CHECK_SIGN_FAIL:I = 0x3eb

.field public static final PAY_FAIL:I = 0x3ea

.field public static final PAY_SUCCESS:I = 0x3e9

.field public static final REQUEST_LOGIN:I = 0xc8

.field public static final REQUEST_PAY:I = 0x64

.field private static final TAG:Ljava/lang/String;

.field private static volatile instance:Lcom/pipaw/pipawpay/PipawSDK;


# instance fields
.field private mLoginActivity:Landroid/app/Activity;

.field private mPayActivity:Landroid/app/Activity;

.field private mPipawLoginListener:Lcom/pipaw/pipawpay/PipawLoginListener;

.field private mPipawPayListener:Lcom/pipaw/pipawpay/PipawPayListener;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    const-class v0, Lcom/pipaw/pipawpay/PipawSDK;

    invoke-static {v0}, Lcom/pipaw/a/d;->a(Ljava/lang/Class;)Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/pipaw/pipawpay/PipawSDK;->TAG:Ljava/lang/String;

    return-void
.end method

.method private constructor <init>()V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static synthetic access$0()Ljava/lang/String;
    .locals 1

    sget-object v0, Lcom/pipaw/pipawpay/PipawSDK;->TAG:Ljava/lang/String;

    return-object v0
.end method

.method static synthetic access$1(Lcom/pipaw/pipawpay/PipawSDK;)Lcom/pipaw/pipawpay/PipawPayListener;
    .locals 1

    iget-object v0, p0, Lcom/pipaw/pipawpay/PipawSDK;->mPipawPayListener:Lcom/pipaw/pipawpay/PipawPayListener;

    return-object v0
.end method

.method static synthetic access$2(Lcom/pipaw/pipawpay/PipawSDK;Lcom/pipaw/pipawpay/PipawPayListener;)V
    .locals 0

    iput-object p1, p0, Lcom/pipaw/pipawpay/PipawSDK;->mPipawPayListener:Lcom/pipaw/pipawpay/PipawPayListener;

    return-void
.end method

.method static synthetic access$3(Lcom/pipaw/pipawpay/PipawSDK;Landroid/app/Activity;)V
    .locals 0

    iput-object p1, p0, Lcom/pipaw/pipawpay/PipawSDK;->mPayActivity:Landroid/app/Activity;

    return-void
.end method

.method static synthetic access$4(Lcom/pipaw/pipawpay/PipawSDK;)Lcom/pipaw/pipawpay/PipawLoginListener;
    .locals 1

    iget-object v0, p0, Lcom/pipaw/pipawpay/PipawSDK;->mPipawLoginListener:Lcom/pipaw/pipawpay/PipawLoginListener;

    return-object v0
.end method

.method static synthetic access$5(Lcom/pipaw/pipawpay/PipawSDK;Lcom/pipaw/pipawpay/PipawLoginListener;)V
    .locals 0

    iput-object p1, p0, Lcom/pipaw/pipawpay/PipawSDK;->mPipawLoginListener:Lcom/pipaw/pipawpay/PipawLoginListener;

    return-void
.end method

.method static synthetic access$6(Lcom/pipaw/pipawpay/PipawSDK;Landroid/app/Activity;)V
    .locals 0

    iput-object p1, p0, Lcom/pipaw/pipawpay/PipawSDK;->mLoginActivity:Landroid/app/Activity;

    return-void
.end method

.method public static getInstance()Lcom/pipaw/pipawpay/PipawSDK;
    .locals 2

    sget-object v0, Lcom/pipaw/pipawpay/PipawSDK;->instance:Lcom/pipaw/pipawpay/PipawSDK;

    if-nez v0, :cond_1

    const-class v1, Lcom/pipaw/pipawpay/PipawSDK;

    monitor-enter v1

    :try_start_0
    sget-object v0, Lcom/pipaw/pipawpay/PipawSDK;->instance:Lcom/pipaw/pipawpay/PipawSDK;

    if-nez v0, :cond_0

    new-instance v0, Lcom/pipaw/pipawpay/PipawSDK;

    invoke-direct {v0}, Lcom/pipaw/pipawpay/PipawSDK;-><init>()V

    sput-object v0, Lcom/pipaw/pipawpay/PipawSDK;->instance:Lcom/pipaw/pipawpay/PipawSDK;

    :cond_0
    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    :cond_1
    sget-object v0, Lcom/pipaw/pipawpay/PipawSDK;->instance:Lcom/pipaw/pipawpay/PipawSDK;

    return-object v0

    :catchall_0
    move-exception v0

    :try_start_1
    monitor-exit v1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v0
.end method


# virtual methods
.method public login(Landroid/app/Activity;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lcom/pipaw/pipawpay/PipawLoginListener;)V
    .locals 2

    iput-object p1, p0, Lcom/pipaw/pipawpay/PipawSDK;->mLoginActivity:Landroid/app/Activity;

    iput-object p5, p0, Lcom/pipaw/pipawpay/PipawSDK;->mPipawLoginListener:Lcom/pipaw/pipawpay/PipawLoginListener;

    new-instance v0, Landroid/content/Intent;

    const-class v1, Lcom/pipaw/pipawpay/PipawUserActivity;

    invoke-direct {v0, p1, v1}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    const-string v1, "merchantId"

    invoke-virtual {v0, v1, p2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    const-string v1, "merchantAppId"

    invoke-virtual {v0, v1, p3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    const-string v1, "appId"

    invoke-virtual {v0, v1, p4}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    invoke-virtual {p1, v0}, Landroid/app/Activity;->startActivity(Landroid/content/Intent;)V

    return-void
.end method

.method loginCallback(ILjava/lang/String;)V
    .locals 2

    iget-object v0, p0, Lcom/pipaw/pipawpay/PipawSDK;->mLoginActivity:Landroid/app/Activity;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/pipaw/pipawpay/PipawSDK;->mPipawLoginListener:Lcom/pipaw/pipawpay/PipawLoginListener;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/pipaw/pipawpay/PipawSDK;->mLoginActivity:Landroid/app/Activity;

    new-instance v1, Lcom/pipaw/pipawpay/e;

    invoke-direct {v1, p0, p1, p2}, Lcom/pipaw/pipawpay/e;-><init>(Lcom/pipaw/pipawpay/PipawSDK;ILjava/lang/String;)V

    invoke-virtual {v0, v1}, Landroid/app/Activity;->runOnUiThread(Ljava/lang/Runnable;)V

    :cond_0
    return-void
.end method

.method public pay(Landroid/app/Activity;Lcom/pipaw/pipawpay/PipawPayRequest;Lcom/pipaw/pipawpay/PipawPayListener;)V
    .locals 2

    iput-object p1, p0, Lcom/pipaw/pipawpay/PipawSDK;->mPayActivity:Landroid/app/Activity;

    iput-object p3, p0, Lcom/pipaw/pipawpay/PipawSDK;->mPipawPayListener:Lcom/pipaw/pipawpay/PipawPayListener;

    new-instance v0, Landroid/content/Intent;

    const-class v1, Lcom/pipaw/pipawpay/PipawPayActivity;

    invoke-direct {v0, p1, v1}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    const-string v1, "pay_request"

    invoke-virtual {v0, v1, p2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Landroid/os/Parcelable;)Landroid/content/Intent;

    invoke-virtual {p1, v0}, Landroid/app/Activity;->startActivity(Landroid/content/Intent;)V

    return-void
.end method

.method payCallback(ILjava/lang/String;)V
    .locals 2

    sget-object v0, Lcom/pipaw/pipawpay/PipawSDK;->TAG:Ljava/lang/String;

    invoke-static {v0}, Lcom/pipaw/a/d;->a(Ljava/lang/String;)V

    iget-object v0, p0, Lcom/pipaw/pipawpay/PipawSDK;->mPayActivity:Landroid/app/Activity;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/pipaw/pipawpay/PipawSDK;->mPipawPayListener:Lcom/pipaw/pipawpay/PipawPayListener;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/pipaw/pipawpay/PipawSDK;->mPayActivity:Landroid/app/Activity;

    new-instance v1, Lcom/pipaw/pipawpay/d;

    invoke-direct {v1, p0, p1, p2}, Lcom/pipaw/pipawpay/d;-><init>(Lcom/pipaw/pipawpay/PipawSDK;ILjava/lang/String;)V

    invoke-virtual {v0, v1}, Landroid/app/Activity;->runOnUiThread(Ljava/lang/Runnable;)V

    :cond_0
    return-void
.end method
