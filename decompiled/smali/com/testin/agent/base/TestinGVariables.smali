.class public Lcom/testin/agent/base/TestinGVariables;
.super Landroid/app/Application;


# static fields
.field private static n:Lcom/testin/agent/base/TestinGVariables;


# instance fields
.field public a:Z

.field public b:Z

.field public c:Z

.field public d:Landroid/content/Context;

.field public e:Ljava/lang/String;

.field public f:Ljava/lang/String;

.field public g:Ljava/lang/String;

.field public h:Ljava/lang/Long;

.field public i:Ljava/lang/Long;

.field public j:Ljava/util/LinkedList;

.field public k:Ljava/util/Set;

.field private l:Lcom/testin/agent/d/d;

.field private m:Lcom/testin/agent/d/c;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    const/4 v0, 0x0

    sput-object v0, Lcom/testin/agent/base/TestinGVariables;->n:Lcom/testin/agent/base/TestinGVariables;

    return-void
.end method

.method private constructor <init>()V
    .locals 3

    const/4 v2, 0x1

    const/4 v1, 0x0

    invoke-direct {p0}, Landroid/app/Application;-><init>()V

    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/testin/agent/base/TestinGVariables;->a:Z

    iput-boolean v2, p0, Lcom/testin/agent/base/TestinGVariables;->b:Z

    iput-boolean v2, p0, Lcom/testin/agent/base/TestinGVariables;->c:Z

    iput-object v1, p0, Lcom/testin/agent/base/TestinGVariables;->d:Landroid/content/Context;

    const-string v0, ""

    iput-object v0, p0, Lcom/testin/agent/base/TestinGVariables;->e:Ljava/lang/String;

    const-string v0, ""

    iput-object v0, p0, Lcom/testin/agent/base/TestinGVariables;->f:Ljava/lang/String;

    const-string v0, ""

    iput-object v0, p0, Lcom/testin/agent/base/TestinGVariables;->g:Ljava/lang/String;

    iput-object v1, p0, Lcom/testin/agent/base/TestinGVariables;->l:Lcom/testin/agent/d/d;

    iput-object v1, p0, Lcom/testin/agent/base/TestinGVariables;->h:Ljava/lang/Long;

    iput-object v1, p0, Lcom/testin/agent/base/TestinGVariables;->i:Ljava/lang/Long;

    new-instance v0, Ljava/util/LinkedList;

    invoke-direct {v0}, Ljava/util/LinkedList;-><init>()V

    iput-object v0, p0, Lcom/testin/agent/base/TestinGVariables;->j:Ljava/util/LinkedList;

    new-instance v0, Ljava/util/HashSet;

    invoke-direct {v0}, Ljava/util/HashSet;-><init>()V

    iput-object v0, p0, Lcom/testin/agent/base/TestinGVariables;->k:Ljava/util/Set;

    iput-object v1, p0, Lcom/testin/agent/base/TestinGVariables;->m:Lcom/testin/agent/d/c;

    invoke-direct {p0}, Lcom/testin/agent/base/TestinGVariables;->d()V

    return-void
.end method

.method public static declared-synchronized c()Lcom/testin/agent/base/TestinGVariables;
    .locals 2

    const-class v1, Lcom/testin/agent/base/TestinGVariables;

    monitor-enter v1

    :try_start_0
    sget-object v0, Lcom/testin/agent/base/TestinGVariables;->n:Lcom/testin/agent/base/TestinGVariables;

    if-nez v0, :cond_0

    new-instance v0, Lcom/testin/agent/base/TestinGVariables;

    invoke-direct {v0}, Lcom/testin/agent/base/TestinGVariables;-><init>()V

    sput-object v0, Lcom/testin/agent/base/TestinGVariables;->n:Lcom/testin/agent/base/TestinGVariables;

    :cond_0
    sget-object v0, Lcom/testin/agent/base/TestinGVariables;->n:Lcom/testin/agent/base/TestinGVariables;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit v1

    return-object v0

    :catchall_0
    move-exception v0

    monitor-exit v1

    throw v0
.end method

.method private d()V
    .locals 1

    new-instance v0, Lcom/testin/agent/base/a;

    invoke-direct {v0, p0}, Lcom/testin/agent/base/a;-><init>(Lcom/testin/agent/base/TestinGVariables;)V

    invoke-virtual {v0}, Lcom/testin/agent/base/a;->start()V

    return-void
.end method


# virtual methods
.method public a()Lcom/testin/agent/d/d;
    .locals 1

    iget-object v0, p0, Lcom/testin/agent/base/TestinGVariables;->l:Lcom/testin/agent/d/d;

    return-object v0
.end method

.method public a(Lcom/testin/agent/d/c;)V
    .locals 0

    iput-object p1, p0, Lcom/testin/agent/base/TestinGVariables;->m:Lcom/testin/agent/d/c;

    return-void
.end method

.method public a(Lcom/testin/agent/d/d;)V
    .locals 0

    iput-object p1, p0, Lcom/testin/agent/base/TestinGVariables;->l:Lcom/testin/agent/d/d;

    return-void
.end method

.method public b()Lcom/testin/agent/d/c;
    .locals 1

    iget-object v0, p0, Lcom/testin/agent/base/TestinGVariables;->m:Lcom/testin/agent/d/c;

    return-object v0
.end method
