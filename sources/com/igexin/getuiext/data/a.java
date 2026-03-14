package com.igexin.getuiext.data;

import android.content.ContentValues;
import android.content.Context;
import android.database.Cursor;
import android.database.sqlite.SQLiteDatabase;
import android.database.sqlite.SQLiteOpenHelper;

/* JADX INFO: loaded from: classes.dex */
public class a extends SQLiteOpenHelper {
    public static long a = 0;
    public static long b = 0;
    public static a c;
    SQLiteDatabase d;

    public a(Context context) throws Throwable {
        super(context, "increment.db", (SQLiteDatabase.CursorFactory) null, 3);
        this.d = null;
        c = this;
        c();
    }

    private void a(String str, int i, String str2, long j) {
        try {
            ContentValues contentValues = new ContentValues();
            contentValues.put("id", Integer.valueOf(i));
            contentValues.put("name", str2);
            contentValues.put("value", Long.valueOf(j));
            this.d.replace(str, null, contentValues);
        } catch (Exception e) {
        }
    }

    private void c() throws Throwable {
        Cursor cursor;
        Throwable th;
        Cursor cursor2 = null;
        this.d = getReadableDatabase();
        try {
            try {
                Cursor cursorRawQuery = this.d.rawQuery("select id, value from config order by id", null);
                if (cursorRawQuery != null) {
                    while (cursorRawQuery.moveToNext()) {
                        try {
                            switch (cursorRawQuery.getInt(0)) {
                                case 1:
                                    a = cursorRawQuery.getLong(1);
                                    break;
                                case 3:
                                    b = cursorRawQuery.getLong(1);
                                    break;
                            }
                        } catch (Throwable th2) {
                            cursor = cursorRawQuery;
                            th = th2;
                            if (cursor == null) {
                                throw th;
                            }
                            cursor.close();
                            throw th;
                        }
                    }
                }
                if (cursorRawQuery != null) {
                    cursorRawQuery.close();
                }
            } catch (Throwable th3) {
                cursor = null;
                th = th3;
            }
        } catch (Exception e) {
            if (0 != 0) {
                cursor2.close();
            }
        }
    }

    public Cursor a(String str) {
        return a(str, null, null, null, null, null, null);
    }

    public Cursor a(String str, String[] strArr, String str2, String[] strArr2, String str3, String str4, String str5) {
        this.d = getReadableDatabase();
        try {
            return this.d.query(str, strArr, str2, strArr2, str3, str4, str5);
        } catch (Exception e) {
            return null;
        }
    }

    public void a() {
        this.d = getWritableDatabase();
        a("config", 1, "lastUploadAppListTime", a);
    }

    public void a(String str, ContentValues contentValues) {
        this.d = getWritableDatabase();
        try {
            this.d.insert(str, null, contentValues);
        } catch (Exception e) {
        }
    }

    public void a(String str, String str2, String[] strArr) {
        this.d = getWritableDatabase();
        try {
            this.d.delete(str, str2, strArr);
        } catch (Exception e) {
        }
    }

    public void b() {
        this.d = getWritableDatabase();
        a("config", 3, "lastBindCIDTime", b);
    }

    @Override // android.database.sqlite.SQLiteOpenHelper
    public void onCreate(SQLiteDatabase sQLiteDatabase) {
        try {
            sQLiteDatabase.execSQL("create table if not exists config (id integer primary key,name text,value text)");
            sQLiteDatabase.execSQL("create table if not exists appinfo(download_id integer primary key, name text, pkgName text,  versionCode integer, versionName text, logo text, fullSize long, diffSize long, url text, updateType text, diffChecksum text, fullChecksum text)");
            sQLiteDatabase.execSQL("create table if not exists biinfo (id integer primary key, value text, bitype text)");
        } catch (Exception e) {
        }
    }

    @Override // android.database.sqlite.SQLiteOpenHelper
    public void onUpgrade(SQLiteDatabase sQLiteDatabase, int i, int i2) {
        try {
            sQLiteDatabase.execSQL("DROP TABLE IF EXISTS config");
            sQLiteDatabase.execSQL("DROP TABLE IF EXISTS appinfo");
            sQLiteDatabase.execSQL("DROP TABLE IF EXISTS biinfo");
        } catch (Exception e) {
            e.printStackTrace();
        }
        onCreate(sQLiteDatabase);
    }
}
