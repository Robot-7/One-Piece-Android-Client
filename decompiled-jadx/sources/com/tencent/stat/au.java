package com.tencent.stat;

import android.content.ContentValues;
import android.content.Context;
import android.database.DatabaseUtils;
import android.database.sqlite.SQLiteDatabase;
import com.igexin.download.Downloads;
import com.tencent.stat.common.StatConstants;
import com.tencent.stat.common.StatLogger;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

/* JADX INFO: loaded from: classes.dex */
public class au {
    private static StatLogger h = com.tencent.stat.common.k.b();
    private static Context i = null;
    private static au j = null;
    private bc c;
    private bc d;
    private com.tencent.stat.common.e e;
    private String f;
    private String g;
    private ConcurrentHashMap<com.tencent.stat.a.e, String> l;
    volatile int a = 0;
    com.tencent.stat.common.a b = null;
    private int k = 0;
    private boolean m = false;
    private HashMap<String, String> n = new HashMap<>();

    private au(Context context) {
        this.c = null;
        this.d = null;
        this.e = null;
        this.f = StatConstants.MTA_COOPERATION_TAG;
        this.g = StatConstants.MTA_COOPERATION_TAG;
        this.l = null;
        try {
            this.e = new com.tencent.stat.common.e();
            i = context.getApplicationContext();
            this.l = new ConcurrentHashMap<>();
            this.f = com.tencent.stat.common.k.r(context);
            this.g = "pri_" + com.tencent.stat.common.k.r(context);
            this.c = new bc(i, this.f);
            this.d = new bc(i, this.g);
            a(true);
            a(false);
            f();
            b(i);
            d();
            j();
        } catch (Throwable th) {
            h.e(th);
        }
    }

    public static au a(Context context) {
        if (j == null) {
            synchronized (au.class) {
                if (j == null) {
                    j = new au(context);
                }
            }
        }
        return j;
    }

    private String a(List<bd> list) {
        StringBuilder sb = new StringBuilder(list.size() * 3);
        sb.append("event_id in (");
        int i2 = 0;
        int size = list.size();
        Iterator<bd> it = list.iterator();
        while (true) {
            int i3 = i2;
            if (!it.hasNext()) {
                sb.append(")");
                return sb.toString();
            }
            sb.append(it.next().a);
            if (i3 != size - 1) {
                sb.append(",");
            }
            i2 = i3 + 1;
        }
    }

    private synchronized void a(int i2, boolean z) {
        try {
            if (this.a > 0 && i2 > 0 && !StatServiceImpl.a()) {
                if (StatConfig.isDebugEnable()) {
                    h.i("Load " + this.a + " unsent events");
                }
                ArrayList arrayList = new ArrayList(i2);
                b(arrayList, i2, z);
                if (arrayList.size() > 0) {
                    if (StatConfig.isDebugEnable()) {
                        h.i("Peek " + arrayList.size() + " unsent events.");
                    }
                    a(arrayList, 2, z);
                    g.b(i).b(arrayList, new ba(this, arrayList, z));
                }
            }
        } catch (Throwable th) {
            h.e(th);
        }
    }

    private void a(com.tencent.stat.a.e eVar, StatDispatchCallback statDispatchCallback, boolean z) {
        long jInsert;
        long j2;
        SQLiteDatabase sQLiteDatabaseC = null;
        try {
            try {
                sQLiteDatabaseC = c(z);
                sQLiteDatabaseC.beginTransaction();
                if (!z && this.a > StatConfig.getMaxStoreEventCount()) {
                    h.warn("Too many events stored in db.");
                    this.a -= this.c.getWritableDatabase().delete("events", "event_id in (select event_id from events where timestamp in (select min(timestamp) from events) limit 1)", null);
                }
                ContentValues contentValues = new ContentValues();
                String strG = eVar.g();
                if (StatConfig.isDebugEnable()) {
                    h.i("insert 1 event, content:" + strG);
                }
                contentValues.put("content", com.tencent.stat.common.q.b(strG));
                contentValues.put("send_count", "0");
                contentValues.put(Downloads.COLUMN_STATUS, Integer.toString(1));
                contentValues.put("timestamp", Long.valueOf(eVar.c()));
                jInsert = sQLiteDatabaseC.insert("events", null, contentValues);
                sQLiteDatabaseC.setTransactionSuccessful();
            } catch (Throwable th) {
                jInsert = -1;
                h.e(th);
                if (sQLiteDatabaseC != null) {
                    try {
                        sQLiteDatabaseC.endTransaction();
                        j2 = -1;
                    } catch (Throwable th2) {
                        h.e(th2);
                        j2 = -1;
                    }
                }
            }
            if (sQLiteDatabaseC != null) {
                try {
                    sQLiteDatabaseC.endTransaction();
                    j2 = jInsert;
                } catch (Throwable th3) {
                    h.e(th3);
                    j2 = jInsert;
                }
            } else {
                j2 = jInsert;
            }
            if (j2 <= 0) {
                h.error("Failed to store event:" + eVar.g());
                return;
            }
            this.a++;
            if (StatConfig.isDebugEnable()) {
                h.d("directStoreEvent insert event to db, event:" + eVar.g());
            }
            if (statDispatchCallback != null) {
                statDispatchCallback.onDispatchSuccess();
            }
        } catch (Throwable th4) {
            if (sQLiteDatabaseC != null) {
                try {
                    sQLiteDatabaseC.endTransaction();
                } catch (Throwable th5) {
                    h.e(th5);
                }
            }
            throw th4;
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Type inference failed for: r2v3 */
    public synchronized void a(List<bd> list, int i2, boolean z) {
        int iB;
        SQLiteDatabase sQLiteDatabaseC;
        String str;
        String str2 = 0;
        synchronized (this) {
            if (list.size() != 0) {
                try {
                    iB = b(z);
                } catch (Throwable th) {
                    th = th;
                }
                try {
                    sQLiteDatabaseC = c(z);
                    try {
                        if (i2 == 2) {
                            str = "update events set status=" + i2 + ", send_count=send_count+1  where " + a(list);
                        } else {
                            str = "update events set status=" + i2 + " where " + a(list);
                            sQLiteDatabase = this.k % 3 == 0 ? "delete from events where send_count>" + iB : 0;
                            this.k++;
                            str2 = sQLiteDatabase;
                        }
                        if (StatConfig.isDebugEnable()) {
                            h.i("update sql:" + str);
                        }
                        sQLiteDatabaseC.beginTransaction();
                        sQLiteDatabaseC.execSQL(str);
                        if (str2 != 0) {
                            h.i("update for delete sql:" + str2);
                            sQLiteDatabaseC.execSQL(str2);
                            f();
                        }
                        sQLiteDatabaseC.setTransactionSuccessful();
                        if (sQLiteDatabaseC != null) {
                            try {
                                sQLiteDatabaseC.endTransaction();
                            } catch (Throwable th2) {
                                h.e(th2);
                            }
                        }
                    } catch (Throwable th3) {
                        th = th3;
                        h.e(th);
                        if (sQLiteDatabaseC != null) {
                            try {
                                sQLiteDatabaseC.endTransaction();
                            } catch (Throwable th4) {
                                h.e(th4);
                            }
                        }
                    }
                } catch (Throwable th5) {
                    th = th5;
                    sQLiteDatabaseC = null;
                }
            }
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public synchronized void a(List<bd> list, boolean z) {
        SQLiteDatabase sQLiteDatabaseC = null;
        synchronized (this) {
            if (list.size() != 0) {
                if (StatConfig.isDebugEnable()) {
                    h.i("Delete " + list.size() + " events, important:" + z);
                }
                StringBuilder sb = new StringBuilder(list.size() * 3);
                sb.append("event_id in (");
                int size = list.size();
                Iterator<bd> it = list.iterator();
                int i2 = 0;
                while (it.hasNext()) {
                    sb.append(it.next().a);
                    if (i2 != size - 1) {
                        sb.append(",");
                    }
                    i2++;
                }
                sb.append(")");
                try {
                    try {
                        sQLiteDatabaseC = c(z);
                        sQLiteDatabaseC.beginTransaction();
                        int iDelete = sQLiteDatabaseC.delete("events", sb.toString(), null);
                        if (StatConfig.isDebugEnable()) {
                            h.i("delete " + size + " event " + sb.toString() + ", success delete:" + iDelete);
                        }
                        this.a -= iDelete;
                        sQLiteDatabaseC.setTransactionSuccessful();
                        f();
                    } finally {
                        if (0 != 0) {
                            try {
                                sQLiteDatabaseC.endTransaction();
                            } catch (Throwable th) {
                                h.e(th);
                            }
                        }
                    }
                } catch (Throwable th2) {
                    h.e(th2);
                    if (sQLiteDatabaseC != null) {
                        try {
                            sQLiteDatabaseC.endTransaction();
                        } catch (Throwable th3) {
                            h.e(th3);
                        }
                    }
                }
            }
        }
    }

    private void a(boolean z) {
        SQLiteDatabase sQLiteDatabaseC = null;
        try {
            try {
                sQLiteDatabaseC = c(z);
                sQLiteDatabaseC.beginTransaction();
                ContentValues contentValues = new ContentValues();
                contentValues.put(Downloads.COLUMN_STATUS, (Integer) 1);
                int iUpdate = sQLiteDatabaseC.update("events", contentValues, "status=?", new String[]{Long.toString(2L)});
                if (StatConfig.isDebugEnable()) {
                    h.i("update " + iUpdate + " unsent events.");
                }
                sQLiteDatabaseC.setTransactionSuccessful();
                if (sQLiteDatabaseC != null) {
                    try {
                        sQLiteDatabaseC.endTransaction();
                    } catch (Throwable th) {
                        h.e(th);
                    }
                }
            } catch (Throwable th2) {
                h.e(th2);
                if (sQLiteDatabaseC != null) {
                    try {
                        sQLiteDatabaseC.endTransaction();
                    } catch (Throwable th3) {
                        h.e(th3);
                    }
                }
            }
        } catch (Throwable th4) {
            if (sQLiteDatabaseC != null) {
                try {
                    sQLiteDatabaseC.endTransaction();
                } catch (Throwable th5) {
                    h.e(th5);
                }
            }
            throw th4;
        }
    }

    private int b(boolean z) {
        return !z ? StatConfig.getMaxSendRetryCount() : StatConfig.getMaxImportantDataSendRetryCount();
    }

    public static au b() {
        return j;
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void b(int i2, boolean z) {
        int iG = i2 == -1 ? !z ? g() : h() : i2;
        if (iG > 0) {
            int sendPeriodMinutes = StatConfig.getSendPeriodMinutes() * 60 * StatConfig.getNumEventsCommitPerSec();
            if (iG > sendPeriodMinutes && sendPeriodMinutes > 0) {
                iG = sendPeriodMinutes;
            }
            int iA = StatConfig.a();
            int i3 = iG / iA;
            int i4 = iG % iA;
            if (StatConfig.isDebugEnable()) {
                h.i("sentStoreEventsByDb sendNumbers=" + iG + ",important=" + z + ",maxSendNumPerFor1Period=" + sendPeriodMinutes + ",maxCount=" + i3 + ",restNumbers=" + i4);
            }
            for (int i5 = 0; i5 < i3; i5++) {
                a(iA, z);
            }
            if (i4 > 0) {
                a(i4, z);
            }
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public synchronized void b(com.tencent.stat.a.e eVar, StatDispatchCallback statDispatchCallback, boolean z, boolean z2) {
        if (StatConfig.getMaxStoreEventCount() > 0) {
            if (StatConfig.m <= 0 || z || z2) {
                a(eVar, statDispatchCallback, z);
            } else if (StatConfig.m > 0) {
                if (StatConfig.isDebugEnable()) {
                    h.i("cacheEventsInMemory.size():" + this.l.size() + ",numEventsCachedInMemory:" + StatConfig.m + ",numStoredEvents:" + this.a);
                    h.i("cache event:" + eVar.g());
                }
                this.l.put(eVar, StatConstants.MTA_COOPERATION_TAG);
                if (this.l.size() >= StatConfig.m) {
                    i();
                }
                if (statDispatchCallback != null) {
                    if (this.l.size() > 0) {
                        i();
                    }
                    statDispatchCallback.onDispatchSuccess();
                }
            }
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    /* JADX WARN: Removed duplicated region for block: B:36:0x00fa A[Catch: all -> 0x0107, TRY_ENTER, TRY_LEAVE, TryCatch #4 {, blocks: (B:18:0x009f, B:19:0x00a2, B:28:0x00e7, B:29:0x00ea, B:36:0x00fa, B:37:0x00fd, B:38:0x0106), top: B:55:0x0004 }] */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public synchronized void b(com.tencent.stat.f r14) {
        /*
            Method dump skipped, instruction units count: 278
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: com.tencent.stat.au.b(com.tencent.stat.f):void");
    }

    /* JADX WARN: Removed duplicated region for block: B:25:0x0099  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    private void b(java.util.List<com.tencent.stat.bd> r11, int r12, boolean r13) throws java.lang.Throwable {
        /*
            r10 = this;
            r9 = 0
            android.database.sqlite.SQLiteDatabase r0 = r10.d(r13)     // Catch: java.lang.Throwable -> L95 java.lang.Throwable -> La2
            java.lang.String r1 = "events"
            r2 = 0
            java.lang.String r3 = "status=?"
            r4 = 1
            java.lang.String[] r4 = new java.lang.String[r4]     // Catch: java.lang.Throwable -> L95 java.lang.Throwable -> La2
            r5 = 0
            r6 = 1
            java.lang.String r6 = java.lang.Integer.toString(r6)     // Catch: java.lang.Throwable -> L95 java.lang.Throwable -> La2
            r4[r5] = r6     // Catch: java.lang.Throwable -> L95 java.lang.Throwable -> La2
            r5 = 0
            r6 = 0
            r7 = 0
            java.lang.String r8 = java.lang.Integer.toString(r12)     // Catch: java.lang.Throwable -> L95 java.lang.Throwable -> La2
            android.database.Cursor r6 = r0.query(r1, r2, r3, r4, r5, r6, r7, r8)     // Catch: java.lang.Throwable -> L95 java.lang.Throwable -> La2
        L20:
            boolean r0 = r6.moveToNext()     // Catch: java.lang.Throwable -> L82 java.lang.Throwable -> L9d
            if (r0 == 0) goto L8f
            r0 = 0
            long r1 = r6.getLong(r0)     // Catch: java.lang.Throwable -> L82 java.lang.Throwable -> L9d
            r0 = 1
            java.lang.String r3 = r6.getString(r0)     // Catch: java.lang.Throwable -> L82 java.lang.Throwable -> L9d
            boolean r0 = com.tencent.stat.StatConfig.g     // Catch: java.lang.Throwable -> L82 java.lang.Throwable -> L9d
            if (r0 != 0) goto L38
            java.lang.String r3 = com.tencent.stat.common.q.a(r3)     // Catch: java.lang.Throwable -> L82 java.lang.Throwable -> L9d
        L38:
            r0 = 2
            int r4 = r6.getInt(r0)     // Catch: java.lang.Throwable -> L82 java.lang.Throwable -> L9d
            r0 = 3
            int r5 = r6.getInt(r0)     // Catch: java.lang.Throwable -> L82 java.lang.Throwable -> L9d
            com.tencent.stat.bd r0 = new com.tencent.stat.bd     // Catch: java.lang.Throwable -> L82 java.lang.Throwable -> L9d
            r0.<init>(r1, r3, r4, r5)     // Catch: java.lang.Throwable -> L82 java.lang.Throwable -> L9d
            boolean r3 = com.tencent.stat.StatConfig.isDebugEnable()     // Catch: java.lang.Throwable -> L82 java.lang.Throwable -> L9d
            if (r3 == 0) goto L7e
            com.tencent.stat.common.StatLogger r3 = com.tencent.stat.au.h     // Catch: java.lang.Throwable -> L82 java.lang.Throwable -> L9d
            java.lang.StringBuilder r4 = new java.lang.StringBuilder     // Catch: java.lang.Throwable -> L82 java.lang.Throwable -> L9d
            r4.<init>()     // Catch: java.lang.Throwable -> L82 java.lang.Throwable -> L9d
            java.lang.String r7 = "peek event, id="
            java.lang.StringBuilder r4 = r4.append(r7)     // Catch: java.lang.Throwable -> L82 java.lang.Throwable -> L9d
            java.lang.StringBuilder r1 = r4.append(r1)     // Catch: java.lang.Throwable -> L82 java.lang.Throwable -> L9d
            java.lang.String r2 = ",send_count="
            java.lang.StringBuilder r1 = r1.append(r2)     // Catch: java.lang.Throwable -> L82 java.lang.Throwable -> L9d
            java.lang.StringBuilder r1 = r1.append(r5)     // Catch: java.lang.Throwable -> L82 java.lang.Throwable -> L9d
            java.lang.String r2 = ",timestamp="
            java.lang.StringBuilder r1 = r1.append(r2)     // Catch: java.lang.Throwable -> L82 java.lang.Throwable -> L9d
            r2 = 4
            long r4 = r6.getLong(r2)     // Catch: java.lang.Throwable -> L82 java.lang.Throwable -> L9d
            java.lang.StringBuilder r1 = r1.append(r4)     // Catch: java.lang.Throwable -> L82 java.lang.Throwable -> L9d
            java.lang.String r1 = r1.toString()     // Catch: java.lang.Throwable -> L82 java.lang.Throwable -> L9d
            r3.i(r1)     // Catch: java.lang.Throwable -> L82 java.lang.Throwable -> L9d
        L7e:
            r11.add(r0)     // Catch: java.lang.Throwable -> L82 java.lang.Throwable -> L9d
            goto L20
        L82:
            r0 = move-exception
            r1 = r6
        L84:
            com.tencent.stat.common.StatLogger r2 = com.tencent.stat.au.h     // Catch: java.lang.Throwable -> L9f
            r2.e(r0)     // Catch: java.lang.Throwable -> L9f
            if (r1 == 0) goto L8e
            r1.close()
        L8e:
            return
        L8f:
            if (r6 == 0) goto L8e
            r6.close()
            goto L8e
        L95:
            r0 = move-exception
            r6 = r9
        L97:
            if (r6 == 0) goto L9c
            r6.close()
        L9c:
            throw r0
        L9d:
            r0 = move-exception
            goto L97
        L9f:
            r0 = move-exception
            r6 = r1
            goto L97
        La2:
            r0 = move-exception
            r1 = r9
            goto L84
        */
        throw new UnsupportedOperationException("Method not decompiled: com.tencent.stat.au.b(java.util.List, int, boolean):void");
    }

    private SQLiteDatabase c(boolean z) {
        return !z ? this.c.getWritableDatabase() : this.d.getWritableDatabase();
    }

    private SQLiteDatabase d(boolean z) {
        return !z ? this.c.getReadableDatabase() : this.d.getReadableDatabase();
    }

    private void f() {
        this.a = g() + h();
    }

    private int g() {
        return (int) DatabaseUtils.queryNumEntries(this.c.getReadableDatabase(), "events");
    }

    private int h() {
        return (int) DatabaseUtils.queryNumEntries(this.d.getReadableDatabase(), "events");
    }

    /* JADX INFO: Access modifiers changed from: private */
    /* JADX WARN: Finally extract failed */
    public void i() {
        SQLiteDatabase writableDatabase = null;
        if (this.m) {
            return;
        }
        synchronized (this.l) {
            if (this.l.size() == 0) {
                return;
            }
            this.m = true;
            if (StatConfig.isDebugEnable()) {
                h.i("insert " + this.l.size() + " events ,numEventsCachedInMemory:" + StatConfig.m + ",numStoredEvents:" + this.a);
            }
            try {
                try {
                    writableDatabase = this.c.getWritableDatabase();
                    writableDatabase.beginTransaction();
                    Iterator<Map.Entry<com.tencent.stat.a.e, String>> it = this.l.entrySet().iterator();
                    while (it.hasNext()) {
                        com.tencent.stat.a.e key = it.next().getKey();
                        ContentValues contentValues = new ContentValues();
                        String strG = key.g();
                        if (StatConfig.isDebugEnable()) {
                            h.i("insert content:" + strG);
                        }
                        contentValues.put("content", com.tencent.stat.common.q.b(strG));
                        contentValues.put("send_count", "0");
                        contentValues.put(Downloads.COLUMN_STATUS, Integer.toString(1));
                        contentValues.put("timestamp", Long.valueOf(key.c()));
                        writableDatabase.insert("events", null, contentValues);
                        it.remove();
                    }
                    writableDatabase.setTransactionSuccessful();
                    if (writableDatabase != null) {
                        try {
                            writableDatabase.endTransaction();
                            f();
                        } catch (Throwable th) {
                            h.e(th);
                        }
                    }
                } catch (Throwable th2) {
                    h.e(th2);
                    if (writableDatabase != null) {
                        try {
                            writableDatabase.endTransaction();
                            f();
                        } catch (Throwable th3) {
                            h.e(th3);
                        }
                    }
                }
                this.m = false;
                if (StatConfig.isDebugEnable()) {
                    h.i("after insert, cacheEventsInMemory.size():" + this.l.size() + ",numEventsCachedInMemory:" + StatConfig.m + ",numStoredEvents:" + this.a);
                }
            } catch (Throwable th4) {
                if (writableDatabase != null) {
                    try {
                        writableDatabase.endTransaction();
                        f();
                    } catch (Throwable th5) {
                        h.e(th5);
                    }
                }
                throw th4;
            }
        }
    }

    /* JADX WARN: Removed duplicated region for block: B:18:0x003f  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    private void j() throws java.lang.Throwable {
        /*
            r9 = this;
            r8 = 0
            com.tencent.stat.bc r0 = r9.c     // Catch: java.lang.Throwable -> L3b java.lang.Throwable -> L45
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
            java.util.HashMap<java.lang.String, java.lang.String> r0 = r9.n     // Catch: java.lang.Throwable -> L29 java.lang.Throwable -> L43
            r2 = 0
            java.lang.String r2 = r1.getString(r2)     // Catch: java.lang.Throwable -> L29 java.lang.Throwable -> L43
            r3 = 1
            java.lang.String r3 = r1.getString(r3)     // Catch: java.lang.Throwable -> L29 java.lang.Throwable -> L43
            r0.put(r2, r3)     // Catch: java.lang.Throwable -> L29 java.lang.Throwable -> L43
            goto L13
        L29:
            r0 = move-exception
        L2a:
            com.tencent.stat.common.StatLogger r2 = com.tencent.stat.au.h     // Catch: java.lang.Throwable -> L43
            r2.e(r0)     // Catch: java.lang.Throwable -> L43
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
        throw new UnsupportedOperationException("Method not decompiled: com.tencent.stat.au.j():void");
    }

    public int a() {
        return this.a;
    }

    void a(int i2) {
        this.e.a(new bb(this, i2));
    }

    void a(com.tencent.stat.a.e eVar, StatDispatchCallback statDispatchCallback, boolean z, boolean z2) {
        if (this.e != null) {
            this.e.a(new ay(this, eVar, statDispatchCallback, z, z2));
        }
    }

    void a(f fVar) {
        if (fVar == null) {
            return;
        }
        this.e.a(new az(this, fVar));
    }

    void a(List<bd> list, int i2, boolean z, boolean z2) {
        if (this.e != null) {
            this.e.a(new av(this, list, i2, z, z2));
        }
    }

    void a(List<bd> list, boolean z, boolean z2) {
        if (this.e != null) {
            this.e.a(new aw(this, list, z, z2));
        }
    }

    /* JADX WARN: Removed duplicated region for block: B:104:0x021f A[EXC_TOP_SPLITTER, SYNTHETIC] */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public synchronized com.tencent.stat.common.a b(android.content.Context r18) {
        /*
            Method dump skipped, instruction units count: 597
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: com.tencent.stat.au.b(android.content.Context):com.tencent.stat.common.a");
    }

    void c() {
        if (StatConfig.isEnableStatService()) {
            try {
                this.e.a(new ax(this));
            } catch (Throwable th) {
                h.e(th);
            }
        }
    }

    /* JADX WARN: Removed duplicated region for block: B:18:0x005b  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    void d() throws java.lang.Throwable {
        /*
            r9 = this;
            r8 = 0
            com.tencent.stat.bc r0 = r9.c     // Catch: java.lang.Throwable -> L57 java.lang.Throwable -> L61
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
            com.tencent.stat.f r5 = new com.tencent.stat.f     // Catch: java.lang.Throwable -> L45 java.lang.Throwable -> L5f
            r5.<init>(r0)     // Catch: java.lang.Throwable -> L45 java.lang.Throwable -> L5f
            r5.a = r0     // Catch: java.lang.Throwable -> L45 java.lang.Throwable -> L5f
            org.json.JSONObject r0 = new org.json.JSONObject     // Catch: java.lang.Throwable -> L45 java.lang.Throwable -> L5f
            r0.<init>(r2)     // Catch: java.lang.Throwable -> L45 java.lang.Throwable -> L5f
            r5.b = r0     // Catch: java.lang.Throwable -> L45 java.lang.Throwable -> L5f
            r5.c = r3     // Catch: java.lang.Throwable -> L45 java.lang.Throwable -> L5f
            r5.d = r4     // Catch: java.lang.Throwable -> L45 java.lang.Throwable -> L5f
            android.content.Context r0 = com.tencent.stat.au.i     // Catch: java.lang.Throwable -> L45 java.lang.Throwable -> L5f
            com.tencent.stat.StatConfig.a(r0, r5)     // Catch: java.lang.Throwable -> L45 java.lang.Throwable -> L5f
            goto L13
        L45:
            r0 = move-exception
        L46:
            com.tencent.stat.common.StatLogger r2 = com.tencent.stat.au.h     // Catch: java.lang.Throwable -> L5f
            r2.e(r0)     // Catch: java.lang.Throwable -> L5f
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
        throw new UnsupportedOperationException("Method not decompiled: com.tencent.stat.au.d():void");
    }
}
