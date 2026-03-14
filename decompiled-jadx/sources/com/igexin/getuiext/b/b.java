package com.igexin.getuiext.b;

import android.content.ContentValues;
import android.database.Cursor;
import java.util.ArrayList;

/* JADX INFO: loaded from: classes.dex */
public class b {
    private com.igexin.getuiext.data.a a;

    public b(com.igexin.getuiext.data.a aVar) {
        this.a = null;
        this.a = aVar;
    }

    public ArrayList a(String str) {
        ArrayList arrayList = null;
        Cursor cursorA = this.a.a("biinfo", null, "bitype=?", new String[]{str}, null, null, null);
        if (cursorA != null) {
            arrayList = new ArrayList();
            for (int i = 0; i < 20 && cursorA.moveToNext(); i++) {
                com.igexin.getuiext.data.a.b bVar = new com.igexin.getuiext.data.a.b();
                int i2 = cursorA.getInt(cursorA.getColumnIndex("id"));
                String string = cursorA.getString(cursorA.getColumnIndex("value"));
                bVar.a = i2;
                bVar.b = string;
                bVar.c = str;
                arrayList.add(bVar);
            }
            cursorA.close();
        }
        return arrayList;
    }

    public void a(String str, int i) {
        Cursor cursorA = this.a.a("biinfo");
        if (cursorA != null && cursorA.getCount() >= 20) {
            cursorA.moveToFirst();
            this.a.a("biinfo", "id = ?", new String[]{String.valueOf(cursorA.getInt(cursorA.getColumnIndex("id")))});
        }
        if (cursorA != null) {
            cursorA.close();
        }
        ContentValues contentValues = new ContentValues();
        contentValues.put("value", str);
        contentValues.put("bitype", String.valueOf(i));
        this.a.a("biinfo", contentValues);
    }

    public void b(String str) {
        this.a.a("biinfo", "bitype = ?", new String[]{str});
    }
}
