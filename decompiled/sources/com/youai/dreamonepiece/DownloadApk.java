package com.youai.dreamonepiece;

import android.annotation.SuppressLint;
import android.app.DownloadManager;
import android.app.ProgressDialog;
import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.DialogInterface;
import android.content.Intent;
import android.content.IntentFilter;
import android.content.pm.ApplicationInfo;
import android.content.pm.PackageManager;
import android.content.res.AssetManager;
import android.database.ContentObserver;
import android.net.Uri;
import android.os.Build;
import android.os.Environment;
import android.os.Handler;
import android.os.Message;
import android.util.Log;
import android.widget.Toast;
import com.tencent.stat.common.StatConstants;
import com.youai.dreamonepiece.platform.pipaw.R;
import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.text.DecimalFormat;
import org.apache.http.HttpResponse;
import org.apache.http.client.HttpClient;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.impl.client.DefaultHttpClient;
import org.apache.http.params.BasicHttpParams;
import org.apache.http.params.HttpConnectionParams;
import org.apache.http.params.HttpParams;
import org.apache.http.util.EncodingUtils;

/* JADX INFO: loaded from: classes.dex */
public class DownloadApk {
    static final DecimalFormat DOUBLE_DECIMAL_FORMAT = new DecimalFormat("0.##");
    static String DOWNLOAD_FILE_NAME = "DreamOnePiece.apk";
    private static final String DOWNLOAD_FOLDER_NAME = "Download";
    public static final int KB_2_BYTE = 1024;
    public static final int MB_2_BYTE = 1048576;
    private static final int RESPONSE = 10000;
    private File DownloadPathFile;
    private String channel;
    private CompleteReceiver completeReceiver;
    private GameActivity context;
    private DownloadManager downloadManager;
    private DownloadManagerPro downloadManagerPro;
    private DownloadChangeObserver downloadObserver;
    private DownLoadHandler handler;
    private ProgressDialog mIsExistDialog;
    private String mOriginalUrl;
    private String mUrlChannel;
    private ProgressDialog mpDialog;
    private int useChannelUrl;
    private long downloadId = 0;
    Handler mResponseHandler = new Handler() { // from class: com.youai.dreamonepiece.DownloadApk.1
        @Override // android.os.Handler
        public void dispatchMessage(Message msg) {
            switch (msg.what) {
                case DownloadApk.RESPONSE /* 10000 */:
                    if (DownloadApk.this.mIsExistDialog != null && DownloadApk.this.mIsExistDialog.isShowing()) {
                        DownloadApk.this.mIsExistDialog.dismiss();
                    }
                    int status = msg.arg1;
                    if (status == 200) {
                        DownloadApk.this.onCreate(DownloadApk.this.mUrlChannel);
                    } else {
                        DownloadApk.this.useChannelUrl = 0;
                        DownloadApk.this.onCreate(DownloadApk.this.mOriginalUrl);
                    }
                    break;
            }
        }
    };

    /* JADX WARN: Type inference failed for: r10v34, types: [com.youai.dreamonepiece.DownloadApk$2] */
    public DownloadApk(GameActivity mActivity, String pUrl) {
        this.mUrlChannel = StatConstants.MTA_COOPERATION_TAG;
        this.useChannelUrl = 0;
        this.context = mActivity;
        String _url = pUrl.substring(0, pUrl.indexOf(".apk"));
        this.mOriginalUrl = pUrl;
        ApplicationInfo appInfo = null;
        preCreate();
        String content = StatConstants.MTA_COOPERATION_TAG;
        AssetManager assetMgr = mActivity.getAssets();
        try {
            InputStream is = assetMgr.open("channel.properties");
            if (is != null) {
                int lenght = is.available();
                byte[] buffer = new byte[lenght];
                is.read(buffer);
                content = EncodingUtils.getString(buffer, "UTF-8");
            }
        } catch (IOException e) {
            Log.e("PROJECT_PROPERTIES", "project.properties is null");
        }
        if (!content.equals(StatConstants.MTA_COOPERATION_TAG) && content != null) {
            this.channel = content;
            Log.e("channel", this.channel);
            Onchannel(this.channel, _url);
            return;
        }
        try {
            appInfo = mActivity.getPackageManager().getApplicationInfo(mActivity.getPackageName(), 128);
        } catch (PackageManager.NameNotFoundException e2) {
        }
        if (appInfo != null && appInfo.metaData != null) {
            int _id = appInfo.metaData.getInt("YOUAI_PACKAGE");
            if (_id != 0) {
                this.channel = String.valueOf(_id);
            } else {
                String _str = appInfo.metaData.getString("YOUAI_PACKAGE");
                this.channel = _str;
            }
            if (this.channel != null && !this.channel.equals(StatConstants.MTA_COOPERATION_TAG)) {
                this.mUrlChannel = _url + "_" + this.channel + ".apk";
                DOWNLOAD_FILE_NAME = "OnePiece_" + this.context.getPlatformId() + this.channel + ".apk";
                this.useChannelUrl = 1;
                this.mIsExistDialog = new ProgressDialog(this.context);
                this.mIsExistDialog.setIndeterminate(true);
                this.mIsExistDialog.setMessage("请稍候.....");
                this.mIsExistDialog.show();
                new Thread() { // from class: com.youai.dreamonepiece.DownloadApk.2
                    @Override // java.lang.Thread, java.lang.Runnable
                    public void run() {
                        HttpGet httpGet = new HttpGet();
                        HttpParams params = new BasicHttpParams();
                        HttpConnectionParams.setConnectionTimeout(params, 8000);
                        httpGet.setParams(params);
                        try {
                            HttpClient httpClient = new DefaultHttpClient();
                            HttpResponse httpResponse = httpClient.execute(httpGet);
                            int statusCode = httpResponse.getStatusLine().getStatusCode();
                            Log.e("DownloadApk", "statusCode" + statusCode);
                            Message msg = new Message();
                            msg.what = DownloadApk.RESPONSE;
                            msg.arg1 = statusCode;
                            DownloadApk.this.mResponseHandler.sendMessage(msg);
                        } catch (Exception e3) {
                            Message msg2 = new Message();
                            msg2.what = DownloadApk.RESPONSE;
                            msg2.arg1 = 404;
                            DownloadApk.this.mResponseHandler.sendMessage(msg2);
                        }
                    }
                }.start();
                return;
            }
        }
        this.useChannelUrl = 0;
        onCreate(this.mOriginalUrl);
    }

    public void Onchannel(String strChannel, String _url) {
        if (this.channel != null && !this.channel.equals(StatConstants.MTA_COOPERATION_TAG)) {
            this.mUrlChannel = _url + "_" + this.channel + ".apk";
            DOWNLOAD_FILE_NAME = "OnePiece_" + this.context.getPlatformId() + this.channel + ".apk";
            this.useChannelUrl = 1;
            onCreate(this.mUrlChannel);
        }
    }

    public void onDestroy() {
        this.context.getContentResolver().unregisterContentObserver(this.downloadObserver);
        this.context.unregisterReceiver(this.completeReceiver);
    }

    public void preCreate() {
        this.downloadObserver = new DownloadChangeObserver();
        this.completeReceiver = new CompleteReceiver();
        this.handler = new DownLoadHandler();
        this.context.getContentResolver().registerContentObserver(DownloadManagerPro.CONTENT_URI, true, this.downloadObserver);
        this.context.registerReceiver(this.completeReceiver, new IntentFilter("android.intent.action.DOWNLOAD_COMPLETE"));
        this.downloadManager = (DownloadManager) this.context.getSystemService("download");
        this.downloadManagerPro = new DownloadManagerPro(this.downloadManager);
        this.mpDialog = new ProgressDialog(this.context);
        this.mpDialog.setProgressStyle(1);
        this.mpDialog.setTitle("提示");
        this.mpDialog.setMessage("正在下载最新软件，需要较长时间，是否切换后台下载?");
        this.mpDialog.setIndeterminate(false);
        this.mpDialog.setCancelable(false);
        this.mpDialog.setButton("确定", new DialogInterface.OnClickListener() { // from class: com.youai.dreamonepiece.DownloadApk.3
            @Override // android.content.DialogInterface.OnClickListener
            public void onClick(DialogInterface dialog, int which) {
                Intent i = new Intent("android.intent.action.MAIN");
                i.setFlags(268435456);
                i.addCategory("android.intent.category.HOME");
                DownloadApk.this.context.startActivity(i);
            }
        });
    }

    public void onCreate(String pDownloadUrl) {
        String DownloadPath = Environment.getExternalStorageDirectory().getAbsolutePath();
        this.DownloadPathFile = new File(DownloadPath + File.separator + DOWNLOAD_FOLDER_NAME);
        if (!this.DownloadPathFile.exists() || !this.DownloadPathFile.isDirectory()) {
            this.DownloadPathFile.mkdirs();
        }
        this.DownloadPathFile = new File(DownloadPath + File.separator + Environment.DIRECTORY_DOWNLOADS);
        if (!this.DownloadPathFile.exists() || !this.DownloadPathFile.isDirectory()) {
            this.DownloadPathFile.mkdirs();
        }
        File DOWNLOAD_FILE = new File(this.DownloadPathFile, DOWNLOAD_FILE_NAME);
        if ((Build.VERSION.SDK_INT < 11) & DOWNLOAD_FILE.exists() & DOWNLOAD_FILE.isFile()) {
            DOWNLOAD_FILE.delete();
        }
        Log.i("DownloadApk path", DOWNLOAD_FILE.getAbsolutePath());
        DownloadManager.Request request = new DownloadManager.Request(Uri.parse(pDownloadUrl));
        request.setDestinationInExternalPublicDir(Environment.DIRECTORY_DOWNLOADS, DOWNLOAD_FILE_NAME);
        request.setTitle(this.context.getText(R.string.app_name));
        request.setDescription(this.context.getText(R.string.app_name));
        if (Build.VERSION.SDK_INT >= 11) {
            request.setNotificationVisibility(1);
        }
        request.setVisibleInDownloadsUi(false);
        request.setMimeType("application/vnd.android.package-archive");
        this.downloadId = this.downloadManager.enqueue(request);
        this.mpDialog.show();
        updateView();
    }

    public void updateView() {
        int[] bytesAndStatus = this.downloadManagerPro.getBytesAndStatus(this.downloadId);
        this.handler.sendMessage(this.handler.obtainMessage(0, bytesAndStatus[0], bytesAndStatus[1], Integer.valueOf(bytesAndStatus[2])));
    }

    public static CharSequence getAppSize(long size) {
        if (size <= 0) {
            return "0M";
        }
        if (size >= 1048576) {
            return new StringBuilder(16).append(DOUBLE_DECIMAL_FORMAT.format(size / 1048576.0d)).append("M");
        }
        if (size >= 1024) {
            return new StringBuilder(16).append(DOUBLE_DECIMAL_FORMAT.format(size / 1024.0d)).append("K");
        }
        return size + "B";
    }

    public static boolean isDownloading(int downloadManagerStatus) {
        return downloadManagerStatus == 2 || downloadManagerStatus == 4 || downloadManagerStatus == 1;
    }

    public static boolean install(Context context, File filePath) {
        Intent i = new Intent("android.intent.action.VIEW");
        if (filePath == null || filePath.length() <= 0 || !filePath.exists() || !filePath.isFile()) {
            return false;
        }
        i.setDataAndType(Uri.fromFile(filePath), "application/vnd.android.package-archive");
        i.addFlags(268435456);
        context.startActivity(i);
        return true;
    }

    class DownloadChangeObserver extends ContentObserver {
        public DownloadChangeObserver() {
            super(DownloadApk.this.handler);
        }

        @Override // android.database.ContentObserver
        public void onChange(boolean selfChange) {
            DownloadApk.this.updateView();
        }
    }

    class CompleteReceiver extends BroadcastReceiver {
        CompleteReceiver() {
        }

        @Override // android.content.BroadcastReceiver
        public void onReceive(Context context, Intent intent) {
            long completeDownloadId = intent.getLongExtra("extra_download_id", 0L);
            if ((completeDownloadId != 0) & (completeDownloadId == DownloadApk.this.downloadId)) {
                DownloadApk.this.mpDialog.dismiss();
                if (DownloadApk.this.downloadManagerPro.getStatusById(DownloadApk.this.downloadId) == 8) {
                    String path = DownloadApk.this.downloadManagerPro.getFileName(DownloadApk.this.downloadId);
                    Log.i("path", path);
                    DownloadApk.install(context, new File(path));
                }
            }
        }
    }

    @SuppressLint({"HandlerLeak"})
    class DownLoadHandler extends Handler {
        int progress = 0;

        DownLoadHandler() {
        }

        @Override // android.os.Handler
        public void handleMessage(Message msg) {
            int max;
            String maxSize;
            String progressSize;
            super.handleMessage(msg);
            switch (msg.what) {
                case 0:
                    int status = ((Integer) msg.obj).intValue();
                    if (DownloadApk.isDownloading(status)) {
                        DownloadApk.this.mpDialog.show();
                        Log.i("isDownloading", "isDownloading" + status);
                        if (msg.arg2 >= 0) {
                            if (msg.arg2 <= 0) {
                                this.progress = 0;
                            }
                            if (msg.arg2 >= 1048576) {
                                max = msg.arg2 / 1048576;
                                this.progress = msg.arg1 / 1048576;
                                maxSize = max + "MB";
                                progressSize = this.progress + "MB";
                            } else if (msg.arg2 >= 1024) {
                                max = msg.arg2 / 1024;
                                this.progress = msg.arg1 / 1024;
                                maxSize = max + "KB";
                                progressSize = this.progress + "KB";
                            } else {
                                max = msg.arg2;
                                this.progress = msg.arg1;
                                maxSize = max + "B";
                                progressSize = this.progress + "B";
                            }
                            DownloadApk.this.mpDialog.setMax(max);
                            DownloadApk.this.mpDialog.setProgress(this.progress);
                            DownloadApk.this.mpDialog.setMessage("正在下载最新版本安装包，需要较长时间，是否切换后台下载?\r\n下载：" + progressSize + "/" + maxSize);
                        }
                    } else if (status == 16) {
                        if (DownloadApk.this.useChannelUrl != 1) {
                            if (DownloadApk.this.useChannelUrl == 0) {
                                DownloadApk.this.mpDialog.dismiss();
                                DownloadApk.this.downloadManager.remove(DownloadApk.this.downloadId);
                                Toast.makeText(DownloadApk.this.context, "存储空间不足  下载失败", 0).show();
                            }
                        } else if (this.progress == 0) {
                            DownloadApk.this.mpDialog.dismiss();
                            DownloadApk.this.downloadManager.remove(DownloadApk.this.downloadId);
                            DownloadApk.this.useChannelUrl = 0;
                            DownloadApk.this.onCreate(DownloadApk.this.mOriginalUrl);
                        } else {
                            DownloadApk.this.mpDialog.dismiss();
                            DownloadApk.this.downloadManager.remove(DownloadApk.this.downloadId);
                            Toast.makeText(DownloadApk.this.context, "存储空间不足  下载失败", 0).show();
                        }
                    } else if (status == 8) {
                        Toast.makeText(DownloadApk.this.context, "下载成功", 0).show();
                    }
                    break;
            }
        }
    }
}
