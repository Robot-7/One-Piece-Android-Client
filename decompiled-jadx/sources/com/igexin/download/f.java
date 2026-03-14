package com.igexin.download;

import android.app.AlarmManager;
import android.app.PendingIntent;
import android.content.Intent;
import android.database.Cursor;
import android.os.Message;
import android.os.Process;

/* JADX INFO: loaded from: classes.dex */
class f extends Thread {
    final /* synthetic */ DownloadService a;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public f(DownloadService downloadService) {
        super("Download Service");
        this.a = downloadService;
    }

    @Override // java.lang.Thread, java.lang.Runnable
    public void run() throws Throwable {
        AlarmManager alarmManager;
        Cursor cursorQuery;
        boolean z;
        long j;
        boolean z2;
        long jA;
        boolean z3;
        boolean zIsAfterLast;
        int i;
        boolean z4;
        boolean z5;
        boolean z6;
        Process.setThreadPriority(10);
        boolean z7 = false;
        long j2 = Long.MAX_VALUE;
        while (true) {
            long j3 = j2;
            boolean z8 = z7;
            synchronized (this.a) {
                if (this.a.d != this) {
                    throw new IllegalStateException("multiple UpdateThreads in DownloadService");
                }
                if (!this.a.e) {
                    this.a.d = null;
                    if (!z8) {
                        this.a.stopSelf();
                    }
                    if (j3 != Long.MAX_VALUE && (alarmManager = (AlarmManager) this.a.getSystemService("alarm")) != null) {
                        Intent intent = new Intent("android.intent.action.GTDOWNLOAD_WAKEUP");
                        intent.setClassName(this.a.getPackageName(), DownloadReceiver.class.getName());
                        alarmManager.set(0, System.currentTimeMillis() + j3, PendingIntent.getBroadcast(this.a, 0, intent, 1073741824));
                    }
                    this.a.i = null;
                    this.a.j = null;
                    return;
                }
                this.a.e = false;
                boolean zA = h.a(this.a);
                boolean zC = h.c(this.a);
                long jCurrentTimeMillis = System.currentTimeMillis();
                try {
                    cursorQuery = this.a.getContentResolver().query(Downloads.a, null, null, null, "_id");
                } catch (Exception e) {
                    cursorQuery = null;
                    z = z8;
                    j = j3;
                } catch (Throwable th) {
                    th = th;
                    cursorQuery = null;
                }
                if (cursorQuery == null) {
                    if (cursorQuery != null) {
                        cursorQuery.close();
                        return;
                    }
                    return;
                }
                try {
                    try {
                        cursorQuery.moveToFirst();
                        int i2 = 0;
                        boolean z9 = false;
                        z = false;
                        j = Long.MAX_VALUE;
                        try {
                            boolean zIsAfterLast2 = cursorQuery.isAfterLast();
                            int columnIndexOrThrow = cursorQuery.getColumnIndexOrThrow("_id");
                            while (true) {
                                if (zIsAfterLast2 && i2 >= this.a.c.size()) {
                                    break;
                                }
                                if (zIsAfterLast2) {
                                    this.a.b(i2);
                                } else {
                                    int i3 = cursorQuery.getInt(columnIndexOrThrow);
                                    if (i2 == this.a.c.size()) {
                                        this.a.a(cursorQuery, i2, zA, zC, jCurrentTimeMillis);
                                        if (!this.a.d(i2) || (this.a.b() && this.a.a(cursorQuery, i2))) {
                                            z6 = z9;
                                        } else {
                                            z = true;
                                            z6 = true;
                                        }
                                        if (this.a.c(i2)) {
                                            z = true;
                                        }
                                        jA = this.a.a(i2, jCurrentTimeMillis);
                                        if (jA == 0) {
                                            jA = j;
                                            z3 = true;
                                        } else if (jA <= 0 || jA >= j) {
                                            jA = j;
                                            z3 = z;
                                        } else {
                                            z3 = z;
                                        }
                                        int i4 = i2 + 1;
                                        try {
                                            cursorQuery.moveToNext();
                                            zIsAfterLast = cursorQuery.isAfterLast();
                                            boolean z10 = z6;
                                            i = i4;
                                            z4 = z10;
                                        } catch (Exception e2) {
                                            j = jA;
                                            z = z3;
                                            if (cursorQuery != null) {
                                                cursorQuery.close();
                                            }
                                            j2 = j;
                                            z7 = z;
                                        }
                                    } else {
                                        int i5 = ((DownloadInfo) this.a.c.get(i2)).mId;
                                        if (i5 < i3) {
                                            if (this.a.d(i2) && this.a.b()) {
                                                this.a.a((Cursor) null, i2);
                                            }
                                            this.a.b(i2);
                                            zIsAfterLast = zIsAfterLast2;
                                            jA = j;
                                            z3 = z;
                                            i = i2;
                                            z4 = z9;
                                        } else if (i5 == i3) {
                                            this.a.b(cursorQuery, i2, zA, zC, jCurrentTimeMillis);
                                            if (!this.a.d(i2) || (this.a.b() && this.a.a(cursorQuery, i2))) {
                                                z5 = z9;
                                            } else {
                                                z = true;
                                                z5 = true;
                                            }
                                            if (this.a.c(i2)) {
                                                z = true;
                                            }
                                            jA = this.a.a(i2, jCurrentTimeMillis);
                                            if (jA == 0) {
                                                jA = j;
                                                z3 = true;
                                            } else if (jA <= 0 || jA >= j) {
                                                jA = j;
                                                z3 = z;
                                            } else {
                                                z3 = z;
                                            }
                                            int i6 = i2 + 1;
                                            cursorQuery.moveToNext();
                                            zIsAfterLast = cursorQuery.isAfterLast();
                                            boolean z11 = z5;
                                            i = i6;
                                            z4 = z11;
                                        } else {
                                            this.a.a(cursorQuery, i2, zA, zC, jCurrentTimeMillis);
                                            if (!this.a.d(i2) || (this.a.b() && this.a.a(cursorQuery, i2))) {
                                                z2 = z9;
                                            } else {
                                                z = true;
                                                z2 = true;
                                            }
                                            if (this.a.c(i2)) {
                                                z = true;
                                            }
                                            jA = this.a.a(i2, jCurrentTimeMillis);
                                            if (jA == 0) {
                                                jA = j;
                                                z3 = true;
                                            } else if (jA <= 0 || jA >= j) {
                                                jA = j;
                                                z3 = z;
                                            } else {
                                                z3 = z;
                                            }
                                            int i7 = i2 + 1;
                                            cursorQuery.moveToNext();
                                            zIsAfterLast = cursorQuery.isAfterLast();
                                            boolean z12 = z2;
                                            i = i7;
                                            z4 = z12;
                                        }
                                    }
                                    z9 = z4;
                                    j = jA;
                                    z = z3;
                                    i2 = i;
                                    zIsAfterLast2 = zIsAfterLast;
                                }
                            }
                            if (SdkDownLoader.c != null) {
                                SdkDownLoader.c.a(this.a.c);
                                Message message = new Message();
                                message.what = 2;
                                SdkDownLoader.c.d.sendMessage(message);
                            }
                            if (!z9) {
                                this.a.f.a();
                            } else if (!this.a.g) {
                                Intent intent2 = new Intent();
                                intent2.setClassName("com.android.providers.media", "com.android.providers.media.MediaScannerService");
                                this.a.g = true;
                                this.a.bindService(intent2, this.a.f, 1);
                            }
                            if (cursorQuery != null) {
                                cursorQuery.close();
                            }
                        } catch (Exception e3) {
                        }
                    } catch (Throwable th2) {
                        th = th2;
                        if (cursorQuery != null) {
                            cursorQuery.close();
                        }
                        throw th;
                    }
                } catch (Exception e4) {
                    z = z8;
                    j = j3;
                }
                j2 = j;
                z7 = z;
            }
        }
    }
}
