package com.igexin.getuiext.service;

import android.R;
import android.app.Notification;
import android.app.NotificationManager;
import android.app.PendingIntent;
import android.content.Context;
import android.content.Intent;
import android.graphics.Bitmap;
import android.media.AudioManager;
import android.os.Environment;
import android.text.TextUtils;
import android.util.SparseArray;
import android.widget.RemoteViews;
import android.widget.Toast;
import com.igexin.download.DownloadInfo;
import com.igexin.download.IDownloadCallback;
import com.igexin.download.SdkDownLoader;
import com.igexin.getuiext.activity.GetuiExtActivity;
import com.igexin.getuiext.data.Consts;
import com.pipaw.pipawpay.PipawSDK;
import com.tencent.stat.common.StatConstants;
import java.util.Random;
import java.util.Timer;

/* JADX INFO: loaded from: classes.dex */
public class d implements IDownloadCallback {
    private Context a;
    private String b;
    private NotificationManager c;
    private com.igexin.getuiext.ui.f j;
    private SparseArray d = new SparseArray();
    private SparseArray e = new SparseArray();
    private SparseArray f = new SparseArray();
    private SparseArray g = new SparseArray();
    private Timer h = null;
    private boolean i = true;
    private c k = c.a();

    public d(Context context, String str) {
        this.a = context;
        this.b = str;
        this.c = (NotificationManager) context.getSystemService("notification");
        this.j = com.igexin.getuiext.ui.f.a(context);
    }

    private int a(int i) {
        return i << 11;
    }

    private Notification a(DownloadInfo downloadInfo, Notification notification, com.igexin.getuiext.data.a.d dVar) {
        if (!downloadInfo.mNotice) {
            downloadInfo.mNotice = true;
            Intent intent = new Intent("com.igexin.increment");
            intent.putExtra("action", "install");
            intent.putExtra("filepath", downloadInfo.mFileName);
            intent.putExtra("pkgname", dVar.b);
            intent.putExtra("verifyCode", Consts.verifyCode);
            Random random = new Random();
            random.setSeed(System.currentTimeMillis());
            notification.contentIntent = PendingIntent.getBroadcast(this.a, random.nextInt(PipawSDK.PAY_CANCEL), intent, 1073741824);
            Intent intent2 = new Intent("com.igexin.getuiext.ui.upgrade_progress");
            intent2.putExtra("download_id", downloadInfo.mId);
            intent2.putExtra("file_path", downloadInfo.mFileName);
            intent2.putExtra("progress", 100);
            this.a.sendBroadcast(intent2);
        }
        return notification;
    }

    private void a(DownloadInfo downloadInfo) {
        Notification notification;
        int i;
        Notification notification2 = (Notification) this.d.get(downloadInfo.mId);
        if (notification2 == null || notification2.contentView == null) {
            Notification notification3 = new Notification();
            notification3.contentView = new RemoteViews(this.a.getPackageName(), this.j.a("notification_inc", "layout"));
            notification3.contentIntent = PendingIntent.getActivity(this.a, 0, new Intent(this.a, (Class<?>) GetuiExtActivity.class), 134217728);
            this.d.put(downloadInfo.mId, notification3);
            notification = notification3;
        } else {
            notification = notification2;
        }
        com.igexin.getuiext.data.a.d dVar = (com.igexin.getuiext.data.a.d) this.g.get(downloadInfo.mId);
        if (dVar == null) {
            dVar = (com.igexin.getuiext.data.a.d) com.igexin.getuiext.b.c.d().c().a(downloadInfo.mId);
            if (dVar != null) {
                this.g.put(downloadInfo.mId, dVar);
            }
        }
        com.igexin.getuiext.data.a.d dVar2 = dVar;
        int iA = this.j.a("notification_right", "id");
        int iA2 = this.j.a("download_layout", "id");
        int iA3 = this.j.a("notification_icon", "id");
        int iA4 = this.j.a("download_app_name", "id");
        int iA5 = this.j.a("download_app_version", "id");
        int iA6 = this.j.a("downlaod_progress_horizontal", "id");
        int iA7 = this.j.a("setup_layout", "id");
        int iA8 = this.j.a("setup_icon", "id");
        int iA9 = this.j.a("setup_app_name", "id");
        int iA10 = this.j.a("setup_app_version", "id");
        int iA11 = this.j.a("setup_message", "id");
        int iA12 = this.j.a("setup_text", "id");
        Bitmap bitmapA = this.k.a(dVar2.b);
        if (bitmapA == null) {
            a(dVar2.f, dVar2.b);
            notification.contentView.setImageViewResource(iA3, this.a.getApplicationInfo().icon);
        } else if (bitmapA.getHeight() < 100 || bitmapA.getWidth() < 100) {
            notification.contentView.setImageViewBitmap(iA3, bitmapA);
        }
        notification.contentView.setTextViewText(iA4, dVar2.a);
        notification.contentView.setTextViewText(iA5, dVar2.c);
        switch (downloadInfo.mStatus) {
            case 192:
                notification.contentView.setViewVisibility(iA, 8);
                notification.contentView.setViewVisibility(iA2, 0);
                if (downloadInfo.mNotify) {
                    downloadInfo.mNotify = false;
                    int ringerMode = ((AudioManager) this.a.getSystemService("audio")).getRingerMode();
                    if (ringerMode == 1) {
                        notification.sound = null;
                        notification.defaults |= 2;
                    } else if (ringerMode == 2) {
                        notification.defaults |= 2;
                        notification.defaults |= 1;
                    }
                } else {
                    notification.defaults = 0;
                    notification.sound = null;
                    notification.vibrate = null;
                }
                notification.icon = R.drawable.stat_sys_download;
                notification.tickerText = "正在下载";
                notification.flags |= 32;
                notification.contentIntent = PendingIntent.getBroadcast(this.a, 0, new Intent(), 134217728);
                if (dVar2 instanceof com.igexin.getuiext.data.a.e) {
                    switch (f.a[((com.igexin.getuiext.data.a.e) dVar2).n.ordinal()]) {
                        case 1:
                            long j = dVar2.i;
                            i = j == 0 ? 0 : (int) ((((j - ((com.igexin.getuiext.data.a.e) dVar2).o) + ((long) downloadInfo.mCurrentBytes)) * 100) / j);
                            break;
                        case 2:
                            i = downloadInfo.mTotalBytes == 0 ? 0 : (int) ((((long) downloadInfo.mCurrentBytes) * 100) / ((long) downloadInfo.mTotalBytes));
                            break;
                        default:
                            i = 0;
                            break;
                    }
                } else {
                    i = downloadInfo.mTotalBytes != 0 ? (int) ((((long) downloadInfo.mCurrentBytes) * 100) / ((long) downloadInfo.mTotalBytes)) : 0;
                }
                notification.contentView.setProgressBar(iA6, 100, i, false);
                Intent intent = new Intent("com.igexin.getuiext.ui.upgrade_progress");
                intent.putExtra("download_id", downloadInfo.mId);
                intent.putExtra("file_path", StatConstants.MTA_COOPERATION_TAG);
                intent.putExtra("progress", i);
                this.a.sendBroadcast(intent);
                this.d.put(downloadInfo.mId, notification);
                try {
                    this.c.notify(a(downloadInfo.mId), notification);
                } catch (Exception e) {
                    return;
                }
                break;
            case 193:
                if (downloadInfo.mControl == 1) {
                    this.c.cancel(a(downloadInfo.mId));
                    this.d.remove(downloadInfo.mId);
                    this.f.remove(downloadInfo.mId);
                    this.e.remove(downloadInfo.mId);
                    downloadInfo.mNotify = true;
                }
                break;
            case 200:
                Notification notificationA = a(downloadInfo, notification, dVar2);
                notificationA.flags = 16;
                notificationA.icon = R.drawable.stat_sys_download_done;
                notificationA.tickerText = "下载成功";
                notificationA.contentView.setViewVisibility(iA2, 8);
                notificationA.contentView.setViewVisibility(iA7, 0);
                notificationA.contentView.setImageViewBitmap(iA8, this.j.c("inc_setup.png"));
                notificationA.contentView.setTextViewText(iA9, dVar2.a);
                notificationA.contentView.setTextViewText(iA10, dVar2.c);
                notificationA.contentView.setTextViewText(iA11, "下载完成");
                notificationA.contentView.setTextViewText(iA12, "安装");
                SdkDownLoader.getInstantiate(this.a).deleteTask(downloadInfo.mId);
                this.f.remove(downloadInfo.mId);
                com.igexin.getuiext.b.c.d().c().b(downloadInfo.mId);
                com.igexin.getuiext.data.a.a aVar = (com.igexin.getuiext.data.a.a) this.g.get(downloadInfo.mId);
                this.g.remove(downloadInfo.mId);
                if (aVar != null && aVar.b != null && !aVar.b.equals(StatConstants.MTA_COOPERATION_TAG)) {
                    a(aVar.b);
                }
                this.d.put(downloadInfo.mId, notificationA);
                this.c.notify(a(downloadInfo.mId), notificationA);
                break;
            default:
                if (downloadInfo.mStatus >= 400 && downloadInfo.mStatus < 600) {
                    if (notification.contentView != null) {
                        notification.flags = 16;
                        notification.icon = R.drawable.stat_sys_warning;
                        notification.contentView = null;
                        notification.setLatestEventInfo(this.a, dVar2.a, "下载失败！", PendingIntent.getActivity(this.a, com.igexin.getuiext.util.h.c(), new Intent(), 1073741824));
                        this.e.remove(downloadInfo.mId);
                        this.f.remove(downloadInfo.mId);
                        this.g.remove(downloadInfo.mId);
                        com.igexin.getuiext.b.c.d().c().b(downloadInfo.mId);
                        SdkDownLoader.getInstantiate(this.a).deleteTask(downloadInfo.mId);
                        Intent intent2 = new Intent("com.igexin.getuiext.ui.upgrade_progress");
                        intent2.putExtra("download_id", downloadInfo.mId);
                        intent2.putExtra("file_path", StatConstants.MTA_COOPERATION_TAG);
                        intent2.putExtra("progress", -1);
                        this.a.sendBroadcast(intent2);
                    }
                    this.d.put(downloadInfo.mId, notification);
                    this.c.notify(a(downloadInfo.mId), notification);
                    break;
                }
                break;
        }
    }

    private void a(String str) {
        com.igexin.getuiext.data.a.d dVarB = c.a().b(str);
        if (dVarB != null) {
            if (dVarB instanceof com.igexin.getuiext.ui.promotion.f) {
                a.a(this.a, dVarB, 3);
            } else if (dVarB instanceof com.igexin.getuiext.data.a.e) {
                a.a(this.a, dVarB, 4);
            }
        }
    }

    private void a(String str, String str2) {
        if (TextUtils.isEmpty(str) || TextUtils.isEmpty(str2)) {
            return;
        }
        new e(this).execute(str, str2);
    }

    @Override // com.igexin.download.IDownloadCallback
    public String getName() {
        return this.b;
    }

    @Override // com.igexin.download.IDownloadCallback
    public void update(DownloadInfo downloadInfo) {
        boolean zEquals = Environment.getExternalStorageState().equals("mounted");
        if (zEquals || this.i) {
            if (zEquals) {
                this.i = true;
            } else {
                Toast.makeText(this.a, "当前SD卡不可用，请检查设置。", 0).show();
                this.i = false;
            }
            downloadInfo.refreshSpeed();
            if (this.f.get(downloadInfo.mId) == null) {
                this.f.put(downloadInfo.mId, downloadInfo);
            }
            if (downloadInfo.mStatus == 200) {
                this.e.remove(downloadInfo.mId);
            } else {
                if (this.e.get(downloadInfo.mId) == null) {
                    this.e.put(downloadInfo.mId, Long.valueOf(System.currentTimeMillis()));
                }
                if (downloadInfo.mDownSpeed != 0) {
                    this.e.put(downloadInfo.mId, Long.valueOf(System.currentTimeMillis()));
                }
            }
            if (this.h == null) {
                this.h = new Timer();
                this.h.schedule(new g(this, null), 100L, 5000L);
            }
            a(downloadInfo);
        }
    }
}
