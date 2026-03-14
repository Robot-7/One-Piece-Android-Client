.class Lcom/testin/agent/nativecrash/a;
.super Ljava/lang/Object;

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field final synthetic a:Lcom/testin/agent/nativecrash/NativeCrash;

.field private final synthetic b:Ljava/lang/String;


# direct methods
.method constructor <init>(Lcom/testin/agent/nativecrash/NativeCrash;Ljava/lang/String;)V
    .locals 0

    iput-object p1, p0, Lcom/testin/agent/nativecrash/a;->a:Lcom/testin/agent/nativecrash/NativeCrash;

    iput-object p2, p0, Lcom/testin/agent/nativecrash/a;->b:Ljava/lang/String;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 3

    const/4 v2, 0x1

    const/4 v0, 0x0

    :try_start_0
    invoke-static {v0}, Lcom/testin/agent/f/e;->a(Ljava/lang/Long;)V

    iget-object v0, p0, Lcom/testin/agent/nativecrash/a;->b:Ljava/lang/String;

    invoke-static {v0}, Lcom/testin/agent/nativecrash/b;->b(Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    iget-object v0, p0, Lcom/testin/agent/nativecrash/a;->a:Lcom/testin/agent/nativecrash/NativeCrash;

    invoke-static {v0, v2}, Lcom/testin/agent/nativecrash/NativeCrash;->access$0(Lcom/testin/agent/nativecrash/NativeCrash;Z)V

    :goto_0
    return-void

    :catch_0
    move-exception v0

    :try_start_1
    invoke-static {v0}, Lcom/testin/agent/b/e;->a(Ljava/lang/Exception;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    iget-object v0, p0, Lcom/testin/agent/nativecrash/a;->a:Lcom/testin/agent/nativecrash/NativeCrash;

    invoke-static {v0, v2}, Lcom/testin/agent/nativecrash/NativeCrash;->access$0(Lcom/testin/agent/nativecrash/NativeCrash;Z)V

    goto :goto_0

    :catchall_0
    move-exception v0

    iget-object v1, p0, Lcom/testin/agent/nativecrash/a;->a:Lcom/testin/agent/nativecrash/NativeCrash;

    invoke-static {v1, v2}, Lcom/testin/agent/nativecrash/NativeCrash;->access$0(Lcom/testin/agent/nativecrash/NativeCrash;Z)V

    throw v0
.end method
