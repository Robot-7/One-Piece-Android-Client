package com.igexin.sdk;

import android.app.Activity;
import android.content.Intent;
import android.content.res.Configuration;
import android.os.Bundle;
import android.view.KeyEvent;
import android.view.Menu;
import com.igexin.sdk.a.a;

/* JADX INFO: loaded from: classes.dex */
public class PushActivity extends Activity {
    @Override // android.app.Activity, android.content.ComponentCallbacks
    public void onConfigurationChanged(Configuration configuration) {
        super.onConfigurationChanged(configuration);
        if (a.a().b() != null) {
            a.a().b().onActivityConfigurationChanged(this, configuration);
        }
    }

    @Override // android.app.Activity
    protected void onCreate(Bundle bundle) {
        super.onCreate(bundle);
    }

    @Override // android.app.Activity
    public boolean onCreateOptionsMenu(Menu menu) {
        if (a.a().b() != null) {
            return a.a().b().onActivityCreateOptionsMenu(this, menu);
        }
        return true;
    }

    @Override // android.app.Activity
    protected void onDestroy() {
        super.onDestroy();
        if (a.a().b() != null) {
            a.a().b().onActivityDestroy(this);
        }
    }

    @Override // android.app.Activity, android.view.KeyEvent.Callback
    public boolean onKeyDown(int i, KeyEvent keyEvent) {
        if (a.a().b() == null || !a.a().b().onActivityKeyDown(this, i, keyEvent)) {
            return super.onKeyDown(i, keyEvent);
        }
        return true;
    }

    @Override // android.app.Activity
    protected void onNewIntent(Intent intent) {
        super.onNewIntent(intent);
        setIntent(intent);
        if (a.a().b() != null) {
            a.a().b().onActivityNewIntent(this, intent);
        }
    }

    @Override // android.app.Activity
    protected void onPause() {
        super.onPause();
        if (a.a().b() != null) {
            a.a().b().onActivityPause(this);
        }
    }

    @Override // android.app.Activity
    protected void onRestart() {
        super.onRestart();
        if (a.a().b() != null) {
            a.a().b().onActivityRestart(this);
        }
    }

    @Override // android.app.Activity
    protected void onResume() {
        super.onResume();
        if (a.a().b() != null) {
            a.a().b().onActivityResume(this);
        }
    }

    @Override // android.app.Activity
    protected void onStart() {
        super.onStart();
        if (a.a().b() != null) {
            a.a().b().onActivityStart(this, getIntent());
        }
    }

    @Override // android.app.Activity
    protected void onStop() {
        super.onStop();
        if (a.a().b() != null) {
            a.a().b().onActivityStop(this);
        }
    }
}
