package com.igexin.sdk.aidl;

import android.os.IInterface;

/* JADX INFO: loaded from: classes.dex */
public interface ICACallback extends IInterface {
    boolean onAuthenticated(String str, String str2, String str3, long j);

    boolean onError(int i);
}
