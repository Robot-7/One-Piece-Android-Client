.class Lcom/testin/agent/b/g;
.super Landroid/os/Handler;


# instance fields
.field final synthetic a:Lcom/testin/agent/b/f;


# direct methods
.method constructor <init>(Lcom/testin/agent/b/f;Landroid/os/Looper;)V
    .locals 0

    iput-object p1, p0, Lcom/testin/agent/b/g;->a:Lcom/testin/agent/b/f;

    invoke-direct {p0, p2}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    return-void
.end method


# virtual methods
.method public handleMessage(Landroid/os/Message;)V
    .locals 1

    iget v0, p1, Landroid/os/Message;->what:I

    packed-switch v0, :pswitch_data_0

    :goto_0
    return-void

    :pswitch_0
    invoke-static {}, Lcom/testin/agent/a/a;->b()V

    goto :goto_0

    :pswitch_data_0
    .packed-switch 0xa
        :pswitch_0
    .end packed-switch
.end method
