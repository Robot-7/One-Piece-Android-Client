package com.igexin.getuiext.ui;

import android.content.Context;
import android.content.res.AssetManager;
import android.graphics.Bitmap;
import android.graphics.BitmapFactory;
import android.graphics.NinePatch;
import android.graphics.drawable.Drawable;
import android.graphics.drawable.NinePatchDrawable;
import java.io.IOException;

/* JADX INFO: loaded from: classes.dex */
public class f {
    private static f b;
    private Context a;
    private AssetManager c;

    private f(Context context) {
        this.a = context;
        a();
    }

    public static f a(Context context) {
        if (b == null) {
            b = new f(context);
        }
        return b;
    }

    private void a() {
        this.c = this.a.getAssets();
    }

    public int a(String str, String str2) {
        return this.a.getResources().getIdentifier(str, str2, this.a.getApplicationInfo().packageName);
    }

    public NinePatchDrawable a(String str) {
        try {
            Bitmap bitmapDecodeStream = BitmapFactory.decodeStream(this.c.open(str));
            byte[] ninePatchChunk = bitmapDecodeStream.getNinePatchChunk();
            if (NinePatch.isNinePatchChunk(ninePatchChunk)) {
                return new NinePatchDrawable(this.a.getResources(), bitmapDecodeStream, ninePatchChunk, e.a(ninePatchChunk).a, null);
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
        return null;
    }

    public Drawable b(String str) {
        try {
            return Drawable.createFromStream(this.c.open(str), null);
        } catch (IOException e) {
            e.printStackTrace();
            return null;
        }
    }

    public Bitmap c(String str) {
        try {
            return BitmapFactory.decodeStream(this.c.open(str));
        } catch (IOException e) {
            e.printStackTrace();
            return null;
        }
    }
}
