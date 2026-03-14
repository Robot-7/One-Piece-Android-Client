package com.flurry.sdk;

import android.os.Looper;
import com.tencent.stat.common.StatConstants;
import java.io.Closeable;
import java.io.DataInputStream;
import java.io.DataOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.util.UUID;

/* JADX INFO: loaded from: classes.dex */
public class df {
    private static final String d = df.class.getSimpleName();
    String a;
    long b = -1;
    int c = -1;
    private File e;

    public df() {
        this.a = null;
        this.e = null;
        this.a = UUID.randomUUID().toString();
        this.e = Cdo.a().b().getFileStreamPath(".flurrydatasenderblock." + this.a);
    }

    public df(String str) {
        this.a = null;
        this.e = null;
        this.a = str;
        this.e = Cdo.a().b().getFileStreamPath(".flurrydatasenderblock." + this.a);
    }

    public String a() {
        return this.a;
    }

    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Type inference failed for: r2v1, types: [java.lang.String] */
    /* JADX WARN: Type inference failed for: r2v10 */
    /* JADX WARN: Type inference failed for: r2v11 */
    /* JADX WARN: Type inference failed for: r2v3 */
    /* JADX WARN: Type inference failed for: r2v4, types: [java.io.Closeable] */
    /* JADX WARN: Type inference failed for: r2v5 */
    /* JADX WARN: Type inference failed for: r2v7 */
    public boolean a(byte[] bArr) throws Throwable {
        DataOutputStream dataOutputStream;
        boolean z = false;
        if (Looper.myLooper() == Looper.getMainLooper()) {
            el.a(6, d, "setData(byte[]) running on the MAIN thread!");
        }
        ?? r2 = d;
        el.a(4, (String) r2, "Writing FlurryDataSenderBlockInfo: " + this.e.getAbsolutePath());
        try {
            try {
            } catch (Throwable th) {
                th = th;
            }
        } catch (Throwable th2) {
            th = th2;
            dataOutputStream = null;
        }
        if (fa.a(this.e)) {
            dataOutputStream = new DataOutputStream(new FileOutputStream(this.e));
            try {
                int length = bArr.length;
                dataOutputStream.writeShort(length);
                dataOutputStream.write(bArr);
                dataOutputStream.writeShort(0);
                z = true;
                this.c = length;
                this.b = System.currentTimeMillis();
                fb.a(dataOutputStream);
                r2 = dataOutputStream;
            } catch (Throwable th3) {
                th = th3;
                el.a(6, d, StatConstants.MTA_COOPERATION_TAG, th);
                fb.a(dataOutputStream);
                r2 = dataOutputStream;
            }
            return z;
        }
        fb.a((Closeable) null);
        return z;
        fb.a((Closeable) r2);
        throw th;
    }

    public byte[] b() throws Throwable {
        DataInputStream dataInputStream;
        Throwable th;
        byte[] bArr = null;
        if (Looper.myLooper() == Looper.getMainLooper()) {
            el.a(6, d, "getData() running on the MAIN thread!");
        }
        if (this.e.exists()) {
            el.a(4, d, "Reading FlurryDataSenderBlockInfo: " + this.e.getAbsolutePath());
            try {
                dataInputStream = new DataInputStream(new FileInputStream(this.e));
                try {
                    try {
                        int unsignedShort = dataInputStream.readUnsignedShort();
                        if (unsignedShort == 0) {
                            fb.a(dataInputStream);
                        } else {
                            bArr = new byte[unsignedShort];
                            dataInputStream.readFully(bArr);
                            if (dataInputStream.readUnsignedShort() == 0) {
                            }
                            fb.a(dataInputStream);
                        }
                    } catch (Throwable th2) {
                        th = th2;
                        el.a(6, d, "Error when loading persistent file", th);
                        fb.a(dataInputStream);
                    }
                } catch (Throwable th3) {
                    th = th3;
                    fb.a(dataInputStream);
                    throw th;
                }
            } catch (Throwable th4) {
                dataInputStream = null;
                th = th4;
                fb.a(dataInputStream);
                throw th;
            }
        } else {
            el.a(4, d, "Agent cache file doesn't exist.");
        }
        return bArr;
    }

    public boolean c() {
        if (this.e.exists()) {
            if (this.e.delete()) {
                el.a(4, d, "Deleted persistence file");
                this.b = -1L;
                this.c = -1;
                return true;
            }
            el.a(6, d, "Cannot delete persistence file");
        }
        return false;
    }
}
