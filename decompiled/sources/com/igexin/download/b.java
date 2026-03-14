package com.igexin.download;

import android.content.Context;
import android.database.sqlite.SQLiteDatabase;
import android.database.sqlite.SQLiteOpenHelper;

/* JADX INFO: loaded from: classes.dex */
final class b extends SQLiteOpenHelper {
    final /* synthetic */ DownloadProvider a;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public b(DownloadProvider downloadProvider, Context context) {
        super(context, DownloadProvider.a, (SQLiteDatabase.CursorFactory) null, 101);
        this.a = downloadProvider;
    }

    @Override // android.database.sqlite.SQLiteOpenHelper
    public void onCreate(SQLiteDatabase sQLiteDatabase) {
        this.a.a(sQLiteDatabase);
    }

    @Override // android.database.sqlite.SQLiteOpenHelper
    public void onUpgrade(SQLiteDatabase sQLiteDatabase, int i, int i2) {
        if (i == 31 && i2 == 100) {
            return;
        }
        this.a.b(sQLiteDatabase);
        this.a.a(sQLiteDatabase);
    }
}
