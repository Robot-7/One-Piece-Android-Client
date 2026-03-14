package android.support.v4.widget;

import android.content.Context;
import android.view.View;
import android.widget.SearchView;
import com.tencent.stat.common.StatConstants;

/* JADX INFO: loaded from: classes.dex */
class SearchViewCompatIcs {
    SearchViewCompatIcs() {
    }

    public static class MySearchView extends SearchView {
        public MySearchView(Context context) {
            super(context);
        }

        @Override // android.widget.SearchView, android.view.CollapsibleActionView
        public void onActionViewCollapsed() {
            setQuery(StatConstants.MTA_COOPERATION_TAG, false);
            super.onActionViewCollapsed();
        }
    }

    public static View newSearchView(Context context) {
        return new MySearchView(context);
    }

    public static void setImeOptions(View searchView, int imeOptions) {
        ((SearchView) searchView).setImeOptions(imeOptions);
    }

    public static void setInputType(View searchView, int inputType) {
        ((SearchView) searchView).setInputType(inputType);
    }
}
