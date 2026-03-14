package com.igexin.getuiext.b;

import android.content.ContentValues;
import android.database.Cursor;
import com.igexin.getuiext.data.a.d;
import com.igexin.getuiext.data.a.e;
import com.igexin.getuiext.data.a.f;

/* JADX INFO: loaded from: classes.dex */
public class a {
    private com.igexin.getuiext.data.a a;

    public a(com.igexin.getuiext.data.a aVar) {
        this.a = aVar;
    }

    public com.igexin.getuiext.data.a.a a(int i) {
        e eVar = null;
        Cursor cursorA = this.a.a("appinfo", null, "download_id = ?", new String[]{String.valueOf(i)}, null, null, null);
        if (cursorA != null) {
            if (cursorA.moveToFirst()) {
                eVar = new e();
                eVar.a = cursorA.getString(cursorA.getColumnIndexOrThrow("name"));
                eVar.b = cursorA.getString(cursorA.getColumnIndexOrThrow("pkgName"));
                eVar.d = cursorA.getInt(cursorA.getColumnIndexOrThrow("versionCode"));
                eVar.c = cursorA.getString(cursorA.getColumnIndexOrThrow("versionName"));
                eVar.o = cursorA.getLong(cursorA.getColumnIndexOrThrow("diffSize"));
                eVar.i = cursorA.getLong(cursorA.getColumnIndexOrThrow("fullSize"));
                eVar.f = cursorA.getString(cursorA.getColumnIndexOrThrow("logo"));
                eVar.g = cursorA.getString(cursorA.getColumnIndexOrThrow("url"));
                eVar.n = f.a(cursorA.getString(cursorA.getColumnIndexOrThrow("updateType")));
                eVar.p = cursorA.getString(cursorA.getColumnIndexOrThrow("diffChecksum"));
                eVar.q = cursorA.getString(cursorA.getColumnIndexOrThrow("fullChecksum"));
            }
            cursorA.close();
        }
        return eVar;
    }

    public void a(int i, com.igexin.getuiext.data.a.a aVar) {
        if (aVar != null) {
            ContentValues contentValues = new ContentValues();
            contentValues.put("download_id", Integer.valueOf(i));
            if (aVar.a != null) {
                contentValues.put("name", aVar.a);
            }
            if (aVar.b != null) {
                contentValues.put("pkgName", aVar.b);
            }
            if (aVar.c != null) {
                contentValues.put("versionName", aVar.c);
            }
            contentValues.put("versionCode", Integer.valueOf(aVar.d));
            if (aVar instanceof d) {
                if (((d) aVar).f != null) {
                    contentValues.put("logo", ((d) aVar).f);
                }
                contentValues.put("fullSize", Long.valueOf(((d) aVar).i));
                if (((d) aVar).g != null) {
                    contentValues.put("url", ((d) aVar).g);
                }
                if (aVar instanceof e) {
                    e eVar = (e) aVar;
                    contentValues.put("diffSize", Long.valueOf(eVar.o));
                    if (eVar.n != null) {
                        contentValues.put("updateType", eVar.n.name());
                    }
                    if (eVar.p != null) {
                        contentValues.put("diffChecksum", eVar.p);
                    }
                    if (eVar.q != null) {
                        contentValues.put("fullChecksum", eVar.q);
                    }
                }
            }
            this.a.a("appinfo", contentValues);
        }
    }

    public void b(int i) {
        this.a.a("appinfo", "download_id = ?", new String[]{String.valueOf(i)});
    }
}
