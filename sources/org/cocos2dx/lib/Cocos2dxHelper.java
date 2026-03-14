package org.cocos2dx.lib;

import android.app.Activity;
import android.content.Context;
import android.content.SharedPreferences;
import android.content.pm.ApplicationInfo;
import android.content.res.AssetManager;
import android.net.ConnectivityManager;
import android.net.NetworkInfo;
import android.os.Build;
import android.os.Environment;
import android.os.Process;
import android.util.DisplayMetrics;
import android.util.Log;
import android.view.Display;
import android.view.WindowManager;
import java.io.UnsupportedEncodingException;
import java.util.Locale;

/* JADX INFO: loaded from: classes.dex */
public class Cocos2dxHelper {
    private static final String PREFS_NAME = "Cocos2dxPrefsFile";
    private static boolean sAccelerometerEnabled;
    private static AssetManager sAssetManager;
    private static Cocos2dxMusic sCocos2dMusic;
    private static Cocos2dxSound sCocos2dSound;
    private static Cocos2dxAccelerometer sCocos2dxAccelerometer;
    private static Cocos2dxHelperListener sCocos2dxHelperListener;
    private static String sFileDirectory;
    private static String sPackageName;
    private static final String TAG = Cocos2dxHelper.class.getSimpleName();
    private static Context sContext = null;

    public interface Cocos2dxHelperListener {
        void ShowAnnounce(String str);

        void callPlatformAccountManage();

        void callPlatformFeedback();

        void callPlatformGameBBS(String str);

        void callPlatformLogin();

        void callPlatformLogout();

        void callPlatformPayRecharge(String str, String str2, String str3, float f, float f2, int i, String str4);

        void callPlatformSupportThirdShare(String str, String str2);

        void clearSysNotification();

        String generateNewOrderSerial();

        String getClientChannel();

        String getDeviceID();

        boolean getIsOnTempShortPause();

        int getPlatformId();

        String getPlatformInfo();

        String getPlatformLoginSessionId();

        boolean getPlatformLoginStatus();

        String getPlatformLoginUin();

        String getPlatformUserNickName();

        void notifyEnterGame();

        void openUrlOutside(String str);

        void pushSysNotification(String str, String str2, int i);

        void runOnGLThread(Runnable runnable);

        void showDialog(String str, String str2, int i, String str3);

        void showEditTextDialog(String str, String str2, int i, int i2, int i3, int i4);

        void showQuestionDialog(String str, String str2, int i, String str3, String str4);

        void showWaitingView(boolean z, int i, String str);
    }

    public static native void nativeDialogOkCallback(int i);

    public static native void nativeGameDestroy();

    public static native String nativeGameSnapshot();

    public static native int nativeGetServerId();

    public static native boolean nativeHasEnterMainFrame();

    public static native void nativeNotifyPlatformGameUpdateResult(int i, int i2, int i3, String str);

    public static native void nativeNotifyPlatformLoginResult(int i, String str, String str2, String str3);

    public static native void nativeNotifyPlatformPayResult(int i, String str, String str2, String str3, float f, float f2, int i2, String str4);

    public static native void nativePurgeCachedData();

    private static native void nativeSetApkPath(String str, String str2);

    /* JADX INFO: Access modifiers changed from: private */
    public static native void nativeSetEditTextDialogCancelResult(byte[] bArr);

    /* JADX INFO: Access modifiers changed from: private */
    public static native void nativeSetEditTextDialogResult(byte[] bArr);

    public static void init(Context pContext, Cocos2dxHelperListener pCocos2dxHelperListener, String pAppExternalStoragePath) {
        Log.d(TAG, "4\t\tcall Cocos2dxHelper.init");
        ApplicationInfo applicationInfo = pContext.getApplicationInfo();
        sContext = pContext;
        sCocos2dxHelperListener = pCocos2dxHelperListener;
        sPackageName = applicationInfo.packageName;
        sFileDirectory = pAppExternalStoragePath;
        nativeSetApkPath(applicationInfo.sourceDir, pAppExternalStoragePath);
        sCocos2dxAccelerometer = new Cocos2dxAccelerometer(pContext);
        sCocos2dMusic = new Cocos2dxMusic(pContext);
        sCocos2dSound = new Cocos2dxSound(pContext);
        sAssetManager = pContext.getAssets();
        Cocos2dxBitmap.setContext(pContext);
        Log.d(TAG, "applicationInfo.packageName: " + applicationInfo.packageName);
        Log.d(TAG, "pContext.getFilesDir().getAbsolutePath(): " + pContext.getFilesDir().getAbsolutePath());
        Log.d(TAG, "applicationInfo.sourceDir(the apk path): " + applicationInfo.sourceDir);
        Log.d(TAG, "pContext.getCacheDir().getAbsolutePath(): " + pContext.getCacheDir().getAbsolutePath());
        if (pContext.getExternalCacheDir() != null) {
            Log.d(TAG, "pContext.getExternalCacheDir().getAbsolutePath(): " + pContext.getExternalCacheDir().getAbsolutePath());
        }
        Log.d(TAG, "Environment.getRootDirectory().getAbsolutePath(): " + Environment.getRootDirectory().getAbsolutePath());
        Log.d(TAG, "Environment.getDataDirectory().getAbsolutePath(): " + Environment.getDataDirectory().getAbsolutePath());
        Log.d(TAG, "Environment.getExternalStorageDirectory().getAbsolutePath(): " + Environment.getExternalStorageDirectory().getAbsolutePath());
        Log.d(TAG, "ExternalStorageState: " + Environment.getExternalStorageState());
        if (Environment.getExternalStorageState().equalsIgnoreCase("mounted")) {
            Log.d(TAG, "ExternalStorage: " + Environment.getExternalStorageDirectory().getAbsolutePath() + " is read/write access available");
            Log.d(TAG, "AndroidManageAppExternalStorage: " + pContext.getExternalFilesDir(null));
            Log.d(TAG, "AndroidManageAppExternalStorage: " + Environment.getExternalStoragePublicDirectory(Environment.DIRECTORY_PICTURES));
        }
    }

    public static String getCocos2dxPackageName() {
        return sPackageName;
    }

    public static String getCocos2dxWritablePath() {
        return sFileDirectory;
    }

    public static String getCurrentLanguage() {
        return Locale.getDefault().getLanguage();
    }

    public static String getDeviceModel() {
        return Build.MODEL;
    }

    public static AssetManager getAssetManager() {
        return sAssetManager;
    }

    public static void enableAccelerometer() {
        sAccelerometerEnabled = true;
        sCocos2dxAccelerometer.enable();
    }

    public static void setAccelerometerInterval(float interval) {
        sCocos2dxAccelerometer.setInterval(interval);
    }

    public static void disableAccelerometer() {
        sAccelerometerEnabled = false;
        sCocos2dxAccelerometer.disable();
    }

    public static void preloadBackgroundMusic(String pPath) {
        sCocos2dMusic.preloadBackgroundMusic(pPath);
    }

    public static void playBackgroundMusic(String pPath, boolean isLoop) {
        sCocos2dMusic.playBackgroundMusic(pPath, isLoop);
    }

    public static void resumeBackgroundMusic() {
        sCocos2dMusic.resumeBackgroundMusic();
    }

    public static void pauseBackgroundMusic() {
        sCocos2dMusic.pauseBackgroundMusic();
    }

    public static void stopBackgroundMusic() {
        sCocos2dMusic.stopBackgroundMusic();
    }

    public static void rewindBackgroundMusic() {
        sCocos2dMusic.rewindBackgroundMusic();
    }

    public static boolean isBackgroundMusicPlaying() {
        return sCocos2dMusic.isBackgroundMusicPlaying();
    }

    public static float getBackgroundMusicVolume() {
        return sCocos2dMusic.getBackgroundVolume();
    }

    public static void setBackgroundMusicVolume(float volume) {
        sCocos2dMusic.setBackgroundVolume(volume);
    }

    public static void preloadEffect(String path) {
        sCocos2dSound.preloadEffect(path);
    }

    public static int playEffect(String path, boolean isLoop) {
        return sCocos2dSound.playEffect(path, isLoop);
    }

    public static void resumeEffect(int soundId) {
        sCocos2dSound.resumeEffect(soundId);
    }

    public static void pauseEffect(int soundId) {
        sCocos2dSound.pauseEffect(soundId);
    }

    public static void stopEffect(int soundId) {
        sCocos2dSound.stopEffect(soundId);
    }

    public static float getEffectsVolume() {
        return sCocos2dSound.getEffectsVolume();
    }

    public static void setEffectsVolume(float volume) {
        sCocos2dSound.setEffectsVolume(volume);
    }

    public static void unloadEffect(String path) {
        sCocos2dSound.unloadEffect(path);
    }

    public static void pauseAllEffects() {
        sCocos2dSound.pauseAllEffects();
    }

    public static void resumeAllEffects() {
        sCocos2dSound.resumeAllEffects();
    }

    public static void stopAllEffects() {
        sCocos2dSound.stopAllEffects();
    }

    public static void end() {
        sCocos2dMusic.end();
        sCocos2dSound.end();
    }

    public static void onResume() {
        if (sAccelerometerEnabled) {
            sCocos2dxAccelerometer.enable();
        }
    }

    public static void onPause() {
        if (sAccelerometerEnabled) {
            sCocos2dxAccelerometer.disable();
        }
    }

    public static void terminateProcess() {
        Process.killProcess(Process.myPid());
    }

    public static void showDialog(String pTitle, String pMessage, int msgId, String positiveCallback) {
        sCocos2dxHelperListener.showDialog(pTitle, pMessage, msgId, positiveCallback);
    }

    public static void showQuestionDialog(String pTitle, String pMessage, int msgId, String positiveCallback, String negativeCallback) {
        sCocos2dxHelperListener.showQuestionDialog(pTitle, pMessage, msgId, positiveCallback, negativeCallback);
    }

    public static void showEditTextDialog(String pTitle, String pMessage, int pInputMode, int pInputFlag, int pReturnType, int pMaxLength) {
        sCocos2dxHelperListener.showEditTextDialog(pTitle, pMessage, pInputMode, pInputFlag, pReturnType, pMaxLength);
    }

    public static void setEditTextDialogResult(String pResult) {
        try {
            final byte[] bytesUTF8 = pResult.getBytes("UTF8");
            sCocos2dxHelperListener.runOnGLThread(new Runnable() { // from class: org.cocos2dx.lib.Cocos2dxHelper.1
                @Override // java.lang.Runnable
                public void run() {
                    Cocos2dxHelper.nativeSetEditTextDialogResult(bytesUTF8);
                }
            });
        } catch (UnsupportedEncodingException e) {
        }
    }

    public static void setEditTextDialogCancelResult(String pResult) {
        try {
            final byte[] bytesUTF8 = pResult.getBytes("UTF8");
            sCocos2dxHelperListener.runOnGLThread(new Runnable() { // from class: org.cocos2dx.lib.Cocos2dxHelper.2
                @Override // java.lang.Runnable
                public void run() {
                    Cocos2dxHelper.nativeSetEditTextDialogCancelResult(bytesUTF8);
                }
            });
        } catch (UnsupportedEncodingException e) {
        }
    }

    public static int getDPI() {
        Display d;
        if (sContext != null) {
            DisplayMetrics metrics = new DisplayMetrics();
            WindowManager wm = ((Activity) sContext).getWindowManager();
            if (wm != null && (d = wm.getDefaultDisplay()) != null) {
                d.getMetrics(metrics);
                return (int) (metrics.density * 160.0f);
            }
        }
        return -1;
    }

    public static boolean getBoolForKey(String key, boolean defaultValue) {
        SharedPreferences settings = ((Activity) sContext).getSharedPreferences(PREFS_NAME, 0);
        return settings.getBoolean(key, defaultValue);
    }

    public static int getIntegerForKey(String key, int defaultValue) {
        SharedPreferences settings = ((Activity) sContext).getSharedPreferences(PREFS_NAME, 0);
        return settings.getInt(key, defaultValue);
    }

    public static float getFloatForKey(String key, float defaultValue) {
        SharedPreferences settings = ((Activity) sContext).getSharedPreferences(PREFS_NAME, 0);
        return settings.getFloat(key, defaultValue);
    }

    public static double getDoubleForKey(String key, double defaultValue) {
        SharedPreferences settings = ((Activity) sContext).getSharedPreferences(PREFS_NAME, 0);
        return settings.getFloat(key, (float) defaultValue);
    }

    public static String getStringForKey(String key, String defaultValue) {
        SharedPreferences settings = ((Activity) sContext).getSharedPreferences(PREFS_NAME, 0);
        return settings.getString(key, defaultValue);
    }

    public static void setBoolForKey(String key, boolean value) {
        SharedPreferences settings = ((Activity) sContext).getSharedPreferences(PREFS_NAME, 0);
        SharedPreferences.Editor editor = settings.edit();
        editor.putBoolean(key, value);
        editor.commit();
    }

    public static void setIntegerForKey(String key, int value) {
        SharedPreferences settings = ((Activity) sContext).getSharedPreferences(PREFS_NAME, 0);
        SharedPreferences.Editor editor = settings.edit();
        editor.putInt(key, value);
        editor.commit();
    }

    public static void setFloatForKey(String key, float value) {
        SharedPreferences settings = ((Activity) sContext).getSharedPreferences(PREFS_NAME, 0);
        SharedPreferences.Editor editor = settings.edit();
        editor.putFloat(key, value);
        editor.commit();
    }

    public static void setDoubleForKey(String key, double value) {
        SharedPreferences settings = ((Activity) sContext).getSharedPreferences(PREFS_NAME, 0);
        SharedPreferences.Editor editor = settings.edit();
        editor.putFloat(key, (float) value);
        editor.commit();
    }

    public static void setStringForKey(String key, String value) {
        SharedPreferences settings = ((Activity) sContext).getSharedPreferences(PREFS_NAME, 0);
        SharedPreferences.Editor editor = settings.edit();
        editor.putString(key, value);
        editor.commit();
    }

    public static void callPlatformLogin() {
        sCocos2dxHelperListener.callPlatformLogin();
    }

    public static void callPlatformLogout() {
        sCocos2dxHelperListener.callPlatformLogout();
    }

    public static void callPlatformAccountManage() {
        sCocos2dxHelperListener.callPlatformAccountManage();
    }

    public static void callPlatformPayRecharge(String serial, String productId, String productName, float price, float orignalPrice, int count, String description) {
        sCocos2dxHelperListener.callPlatformPayRecharge(serial, productId, productName, price, orignalPrice, count, description);
    }

    public static boolean getPlatformLoginStatus() {
        return sCocos2dxHelperListener.getPlatformLoginStatus();
    }

    public static String getPlatformLoginUin() {
        return sCocos2dxHelperListener.getPlatformLoginUin();
    }

    public static String getPlatformLoginSessionId() {
        return sCocos2dxHelperListener.getPlatformLoginSessionId();
    }

    public static String getPlatformUserNickName() {
        return sCocos2dxHelperListener.getPlatformUserNickName();
    }

    public static String generateNewOrderSerial() {
        return sCocos2dxHelperListener.generateNewOrderSerial();
    }

    public static void callPlatformFeedback() {
        sCocos2dxHelperListener.callPlatformFeedback();
    }

    public static void callPlatformSupportThirdShare(String content, String imgPath) {
        sCocos2dxHelperListener.callPlatformSupportThirdShare(content, imgPath);
    }

    public static void callPlatformGameBBS(String url) {
        sCocos2dxHelperListener.callPlatformGameBBS(url);
    }

    public static boolean getIsOnTempShortPause() {
        return sCocos2dxHelperListener.getIsOnTempShortPause();
    }

    public static String getDeviceID() {
        return sCocos2dxHelperListener.getDeviceID();
    }

    public static String getPlatformInfo() {
        return sCocos2dxHelperListener.getPlatformInfo();
    }

    public static void notifyEnterGame() {
        sCocos2dxHelperListener.notifyEnterGame();
    }

    public static String getClientChannel() {
        return sCocos2dxHelperListener.getClientChannel();
    }

    public static int getPlatformId() {
        return sCocos2dxHelperListener.getPlatformId();
    }

    public static void openUrlOutside(String url) {
        sCocos2dxHelperListener.openUrlOutside(url);
    }

    public static void showWaitingView(boolean show, int progress, String text) {
        sCocos2dxHelperListener.showWaitingView(show, progress, text);
    }

    public static void clearNotification() {
        sCocos2dxHelperListener.clearSysNotification();
    }

    public static void showNotification(String pTitle, String msg, int pInstantMinite) {
        sCocos2dxHelperListener.pushSysNotification(pTitle, msg, pInstantMinite);
    }

    public static void showGameAnnounce(String pAnnounceUrl) {
        sCocos2dxHelperListener.ShowAnnounce(pAnnounceUrl);
    }

    public static int getNetworkStatus() {
        ConnectivityManager cm = (ConnectivityManager) sContext.getSystemService("connectivity");
        NetworkInfo niWiFi = cm.getNetworkInfo(1);
        NetworkInfo niMobile = cm.getNetworkInfo(0);
        if ((!niWiFi.isAvailable() && !niMobile.isAvailable()) || (!niWiFi.isConnected() && !niMobile.isConnected())) {
            return 0;
        }
        if (niWiFi.isAvailable() && niWiFi.isConnected()) {
            return 1;
        }
        return (niMobile.isAvailable() && niMobile.isConnected()) ? 2 : 0;
    }
}
