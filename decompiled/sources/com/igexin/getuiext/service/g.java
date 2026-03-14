package com.igexin.getuiext.service;

import com.igexin.download.DownloadInfo;
import com.igexin.download.Downloads;
import java.util.TimerTask;

/* JADX INFO: loaded from: classes.dex */
class g extends TimerTask {
    final /* synthetic */ d a;

    private g(d dVar) {
        this.a = dVar;
    }

    /* synthetic */ g(d dVar, e eVar) {
        this(dVar);
    }

    @Override // java.util.TimerTask, java.lang.Runnable
    public void run() {
        if (this.a.e.size() == 0) {
            this.a.h.cancel();
            this.a.h = null;
            return;
        }
        int size = this.a.e.size();
        for (int i = 0; i < size; i++) {
            int iKeyAt = this.a.e.keyAt(i);
            if (System.currentTimeMillis() - ((Long) this.a.e.valueAt(i)).longValue() > 300000) {
                this.a.e.remove(iKeyAt);
                DownloadInfo downloadInfo = (DownloadInfo) this.a.f.get(iKeyAt);
                if (downloadInfo != null) {
                    downloadInfo.mStatus = Downloads.STATUS_HTTP_DATA_ERROR;
                    this.a.update(downloadInfo);
                }
            }
        }
    }
}
