package com.igexin.download;

import android.database.ContentObserver;
import android.os.Handler;

/* JADX INFO: loaded from: classes.dex */
class d extends ContentObserver {
    final /* synthetic */ DownloadService a;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public d(DownloadService downloadService) {
        super(new Handler());
        this.a = downloadService;
    }

    @Override // android.database.ContentObserver
    public void onChange(boolean z) {
        this.a.a();
    }
}
