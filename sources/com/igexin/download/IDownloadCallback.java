package com.igexin.download;

/* JADX INFO: loaded from: classes.dex */
public interface IDownloadCallback {
    public static final boolean isVisibilty = true;

    String getName();

    void update(DownloadInfo downloadInfo);
}
