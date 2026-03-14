package org.cocos2dx.lib;

import android.content.Context;
import android.graphics.Typeface;
import java.util.HashMap;

/* JADX INFO: loaded from: classes.dex */
public class Cocos2dxTypefaces {
    private static final HashMap<String, Typeface> sTypefaceCache = new HashMap<>();

    public static synchronized Typeface get(Context pContext, String pAssetName) {
        Typeface typeface;
        if (!sTypefaceCache.containsKey(pAssetName)) {
            if (pAssetName.startsWith("/")) {
                typeface = Typeface.createFromFile(pAssetName);
            } else {
                typeface = Typeface.createFromAsset(pContext.getAssets(), pAssetName);
            }
            sTypefaceCache.put(pAssetName, typeface);
        }
        return sTypefaceCache.get(pAssetName);
    }
}
