package com.youai;

import android.content.Context;
import android.content.Intent;
import android.media.MediaPlayer;
import android.net.Uri;
import android.util.AttributeSet;
import android.view.MotionEvent;
import android.view.SurfaceHolder;
import android.view.SurfaceView;
import android.view.View;
import android.view.ViewGroup;
import android.widget.MediaController;
import java.io.IOException;

/* JADX INFO: loaded from: classes.dex */
public class WorldVideoView extends SurfaceView implements SurfaceHolder.Callback, MediaController.MediaPlayerControl {
    private MediaPlayer.OnBufferingUpdateListener mBufferingUpdateListener;
    private MediaPlayer.OnCompletionListener mCompletionListener;
    private Context mContext;
    private int mCurrentBufferPercentage;
    private int mDuration;
    private MediaPlayer.OnErrorListener mErrorListener;
    private boolean mIsPrepared;
    private MediaController mMediaController;
    private MediaPlayer mMediaPlayer;
    private MySizeChangeLinstener mMyChangeLinstener;
    private MediaPlayer.OnCompletionListener mOnCompletionListener;
    private MediaPlayer.OnErrorListener mOnErrorListener;
    private MediaPlayer.OnPreparedListener mOnPreparedListener;
    MediaPlayer.OnPreparedListener mPreparedListener;
    private int mSeekWhenPrepared;
    MediaPlayer.OnVideoSizeChangedListener mSizeChangedListener;
    private boolean mStartWhenPrepared;
    private int mSurfaceHeight;
    private SurfaceHolder mSurfaceHolder;
    private int mSurfaceWidth;
    private Uri mUri;
    private int mVideoHeight;
    private int mVideoWidth;

    public interface MySizeChangeLinstener {
        void doMyThings();
    }

    public int getVideoWidth() {
        return this.mVideoWidth;
    }

    public int getVideoHeight() {
        return this.mVideoHeight;
    }

    public void setVideoScale(int width, int height) {
        ViewGroup.LayoutParams lp = getLayoutParams();
        lp.height = height;
        lp.width = width;
        setLayoutParams(lp);
    }

    public void setMySizeChangeLinstener(MySizeChangeLinstener l) {
        this.mMyChangeLinstener = l;
    }

    public WorldVideoView(Context context) {
        super(context);
        this.mSurfaceHolder = null;
        this.mMediaPlayer = null;
        this.mSizeChangedListener = new MediaPlayer.OnVideoSizeChangedListener() { // from class: com.youai.WorldVideoView.1
            @Override // android.media.MediaPlayer.OnVideoSizeChangedListener
            public void onVideoSizeChanged(MediaPlayer mp, int width, int height) {
                WorldVideoView.this.mVideoWidth = mp.getVideoWidth();
                WorldVideoView.this.mVideoHeight = mp.getVideoHeight();
                if (WorldVideoView.this.mMyChangeLinstener != null) {
                    WorldVideoView.this.mMyChangeLinstener.doMyThings();
                }
                if (WorldVideoView.this.mVideoWidth != 0 && WorldVideoView.this.mVideoHeight != 0) {
                    WorldVideoView.this.getHolder().setFixedSize(WorldVideoView.this.mVideoWidth, WorldVideoView.this.mVideoHeight);
                }
            }
        };
        this.mPreparedListener = new MediaPlayer.OnPreparedListener() { // from class: com.youai.WorldVideoView.2
            @Override // android.media.MediaPlayer.OnPreparedListener
            public void onPrepared(MediaPlayer mp) {
                WorldVideoView.this.mIsPrepared = true;
                if (WorldVideoView.this.mOnPreparedListener != null) {
                    WorldVideoView.this.mOnPreparedListener.onPrepared(WorldVideoView.this.mMediaPlayer);
                }
                if (WorldVideoView.this.mMediaController != null) {
                    WorldVideoView.this.mMediaController.setEnabled(true);
                }
                WorldVideoView.this.mVideoWidth = mp.getVideoWidth();
                WorldVideoView.this.mVideoHeight = mp.getVideoHeight();
                if (WorldVideoView.this.mVideoWidth == 0 || WorldVideoView.this.mVideoHeight == 0) {
                    if (WorldVideoView.this.mSeekWhenPrepared != 0) {
                        WorldVideoView.this.mMediaPlayer.seekTo(WorldVideoView.this.mSeekWhenPrepared);
                        WorldVideoView.this.mSeekWhenPrepared = 0;
                    }
                    if (WorldVideoView.this.mStartWhenPrepared) {
                        WorldVideoView.this.mMediaPlayer.start();
                        WorldVideoView.this.mStartWhenPrepared = false;
                        return;
                    }
                    return;
                }
                WorldVideoView.this.getHolder().setFixedSize(WorldVideoView.this.mVideoWidth, WorldVideoView.this.mVideoHeight);
                if (WorldVideoView.this.mSurfaceWidth == WorldVideoView.this.mVideoWidth && WorldVideoView.this.mSurfaceHeight == WorldVideoView.this.mVideoHeight) {
                    if (WorldVideoView.this.mSeekWhenPrepared != 0) {
                        WorldVideoView.this.mMediaPlayer.seekTo(WorldVideoView.this.mSeekWhenPrepared);
                        WorldVideoView.this.mSeekWhenPrepared = 0;
                    }
                    if (WorldVideoView.this.mStartWhenPrepared) {
                        WorldVideoView.this.mMediaPlayer.start();
                        WorldVideoView.this.mStartWhenPrepared = false;
                        if (WorldVideoView.this.mMediaController != null) {
                            WorldVideoView.this.mMediaController.show();
                            return;
                        }
                        return;
                    }
                    if (!WorldVideoView.this.isPlaying()) {
                        if ((WorldVideoView.this.mSeekWhenPrepared != 0 || WorldVideoView.this.getCurrentPosition() > 0) && WorldVideoView.this.mMediaController != null) {
                            WorldVideoView.this.mMediaController.show(0);
                        }
                    }
                }
            }
        };
        this.mCompletionListener = new MediaPlayer.OnCompletionListener() { // from class: com.youai.WorldVideoView.3
            @Override // android.media.MediaPlayer.OnCompletionListener
            public void onCompletion(MediaPlayer mp) {
                if (WorldVideoView.this.mMediaController != null) {
                    WorldVideoView.this.mMediaController.hide();
                }
                if (WorldVideoView.this.mOnCompletionListener != null) {
                    WorldVideoView.this.mOnCompletionListener.onCompletion(WorldVideoView.this.mMediaPlayer);
                }
            }
        };
        this.mErrorListener = new MediaPlayer.OnErrorListener() { // from class: com.youai.WorldVideoView.4
            @Override // android.media.MediaPlayer.OnErrorListener
            public boolean onError(MediaPlayer mp, int framework_err, int impl_err) {
                if (WorldVideoView.this.mMediaController != null) {
                    WorldVideoView.this.mMediaController.hide();
                }
                if ((WorldVideoView.this.mOnErrorListener == null || !WorldVideoView.this.mOnErrorListener.onError(WorldVideoView.this.mMediaPlayer, framework_err, impl_err)) && WorldVideoView.this.getWindowToken() != null) {
                }
                return true;
            }
        };
        this.mBufferingUpdateListener = new MediaPlayer.OnBufferingUpdateListener() { // from class: com.youai.WorldVideoView.5
            @Override // android.media.MediaPlayer.OnBufferingUpdateListener
            public void onBufferingUpdate(MediaPlayer mp, int percent) {
                WorldVideoView.this.mCurrentBufferPercentage = percent;
            }
        };
        this.mContext = context;
        initVideoView();
    }

    public WorldVideoView(Context context, AttributeSet attrs) {
        this(context, attrs, 0);
        this.mContext = context;
        initVideoView();
    }

    public WorldVideoView(Context context, AttributeSet attrs, int defStyle) {
        super(context, attrs, defStyle);
        this.mSurfaceHolder = null;
        this.mMediaPlayer = null;
        this.mSizeChangedListener = new MediaPlayer.OnVideoSizeChangedListener() { // from class: com.youai.WorldVideoView.1
            @Override // android.media.MediaPlayer.OnVideoSizeChangedListener
            public void onVideoSizeChanged(MediaPlayer mp, int width, int height) {
                WorldVideoView.this.mVideoWidth = mp.getVideoWidth();
                WorldVideoView.this.mVideoHeight = mp.getVideoHeight();
                if (WorldVideoView.this.mMyChangeLinstener != null) {
                    WorldVideoView.this.mMyChangeLinstener.doMyThings();
                }
                if (WorldVideoView.this.mVideoWidth != 0 && WorldVideoView.this.mVideoHeight != 0) {
                    WorldVideoView.this.getHolder().setFixedSize(WorldVideoView.this.mVideoWidth, WorldVideoView.this.mVideoHeight);
                }
            }
        };
        this.mPreparedListener = new MediaPlayer.OnPreparedListener() { // from class: com.youai.WorldVideoView.2
            @Override // android.media.MediaPlayer.OnPreparedListener
            public void onPrepared(MediaPlayer mp) {
                WorldVideoView.this.mIsPrepared = true;
                if (WorldVideoView.this.mOnPreparedListener != null) {
                    WorldVideoView.this.mOnPreparedListener.onPrepared(WorldVideoView.this.mMediaPlayer);
                }
                if (WorldVideoView.this.mMediaController != null) {
                    WorldVideoView.this.mMediaController.setEnabled(true);
                }
                WorldVideoView.this.mVideoWidth = mp.getVideoWidth();
                WorldVideoView.this.mVideoHeight = mp.getVideoHeight();
                if (WorldVideoView.this.mVideoWidth == 0 || WorldVideoView.this.mVideoHeight == 0) {
                    if (WorldVideoView.this.mSeekWhenPrepared != 0) {
                        WorldVideoView.this.mMediaPlayer.seekTo(WorldVideoView.this.mSeekWhenPrepared);
                        WorldVideoView.this.mSeekWhenPrepared = 0;
                    }
                    if (WorldVideoView.this.mStartWhenPrepared) {
                        WorldVideoView.this.mMediaPlayer.start();
                        WorldVideoView.this.mStartWhenPrepared = false;
                        return;
                    }
                    return;
                }
                WorldVideoView.this.getHolder().setFixedSize(WorldVideoView.this.mVideoWidth, WorldVideoView.this.mVideoHeight);
                if (WorldVideoView.this.mSurfaceWidth == WorldVideoView.this.mVideoWidth && WorldVideoView.this.mSurfaceHeight == WorldVideoView.this.mVideoHeight) {
                    if (WorldVideoView.this.mSeekWhenPrepared != 0) {
                        WorldVideoView.this.mMediaPlayer.seekTo(WorldVideoView.this.mSeekWhenPrepared);
                        WorldVideoView.this.mSeekWhenPrepared = 0;
                    }
                    if (WorldVideoView.this.mStartWhenPrepared) {
                        WorldVideoView.this.mMediaPlayer.start();
                        WorldVideoView.this.mStartWhenPrepared = false;
                        if (WorldVideoView.this.mMediaController != null) {
                            WorldVideoView.this.mMediaController.show();
                            return;
                        }
                        return;
                    }
                    if (!WorldVideoView.this.isPlaying()) {
                        if ((WorldVideoView.this.mSeekWhenPrepared != 0 || WorldVideoView.this.getCurrentPosition() > 0) && WorldVideoView.this.mMediaController != null) {
                            WorldVideoView.this.mMediaController.show(0);
                        }
                    }
                }
            }
        };
        this.mCompletionListener = new MediaPlayer.OnCompletionListener() { // from class: com.youai.WorldVideoView.3
            @Override // android.media.MediaPlayer.OnCompletionListener
            public void onCompletion(MediaPlayer mp) {
                if (WorldVideoView.this.mMediaController != null) {
                    WorldVideoView.this.mMediaController.hide();
                }
                if (WorldVideoView.this.mOnCompletionListener != null) {
                    WorldVideoView.this.mOnCompletionListener.onCompletion(WorldVideoView.this.mMediaPlayer);
                }
            }
        };
        this.mErrorListener = new MediaPlayer.OnErrorListener() { // from class: com.youai.WorldVideoView.4
            @Override // android.media.MediaPlayer.OnErrorListener
            public boolean onError(MediaPlayer mp, int framework_err, int impl_err) {
                if (WorldVideoView.this.mMediaController != null) {
                    WorldVideoView.this.mMediaController.hide();
                }
                if ((WorldVideoView.this.mOnErrorListener == null || !WorldVideoView.this.mOnErrorListener.onError(WorldVideoView.this.mMediaPlayer, framework_err, impl_err)) && WorldVideoView.this.getWindowToken() != null) {
                }
                return true;
            }
        };
        this.mBufferingUpdateListener = new MediaPlayer.OnBufferingUpdateListener() { // from class: com.youai.WorldVideoView.5
            @Override // android.media.MediaPlayer.OnBufferingUpdateListener
            public void onBufferingUpdate(MediaPlayer mp, int percent) {
                WorldVideoView.this.mCurrentBufferPercentage = percent;
            }
        };
        this.mContext = context;
        initVideoView();
    }

    @Override // android.view.SurfaceView, android.view.View
    protected void onMeasure(int widthMeasureSpec, int heightMeasureSpec) {
        int width = getDefaultSize(this.mVideoWidth, widthMeasureSpec);
        int height = getDefaultSize(this.mVideoHeight, heightMeasureSpec);
        setMeasuredDimension(width, height);
    }

    public int resolveAdjustedSize(int desiredSize, int measureSpec) {
        int specMode = View.MeasureSpec.getMode(measureSpec);
        int specSize = View.MeasureSpec.getSize(measureSpec);
        switch (specMode) {
            case Integer.MIN_VALUE:
                int result = Math.min(desiredSize, specSize);
                break;
            case 0:
                break;
            case 1073741824:
                break;
        }
        return desiredSize;
    }

    private void initVideoView() {
        this.mVideoWidth = 0;
        this.mVideoHeight = 0;
        getHolder().addCallback(this);
        getHolder().setType(3);
        setFocusable(true);
        setFocusableInTouchMode(true);
        requestFocus();
    }

    public void setVideoPath(String path) {
        setVideoURI(Uri.parse(path));
    }

    public void setVideoURI(Uri uri) {
        this.mUri = uri;
        this.mSeekWhenPrepared = 0;
        openVideo();
        requestLayout();
        invalidate();
    }

    public void stopPlayback() {
        if (this.mMediaPlayer != null) {
            this.mMediaPlayer.stop();
            this.mMediaPlayer.release();
            this.mMediaPlayer = null;
        }
    }

    private void openVideo() {
        if (this.mUri != null && this.mSurfaceHolder != null) {
            Intent i = new Intent("com.android.music.musicservicecommand");
            i.putExtra("command", "pause");
            this.mContext.sendBroadcast(i);
            if (this.mMediaPlayer != null) {
                this.mMediaPlayer.reset();
                this.mMediaPlayer.release();
                this.mMediaPlayer = null;
            }
            try {
                this.mMediaPlayer = new MediaPlayer();
                this.mMediaPlayer.setOnPreparedListener(this.mPreparedListener);
                this.mMediaPlayer.setOnVideoSizeChangedListener(this.mSizeChangedListener);
                this.mIsPrepared = false;
                this.mDuration = -1;
                this.mMediaPlayer.setOnCompletionListener(this.mCompletionListener);
                this.mMediaPlayer.setOnErrorListener(this.mErrorListener);
                this.mMediaPlayer.setOnBufferingUpdateListener(this.mBufferingUpdateListener);
                this.mCurrentBufferPercentage = 0;
                this.mMediaPlayer.setDataSource(this.mContext, this.mUri);
                this.mMediaPlayer.setDisplay(this.mSurfaceHolder);
                this.mMediaPlayer.setAudioStreamType(3);
                this.mMediaPlayer.setScreenOnWhilePlaying(true);
                this.mMediaPlayer.prepareAsync();
                attachMediaController();
            } catch (IOException e) {
            } catch (IllegalArgumentException e2) {
            }
        }
    }

    public void setMediaController(MediaController controller) {
        if (this.mMediaController != null) {
            this.mMediaController.hide();
        }
        this.mMediaController = controller;
        attachMediaController();
    }

    private void attachMediaController() {
        if (this.mMediaPlayer != null && this.mMediaController != null) {
            this.mMediaController.setMediaPlayer(this);
            View anchorView = getParent() instanceof View ? (View) getParent() : this;
            this.mMediaController.setAnchorView(anchorView);
            this.mMediaController.setEnabled(this.mIsPrepared);
        }
    }

    public void setOnPreparedListener(MediaPlayer.OnPreparedListener l) {
        this.mOnPreparedListener = l;
    }

    public void setOnCompletionListener(MediaPlayer.OnCompletionListener l) {
        this.mOnCompletionListener = l;
    }

    public void setOnErrorListener(MediaPlayer.OnErrorListener l) {
        this.mOnErrorListener = l;
    }

    @Override // android.view.View
    public boolean onTouchEvent(MotionEvent ev) {
        if (this.mIsPrepared && this.mMediaPlayer != null && this.mMediaController != null) {
            toggleMediaControlsVisiblity();
            return false;
        }
        return false;
    }

    @Override // android.view.View
    public boolean onTrackballEvent(MotionEvent ev) {
        if (this.mIsPrepared && this.mMediaPlayer != null && this.mMediaController != null) {
            toggleMediaControlsVisiblity();
            return false;
        }
        return false;
    }

    private void toggleMediaControlsVisiblity() {
        if (this.mMediaController.isShowing()) {
            this.mMediaController.hide();
        } else {
            this.mMediaController.show();
        }
    }

    @Override // android.widget.MediaController.MediaPlayerControl
    public void start() {
        if (this.mMediaPlayer != null && this.mIsPrepared) {
            this.mMediaPlayer.start();
            this.mStartWhenPrepared = false;
        } else {
            this.mStartWhenPrepared = true;
        }
    }

    @Override // android.widget.MediaController.MediaPlayerControl
    public void pause() {
        if (this.mMediaPlayer != null && this.mIsPrepared && this.mMediaPlayer.isPlaying()) {
            this.mMediaPlayer.pause();
        }
        this.mStartWhenPrepared = false;
    }

    @Override // android.widget.MediaController.MediaPlayerControl
    public int getDuration() {
        if (this.mMediaPlayer != null && this.mIsPrepared) {
            if (this.mDuration > 0) {
                return this.mDuration;
            }
            this.mDuration = this.mMediaPlayer.getDuration();
            return this.mDuration;
        }
        this.mDuration = -1;
        return this.mDuration;
    }

    @Override // android.widget.MediaController.MediaPlayerControl
    public int getCurrentPosition() {
        if (this.mMediaPlayer == null || !this.mIsPrepared) {
            return 0;
        }
        return this.mMediaPlayer.getCurrentPosition();
    }

    @Override // android.widget.MediaController.MediaPlayerControl
    public void seekTo(int msec) {
        if (this.mMediaPlayer != null && this.mIsPrepared) {
            this.mMediaPlayer.seekTo(msec);
        } else {
            this.mSeekWhenPrepared = msec;
        }
    }

    @Override // android.widget.MediaController.MediaPlayerControl
    public boolean isPlaying() {
        if (this.mMediaPlayer == null || !this.mIsPrepared) {
            return false;
        }
        return this.mMediaPlayer.isPlaying();
    }

    @Override // android.widget.MediaController.MediaPlayerControl
    public int getBufferPercentage() {
        if (this.mMediaPlayer != null) {
            return this.mCurrentBufferPercentage;
        }
        return 0;
    }

    @Override // android.view.SurfaceHolder.Callback
    public void surfaceChanged(SurfaceHolder holder, int format, int width, int height) {
        this.mSurfaceWidth = width;
        this.mSurfaceHeight = height;
        if (this.mMediaPlayer != null && this.mIsPrepared && this.mVideoWidth == width && this.mVideoHeight == height) {
            if (this.mSeekWhenPrepared != 0) {
                this.mMediaPlayer.seekTo(this.mSeekWhenPrepared);
                this.mSeekWhenPrepared = 0;
            }
            this.mMediaPlayer.start();
            if (this.mMediaController != null) {
                this.mMediaController.show();
            }
        }
    }

    @Override // android.view.SurfaceHolder.Callback
    public void surfaceCreated(SurfaceHolder holder) {
        this.mSurfaceHolder = holder;
        openVideo();
    }

    @Override // android.view.SurfaceHolder.Callback
    public void surfaceDestroyed(SurfaceHolder holder) {
        this.mSurfaceHolder = null;
        if (this.mMediaController != null) {
            this.mMediaController.hide();
        }
        if (this.mMediaPlayer != null) {
            this.mMediaPlayer.reset();
            this.mMediaPlayer.release();
            this.mMediaPlayer = null;
        }
    }

    @Override // android.widget.MediaController.MediaPlayerControl
    public boolean canPause() {
        return false;
    }

    @Override // android.widget.MediaController.MediaPlayerControl
    public boolean canSeekBackward() {
        return false;
    }

    @Override // android.widget.MediaController.MediaPlayerControl
    public boolean canSeekForward() {
        return false;
    }

    public boolean getIsPrepared() {
        return this.mIsPrepared;
    }
}
