package com.igexin.download;

import android.content.ContentResolver;
import android.content.ContentUris;
import android.content.ContentValues;
import android.content.Context;
import android.database.Cursor;
import android.net.Uri;
import android.os.Handler;
import android.os.Message;
import com.tencent.stat.common.StatConstants;
import java.util.ArrayList;
import java.util.Collection;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

/* JADX INFO: loaded from: classes.dex */
public class SdkDownLoader {
    static int a = 3;
    static String b = "/libs/tmp";
    static SdkDownLoader c;
    Handler d;
    private Context f;
    private List g = new ArrayList();
    public Map updateData = new HashMap();
    private Object h = new Object();
    String[] e = {"_id", Downloads._DATA, Downloads.COLUMN_FILE_NAME_HINT, Downloads.COLUMN_STATUS, Downloads.COLUMN_TOTAL_BYTES, Downloads.COLUMN_CURRENT_BYTES};

    private SdkDownLoader(Context context) {
        this.f = context;
        this.d = new j(this, context.getMainLooper());
    }

    private int a(ContentValues contentValues) {
        ContentResolver contentResolver = this.f.getContentResolver();
        contentValues.put(Downloads.COLUMN_DATA10, String.valueOf(System.currentTimeMillis()));
        Uri uriInsert = contentResolver.insert(Downloads.a, contentValues);
        if (uriInsert != null) {
            return Integer.parseInt(uriInsert.getPathSegments().get(1));
        }
        return -1;
    }

    private int a(String str, String str2, ContentValues contentValues, String str3) {
        ContentValues contentValues2 = new ContentValues();
        if (contentValues != null) {
            contentValues2.putAll(contentValues);
        }
        contentValues2.put(Downloads.COLUMN_DESTINATION, (Integer) 0);
        if (str != null) {
            contentValues2.put(Downloads.COLUMN_URI, str);
        }
        if (str2 != null) {
            contentValues2.put(Downloads.COLUMN_FILE_NAME_HINT, str2.replaceAll("\\*", StatConstants.MTA_COOPERATION_TAG));
        }
        if (str3 != null) {
            contentValues2.put(Downloads.COLUMN_DESCRIPTION, str3);
        }
        return a(contentValues2);
    }

    public static SdkDownLoader getInstantiate(Context context) {
        if (c == null) {
            c = new SdkDownLoader(context);
        }
        return c;
    }

    IDownloadCallback a(String str) {
        if (str == null) {
            return null;
        }
        for (IDownloadCallback iDownloadCallback : this.g) {
            if (str.equals(iDownloadCallback.getName())) {
                return iDownloadCallback;
            }
        }
        return null;
    }

    protected void a(Collection collection) {
        synchronized (this.h) {
            if (collection != null) {
                if (collection.size() > 0) {
                    HashMap map = new HashMap();
                    Iterator it = collection.iterator();
                    while (it.hasNext()) {
                        DownloadInfo downloadInfo = (DownloadInfo) it.next();
                        if (this.updateData.containsKey(Integer.valueOf(downloadInfo.mId))) {
                            DownloadInfo downloadInfo2 = (DownloadInfo) this.updateData.get(Integer.valueOf(downloadInfo.mId));
                            if (downloadInfo2 != null) {
                                downloadInfo2.copyFrom(downloadInfo);
                                map.put(Integer.valueOf(downloadInfo2.mId), downloadInfo2);
                            }
                        } else {
                            DownloadInfo downloadInfoM1clone = downloadInfo.m1clone();
                            if (downloadInfoM1clone != null) {
                                map.put(Integer.valueOf(downloadInfo.mId), downloadInfoM1clone);
                            }
                        }
                    }
                    this.updateData = map;
                } else {
                    this.updateData.clear();
                }
            }
        }
    }

    public boolean deleteTask(int i) {
        this.f.getContentResolver().delete(ContentUris.withAppendedId(Downloads.a, i), null, null);
        return true;
    }

    public boolean deleteTask(int[] iArr) {
        ContentResolver contentResolver = this.f.getContentResolver();
        String[] strArr = new String[iArr.length];
        for (int i = 0; i < strArr.length; i++) {
            strArr[i] = String.valueOf(iArr[i]);
        }
        contentResolver.delete(Downloads.a, "_id=?", strArr);
        return true;
    }

    public IDownloadCallback getCallback(String str) {
        if (str == null) {
            return null;
        }
        for (IDownloadCallback iDownloadCallback : this.g) {
            if (str.equals(iDownloadCallback.getName())) {
                return iDownloadCallback;
            }
        }
        return null;
    }

    public boolean isRegistered(String str) {
        Iterator it = this.g.iterator();
        while (it.hasNext()) {
            String name = ((IDownloadCallback) it.next()).getName();
            if (name != null && name.equals(str)) {
                return true;
            }
        }
        return false;
    }

    public int newTask(String str, String str2, String str3, boolean z, String str4) {
        ContentValues contentValues = new ContentValues();
        if (str3 != null) {
            contentValues.put(Downloads.COLUMN_DATA6, str3);
        }
        if (z) {
            contentValues.put(Downloads.COLUMN_DATA9, "wifi");
        }
        contentValues.put(Downloads.COLUMN_DATA8, str4);
        return a(str, str2, contentValues, null);
    }

    public boolean pauseAllTask() {
        ContentValues contentValues = new ContentValues();
        contentValues.put(Downloads.COLUMN_CONTROL, (Integer) 1);
        contentValues.put(Downloads.COLUMN_STATUS, (Integer) 193);
        this.f.getContentResolver().update(Downloads.a, contentValues, "status=? OR status=? OR(status=? AND control<>?)", new String[]{String.valueOf(192), String.valueOf(190), String.valueOf(193), String.valueOf(1)});
        return true;
    }

    public boolean pauseTask(int i) {
        ContentValues contentValues = new ContentValues();
        contentValues.put(Downloads.COLUMN_CONTROL, (Integer) 1);
        this.f.getContentResolver().update(ContentUris.withAppendedId(Downloads.a, i), contentValues, null, null);
        return true;
    }

    public boolean queryTask(String str) {
        Cursor cursorQuery;
        if (Downloads.a == null || (cursorQuery = this.f.getContentResolver().query(Downloads.a, null, "data_8 = ? ", new String[]{str}, null)) == null) {
            return false;
        }
        int count = cursorQuery.getCount();
        cursorQuery.close();
        return count > 0;
    }

    public void refreshList() {
        Message message = new Message();
        message.what = 2;
        this.d.sendMessage(message);
    }

    public void registerDownloadCallback(IDownloadCallback iDownloadCallback) {
        if (this.g.contains(iDownloadCallback)) {
            return;
        }
        this.g.add(iDownloadCallback);
    }

    public void setDownloadDir(String str) {
        b = str;
    }

    public boolean startTask(int i) {
        ContentValues contentValues = new ContentValues();
        contentValues.put(Downloads.COLUMN_CONTROL, (Integer) 0);
        contentValues.put("numfailed", (Integer) 0);
        this.f.getContentResolver().update(ContentUris.withAppendedId(Downloads.a, i), contentValues, null, null);
        return true;
    }

    public void unregisterDownloadCallback(IDownloadCallback iDownloadCallback) {
        this.g.remove(iDownloadCallback);
    }

    public boolean updateTask(int i, String str, String str2) {
        ContentValues contentValues = new ContentValues();
        contentValues.put(str, str2);
        this.f.getContentResolver().update(ContentUris.withAppendedId(Downloads.a, i), contentValues, null, null);
        return true;
    }
}
