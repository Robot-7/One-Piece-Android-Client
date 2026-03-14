package com.tencent.wxop.stat;

import android.content.ContentValues;
import android.content.Context;
import android.database.Cursor;
import android.database.DatabaseUtils;
import android.database.sqlite.SQLiteDatabase;
import com.igexin.download.Downloads;
import com.tencent.stat.common.StatConstants;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

/* JADX INFO: loaded from: classes.dex */
public class u {
    private static com.tencent.wxop.stat.b.b bZ = com.tencent.wxop.stat.b.l.av();
    private static Context ca = null;
    private static u cb = null;
    private String ab;
    private ad bW;
    private ad bX;
    private com.tencent.wxop.stat.b.f be;
    private String bq;
    private ConcurrentHashMap<com.tencent.wxop.stat.a.d, String> cd;
    volatile int aI = 0;
    com.tencent.wxop.stat.b.c bY = null;
    private int cc = 0;
    private boolean ce = false;
    private HashMap<String, String> cf = new HashMap<>();

    private u(Context context) {
        this.bW = null;
        this.bX = null;
        this.be = null;
        this.ab = StatConstants.MTA_COOPERATION_TAG;
        this.bq = StatConstants.MTA_COOPERATION_TAG;
        this.cd = null;
        try {
            this.be = new com.tencent.wxop.stat.b.f();
            ca = context.getApplicationContext();
            this.cd = new ConcurrentHashMap<>();
            this.ab = com.tencent.wxop.stat.b.l.J(context);
            this.bq = "pri_" + com.tencent.wxop.stat.b.l.J(context);
            this.bW = new ad(ca, this.ab);
            this.bX = new ad(ca, this.bq);
            b(true);
            b(false);
            aj();
            t(ca);
            I();
            an();
        } catch (Throwable th) {
            bZ.b(th);
        }
    }

    /* JADX WARN: Removed duplicated region for block: B:18:0x005b  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    private void I() throws java.lang.Throwable {
        /*
            r9 = this;
            r8 = 0
            com.tencent.wxop.stat.ad r0 = r9.bW     // Catch: java.lang.Throwable -> L57 java.lang.Throwable -> L61
            android.database.sqlite.SQLiteDatabase r0 = r0.getReadableDatabase()     // Catch: java.lang.Throwable -> L57 java.lang.Throwable -> L61
            java.lang.String r1 = "config"
            r2 = 0
            r3 = 0
            r4 = 0
            r5 = 0
            r6 = 0
            r7 = 0
            android.database.Cursor r1 = r0.query(r1, r2, r3, r4, r5, r6, r7)     // Catch: java.lang.Throwable -> L57 java.lang.Throwable -> L61
        L13:
            boolean r0 = r1.moveToNext()     // Catch: java.lang.Throwable -> L45 java.lang.Throwable -> L5f
            if (r0 == 0) goto L51
            r0 = 0
            int r0 = r1.getInt(r0)     // Catch: java.lang.Throwable -> L45 java.lang.Throwable -> L5f
            r2 = 1
            java.lang.String r2 = r1.getString(r2)     // Catch: java.lang.Throwable -> L45 java.lang.Throwable -> L5f
            r3 = 2
            java.lang.String r3 = r1.getString(r3)     // Catch: java.lang.Throwable -> L45 java.lang.Throwable -> L5f
            r4 = 3
            int r4 = r1.getInt(r4)     // Catch: java.lang.Throwable -> L45 java.lang.Throwable -> L5f
            com.tencent.wxop.stat.ai r5 = new com.tencent.wxop.stat.ai     // Catch: java.lang.Throwable -> L45 java.lang.Throwable -> L5f
            r5.<init>(r0)     // Catch: java.lang.Throwable -> L45 java.lang.Throwable -> L5f
            r5.aI = r0     // Catch: java.lang.Throwable -> L45 java.lang.Throwable -> L5f
            org.json.JSONObject r0 = new org.json.JSONObject     // Catch: java.lang.Throwable -> L45 java.lang.Throwable -> L5f
            r0.<init>(r2)     // Catch: java.lang.Throwable -> L45 java.lang.Throwable -> L5f
            r5.df = r0     // Catch: java.lang.Throwable -> L45 java.lang.Throwable -> L5f
            r5.c = r3     // Catch: java.lang.Throwable -> L45 java.lang.Throwable -> L5f
            r5.L = r4     // Catch: java.lang.Throwable -> L45 java.lang.Throwable -> L5f
            android.content.Context r0 = com.tencent.wxop.stat.u.ca     // Catch: java.lang.Throwable -> L45 java.lang.Throwable -> L5f
            com.tencent.wxop.stat.c.a(r0, r5)     // Catch: java.lang.Throwable -> L45 java.lang.Throwable -> L5f
            goto L13
        L45:
            r0 = move-exception
        L46:
            com.tencent.wxop.stat.b.b r2 = com.tencent.wxop.stat.u.bZ     // Catch: java.lang.Throwable -> L5f
            r2.b(r0)     // Catch: java.lang.Throwable -> L5f
            if (r1 == 0) goto L50
            r1.close()
        L50:
            return
        L51:
            if (r1 == 0) goto L50
            r1.close()
            goto L50
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
            r1 = r8
            goto L46
        */
        throw new UnsupportedOperationException("Method not decompiled: com.tencent.wxop.stat.u.I():void");
    }

    private synchronized void a(int i, boolean z) {
        try {
            if (this.aI > 0 && i > 0 && !f.a()) {
                if (c.k()) {
                    bZ.b("Load " + this.aI + " unsent events");
                }
                ArrayList arrayList = new ArrayList(i);
                b(arrayList, i, z);
                if (arrayList.size() > 0) {
                    if (c.k()) {
                        bZ.b("Peek " + arrayList.size() + " unsent events.");
                    }
                    a(arrayList, 2, z);
                    al.aa(ca).b(arrayList, new ab(this, arrayList, z));
                }
            }
        } catch (Throwable th) {
            bZ.b(th);
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    /* JADX WARN: Removed duplicated region for block: B:24:0x009c A[Catch: all -> 0x00ed, TRY_ENTER, TryCatch #5 {, blocks: (B:4:0x0002, B:6:0x0008, B:53:0x0110, B:55:0x0114, B:57:0x011a, B:58:0x0164, B:60:0x0175, B:62:0x017a, B:64:0x0182, B:65:0x0185, B:20:0x0092, B:24:0x009c, B:26:0x00a8, B:28:0x00c2, B:52:0x00f7, B:32:0x00c8, B:38:0x00d9, B:41:0x00df, B:45:0x00e9, B:46:0x00ec, B:51:0x00f1, B:10:0x0010, B:12:0x0019, B:14:0x0021, B:15:0x003c, B:17:0x004b, B:18:0x005f, B:36:0x00d2), top: B:77:0x0002, inners: #1, #2, #3, #4 }] */
    /* JADX WARN: Removed duplicated region for block: B:52:0x00f7 A[Catch: all -> 0x00ed, TryCatch #5 {, blocks: (B:4:0x0002, B:6:0x0008, B:53:0x0110, B:55:0x0114, B:57:0x011a, B:58:0x0164, B:60:0x0175, B:62:0x017a, B:64:0x0182, B:65:0x0185, B:20:0x0092, B:24:0x009c, B:26:0x00a8, B:28:0x00c2, B:52:0x00f7, B:32:0x00c8, B:38:0x00d9, B:41:0x00df, B:45:0x00e9, B:46:0x00ec, B:51:0x00f1, B:10:0x0010, B:12:0x0019, B:14:0x0021, B:15:0x003c, B:17:0x004b, B:18:0x005f, B:36:0x00d2), top: B:77:0x0002, inners: #1, #2, #3, #4 }] */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public synchronized void a(com.tencent.wxop.stat.a.d r7, com.tencent.wxop.stat.ak r8, boolean r9, boolean r10) {
        /*
            Method dump skipped, instruction units count: 397
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: com.tencent.wxop.stat.u.a(com.tencent.wxop.stat.a.d, com.tencent.wxop.stat.ak, boolean, boolean):void");
    }

    /* JADX INFO: Access modifiers changed from: private */
    public synchronized void a(ai aiVar) {
        Cursor cursorQuery;
        boolean z;
        long jInsert;
        Cursor cursor = null;
        synchronized (this) {
            try {
            } catch (Throwable th) {
                th = th;
            }
            try {
                String string = aiVar.df.toString();
                String strT = com.tencent.wxop.stat.b.l.t(string);
                ContentValues contentValues = new ContentValues();
                contentValues.put("content", aiVar.df.toString());
                contentValues.put("md5sum", strT);
                aiVar.c = strT;
                contentValues.put("version", Integer.valueOf(aiVar.L));
                cursorQuery = this.bW.getReadableDatabase().query("config", null, null, null, null, null, null);
                while (true) {
                    try {
                        if (!cursorQuery.moveToNext()) {
                            z = false;
                            break;
                        } else if (cursorQuery.getInt(0) == aiVar.aI) {
                            z = true;
                            break;
                        }
                    } catch (Throwable th2) {
                        th = th2;
                        bZ.b(th);
                        if (cursorQuery != null) {
                            cursorQuery.close();
                        }
                        try {
                            this.bW.getWritableDatabase().endTransaction();
                        } catch (Exception e) {
                        }
                    }
                }
                this.bW.getWritableDatabase().beginTransaction();
                if (true == z) {
                    jInsert = this.bW.getWritableDatabase().update("config", contentValues, "type=?", new String[]{Integer.toString(aiVar.aI)});
                } else {
                    contentValues.put("type", Integer.valueOf(aiVar.aI));
                    jInsert = this.bW.getWritableDatabase().insert("config", null, contentValues);
                }
                if (jInsert == -1) {
                    bZ.d("Failed to store cfg:" + string);
                } else {
                    bZ.e("Sucessed to store cfg:" + string);
                }
                this.bW.getWritableDatabase().setTransactionSuccessful();
                if (cursorQuery != null) {
                    cursorQuery.close();
                }
                try {
                    this.bW.getWritableDatabase().endTransaction();
                } catch (Exception e2) {
                }
            } catch (Throwable th3) {
                th = th3;
                cursorQuery = null;
            }
        }
    }

    static /* synthetic */ void a(u uVar, int i, boolean z) {
        int iAk = i == -1 ? !z ? uVar.ak() : uVar.al() : i;
        if (iAk > 0) {
            int iU = c.u() * 60 * c.q();
            if (iAk > iU && iU > 0) {
                iAk = iU;
            }
            int iR = c.r();
            int i2 = iAk / iR;
            int i3 = iAk % iR;
            if (c.k()) {
                bZ.b("sentStoreEventsByDb sendNumbers=" + iAk + ",important=" + z + ",maxSendNumPerFor1Period=" + iU + ",maxCount=" + i2 + ",restNumbers=" + i3);
            }
            for (int i4 = 0; i4 < i2; i4++) {
                uVar.a(iR, z);
            }
            if (i3 > 0) {
                uVar.a(i3, z);
            }
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    /* JADX WARN: Removed duplicated region for block: B:63:0x00dd A[EXC_TOP_SPLITTER, SYNTHETIC] */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public synchronized void a(java.util.List<com.tencent.wxop.stat.ae> r7, int r8, boolean r9) {
        /*
            Method dump skipped, instruction units count: 236
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: com.tencent.wxop.stat.u.a(java.util.List, int, boolean):void");
    }

    /* JADX INFO: Access modifiers changed from: private */
    public synchronized void a(List<ae> list, boolean z) {
        SQLiteDatabase sQLiteDatabaseC = null;
        synchronized (this) {
            if (list.size() != 0) {
                if (c.k()) {
                    bZ.b("Delete " + list.size() + " events, important:" + z);
                }
                StringBuilder sb = new StringBuilder(list.size() * 3);
                sb.append("event_id in (");
                int size = list.size();
                Iterator<ae> it = list.iterator();
                int i = 0;
                while (it.hasNext()) {
                    sb.append(it.next().K);
                    if (i != size - 1) {
                        sb.append(",");
                    }
                    i++;
                }
                sb.append(")");
                try {
                    try {
                        sQLiteDatabaseC = c(z);
                        sQLiteDatabaseC.beginTransaction();
                        int iDelete = sQLiteDatabaseC.delete("events", sb.toString(), null);
                        if (c.k()) {
                            bZ.b("delete " + size + " event " + sb.toString() + ", success delete:" + iDelete);
                        }
                        this.aI -= iDelete;
                        sQLiteDatabaseC.setTransactionSuccessful();
                        aj();
                        if (sQLiteDatabaseC != null) {
                            try {
                                sQLiteDatabaseC.endTransaction();
                            } catch (Throwable th) {
                                bZ.b(th);
                            }
                        }
                    } catch (Throwable th2) {
                        bZ.b(th2);
                        if (sQLiteDatabaseC != null) {
                            try {
                                sQLiteDatabaseC.endTransaction();
                            } catch (Throwable th3) {
                                bZ.b(th3);
                            }
                        }
                    }
                } catch (Throwable th4) {
                    if (sQLiteDatabaseC != null) {
                        try {
                            sQLiteDatabaseC.endTransaction();
                        } catch (Throwable th5) {
                            bZ.b(th5);
                        }
                    }
                    throw th4;
                }
            }
        }
    }

    public static u ai() {
        return cb;
    }

    private void aj() {
        this.aI = ak() + al();
    }

    private int ak() {
        return (int) DatabaseUtils.queryNumEntries(this.bW.getReadableDatabase(), "events");
    }

    private int al() {
        return (int) DatabaseUtils.queryNumEntries(this.bX.getReadableDatabase(), "events");
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void am() {
        SQLiteDatabase writableDatabase = null;
        if (this.ce) {
            return;
        }
        synchronized (this.cd) {
            if (this.cd.size() == 0) {
                return;
            }
            this.ce = true;
            if (c.k()) {
                bZ.b("insert " + this.cd.size() + " events ,numEventsCachedInMemory:" + c.ay + ",numStoredEvents:" + this.aI);
            }
            try {
                try {
                    writableDatabase = this.bW.getWritableDatabase();
                    writableDatabase.beginTransaction();
                    Iterator<Map.Entry<com.tencent.wxop.stat.a.d, String>> it = this.cd.entrySet().iterator();
                    while (it.hasNext()) {
                        com.tencent.wxop.stat.a.d key = it.next().getKey();
                        ContentValues contentValues = new ContentValues();
                        String strAf = key.af();
                        if (c.k()) {
                            bZ.b("insert content:" + strAf);
                        }
                        contentValues.put("content", com.tencent.wxop.stat.b.r.q(strAf));
                        contentValues.put("send_count", "0");
                        contentValues.put(Downloads.COLUMN_STATUS, Integer.toString(1));
                        contentValues.put("timestamp", Long.valueOf(key.ad()));
                        writableDatabase.insert("events", null, contentValues);
                        it.remove();
                    }
                    writableDatabase.setTransactionSuccessful();
                    if (writableDatabase != null) {
                        try {
                            writableDatabase.endTransaction();
                            aj();
                        } catch (Throwable th) {
                            bZ.b(th);
                        }
                    }
                } catch (Throwable th2) {
                    if (writableDatabase != null) {
                        try {
                            writableDatabase.endTransaction();
                            aj();
                        } catch (Throwable th3) {
                            bZ.b(th3);
                        }
                    }
                    throw th2;
                }
            } catch (Throwable th4) {
                bZ.b(th4);
                if (writableDatabase != null) {
                    try {
                        writableDatabase.endTransaction();
                        aj();
                    } catch (Throwable th5) {
                        bZ.b(th5);
                    }
                }
            }
            this.ce = false;
            if (c.k()) {
                bZ.b("after insert, cacheEventsInMemory.size():" + this.cd.size() + ",numEventsCachedInMemory:" + c.ay + ",numStoredEvents:" + this.aI);
            }
        }
    }

    /* JADX WARN: Removed duplicated region for block: B:18:0x003f  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    private void an() throws java.lang.Throwable {
        /*
            r9 = this;
            r8 = 0
            com.tencent.wxop.stat.ad r0 = r9.bW     // Catch: java.lang.Throwable -> L3b java.lang.Throwable -> L45
            android.database.sqlite.SQLiteDatabase r0 = r0.getReadableDatabase()     // Catch: java.lang.Throwable -> L3b java.lang.Throwable -> L45
            java.lang.String r1 = "keyvalues"
            r2 = 0
            r3 = 0
            r4 = 0
            r5 = 0
            r6 = 0
            r7 = 0
            android.database.Cursor r1 = r0.query(r1, r2, r3, r4, r5, r6, r7)     // Catch: java.lang.Throwable -> L3b java.lang.Throwable -> L45
        L13:
            boolean r0 = r1.moveToNext()     // Catch: java.lang.Throwable -> L29 java.lang.Throwable -> L43
            if (r0 == 0) goto L35
            java.util.HashMap<java.lang.String, java.lang.String> r0 = r9.cf     // Catch: java.lang.Throwable -> L29 java.lang.Throwable -> L43
            r2 = 0
            java.lang.String r2 = r1.getString(r2)     // Catch: java.lang.Throwable -> L29 java.lang.Throwable -> L43
            r3 = 1
            java.lang.String r3 = r1.getString(r3)     // Catch: java.lang.Throwable -> L29 java.lang.Throwable -> L43
            r0.put(r2, r3)     // Catch: java.lang.Throwable -> L29 java.lang.Throwable -> L43
            goto L13
        L29:
            r0 = move-exception
        L2a:
            com.tencent.wxop.stat.b.b r2 = com.tencent.wxop.stat.u.bZ     // Catch: java.lang.Throwable -> L43
            r2.b(r0)     // Catch: java.lang.Throwable -> L43
            if (r1 == 0) goto L34
            r1.close()
        L34:
            return
        L35:
            if (r1 == 0) goto L34
            r1.close()
            goto L34
        L3b:
            r0 = move-exception
            r1 = r8
        L3d:
            if (r1 == 0) goto L42
            r1.close()
        L42:
            throw r0
        L43:
            r0 = move-exception
            goto L3d
        L45:
            r0 = move-exception
            r1 = r8
            goto L2a
        */
        throw new UnsupportedOperationException("Method not decompiled: com.tencent.wxop.stat.u.an():void");
    }

    private static String b(List<ae> list) {
        StringBuilder sb = new StringBuilder(list.size() * 3);
        sb.append("event_id in (");
        int i = 0;
        int size = list.size();
        Iterator<ae> it = list.iterator();
        while (true) {
            int i2 = i;
            if (!it.hasNext()) {
                sb.append(")");
                return sb.toString();
            }
            sb.append(it.next().K);
            if (i2 != size - 1) {
                sb.append(",");
            }
            i = i2 + 1;
        }
    }

    /* JADX WARN: Removed duplicated region for block: B:29:0x00a1  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    private void b(java.util.List<com.tencent.wxop.stat.ae> r11, int r12, boolean r13) throws java.lang.Throwable {
        /*
            r10 = this;
            r9 = 0
            if (r13 != 0) goto L8f
            com.tencent.wxop.stat.ad r0 = r10.bW     // Catch: java.lang.Throwable -> L9d java.lang.Throwable -> Laa
            android.database.sqlite.SQLiteDatabase r0 = r0.getReadableDatabase()     // Catch: java.lang.Throwable -> L9d java.lang.Throwable -> Laa
        L9:
            java.lang.String r1 = "events"
            r2 = 0
            java.lang.String r3 = "status=?"
            r4 = 1
            java.lang.String[] r4 = new java.lang.String[r4]     // Catch: java.lang.Throwable -> L9d java.lang.Throwable -> Laa
            r5 = 0
            r6 = 1
            java.lang.String r6 = java.lang.Integer.toString(r6)     // Catch: java.lang.Throwable -> L9d java.lang.Throwable -> Laa
            r4[r5] = r6     // Catch: java.lang.Throwable -> L9d java.lang.Throwable -> Laa
            r5 = 0
            r6 = 0
            r7 = 0
            java.lang.String r8 = java.lang.Integer.toString(r12)     // Catch: java.lang.Throwable -> L9d java.lang.Throwable -> Laa
            android.database.Cursor r6 = r0.query(r1, r2, r3, r4, r5, r6, r7, r8)     // Catch: java.lang.Throwable -> L9d java.lang.Throwable -> Laa
        L24:
            boolean r0 = r6.moveToNext()     // Catch: java.lang.Throwable -> L82 java.lang.Throwable -> La5
            if (r0 == 0) goto L97
            r0 = 0
            long r1 = r6.getLong(r0)     // Catch: java.lang.Throwable -> L82 java.lang.Throwable -> La5
            r0 = 1
            java.lang.String r3 = r6.getString(r0)     // Catch: java.lang.Throwable -> L82 java.lang.Throwable -> La5
            boolean r0 = com.tencent.wxop.stat.c.ad     // Catch: java.lang.Throwable -> L82 java.lang.Throwable -> La5
            if (r0 != 0) goto L3c
            java.lang.String r3 = com.tencent.wxop.stat.b.r.t(r3)     // Catch: java.lang.Throwable -> L82 java.lang.Throwable -> La5
        L3c:
            r0 = 2
            int r4 = r6.getInt(r0)     // Catch: java.lang.Throwable -> L82 java.lang.Throwable -> La5
            r0 = 3
            int r5 = r6.getInt(r0)     // Catch: java.lang.Throwable -> L82 java.lang.Throwable -> La5
            com.tencent.wxop.stat.ae r0 = new com.tencent.wxop.stat.ae     // Catch: java.lang.Throwable -> L82 java.lang.Throwable -> La5
            r0.<init>(r1, r3, r4, r5)     // Catch: java.lang.Throwable -> L82 java.lang.Throwable -> La5
            boolean r3 = com.tencent.wxop.stat.c.k()     // Catch: java.lang.Throwable -> L82 java.lang.Throwable -> La5
            if (r3 == 0) goto L7e
            com.tencent.wxop.stat.b.b r3 = com.tencent.wxop.stat.u.bZ     // Catch: java.lang.Throwable -> L82 java.lang.Throwable -> La5
            java.lang.StringBuilder r4 = new java.lang.StringBuilder     // Catch: java.lang.Throwable -> L82 java.lang.Throwable -> La5
            java.lang.String r7 = "peek event, id="
            r4.<init>(r7)     // Catch: java.lang.Throwable -> L82 java.lang.Throwable -> La5
            java.lang.StringBuilder r1 = r4.append(r1)     // Catch: java.lang.Throwable -> L82 java.lang.Throwable -> La5
            java.lang.String r2 = ",send_count="
            java.lang.StringBuilder r1 = r1.append(r2)     // Catch: java.lang.Throwable -> L82 java.lang.Throwable -> La5
            java.lang.StringBuilder r1 = r1.append(r5)     // Catch: java.lang.Throwable -> L82 java.lang.Throwable -> La5
            java.lang.String r2 = ",timestamp="
            java.lang.StringBuilder r1 = r1.append(r2)     // Catch: java.lang.Throwable -> L82 java.lang.Throwable -> La5
            r2 = 4
            long r4 = r6.getLong(r2)     // Catch: java.lang.Throwable -> L82 java.lang.Throwable -> La5
            java.lang.StringBuilder r1 = r1.append(r4)     // Catch: java.lang.Throwable -> L82 java.lang.Throwable -> La5
            java.lang.String r1 = r1.toString()     // Catch: java.lang.Throwable -> L82 java.lang.Throwable -> La5
            r3.b(r1)     // Catch: java.lang.Throwable -> L82 java.lang.Throwable -> La5
        L7e:
            r11.add(r0)     // Catch: java.lang.Throwable -> L82 java.lang.Throwable -> La5
            goto L24
        L82:
            r0 = move-exception
            r1 = r6
        L84:
            com.tencent.wxop.stat.b.b r2 = com.tencent.wxop.stat.u.bZ     // Catch: java.lang.Throwable -> La7
            r2.b(r0)     // Catch: java.lang.Throwable -> La7
            if (r1 == 0) goto L8e
            r1.close()
        L8e:
            return
        L8f:
            com.tencent.wxop.stat.ad r0 = r10.bX     // Catch: java.lang.Throwable -> L9d java.lang.Throwable -> Laa
            android.database.sqlite.SQLiteDatabase r0 = r0.getReadableDatabase()     // Catch: java.lang.Throwable -> L9d java.lang.Throwable -> Laa
            goto L9
        L97:
            if (r6 == 0) goto L8e
            r6.close()
            goto L8e
        L9d:
            r0 = move-exception
            r6 = r9
        L9f:
            if (r6 == 0) goto La4
            r6.close()
        La4:
            throw r0
        La5:
            r0 = move-exception
            goto L9f
        La7:
            r0 = move-exception
            r6 = r1
            goto L9f
        Laa:
            r0 = move-exception
            r1 = r9
            goto L84
        */
        throw new UnsupportedOperationException("Method not decompiled: com.tencent.wxop.stat.u.b(java.util.List, int, boolean):void");
    }

    private void b(boolean z) {
        SQLiteDatabase sQLiteDatabaseC = null;
        try {
            try {
                sQLiteDatabaseC = c(z);
                sQLiteDatabaseC.beginTransaction();
                ContentValues contentValues = new ContentValues();
                contentValues.put(Downloads.COLUMN_STATUS, (Integer) 1);
                int iUpdate = sQLiteDatabaseC.update("events", contentValues, "status=?", new String[]{Long.toString(2L)});
                if (c.k()) {
                    bZ.b("update " + iUpdate + " unsent events.");
                }
                sQLiteDatabaseC.setTransactionSuccessful();
                if (sQLiteDatabaseC != null) {
                    try {
                        sQLiteDatabaseC.endTransaction();
                    } catch (Throwable th) {
                        bZ.b(th);
                    }
                }
            } catch (Throwable th2) {
                bZ.b(th2);
                if (sQLiteDatabaseC != null) {
                    try {
                        sQLiteDatabaseC.endTransaction();
                    } catch (Throwable th3) {
                        bZ.b(th3);
                    }
                }
            }
        } catch (Throwable th4) {
            if (sQLiteDatabaseC != null) {
                try {
                    sQLiteDatabaseC.endTransaction();
                } catch (Throwable th5) {
                    bZ.b(th5);
                }
            }
            throw th4;
        }
    }

    private SQLiteDatabase c(boolean z) {
        return !z ? this.bW.getWritableDatabase() : this.bX.getWritableDatabase();
    }

    public static u s(Context context) {
        if (cb == null) {
            synchronized (u.class) {
                if (cb == null) {
                    cb = new u(context);
                }
            }
        }
        return cb;
    }

    final void H() {
        if (c.l()) {
            try {
                this.be.a(new x(this));
            } catch (Throwable th) {
                bZ.b(th);
            }
        }
    }

    final void b(int i) {
        this.be.a(new ac(this, i));
    }

    final void b(com.tencent.wxop.stat.a.d dVar, ak akVar, boolean z, boolean z2) {
        if (this.be != null) {
            this.be.a(new y(this, dVar, akVar, z, z2));
        }
    }

    final void b(ai aiVar) {
        if (aiVar == null) {
            return;
        }
        this.be.a(new z(this, aiVar));
    }

    final void b(List<ae> list, boolean z) {
        if (this.be != null) {
            this.be.a(new v(this, list, z));
        }
    }

    final void c(List<ae> list, boolean z) {
        if (this.be != null) {
            this.be.a(new w(this, list, z));
        }
    }

    public final int r() {
        return this.aI;
    }

    /* JADX WARN: Removed duplicated region for block: B:111:0x0219 A[EXC_TOP_SPLITTER, SYNTHETIC] */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final synchronized com.tencent.wxop.stat.b.c t(android.content.Context r18) {
        /*
            Method dump skipped, instruction units count: 586
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: com.tencent.wxop.stat.u.t(android.content.Context):com.tencent.wxop.stat.b.c");
    }
}
