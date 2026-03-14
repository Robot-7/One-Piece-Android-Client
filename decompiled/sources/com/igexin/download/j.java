package com.igexin.download;

import android.os.Handler;
import android.os.Looper;
import android.os.Message;

/* JADX INFO: loaded from: classes.dex */
class j extends Handler {
    final /* synthetic */ SdkDownLoader a;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    j(SdkDownLoader sdkDownLoader, Looper looper) {
        super(looper);
        this.a = sdkDownLoader;
    }

    @Override // android.os.Handler
    public void handleMessage(Message message) {
        switch (message.what) {
            case 2:
                synchronized (this.a.h) {
                    if (this.a.g.size() > 0 && this.a.updateData.size() > 0) {
                        for (DownloadInfo downloadInfo : this.a.updateData.values()) {
                            IDownloadCallback iDownloadCallbackA = this.a.a(downloadInfo.mData8);
                            if (iDownloadCallbackA != null) {
                                iDownloadCallbackA.update(downloadInfo);
                            }
                        }
                    }
                    break;
                }
                return;
            default:
                return;
        }
    }
}
