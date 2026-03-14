package com.flurry.sdk;

import java.util.concurrent.PriorityBlockingQueue;
import java.util.concurrent.TimeUnit;

/* JADX INFO: loaded from: classes.dex */
public final class ej extends eg<ek> {
    private static ej a = null;

    public static synchronized ej a() {
        if (a == null) {
            a = new ej();
        }
        return a;
    }

    protected ej() {
        super(ej.class.getName(), 0, 5, 5000L, TimeUnit.MILLISECONDS, new PriorityBlockingQueue(11, new ee()));
    }
}
