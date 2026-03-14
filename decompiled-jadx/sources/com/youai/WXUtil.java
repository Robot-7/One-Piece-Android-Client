package com.youai;

import android.graphics.Bitmap;
import android.graphics.BitmapFactory;
import android.util.Log;
import com.tencent.stat.common.StatConstants;
import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.io.RandomAccessFile;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;
import java.net.URLConnection;
import junit.framework.Assert;

/* JADX INFO: loaded from: classes.dex */
public class WXUtil {
    private static final int MAX_DECODE_PICTURE_SIZE = 2764800;
    private static final String TAG = "WXUtil";

    public static byte[] bmpToByteArray(Bitmap bmp, boolean needRecycle) {
        ByteArrayOutputStream output = new ByteArrayOutputStream();
        bmp.compress(Bitmap.CompressFormat.PNG, 100, output);
        if (needRecycle) {
            bmp.recycle();
        }
        byte[] result = output.toByteArray();
        try {
            output.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return result;
    }

    public static byte[] getHtmlByteArray(String url) {
        URL htmlUrl;
        InputStream inStream = null;
        try {
            htmlUrl = new URL(url);
        } catch (MalformedURLException e) {
            e = e;
        } catch (IOException e2) {
            e = e2;
        }
        try {
            URLConnection connection = htmlUrl.openConnection();
            HttpURLConnection httpConnection = (HttpURLConnection) connection;
            int responseCode = httpConnection.getResponseCode();
            if (responseCode == 200) {
                inStream = httpConnection.getInputStream();
            }
        } catch (MalformedURLException e3) {
            e = e3;
            e.printStackTrace();
        } catch (IOException e4) {
            e = e4;
            e.printStackTrace();
        }
        byte[] data = inputStreamToByte(inStream);
        return data;
    }

    public static byte[] inputStreamToByte(InputStream is) {
        try {
            ByteArrayOutputStream bytestream = new ByteArrayOutputStream();
            while (true) {
                int ch = is.read();
                if (ch != -1) {
                    bytestream.write(ch);
                } else {
                    byte[] byteArray = bytestream.toByteArray();
                    bytestream.close();
                    return byteArray;
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }

    public static byte[] readFromFile(String fileName, int offset, int len) {
        if (fileName == null) {
            return null;
        }
        File file = new File(fileName);
        if (!file.exists()) {
            Log.i(TAG, "readFromFile: file not found");
            return null;
        }
        if (len == -1) {
            len = (int) file.length();
        }
        Log.d(TAG, "readFromFile : offset = " + offset + " len = " + len + " offset + len = " + (offset + len));
        if (offset < 0) {
            Log.e(TAG, "readFromFile invalid offset:" + offset);
            return null;
        }
        if (len <= 0) {
            Log.e(TAG, "readFromFile invalid len:" + len);
            return null;
        }
        if (offset + len > ((int) file.length())) {
            Log.e(TAG, "readFromFile invalid file len:" + file.length());
            return null;
        }
        byte[] b = null;
        try {
            RandomAccessFile in = new RandomAccessFile(fileName, "r");
            b = new byte[len];
            in.seek(offset);
            in.readFully(b);
            in.close();
            return b;
        } catch (Exception e) {
            Log.e(TAG, "readFromFile : errMsg = " + e.getMessage());
            e.printStackTrace();
            return b;
        }
    }

    public static Bitmap extractThumbNail(String path, int height, int width, boolean crop) {
        Bitmap cropped;
        Assert.assertTrue(path != null && !path.equals(StatConstants.MTA_COOPERATION_TAG) && height > 0 && width > 0);
        BitmapFactory.Options options = new BitmapFactory.Options();
        try {
            options.inJustDecodeBounds = true;
            Bitmap tmp = BitmapFactory.decodeFile(path, options);
            if (tmp != null) {
                tmp.recycle();
            }
            Log.d(TAG, "extractThumbNail: round=" + width + "x" + height + ", crop=" + crop);
            double beY = (((double) options.outHeight) * 1.0d) / ((double) height);
            double beX = (((double) options.outWidth) * 1.0d) / ((double) width);
            Log.d(TAG, "extractThumbNail: extract beX = " + beX + ", beY = " + beY);
            options.inSampleSize = (int) (crop ? beY > beX ? beX : beY : beY < beX ? beX : beY);
            if (options.inSampleSize <= 1) {
                options.inSampleSize = 1;
            }
            while ((options.outHeight * options.outWidth) / options.inSampleSize > MAX_DECODE_PICTURE_SIZE) {
                options.inSampleSize++;
            }
            int newHeight = height;
            int newWidth = width;
            if (crop) {
                if (beY > beX) {
                    newHeight = (int) (((((double) newWidth) * 1.0d) * ((double) options.outHeight)) / ((double) options.outWidth));
                } else {
                    newWidth = (int) (((((double) newHeight) * 1.0d) * ((double) options.outWidth)) / ((double) options.outHeight));
                }
            } else if (beY < beX) {
                newHeight = (int) (((((double) newWidth) * 1.0d) * ((double) options.outHeight)) / ((double) options.outWidth));
            } else {
                newWidth = (int) (((((double) newHeight) * 1.0d) * ((double) options.outWidth)) / ((double) options.outHeight));
            }
            options.inJustDecodeBounds = false;
            Log.i(TAG, "bitmap required size=" + newWidth + "x" + newHeight + ", orig=" + options.outWidth + "x" + options.outHeight + ", sample=" + options.inSampleSize);
            Bitmap bm = BitmapFactory.decodeFile(path, options);
            if (bm == null) {
                Log.e(TAG, "bitmap decode failed");
                return null;
            }
            Log.i(TAG, "bitmap decoded size=" + bm.getWidth() + "x" + bm.getHeight());
            Bitmap scale = Bitmap.createScaledBitmap(bm, newWidth, newHeight, true);
            if (scale != null) {
                bm.recycle();
                bm = scale;
            }
            if (!crop || (cropped = Bitmap.createBitmap(bm, (bm.getWidth() - width) >> 1, (bm.getHeight() - height) >> 1, width, height)) == null) {
                return bm;
            }
            bm.recycle();
            Log.i(TAG, "bitmap croped size=" + cropped.getWidth() + "x" + cropped.getHeight());
            return cropped;
        } catch (OutOfMemoryError e) {
            Log.e(TAG, "decode bitmap failed: " + e.getMessage());
            return null;
        }
    }
}
