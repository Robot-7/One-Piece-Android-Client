package com.testin.agent.c;

import android.content.ContentValues;
import android.content.Context;
import android.database.Cursor;
import android.database.sqlite.SQLiteDatabase;
import com.testin.agent.b.e;
import java.util.ArrayList;

/* JADX INFO: loaded from: classes.dex */
public class c {
    private b a = null;
    private Context b;

    public c(Context context) {
        this.b = context;
        a();
    }

    /* JADX WARN: Removed duplicated region for block: B:21:0x0037  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public int a(java.lang.String r11) throws java.lang.Throwable {
        /*
            r10 = this;
            r1 = 0
            r8 = 0
            com.testin.agent.c.b r0 = r10.a     // Catch: java.lang.Exception -> L27 java.lang.Throwable -> L34
            android.database.sqlite.SQLiteDatabase r0 = r0.getReadableDatabase()     // Catch: java.lang.Exception -> L27 java.lang.Throwable -> L34
            r2 = 0
            r3 = 0
            r4 = 0
            r5 = 0
            r6 = 0
            r7 = 0
            r1 = r11
            android.database.Cursor r1 = r0.query(r1, r2, r3, r4, r5, r6, r7)     // Catch: java.lang.Throwable -> L3b java.lang.Exception -> L43
            if (r1 == 0) goto L4c
            r1.moveToFirst()     // Catch: java.lang.Throwable -> L3b java.lang.Exception -> L43
            int r2 = r1.getCount()     // Catch: java.lang.Throwable -> L3b java.lang.Exception -> L43
            r1.close()     // Catch: java.lang.Throwable -> L3b java.lang.Exception -> L47
            r1 = r2
        L20:
            if (r0 == 0) goto L25
            r0.close()
        L25:
            r0 = r1
        L26:
            return r0
        L27:
            r0 = move-exception
            r2 = r1
            r1 = r0
            r0 = r8
        L2b:
            com.testin.agent.b.e.a(r1)     // Catch: java.lang.Throwable -> L40
            if (r2 == 0) goto L26
            r2.close()
            goto L26
        L34:
            r0 = move-exception
        L35:
            if (r1 == 0) goto L3a
            r1.close()
        L3a:
            throw r0
        L3b:
            r1 = move-exception
            r9 = r1
            r1 = r0
            r0 = r9
            goto L35
        L40:
            r0 = move-exception
            r1 = r2
            goto L35
        L43:
            r1 = move-exception
            r2 = r0
            r0 = r8
            goto L2b
        L47:
            r1 = move-exception
            r9 = r0
            r0 = r2
            r2 = r9
            goto L2b
        L4c:
            r1 = r8
            goto L20
        */
        throw new UnsupportedOperationException("Method not decompiled: com.testin.agent.c.c.a(java.lang.String):int");
    }

    /* JADX WARN: Removed duplicated region for block: B:21:0x0134  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public com.testin.agent.c.a a(java.lang.String r11, int r12) throws java.lang.Throwable {
        /*
            Method dump skipped, instruction units count: 330
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: com.testin.agent.c.c.a(java.lang.String, int):com.testin.agent.c.a");
    }

    public void a() {
        if (this.a == null) {
            this.a = new b(this.b, "crashannals.db", null, 11);
        }
    }

    public boolean a(String str, int i, ContentValues contentValues) {
        SQLiteDatabase writableDatabase = null;
        try {
            try {
                String[] strArr = {new StringBuilder().append(i).toString()};
                writableDatabase = this.a.getWritableDatabase();
                z = writableDatabase.update(str, contentValues, "_id=?", strArr) > 0;
                if (writableDatabase != null) {
                    writableDatabase.close();
                }
            } catch (Exception e) {
                e.a(e);
                if (writableDatabase != null) {
                    writableDatabase.close();
                }
            }
            return z;
        } catch (Throwable th) {
            if (writableDatabase != null) {
                writableDatabase.close();
            }
            throw th;
        }
    }

    /* JADX WARN: Removed duplicated region for block: B:34:0x0128  */
    /* JADX WARN: Removed duplicated region for block: B:36:0x012d  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public boolean a(java.lang.String r10, com.testin.agent.c.a r11) throws java.lang.Throwable {
        /*
            Method dump skipped, instruction units count: 326
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: com.testin.agent.c.c.a(java.lang.String, com.testin.agent.c.a):boolean");
    }

    public ArrayList b(String str) throws Throwable {
        String[] strArr;
        SQLiteDatabase readableDatabase;
        SQLiteDatabase sQLiteDatabase = null;
        ArrayList arrayList = new ArrayList();
        try {
            try {
                strArr = new String[]{"_id"};
                readableDatabase = this.a.getReadableDatabase();
            } catch (Exception e) {
                e = e;
            }
        } catch (Throwable th) {
            th = th;
        }
        try {
            Cursor cursorQuery = readableDatabase.query(str, strArr, null, null, null, null, "_id asc");
            if (cursorQuery != null) {
                while (cursorQuery.moveToNext()) {
                    arrayList.add(Integer.valueOf(cursorQuery.getInt(0)));
                }
                cursorQuery.close();
            }
            if (readableDatabase != null) {
                readableDatabase.close();
            }
        } catch (Exception e2) {
            sQLiteDatabase = readableDatabase;
            e = e2;
            e.a(e);
            if (sQLiteDatabase != null) {
                sQLiteDatabase.close();
            }
        } catch (Throwable th2) {
            sQLiteDatabase = readableDatabase;
            th = th2;
            if (sQLiteDatabase != null) {
                sQLiteDatabase.close();
            }
            throw th;
        }
        return arrayList;
    }

    public boolean b(String str, int i) {
        SQLiteDatabase writableDatabase = null;
        try {
            try {
                String[] strArr = {new StringBuilder().append(i).toString()};
                writableDatabase = this.a.getWritableDatabase();
                z = writableDatabase.delete(str, "_id=?", strArr) != 0;
                if (writableDatabase != null) {
                    writableDatabase.close();
                }
            } catch (Exception e) {
                e.a(e);
                if (writableDatabase != null) {
                    writableDatabase.close();
                }
            }
            return z;
        } catch (Throwable th) {
            if (writableDatabase != null) {
                writableDatabase.close();
            }
            throw th;
        }
    }
}
