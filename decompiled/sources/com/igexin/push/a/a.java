package com.igexin.push.a;

import android.content.ContentValues;
import android.database.Cursor;
import android.database.sqlite.SQLiteDatabase;
import com.igexin.sdk.PushBuildConfig;
import java.io.File;
import java.util.Iterator;
import org.json.JSONObject;

/* JADX INFO: loaded from: classes.dex */
public class a implements com.igexin.push.core.c.a {
    private static a a;

    public static a a() {
        if (a == null) {
            a = new a();
        }
        return a;
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void a(SQLiteDatabase sQLiteDatabase, int i) {
        sQLiteDatabase.delete("config", "id = ?", new String[]{String.valueOf(i)});
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void a(SQLiteDatabase sQLiteDatabase, int i, String str) {
        ContentValues contentValues = new ContentValues();
        contentValues.put("id", Integer.valueOf(i));
        contentValues.put("value", str);
        sQLiteDatabase.replace("config", null, contentValues);
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void a(SQLiteDatabase sQLiteDatabase, int i, byte[] bArr) {
        ContentValues contentValues = new ContentValues();
        contentValues.put("id", Integer.valueOf(i));
        contentValues.put("value", bArr);
        sQLiteDatabase.replace("config", null, contentValues);
    }

    @Override // com.igexin.push.core.c.a
    public void a(SQLiteDatabase sQLiteDatabase) {
    }

    public void b() {
        com.igexin.a.a.b.d.c().a((com.igexin.a.a.d.d) new b(this), false, true);
    }

    @Override // com.igexin.push.core.c.a
    public void b(SQLiteDatabase sQLiteDatabase) throws Throwable {
        Cursor cursorRawQuery;
        byte[] blob;
        String string;
        String str;
        Cursor cursor = null;
        try {
            cursorRawQuery = sQLiteDatabase.rawQuery("select id, value from config order by id", null);
            if (cursorRawQuery != null) {
                while (cursorRawQuery.moveToNext()) {
                    try {
                        int i = cursorRawQuery.getInt(0);
                        if (i == 20 || i == 21 || i == 22) {
                            blob = cursorRawQuery.getBlob(1);
                            string = null;
                        } else {
                            string = cursorRawQuery.getString(1);
                            blob = null;
                        }
                        switch (i) {
                            case 1:
                                k.e = (string.equals("null") ? null : Integer.valueOf(string)).intValue();
                                break;
                            case 2:
                                k.f = (string.equals("null") ? null : Integer.valueOf(string)).intValue();
                                break;
                            case 3:
                                k.g = (string.equals("null") ? null : Long.valueOf(string)).longValue();
                                break;
                            case 4:
                                if (!string.equals("null")) {
                                    k.j = Boolean.valueOf(string).booleanValue();
                                }
                                break;
                            case 5:
                                if (!string.equals("null")) {
                                    k.k = Boolean.valueOf(string).booleanValue();
                                }
                                break;
                            case 6:
                                if (!string.equals("null")) {
                                    k.l = Boolean.valueOf(string).booleanValue();
                                }
                                break;
                            case 7:
                                if (!string.equals("null")) {
                                    k.m = Boolean.valueOf(string).booleanValue();
                                }
                                break;
                            case 8:
                                if (!string.equals("null")) {
                                    k.n = Boolean.valueOf(string).booleanValue();
                                }
                                break;
                            case 9:
                                if (!string.equals("null")) {
                                    k.o = Boolean.valueOf(string).booleanValue();
                                }
                                break;
                            case 10:
                                if (!string.equals("null")) {
                                    k.r = Boolean.valueOf(string).booleanValue();
                                }
                                break;
                            case 11:
                                if (!string.equals("null")) {
                                    k.s = Boolean.valueOf(string).booleanValue();
                                }
                                break;
                            case 12:
                                if (!string.equals("null")) {
                                    k.t = Long.valueOf(string).longValue();
                                }
                                break;
                            case 13:
                                if (!string.equals("null")) {
                                    k.p = Boolean.valueOf(string).booleanValue();
                                }
                                break;
                            case 14:
                                if (!string.equals("null")) {
                                    k.q = Boolean.valueOf(string).booleanValue();
                                }
                                break;
                            case 15:
                                if (!string.equals("null")) {
                                    k.h = (string.equals("null") ? null : Integer.valueOf(string)).intValue();
                                }
                                break;
                            case 16:
                                if (!string.equals("null")) {
                                    k.i = (string.equals("null") ? null : Integer.valueOf(string)).intValue();
                                }
                                break;
                            case 17:
                                if (!string.equals("null")) {
                                    k.u = Boolean.valueOf(string).booleanValue();
                                }
                                break;
                            case 18:
                                if (!string.equals("null")) {
                                    k.v = Boolean.valueOf(string).booleanValue();
                                }
                                break;
                            case 19:
                                if (!string.equals("null")) {
                                    k.w = Boolean.valueOf(string).booleanValue();
                                }
                                break;
                            case 20:
                                if (blob != null && (str = new String(com.igexin.a.a.a.a.a(blob, com.igexin.push.core.g.D))) != null) {
                                    k.x = com.igexin.push.core.a.f.a().a(new JSONObject(str));
                                }
                                break;
                            case 21:
                                if (blob != null) {
                                    k.y = new String(com.igexin.a.a.a.a.a(blob, com.igexin.push.core.g.D));
                                }
                                break;
                            case 22:
                                if (blob != null) {
                                    k.z = new String(com.igexin.a.a.a.a.a(blob, com.igexin.push.core.g.D));
                                }
                                break;
                            case 23:
                                if (!string.equals("null")) {
                                    k.A = Boolean.valueOf(string).booleanValue();
                                }
                                break;
                        }
                    } catch (Exception e) {
                        if (cursorRawQuery != null) {
                            cursorRawQuery.close();
                        }
                    } catch (Throwable th) {
                        cursor = cursorRawQuery;
                        th = th;
                        if (cursor != null) {
                            cursor.close();
                        }
                        throw th;
                    }
                }
            }
            if (cursorRawQuery != null) {
                cursorRawQuery.close();
            }
        } catch (Exception e2) {
            cursorRawQuery = null;
        } catch (Throwable th2) {
            th = th2;
        }
        if (PushBuildConfig.sdk_conf_version.equals(com.igexin.push.core.g.P)) {
            return;
        }
        if (k.x != null) {
            if (k.x.b().size() > 0) {
                Iterator it = k.x.b().keySet().iterator();
                while (it.hasNext()) {
                    File file = new File(com.igexin.push.core.g.ad + "/" + ((com.igexin.push.core.bean.e) k.x.b().get(it.next())).c());
                    if (file.exists()) {
                        file.delete();
                    }
                }
            }
            k.x = null;
            h();
        }
        com.igexin.push.core.c.f.a().b(PushBuildConfig.sdk_conf_version);
        com.igexin.push.core.c.f.a().f(0L);
    }

    public void c() {
        com.igexin.a.a.b.d.c().a((com.igexin.a.a.d.d) new c(this), false, true);
    }

    @Override // com.igexin.push.core.c.a
    public void c(SQLiteDatabase sQLiteDatabase) {
        a(sQLiteDatabase, 1, String.valueOf(k.e));
        a(sQLiteDatabase, 2, String.valueOf(k.f));
        a(sQLiteDatabase, 3, String.valueOf(k.g));
        a(sQLiteDatabase, 4, String.valueOf(k.j));
        a(sQLiteDatabase, 5, String.valueOf(k.k));
        a(sQLiteDatabase, 6, String.valueOf(k.l));
        a(sQLiteDatabase, 7, String.valueOf(k.m));
        a(sQLiteDatabase, 8, String.valueOf(k.n));
        a(sQLiteDatabase, 9, String.valueOf(k.o));
        a(sQLiteDatabase, 10, String.valueOf(k.r));
        a(sQLiteDatabase, 11, String.valueOf(k.s));
        a(sQLiteDatabase, 12, String.valueOf(k.t));
        a(sQLiteDatabase, 13, String.valueOf(k.p));
        a(sQLiteDatabase, 14, String.valueOf(k.q));
        a(sQLiteDatabase, 15, String.valueOf(k.h));
        a(sQLiteDatabase, 3, String.valueOf(k.g));
        a(sQLiteDatabase, 17, String.valueOf(k.u));
        a(sQLiteDatabase, 18, String.valueOf(k.v));
        a(sQLiteDatabase, 19, String.valueOf(k.w));
    }

    public void d() {
        com.igexin.a.a.b.d.c().a((com.igexin.a.a.d.d) new d(this), false, true);
    }

    public void e() {
        com.igexin.a.a.b.d.c().a((com.igexin.a.a.d.d) new e(this), false, true);
    }

    public void f() {
        com.igexin.a.a.b.d.c().a((com.igexin.a.a.d.d) new f(this), false, true);
    }

    public void g() {
        com.igexin.a.a.b.d.c().a((com.igexin.a.a.d.d) new g(this), true, false);
    }

    public void h() {
        com.igexin.a.a.b.d.c().a((com.igexin.a.a.d.d) new h(this), true, false);
    }
}
