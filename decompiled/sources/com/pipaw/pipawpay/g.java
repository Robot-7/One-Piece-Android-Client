package com.pipaw.pipawpay;

import android.view.View;
import android.widget.AdapterView;

/* JADX INFO: loaded from: classes.dex */
class g implements AdapterView.OnItemClickListener {
    final /* synthetic */ PipawUserActivity a;

    g(PipawUserActivity pipawUserActivity) {
        this.a = pipawUserActivity;
    }

    @Override // android.widget.AdapterView.OnItemClickListener
    public void onItemClick(AdapterView adapterView, View view, int i, long j) {
        try {
            String str = (String) adapterView.getItemAtPosition(i);
            if (this.a.k != null) {
                this.a.k.setText(str);
                this.a.k.setSelection(str.length());
            }
            if (this.a.l != null) {
                String strB = a.b(this.a, str);
                this.a.l.setText(strB);
                this.a.l.setSelection(strB.length());
            }
            this.a.j.dismiss();
        } catch (Exception e) {
            com.pipaw.a.d.a(PipawUserActivity.a, e);
        }
    }
}
