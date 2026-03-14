package com.pipaw.pipawpay;

import android.content.Context;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.BaseAdapter;
import android.widget.ImageView;
import android.widget.TextView;
import java.util.List;

/* JADX INFO: loaded from: classes.dex */
public class l extends BaseAdapter {
    final /* synthetic */ PipawUserActivity a;
    private Context b;
    private LayoutInflater c;
    private List d;

    public l(PipawUserActivity pipawUserActivity, Context context, List list) {
        this.a = pipawUserActivity;
        this.b = context;
        this.c = LayoutInflater.from(context);
        this.d = list;
    }

    @Override // android.widget.Adapter
    public int getCount() {
        return this.d.size();
    }

    @Override // android.widget.Adapter
    public Object getItem(int i) {
        return this.d.get(i);
    }

    @Override // android.widget.Adapter
    public long getItemId(int i) {
        return i;
    }

    @Override // android.widget.Adapter
    public View getView(int i, View view, ViewGroup viewGroup) {
        n nVar;
        if (view == null) {
            view = this.c.inflate(com.pipaw.a.h.c(this.b, "pipaw_user_item"), (ViewGroup) null);
            nVar = new n(this, null);
            nVar.a = (TextView) view.findViewById(com.pipaw.a.h.b(this.b, "username_tv"));
            nVar.b = (ImageView) view.findViewById(com.pipaw.a.h.b(this.b, "delete_iv"));
            view.setTag(nVar);
        } else {
            nVar = (n) view.getTag();
        }
        String str = (String) this.d.get(i);
        nVar.a.setText(str);
        nVar.b.setOnClickListener(new m(this, str));
        return view;
    }
}
