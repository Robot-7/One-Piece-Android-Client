.class public Lcom/youai/push/pushsdk/MainActivity;
.super Landroid/app/Activity;
.source "MainActivity.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 9
    invoke-direct {p0}, Landroid/app/Activity;-><init>()V

    return-void
.end method


# virtual methods
.method protected onCreate(Landroid/os/Bundle;)V
    .locals 2
    .param p1, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    .line 13
    invoke-super {p0, p1}, Landroid/app/Activity;->onCreate(Landroid/os/Bundle;)V

    .line 14
    sget v0, Lcom/example/pushsdk/R$layout;->activity_main:I

    invoke-virtual {p0, v0}, Lcom/youai/push/pushsdk/MainActivity;->setContentView(I)V

    .line 15
    invoke-static {}, Lcom/youai/push/pushsdk/PushManager;->getInstance()Lcom/youai/push/pushsdk/PushManager;

    move-result-object v0

    invoke-virtual {p0}, Lcom/youai/push/pushsdk/MainActivity;->getBaseContext()Landroid/content/Context;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/youai/push/pushsdk/PushManager;->onCreate(Landroid/content/Context;)V

    .line 16
    return-void
.end method

.method public onCreateOptionsMenu(Landroid/view/Menu;)Z
    .locals 2
    .param p1, "menu"    # Landroid/view/Menu;

    .prologue
    .line 22
    invoke-virtual {p0}, Lcom/youai/push/pushsdk/MainActivity;->getMenuInflater()Landroid/view/MenuInflater;

    move-result-object v0

    sget v1, Lcom/example/pushsdk/R$menu;->main:I

    invoke-virtual {v0, v1, p1}, Landroid/view/MenuInflater;->inflate(ILandroid/view/Menu;)V

    .line 23
    const/4 v0, 0x1

    return v0
.end method
