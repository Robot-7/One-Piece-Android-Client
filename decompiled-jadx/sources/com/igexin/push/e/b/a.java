package com.igexin.push.e.b;

import android.content.ContentValues;
import android.database.Cursor;
import com.igexin.getuiext.data.Consts;
import com.tencent.stat.common.StatConstants;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.concurrent.TimeUnit;

/* JADX INFO: loaded from: classes.dex */
public class a extends h {
    private static a a;

    public a() {
        super(1800000L);
        this.A = true;
    }

    public static a g() {
        if (a == null) {
            a = new a();
        }
        return a;
    }

    @Override // com.igexin.push.e.b.h
    protected void a() {
        Cursor cursor;
        String strA;
        com.igexin.push.core.a.f.a().C();
        Cursor cursor2 = null;
        try {
            try {
                long j = com.igexin.push.core.g.o ? 1800000L : 0L;
                long j2 = com.igexin.push.core.g.k ? 1800000L : 0L;
                String str = new SimpleDateFormat("yyyy-MM-dd").format(new Date());
                Cursor cursorA = com.igexin.push.core.f.a().i().a("bi", new String[]{"type"}, new String[]{"1"}, null, null);
                if (cursorA != null) {
                    try {
                        if (cursorA.getCount() == 0) {
                            ContentValues contentValues = new ContentValues();
                            if (j != 0) {
                                contentValues.put("online_time", Long.valueOf(j));
                            }
                            if (j2 != 0) {
                                contentValues.put("network_time", Long.valueOf(j2));
                            }
                            contentValues.put("running_time", (Long) 1800000L);
                            contentValues.put("create_time", str);
                            contentValues.put("type", "1");
                            com.igexin.push.core.f.a().i().a("bi", contentValues);
                        } else {
                            long j3 = 1800000;
                            long j4 = j2;
                            long j5 = j;
                            while (cursorA.moveToNext()) {
                                String string = cursorA.getString(cursorA.getColumnIndexOrThrow("create_time"));
                                String string2 = cursorA.getString(cursorA.getColumnIndexOrThrow("id"));
                                if (str.equals(string)) {
                                    ContentValues contentValues2 = new ContentValues();
                                    if (j5 != 0) {
                                        j5 += (long) cursorA.getInt(cursorA.getColumnIndexOrThrow("online_time"));
                                        contentValues2.put("online_time", Long.valueOf(j5));
                                    }
                                    if (j4 != 0) {
                                        j4 += (long) cursorA.getInt(cursorA.getColumnIndexOrThrow("network_time"));
                                        contentValues2.put("network_time", Long.valueOf(j4));
                                    }
                                    j3 += (long) cursorA.getInt(cursorA.getColumnIndexOrThrow("running_time"));
                                    contentValues2.put("running_time", Long.valueOf(j3));
                                    com.igexin.push.core.f.a().i().a("bi", contentValues2, new String[]{"id"}, new String[]{string2});
                                } else {
                                    ContentValues contentValues3 = new ContentValues();
                                    contentValues3.put("type", Consts.BITYPE_UPDATE);
                                    com.igexin.push.core.f.a().i().a("bi", contentValues3, new String[]{"id"}, new String[]{string2});
                                    ContentValues contentValues4 = new ContentValues();
                                    if (j5 != 0) {
                                        contentValues4.put("online_time", Long.valueOf(j5));
                                    }
                                    if (j4 != 0) {
                                        contentValues4.put("network_time", Long.valueOf(j4));
                                    }
                                    contentValues4.put("running_time", Long.valueOf(j3));
                                    contentValues4.put("create_time", str);
                                    contentValues4.put("type", "1");
                                    com.igexin.push.core.f.a().i().a("bi", contentValues4);
                                }
                            }
                        }
                    } catch (Exception e) {
                        cursor = cursorA;
                        if (cursor != null) {
                            cursor.close();
                        }
                    }
                }
                if (cursorA != null) {
                    cursorA.close();
                }
            } catch (Exception e2) {
                cursor = null;
            }
            if ((System.currentTimeMillis() - com.igexin.push.core.g.O) - Consts.TIME_24HOUR <= 0 || (strA = com.igexin.push.core.a.f.a().a(false, 0)) == null || strA.equals(StatConstants.MTA_COOPERATION_TAG)) {
                return;
            }
            com.igexin.a.a.b.d.c().a((com.igexin.a.a.d.d) new com.igexin.push.e.a.c(new com.igexin.push.core.d.g(com.igexin.push.core.g.a(), strA.getBytes(), 0, true)), false, true);
        } catch (Throwable th) {
            if (0 != 0) {
                cursor2.close();
            }
            throw th;
        }
    }

    @Override // com.igexin.a.a.d.a.f
    public int b() {
        return 0;
    }

    @Override // com.igexin.a.a.d.d
    public void c() {
        super.c();
        if (this.x) {
            return;
        }
        h();
    }

    public void h() {
        a(1800000L, TimeUnit.MILLISECONDS);
    }
}
