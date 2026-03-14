package com.youai.dreamonepiece;

import android.app.DownloadManager;
import android.database.Cursor;
import android.net.Uri;
import android.os.Build;
import android.os.Environment;
import com.igexin.download.Downloads;
import java.io.File;

/* JADX INFO: loaded from: classes.dex */
public class DownloadManagerPro {
    public static final Uri CONTENT_URI = Uri.parse("content://downloads/my_downloads");
    private DownloadManager downloadManager;

    public DownloadManagerPro(DownloadManager downloadManager) {
        this.downloadManager = downloadManager;
    }

    public int getStatusById(long downloadId) {
        return getInt(downloadId, Downloads.COLUMN_STATUS);
    }

    public int[] getDownloadBytes(long downloadId) {
        int[] bytesAndStatus = getBytesAndStatus(downloadId);
        return new int[]{bytesAndStatus[0], bytesAndStatus[1]};
    }

    public int[] getBytesAndStatus(long downloadId) {
        int[] bytesAndStatus = {-1, -1, 0};
        DownloadManager.Query query = new DownloadManager.Query().setFilterById(downloadId);
        Cursor c = null;
        try {
            c = this.downloadManager.query(query);
            if (c != null && c.moveToFirst()) {
                bytesAndStatus[0] = c.getInt(c.getColumnIndexOrThrow("bytes_so_far"));
                bytesAndStatus[1] = c.getInt(c.getColumnIndexOrThrow("total_size"));
                bytesAndStatus[2] = c.getInt(c.getColumnIndex(Downloads.COLUMN_STATUS));
            }
            return bytesAndStatus;
        } finally {
            if (c != null) {
                c.close();
            }
        }
    }

    public String getFileName(long downloadId) {
        return Build.VERSION.SDK_INT >= 11 ? getString(downloadId, "local_filename") : Environment.getExternalStorageDirectory().getAbsolutePath() + File.separator + Environment.DIRECTORY_DOWNLOADS + File.separator + DownloadApk.DOWNLOAD_FILE_NAME;
    }

    public String getUri(long downloadId) {
        return getString(downloadId, Downloads.COLUMN_URI);
    }

    public int getReason(long downloadId) {
        return getInt(downloadId, "reason");
    }

    public int getPausedReason(long downloadId) {
        return getInt(downloadId, "reason");
    }

    public int getErrorCode(long downloadId) {
        return getInt(downloadId, "reason");
    }

    private String getString(long downloadId, String columnName) {
        DownloadManager.Query query = new DownloadManager.Query().setFilterById(downloadId);
        String result = null;
        Cursor c = null;
        try {
            c = this.downloadManager.query(query);
            if (c != null && c.moveToFirst()) {
                result = c.getString(c.getColumnIndex(columnName));
            }
            return result;
        } finally {
            if (c != null) {
                c.close();
            }
        }
    }

    private int getInt(long downloadId, String columnName) {
        DownloadManager.Query query = new DownloadManager.Query().setFilterById(downloadId);
        int result = -1;
        Cursor c = null;
        try {
            c = this.downloadManager.query(query);
            if (c != null && c.moveToFirst()) {
                result = c.getInt(c.getColumnIndex(columnName));
            }
            return result;
        } finally {
            if (c != null) {
                c.close();
            }
        }
    }
}
