package org.cocos2dx.lib;

import android.content.Context;
import android.graphics.Bitmap;
import android.graphics.Canvas;
import android.graphics.Paint;
import android.graphics.Rect;
import android.graphics.Typeface;
import android.support.v4.view.MotionEventCompat;
import android.text.TextPaint;
import android.text.TextUtils;
import android.util.FloatMath;
import android.util.Log;
import com.tencent.stat.common.StatConstants;
import java.nio.ByteBuffer;
import java.nio.ByteOrder;
import java.util.LinkedList;
import org.codehaus.jackson.util.MinimalPrettyPrinter;

/* JADX INFO: loaded from: classes.dex */
public class Cocos2dxBitmap {
    private static final int HORIZONTALALIGN_CENTER = 3;
    private static final int HORIZONTALALIGN_LEFT = 1;
    private static final int HORIZONTALALIGN_RIGHT = 2;
    private static final int VERTICALALIGN_BOTTOM = 2;
    private static final int VERTICALALIGN_CENTER = 3;
    private static final int VERTICALALIGN_TOP = 1;
    private static Context sContext;

    private static native void nativeInitBitmapDC(int i, int i2, byte[] bArr);

    public static void setContext(Context pContext) {
        sContext = pContext;
    }

    public static void createTextBitmap(String pString, String pFontName, int pFontSize, int pAlignment, int pWidth, int pHeight) {
        createTextBitmapShadowStroke(pString, pFontName, pFontSize, 1.0f, 1.0f, 1.0f, pAlignment, pWidth, pHeight, false, 0.0f, 0.0f, 0.0f, false, 1.0f, 1.0f, 1.0f, 1.0f, false, false);
    }

    public static void createTextBitmapShadowStroke(String pString, String pFontName, int pFontSize, float fontTintR, float fontTintG, float fontTintB, int pAlignment, int pWidth, int pHeight, boolean shadow, float shadowDX, float shadowDY, float shadowBlur, boolean stroke, float strokeR, float strokeG, float strokeB, float strokeSize, boolean bBold, boolean bUnderline) {
        int horizontalAlignment = pAlignment & 15;
        int verticalAlignment = (pAlignment >> 4) & 15;
        String pString2 = refactorString(pString);
        Paint paint = newPaint(pFontName, pFontSize, horizontalAlignment);
        paint.setFakeBoldText(bBold);
        paint.setUnderlineText(bUnderline);
        paint.setARGB(MotionEventCompat.ACTION_MASK, (int) (255.0d * ((double) fontTintR)), (int) (255.0d * ((double) fontTintG)), (int) (255.0d * ((double) fontTintB)));
        TextProperty textProperty = computeTextProperty(pString2, pWidth, pHeight, paint);
        int bitmapTotalHeight = pHeight == 0 ? textProperty.mTotalHeight : pHeight;
        float bitmapPaddingX = 0.0f;
        float bitmapPaddingY = 0.0f;
        float renderTextDeltaX = 0.0f;
        float renderTextDeltaY = 0.0f;
        if (shadow) {
            paint.setShadowLayer(shadowBlur, shadowDX, shadowDY, -8553091);
            bitmapPaddingX = Math.abs(shadowDX);
            bitmapPaddingY = Math.abs(shadowDY);
            if (shadowDX < 0.0d) {
                renderTextDeltaX = bitmapPaddingX;
            }
            if (shadowDY < 0.0d) {
                renderTextDeltaY = bitmapPaddingY;
            }
        }
        Bitmap bitmap = Bitmap.createBitmap(textProperty.mMaxWidth + ((int) bitmapPaddingX), ((int) bitmapPaddingY) + bitmapTotalHeight, Bitmap.Config.ARGB_8888);
        Canvas canvas = new Canvas(bitmap);
        Paint.FontMetricsInt fontMetricsInt = paint.getFontMetricsInt();
        int y = computeY(fontMetricsInt, pHeight, textProperty.mTotalHeight, verticalAlignment);
        String[] lines = textProperty.mLines;
        for (String line : lines) {
            int x = computeX(line, textProperty.mMaxWidth, horizontalAlignment);
            canvas.drawText(line, x + renderTextDeltaX, y + renderTextDeltaY, paint);
            y += textProperty.mHeightPerLine;
        }
        if (stroke) {
            Paint paintStroke = newPaint(pFontName, pFontSize, horizontalAlignment);
            paintStroke.setStyle(Paint.Style.STROKE);
            paintStroke.setStrokeWidth(0.5f * strokeSize);
            paintStroke.setARGB(MotionEventCompat.ACTION_MASK, ((int) strokeR) * MotionEventCompat.ACTION_MASK, ((int) strokeG) * MotionEventCompat.ACTION_MASK, ((int) strokeB) * MotionEventCompat.ACTION_MASK);
            int y2 = computeY(fontMetricsInt, pHeight, textProperty.mTotalHeight, verticalAlignment);
            String[] lines2 = textProperty.mLines;
            for (String line2 : lines2) {
                int x2 = computeX(line2, textProperty.mMaxWidth, horizontalAlignment);
                canvas.drawText(line2, x2 + renderTextDeltaX, y2 + renderTextDeltaY, paintStroke);
                y2 += textProperty.mHeightPerLine;
            }
        }
        initNativeObject(bitmap);
    }

    private static Paint newPaint(String pFontName, int pFontSize, int pHorizontalAlignment) {
        Paint paint = new Paint();
        paint.setColor(-1);
        paint.setTextSize(pFontSize);
        paint.setAntiAlias(true);
        if (pFontName.endsWith(".ttf")) {
            try {
                Typeface typeFace = Cocos2dxTypefaces.get(sContext, pFontName);
                paint.setTypeface(typeFace);
            } catch (Exception e) {
                Log.e("Cocos2dxBitmap", "error to create ttf type face: " + pFontName);
                paint.setTypeface(Typeface.create(pFontName, 0));
            }
        } else {
            paint.setTypeface(Typeface.create(pFontName, 0));
        }
        switch (pHorizontalAlignment) {
            case 2:
                paint.setTextAlign(Paint.Align.RIGHT);
                return paint;
            case 3:
                paint.setTextAlign(Paint.Align.CENTER);
                return paint;
            default:
                paint.setTextAlign(Paint.Align.LEFT);
                return paint;
        }
    }

    private static TextProperty computeTextProperty(String pString, int pWidth, int pHeight, Paint pPaint) {
        Paint.FontMetricsInt fm = pPaint.getFontMetricsInt();
        int h = (int) Math.ceil(fm.bottom - fm.top);
        int maxContentWidth = 0;
        String[] lines = splitString(pString, pWidth, pHeight, pPaint);
        if (pWidth != 0) {
            maxContentWidth = pWidth;
        } else {
            for (String line : lines) {
                int temp = (int) FloatMath.ceil(pPaint.measureText(line, 0, line.length()));
                if (temp > maxContentWidth) {
                    maxContentWidth = temp;
                }
            }
        }
        return new TextProperty(maxContentWidth, h, lines);
    }

    private static int computeX(String pText, int pMaxWidth, int pHorizontalAlignment) {
        switch (pHorizontalAlignment) {
            case 2:
                return pMaxWidth;
            case 3:
                int ret = pMaxWidth / 2;
                return ret;
            default:
                return 0;
        }
    }

    private static int computeY(Paint.FontMetricsInt pFontMetricsInt, int pConstrainHeight, int pTotalHeight, int pVerticalAlignment) {
        int y = -pFontMetricsInt.top;
        if (pConstrainHeight > pTotalHeight) {
            switch (pVerticalAlignment) {
            }
            return y;
        }
        return y;
    }

    private static String[] splitString(String pString, int pMaxWidth, int pMaxHeight, Paint pPaint) {
        String[] lines = pString.split("\\n");
        Paint.FontMetricsInt fm = pPaint.getFontMetricsInt();
        int heightPerLine = (int) Math.ceil(fm.bottom - fm.top);
        int maxLines = pMaxHeight / heightPerLine;
        if (pMaxWidth != 0) {
            LinkedList<String> strList = new LinkedList<>();
            for (String line : lines) {
                int lineWidth = (int) FloatMath.ceil(pPaint.measureText(line));
                if (lineWidth > pMaxWidth) {
                    strList.addAll(divideStringWithMaxWidth(line, pMaxWidth, pPaint));
                } else {
                    strList.add(line);
                }
                if (maxLines > 0 && strList.size() >= maxLines) {
                    break;
                }
            }
            if (maxLines > 0 && strList.size() > maxLines) {
                while (strList.size() > maxLines) {
                    strList.removeLast();
                }
            }
            String[] ret = new String[strList.size()];
            strList.toArray(ret);
            return ret;
        }
        if (pMaxHeight != 0 && lines.length > maxLines) {
            LinkedList<String> strList2 = new LinkedList<>();
            for (int i = 0; i < maxLines; i++) {
                strList2.add(lines[i]);
            }
            String[] ret2 = new String[strList2.size()];
            strList2.toArray(ret2);
            return ret2;
        }
        return lines;
    }

    private static LinkedList<String> divideStringWithMaxWidth(String pString, int pMaxWidth, Paint pPaint) {
        int charLength = pString.length();
        int start = 0;
        LinkedList<String> strList = new LinkedList<>();
        int i = 1;
        while (i <= charLength) {
            int tempWidth = (int) FloatMath.ceil(pPaint.measureText(pString, start, i));
            if (tempWidth >= pMaxWidth) {
                int lastIndexOfSpace = pString.substring(0, i).lastIndexOf(MinimalPrettyPrinter.DEFAULT_ROOT_VALUE_SEPARATOR);
                if (lastIndexOfSpace != -1 && lastIndexOfSpace > start) {
                    strList.add(pString.substring(start, lastIndexOfSpace));
                    i = lastIndexOfSpace + 1;
                } else if (tempWidth > pMaxWidth) {
                    strList.add(pString.substring(start, i - 1));
                    i--;
                } else {
                    strList.add(pString.substring(start, i));
                }
                while (i < charLength && pString.charAt(i) == ' ') {
                    i++;
                }
                start = i;
            }
            i++;
        }
        if (start < charLength) {
            strList.add(pString.substring(start));
        }
        return strList;
    }

    private static String refactorString(String pString) {
        if (pString.compareTo(StatConstants.MTA_COOPERATION_TAG) == 0) {
            return MinimalPrettyPrinter.DEFAULT_ROOT_VALUE_SEPARATOR;
        }
        StringBuilder strBuilder = new StringBuilder(pString);
        int start = 0;
        for (int index = strBuilder.indexOf("\n"); index != -1; index = strBuilder.indexOf("\n", start)) {
            if (index == 0 || strBuilder.charAt(index - 1) == '\n') {
                strBuilder.insert(start, MinimalPrettyPrinter.DEFAULT_ROOT_VALUE_SEPARATOR);
                start = index + 2;
            } else {
                start = index + 1;
            }
            if (start > strBuilder.length() || index == strBuilder.length()) {
                break;
            }
        }
        return strBuilder.toString();
    }

    private static void initNativeObject(Bitmap pBitmap) {
        byte[] pixels = getPixels(pBitmap);
        if (pixels != null) {
            nativeInitBitmapDC(pBitmap.getWidth(), pBitmap.getHeight(), pixels);
        }
    }

    private static byte[] getPixels(Bitmap pBitmap) {
        if (pBitmap == null) {
            return null;
        }
        byte[] pixels = new byte[pBitmap.getWidth() * pBitmap.getHeight() * 4];
        ByteBuffer buf = ByteBuffer.wrap(pixels);
        buf.order(ByteOrder.nativeOrder());
        pBitmap.copyPixelsToBuffer(buf);
        return pixels;
    }

    private static int getFontSizeAccordingHeight(int height) {
        Paint paint = new Paint();
        Rect bounds = new Rect();
        paint.setTypeface(Typeface.DEFAULT);
        int incr_text_size = 1;
        boolean found_desired_size = false;
        while (!found_desired_size) {
            paint.setTextSize(incr_text_size);
            paint.getTextBounds("SghMNy", 0, "SghMNy".length(), bounds);
            incr_text_size++;
            if (height - bounds.height() <= 2) {
                found_desired_size = true;
            }
            Log.d("font size", "incr size:" + incr_text_size);
        }
        return incr_text_size;
    }

    private static String getStringWithEllipsis(String pString, float width, float fontSize) {
        if (TextUtils.isEmpty(pString)) {
            return StatConstants.MTA_COOPERATION_TAG;
        }
        TextPaint paint = new TextPaint();
        paint.setTypeface(Typeface.DEFAULT);
        paint.setTextSize(fontSize);
        return TextUtils.ellipsize(pString, paint, width, TextUtils.TruncateAt.END).toString();
    }

    private static class TextProperty {
        private final int mHeightPerLine;
        private final String[] mLines;
        private final int mMaxWidth;
        private final int mTotalHeight;

        TextProperty(int pMaxWidth, int pHeightPerLine, String[] pLines) {
            this.mMaxWidth = pMaxWidth;
            this.mHeightPerLine = pHeightPerLine;
            this.mTotalHeight = pLines.length * pHeightPerLine;
            this.mLines = pLines;
        }
    }
}
