package com.youai.push.pushsdk;

import android.app.Activity;
import android.os.Bundle;
import android.view.Menu;
import com.example.pushsdk.R;

/* JADX INFO: loaded from: classes.dex */
public class MainActivity extends Activity {
    @Override // android.app.Activity
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);
        PushManager.getInstance().onCreate(getBaseContext());
    }

    @Override // android.app.Activity
    public boolean onCreateOptionsMenu(Menu menu) {
        getMenuInflater().inflate(R.menu.main, menu);
        return true;
    }
}
