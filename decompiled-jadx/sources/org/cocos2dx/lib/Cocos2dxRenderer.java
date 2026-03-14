package org.cocos2dx.lib;

import android.opengl.GLSurfaceView;
import javax.microedition.khronos.egl.EGLConfig;
import javax.microedition.khronos.opengles.GL10;

/* JADX INFO: loaded from: classes.dex */
public class Cocos2dxRenderer implements GLSurfaceView.Renderer {
    private static final long NANOSECONDSPERMICROSECOND = 1000000;
    private static final long NANOSECONDSPERSECOND = 1000000000;
    private static long sAnimationInterval = 16666666;
    private long mLastTickInNanoSeconds;
    private int mScreenHeight;
    private int mScreenWidth;

    private static native void nativeDeleteBackward();

    private static native String nativeGetContentText();

    private static native void nativeInit(int i, int i2);

    private static native void nativeInsertText(String str);

    private static native boolean nativeKeyDown(int i);

    private static native void nativeOnPause();

    private static native void nativeOnResume();

    private static native void nativeRender();

    private static native void nativeTouchesBegin(int i, float f, float f2);

    private static native void nativeTouchesCancel(int[] iArr, float[] fArr, float[] fArr2);

    private static native void nativeTouchesEnd(int i, float f, float f2);

    private static native void nativeTouchesMove(int[] iArr, float[] fArr, float[] fArr2);

    public static void setAnimationInterval(double pAnimationInterval) {
        sAnimationInterval = (long) (1.0E9d * pAnimationInterval);
    }

    public void setScreenWidthAndHeight(int pSurfaceWidth, int pSurfaceHeight) {
        this.mScreenWidth = pSurfaceWidth;
        this.mScreenHeight = pSurfaceHeight;
    }

    @Override // android.opengl.GLSurfaceView.Renderer
    public void onSurfaceCreated(GL10 pGL10, EGLConfig pEGLConfig) {
        nativeInit(this.mScreenWidth, this.mScreenHeight);
        this.mLastTickInNanoSeconds = System.nanoTime();
        Cocos2dxActivity theActivity = (Cocos2dxActivity) Cocos2dxActivity.getContext();
        theActivity.onTimeToShowCocos2dxContentView();
    }

    @Override // android.opengl.GLSurfaceView.Renderer
    public void onSurfaceChanged(GL10 pGL10, int pWidth, int pHeight) {
    }

    @Override // android.opengl.GLSurfaceView.Renderer
    public void onDrawFrame(GL10 gl) {
        long nowInNanoSeconds = System.nanoTime();
        long interval = nowInNanoSeconds - this.mLastTickInNanoSeconds;
        nativeRender();
        if (interval < sAnimationInterval) {
            try {
                Thread.sleep((sAnimationInterval - interval) / NANOSECONDSPERMICROSECOND);
            } catch (Exception e) {
            }
        }
        this.mLastTickInNanoSeconds = nowInNanoSeconds;
    }

    public void handleActionDown(int pID, float pX, float pY) {
        nativeTouchesBegin(pID, pX, pY);
    }

    public void handleActionUp(int pID, float pX, float pY) {
        nativeTouchesEnd(pID, pX, pY);
    }

    public void handleActionCancel(int[] pIDs, float[] pXs, float[] pYs) {
        nativeTouchesCancel(pIDs, pXs, pYs);
    }

    public void handleActionMove(int[] pIDs, float[] pXs, float[] pYs) {
        nativeTouchesMove(pIDs, pXs, pYs);
    }

    public void handleKeyDown(int pKeyCode) {
        nativeKeyDown(pKeyCode);
    }

    public void handleOnPause() {
        nativeOnPause();
    }

    public void handleOnResume() {
        nativeOnResume();
    }

    public void handleInsertText(String pText) {
        nativeInsertText(pText);
    }

    public void handleDeleteBackward() {
        nativeDeleteBackward();
    }

    public String getContentText() {
        return nativeGetContentText();
    }
}
