package com.igexin.push.b;

import android.content.ContentValues;
import android.content.Context;
import android.database.Cursor;
import android.database.sqlite.SQLiteDatabase;
import android.database.sqlite.SQLiteOpenHelper;
import org.codehaus.jackson.util.MinimalPrettyPrinter;

/* JADX INFO: loaded from: classes.dex */
public class b extends SQLiteOpenHelper {
    SQLiteDatabase a;

    public b(Context context) {
        super(context, "pushsdk.db", (SQLiteDatabase.CursorFactory) null, 2);
        this.a = null;
    }

    private String a(String[] strArr, String[] strArr2, int i) {
        StringBuffer stringBuffer = new StringBuffer(MinimalPrettyPrinter.DEFAULT_ROOT_VALUE_SEPARATOR);
        if (strArr.length == 1) {
            for (int i2 = 0; i2 < i; i2++) {
                stringBuffer.append(strArr[0] + " = '" + strArr2[i2] + "'");
                if (i2 < i - 1) {
                    stringBuffer.append(" or ");
                }
            }
        } else {
            for (int i3 = 0; i3 < i; i3++) {
                stringBuffer.append(strArr[i3] + " = '" + strArr2[i3] + "'");
                if (i3 < i - 1) {
                    stringBuffer.append(" and ");
                }
            }
        }
        return stringBuffer.toString();
    }

    public Cursor a(String str, String[] strArr, String[] strArr2, String[] strArr3, String str2) {
        Cursor cursorQuery;
        this.a = getReadableDatabase();
        this.a.beginTransaction();
        try {
            try {
                cursorQuery = strArr == null ? this.a.query(str, strArr3, null, null, null, null, str2) : strArr.length == 1 ? strArr2.length == 1 ? this.a.query(str, strArr3, strArr[0] + "= ?", strArr2, null, null, str2) : this.a.query(str, strArr3, a(strArr, strArr2, strArr2.length), null, null, null, str2) : this.a.query(str, strArr3, a(strArr, strArr2, strArr.length), null, null, null, str2);
            } finally {
                this.a.endTransaction();
            }
        } catch (Exception e) {
            cursorQuery = null;
        }
        try {
            this.a.setTransactionSuccessful();
        } catch (Exception e2) {
        }
        return cursorQuery;
    }

    public void a(String str, ContentValues contentValues) {
        this.a = getWritableDatabase();
        this.a.beginTransaction();
        try {
            this.a.insert(str, null, contentValues);
            this.a.setTransactionSuccessful();
        } catch (Exception e) {
        } finally {
            this.a.endTransaction();
        }
    }

    public void a(String str, ContentValues contentValues, String[] strArr, String[] strArr2) {
        this.a = getWritableDatabase();
        this.a.beginTransaction();
        try {
            if (strArr == null) {
                this.a.update(str, contentValues, null, null);
            } else if (strArr.length != 1) {
                this.a.update(str, contentValues, a(strArr, strArr2, strArr.length), null);
            } else if (strArr2.length == 1) {
                this.a.update(str, contentValues, strArr[0] + "='" + strArr2[0] + "'", null);
            } else {
                this.a.update(str, contentValues, a(strArr, strArr2, strArr2.length), null);
            }
            this.a.setTransactionSuccessful();
        } catch (Exception e) {
        } finally {
            this.a.endTransaction();
        }
    }

    public void a(String str, String str2) {
        this.a = getWritableDatabase();
        this.a.delete(str, str2, null);
    }

    @Override // android.database.sqlite.SQLiteOpenHelper
    public void onCreate(SQLiteDatabase sQLiteDatabase) {
        sQLiteDatabase.beginTransaction();
        try {
            sQLiteDatabase.execSQL("create table if not exists config (id integer primary key,value text)");
            sQLiteDatabase.execSQL("create table if not exists runtime (id integer primary key,value text)");
            sQLiteDatabase.execSQL("create table if not exists message (id integer primary key autoincrement,messageid text,taskid text,appid text,info text,msgextra blob,key text,status integer,createtime integer)");
            sQLiteDatabase.execSQL("create table if not exists ral (id integer primary key,data text,type integer,time integer)");
            sQLiteDatabase.execSQL("create table if not exists ca (pkgname text primary key,signature text,permissions text, accesstoken blob, expire integer)");
            sQLiteDatabase.execSQL("create table if not exists bi(id integer primary key autoincrement, start_service_count integer, login_count integer, loginerror_nonetwork_count integer, loginerror_timeout_count integer, loginerror_connecterror_count integer, loginerror_other_count integer, online_time long, network_time long, running_time long, create_time text, type integer)");
            sQLiteDatabase.setTransactionSuccessful();
        } catch (Exception e) {
        } finally {
            sQLiteDatabase.endTransaction();
        }
    }

    @Override // android.database.sqlite.SQLiteOpenHelper
    public void onUpgrade(SQLiteDatabase sQLiteDatabase, int i, int i2) {
        try {
            sQLiteDatabase.execSQL("drop table if exists config");
        } catch (Exception e) {
        }
        try {
            sQLiteDatabase.execSQL("drop table if exists runtime");
        } catch (Exception e2) {
        }
        try {
            sQLiteDatabase.execSQL("drop table if exists message");
        } catch (Exception e3) {
        }
        try {
            sQLiteDatabase.execSQL("drop table if exists ral");
        } catch (Exception e4) {
        }
        try {
            sQLiteDatabase.execSQL("drop table if exists ca");
        } catch (Exception e5) {
        }
        try {
            sQLiteDatabase.execSQL("drop table if exists bi");
        } catch (Exception e6) {
        }
        onCreate(sQLiteDatabase);
    }
}
