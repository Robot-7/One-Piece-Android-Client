.class public Lorg/cocos2dx/lib/Cocos2dxHandler;
.super Landroid/os/Handler;
.source "Cocos2dxHandler.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/cocos2dx/lib/Cocos2dxHandler$DialogMessage;,
        Lorg/cocos2dx/lib/Cocos2dxHandler$EditBoxMessage;,
        Lorg/cocos2dx/lib/Cocos2dxHandler$PayRechargeMessage;,
        Lorg/cocos2dx/lib/Cocos2dxHandler$ProgressMessage;,
        Lorg/cocos2dx/lib/Cocos2dxHandler$ShareMessage;,
        Lorg/cocos2dx/lib/Cocos2dxHandler$ShowWaitingViewMessage;
    }
.end annotation


# static fields
.field public static final HANDLER_MSG_TO_MAINTHREAD_CallPlatformAccountManage:I = 0x9

.field public static final HANDLER_MSG_TO_MAINTHREAD_CallPlatformBBS:I = 0xd

.field public static final HANDLER_MSG_TO_MAINTHREAD_CallPlatformFeedback:I = 0xb

.field public static final HANDLER_MSG_TO_MAINTHREAD_CallPlatformInit:I = 0x6

.field public static final HANDLER_MSG_TO_MAINTHREAD_CallPlatformLogin:I = 0x7

.field public static final HANDLER_MSG_TO_MAINTHREAD_CallPlatformLogout:I = 0x8

.field public static final HANDLER_MSG_TO_MAINTHREAD_CallPlatformPayRecharge:I = 0xa

.field public static final HANDLER_MSG_TO_MAINTHREAD_CallPlatformThirdShare:I = 0xc

.field public static final HANDLER_MSG_TO_MAINTHREAD_ChangeToCocos2dx:I = 0x5

.field public static final HANDLER_MSG_TO_MAINTHREAD_OnActivityPause:I = 0xf

.field public static final HANDLER_MSG_TO_MAINTHREAD_OnActivityResume:I = 0x10

.field public static final HANDLER_MSG_TO_MAINTHREAD_OnLowMemory:I = 0x12

.field public static final HANDLER_MSG_TO_MAINTHREAD_ShowCocos2dx:I = 0x0

.field public static final HANDLER_MSG_TO_MAINTHREAD_ShowToastMsg:I = 0x11

.field public static final HANDLER_MSG_TO_MAINTHREAD_ShowWaitingView:I = 0xe

.field public static final HANDLER_MSG_TO_MAINTHREAD_UpdateMoveAssetResProgress:I = 0x4

.field public static final HANDLER_SHOW_DIALOG:I = 0x1

.field public static final HANDLER_SHOW_EDITBOX_DIALOG:I = 0x2

.field public static final HANDLER_SHOW_QUESTION_DIALOG:I = 0x3

.field public static final bsDialogMsgId_Cocos2dxActivity_ExternalStorageNotOK:I = 0x3

.field public static final bsDialogMsgId_Cocos2dxActivity_NetworkNotOK:I = 0x2

.field public static final bsDialogMsgId_Cocos2dxActivity_OnLowMemory:I = 0x4

.field public static final bsDialogNegativeButtonId:I = 0x2

.field public static final bsDialogPositiveButtonId:I = 0x1

.field public static final bsQuestionDialogMsgId_Cocos2dxActivity_BackKeyPressed:I = 0x1


# instance fields
.field private mActivity:Ljava/lang/ref/WeakReference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/ref/WeakReference",
            "<",
            "Lorg/cocos2dx/lib/Cocos2dxActivity;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Lorg/cocos2dx/lib/Cocos2dxActivity;)V
    .locals 1
    .param p1, "activity"    # Lorg/cocos2dx/lib/Cocos2dxActivity;

    .prologue
    .line 78
    invoke-direct {p0}, Landroid/os/Handler;-><init>()V

    .line 79
    new-instance v0, Ljava/lang/ref/WeakReference;

    invoke-direct {v0, p1}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    iput-object v0, p0, Lorg/cocos2dx/lib/Cocos2dxHandler;->mActivity:Ljava/lang/ref/WeakReference;

    .line 80
    return-void
.end method

.method static synthetic access$0(Lorg/cocos2dx/lib/Cocos2dxHandler;)Ljava/lang/ref/WeakReference;
    .locals 1

    .prologue
    .line 73
    iget-object v0, p0, Lorg/cocos2dx/lib/Cocos2dxHandler;->mActivity:Ljava/lang/ref/WeakReference;

    return-object v0
.end method

.method private showDialog(Landroid/os/Message;)V
    .locals 8
    .param p1, "msg"    # Landroid/os/Message;

    .prologue
    .line 147
    iget-object v5, p0, Lorg/cocos2dx/lib/Cocos2dxHandler;->mActivity:Ljava/lang/ref/WeakReference;

    invoke-virtual {v5}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lorg/cocos2dx/lib/Cocos2dxActivity;

    .line 148
    .local v4, "theActivity":Lorg/cocos2dx/lib/Cocos2dxActivity;
    iget-object v0, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    check-cast v0, Lorg/cocos2dx/lib/Cocos2dxHandler$DialogMessage;

    .line 149
    .local v0, "dialogMessage":Lorg/cocos2dx/lib/Cocos2dxHandler$DialogMessage;
    iget v3, v0, Lorg/cocos2dx/lib/Cocos2dxHandler$DialogMessage;->msgId:I

    .line 151
    .local v3, "tag":I
    new-instance v5, Landroid/app/AlertDialog$Builder;

    invoke-direct {v5, v4}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    .line 152
    iget-object v6, v0, Lorg/cocos2dx/lib/Cocos2dxHandler$DialogMessage;->titile:Ljava/lang/String;

    invoke-virtual {v5, v6}, Landroid/app/AlertDialog$Builder;->setTitle(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object v5

    .line 153
    iget-object v6, v0, Lorg/cocos2dx/lib/Cocos2dxHandler$DialogMessage;->message:Ljava/lang/String;

    invoke-virtual {v5, v6}, Landroid/app/AlertDialog$Builder;->setMessage(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object v5

    .line 154
    const-string v6, "\u786e\u5b9a"

    .line 155
    new-instance v7, Lorg/cocos2dx/lib/Cocos2dxHandler$1;

    invoke-direct {v7, p0, v3}, Lorg/cocos2dx/lib/Cocos2dxHandler$1;-><init>(Lorg/cocos2dx/lib/Cocos2dxHandler;I)V

    .line 154
    invoke-virtual {v5, v6, v7}, Landroid/app/AlertDialog$Builder;->setPositiveButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v5

    .line 165
    new-instance v6, Lorg/cocos2dx/lib/Cocos2dxHandler$2;

    invoke-direct {v6, p0, v3}, Lorg/cocos2dx/lib/Cocos2dxHandler$2;-><init>(Lorg/cocos2dx/lib/Cocos2dxHandler;I)V

    invoke-virtual {v5, v6}, Landroid/app/AlertDialog$Builder;->setOnCancelListener(Landroid/content/DialogInterface$OnCancelListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v5

    .line 178
    invoke-virtual {v5}, Landroid/app/AlertDialog$Builder;->create()Landroid/app/AlertDialog;

    move-result-object v1

    .line 180
    .local v1, "dlg":Landroid/app/AlertDialog;
    const/4 v5, 0x0

    invoke-virtual {v1, v5}, Landroid/app/AlertDialog;->setCanceledOnTouchOutside(Z)V

    .line 183
    invoke-virtual {v1}, Landroid/app/AlertDialog;->getWindow()Landroid/view/Window;

    move-result-object v5

    invoke-virtual {v5}, Landroid/view/Window;->getAttributes()Landroid/view/WindowManager$LayoutParams;

    move-result-object v2

    .line 185
    .local v2, "lp":Landroid/view/WindowManager$LayoutParams;
    invoke-virtual {v1}, Landroid/app/AlertDialog;->getWindow()Landroid/view/Window;

    move-result-object v5

    invoke-virtual {v5, v2}, Landroid/view/Window;->setAttributes(Landroid/view/WindowManager$LayoutParams;)V

    .line 186
    invoke-virtual {v1}, Landroid/app/AlertDialog;->show()V

    .line 187
    return-void
.end method

.method private showEditBoxDialog(Landroid/os/Message;)V
    .locals 9
    .param p1, "msg"    # Landroid/os/Message;

    .prologue
    .line 237
    iget-object v8, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    check-cast v8, Lorg/cocos2dx/lib/Cocos2dxHandler$EditBoxMessage;

    .line 238
    .local v8, "editBoxMessage":Lorg/cocos2dx/lib/Cocos2dxHandler$EditBoxMessage;
    new-instance v0, Lorg/cocos2dx/lib/Cocos2dxEditBoxDialog;

    iget-object v1, p0, Lorg/cocos2dx/lib/Cocos2dxHandler;->mActivity:Ljava/lang/ref/WeakReference;

    invoke-virtual {v1}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/content/Context;

    .line 239
    iget-object v2, v8, Lorg/cocos2dx/lib/Cocos2dxHandler$EditBoxMessage;->title:Ljava/lang/String;

    .line 240
    iget-object v3, v8, Lorg/cocos2dx/lib/Cocos2dxHandler$EditBoxMessage;->content:Ljava/lang/String;

    .line 241
    iget v4, v8, Lorg/cocos2dx/lib/Cocos2dxHandler$EditBoxMessage;->inputMode:I

    .line 242
    iget v5, v8, Lorg/cocos2dx/lib/Cocos2dxHandler$EditBoxMessage;->inputFlag:I

    .line 243
    iget v6, v8, Lorg/cocos2dx/lib/Cocos2dxHandler$EditBoxMessage;->returnType:I

    .line 244
    iget v7, v8, Lorg/cocos2dx/lib/Cocos2dxHandler$EditBoxMessage;->maxLength:I

    .line 238
    invoke-direct/range {v0 .. v7}, Lorg/cocos2dx/lib/Cocos2dxEditBoxDialog;-><init>(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;IIII)V

    .line 244
    invoke-virtual {v0}, Lorg/cocos2dx/lib/Cocos2dxEditBoxDialog;->show()V

    .line 245
    return-void
.end method

.method private showQuestionDialog(Landroid/os/Message;)V
    .locals 7
    .param p1, "msg"    # Landroid/os/Message;

    .prologue
    .line 190
    iget-object v4, p0, Lorg/cocos2dx/lib/Cocos2dxHandler;->mActivity:Ljava/lang/ref/WeakReference;

    invoke-virtual {v4}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lorg/cocos2dx/lib/Cocos2dxActivity;

    .line 191
    .local v3, "theActivity":Lorg/cocos2dx/lib/Cocos2dxActivity;
    iget-object v0, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    check-cast v0, Lorg/cocos2dx/lib/Cocos2dxHandler$DialogMessage;

    .line 192
    .local v0, "dialogMessage":Lorg/cocos2dx/lib/Cocos2dxHandler$DialogMessage;
    new-instance v4, Landroid/app/AlertDialog$Builder;

    invoke-direct {v4, v3}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    .line 193
    iget-object v5, v0, Lorg/cocos2dx/lib/Cocos2dxHandler$DialogMessage;->titile:Ljava/lang/String;

    invoke-virtual {v4, v5}, Landroid/app/AlertDialog$Builder;->setTitle(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object v4

    .line 194
    iget-object v5, v0, Lorg/cocos2dx/lib/Cocos2dxHandler$DialogMessage;->message:Ljava/lang/String;

    invoke-virtual {v4, v5}, Landroid/app/AlertDialog$Builder;->setMessage(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object v4

    .line 195
    const-string v5, "\u786e\u5b9a"

    .line 196
    new-instance v6, Lorg/cocos2dx/lib/Cocos2dxHandler$3;

    invoke-direct {v6, p0, v0, v3}, Lorg/cocos2dx/lib/Cocos2dxHandler$3;-><init>(Lorg/cocos2dx/lib/Cocos2dxHandler;Lorg/cocos2dx/lib/Cocos2dxHandler$DialogMessage;Lorg/cocos2dx/lib/Cocos2dxActivity;)V

    .line 195
    invoke-virtual {v4, v5, v6}, Landroid/app/AlertDialog$Builder;->setPositiveButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v4

    .line 207
    const-string v5, "\u53d6\u6d88"

    .line 208
    new-instance v6, Lorg/cocos2dx/lib/Cocos2dxHandler$4;

    invoke-direct {v6, p0}, Lorg/cocos2dx/lib/Cocos2dxHandler$4;-><init>(Lorg/cocos2dx/lib/Cocos2dxHandler;)V

    .line 207
    invoke-virtual {v4, v5, v6}, Landroid/app/AlertDialog$Builder;->setNegativeButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v4

    .line 217
    new-instance v5, Lorg/cocos2dx/lib/Cocos2dxHandler$5;

    invoke-direct {v5, p0}, Lorg/cocos2dx/lib/Cocos2dxHandler$5;-><init>(Lorg/cocos2dx/lib/Cocos2dxHandler;)V

    invoke-virtual {v4, v5}, Landroid/app/AlertDialog$Builder;->setOnCancelListener(Landroid/content/DialogInterface$OnCancelListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v4

    .line 227
    invoke-virtual {v4}, Landroid/app/AlertDialog$Builder;->create()Landroid/app/AlertDialog;

    move-result-object v1

    .line 228
    .local v1, "dlg":Landroid/app/AlertDialog;
    const/4 v4, 0x0

    invoke-virtual {v1, v4}, Landroid/app/AlertDialog;->setCanceledOnTouchOutside(Z)V

    .line 230
    invoke-virtual {v1}, Landroid/app/AlertDialog;->getWindow()Landroid/view/Window;

    move-result-object v4

    invoke-virtual {v4}, Landroid/view/Window;->getAttributes()Landroid/view/WindowManager$LayoutParams;

    move-result-object v2

    .line 232
    .local v2, "lp":Landroid/view/WindowManager$LayoutParams;
    invoke-virtual {v1}, Landroid/app/AlertDialog;->getWindow()Landroid/view/Window;

    move-result-object v4

    invoke-virtual {v4, v2}, Landroid/view/Window;->setAttributes(Landroid/view/WindowManager$LayoutParams;)V

    .line 233
    invoke-virtual {v1}, Landroid/app/AlertDialog;->show()V

    .line 234
    return-void
.end method


# virtual methods
.method public handleMessage(Landroid/os/Message;)V
    .locals 2
    .param p1, "msg"    # Landroid/os/Message;

    .prologue
    .line 95
    iget v0, p1, Landroid/os/Message;->what:I

    packed-switch v0, :pswitch_data_0

    .line 144
    :goto_0
    :pswitch_0
    return-void

    .line 97
    :pswitch_1
    invoke-direct {p0, p1}, Lorg/cocos2dx/lib/Cocos2dxHandler;->showDialog(Landroid/os/Message;)V

    goto :goto_0

    .line 100
    :pswitch_2
    invoke-direct {p0, p1}, Lorg/cocos2dx/lib/Cocos2dxHandler;->showEditBoxDialog(Landroid/os/Message;)V

    goto :goto_0

    .line 103
    :pswitch_3
    invoke-direct {p0, p1}, Lorg/cocos2dx/lib/Cocos2dxHandler;->showQuestionDialog(Landroid/os/Message;)V

    goto :goto_0

    .line 135
    :pswitch_4
    iget-object v0, p0, Lorg/cocos2dx/lib/Cocos2dxHandler;->mActivity:Ljava/lang/ref/WeakReference;

    invoke-virtual {v0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/cocos2dx/lib/Cocos2dxActivity;

    iget-object v1, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    check-cast v1, Ljava/lang/String;

    invoke-virtual {v0, v1}, Lorg/cocos2dx/lib/Cocos2dxActivity;->showToastMsgImp(Ljava/lang/String;)V

    goto :goto_0

    .line 140
    :pswitch_5
    iget-object v0, p0, Lorg/cocos2dx/lib/Cocos2dxHandler;->mActivity:Ljava/lang/ref/WeakReference;

    invoke-virtual {v0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/cocos2dx/lib/Cocos2dxActivity;

    invoke-virtual {v0}, Lorg/cocos2dx/lib/Cocos2dxActivity;->onLowMemoryImp()V

    goto :goto_0

    .line 95
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
        :pswitch_1
        :pswitch_2
        :pswitch_3
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_4
        :pswitch_5
    .end packed-switch
.end method
