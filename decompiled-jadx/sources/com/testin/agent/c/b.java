package com.testin.agent.c;

import android.content.Context;
import android.database.SQLException;
import android.database.sqlite.SQLiteDatabase;
import android.database.sqlite.SQLiteOpenHelper;
import com.testin.agent.b.e;

/* JADX INFO: loaded from: classes.dex */
public class b extends SQLiteOpenHelper {
    public b(Context context, String str, SQLiteDatabase.CursorFactory cursorFactory, int i) {
        super(context, str, cursorFactory, i);
    }

    @Override // android.database.sqlite.SQLiteOpenHelper
    public void onCreate(SQLiteDatabase sQLiteDatabase) {
        try {
            sQLiteDatabase.execSQL("CREATE TABLE IF NOT EXISTS crashtable (_id integer primary key autoincrement, type varchar(4), time varchar(64), tag varchar(32), dei text, pro varchar(32), mach text, oti text, msg text, nwt varchar(64), act varchar(64), et text, log text, csc text, cpun varchar(32), file_path varchar(128), crashed_num integer, max_upload_num integer);");
        } catch (SQLException e) {
            e.a(e);
        }
    }

    @Override // android.database.sqlite.SQLiteOpenHelper
    public void onUpgrade(SQLiteDatabase sQLiteDatabase, int i, int i2) {
        try {
            sQLiteDatabase.execSQL("DROP TABLE IF EXISTS crashtable");
            onCreate(sQLiteDatabase);
        } catch (SQLException e) {
            e.a(e);
        }
    }
}
