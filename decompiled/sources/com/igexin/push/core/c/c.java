package com.igexin.push.core.c;

import android.content.ContentValues;
import android.database.Cursor;
import android.database.sqlite.SQLiteDatabase;
import com.igexin.getuiext.data.Consts;
import java.util.Iterator;
import java.util.List;
import java.util.concurrent.CopyOnWriteArrayList;

/* JADX INFO: loaded from: classes.dex */
public class c implements a {
    private static c a;
    private List b = new CopyOnWriteArrayList();

    private c() {
    }

    private int a(int i) {
        int i2 = 0;
        Iterator it = this.b.iterator();
        while (true) {
            int i3 = i2;
            if (!it.hasNext()) {
                return i3;
            }
            i2 = ((com.igexin.push.core.bean.i) it.next()).c() == i ? i3 + 1 : i3;
        }
    }

    public static c a() {
        if (a == null) {
            a = new c();
        }
        return a;
    }

    private static ContentValues b(com.igexin.push.core.bean.i iVar) {
        ContentValues contentValues = new ContentValues();
        contentValues.put("id", Long.valueOf(iVar.a()));
        contentValues.put("data", com.igexin.a.b.a.b(iVar.b().getBytes()));
        contentValues.put("type", Byte.valueOf(iVar.c()));
        contentValues.put("time", Long.valueOf(iVar.d()));
        return contentValues;
    }

    private com.igexin.push.core.bean.i b(long j) {
        for (com.igexin.push.core.bean.i iVar : this.b) {
            if (iVar.a() == j) {
                return iVar;
            }
        }
        return null;
    }

    @Override // com.igexin.push.core.c.a
    public void a(SQLiteDatabase sQLiteDatabase) {
    }

    public void a(com.igexin.push.core.bean.i iVar) {
        if (iVar == null || this.b.size() >= 47) {
            return;
        }
        switch (iVar.c()) {
            case 1:
                if (a(1) >= 1) {
                    return;
                }
                break;
            case 2:
                if (a(2) >= 3) {
                    return;
                }
                break;
            case 3:
                if (a(3) >= 30) {
                    return;
                }
                break;
            case 5:
                if (a(5) >= 3) {
                    return;
                }
                break;
            case 6:
                if (a(6) >= 10) {
                    return;
                }
                break;
        }
        this.b.add(iVar);
        com.igexin.a.a.b.d.c().a((com.igexin.a.a.d.d) new d(this, b(iVar)), false, true);
    }

    public boolean a(long j) {
        com.igexin.push.core.bean.i iVarB = b(j);
        if (iVarB == null) {
            return false;
        }
        this.b.remove(iVarB);
        com.igexin.a.a.b.d.c().a((com.igexin.a.a.d.d) new e(this, b(iVarB), j), true, false);
        return true;
    }

    public List b() {
        return this.b;
    }

    @Override // com.igexin.push.core.c.a
    public void b(SQLiteDatabase sQLiteDatabase) throws Throwable {
        Cursor cursorRawQuery;
        Throwable th;
        Cursor cursor = null;
        try {
            cursorRawQuery = sQLiteDatabase.rawQuery("select id,data,type,time from ral", null);
            try {
                long jCurrentTimeMillis = System.currentTimeMillis();
                if (cursorRawQuery != null) {
                    while (cursorRawQuery.moveToNext()) {
                        long j = cursorRawQuery.getLong(0);
                        String str = new String(com.igexin.a.b.a.c(cursorRawQuery.getBlob(1)));
                        byte b = (byte) cursorRawQuery.getInt(2);
                        long j2 = cursorRawQuery.getLong(3);
                        this.b.add(new com.igexin.push.core.bean.i(j, str, b, j2));
                        if (jCurrentTimeMillis - j2 > Consts.TIME_24HOUR) {
                            a(j);
                        }
                    }
                }
                if (cursorRawQuery != null) {
                    cursorRawQuery.close();
                }
            } catch (Exception e) {
                cursor = cursorRawQuery;
                if (cursor != null) {
                    cursor.close();
                }
            } catch (Throwable th2) {
                th = th2;
                if (cursorRawQuery != null) {
                    cursorRawQuery.close();
                }
                throw th;
            }
        } catch (Exception e2) {
        } catch (Throwable th3) {
            cursorRawQuery = null;
            th = th3;
        }
    }

    @Override // com.igexin.push.core.c.a
    public void c(SQLiteDatabase sQLiteDatabase) {
    }
}
