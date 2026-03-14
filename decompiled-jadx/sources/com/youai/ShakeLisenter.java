package com.youai;

import android.content.Context;
import android.hardware.Sensor;
import android.hardware.SensorEvent;
import android.hardware.SensorEventListener;
import android.hardware.SensorManager;

/* JADX INFO: loaded from: classes.dex */
public class ShakeLisenter implements SensorEventListener {
    private static final int SPEED_SHRESHOLD = 2000;
    private static final int UPTATE_INTERVAL_TIME = 70;
    private long lastUpdateTime;
    private float lastX;
    private float lastY;
    private float lastZ;
    private Context mContext;
    private OnShakeListener onShakeListener;
    private Sensor sensor;
    private SensorManager sensorManager;

    public interface OnShakeListener {
        void onShake();
    }

    public ShakeLisenter(Context c) {
        this.mContext = c;
        start();
    }

    public void start() {
        this.sensorManager = (SensorManager) this.mContext.getSystemService("sensor");
        if (this.sensorManager != null) {
            this.sensor = this.sensorManager.getDefaultSensor(1);
        }
        if (this.sensor != null) {
            this.sensorManager.registerListener(this, this.sensor, 1);
        }
    }

    public void stop() {
        this.sensorManager.unregisterListener(this);
    }

    public void setOnShakeListener(OnShakeListener listener) {
        this.onShakeListener = listener;
    }

    @Override // android.hardware.SensorEventListener
    public void onSensorChanged(SensorEvent event) {
        long currentUpdateTime = System.currentTimeMillis();
        long timeInterval = currentUpdateTime - this.lastUpdateTime;
        if (timeInterval >= 70) {
            this.lastUpdateTime = currentUpdateTime;
            float x = event.values[0];
            float y = event.values[1];
            float z = event.values[2];
            float deltaX = x - this.lastX;
            float deltaY = y - this.lastY;
            float deltaZ = z - this.lastZ;
            this.lastX = x;
            this.lastY = y;
            this.lastZ = z;
            double speed = (Math.sqrt(((deltaX * deltaX) + (deltaY * deltaY)) + (deltaZ * deltaZ)) / timeInterval) * 10000.0d;
            if (speed >= 2000.0d) {
                this.onShakeListener.onShake();
            }
        }
    }

    @Override // android.hardware.SensorEventListener
    public void onAccuracyChanged(Sensor sensor, int accuracy) {
    }
}
