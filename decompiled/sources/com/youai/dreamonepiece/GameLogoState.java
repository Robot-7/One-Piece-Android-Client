package com.youai.dreamonepiece;

import android.annotation.TargetApi;
import android.app.Activity;
import android.app.AlertDialog;
import android.content.DialogInterface;
import android.content.SharedPreferences;
import android.content.res.AssetManager;
import android.net.ConnectivityManager;
import android.net.NetworkInfo;
import android.os.Environment;
import android.os.Handler;
import android.os.Message;
import android.util.Log;
import android.view.WindowManager;
import android.widget.ProgressBar;
import android.widget.TextView;
import com.tencent.stat.common.StatConstants;
import com.youai.IGameActivity;
import com.youai.IGameActivityState;
import com.youai.IStateManager;
import com.youai.StorageUtil;
import com.youai.dreamonepiece.GameInterface;
import com.youai.dreamonepiece.platform.pipaw.R;
import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.Properties;
import org.apache.http.util.EncodingUtils;
import org.json.JSONException;
import org.json.JSONObject;
import org.json.JSONTokener;

/* JADX INFO: loaded from: classes.dex */
public class GameLogoState implements IGameActivityState {
    private static final int HANDLER_MSG_TO_MAINTHREAD_DeleteDirtyFileDirectoryDelay = 4;
    private static final int HANDLER_MSG_TO_MAINTHREAD_DoEnterDelay = 7;
    private static final int HANDLER_MSG_TO_MAINTHREAD_ExternalStorageNotOK = 6;
    private static final int HANDLER_MSG_TO_MAINTHREAD_NetwrokNotOK = 1;
    private static final int HANDLER_MSG_TO_MAINTHREAD_ShowLogoViewDelay = 3;
    private static final int HANDLER_MSG_TO_MAINTHREAD_UpdateMoveAssetResProgress = 0;
    private static final int HANDLER_MSG_TO_MAINTHREAD_UpdateMoveAssetResText = 5;
    public static final String TAG = GameLogoState.class.getSimpleName();
    private GameInterface.IGameLogoStateCallback mCallback;
    private IGameActivity mGameActivity;
    private IStateManager mStateMgr;
    private String mAppFilesPath = null;
    private boolean mUnzipedAssets = false;
    private boolean mNetworkOK = false;
    private boolean mExternalStorageOK = true;
    private boolean mExternalStorageEnough = true;
    private ProgressBar mAssetsUnzipProgressBar = null;
    private TextView mAssetsUnzipTextView = null;
    private GameLogoStateHandler mHandler = null;

    @Override // com.youai.IGameActivityState
    @TargetApi(11)
    public void enter() {
        GameActivity.setCanPressBack(false);
        Log.d(TAG, "enter GameLogoState");
        this.mGameActivity.getActivity().setContentView(R.layout.logo_layout);
        this.mAssetsUnzipProgressBar = (ProgressBar) this.mGameActivity.getActivity().findViewById(R.id.assetsUnzipProgress);
        this.mAssetsUnzipProgressBar.setVisibility(4);
        this.mHandler = new GameLogoStateHandler();
        this.mHandler.sendEmptyMessageDelayed(7, 1000L);
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void doEnter() throws Throwable {
        Log.d(TAG, "doEnter GameLogoState");
        this.mAssetsUnzipTextView = (TextView) this.mGameActivity.getActivity().findViewById(R.id.assets_unzip_textView);
        checkNetworkStatus();
        checkStorageStatus();
        if (!this.mExternalStorageOK) {
            DialogMessage dlgmsg = new DialogMessage(this.mGameActivity.getActivity().getResources().getString(R.string.app_dlg_title), this.mGameActivity.getActivity().getResources().getString(R.string.app_dlg_externalstorage_notok_msg), 6);
            showDialog(dlgmsg);
            return;
        }
        if (!this.mExternalStorageEnough) {
            DialogMessage dlgmsg2 = new DialogMessage(this.mGameActivity.getActivity().getResources().getString(R.string.app_dlg_title), this.mGameActivity.getActivity().getResources().getString(R.string.app_dlg_externalstorage_nofreespace_msg), 6);
            showDialog(dlgmsg2);
            return;
        }
        LastLoginHelp.setActivity(GameActivity.mGameApp);
        if (!this.mUnzipedAssets || !checkExternalStorageResourcesStatus()) {
            if (!this.mUnzipedAssets) {
                saveConfigFileFirstTime();
                this.mAssetsUnzipTextView.setText("解压资源，不需流量，请稍后");
                requestUnzipAssetToExternalStorageResources();
                return;
            } else {
                this.mAssetsUnzipTextView.setText("清除本地旧目录，请稍后");
                removeExistDirtyFileDirectory();
                return;
            }
        }
        makeSureUnzipMusicSoundFiles();
        if (this.mNetworkOK) {
            this.mHandler.sendEmptyMessageDelayed(3, 500L);
        } else {
            DialogMessage dlgmsg3 = new DialogMessage(this.mGameActivity.getActivity().getResources().getString(R.string.app_dlg_title), this.mGameActivity.getActivity().getResources().getString(R.string.app_dlg_newwork_notok_msg), 1);
            showDialog(dlgmsg3);
        }
    }

    @Override // com.youai.IGameActivityState
    public void exit() {
        this.mAssetsUnzipProgressBar.setVisibility(4);
        this.mAssetsUnzipTextView.setVisibility(4);
        this.mAssetsUnzipProgressBar = null;
        this.mAssetsUnzipTextView = null;
        this.mStateMgr = null;
        this.mGameActivity = null;
        this.mCallback = null;
        this.mHandler.removeMessages(3);
        this.mHandler.removeMessages(0);
        this.mHandler.removeMessages(1);
        this.mHandler = null;
        Log.d(TAG, "exit GameLogoState");
    }

    public GameLogoState(IStateManager pStateMgr, IGameActivity pGameActivity, GameInterface.IGameLogoStateCallback pCallback) {
        this.mStateMgr = pStateMgr;
        this.mGameActivity = pGameActivity;
        this.mCallback = pCallback;
    }

    /* JADX WARN: Type inference failed for: r0v1, types: [com.youai.dreamonepiece.GameLogoState$1] */
    private void removeExistDirtyFileDirectory() {
        Log.d(TAG, "removeExistDirtyFileDirectory");
        new Thread("RemoveExistDirtyFileDirectoryThread") { // from class: com.youai.dreamonepiece.GameLogoState.1
            @Override // java.lang.Thread, java.lang.Runnable
            public void run() throws Throwable {
                File rootfiles = new File(GameLogoState.this.mGameActivity.getAppFilesResourcesPath());
                StorageUtil.removeFileDirectory(rootfiles);
                String path = Environment.getExternalStorageDirectory() + File.separator + "Android" + File.separator + "data" + File.separator + GameLogoState.this.mGameActivity.getActivity().getPackageName() + File.separator + "files" + File.separator + "assets";
                File tmp = new File(path);
                if (tmp.exists()) {
                    StorageUtil.removeFileDirectory(tmp);
                }
                try {
                    Thread.sleep(500L);
                } catch (InterruptedException e) {
                    e.printStackTrace();
                }
                System.gc();
                SharedPreferences sp = GameLogoState.this.mGameActivity.getActivity().getSharedPreferences("ResourcesInfo", 0);
                SharedPreferences.Editor edit = sp.edit();
                edit.putBoolean("UnzipedAssets", false);
                edit.apply();
                GameLogoState.this.mUnzipedAssets = false;
                SharedPreferences.Editor edit1 = sp.edit();
                edit1.putString("StorageFullPath", StatConstants.MTA_COOPERATION_TAG);
                edit1.apply();
                GameLogoState.this.checkStorageStatus();
                GameLogoState.this.mCallback.initAppDataPath(GameLogoState.this.mAppFilesPath);
                GameLogoState.this.saveConfigFileFirstTime();
                GameLogoState.this.mHandler.sendEmptyMessageDelayed(4, 500L);
            }
        }.start();
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void checkStorageStatus() throws Throwable {
        String appFilesPath;
        String exStorageState = Environment.getExternalStorageState();
        Log.w(TAG, "Environment.getExternalStorageState():" + exStorageState);
        if (!exStorageState.equals("mounted") && !exStorageState.equals("shared")) {
            this.mExternalStorageOK = false;
            return;
        }
        SharedPreferences sp = this.mGameActivity.getActivity().getSharedPreferences("ResourcesInfo", 0);
        String spath = sp.getString("StorageFullPath", StatConstants.MTA_COOPERATION_TAG);
        File dir = new File(spath);
        boolean unziped = sp.getBoolean("UnzipedAssets", false);
        if (!unziped) {
            if (!spath.equals(StatConstants.MTA_COOPERATION_TAG) && dir.exists()) {
                StorageUtil.removeFileDirectory(dir);
                System.gc();
            }
            spath = StatConstants.MTA_COOPERATION_TAG;
        } else if (!dir.exists() || !dir.isDirectory()) {
            spath = StatConstants.MTA_COOPERATION_TAG;
            SharedPreferences.Editor edit = sp.edit();
            edit.putBoolean("UnzipedAssets", false);
            edit.apply();
            unziped = false;
            if (dir.exists()) {
                dir.delete();
            }
        }
        if (spath.equals(StatConstants.MTA_COOPERATION_TAG)) {
            File appFilesDir = this.mGameActivity.getActivity().getFilesDir();
            if (Environment.getExternalStorageState().equalsIgnoreCase("mounted")) {
                File externalStorageDir = Environment.getExternalStorageDirectory();
                if (!externalStorageDir.canRead() || !externalStorageDir.canWrite() || externalStorageDir.getUsableSpace() < 209715200) {
                    String secondPath = StorageUtil.getSecondStorageWithFreeSize(262144000L);
                    if (secondPath != null) {
                        appFilesPath = secondPath;
                    } else {
                        String secondPath2 = StorageUtil.getSecondStorageWithFreeSize(externalStorageDir.getUsableSpace() * 2);
                        if (secondPath2 != null) {
                            appFilesPath = secondPath2;
                        } else {
                            appFilesPath = externalStorageDir.getAbsolutePath();
                        }
                        File dir1 = new File(appFilesPath);
                        if (dir1.getUsableSpace() < 10485760) {
                            appFilesDir.getAbsolutePath();
                            this.mExternalStorageEnough = false;
                            return;
                        }
                    }
                } else {
                    appFilesPath = externalStorageDir.getAbsolutePath();
                }
                if (!appFilesPath.equalsIgnoreCase(appFilesDir.getAbsolutePath())) {
                    File file1 = new File(appFilesPath + "/Android/Data");
                    File file2 = new File(appFilesPath + "/Android/data");
                    if (file1.exists() && file2.exists()) {
                        spath = appFilesPath + "/Android/data/" + this.mGameActivity.getActivity().getPackageName() + "/files";
                    } else if (file1.exists() && !file2.exists()) {
                        spath = appFilesPath + "/Android/Data/" + this.mGameActivity.getActivity().getPackageName() + "/files";
                    } else if (file1.exists() || file2.exists()) {
                        spath = appFilesPath + "/Android/data/" + this.mGameActivity.getActivity().getPackageName() + "/files";
                    } else {
                        spath = appFilesPath + "/Android/data/" + this.mGameActivity.getActivity().getPackageName() + "/files";
                    }
                } else {
                    spath = appFilesPath;
                }
                SharedPreferences.Editor edit2 = sp.edit();
                edit2.putString("StorageFullPath", spath);
                edit2.apply();
            } else {
                appFilesDir.getAbsolutePath();
                this.mExternalStorageOK = false;
                return;
            }
        }
        if (!unziped) {
            File dir2 = new File(spath + "/config.properties");
            if (dir2.exists()) {
                dir2.delete();
                unziped = true;
            }
        }
        this.mCallback.initAppDataPath(spath);
        this.mAppFilesPath = spath;
        this.mUnzipedAssets = unziped;
    }

    /* JADX INFO: Access modifiers changed from: private */
    /* JADX WARN: Type inference failed for: r0v5, types: [com.youai.dreamonepiece.GameLogoState$2] */
    public void requestUnzipAssetToExternalStorageResources() {
        Log.d(TAG, "requestUnzipAssetToExternalStorageResources");
        final String appFilesResourcesPath = this.mGameActivity.getAppFilesResourcesPath();
        File dir = new File(appFilesResourcesPath);
        if (dir.getUsableSpace() < 104857600) {
            Log.d(TAG, "not enough usable storage space");
            makeSureUnzipMusicSoundFiles();
            Message msg = new Message();
            msg.obj = new ProgressMessage(100, ", starting game");
            msg.what = 0;
            this.mHandler.sendMessageDelayed(msg, 2000L);
            return;
        }
        final Activity theActivity = this.mGameActivity.getActivity();
        final Handler theHandler = this.mHandler;
        new Thread("MoveAssetToExternalStorageThread") { // from class: com.youai.dreamonepiece.GameLogoState.2
            private ArrayList<String> resFilesPath = new ArrayList<>();

            private int recursionSumAssetsFileNum(String path) {
                int num = 0;
                try {
                    AssetManager assetMgr = theActivity.getAssets();
                    String[] assets = assetMgr.list(path);
                    for (String filepath : assets) {
                        if (!filepath.isEmpty()) {
                            if (!path.isEmpty()) {
                                filepath = path + "/" + filepath;
                            }
                            int idx = filepath.lastIndexOf(47);
                            int idy = filepath.lastIndexOf(46);
                            if (idx == -1 && idy == -1) {
                                num += recursionSumAssetsFileNum(filepath);
                                File temp = new File(appFilesResourcesPath + "/" + filepath);
                                if (!temp.exists()) {
                                    temp.mkdirs();
                                }
                                Message msg2 = new Message();
                                msg2.obj = new ProgressMessage(0, "解压资源，不需流量，请稍后..");
                                msg2.what = 5;
                                theHandler.sendMessage(msg2);
                            } else if (idx > 0 && idy > idx) {
                                num++;
                                this.resFilesPath.add(filepath);
                            } else if (idx == -1 && idy > 0) {
                                num++;
                                this.resFilesPath.add(filepath);
                            } else if (idx > 0 && idy < idx) {
                                num += recursionSumAssetsFileNum(filepath);
                                File temp2 = new File(appFilesResourcesPath + "/" + filepath);
                                if (!temp2.exists()) {
                                    temp2.mkdirs();
                                }
                                Message msg3 = new Message();
                                msg3.obj = new ProgressMessage(0, "解压资源，不需流量，请稍后....");
                                msg3.what = 5;
                                theHandler.sendMessage(msg3);
                            }
                        }
                    }
                } catch (IOException e) {
                }
                return num;
            }

            private int recursionSumAssetsFileNumByFileList(String path) {
                Message msg2 = new Message();
                msg2.obj = new ProgressMessage(0, "解压资源，不需流量，请稍后..");
                msg2.what = 5;
                theHandler.sendMessage(msg2);
                AssetManager assetMgr = theActivity.getAssets();
                try {
                    InputStream is = assetMgr.open(path);
                    int lenght = is.available();
                    byte[] buffer = new byte[lenght];
                    is.read(buffer);
                    String result = EncodingUtils.getString(buffer, "UTF-8");
                    String[] fileList = result.split(",");
                    for (String str : fileList) {
                        String filepath = str.trim();
                        if (!filepath.isEmpty()) {
                            int idx = filepath.lastIndexOf(47);
                            if (idx > 0) {
                                File temp = new File(appFilesResourcesPath + "/" + filepath);
                                String filePath = temp.getParent();
                                File tmep1 = new File(filePath);
                                if (!tmep1.exists()) {
                                    tmep1.mkdirs();
                                }
                            }
                            this.resFilesPath.add(filepath);
                        }
                    }
                } catch (IOException e) {
                    e.printStackTrace();
                }
                return this.resFilesPath.size();
            }

            private Boolean isContainFileList(String[] files) {
                for (String fileName : files) {
                    if (fileName.equals("filelist.txt")) {
                        return true;
                    }
                }
                return false;
            }

            /* JADX WARN: Removed duplicated region for block: B:23:0x00e3 A[Catch: IOException -> 0x0219, TRY_LEAVE, TryCatch #1 {IOException -> 0x0219, blocks: (B:21:0x00de, B:23:0x00e3), top: B:88:0x00de }] */
            /* JADX WARN: Removed duplicated region for block: B:47:0x0211 A[Catch: IOException -> 0x0216, TRY_LEAVE, TryCatch #3 {IOException -> 0x0216, blocks: (B:45:0x020c, B:47:0x0211), top: B:90:0x020c }] */
            /* JADX WARN: Removed duplicated region for block: B:60:0x0254 A[Catch: IOException -> 0x0259, TRY_LEAVE, TryCatch #0 {IOException -> 0x0259, blocks: (B:58:0x024f, B:60:0x0254), top: B:86:0x024f }] */
            @Override // java.lang.Thread, java.lang.Runnable
            /*
                Code decompiled incorrectly, please refer to instructions dump.
                To view partially-correct add '--show-bad-code' argument
            */
            public void run() throws java.lang.Throwable {
                /*
                    Method dump skipped, instruction units count: 643
                    To view this dump add '--comments-level debug' option
                */
                throw new UnsupportedOperationException("Method not decompiled: com.youai.dreamonepiece.GameLogoState.AnonymousClass2.run():void");
            }
        }.start();
    }

    /* JADX WARN: Type inference failed for: r0v8, types: [com.youai.dreamonepiece.GameLogoState$3] */
    private void makeSureUnzipMusicSoundFiles() {
        Log.d(TAG, "makeSureUnzipMusicSoundFiles");
        File cfg = new File(this.mAppFilesPath + "/config.properties");
        if (cfg.exists()) {
            Properties cfgIni = new Properties();
            String hasUnzipSound = null;
            try {
                cfgIni.load(new FileInputStream(cfg));
                hasUnzipSound = cfgIni.getProperty("hasUnzipSound", null);
            } catch (FileNotFoundException e) {
            } catch (IOException e2) {
            }
            if (hasUnzipSound != null && hasUnzipSound.equalsIgnoreCase("true")) {
                return;
            }
        }
        final Activity theActivity = this.mGameActivity.getActivity();
        final String appFilesPath = this.mAppFilesPath;
        final String appFilesResourcesPath = this.mGameActivity.getAppFilesResourcesPath();
        new Thread("MoveSoundFilesToExternalStorageThread") { // from class: com.youai.dreamonepiece.GameLogoState.3
            private ArrayList<String> soundFilesPath = new ArrayList<>();

            private Boolean isContainFileList(String[] files) {
                for (String fileName : files) {
                    if (fileName.equals("filelist.txt")) {
                        return true;
                    }
                }
                return false;
            }

            private int recursionSumAssetsFileNum(String path) {
                int num = 0;
                try {
                    AssetManager assetMgr = theActivity.getAssets();
                    String[] assets = assetMgr.list(path);
                    for (String filepath : assets) {
                        if (!filepath.isEmpty()) {
                            String strTmp = filepath.toUpperCase();
                            if (!path.isEmpty()) {
                                filepath = path + "/" + filepath;
                            }
                            int idx = filepath.lastIndexOf(47);
                            int idy = filepath.lastIndexOf(46);
                            if (idx == -1 && idy == -1) {
                                num += recursionSumAssetsFileNum(filepath);
                                File temp = new File(appFilesResourcesPath + "/" + filepath);
                                if (!temp.exists()) {
                                    temp.mkdirs();
                                }
                            } else if (idx > 0 && idy > idx) {
                                if (strTmp.endsWith(".MP3") || strTmp.endsWith(".WAV") || strTmp.endsWith(".MP4")) {
                                    num++;
                                    this.soundFilesPath.add(filepath);
                                }
                            } else if (idx == -1 && idy > 0) {
                                if (strTmp.endsWith(".MP3") || strTmp.endsWith(".WAV") || strTmp.endsWith(".MP4")) {
                                    num++;
                                    this.soundFilesPath.add(filepath);
                                }
                            } else if (idx > 0 && idy < idx) {
                                num += recursionSumAssetsFileNum(filepath);
                                File temp2 = new File(appFilesResourcesPath + "/" + filepath);
                                if (!temp2.exists()) {
                                    temp2.mkdirs();
                                }
                            }
                        }
                    }
                    this.soundFilesPath.add("Imageset.txt");
                    this.soundFilesPath.add("version_android.cfg");
                    return num + 1 + 1;
                } catch (IOException e3) {
                    return num;
                }
            }

            private int recursionSumAssetsFileNumByFileList(String path) {
                AssetManager assetMgr = theActivity.getAssets();
                try {
                    InputStream is = assetMgr.open(path);
                    int lenght = is.available();
                    byte[] buffer = new byte[lenght];
                    is.read(buffer);
                    String result = EncodingUtils.getString(buffer, "UTF-8");
                    String[] fileList = result.split(",");
                    for (String fileName : fileList) {
                        String strTmp = fileName.toUpperCase();
                        if (strTmp.endsWith(".MP3") || strTmp.endsWith(".ini") || strTmp.endsWith(".WAV") || strTmp.contains("TXT/") || strTmp.endsWith(".EL") || strTmp.endsWith(".MP4")) {
                            this.soundFilesPath.add(fileName);
                        }
                    }
                    is.close();
                    this.soundFilesPath.add("Imageset.txt");
                    this.soundFilesPath.add("version_android.cfg");
                } catch (IOException e3) {
                    e3.printStackTrace();
                }
                return this.soundFilesPath.size();
            }

            @Override // java.lang.Thread, java.lang.Runnable
            public void run() throws Throwable {
                int assetsFileNum;
                AssetManager assetMgr = theActivity.getAssets();
                int idx = 0;
                BufferedInputStream in = null;
                BufferedOutputStream out = null;
                long s1 = System.currentTimeMillis();
                try {
                    String[] array = assetMgr.list(StatConstants.MTA_COOPERATION_TAG);
                    assetsFileNum = isContainFileList(array).booleanValue() ? recursionSumAssetsFileNumByFileList("filelist.txt") : recursionSumAssetsFileNum(StatConstants.MTA_COOPERATION_TAG);
                } catch (IOException e3) {
                    e3.printStackTrace();
                    assetsFileNum = recursionSumAssetsFileNum(StatConstants.MTA_COOPERATION_TAG);
                }
                long s2 = System.currentTimeMillis();
                System.out.println("cost time is :" + (s2 - s1));
                byte[] buf = this.soundFilesPath.size() > 0 ? new byte[10240] : null;
                Iterator<String> it = this.soundFilesPath.iterator();
                while (it.hasNext()) {
                    String filepath = it.next().trim();
                    idx++;
                    File file_tmp = new File(appFilesResourcesPath + "/" + filepath);
                    if (!file_tmp.exists()) {
                        try {
                            BufferedInputStream in2 = new BufferedInputStream(assetMgr.open(filepath, 2), 40960);
                            try {
                                if (!file_tmp.exists()) {
                                    file_tmp.mkdirs();
                                    if (!file_tmp.createNewFile()) {
                                        file_tmp.delete();
                                        file_tmp.createNewFile();
                                    }
                                }
                                BufferedOutputStream out2 = new BufferedOutputStream(new FileOutputStream(appFilesResourcesPath + "/" + filepath), 40960);
                                while (true) {
                                    try {
                                        int readNum = in2.read(buf, 0, buf.length);
                                        if (readNum <= 0) {
                                            break;
                                        } else {
                                            out2.write(buf, 0, readNum);
                                        }
                                    } catch (IOException e4) {
                                        out = out2;
                                        in = in2;
                                        if (in != null) {
                                            try {
                                                in.close();
                                            } catch (IOException e5) {
                                            }
                                        }
                                        if (out != null) {
                                            out.close();
                                        }
                                    } catch (OutOfMemoryError e6) {
                                        out = out2;
                                        in = in2;
                                        if (in != null) {
                                            try {
                                                in.close();
                                            } catch (IOException e7) {
                                            }
                                        }
                                        if (out != null) {
                                            out.close();
                                        }
                                    } catch (Throwable th) {
                                        th = th;
                                        out = out2;
                                        in = in2;
                                        if (in != null) {
                                            try {
                                                in.close();
                                            } catch (IOException e8) {
                                                throw th;
                                            }
                                        }
                                        if (out != null) {
                                            out.close();
                                        }
                                        throw th;
                                    }
                                }
                                out2.flush();
                                if (in2 != null) {
                                    try {
                                        in2.close();
                                    } catch (IOException e9) {
                                        out = out2;
                                        in = in2;
                                    }
                                }
                                if (out2 != null) {
                                    out2.close();
                                }
                                out = out2;
                                in = in2;
                            } catch (IOException e10) {
                                in = in2;
                            } catch (OutOfMemoryError e11) {
                                in = in2;
                            } catch (Throwable th2) {
                                th = th2;
                                in = in2;
                            }
                        } catch (IOException e12) {
                        } catch (OutOfMemoryError e13) {
                        } catch (Throwable th3) {
                            th = th3;
                        }
                    }
                }
                if (idx >= assetsFileNum) {
                    File cfg2 = new File(appFilesPath + "/config.properties");
                    if (cfg2.exists()) {
                        Properties cfgIni2 = new Properties();
                        try {
                            cfgIni2.load(new FileInputStream(cfg2));
                            cfgIni2.setProperty("hasUnzipSound", "true");
                            cfgIni2.store(new FileOutputStream(cfg2), "last upzip sound files");
                        } catch (FileNotFoundException e14) {
                        } catch (IOException e15) {
                        }
                    }
                    Log.d(GameLogoState.TAG, "UnzipedMusicSoundFiles");
                }
            }
        }.start();
    }

    private void checkNetworkStatus() {
        ConnectivityManager cm = (ConnectivityManager) this.mGameActivity.getActivity().getSystemService("connectivity");
        NetworkInfo niWiFi = cm.getNetworkInfo(1);
        NetworkInfo niMobile = cm.getNetworkInfo(0);
        if (niWiFi == null && niMobile != null) {
            if (niMobile.isAvailable() && niMobile.isConnected()) {
                this.mNetworkOK = true;
                return;
            } else {
                this.mNetworkOK = false;
                return;
            }
        }
        if (niMobile == null && niWiFi != null) {
            if (niWiFi.isAvailable() && niWiFi.isConnected()) {
                this.mNetworkOK = true;
                return;
            } else {
                this.mNetworkOK = false;
                return;
            }
        }
        if ((!niWiFi.isAvailable() && !niMobile.isAvailable()) || (!niWiFi.isConnected() && !niMobile.isConnected())) {
            this.mNetworkOK = false;
        } else {
            this.mNetworkOK = true;
        }
    }

    private boolean checkExternalStorageResourcesVersion() {
        File version_cfg = new File(this.mGameActivity.getAppFilesResourcesPath() + "/version_android.cfg");
        if (!version_cfg.exists()) {
            return true;
        }
        byte[] buf1 = new byte[4096];
        try {
            FileInputStream inp1 = new FileInputStream(version_cfg);
            inp1.read(buf1);
            inp1.close();
            String str1 = new String(buf1);
            JSONTokener jsonParser = new JSONTokener(str1);
            try {
                JSONObject version = (JSONObject) jsonParser.nextValue();
                String local_version = version.getString("localVerson");
                byte[] buf2 = new byte[4096];
                AssetManager assetMgr = this.mGameActivity.getActivity().getAssets();
                try {
                    InputStream inp2 = assetMgr.open("version_android.cfg");
                    inp2.read(buf2);
                    inp2.close();
                    String str2 = new String(buf2);
                    JSONTokener jsonParser2 = new JSONTokener(str2);
                    try {
                        JSONObject version2 = (JSONObject) jsonParser2.nextValue();
                        String apk_version = version2.getString("localVerson");
                        String[] apkVer = apk_version.split("\\.");
                        Log.e(TAG, apkVer[0] + "." + apkVer[1] + "." + apkVer[2]);
                        String[] localVer = local_version.split("\\.");
                        Log.e(TAG, localVer[0] + "." + localVer[1] + "." + localVer[2]);
                        try {
                            if (Integer.valueOf(apkVer[0]).intValue() > Integer.valueOf(localVer[0]).intValue()) {
                                return true;
                            }
                            if (Integer.valueOf(apkVer[0]).intValue() < Integer.valueOf(localVer[0]).intValue()) {
                                return false;
                            }
                            if (Integer.valueOf(apkVer[1]).intValue() > Integer.valueOf(localVer[1]).intValue()) {
                                return true;
                            }
                            if (Integer.valueOf(apkVer[1]).intValue() < Integer.valueOf(localVer[1]).intValue()) {
                                return false;
                            }
                            if (Integer.valueOf(apkVer[2]).intValue() > Integer.valueOf(localVer[2]).intValue()) {
                                return true;
                            }
                            Log.e(TAG, "apk_version:" + apk_version + ", local_version:" + local_version);
                            return false;
                        } catch (Exception e) {
                            Log.d(TAG, "compare apkversion and localversion failed");
                            return false;
                        }
                    } catch (JSONException e2) {
                        Log.d(TAG, "apk assets version_android.cfg file parse failed!");
                        return false;
                    }
                } catch (IOException e3) {
                    Log.d(TAG, "apk assets version_android.cfg file not exist!");
                    return false;
                }
            } catch (JSONException e4) {
                Log.d(TAG, "local unzip storage version.cfg file json parse failed!");
                return true;
            }
        } catch (Exception e5) {
            Log.d(TAG, "local unzip storage version_android.cfg file not exist!");
            return true;
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void saveConfigFileFirstTime() {
        File cfg = new File(this.mAppFilesPath + "/config.properties");
        Properties cfgIni = new Properties();
        cfgIni.setProperty("forceUnzipAssets", "false");
        try {
            cfgIni.store(new FileOutputStream(cfg), "auto save, default false");
        } catch (FileNotFoundException e) {
        } catch (IOException e2) {
        }
    }

    private boolean checkExternalStorageResourcesStatus() {
        boolean isForceUnzipAssets = true;
        File cfg = new File(this.mAppFilesPath + "/config.properties");
        if (cfg.exists()) {
            Properties cfgIni = new Properties();
            String forceUnzip = null;
            try {
                cfgIni.load(new FileInputStream(cfg));
                forceUnzip = cfgIni.getProperty("forceUnzipAssets", null);
                if (forceUnzip != null && forceUnzip.equalsIgnoreCase("true")) {
                    cfgIni.setProperty("forceUnzipAssets", "false");
                    cfgIni.store(new FileOutputStream(cfg), "auto save, change from true to false");
                }
            } catch (FileNotFoundException e) {
            } catch (IOException e2) {
            }
            if (forceUnzip != null && forceUnzip.equalsIgnoreCase("true")) {
                isForceUnzipAssets = true;
            } else {
                isForceUnzipAssets = false;
            }
        } else {
            Properties cfgIni2 = new Properties();
            cfgIni2.setProperty("forceUnzipAssets", "false");
            try {
                cfgIni2.store(new FileOutputStream(cfg), "auto save, default false");
            } catch (FileNotFoundException e3) {
            } catch (IOException e4) {
            }
        }
        File resources = new File(this.mGameActivity.getAppFilesResourcesPath());
        if (!resources.exists() || !resources.canRead() || !resources.canWrite()) {
            Log.e(TAG, "AppDataExternalStorageResourcesFullPath: " + this.mGameActivity.getAppFilesResourcesPath() + " is not OK!");
            resources.mkdirs();
            return !isForceUnzipAssets;
        }
        if (!isForceUnzipAssets) {
            isForceUnzipAssets = checkExternalStorageResourcesVersion();
        }
        AssetManager assetMgr = this.mGameActivity.getActivity().getAssets();
        try {
            String[] assets = assetMgr.list(StatConstants.MTA_COOPERATION_TAG);
            String[] files = resources.list();
            Log.d(TAG, "assets.length: " + String.valueOf(assets.length) + " resources.length: " + String.valueOf(files.length));
            return files.length < assets.length ? !isForceUnzipAssets : !isForceUnzipAssets;
        } catch (IOException e5) {
            return !isForceUnzipAssets;
        }
    }

    private class GameLogoStateHandler extends Handler {
        public GameLogoStateHandler() {
            super(GameLogoState.this.mGameActivity.getActivity().getMainLooper());
        }

        @Override // android.os.Handler
        public void handleMessage(Message msg) throws Throwable {
            if (msg.what == 0) {
                ProgressMessage obj = (ProgressMessage) msg.obj;
                if (obj.progress >= 100) {
                    SharedPreferences sp = GameLogoState.this.mGameActivity.getActivity().getSharedPreferences("ResourcesInfo", 0);
                    SharedPreferences.Editor edit = sp.edit();
                    edit.putBoolean("UnzipedAssets", true);
                    edit.apply();
                    GameLogoState.this.mUnzipedAssets = true;
                    if (GameLogoState.this.mNetworkOK) {
                        GameLogoState.this.mStateMgr.changeState(2);
                        return;
                    } else {
                        DialogMessage dlgmsg = new DialogMessage(GameLogoState.this.mGameActivity.getActivity().getResources().getString(R.string.app_dlg_title), GameLogoState.this.mGameActivity.getActivity().getResources().getString(R.string.app_dlg_newwork_notok_msg), 1);
                        GameLogoState.this.showDialog(dlgmsg);
                        return;
                    }
                }
                Log.d(GameLogoState.TAG, "uncompressing resources to external storage " + obj.text);
                GameLogoState.this.mAssetsUnzipProgressBar.setVisibility(0);
                GameLogoState.this.mAssetsUnzipProgressBar.setProgress(obj.progress);
                if (obj.progress < 92) {
                    String str = GameLogoState.this.mGameActivity.getActivity().getResources().getString(R.string.assets_unzip_msg) + obj.text;
                    GameLogoState.this.mAssetsUnzipTextView.setText(str);
                    return;
                } else {
                    GameLogoState.this.mAssetsUnzipTextView.setText(GameLogoState.this.mGameActivity.getActivity().getResources().getString(R.string.starting_game));
                    return;
                }
            }
            if (msg.what != 1) {
                if (msg.what == 3) {
                    GameLogoState.this.mStateMgr.changeState(2);
                    return;
                }
                if (msg.what == 4) {
                    GameLogoState.this.mAssetsUnzipTextView.setText("解压资源，不需流量，请稍后");
                    GameLogoState.this.requestUnzipAssetToExternalStorageResources();
                } else if (msg.what == 5) {
                    GameLogoState.this.mAssetsUnzipTextView.setText(((ProgressMessage) msg.obj).text);
                } else if (msg.what == 7) {
                    GameLogoState.this.doEnter();
                }
            }
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void showDialog(DialogMessage msg) {
        final IGameActivity theActivity = this.mGameActivity;
        final int tag = msg.msgId;
        AlertDialog dlg = new AlertDialog.Builder(theActivity.getActivity()).setTitle(msg.titile).setMessage(msg.message).setPositiveButton("确定", new DialogInterface.OnClickListener() { // from class: com.youai.dreamonepiece.GameLogoState.5
            @Override // android.content.DialogInterface.OnClickListener
            public void onClick(DialogInterface dialog, int which) {
                if (tag == 1 || tag == 6) {
                    theActivity.requestDestroy();
                }
            }
        }).setOnCancelListener(new DialogInterface.OnCancelListener() { // from class: com.youai.dreamonepiece.GameLogoState.4
            @Override // android.content.DialogInterface.OnCancelListener
            public void onCancel(DialogInterface dialog) {
                if (tag == 1 || tag == 6) {
                    theActivity.requestDestroy();
                }
            }
        }).create();
        WindowManager.LayoutParams lp = dlg.getWindow().getAttributes();
        dlg.getWindow().setAttributes(lp);
        dlg.show();
    }

    private static class ProgressMessage {
        public int progress;
        public String text;

        public ProgressMessage(int progress, String text) {
            this.progress = progress;
            this.text = text;
        }
    }

    private static class DialogMessage {
        public String message;
        public int msgId;
        public String titile;

        public DialogMessage(String title, String message, int msgId) {
            this.titile = title;
            this.message = message;
            this.msgId = msgId;
        }
    }
}
