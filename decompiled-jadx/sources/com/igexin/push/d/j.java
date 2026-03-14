package com.igexin.push.d;

import android.content.ContentValues;
import android.content.Context;
import android.database.Cursor;
import com.igexin.getuiext.data.Consts;
import com.igexin.push.c.c.l;
import com.igexin.push.c.c.m;
import com.igexin.push.c.c.n;
import com.igexin.push.c.c.o;
import com.igexin.push.core.c.r;
import com.tencent.stat.common.StatConstants;
import java.text.SimpleDateFormat;
import java.util.Date;

/* JADX INFO: loaded from: classes.dex */
public class j {
    private static String a = "SNL";
    private Context b;
    private com.igexin.a.a.b.d c;
    private k d;
    private boolean e = false;
    private long f = 0;
    private long g = 0;
    private boolean h = false;

    private long a(long j) {
        long j2 = j / 10;
        return ((long) (((Math.random() * j2) * 2.0d) - j2)) + j;
    }

    private String b(com.igexin.push.c.c.e eVar) {
        if (eVar instanceof com.igexin.push.c.c.f) {
            return "R-" + ((com.igexin.push.c.c.f) eVar).a();
        }
        if (eVar instanceof o) {
            return "R-" + ((o) eVar).b;
        }
        if (eVar instanceof com.igexin.push.c.c.i) {
            return "S-" + String.valueOf(((com.igexin.push.c.c.i) eVar).a);
        }
        if (eVar instanceof com.igexin.push.c.c.k) {
            if (((com.igexin.push.c.c.k) eVar).e != 0) {
                return "S-" + String.valueOf(((com.igexin.push.c.c.k) eVar).e);
            }
        } else {
            if (eVar instanceof l) {
                return "S-" + String.valueOf(((l) eVar).a);
            }
            if (eVar instanceof m) {
                return "S-" + String.valueOf(((m) eVar).e);
            }
            if (eVar instanceof com.igexin.push.c.c.d) {
                return "C-" + ((com.igexin.push.c.c.d) eVar).g;
            }
            if (eVar instanceof n) {
                return "C-" + ((n) eVar).g;
            }
            if (eVar instanceof com.igexin.push.c.c.a) {
                return "C-" + ((com.igexin.push.c.c.a) eVar).d;
            }
            if (eVar instanceof com.igexin.push.c.c.c) {
                return "C-" + ((com.igexin.push.c.c.c) eVar).d;
            }
        }
        return StatConstants.MTA_COOPERATION_TAG;
    }

    private boolean d() {
        if (!com.igexin.push.a.k.s || this.f + this.g < com.igexin.push.a.k.t) {
            return false;
        }
        a aVar = new a();
        aVar.a(com.igexin.push.core.c.check);
        com.igexin.push.core.f.a().f().a(aVar);
        return false;
    }

    private void e() throws Throwable {
        Cursor cursorA;
        Cursor cursor;
        try {
            String str = new SimpleDateFormat("yyyy-MM-dd").format(new Date());
            cursorA = com.igexin.push.core.f.a().i().a("bi", new String[]{"type"}, new String[]{"1"}, null, null);
            if (cursorA != null) {
                try {
                    if (cursorA.getCount() == 0) {
                        ContentValues contentValues = new ContentValues();
                        contentValues.put("loginerror_connecterror_count", (Integer) 1);
                        contentValues.put("create_time", str);
                        contentValues.put("type", "1");
                        com.igexin.push.core.f.a().i().a("bi", contentValues);
                    } else {
                        int i = 0;
                        while (cursorA.moveToNext()) {
                            String string = cursorA.getString(cursorA.getColumnIndexOrThrow("create_time"));
                            String string2 = cursorA.getString(cursorA.getColumnIndexOrThrow("id"));
                            if (str.equals(string)) {
                                i = cursorA.getInt(cursorA.getColumnIndexOrThrow("loginerror_connecterror_count"));
                                ContentValues contentValues2 = new ContentValues();
                                contentValues2.put("loginerror_connecterror_count", Integer.valueOf(i + 1));
                                com.igexin.push.core.f.a().i().a("bi", contentValues2, new String[]{"id"}, new String[]{string2});
                            } else {
                                ContentValues contentValues3 = new ContentValues();
                                contentValues3.put("type", Consts.BITYPE_UPDATE);
                                com.igexin.push.core.f.a().i().a("bi", contentValues3, new String[]{"id"}, new String[]{string2});
                                ContentValues contentValues4 = new ContentValues();
                                contentValues4.put("loginerror_connecterror_count", Integer.valueOf(i + 1));
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
                        return;
                    }
                    return;
                } catch (Throwable th) {
                    th = th;
                    if (cursorA != null) {
                        cursorA.close();
                    }
                    throw th;
                }
            }
            if (cursorA != null) {
                cursorA.close();
            }
        } catch (Exception e2) {
            cursor = null;
        } catch (Throwable th2) {
            th = th2;
            cursorA = null;
        }
    }

    public int a(String str, com.igexin.push.c.c.e eVar) {
        if (str == null || eVar == null) {
            return -1;
        }
        if (!this.e) {
            return com.igexin.push.core.f.a().f().a(str, eVar);
        }
        if (eVar.i == 6 || eVar.i == 4 || eVar.i == 36 || eVar.i == 0) {
            if (this.c.a(com.igexin.push.core.g.a, 3, com.igexin.push.core.f.a().d(), eVar, true, com.igexin.push.a.k.i > 0 ? com.igexin.push.a.k.i : 15, new com.igexin.push.c.b()) == null) {
                return -2;
            }
        } else if (this.c.a(com.igexin.push.core.g.a, 3, com.igexin.push.core.f.a().d(), eVar, true) == null) {
            return -2;
        }
        byte[] bArrD = eVar.d();
        if (bArrD != null) {
            this.g += ((long) bArrD.length) + 8;
        } else {
            this.g += 8;
        }
        d();
        return 0;
    }

    public void a(Context context, com.igexin.a.a.b.d dVar, k kVar) {
        this.b = context;
        this.c = dVar;
        this.d = kVar;
    }

    public void a(com.igexin.push.c.c.e eVar) {
        if (eVar == null) {
            return;
        }
        if (!this.e) {
            if (this.d != null) {
                this.d.a(eVar);
                return;
            }
            return;
        }
        String strB = b(eVar);
        if (strB.equals("S-") || strB.equals("R-")) {
            return;
        }
        if (strB.length() > 0 && !strB.equals("C-") && !strB.equals("C-" + com.igexin.push.core.g.u) && !strB.equals("R-" + com.igexin.push.core.g.C) && !strB.equals("S-" + com.igexin.push.core.g.t)) {
            com.igexin.push.core.f.a().f().b(strB, eVar);
        } else if (this.d != null) {
            this.d.a(eVar);
        }
        byte[] bArrD = eVar.d();
        if (bArrD != null) {
            this.f += ((long) bArrD.length) + 8;
        } else {
            this.f += 8;
        }
        d();
    }

    public void a(boolean z) {
        if (this.e != z) {
            this.e = z;
            this.h = false;
            if (!z) {
                this.c.a(com.igexin.push.core.g.a.replaceFirst("socket", "disConnect"), 0, (com.igexin.a.a.b.c) null);
                return;
            }
            this.g = 0L;
            this.f = 0L;
            this.c.a(new com.igexin.push.c.b.b());
            this.c.d();
        }
    }

    public boolean a() {
        return this.e;
    }

    public void b() {
        com.igexin.push.core.g.F = 0L;
        if (this.e || this.d == null) {
            return;
        }
        this.d.b();
    }

    public void b(boolean z) throws Throwable {
        if (z) {
            com.igexin.a.a.c.a.a("disconnected|user");
            r.d();
            if (com.igexin.push.core.g.o) {
                com.igexin.push.core.g.o = false;
                com.igexin.push.core.a.f.a().m();
            }
        } else {
            com.igexin.a.a.c.a.a("disconnected|network");
            com.igexin.push.core.i.a().a(com.igexin.push.core.k.NETWORK_ERROR);
            r.d();
            r.a();
            e();
            if (com.igexin.push.core.g.o) {
                com.igexin.push.core.g.o = false;
                com.igexin.push.core.a.f.a().m();
            }
            c(true);
        }
        if (this.e) {
            com.igexin.push.core.f.a().f().b();
        } else if (this.d != null) {
            this.d.a(z);
        }
    }

    public long c() {
        return com.igexin.push.core.g.F;
    }

    public void c(boolean z) {
        if (z) {
            com.igexin.push.core.g.F = 0L;
        }
        boolean zA = com.igexin.push.core.a.f.a().a(System.currentTimeMillis());
        boolean zN = com.igexin.push.core.a.f.a().n();
        if (com.igexin.push.core.g.k && com.igexin.push.core.g.l && com.igexin.push.core.g.m && !zA && zN) {
            if (com.igexin.push.core.g.F <= 0) {
                com.igexin.push.core.g.F = 1000L;
            } else if (com.igexin.push.core.g.F <= 60000) {
                com.igexin.push.core.g.F += 10000;
            } else {
                com.igexin.push.core.g.F += 120000;
            }
            if (com.igexin.push.core.g.F > 3600000) {
                com.igexin.push.core.g.F = 3600000L;
            }
            com.igexin.push.core.g.F = a(com.igexin.push.core.g.F);
        } else {
            com.igexin.push.core.g.F = 3600000L;
        }
        com.igexin.push.e.b.f.g().h();
    }
}
