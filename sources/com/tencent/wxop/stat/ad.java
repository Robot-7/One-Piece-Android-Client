package com.tencent.wxop.stat;

import android.content.Context;
import android.database.sqlite.SQLiteDatabase;
import android.database.sqlite.SQLiteOpenHelper;
import com.tencent.stat.common.StatConstants;

/* JADX INFO: loaded from: classes.dex */
final class ad extends SQLiteOpenHelper {
    private String a;
    private Context co;

    public ad(Context context, String str) {
        super(context, str, (SQLiteDatabase.CursorFactory) null, 3);
        this.a = StatConstants.MTA_COOPERATION_TAG;
        this.co = null;
        this.a = str;
        this.co = context.getApplicationContext();
        if (c.k()) {
            u.bZ.b("SQLiteOpenHelper " + this.a);
        }
    }

    /* JADX WARN: Removed duplicated region for block: B:20:0x005b  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    private static void a(android.database.sqlite.SQLiteDatabase r9) throws java.lang.Throwable {
        /*
            r8 = 0
            java.lang.String r1 = "user"
            r2 = 0
            r3 = 0
            r4 = 0
            r5 = 0
            r6 = 0
            r7 = 0
            r0 = r9
            android.database.Cursor r1 = r0.query(r1, r2, r3, r4, r5, r6, r7)     // Catch: java.lang.Throwable -> L48 java.lang.Throwable -> L57
            android.content.ContentValues r0 = new android.content.ContentValues     // Catch: java.lang.Throwable -> L5f java.lang.Throwable -> L61
            r0.<init>()     // Catch: java.lang.Throwable -> L5f java.lang.Throwable -> L61
            boolean r2 = r1.moveToNext()     // Catch: java.lang.Throwable -> L5f java.lang.Throwable -> L61
            if (r2 == 0) goto L33
            r2 = 0
            java.lang.String r8 = r1.getString(r2)     // Catch: java.lang.Throwable -> L5f java.lang.Throwable -> L61
            r2 = 1
            r1.getInt(r2)     // Catch: java.lang.Throwable -> L5f java.lang.Throwable -> L61
            r2 = 2
            r1.getString(r2)     // Catch: java.lang.Throwable -> L5f java.lang.Throwable -> L61
            r2 = 3
            r1.getLong(r2)     // Catch: java.lang.Throwable -> L5f java.lang.Throwable -> L61
            java.lang.String r2 = com.tencent.wxop.stat.b.r.q(r8)     // Catch: java.lang.Throwable -> L5f java.lang.Throwable -> L61
            java.lang.String r3 = "uid"
            r0.put(r3, r2)     // Catch: java.lang.Throwable -> L5f java.lang.Throwable -> L61
        L33:
            if (r8 == 0) goto L42
            java.lang.String r2 = "user"
            java.lang.String r3 = "uid=?"
            r4 = 1
            java.lang.String[] r4 = new java.lang.String[r4]     // Catch: java.lang.Throwable -> L5f java.lang.Throwable -> L61
            r5 = 0
            r4[r5] = r8     // Catch: java.lang.Throwable -> L5f java.lang.Throwable -> L61
            r9.update(r2, r0, r3, r4)     // Catch: java.lang.Throwable -> L5f java.lang.Throwable -> L61
        L42:
            if (r1 == 0) goto L47
            r1.close()
        L47:
            return
        L48:
            r0 = move-exception
            r1 = r8
        L4a:
            com.tencent.wxop.stat.b.b r2 = com.tencent.wxop.stat.u.ao()     // Catch: java.lang.Throwable -> L5f
            r2.b(r0)     // Catch: java.lang.Throwable -> L5f
            if (r1 == 0) goto L47
            r1.close()
            goto L47
        L57:
            r0 = move-exception
            r1 = r8
        L59:
            if (r1 == 0) goto L5e
            r1.close()
        L5e:
            throw r0
        L5f:
            r0 = move-exception
            goto L59
        L61:
            r0 = move-exception
            goto L4a
        */
        throw new UnsupportedOperationException("Method not decompiled: com.tencent.wxop.stat.ad.a(android.database.sqlite.SQLiteDatabase):void");
    }

    /* JADX WARN: Removed duplicated region for block: B:22:0x007c  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    private static void b(android.database.sqlite.SQLiteDatabase r10) throws java.lang.Throwable {
        /*
            r8 = 0
            java.lang.String r1 = "events"
            r2 = 0
            r3 = 0
            r4 = 0
            r5 = 0
            r6 = 0
            r7 = 0
            r0 = r10
            android.database.Cursor r6 = r0.query(r1, r2, r3, r4, r5, r6, r7)     // Catch: java.lang.Throwable -> L86 java.lang.Throwable -> L8c
            java.util.ArrayList r7 = new java.util.ArrayList     // Catch: java.lang.Throwable -> L36 java.lang.Throwable -> L79
            r7.<init>()     // Catch: java.lang.Throwable -> L36 java.lang.Throwable -> L79
        L13:
            boolean r0 = r6.moveToNext()     // Catch: java.lang.Throwable -> L36 java.lang.Throwable -> L79
            if (r0 == 0) goto L45
            r0 = 0
            long r1 = r6.getLong(r0)     // Catch: java.lang.Throwable -> L36 java.lang.Throwable -> L79
            r0 = 1
            java.lang.String r3 = r6.getString(r0)     // Catch: java.lang.Throwable -> L36 java.lang.Throwable -> L79
            r0 = 2
            int r4 = r6.getInt(r0)     // Catch: java.lang.Throwable -> L36 java.lang.Throwable -> L79
            r0 = 3
            int r5 = r6.getInt(r0)     // Catch: java.lang.Throwable -> L36 java.lang.Throwable -> L79
            com.tencent.wxop.stat.ae r0 = new com.tencent.wxop.stat.ae     // Catch: java.lang.Throwable -> L36 java.lang.Throwable -> L79
            r0.<init>(r1, r3, r4, r5)     // Catch: java.lang.Throwable -> L36 java.lang.Throwable -> L79
            r7.add(r0)     // Catch: java.lang.Throwable -> L36 java.lang.Throwable -> L79
            goto L13
        L36:
            r0 = move-exception
            r1 = r6
        L38:
            com.tencent.wxop.stat.b.b r2 = com.tencent.wxop.stat.u.ao()     // Catch: java.lang.Throwable -> L89
            r2.b(r0)     // Catch: java.lang.Throwable -> L89
            if (r1 == 0) goto L44
            r1.close()
        L44:
            return
        L45:
            android.content.ContentValues r1 = new android.content.ContentValues     // Catch: java.lang.Throwable -> L36 java.lang.Throwable -> L79
            r1.<init>()     // Catch: java.lang.Throwable -> L36 java.lang.Throwable -> L79
            java.util.Iterator r2 = r7.iterator()     // Catch: java.lang.Throwable -> L36 java.lang.Throwable -> L79
        L4e:
            boolean r0 = r2.hasNext()     // Catch: java.lang.Throwable -> L36 java.lang.Throwable -> L79
            if (r0 == 0) goto L80
            java.lang.Object r0 = r2.next()     // Catch: java.lang.Throwable -> L36 java.lang.Throwable -> L79
            com.tencent.wxop.stat.ae r0 = (com.tencent.wxop.stat.ae) r0     // Catch: java.lang.Throwable -> L36 java.lang.Throwable -> L79
            java.lang.String r3 = "content"
            java.lang.String r4 = r0.b     // Catch: java.lang.Throwable -> L36 java.lang.Throwable -> L79
            java.lang.String r4 = com.tencent.wxop.stat.b.r.q(r4)     // Catch: java.lang.Throwable -> L36 java.lang.Throwable -> L79
            r1.put(r3, r4)     // Catch: java.lang.Throwable -> L36 java.lang.Throwable -> L79
            java.lang.String r3 = "events"
            java.lang.String r4 = "event_id=?"
            r5 = 1
            java.lang.String[] r5 = new java.lang.String[r5]     // Catch: java.lang.Throwable -> L36 java.lang.Throwable -> L79
            r7 = 0
            long r8 = r0.K     // Catch: java.lang.Throwable -> L36 java.lang.Throwable -> L79
            java.lang.String r0 = java.lang.Long.toString(r8)     // Catch: java.lang.Throwable -> L36 java.lang.Throwable -> L79
            r5[r7] = r0     // Catch: java.lang.Throwable -> L36 java.lang.Throwable -> L79
            r10.update(r3, r1, r4, r5)     // Catch: java.lang.Throwable -> L36 java.lang.Throwable -> L79
            goto L4e
        L79:
            r0 = move-exception
        L7a:
            if (r6 == 0) goto L7f
            r6.close()
        L7f:
            throw r0
        L80:
            if (r6 == 0) goto L44
            r6.close()
            goto L44
        L86:
            r0 = move-exception
            r6 = r8
            goto L7a
        L89:
            r0 = move-exception
            r6 = r1
            goto L7a
        L8c:
            r0 = move-exception
            r1 = r8
            goto L38
        */
        throw new UnsupportedOperationException("Method not decompiled: com.tencent.wxop.stat.ad.b(android.database.sqlite.SQLiteDatabase):void");
    }

    @Override // android.database.sqlite.SQLiteOpenHelper, java.lang.AutoCloseable
    public final synchronized void close() {
        super.close();
    }

    @Override // android.database.sqlite.SQLiteOpenHelper
    public final void onCreate(SQLiteDatabase sQLiteDatabase) {
        sQLiteDatabase.execSQL("create table if not exists events(event_id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, content TEXT, status INTEGER, send_count INTEGER, timestamp LONG)");
        sQLiteDatabase.execSQL("create table if not exists user(uid TEXT PRIMARY KEY, user_type INTEGER, app_ver TEXT, ts INTEGER)");
        sQLiteDatabase.execSQL("create table if not exists config(type INTEGER PRIMARY KEY NOT NULL, content TEXT, md5sum TEXT, version INTEGER)");
        sQLiteDatabase.execSQL("create table if not exists keyvalues(key TEXT PRIMARY KEY NOT NULL, value TEXT)");
        sQLiteDatabase.execSQL("CREATE INDEX if not exists status_idx ON events(status)");
    }

    @Override // android.database.sqlite.SQLiteOpenHelper
    public final void onUpgrade(SQLiteDatabase sQLiteDatabase, int i, int i2) throws Throwable {
        u.bZ.debug("upgrade DB from oldVersion " + i + " to newVersion " + i2);
        if (i == 1) {
            sQLiteDatabase.execSQL("create table if not exists keyvalues(key TEXT PRIMARY KEY NOT NULL, value TEXT)");
            a(sQLiteDatabase);
            b(sQLiteDatabase);
        }
        if (i == 2) {
            a(sQLiteDatabase);
            b(sQLiteDatabase);
        }
    }
}
