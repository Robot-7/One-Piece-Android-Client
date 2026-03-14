package com.igexin.download;

import android.database.CrossProcessCursor;
import android.database.Cursor;
import android.database.CursorWindow;
import android.database.CursorWrapper;

/* JADX INFO: loaded from: classes.dex */
class c extends CursorWrapper implements CrossProcessCursor {
    final /* synthetic */ DownloadProvider a;
    private CrossProcessCursor b;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public c(DownloadProvider downloadProvider, Cursor cursor) {
        super(cursor);
        this.a = downloadProvider;
        this.b = (CrossProcessCursor) cursor;
    }

    @Override // android.database.CrossProcessCursor
    public void fillWindow(int i, CursorWindow cursorWindow) {
        this.b.fillWindow(i, cursorWindow);
    }

    @Override // android.database.CrossProcessCursor
    public CursorWindow getWindow() {
        return this.b.getWindow();
    }

    @Override // android.database.CrossProcessCursor
    public boolean onMove(int i, int i2) {
        return this.b.onMove(i, i2);
    }
}
