package com.igexin.getuiext.ui.promotion;

import android.graphics.Bitmap;
import android.graphics.BitmapFactory;
import android.os.AsyncTask;
import java.io.IOException;
import java.io.InputStream;
import java.util.HashMap;
import org.apache.http.MethodNotSupportedException;

/* JADX INFO: loaded from: classes.dex */
class o extends AsyncTask {
    final /* synthetic */ UrlImageView a;

    private o(UrlImageView urlImageView) {
        this.a = urlImageView;
    }

    /* JADX INFO: Access modifiers changed from: protected */
    @Override // android.os.AsyncTask
    /* JADX INFO: renamed from: a, reason: merged with bridge method [inline-methods] */
    public Bitmap doInBackground(String... strArr) throws Throwable {
        InputStream inputStreamA;
        Throwable th;
        Bitmap bitmapDecodeStream = null;
        try {
            inputStreamA = com.igexin.getuiext.util.c.a("GET", strArr[0], (HashMap) null);
            try {
                bitmapDecodeStream = BitmapFactory.decodeStream(inputStreamA);
                if (inputStreamA != null) {
                    try {
                        inputStreamA.close();
                    } catch (IOException e) {
                    }
                }
            } catch (MethodNotSupportedException e2) {
                if (inputStreamA != null) {
                    try {
                        inputStreamA.close();
                    } catch (IOException e3) {
                    }
                }
            } catch (Exception e4) {
                if (inputStreamA != null) {
                    try {
                        inputStreamA.close();
                    } catch (IOException e5) {
                    }
                }
            } catch (Throwable th2) {
                th = th2;
                if (inputStreamA != null) {
                    try {
                        inputStreamA.close();
                    } catch (IOException e6) {
                    }
                }
                throw th;
            }
        } catch (MethodNotSupportedException e7) {
            inputStreamA = null;
        } catch (Exception e8) {
            inputStreamA = null;
        } catch (Throwable th3) {
            inputStreamA = null;
            th = th3;
        }
        return bitmapDecodeStream;
    }

    /* JADX INFO: Access modifiers changed from: protected */
    @Override // android.os.AsyncTask
    /* JADX INFO: renamed from: a, reason: merged with bridge method [inline-methods] */
    public void onPostExecute(Bitmap bitmap) {
        if (bitmap != null) {
            this.a.post(new p(this, bitmap));
        }
    }
}
