package com.igexin.download;

import android.app.Service;
import android.content.ContentUris;
import android.content.ContentValues;
import android.content.Intent;
import android.database.CharArrayBuffer;
import android.database.Cursor;
import android.os.IBinder;
import java.io.File;
import java.lang.reflect.InvocationTargetException;
import java.util.ArrayList;

/* JADX INFO: loaded from: classes.dex */
public class DownloadService extends Service {
    static boolean a = false;
    private d b;
    private ArrayList c;
    private f d;
    private boolean e;
    private e f;
    private boolean g;
    private Object h;
    private CharArrayBuffer i;
    private CharArrayBuffer j;

    /* JADX INFO: Access modifiers changed from: private */
    public long a(int i, long j) {
        DownloadInfo downloadInfo = (DownloadInfo) this.c.get(i);
        if (Downloads.isStatusCompleted(downloadInfo.mStatus)) {
            return -1L;
        }
        if (downloadInfo.mStatus == 193 && downloadInfo.mNumFailed != 0) {
            long jRestartTime = downloadInfo.restartTime();
            if (jRestartTime <= j) {
                return 0L;
            }
            return jRestartTime - j;
        }
        return 0L;
    }

    private String a(String str, Cursor cursor, String str2) {
        int columnIndexOrThrow = cursor.getColumnIndexOrThrow(str2);
        if (str == null) {
            return cursor.getString(columnIndexOrThrow);
        }
        if (this.j == null) {
            this.j = new CharArrayBuffer(128);
        }
        cursor.copyStringToBuffer(columnIndexOrThrow, this.j);
        int i = this.j.sizeCopied;
        if (i != str.length()) {
            return cursor.getString(columnIndexOrThrow);
        }
        if (this.i == null || this.i.sizeCopied < i) {
            this.i = new CharArrayBuffer(i);
        }
        char[] cArr = this.i.data;
        char[] cArr2 = this.j.data;
        str.getChars(0, i, cArr, 0);
        for (int i2 = i - 1; i2 >= 0; i2--) {
            if (cArr[i2] != cArr2[i2]) {
                return new String(cArr2, 0, i);
            }
        }
        return str;
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void a() {
        synchronized (this) {
            this.e = true;
            if (this.d == null) {
                this.d = new f(this);
                this.d.start();
            }
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void a(Cursor cursor, int i, boolean z, boolean z2, long j) {
        int columnIndexOrThrow = cursor.getColumnIndexOrThrow(Downloads.COLUMN_STATUS);
        int columnIndexOrThrow2 = cursor.getColumnIndexOrThrow("numfailed");
        int i2 = cursor.getInt(cursor.getColumnIndexOrThrow("method"));
        DownloadInfo downloadInfo = new DownloadInfo(cursor.getInt(cursor.getColumnIndexOrThrow("_id")), cursor.getString(cursor.getColumnIndexOrThrow(Downloads.COLUMN_URI)), cursor.getInt(cursor.getColumnIndexOrThrow(Downloads.COLUMN_NO_INTEGRITY)) == 1, cursor.getString(cursor.getColumnIndexOrThrow(Downloads.COLUMN_FILE_NAME_HINT)), cursor.getString(cursor.getColumnIndexOrThrow(Downloads._DATA)), cursor.getString(cursor.getColumnIndexOrThrow(Downloads.COLUMN_MIME_TYPE)), cursor.getInt(cursor.getColumnIndexOrThrow(Downloads.COLUMN_DESTINATION)), cursor.getInt(cursor.getColumnIndexOrThrow(Downloads.COLUMN_VISIBILITY)), cursor.getInt(cursor.getColumnIndexOrThrow(Downloads.COLUMN_CONTROL)), cursor.getInt(columnIndexOrThrow), cursor.getInt(columnIndexOrThrow2), 268435455 & i2, i2 >> 28, cursor.getLong(cursor.getColumnIndexOrThrow(Downloads.COLUMN_LAST_MODIFICATION)), cursor.getLong(cursor.getColumnIndexOrThrow(Downloads.COLUMN_CREATE_MODIFICATION)), cursor.getString(cursor.getColumnIndexOrThrow(Downloads.COLUMN_EXTRAS)), cursor.getString(cursor.getColumnIndexOrThrow(Downloads.COLUMN_COOKIE_DATA)), cursor.getString(cursor.getColumnIndexOrThrow(Downloads.COLUMN_USER_AGENT)), cursor.getString(cursor.getColumnIndexOrThrow(Downloads.COLUMN_REFERER)), cursor.getInt(cursor.getColumnIndexOrThrow(Downloads.COLUMN_TOTAL_BYTES)), cursor.getInt(cursor.getColumnIndexOrThrow(Downloads.COLUMN_CURRENT_BYTES)), cursor.getString(cursor.getColumnIndexOrThrow("etag")), cursor.getString(cursor.getColumnIndexOrThrow(Downloads.COLUMN_DATA1)), cursor.getString(cursor.getColumnIndexOrThrow(Downloads.COLUMN_DATA2)), cursor.getString(cursor.getColumnIndexOrThrow(Downloads.COLUMN_DATA3)), cursor.getString(cursor.getColumnIndexOrThrow(Downloads.COLUMN_DATA4)), cursor.getString(cursor.getColumnIndexOrThrow(Downloads.COLUMN_DATA5)), cursor.getString(cursor.getColumnIndexOrThrow(Downloads.COLUMN_DATA6)), cursor.getString(cursor.getColumnIndexOrThrow(Downloads.COLUMN_DATA7)), cursor.getString(cursor.getColumnIndexOrThrow(Downloads.COLUMN_DATA8)), cursor.getString(cursor.getColumnIndexOrThrow(Downloads.COLUMN_DATA9)), cursor.getLong(cursor.getColumnIndexOrThrow(Downloads.COLUMN_DATA10)), cursor.getInt(cursor.getColumnIndexOrThrow(Downloads.COLUMN_IS_WEB_ICON)), cursor.getInt(cursor.getColumnIndexOrThrow("scanned")) == 1);
        this.c.add(i, downloadInfo);
        if (downloadInfo.canUseNetwork(z, z2)) {
            if ((!"wifi".equals(downloadInfo.mData9) || h.b(this)) && downloadInfo.isReadyToStart(j)) {
                if (!a(SdkDownLoader.a)) {
                    if (downloadInfo.mStatus != 190) {
                        downloadInfo.mStatus = 190;
                        ContentValues contentValues = new ContentValues();
                        contentValues.put(Downloads.COLUMN_STATUS, Integer.valueOf(downloadInfo.mStatus));
                        getContentResolver().update(ContentUris.withAppendedId(Downloads.a, downloadInfo.mId), contentValues, null, null);
                        return;
                    }
                    return;
                }
                if (downloadInfo.mHasActiveThread) {
                    return;
                }
                if (downloadInfo.mStatus != 192) {
                    downloadInfo.mStatus = 192;
                    ContentValues contentValues2 = new ContentValues();
                    contentValues2.put(Downloads.COLUMN_STATUS, Integer.valueOf(downloadInfo.mStatus));
                    getContentResolver().update(ContentUris.withAppendedId(Downloads.a, downloadInfo.mId), contentValues2, null, null);
                }
                g gVar = new g(this, downloadInfo);
                downloadInfo.mHasActiveThread = true;
                gVar.start();
                downloadInfo.mNotice = false;
            }
        }
    }

    private boolean a(int i) {
        Cursor cursorQuery = getContentResolver().query(Downloads.a, new String[]{"_id"}, "status == '192'", null, null);
        if (cursorQuery == null) {
            return false;
        }
        boolean z = cursorQuery.getCount() < i;
        cursorQuery.close();
        return z;
    }

    /* JADX INFO: Access modifiers changed from: private */
    public boolean a(Cursor cursor, int i) {
        DownloadInfo downloadInfo = (DownloadInfo) this.c.get(i);
        synchronized (this) {
            if (this.h != null) {
                try {
                    this.h.getClass().getMethod("scanFile", String.class, String.class).invoke(this.h, downloadInfo.mFileName, downloadInfo.mMimeType);
                    downloadInfo.mMediaScanned = true;
                    if (cursor != null) {
                        ContentValues contentValues = new ContentValues();
                        contentValues.put("scanned", (Integer) 1);
                        getContentResolver().update(ContentUris.withAppendedId(Downloads.a, cursor.getLong(cursor.getColumnIndexOrThrow("_id"))), contentValues, null, null);
                    }
                    return true;
                } catch (IllegalAccessException e) {
                } catch (IllegalArgumentException e2) {
                } catch (NoSuchMethodException e3) {
                } catch (SecurityException e4) {
                } catch (InvocationTargetException e5) {
                } catch (Exception e6) {
                }
            }
            return false;
        }
    }

    private boolean a(String str) {
        return true;
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void b(int i) {
        DownloadInfo downloadInfo = (DownloadInfo) this.c.get(i);
        if (downloadInfo.mStatus == 192) {
            downloadInfo.mStatus = Downloads.STATUS_CANCELED;
        } else if (downloadInfo.mDestination != 0 && downloadInfo.mFileName != null) {
            new File(downloadInfo.mFileName).delete();
        }
        this.c.remove(i);
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void b(Cursor cursor, int i, boolean z, boolean z2, long j) {
        DownloadInfo downloadInfo = (DownloadInfo) this.c.get(i);
        int columnIndexOrThrow = cursor.getColumnIndexOrThrow(Downloads.COLUMN_STATUS);
        int columnIndexOrThrow2 = cursor.getColumnIndexOrThrow("numfailed");
        downloadInfo.mId = cursor.getInt(cursor.getColumnIndexOrThrow("_id"));
        downloadInfo.mUri = a(downloadInfo.mUri, cursor, Downloads.COLUMN_URI);
        downloadInfo.mNoIntegrity = cursor.getInt(cursor.getColumnIndexOrThrow(Downloads.COLUMN_NO_INTEGRITY)) == 1;
        downloadInfo.mHint = a(downloadInfo.mHint, cursor, Downloads.COLUMN_FILE_NAME_HINT);
        downloadInfo.mFileName = a(downloadInfo.mFileName, cursor, Downloads._DATA);
        downloadInfo.mMimeType = a(downloadInfo.mMimeType, cursor, Downloads.COLUMN_MIME_TYPE);
        downloadInfo.mDestination = cursor.getInt(cursor.getColumnIndexOrThrow(Downloads.COLUMN_DESTINATION));
        downloadInfo.mVisibility = cursor.getInt(cursor.getColumnIndexOrThrow(Downloads.COLUMN_VISIBILITY));
        synchronized (downloadInfo) {
            downloadInfo.mControl = cursor.getInt(cursor.getColumnIndexOrThrow(Downloads.COLUMN_CONTROL));
        }
        downloadInfo.mStatus = cursor.getInt(columnIndexOrThrow);
        downloadInfo.mNumFailed = cursor.getInt(columnIndexOrThrow2);
        int i2 = cursor.getInt(cursor.getColumnIndexOrThrow("method"));
        downloadInfo.mRetryAfter = 268435455 & i2;
        downloadInfo.mRedirectCount = i2 >> 28;
        downloadInfo.mLastMod = cursor.getLong(cursor.getColumnIndexOrThrow(Downloads.COLUMN_LAST_MODIFICATION));
        downloadInfo.mCreateMod = cursor.getLong(cursor.getColumnIndexOrThrow(Downloads.COLUMN_CREATE_MODIFICATION));
        downloadInfo.mCookies = a(downloadInfo.mCookies, cursor, Downloads.COLUMN_COOKIE_DATA);
        downloadInfo.mExtras = a(downloadInfo.mExtras, cursor, Downloads.COLUMN_EXTRAS);
        downloadInfo.mUserAgent = a(downloadInfo.mUserAgent, cursor, Downloads.COLUMN_USER_AGENT);
        downloadInfo.mReferer = a(downloadInfo.mReferer, cursor, Downloads.COLUMN_REFERER);
        downloadInfo.mTotalBytes = cursor.getInt(cursor.getColumnIndexOrThrow(Downloads.COLUMN_TOTAL_BYTES));
        downloadInfo.mCurrentBytes = cursor.getInt(cursor.getColumnIndexOrThrow(Downloads.COLUMN_CURRENT_BYTES));
        downloadInfo.mETag = a(downloadInfo.mETag, cursor, "etag");
        if (downloadInfo.canUseNetwork(z, z2)) {
            if ((!"wifi".equals(downloadInfo.mData9) || h.b(this)) && downloadInfo.isReadyToRestart(j)) {
                if (!a(SdkDownLoader.a)) {
                    if (downloadInfo.mStatus != 190) {
                        downloadInfo.mStatus = 190;
                        ContentValues contentValues = new ContentValues();
                        contentValues.put(Downloads.COLUMN_STATUS, Integer.valueOf(downloadInfo.mStatus));
                        getContentResolver().update(ContentUris.withAppendedId(Downloads.a, downloadInfo.mId), contentValues, null, null);
                        return;
                    }
                    return;
                }
                if (downloadInfo.mHasActiveThread) {
                    return;
                }
                downloadInfo.mStatus = 192;
                ContentValues contentValues2 = new ContentValues();
                contentValues2.put(Downloads.COLUMN_STATUS, Integer.valueOf(downloadInfo.mStatus));
                getContentResolver().update(ContentUris.withAppendedId(Downloads.a, downloadInfo.mId), contentValues2, null, null);
                g gVar = new g(this, downloadInfo);
                downloadInfo.mHasActiveThread = true;
                gVar.start();
                downloadInfo.mNotice = false;
            }
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public boolean b() {
        return this.h != null;
    }

    /* JADX INFO: Access modifiers changed from: private */
    public boolean c(int i) {
        return ((DownloadInfo) this.c.get(i)).hasCompletionNotification();
    }

    /* JADX INFO: Access modifiers changed from: private */
    public boolean d(int i) {
        DownloadInfo downloadInfo = (DownloadInfo) this.c.get(i);
        return !downloadInfo.mMediaScanned && downloadInfo.mDestination == 0 && Downloads.isStatusSuccess(downloadInfo.mStatus) && !a(downloadInfo.mMimeType);
    }

    @Override // android.app.Service
    public IBinder onBind(Intent intent) {
        throw new UnsupportedOperationException("Cannot bind to Download Manager Service");
    }

    @Override // android.app.Service
    public void onCreate() {
        super.onCreate();
        try {
            this.c = (ArrayList) Class.forName("com.google.android.collect.Lists").getMethod("newArrayList", null).invoke(null, new Object[0]);
        } catch (ClassNotFoundException e) {
        } catch (IllegalAccessException e2) {
        } catch (IllegalArgumentException e3) {
        } catch (NoSuchMethodException e4) {
        } catch (SecurityException e5) {
        } catch (InvocationTargetException e6) {
        }
        this.b = new d(this);
        getContentResolver().registerContentObserver(Downloads.a, true, this.b);
        this.h = null;
        this.g = false;
        this.f = new e(this);
    }

    @Override // android.app.Service
    public void onDestroy() {
        getContentResolver().unregisterContentObserver(this.b);
        super.onDestroy();
    }

    @Override // android.app.Service
    public void onStart(Intent intent, int i) {
        super.onStart(intent, i);
        a();
    }
}
