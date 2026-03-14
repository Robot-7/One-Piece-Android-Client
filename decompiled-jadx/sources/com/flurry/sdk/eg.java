package com.flurry.sdk;

import com.flurry.sdk.fd;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Iterator;
import java.util.concurrent.BlockingQueue;
import java.util.concurrent.Callable;
import java.util.concurrent.Future;
import java.util.concurrent.RunnableFuture;
import java.util.concurrent.ThreadPoolExecutor;
import java.util.concurrent.TimeUnit;

/* JADX INFO: loaded from: classes.dex */
public class eg<T extends fd> {
    private static final String a = eg.class.getSimpleName();
    private final ds<Object, T> b = new ds<>();
    private final HashMap<T, Object> c = new HashMap<>();
    private final HashMap<T, Future<?>> d = new HashMap<>();
    private final ThreadPoolExecutor e;

    public eg(String str, int i, int i2, long j, TimeUnit timeUnit, BlockingQueue<Runnable> blockingQueue) {
        this.e = new ThreadPoolExecutor(i, i2, j, timeUnit, blockingQueue) { // from class: com.flurry.sdk.eg.1
            @Override // java.util.concurrent.ThreadPoolExecutor
            protected void beforeExecute(Thread thread, Runnable runnable) {
                super.beforeExecute(thread, runnable);
                final fd fdVarA = eg.this.a(runnable);
                if (fdVarA != null) {
                    new fc() { // from class: com.flurry.sdk.eg.1.1
                        @Override // com.flurry.sdk.fc
                        public void a() {
                            fdVarA.j();
                        }
                    }.run();
                }
            }

            @Override // java.util.concurrent.ThreadPoolExecutor
            protected void afterExecute(Runnable runnable, Throwable th) {
                super.afterExecute(runnable, th);
                final fd fdVarA = eg.this.a(runnable);
                if (fdVarA != null) {
                    synchronized (eg.this.d) {
                        eg.this.d.remove(fdVarA);
                    }
                    eg.this.b(fdVarA);
                    new fc() { // from class: com.flurry.sdk.eg.1.2
                        @Override // com.flurry.sdk.fc
                        public void a() {
                            fdVarA.k();
                        }
                    }.run();
                }
            }

            @Override // java.util.concurrent.AbstractExecutorService
            protected <V> RunnableFuture<V> newTaskFor(Callable<V> callable) {
                throw new UnsupportedOperationException("Callable not supported");
            }

            @Override // java.util.concurrent.AbstractExecutorService
            protected <V> RunnableFuture<V> newTaskFor(Runnable runnable, V v) {
                ef efVar = new ef(runnable, v);
                synchronized (eg.this.d) {
                    eg.this.d.put((fd) runnable, efVar);
                }
                return efVar;
            }
        };
        this.e.setRejectedExecutionHandler(new ThreadPoolExecutor.DiscardPolicy() { // from class: com.flurry.sdk.eg.2
            @Override // java.util.concurrent.ThreadPoolExecutor.DiscardPolicy, java.util.concurrent.RejectedExecutionHandler
            public void rejectedExecution(Runnable runnable, ThreadPoolExecutor threadPoolExecutor) {
                super.rejectedExecution(runnable, threadPoolExecutor);
                final fd fdVarA = eg.this.a(runnable);
                if (fdVarA != null) {
                    synchronized (eg.this.d) {
                        eg.this.d.remove(fdVarA);
                    }
                    eg.this.b(fdVarA);
                    new fc() { // from class: com.flurry.sdk.eg.2.1
                        @Override // com.flurry.sdk.fc
                        public void a() {
                            fdVarA.l();
                        }
                    }.run();
                }
            }
        });
        this.e.setThreadFactory(new ew(str, 1));
    }

    public synchronized void a(Object obj, T t) {
        if (obj != null && t != null) {
            b(obj, t);
            this.e.submit(t);
        }
    }

    public synchronized void a(Object obj) {
        if (obj != null) {
            HashSet hashSet = new HashSet();
            hashSet.addAll(this.b.a(obj));
            Iterator it = hashSet.iterator();
            while (it.hasNext()) {
                a((fd) it.next());
            }
        }
    }

    public synchronized void a(final T t) {
        Future<?> futureRemove;
        if (t != null) {
            synchronized (this.d) {
                futureRemove = this.d.remove(t);
            }
            b((fd) t);
            if (futureRemove != null) {
                futureRemove.cancel(true);
            }
            new fc() { // from class: com.flurry.sdk.eg.3
                @Override // com.flurry.sdk.fc
                public void a() {
                    t.h();
                }
            }.run();
        }
    }

    public synchronized long b(Object obj) {
        return obj == null ? 0L : this.b.a(obj).size();
    }

    private synchronized void b(Object obj, T t) {
        this.b.a(obj, t);
        this.c.put(t, obj);
    }

    /* JADX INFO: Access modifiers changed from: private */
    public synchronized void b(T t) {
        c(this.c.get(t), t);
    }

    private synchronized void c(Object obj, T t) {
        this.b.b(obj, t);
        this.c.remove(t);
    }

    /* JADX INFO: Access modifiers changed from: private */
    public T a(Runnable runnable) {
        if (runnable instanceof ef) {
            return (T) ((ef) runnable).a();
        }
        if (runnable instanceof fd) {
            return (T) runnable;
        }
        el.a(6, a, "Unknown runnable class: " + runnable.getClass().getName());
        return null;
    }
}
