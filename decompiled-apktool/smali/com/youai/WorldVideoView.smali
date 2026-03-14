.class public Lcom/youai/WorldVideoView;
.super Landroid/view/SurfaceView;
.source "WorldVideoView.java"

# interfaces
.implements Landroid/view/SurfaceHolder$Callback;
.implements Landroid/widget/MediaController$MediaPlayerControl;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/youai/WorldVideoView$MySizeChangeLinstener;
    }
.end annotation


# instance fields
.field private mBufferingUpdateListener:Landroid/media/MediaPlayer$OnBufferingUpdateListener;

.field private mCompletionListener:Landroid/media/MediaPlayer$OnCompletionListener;

.field private mContext:Landroid/content/Context;

.field private mCurrentBufferPercentage:I

.field private mDuration:I

.field private mErrorListener:Landroid/media/MediaPlayer$OnErrorListener;

.field private mIsPrepared:Z

.field private mMediaController:Landroid/widget/MediaController;

.field private mMediaPlayer:Landroid/media/MediaPlayer;

.field private mMyChangeLinstener:Lcom/youai/WorldVideoView$MySizeChangeLinstener;

.field private mOnCompletionListener:Landroid/media/MediaPlayer$OnCompletionListener;

.field private mOnErrorListener:Landroid/media/MediaPlayer$OnErrorListener;

.field private mOnPreparedListener:Landroid/media/MediaPlayer$OnPreparedListener;

.field mPreparedListener:Landroid/media/MediaPlayer$OnPreparedListener;

.field private mSeekWhenPrepared:I

.field mSizeChangedListener:Landroid/media/MediaPlayer$OnVideoSizeChangedListener;

.field private mStartWhenPrepared:Z

.field private mSurfaceHeight:I

.field private mSurfaceHolder:Landroid/view/SurfaceHolder;

.field private mSurfaceWidth:I

.field private mUri:Landroid/net/Uri;

.field private mVideoHeight:I

.field private mVideoWidth:I


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 1
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    const/4 v0, 0x0

    .line 73
    invoke-direct {p0, p1}, Landroid/view/SurfaceView;-><init>(Landroid/content/Context;)V

    .line 32
    iput-object v0, p0, Lcom/youai/WorldVideoView;->mSurfaceHolder:Landroid/view/SurfaceHolder;

    .line 33
    iput-object v0, p0, Lcom/youai/WorldVideoView;->mMediaPlayer:Landroid/media/MediaPlayer;

    .line 232
    new-instance v0, Lcom/youai/WorldVideoView$1;

    invoke-direct {v0, p0}, Lcom/youai/WorldVideoView$1;-><init>(Lcom/youai/WorldVideoView;)V

    iput-object v0, p0, Lcom/youai/WorldVideoView;->mSizeChangedListener:Landroid/media/MediaPlayer$OnVideoSizeChangedListener;

    .line 247
    new-instance v0, Lcom/youai/WorldVideoView$2;

    invoke-direct {v0, p0}, Lcom/youai/WorldVideoView$2;-><init>(Lcom/youai/WorldVideoView;)V

    iput-object v0, p0, Lcom/youai/WorldVideoView;->mPreparedListener:Landroid/media/MediaPlayer$OnPreparedListener;

    .line 304
    new-instance v0, Lcom/youai/WorldVideoView$3;

    invoke-direct {v0, p0}, Lcom/youai/WorldVideoView$3;-><init>(Lcom/youai/WorldVideoView;)V

    iput-object v0, p0, Lcom/youai/WorldVideoView;->mCompletionListener:Landroid/media/MediaPlayer$OnCompletionListener;

    .line 315
    new-instance v0, Lcom/youai/WorldVideoView$4;

    invoke-direct {v0, p0}, Lcom/youai/WorldVideoView$4;-><init>(Lcom/youai/WorldVideoView;)V

    iput-object v0, p0, Lcom/youai/WorldVideoView;->mErrorListener:Landroid/media/MediaPlayer$OnErrorListener;

    .line 365
    new-instance v0, Lcom/youai/WorldVideoView$5;

    invoke-direct {v0, p0}, Lcom/youai/WorldVideoView$5;-><init>(Lcom/youai/WorldVideoView;)V

    iput-object v0, p0, Lcom/youai/WorldVideoView;->mBufferingUpdateListener:Landroid/media/MediaPlayer$OnBufferingUpdateListener;

    .line 74
    iput-object p1, p0, Lcom/youai/WorldVideoView;->mContext:Landroid/content/Context;

    .line 75
    invoke-direct {p0}, Lcom/youai/WorldVideoView;->initVideoView()V

    .line 76
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 1
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;

    .prologue
    .line 79
    const/4 v0, 0x0

    invoke-direct {p0, p1, p2, v0}, Lcom/youai/WorldVideoView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 80
    iput-object p1, p0, Lcom/youai/WorldVideoView;->mContext:Landroid/content/Context;

    .line 81
    invoke-direct {p0}, Lcom/youai/WorldVideoView;->initVideoView()V

    .line 82
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 1
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;
    .param p3, "defStyle"    # I

    .prologue
    const/4 v0, 0x0

    .line 85
    invoke-direct {p0, p1, p2, p3}, Landroid/view/SurfaceView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 32
    iput-object v0, p0, Lcom/youai/WorldVideoView;->mSurfaceHolder:Landroid/view/SurfaceHolder;

    .line 33
    iput-object v0, p0, Lcom/youai/WorldVideoView;->mMediaPlayer:Landroid/media/MediaPlayer;

    .line 232
    new-instance v0, Lcom/youai/WorldVideoView$1;

    invoke-direct {v0, p0}, Lcom/youai/WorldVideoView$1;-><init>(Lcom/youai/WorldVideoView;)V

    iput-object v0, p0, Lcom/youai/WorldVideoView;->mSizeChangedListener:Landroid/media/MediaPlayer$OnVideoSizeChangedListener;

    .line 247
    new-instance v0, Lcom/youai/WorldVideoView$2;

    invoke-direct {v0, p0}, Lcom/youai/WorldVideoView$2;-><init>(Lcom/youai/WorldVideoView;)V

    iput-object v0, p0, Lcom/youai/WorldVideoView;->mPreparedListener:Landroid/media/MediaPlayer$OnPreparedListener;

    .line 304
    new-instance v0, Lcom/youai/WorldVideoView$3;

    invoke-direct {v0, p0}, Lcom/youai/WorldVideoView$3;-><init>(Lcom/youai/WorldVideoView;)V

    iput-object v0, p0, Lcom/youai/WorldVideoView;->mCompletionListener:Landroid/media/MediaPlayer$OnCompletionListener;

    .line 315
    new-instance v0, Lcom/youai/WorldVideoView$4;

    invoke-direct {v0, p0}, Lcom/youai/WorldVideoView$4;-><init>(Lcom/youai/WorldVideoView;)V

    iput-object v0, p0, Lcom/youai/WorldVideoView;->mErrorListener:Landroid/media/MediaPlayer$OnErrorListener;

    .line 365
    new-instance v0, Lcom/youai/WorldVideoView$5;

    invoke-direct {v0, p0}, Lcom/youai/WorldVideoView$5;-><init>(Lcom/youai/WorldVideoView;)V

    iput-object v0, p0, Lcom/youai/WorldVideoView;->mBufferingUpdateListener:Landroid/media/MediaPlayer$OnBufferingUpdateListener;

    .line 86
    iput-object p1, p0, Lcom/youai/WorldVideoView;->mContext:Landroid/content/Context;

    .line 87
    invoke-direct {p0}, Lcom/youai/WorldVideoView;->initVideoView()V

    .line 88
    return-void
.end method

.method static synthetic access$000(Lcom/youai/WorldVideoView;)I
    .locals 1
    .param p0, "x0"    # Lcom/youai/WorldVideoView;

    .prologue
    .line 22
    iget v0, p0, Lcom/youai/WorldVideoView;->mVideoWidth:I

    return v0
.end method

.method static synthetic access$002(Lcom/youai/WorldVideoView;I)I
    .locals 0
    .param p0, "x0"    # Lcom/youai/WorldVideoView;
    .param p1, "x1"    # I

    .prologue
    .line 22
    iput p1, p0, Lcom/youai/WorldVideoView;->mVideoWidth:I

    return p1
.end method

.method static synthetic access$100(Lcom/youai/WorldVideoView;)I
    .locals 1
    .param p0, "x0"    # Lcom/youai/WorldVideoView;

    .prologue
    .line 22
    iget v0, p0, Lcom/youai/WorldVideoView;->mVideoHeight:I

    return v0
.end method

.method static synthetic access$1000(Lcom/youai/WorldVideoView;)Z
    .locals 1
    .param p0, "x0"    # Lcom/youai/WorldVideoView;

    .prologue
    .line 22
    iget-boolean v0, p0, Lcom/youai/WorldVideoView;->mStartWhenPrepared:Z

    return v0
.end method

.method static synthetic access$1002(Lcom/youai/WorldVideoView;Z)Z
    .locals 0
    .param p0, "x0"    # Lcom/youai/WorldVideoView;
    .param p1, "x1"    # Z

    .prologue
    .line 22
    iput-boolean p1, p0, Lcom/youai/WorldVideoView;->mStartWhenPrepared:Z

    return p1
.end method

.method static synthetic access$102(Lcom/youai/WorldVideoView;I)I
    .locals 0
    .param p0, "x0"    # Lcom/youai/WorldVideoView;
    .param p1, "x1"    # I

    .prologue
    .line 22
    iput p1, p0, Lcom/youai/WorldVideoView;->mVideoHeight:I

    return p1
.end method

.method static synthetic access$1100(Lcom/youai/WorldVideoView;)Landroid/media/MediaPlayer$OnCompletionListener;
    .locals 1
    .param p0, "x0"    # Lcom/youai/WorldVideoView;

    .prologue
    .line 22
    iget-object v0, p0, Lcom/youai/WorldVideoView;->mOnCompletionListener:Landroid/media/MediaPlayer$OnCompletionListener;

    return-object v0
.end method

.method static synthetic access$1200(Lcom/youai/WorldVideoView;)Landroid/media/MediaPlayer$OnErrorListener;
    .locals 1
    .param p0, "x0"    # Lcom/youai/WorldVideoView;

    .prologue
    .line 22
    iget-object v0, p0, Lcom/youai/WorldVideoView;->mOnErrorListener:Landroid/media/MediaPlayer$OnErrorListener;

    return-object v0
.end method

.method static synthetic access$1302(Lcom/youai/WorldVideoView;I)I
    .locals 0
    .param p0, "x0"    # Lcom/youai/WorldVideoView;
    .param p1, "x1"    # I

    .prologue
    .line 22
    iput p1, p0, Lcom/youai/WorldVideoView;->mCurrentBufferPercentage:I

    return p1
.end method

.method static synthetic access$200(Lcom/youai/WorldVideoView;)Lcom/youai/WorldVideoView$MySizeChangeLinstener;
    .locals 1
    .param p0, "x0"    # Lcom/youai/WorldVideoView;

    .prologue
    .line 22
    iget-object v0, p0, Lcom/youai/WorldVideoView;->mMyChangeLinstener:Lcom/youai/WorldVideoView$MySizeChangeLinstener;

    return-object v0
.end method

.method static synthetic access$302(Lcom/youai/WorldVideoView;Z)Z
    .locals 0
    .param p0, "x0"    # Lcom/youai/WorldVideoView;
    .param p1, "x1"    # Z

    .prologue
    .line 22
    iput-boolean p1, p0, Lcom/youai/WorldVideoView;->mIsPrepared:Z

    return p1
.end method

.method static synthetic access$400(Lcom/youai/WorldVideoView;)Landroid/media/MediaPlayer$OnPreparedListener;
    .locals 1
    .param p0, "x0"    # Lcom/youai/WorldVideoView;

    .prologue
    .line 22
    iget-object v0, p0, Lcom/youai/WorldVideoView;->mOnPreparedListener:Landroid/media/MediaPlayer$OnPreparedListener;

    return-object v0
.end method

.method static synthetic access$500(Lcom/youai/WorldVideoView;)Landroid/media/MediaPlayer;
    .locals 1
    .param p0, "x0"    # Lcom/youai/WorldVideoView;

    .prologue
    .line 22
    iget-object v0, p0, Lcom/youai/WorldVideoView;->mMediaPlayer:Landroid/media/MediaPlayer;

    return-object v0
.end method

.method static synthetic access$600(Lcom/youai/WorldVideoView;)Landroid/widget/MediaController;
    .locals 1
    .param p0, "x0"    # Lcom/youai/WorldVideoView;

    .prologue
    .line 22
    iget-object v0, p0, Lcom/youai/WorldVideoView;->mMediaController:Landroid/widget/MediaController;

    return-object v0
.end method

.method static synthetic access$700(Lcom/youai/WorldVideoView;)I
    .locals 1
    .param p0, "x0"    # Lcom/youai/WorldVideoView;

    .prologue
    .line 22
    iget v0, p0, Lcom/youai/WorldVideoView;->mSurfaceWidth:I

    return v0
.end method

.method static synthetic access$800(Lcom/youai/WorldVideoView;)I
    .locals 1
    .param p0, "x0"    # Lcom/youai/WorldVideoView;

    .prologue
    .line 22
    iget v0, p0, Lcom/youai/WorldVideoView;->mSurfaceHeight:I

    return v0
.end method

.method static synthetic access$900(Lcom/youai/WorldVideoView;)I
    .locals 1
    .param p0, "x0"    # Lcom/youai/WorldVideoView;

    .prologue
    .line 22
    iget v0, p0, Lcom/youai/WorldVideoView;->mSeekWhenPrepared:I

    return v0
.end method

.method static synthetic access$902(Lcom/youai/WorldVideoView;I)I
    .locals 0
    .param p0, "x0"    # Lcom/youai/WorldVideoView;
    .param p1, "x1"    # I

    .prologue
    .line 22
    iput p1, p0, Lcom/youai/WorldVideoView;->mSeekWhenPrepared:I

    return p1
.end method

.method private attachMediaController()V
    .locals 3

    .prologue
    .line 223
    iget-object v1, p0, Lcom/youai/WorldVideoView;->mMediaPlayer:Landroid/media/MediaPlayer;

    if-eqz v1, :cond_0

    iget-object v1, p0, Lcom/youai/WorldVideoView;->mMediaController:Landroid/widget/MediaController;

    if-eqz v1, :cond_0

    .line 224
    iget-object v1, p0, Lcom/youai/WorldVideoView;->mMediaController:Landroid/widget/MediaController;

    invoke-virtual {v1, p0}, Landroid/widget/MediaController;->setMediaPlayer(Landroid/widget/MediaController$MediaPlayerControl;)V

    .line 225
    invoke-virtual {p0}, Lcom/youai/WorldVideoView;->getParent()Landroid/view/ViewParent;

    move-result-object v1

    instance-of v1, v1, Landroid/view/View;

    if-eqz v1, :cond_1

    invoke-virtual {p0}, Lcom/youai/WorldVideoView;->getParent()Landroid/view/ViewParent;

    move-result-object v1

    check-cast v1, Landroid/view/View;

    move-object v0, v1

    .line 227
    .local v0, "anchorView":Landroid/view/View;
    :goto_0
    iget-object v1, p0, Lcom/youai/WorldVideoView;->mMediaController:Landroid/widget/MediaController;

    invoke-virtual {v1, v0}, Landroid/widget/MediaController;->setAnchorView(Landroid/view/View;)V

    .line 228
    iget-object v1, p0, Lcom/youai/WorldVideoView;->mMediaController:Landroid/widget/MediaController;

    iget-boolean v2, p0, Lcom/youai/WorldVideoView;->mIsPrepared:Z

    invoke-virtual {v1, v2}, Landroid/widget/MediaController;->setEnabled(Z)V

    .line 230
    .end local v0    # "anchorView":Landroid/view/View;
    :cond_0
    return-void

    :cond_1
    move-object v0, p0

    .line 225
    goto :goto_0
.end method

.method private initVideoView()V
    .locals 3

    .prologue
    const/4 v2, 0x1

    const/4 v0, 0x0

    .line 142
    iput v0, p0, Lcom/youai/WorldVideoView;->mVideoWidth:I

    .line 143
    iput v0, p0, Lcom/youai/WorldVideoView;->mVideoHeight:I

    .line 144
    invoke-virtual {p0}, Lcom/youai/WorldVideoView;->getHolder()Landroid/view/SurfaceHolder;

    move-result-object v0

    invoke-interface {v0, p0}, Landroid/view/SurfaceHolder;->addCallback(Landroid/view/SurfaceHolder$Callback;)V

    .line 145
    invoke-virtual {p0}, Lcom/youai/WorldVideoView;->getHolder()Landroid/view/SurfaceHolder;

    move-result-object v0

    const/4 v1, 0x3

    invoke-interface {v0, v1}, Landroid/view/SurfaceHolder;->setType(I)V

    .line 146
    invoke-virtual {p0, v2}, Lcom/youai/WorldVideoView;->setFocusable(Z)V

    .line 147
    invoke-virtual {p0, v2}, Lcom/youai/WorldVideoView;->setFocusableInTouchMode(Z)V

    .line 148
    invoke-virtual {p0}, Lcom/youai/WorldVideoView;->requestFocus()Z

    .line 149
    return-void
.end method

.method private openVideo()V
    .locals 5

    .prologue
    .line 172
    iget-object v2, p0, Lcom/youai/WorldVideoView;->mUri:Landroid/net/Uri;

    if-eqz v2, :cond_0

    iget-object v2, p0, Lcom/youai/WorldVideoView;->mSurfaceHolder:Landroid/view/SurfaceHolder;

    if-nez v2, :cond_1

    .line 212
    :cond_0
    :goto_0
    return-void

    .line 179
    :cond_1
    new-instance v1, Landroid/content/Intent;

    const-string v2, "com.android.music.musicservicecommand"

    invoke-direct {v1, v2}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 180
    .local v1, "i":Landroid/content/Intent;
    const-string v2, "command"

    const-string v3, "pause"

    invoke-virtual {v1, v2, v3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 181
    iget-object v2, p0, Lcom/youai/WorldVideoView;->mContext:Landroid/content/Context;

    invoke-virtual {v2, v1}, Landroid/content/Context;->sendBroadcast(Landroid/content/Intent;)V

    .line 183
    iget-object v2, p0, Lcom/youai/WorldVideoView;->mMediaPlayer:Landroid/media/MediaPlayer;

    if-eqz v2, :cond_2

    .line 184
    iget-object v2, p0, Lcom/youai/WorldVideoView;->mMediaPlayer:Landroid/media/MediaPlayer;

    invoke-virtual {v2}, Landroid/media/MediaPlayer;->reset()V

    .line 185
    iget-object v2, p0, Lcom/youai/WorldVideoView;->mMediaPlayer:Landroid/media/MediaPlayer;

    invoke-virtual {v2}, Landroid/media/MediaPlayer;->release()V

    .line 186
    const/4 v2, 0x0

    iput-object v2, p0, Lcom/youai/WorldVideoView;->mMediaPlayer:Landroid/media/MediaPlayer;

    .line 189
    :cond_2
    :try_start_0
    new-instance v2, Landroid/media/MediaPlayer;

    invoke-direct {v2}, Landroid/media/MediaPlayer;-><init>()V

    iput-object v2, p0, Lcom/youai/WorldVideoView;->mMediaPlayer:Landroid/media/MediaPlayer;

    .line 190
    iget-object v2, p0, Lcom/youai/WorldVideoView;->mMediaPlayer:Landroid/media/MediaPlayer;

    iget-object v3, p0, Lcom/youai/WorldVideoView;->mPreparedListener:Landroid/media/MediaPlayer$OnPreparedListener;

    invoke-virtual {v2, v3}, Landroid/media/MediaPlayer;->setOnPreparedListener(Landroid/media/MediaPlayer$OnPreparedListener;)V

    .line 191
    iget-object v2, p0, Lcom/youai/WorldVideoView;->mMediaPlayer:Landroid/media/MediaPlayer;

    iget-object v3, p0, Lcom/youai/WorldVideoView;->mSizeChangedListener:Landroid/media/MediaPlayer$OnVideoSizeChangedListener;

    invoke-virtual {v2, v3}, Landroid/media/MediaPlayer;->setOnVideoSizeChangedListener(Landroid/media/MediaPlayer$OnVideoSizeChangedListener;)V

    .line 192
    const/4 v2, 0x0

    iput-boolean v2, p0, Lcom/youai/WorldVideoView;->mIsPrepared:Z

    .line 194
    const/4 v2, -0x1

    iput v2, p0, Lcom/youai/WorldVideoView;->mDuration:I

    .line 195
    iget-object v2, p0, Lcom/youai/WorldVideoView;->mMediaPlayer:Landroid/media/MediaPlayer;

    iget-object v3, p0, Lcom/youai/WorldVideoView;->mCompletionListener:Landroid/media/MediaPlayer$OnCompletionListener;

    invoke-virtual {v2, v3}, Landroid/media/MediaPlayer;->setOnCompletionListener(Landroid/media/MediaPlayer$OnCompletionListener;)V

    .line 196
    iget-object v2, p0, Lcom/youai/WorldVideoView;->mMediaPlayer:Landroid/media/MediaPlayer;

    iget-object v3, p0, Lcom/youai/WorldVideoView;->mErrorListener:Landroid/media/MediaPlayer$OnErrorListener;

    invoke-virtual {v2, v3}, Landroid/media/MediaPlayer;->setOnErrorListener(Landroid/media/MediaPlayer$OnErrorListener;)V

    .line 197
    iget-object v2, p0, Lcom/youai/WorldVideoView;->mMediaPlayer:Landroid/media/MediaPlayer;

    iget-object v3, p0, Lcom/youai/WorldVideoView;->mBufferingUpdateListener:Landroid/media/MediaPlayer$OnBufferingUpdateListener;

    invoke-virtual {v2, v3}, Landroid/media/MediaPlayer;->setOnBufferingUpdateListener(Landroid/media/MediaPlayer$OnBufferingUpdateListener;)V

    .line 198
    const/4 v2, 0x0

    iput v2, p0, Lcom/youai/WorldVideoView;->mCurrentBufferPercentage:I

    .line 199
    iget-object v2, p0, Lcom/youai/WorldVideoView;->mMediaPlayer:Landroid/media/MediaPlayer;

    iget-object v3, p0, Lcom/youai/WorldVideoView;->mContext:Landroid/content/Context;

    iget-object v4, p0, Lcom/youai/WorldVideoView;->mUri:Landroid/net/Uri;

    invoke-virtual {v2, v3, v4}, Landroid/media/MediaPlayer;->setDataSource(Landroid/content/Context;Landroid/net/Uri;)V

    .line 200
    iget-object v2, p0, Lcom/youai/WorldVideoView;->mMediaPlayer:Landroid/media/MediaPlayer;

    iget-object v3, p0, Lcom/youai/WorldVideoView;->mSurfaceHolder:Landroid/view/SurfaceHolder;

    invoke-virtual {v2, v3}, Landroid/media/MediaPlayer;->setDisplay(Landroid/view/SurfaceHolder;)V

    .line 201
    iget-object v2, p0, Lcom/youai/WorldVideoView;->mMediaPlayer:Landroid/media/MediaPlayer;

    const/4 v3, 0x3

    invoke-virtual {v2, v3}, Landroid/media/MediaPlayer;->setAudioStreamType(I)V

    .line 202
    iget-object v2, p0, Lcom/youai/WorldVideoView;->mMediaPlayer:Landroid/media/MediaPlayer;

    const/4 v3, 0x1

    invoke-virtual {v2, v3}, Landroid/media/MediaPlayer;->setScreenOnWhilePlaying(Z)V

    .line 203
    iget-object v2, p0, Lcom/youai/WorldVideoView;->mMediaPlayer:Landroid/media/MediaPlayer;

    invoke-virtual {v2}, Landroid/media/MediaPlayer;->prepareAsync()V

    .line 204
    invoke-direct {p0}, Lcom/youai/WorldVideoView;->attachMediaController()V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/lang/IllegalArgumentException; {:try_start_0 .. :try_end_0} :catch_1

    goto :goto_0

    .line 205
    :catch_0
    move-exception v0

    .line 207
    .local v0, "ex":Ljava/io/IOException;
    goto :goto_0

    .line 208
    .end local v0    # "ex":Ljava/io/IOException;
    :catch_1
    move-exception v0

    .line 210
    .local v0, "ex":Ljava/lang/IllegalArgumentException;
    goto :goto_0
.end method

.method private toggleMediaControlsVisiblity()V
    .locals 1

    .prologue
    .line 439
    iget-object v0, p0, Lcom/youai/WorldVideoView;->mMediaController:Landroid/widget/MediaController;

    invoke-virtual {v0}, Landroid/widget/MediaController;->isShowing()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 440
    iget-object v0, p0, Lcom/youai/WorldVideoView;->mMediaController:Landroid/widget/MediaController;

    invoke-virtual {v0}, Landroid/widget/MediaController;->hide()V

    .line 444
    :goto_0
    return-void

    .line 442
    :cond_0
    iget-object v0, p0, Lcom/youai/WorldVideoView;->mMediaController:Landroid/widget/MediaController;

    invoke-virtual {v0}, Landroid/widget/MediaController;->show()V

    goto :goto_0
.end method


# virtual methods
.method public canPause()Z
    .locals 1

    .prologue
    .line 540
    const/4 v0, 0x0

    return v0
.end method

.method public canSeekBackward()Z
    .locals 1

    .prologue
    .line 544
    const/4 v0, 0x0

    return v0
.end method

.method public canSeekForward()Z
    .locals 1

    .prologue
    .line 548
    const/4 v0, 0x0

    return v0
.end method

.method public getBufferPercentage()I
    .locals 1

    .prologue
    .line 499
    iget-object v0, p0, Lcom/youai/WorldVideoView;->mMediaPlayer:Landroid/media/MediaPlayer;

    if-eqz v0, :cond_0

    .line 500
    iget v0, p0, Lcom/youai/WorldVideoView;->mCurrentBufferPercentage:I

    .line 502
    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public getCurrentPosition()I
    .locals 1

    .prologue
    .line 477
    iget-object v0, p0, Lcom/youai/WorldVideoView;->mMediaPlayer:Landroid/media/MediaPlayer;

    if-eqz v0, :cond_0

    iget-boolean v0, p0, Lcom/youai/WorldVideoView;->mIsPrepared:Z

    if-eqz v0, :cond_0

    .line 478
    iget-object v0, p0, Lcom/youai/WorldVideoView;->mMediaPlayer:Landroid/media/MediaPlayer;

    invoke-virtual {v0}, Landroid/media/MediaPlayer;->getCurrentPosition()I

    move-result v0

    .line 480
    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public getDuration()I
    .locals 1

    .prologue
    .line 465
    iget-object v0, p0, Lcom/youai/WorldVideoView;->mMediaPlayer:Landroid/media/MediaPlayer;

    if-eqz v0, :cond_1

    iget-boolean v0, p0, Lcom/youai/WorldVideoView;->mIsPrepared:Z

    if-eqz v0, :cond_1

    .line 466
    iget v0, p0, Lcom/youai/WorldVideoView;->mDuration:I

    if-lez v0, :cond_0

    .line 467
    iget v0, p0, Lcom/youai/WorldVideoView;->mDuration:I

    .line 473
    :goto_0
    return v0

    .line 469
    :cond_0
    iget-object v0, p0, Lcom/youai/WorldVideoView;->mMediaPlayer:Landroid/media/MediaPlayer;

    invoke-virtual {v0}, Landroid/media/MediaPlayer;->getDuration()I

    move-result v0

    iput v0, p0, Lcom/youai/WorldVideoView;->mDuration:I

    .line 470
    iget v0, p0, Lcom/youai/WorldVideoView;->mDuration:I

    goto :goto_0

    .line 472
    :cond_1
    const/4 v0, -0x1

    iput v0, p0, Lcom/youai/WorldVideoView;->mDuration:I

    .line 473
    iget v0, p0, Lcom/youai/WorldVideoView;->mDuration:I

    goto :goto_0
.end method

.method public getIsPrepared()Z
    .locals 1

    .prologue
    .line 552
    iget-boolean v0, p0, Lcom/youai/WorldVideoView;->mIsPrepared:Z

    return v0
.end method

.method public getVideoHeight()I
    .locals 1

    .prologue
    .line 54
    iget v0, p0, Lcom/youai/WorldVideoView;->mVideoHeight:I

    return v0
.end method

.method public getVideoWidth()I
    .locals 1

    .prologue
    .line 50
    iget v0, p0, Lcom/youai/WorldVideoView;->mVideoWidth:I

    return v0
.end method

.method public isPlaying()Z
    .locals 1

    .prologue
    .line 492
    iget-object v0, p0, Lcom/youai/WorldVideoView;->mMediaPlayer:Landroid/media/MediaPlayer;

    if-eqz v0, :cond_0

    iget-boolean v0, p0, Lcom/youai/WorldVideoView;->mIsPrepared:Z

    if-eqz v0, :cond_0

    .line 493
    iget-object v0, p0, Lcom/youai/WorldVideoView;->mMediaPlayer:Landroid/media/MediaPlayer;

    invoke-virtual {v0}, Landroid/media/MediaPlayer;->isPlaying()Z

    move-result v0

    .line 495
    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method protected onMeasure(II)V
    .locals 3
    .param p1, "widthMeasureSpec"    # I
    .param p2, "heightMeasureSpec"    # I

    .prologue
    .line 93
    iget v2, p0, Lcom/youai/WorldVideoView;->mVideoWidth:I

    invoke-static {v2, p1}, Lcom/youai/WorldVideoView;->getDefaultSize(II)I

    move-result v1

    .line 94
    .local v1, "width":I
    iget v2, p0, Lcom/youai/WorldVideoView;->mVideoHeight:I

    invoke-static {v2, p2}, Lcom/youai/WorldVideoView;->getDefaultSize(II)I

    move-result v0

    .line 106
    .local v0, "height":I
    invoke-virtual {p0, v1, v0}, Lcom/youai/WorldVideoView;->setMeasuredDimension(II)V

    .line 107
    return-void
.end method

.method public onTouchEvent(Landroid/view/MotionEvent;)Z
    .locals 1
    .param p1, "ev"    # Landroid/view/MotionEvent;

    .prologue
    .line 407
    iget-boolean v0, p0, Lcom/youai/WorldVideoView;->mIsPrepared:Z

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/youai/WorldVideoView;->mMediaPlayer:Landroid/media/MediaPlayer;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/youai/WorldVideoView;->mMediaController:Landroid/widget/MediaController;

    if-eqz v0, :cond_0

    .line 408
    invoke-direct {p0}, Lcom/youai/WorldVideoView;->toggleMediaControlsVisiblity()V

    .line 410
    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public onTrackballEvent(Landroid/view/MotionEvent;)Z
    .locals 1
    .param p1, "ev"    # Landroid/view/MotionEvent;

    .prologue
    .line 415
    iget-boolean v0, p0, Lcom/youai/WorldVideoView;->mIsPrepared:Z

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/youai/WorldVideoView;->mMediaPlayer:Landroid/media/MediaPlayer;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/youai/WorldVideoView;->mMediaController:Landroid/widget/MediaController;

    if-eqz v0, :cond_0

    .line 416
    invoke-direct {p0}, Lcom/youai/WorldVideoView;->toggleMediaControlsVisiblity()V

    .line 418
    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public pause()V
    .locals 1

    .prologue
    .line 456
    iget-object v0, p0, Lcom/youai/WorldVideoView;->mMediaPlayer:Landroid/media/MediaPlayer;

    if-eqz v0, :cond_0

    iget-boolean v0, p0, Lcom/youai/WorldVideoView;->mIsPrepared:Z

    if-eqz v0, :cond_0

    .line 457
    iget-object v0, p0, Lcom/youai/WorldVideoView;->mMediaPlayer:Landroid/media/MediaPlayer;

    invoke-virtual {v0}, Landroid/media/MediaPlayer;->isPlaying()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 458
    iget-object v0, p0, Lcom/youai/WorldVideoView;->mMediaPlayer:Landroid/media/MediaPlayer;

    invoke-virtual {v0}, Landroid/media/MediaPlayer;->pause()V

    .line 461
    :cond_0
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/youai/WorldVideoView;->mStartWhenPrepared:Z

    .line 462
    return-void
.end method

.method public resolveAdjustedSize(II)I
    .locals 3
    .param p1, "desiredSize"    # I
    .param p2, "measureSpec"    # I

    .prologue
    .line 110
    move v0, p1

    .line 111
    .local v0, "result":I
    invoke-static {p2}, Landroid/view/View$MeasureSpec;->getMode(I)I

    move-result v1

    .line 112
    .local v1, "specMode":I
    invoke-static {p2}, Landroid/view/View$MeasureSpec;->getSize(I)I

    move-result v2

    .line 114
    .local v2, "specSize":I
    sparse-switch v1, :sswitch_data_0

    .line 137
    :goto_0
    return v0

    .line 120
    :sswitch_0
    move v0, p1

    .line 121
    goto :goto_0

    .line 129
    :sswitch_1
    invoke-static {p1, v2}, Ljava/lang/Math;->min(II)I

    move-result v0

    .line 130
    goto :goto_0

    .line 134
    :sswitch_2
    move v0, v2

    goto :goto_0

    .line 114
    :sswitch_data_0
    .sparse-switch
        -0x80000000 -> :sswitch_1
        0x0 -> :sswitch_0
        0x40000000 -> :sswitch_2
    .end sparse-switch
.end method

.method public seekTo(I)V
    .locals 1
    .param p1, "msec"    # I

    .prologue
    .line 484
    iget-object v0, p0, Lcom/youai/WorldVideoView;->mMediaPlayer:Landroid/media/MediaPlayer;

    if-eqz v0, :cond_0

    iget-boolean v0, p0, Lcom/youai/WorldVideoView;->mIsPrepared:Z

    if-eqz v0, :cond_0

    .line 485
    iget-object v0, p0, Lcom/youai/WorldVideoView;->mMediaPlayer:Landroid/media/MediaPlayer;

    invoke-virtual {v0, p1}, Landroid/media/MediaPlayer;->seekTo(I)V

    .line 489
    :goto_0
    return-void

    .line 487
    :cond_0
    iput p1, p0, Lcom/youai/WorldVideoView;->mSeekWhenPrepared:I

    goto :goto_0
.end method

.method public setMediaController(Landroid/widget/MediaController;)V
    .locals 1
    .param p1, "controller"    # Landroid/widget/MediaController;

    .prologue
    .line 215
    iget-object v0, p0, Lcom/youai/WorldVideoView;->mMediaController:Landroid/widget/MediaController;

    if-eqz v0, :cond_0

    .line 216
    iget-object v0, p0, Lcom/youai/WorldVideoView;->mMediaController:Landroid/widget/MediaController;

    invoke-virtual {v0}, Landroid/widget/MediaController;->hide()V

    .line 218
    :cond_0
    iput-object p1, p0, Lcom/youai/WorldVideoView;->mMediaController:Landroid/widget/MediaController;

    .line 219
    invoke-direct {p0}, Lcom/youai/WorldVideoView;->attachMediaController()V

    .line 220
    return-void
.end method

.method public setMySizeChangeLinstener(Lcom/youai/WorldVideoView$MySizeChangeLinstener;)V
    .locals 0
    .param p1, "l"    # Lcom/youai/WorldVideoView$MySizeChangeLinstener;

    .prologue
    .line 69
    iput-object p1, p0, Lcom/youai/WorldVideoView;->mMyChangeLinstener:Lcom/youai/WorldVideoView$MySizeChangeLinstener;

    .line 70
    return-void
.end method

.method public setOnCompletionListener(Landroid/media/MediaPlayer$OnCompletionListener;)V
    .locals 0
    .param p1, "l"    # Landroid/media/MediaPlayer$OnCompletionListener;

    .prologue
    .line 390
    iput-object p1, p0, Lcom/youai/WorldVideoView;->mOnCompletionListener:Landroid/media/MediaPlayer$OnCompletionListener;

    .line 391
    return-void
.end method

.method public setOnErrorListener(Landroid/media/MediaPlayer$OnErrorListener;)V
    .locals 0
    .param p1, "l"    # Landroid/media/MediaPlayer$OnErrorListener;

    .prologue
    .line 402
    iput-object p1, p0, Lcom/youai/WorldVideoView;->mOnErrorListener:Landroid/media/MediaPlayer$OnErrorListener;

    .line 403
    return-void
.end method

.method public setOnPreparedListener(Landroid/media/MediaPlayer$OnPreparedListener;)V
    .locals 0
    .param p1, "l"    # Landroid/media/MediaPlayer$OnPreparedListener;

    .prologue
    .line 379
    iput-object p1, p0, Lcom/youai/WorldVideoView;->mOnPreparedListener:Landroid/media/MediaPlayer$OnPreparedListener;

    .line 380
    return-void
.end method

.method public setVideoPath(Ljava/lang/String;)V
    .locals 1
    .param p1, "path"    # Ljava/lang/String;

    .prologue
    .line 152
    invoke-static {p1}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/youai/WorldVideoView;->setVideoURI(Landroid/net/Uri;)V

    .line 153
    return-void
.end method

.method public setVideoScale(II)V
    .locals 1
    .param p1, "width"    # I
    .param p2, "height"    # I

    .prologue
    .line 58
    invoke-virtual {p0}, Lcom/youai/WorldVideoView;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v0

    .line 59
    .local v0, "lp":Landroid/view/ViewGroup$LayoutParams;
    iput p2, v0, Landroid/view/ViewGroup$LayoutParams;->height:I

    .line 60
    iput p1, v0, Landroid/view/ViewGroup$LayoutParams;->width:I

    .line 61
    invoke-virtual {p0, v0}, Lcom/youai/WorldVideoView;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 62
    return-void
.end method

.method public setVideoURI(Landroid/net/Uri;)V
    .locals 1
    .param p1, "uri"    # Landroid/net/Uri;

    .prologue
    .line 156
    iput-object p1, p0, Lcom/youai/WorldVideoView;->mUri:Landroid/net/Uri;

    .line 157
    const/4 v0, 0x0

    iput v0, p0, Lcom/youai/WorldVideoView;->mSeekWhenPrepared:I

    .line 158
    invoke-direct {p0}, Lcom/youai/WorldVideoView;->openVideo()V

    .line 159
    invoke-virtual {p0}, Lcom/youai/WorldVideoView;->requestLayout()V

    .line 160
    invoke-virtual {p0}, Lcom/youai/WorldVideoView;->invalidate()V

    .line 161
    return-void
.end method

.method public start()V
    .locals 1

    .prologue
    .line 447
    iget-object v0, p0, Lcom/youai/WorldVideoView;->mMediaPlayer:Landroid/media/MediaPlayer;

    if-eqz v0, :cond_0

    iget-boolean v0, p0, Lcom/youai/WorldVideoView;->mIsPrepared:Z

    if-eqz v0, :cond_0

    .line 448
    iget-object v0, p0, Lcom/youai/WorldVideoView;->mMediaPlayer:Landroid/media/MediaPlayer;

    invoke-virtual {v0}, Landroid/media/MediaPlayer;->start()V

    .line 449
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/youai/WorldVideoView;->mStartWhenPrepared:Z

    .line 453
    :goto_0
    return-void

    .line 451
    :cond_0
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/youai/WorldVideoView;->mStartWhenPrepared:Z

    goto :goto_0
.end method

.method public stopPlayback()V
    .locals 1

    .prologue
    .line 164
    iget-object v0, p0, Lcom/youai/WorldVideoView;->mMediaPlayer:Landroid/media/MediaPlayer;

    if-eqz v0, :cond_0

    .line 165
    iget-object v0, p0, Lcom/youai/WorldVideoView;->mMediaPlayer:Landroid/media/MediaPlayer;

    invoke-virtual {v0}, Landroid/media/MediaPlayer;->stop()V

    .line 166
    iget-object v0, p0, Lcom/youai/WorldVideoView;->mMediaPlayer:Landroid/media/MediaPlayer;

    invoke-virtual {v0}, Landroid/media/MediaPlayer;->release()V

    .line 167
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/youai/WorldVideoView;->mMediaPlayer:Landroid/media/MediaPlayer;

    .line 169
    :cond_0
    return-void
.end method

.method public surfaceChanged(Landroid/view/SurfaceHolder;III)V
    .locals 2
    .param p1, "holder"    # Landroid/view/SurfaceHolder;
    .param p2, "format"    # I
    .param p3, "width"    # I
    .param p4, "height"    # I

    .prologue
    .line 507
    iput p3, p0, Lcom/youai/WorldVideoView;->mSurfaceWidth:I

    .line 508
    iput p4, p0, Lcom/youai/WorldVideoView;->mSurfaceHeight:I

    .line 509
    iget-object v0, p0, Lcom/youai/WorldVideoView;->mMediaPlayer:Landroid/media/MediaPlayer;

    if-eqz v0, :cond_1

    iget-boolean v0, p0, Lcom/youai/WorldVideoView;->mIsPrepared:Z

    if-eqz v0, :cond_1

    iget v0, p0, Lcom/youai/WorldVideoView;->mVideoWidth:I

    if-ne v0, p3, :cond_1

    iget v0, p0, Lcom/youai/WorldVideoView;->mVideoHeight:I

    if-ne v0, p4, :cond_1

    .line 511
    iget v0, p0, Lcom/youai/WorldVideoView;->mSeekWhenPrepared:I

    if-eqz v0, :cond_0

    .line 512
    iget-object v0, p0, Lcom/youai/WorldVideoView;->mMediaPlayer:Landroid/media/MediaPlayer;

    iget v1, p0, Lcom/youai/WorldVideoView;->mSeekWhenPrepared:I

    invoke-virtual {v0, v1}, Landroid/media/MediaPlayer;->seekTo(I)V

    .line 513
    const/4 v0, 0x0

    iput v0, p0, Lcom/youai/WorldVideoView;->mSeekWhenPrepared:I

    .line 515
    :cond_0
    iget-object v0, p0, Lcom/youai/WorldVideoView;->mMediaPlayer:Landroid/media/MediaPlayer;

    invoke-virtual {v0}, Landroid/media/MediaPlayer;->start()V

    .line 516
    iget-object v0, p0, Lcom/youai/WorldVideoView;->mMediaController:Landroid/widget/MediaController;

    if-eqz v0, :cond_1

    .line 517
    iget-object v0, p0, Lcom/youai/WorldVideoView;->mMediaController:Landroid/widget/MediaController;

    invoke-virtual {v0}, Landroid/widget/MediaController;->show()V

    .line 520
    :cond_1
    return-void
.end method

.method public surfaceCreated(Landroid/view/SurfaceHolder;)V
    .locals 0
    .param p1, "holder"    # Landroid/view/SurfaceHolder;

    .prologue
    .line 523
    iput-object p1, p0, Lcom/youai/WorldVideoView;->mSurfaceHolder:Landroid/view/SurfaceHolder;

    .line 524
    invoke-direct {p0}, Lcom/youai/WorldVideoView;->openVideo()V

    .line 525
    return-void
.end method

.method public surfaceDestroyed(Landroid/view/SurfaceHolder;)V
    .locals 2
    .param p1, "holder"    # Landroid/view/SurfaceHolder;

    .prologue
    const/4 v1, 0x0

    .line 529
    iput-object v1, p0, Lcom/youai/WorldVideoView;->mSurfaceHolder:Landroid/view/SurfaceHolder;

    .line 530
    iget-object v0, p0, Lcom/youai/WorldVideoView;->mMediaController:Landroid/widget/MediaController;

    if-eqz v0, :cond_0

    .line 531
    iget-object v0, p0, Lcom/youai/WorldVideoView;->mMediaController:Landroid/widget/MediaController;

    invoke-virtual {v0}, Landroid/widget/MediaController;->hide()V

    .line 532
    :cond_0
    iget-object v0, p0, Lcom/youai/WorldVideoView;->mMediaPlayer:Landroid/media/MediaPlayer;

    if-eqz v0, :cond_1

    .line 533
    iget-object v0, p0, Lcom/youai/WorldVideoView;->mMediaPlayer:Landroid/media/MediaPlayer;

    invoke-virtual {v0}, Landroid/media/MediaPlayer;->reset()V

    .line 534
    iget-object v0, p0, Lcom/youai/WorldVideoView;->mMediaPlayer:Landroid/media/MediaPlayer;

    invoke-virtual {v0}, Landroid/media/MediaPlayer;->release()V

    .line 535
    iput-object v1, p0, Lcom/youai/WorldVideoView;->mMediaPlayer:Landroid/media/MediaPlayer;

    .line 537
    :cond_1
    return-void
.end method
