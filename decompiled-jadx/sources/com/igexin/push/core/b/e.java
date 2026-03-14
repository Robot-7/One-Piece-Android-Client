package com.igexin.push.core.b;

import android.content.ContentValues;
import android.database.Cursor;
import android.database.sqlite.SQLiteDatabase;
import com.igexin.getuiext.data.Consts;
import com.tencent.stat.common.StatConstants;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/* JADX INFO: loaded from: classes.dex */
public class e implements com.igexin.push.core.c.a {
    private static e a;
    private Map b = new HashMap();
    private Map c = new HashMap();

    private ContentValues a(h hVar) {
        if (hVar == null) {
            return null;
        }
        ContentValues contentValues = new ContentValues();
        contentValues.put("pkgname", hVar.a());
        contentValues.put("signature", hVar.d());
        contentValues.put("permissions", a(hVar.e()));
        if (hVar.b() == null || hVar.b().equals(StatConstants.MTA_COOPERATION_TAG)) {
            contentValues.put("accesstoken", StatConstants.MTA_COOPERATION_TAG);
        } else {
            contentValues.put("accesstoken", com.igexin.a.a.a.a.b(hVar.b().getBytes(), com.igexin.push.core.g.D));
            b(hVar.b(), hVar.a());
        }
        contentValues.put("expire", Long.valueOf(hVar.c()));
        return contentValues;
    }

    public static e a() {
        if (a == null) {
            a = new e();
        }
        return a;
    }

    private void a(ContentValues contentValues) {
        if (contentValues != null) {
            com.igexin.a.a.b.d.c().a((com.igexin.a.a.d.d) new f(this, contentValues), false, true);
        }
    }

    private void b() {
        com.igexin.a.a.b.d.c().a((com.igexin.a.a.d.d) new g(this), false, true);
    }

    private void b(String str, String str2) {
        this.c.put(str, str2);
    }

    private List c() {
        ArrayList arrayList = new ArrayList();
        h hVar = new h();
        ArrayList arrayList2 = new ArrayList();
        arrayList2.add(i.START_SERVICE);
        arrayList2.add(i.STOP_SERVICE);
        arrayList2.add(i.IS_STARTED);
        arrayList2.add(i.SET_SILENTTIME);
        hVar.a("com.igexin.pushmanager");
        hVar.c("308202133082017ca00302010202045080e7f1300d06092a864886f70d0101050500304e310b300906035504061302636e310b300906035504081302636e310b300906035504071302636e310b3009060355040a1302636e310b3009060355040b1302636e310b300906035504031302636e301e170d3132313031393035343130355a170d3232313031373035343130355a304e310b300906035504061302636e310b300906035504081302636e310b300906035504071302636e310b3009060355040a1302636e310b3009060355040b1302636e310b300906035504031302636e30819f300d06092a864886f70d010101050003818d0030818902818100805aee69ca3415ca32130b233fc07ad6eb666dcfe119efad8e5d0e4d51e175c6468a3869a5c131c342e5261a93f3bc30303ae0f23a3824d28df692092f8cf72ba7f2251f005ebfb1c1b210dc377aacf2168809f07e8d6756e6214c0288314388a2ead4a4453d358aa8cb1e2f02d1604c63cd0d075a558c718c43e3922f5198b50203010001300d06092a864886f70d0101050500038181004a4dc5634909f61710cf35229a63d7b8d2bfd89891d6ada1704b6c614d694cce35383cfb1fd8fed192dea23552413e74a9e1ff6e280246a6e30178a9b221b2dfee032cfc6acf660d62b514df92bbcf23e992a0543003705c679ba2fbae5acad0d89c6e44ee1cb05085d300ae60b7318472579007bde0e09ad75675a26a2f1c85");
        hVar.a(arrayList2);
        arrayList.add(hVar);
        return arrayList;
    }

    public h a(String str) {
        return (h) this.b.get(str);
    }

    public String a(List list) {
        String str = StatConstants.MTA_COOPERATION_TAG;
        for (int i = 0; i < list.size(); i++) {
            if (list.get(i) == i.START_SERVICE) {
                str = str + "0";
            } else if (list.get(i) == i.STOP_SERVICE) {
                str = str + "1";
            } else if (list.get(i) == i.IS_STARTED) {
                str = str + Consts.BITYPE_UPDATE;
            } else if (list.get(i) == i.SET_SILENTTIME) {
                str = str + Consts.BITYPE_RECOMMEND;
            }
            if (i != list.size() - 1) {
                str = str + ",";
            }
        }
        return str;
    }

    public Map a(Map map, Map map2) {
        for (Map.Entry entry : map.entrySet()) {
            map2.put(entry.getKey().toString(), (h) entry.getValue());
        }
        return map2;
    }

    @Override // com.igexin.push.core.c.a
    public void a(SQLiteDatabase sQLiteDatabase) {
    }

    public void a(String str, h hVar) {
        this.b.put(str, hVar);
        a(a(hVar));
    }

    public void a(Map map) {
        Map mapA = a(this.b, new HashMap());
        b();
        this.b.clear();
        this.c.clear();
        for (Map.Entry entry : map.entrySet()) {
            String string = entry.getKey().toString();
            h hVar = (h) entry.getValue();
            h hVar2 = (h) mapA.get(string);
            if (hVar2 != null) {
                hVar.b(hVar2.b());
                hVar.a(hVar2.c());
            }
            a(string, hVar);
        }
    }

    public boolean a(String str, String str2) {
        h hVarA = a(str);
        return hVarA != null && hVarA.d().equals(str2);
    }

    public String b(String str) {
        return (String) this.c.get(str);
    }

    @Override // com.igexin.push.core.c.a
    public void b(SQLiteDatabase sQLiteDatabase) throws Throwable {
        Cursor cursorRawQuery;
        Throwable th;
        String str;
        Cursor cursor = null;
        try {
            cursorRawQuery = sQLiteDatabase.rawQuery("select * from ca order by pkgname", null);
            if (cursorRawQuery != null) {
                try {
                    if (cursorRawQuery.getCount() <= 0) {
                        List listC = c();
                        int i = 0;
                        while (true) {
                            int i2 = i;
                            if (i2 >= listC.size()) {
                                break;
                            }
                            h hVar = (h) listC.get(i2);
                            a(hVar.a(), hVar);
                            i = i2 + 1;
                        }
                    } else {
                        while (cursorRawQuery.moveToNext()) {
                            h hVar2 = new h();
                            hVar2.a(cursorRawQuery.getString(cursorRawQuery.getColumnIndex("pkgname")));
                            hVar2.c(cursorRawQuery.getString(cursorRawQuery.getColumnIndex("signature")));
                            hVar2.a(c(cursorRawQuery.getString(cursorRawQuery.getColumnIndex("permissions"))));
                            byte[] blob = cursorRawQuery.getBlob(cursorRawQuery.getColumnIndex("accesstoken"));
                            if (blob != null) {
                                str = new String(com.igexin.a.a.a.a.a(blob, com.igexin.push.core.g.D));
                                b(str, hVar2.a());
                            } else {
                                str = null;
                            }
                            hVar2.b(str);
                            hVar2.a(cursorRawQuery.getLong(cursorRawQuery.getColumnIndex("expire")));
                            this.b.put(hVar2.a(), hVar2);
                        }
                    }
                } catch (Exception e) {
                    cursor = cursorRawQuery;
                    if (cursor != null) {
                        cursor.close();
                        return;
                    }
                    return;
                } catch (Throwable th2) {
                    th = th2;
                    if (cursorRawQuery != null) {
                        cursorRawQuery.close();
                    }
                    throw th;
                }
            }
            if (cursorRawQuery != null) {
                cursorRawQuery.close();
            }
        } catch (Exception e2) {
        } catch (Throwable th3) {
            cursorRawQuery = null;
            th = th3;
        }
    }

    public List c(String str) {
        ArrayList arrayList = new ArrayList();
        String[] strArrSplit = str.split(",");
        for (int i = 0; i < strArrSplit.length; i++) {
            if (strArrSplit[i].equals("0")) {
                arrayList.add(i.START_SERVICE);
            } else if (strArrSplit[i].equals("1")) {
                arrayList.add(i.STOP_SERVICE);
            } else if (strArrSplit[i].equals(Consts.BITYPE_UPDATE)) {
                arrayList.add(i.IS_STARTED);
            } else if (strArrSplit[i].equals(Consts.BITYPE_RECOMMEND)) {
                arrayList.add(i.SET_SILENTTIME);
            }
        }
        return arrayList;
    }

    @Override // com.igexin.push.core.c.a
    public void c(SQLiteDatabase sQLiteDatabase) {
    }
}
