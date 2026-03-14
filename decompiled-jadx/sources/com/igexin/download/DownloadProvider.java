package com.igexin.download;

import android.content.ContentProvider;
import android.content.ContentValues;
import android.content.Context;
import android.content.Intent;
import android.content.UriMatcher;
import android.database.Cursor;
import android.database.SQLException;
import android.database.sqlite.SQLiteDatabase;
import android.database.sqlite.SQLiteOpenHelper;
import android.database.sqlite.SQLiteQueryBuilder;
import android.net.Uri;
import android.os.Binder;
import android.os.ParcelFileDescriptor;
import android.os.Process;
import com.tencent.stat.common.StatConstants;
import java.io.File;
import java.io.FileNotFoundException;
import java.util.HashSet;

/* JADX INFO: loaded from: classes.dex */
public final class DownloadProvider extends ContentProvider {
    private static String a = "tmpd8.db";
    private static final UriMatcher b = new UriMatcher(-1);
    private static final String[] c = {"_id", Downloads.COLUMN_APP_DATA, Downloads._DATA, Downloads.COLUMN_MIME_TYPE, Downloads.COLUMN_VISIBILITY, Downloads.COLUMN_DESTINATION, Downloads.COLUMN_CONTROL, Downloads.COLUMN_STATUS, Downloads.COLUMN_LAST_MODIFICATION, Downloads.COLUMN_CREATE_MODIFICATION, Downloads.COLUMN_TOTAL_BYTES, Downloads.COLUMN_CURRENT_BYTES, Downloads.COLUMN_TITLE, Downloads.COLUMN_DESCRIPTION, Downloads.COLUMN_DATA8, Downloads.COLUMN_DATA10};
    private static HashSet d = new HashSet();
    private SQLiteOpenHelper e = null;

    static {
        for (int i = 0; i < c.length; i++) {
            d.add(c[i]);
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void a(SQLiteDatabase sQLiteDatabase) {
        try {
            sQLiteDatabase.execSQL("CREATE TABLE downloads(_id INTEGER PRIMARY KEY AUTOINCREMENT,uri TEXT, method INTEGER, entity TEXT, no_integrity BOOLEAN, hint TEXT, otaupdate BOOLEAN, _data TEXT, mimetype TEXT, destination INTEGER, no_system BOOLEAN, visibility INTEGER, control INTEGER default 0, status INTEGER, numfailed INTEGER, lastmod BIGINT, createmod BIGINT, extras TEXT, cookiedata TEXT, useragent TEXT, referer TEXT, total_bytes INTEGER, current_bytes INTEGER, etag TEXT, uid INTEGER, otheruid INTEGER, title TEXT, description TEXT, scanned BOOLEAN,data_1 TEXT, data_2 TEXT, data_3 TEXT, data_4 TEXT, data_5 TEXT, data_6 TEXT, data_7 TEXT, data_8 TEXT, data_9 TEXT, data_10 BIGINT, iswebicon INTEGER);");
        } catch (SQLException e) {
            throw e;
        }
    }

    private static final void a(String str, ContentValues contentValues, ContentValues contentValues2) {
        Long asLong = contentValues.getAsLong(str);
        if (asLong != null) {
            contentValues2.put(str, asLong);
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void b(SQLiteDatabase sQLiteDatabase) {
        try {
            sQLiteDatabase.execSQL("DROP TABLE IF EXISTS downloads");
        } catch (SQLException e) {
            throw e;
        }
    }

    private static final void b(String str, ContentValues contentValues, ContentValues contentValues2) {
        Integer asInteger = contentValues.getAsInteger(str);
        if (asInteger != null) {
            contentValues2.put(str, asInteger);
        }
    }

    private static final void c(String str, ContentValues contentValues, ContentValues contentValues2) {
        Boolean asBoolean = contentValues.getAsBoolean(str);
        if (asBoolean != null) {
            contentValues2.put(str, asBoolean);
        }
    }

    private static final void d(String str, ContentValues contentValues, ContentValues contentValues2) {
        String asString = contentValues.getAsString(str);
        if (asString != null) {
            contentValues2.put(str, asString);
        }
    }

    @Override // android.content.ContentProvider
    public int delete(Uri uri, String str, String[] strArr) {
        h.a(str, d);
        SQLiteDatabase writableDatabase = this.e.getWritableDatabase();
        int iMatch = b.match(uri);
        switch (iMatch) {
            case 1:
            case 2:
                String str2 = str != null ? iMatch == 1 ? "( " + str + " )" : "( " + str + " ) AND " : StatConstants.MTA_COOPERATION_TAG;
                String str3 = iMatch == 2 ? str2 + " ( _id = " + Long.parseLong(uri.getPathSegments().get(1)) + " ) " : str2;
                if (Binder.getCallingPid() != Process.myPid() && Binder.getCallingUid() != 0) {
                    str3 = str3 + " AND ( uid=" + Binder.getCallingUid() + " OR " + Downloads.COLUMN_OTHER_UID + "=" + Binder.getCallingUid() + " )";
                }
                int iDelete = writableDatabase.delete("downloads", str3, strArr);
                getContext().getContentResolver().notifyChange(uri, null);
                return iDelete;
            default:
                throw new UnsupportedOperationException("Cannot delete URI: " + uri);
        }
    }

    @Override // android.content.ContentProvider
    public String getType(Uri uri) {
        switch (b.match(uri)) {
            case 1:
                return "vnd.android.cursor.dir/download";
            case 2:
                return "vnd.android.cursor.item/download";
            case 3:
                return "vnd.android.cursor.sql/download";
            default:
                throw new IllegalArgumentException("Unknown URI: " + uri);
        }
    }

    @Override // android.content.ContentProvider
    public Uri insert(Uri uri, ContentValues contentValues) {
        SQLiteDatabase writableDatabase = this.e.getWritableDatabase();
        if (b.match(uri) != 1) {
            throw new IllegalArgumentException("Unknown/Invalid URI " + uri);
        }
        ContentValues contentValues2 = new ContentValues();
        d(Downloads._DATA, contentValues, contentValues2);
        d(Downloads.COLUMN_URI, contentValues, contentValues2);
        d(Downloads.COLUMN_APP_DATA, contentValues, contentValues2);
        c(Downloads.COLUMN_NO_INTEGRITY, contentValues, contentValues2);
        d(Downloads.COLUMN_FILE_NAME_HINT, contentValues, contentValues2);
        d(Downloads.COLUMN_MIME_TYPE, contentValues, contentValues2);
        Integer asInteger = contentValues.getAsInteger(Downloads.COLUMN_DESTINATION);
        if (asInteger != null) {
            contentValues2.put(Downloads.COLUMN_DESTINATION, asInteger);
        }
        Integer asInteger2 = contentValues.getAsInteger(Downloads.COLUMN_VISIBILITY);
        if (asInteger2 != null) {
            contentValues2.put(Downloads.COLUMN_VISIBILITY, asInteger2);
        } else if (asInteger.intValue() == 0) {
            contentValues2.put(Downloads.COLUMN_VISIBILITY, (Integer) 1);
        } else {
            contentValues2.put(Downloads.COLUMN_VISIBILITY, (Integer) 2);
        }
        b(Downloads.COLUMN_CONTROL, contentValues, contentValues2);
        if (contentValues.containsKey(Downloads.COLUMN_STATUS)) {
            b(Downloads.COLUMN_STATUS, contentValues, contentValues2);
        } else {
            contentValues2.put(Downloads.COLUMN_STATUS, (Integer) 190);
        }
        contentValues2.put(Downloads.COLUMN_LAST_MODIFICATION, Long.valueOf(System.currentTimeMillis()));
        contentValues2.put(Downloads.COLUMN_CREATE_MODIFICATION, Long.valueOf(System.currentTimeMillis()));
        d(Downloads.COLUMN_EXTRAS, contentValues, contentValues2);
        d(Downloads.COLUMN_DATA1, contentValues, contentValues2);
        d(Downloads.COLUMN_DATA2, contentValues, contentValues2);
        d(Downloads.COLUMN_DATA3, contentValues, contentValues2);
        d(Downloads.COLUMN_DATA4, contentValues, contentValues2);
        d(Downloads.COLUMN_DATA5, contentValues, contentValues2);
        d(Downloads.COLUMN_DATA6, contentValues, contentValues2);
        d(Downloads.COLUMN_DATA7, contentValues, contentValues2);
        d(Downloads.COLUMN_DATA8, contentValues, contentValues2);
        d(Downloads.COLUMN_DATA9, contentValues, contentValues2);
        a(Downloads.COLUMN_DATA10, contentValues, contentValues2);
        b(Downloads.COLUMN_IS_WEB_ICON, contentValues, contentValues2);
        d(Downloads.COLUMN_COOKIE_DATA, contentValues, contentValues2);
        d(Downloads.COLUMN_USER_AGENT, contentValues, contentValues2);
        d(Downloads.COLUMN_REFERER, contentValues, contentValues2);
        contentValues2.put("uid", Integer.valueOf(Binder.getCallingUid()));
        if (Binder.getCallingUid() == 0) {
            b("uid", contentValues, contentValues2);
        }
        d(Downloads.COLUMN_TITLE, contentValues, contentValues2);
        d(Downloads.COLUMN_DESCRIPTION, contentValues, contentValues2);
        Context context = getContext();
        context.startService(new Intent(context, (Class<?>) DownloadService.class));
        long jInsert = writableDatabase.insert("downloads", null, contentValues2);
        if (jInsert == -1) {
            return null;
        }
        context.startService(new Intent(context, (Class<?>) DownloadService.class));
        Uri uri2 = Uri.parse(Downloads.a + "/" + jInsert);
        context.getContentResolver().notifyChange(uri, null);
        return uri2;
    }

    @Override // android.content.ContentProvider
    public boolean onCreate() {
        this.e = new b(this, getContext());
        String str = "downloads." + getContext().getPackageName();
        b.addURI(str, "download", 1);
        b.addURI(str, "download/#", 2);
        b.addURI(str, "download/full/item", 3);
        Downloads.setContentUrl(str);
        return true;
    }

    @Override // android.content.ContentProvider
    public ParcelFileDescriptor openFile(Uri uri, String str) throws Throwable {
        Cursor cursorQuery;
        String str2;
        int count;
        Cursor cursor = null;
        try {
            cursorQuery = query(uri, new String[]{Downloads._DATA}, null, null, null);
            if (cursorQuery != null) {
                try {
                    count = cursorQuery.getCount();
                } catch (Exception e) {
                    if (cursorQuery != null) {
                        cursorQuery.close();
                        str2 = null;
                    } else {
                        str2 = null;
                    }
                } catch (Throwable th) {
                    cursor = cursorQuery;
                    th = th;
                    if (cursor != null) {
                        cursor.close();
                    }
                    throw th;
                }
            } else {
                count = 0;
            }
        } catch (Exception e2) {
            cursorQuery = null;
        } catch (Throwable th2) {
            th = th2;
        }
        if (count != 1) {
            if (count == 0) {
                throw new FileNotFoundException("No entry for " + uri);
            }
            throw new FileNotFoundException("Multiple items at " + uri);
        }
        cursorQuery.moveToFirst();
        String string = cursorQuery.getString(0);
        if (cursorQuery != null) {
            cursorQuery.close();
            str2 = string;
        } else {
            str2 = string;
        }
        if (str2 == null) {
            throw new FileNotFoundException("No filename found.");
        }
        if (!h.a(str2)) {
            throw new FileNotFoundException("Invalid filename.");
        }
        if (!"r".equals(str)) {
            throw new FileNotFoundException("Bad mode for " + uri + ": " + str);
        }
        ParcelFileDescriptor parcelFileDescriptorOpen = ParcelFileDescriptor.open(new File(str2), 268435456);
        if (parcelFileDescriptorOpen == null) {
            throw new FileNotFoundException("couldn't open file");
        }
        ContentValues contentValues = new ContentValues();
        contentValues.put(Downloads.COLUMN_LAST_MODIFICATION, Long.valueOf(System.currentTimeMillis()));
        update(uri, contentValues, null, null);
        return parcelFileDescriptorOpen;
    }

    @Override // android.content.ContentProvider
    public Cursor query(Uri uri, String[] strArr, String str, String[] strArr2, String str2) {
        String[] strArr3;
        Cursor cursorQuery;
        boolean z = true;
        h.a(str, d);
        SQLiteDatabase readableDatabase = this.e.getReadableDatabase();
        SQLiteQueryBuilder sQLiteQueryBuilder = new SQLiteQueryBuilder();
        int iMatch = b.match(uri);
        switch (iMatch) {
            case 1:
                sQLiteQueryBuilder.setTables("downloads");
                break;
            case 2:
                sQLiteQueryBuilder.setTables("downloads");
                sQLiteQueryBuilder.appendWhere("_id=");
                sQLiteQueryBuilder.appendWhere(uri.getPathSegments().get(1));
                z = false;
                break;
            case 3:
                sQLiteQueryBuilder.setTables("downloads");
                break;
            default:
                throw new IllegalArgumentException("Unknown URI: " + uri);
        }
        if (Binder.getCallingPid() == Process.myPid() || Binder.getCallingUid() == 0 || !Process.supportsProcesses()) {
            strArr3 = strArr;
        } else {
            if (!z) {
                sQLiteQueryBuilder.appendWhere(" AND ");
            }
            sQLiteQueryBuilder.appendWhere("( uid=" + Binder.getCallingUid() + " OR " + Downloads.COLUMN_OTHER_UID + "=" + Binder.getCallingUid() + " )");
            if (strArr == null) {
                strArr3 = c;
            } else {
                for (int i = 0; i < strArr.length; i++) {
                    if (!d.contains(strArr[i])) {
                        throw new IllegalArgumentException("column " + strArr[i] + " is not allowed in queries");
                    }
                }
                strArr3 = strArr;
            }
        }
        switch (iMatch) {
            case 3:
                if (strArr2 != null && strArr2.length > 0) {
                    String str3 = strArr2[0];
                    int length = strArr2.length - 1;
                    String[] strArr4 = new String[length];
                    for (int i2 = 0; i2 < length; i2++) {
                        strArr4[i2] = strArr2[i2 + 1];
                    }
                    cursorQuery = sQLiteQueryBuilder.query(readableDatabase, strArr3, str, strArr4, null, null, str2, str3);
                    break;
                }
            default:
                cursorQuery = sQLiteQueryBuilder.query(readableDatabase, strArr3, str, strArr2, null, null, str2);
                break;
        }
        Cursor cVar = cursorQuery != null ? new c(this, cursorQuery) : cursorQuery;
        if (cVar != null) {
            cVar.setNotificationUri(getContext().getContentResolver(), uri);
        }
        return cVar;
    }

    @Override // android.content.ContentProvider
    public int update(Uri uri, ContentValues contentValues, String str, String[] strArr) {
        boolean z;
        boolean z2;
        h.a(str, d);
        SQLiteDatabase writableDatabase = this.e.getWritableDatabase();
        if (Binder.getCallingPid() != Process.myPid()) {
            ContentValues contentValues2 = new ContentValues();
            d(Downloads.COLUMN_APP_DATA, contentValues, contentValues2);
            b(Downloads.COLUMN_VISIBILITY, contentValues, contentValues2);
            Integer asInteger = contentValues.getAsInteger(Downloads.COLUMN_CONTROL);
            if (asInteger != null) {
                contentValues2.put(Downloads.COLUMN_CONTROL, asInteger);
                z2 = true;
            } else {
                z2 = false;
            }
            b(Downloads.COLUMN_CONTROL, contentValues, contentValues2);
            d(Downloads.COLUMN_TITLE, contentValues, contentValues2);
            d(Downloads.COLUMN_DESCRIPTION, contentValues, contentValues2);
            contentValues = contentValues2;
            z = z2;
        } else {
            z = false;
        }
        int iMatch = b.match(uri);
        switch (iMatch) {
            case 1:
            case 2:
                String str2 = str != null ? iMatch == 1 ? "( " + str + " )" : "( " + str + " ) AND " : StatConstants.MTA_COOPERATION_TAG;
                String str3 = iMatch == 2 ? str2 + " ( _id = " + Long.parseLong(uri.getPathSegments().get(1)) + " ) " : str2;
                if (Binder.getCallingPid() != Process.myPid() && Binder.getCallingUid() != 0) {
                    str3 = str3 + " AND ( uid=" + Binder.getCallingUid() + " OR " + Downloads.COLUMN_OTHER_UID + "=" + Binder.getCallingUid() + " )";
                }
                int iUpdate = contentValues.size() > 0 ? writableDatabase.update("downloads", contentValues, str3, strArr) : 0;
                getContext().getContentResolver().notifyChange(uri, null);
                if (z) {
                    Context context = getContext();
                    context.startService(new Intent(context, (Class<?>) DownloadService.class));
                }
                return iUpdate;
            default:
                throw new UnsupportedOperationException("Cannot update URI: " + uri);
        }
    }
}
