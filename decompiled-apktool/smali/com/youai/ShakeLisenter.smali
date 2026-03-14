.class public Lcom/youai/ShakeLisenter;
.super Ljava/lang/Object;
.source "ShakeLisenter.java"

# interfaces
.implements Landroid/hardware/SensorEventListener;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/youai/ShakeLisenter$OnShakeListener;
    }
.end annotation


# static fields
.field private static final SPEED_SHRESHOLD:I = 0x7d0

.field private static final UPTATE_INTERVAL_TIME:I = 0x46


# instance fields
.field private lastUpdateTime:J

.field private lastX:F

.field private lastY:F

.field private lastZ:F

.field private mContext:Landroid/content/Context;

.field private onShakeListener:Lcom/youai/ShakeLisenter$OnShakeListener;

.field private sensor:Landroid/hardware/Sensor;

.field private sensorManager:Landroid/hardware/SensorManager;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0
    .param p1, "c"    # Landroid/content/Context;

    .prologue
    .line 33
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 35
    iput-object p1, p0, Lcom/youai/ShakeLisenter;->mContext:Landroid/content/Context;

    .line 36
    invoke-virtual {p0}, Lcom/youai/ShakeLisenter;->start()V

    .line 37
    return-void
.end method


# virtual methods
.method public onAccuracyChanged(Landroid/hardware/Sensor;I)V
    .locals 0
    .param p1, "sensor"    # Landroid/hardware/Sensor;
    .param p2, "accuracy"    # I

    .prologue
    .line 104
    return-void
.end method

.method public onSensorChanged(Landroid/hardware/SensorEvent;)V
    .locals 17
    .param p1, "event"    # Landroid/hardware/SensorEvent;

    .prologue
    .line 69
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v1

    .line 71
    .local v1, "currentUpdateTime":J
    move-object/from16 v0, p0

    iget-wide v13, v0, Lcom/youai/ShakeLisenter;->lastUpdateTime:J

    sub-long v8, v1, v13

    .line 73
    .local v8, "timeInterval":J
    const-wide/16 v13, 0x46

    cmp-long v13, v8, v13

    if-gez v13, :cond_1

    .line 100
    :cond_0
    :goto_0
    return-void

    .line 76
    :cond_1
    move-object/from16 v0, p0

    iput-wide v1, v0, Lcom/youai/ShakeLisenter;->lastUpdateTime:J

    .line 79
    move-object/from16 v0, p1

    iget-object v13, v0, Landroid/hardware/SensorEvent;->values:[F

    const/4 v14, 0x0

    aget v10, v13, v14

    .line 80
    .local v10, "x":F
    move-object/from16 v0, p1

    iget-object v13, v0, Landroid/hardware/SensorEvent;->values:[F

    const/4 v14, 0x1

    aget v11, v13, v14

    .line 81
    .local v11, "y":F
    move-object/from16 v0, p1

    iget-object v13, v0, Landroid/hardware/SensorEvent;->values:[F

    const/4 v14, 0x2

    aget v12, v13, v14

    .line 84
    .local v12, "z":F
    move-object/from16 v0, p0

    iget v13, v0, Lcom/youai/ShakeLisenter;->lastX:F

    sub-float v3, v10, v13

    .line 85
    .local v3, "deltaX":F
    move-object/from16 v0, p0

    iget v13, v0, Lcom/youai/ShakeLisenter;->lastY:F

    sub-float v4, v11, v13

    .line 86
    .local v4, "deltaY":F
    move-object/from16 v0, p0

    iget v13, v0, Lcom/youai/ShakeLisenter;->lastZ:F

    sub-float v5, v12, v13

    .line 89
    .local v5, "deltaZ":F
    move-object/from16 v0, p0

    iput v10, v0, Lcom/youai/ShakeLisenter;->lastX:F

    .line 90
    move-object/from16 v0, p0

    iput v11, v0, Lcom/youai/ShakeLisenter;->lastY:F

    .line 91
    move-object/from16 v0, p0

    iput v12, v0, Lcom/youai/ShakeLisenter;->lastZ:F

    .line 93
    mul-float v13, v3, v3

    mul-float v14, v4, v4

    add-float/2addr v13, v14

    mul-float v14, v5, v5

    add-float/2addr v13, v14

    float-to-double v13, v13

    invoke-static {v13, v14}, Ljava/lang/Math;->sqrt(D)D

    move-result-wide v13

    long-to-double v15, v8

    div-double/2addr v13, v15

    const-wide v15, 0x40c3880000000000L    # 10000.0

    mul-double v6, v13, v15

    .line 97
    .local v6, "speed":D
    const-wide v13, 0x409f400000000000L    # 2000.0

    cmpl-double v13, v6, v13

    if-ltz v13, :cond_0

    .line 98
    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/youai/ShakeLisenter;->onShakeListener:Lcom/youai/ShakeLisenter$OnShakeListener;

    invoke-interface {v13}, Lcom/youai/ShakeLisenter$OnShakeListener;->onShake()V

    goto :goto_0
.end method

.method public setOnShakeListener(Lcom/youai/ShakeLisenter$OnShakeListener;)V
    .locals 0
    .param p1, "listener"    # Lcom/youai/ShakeLisenter$OnShakeListener;

    .prologue
    .line 63
    iput-object p1, p0, Lcom/youai/ShakeLisenter;->onShakeListener:Lcom/youai/ShakeLisenter$OnShakeListener;

    .line 64
    return-void
.end method

.method public start()V
    .locals 3

    .prologue
    const/4 v2, 0x1

    .line 42
    iget-object v0, p0, Lcom/youai/ShakeLisenter;->mContext:Landroid/content/Context;

    const-string v1, "sensor"

    invoke-virtual {v0, v1}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/hardware/SensorManager;

    iput-object v0, p0, Lcom/youai/ShakeLisenter;->sensorManager:Landroid/hardware/SensorManager;

    .line 44
    iget-object v0, p0, Lcom/youai/ShakeLisenter;->sensorManager:Landroid/hardware/SensorManager;

    if-eqz v0, :cond_0

    .line 46
    iget-object v0, p0, Lcom/youai/ShakeLisenter;->sensorManager:Landroid/hardware/SensorManager;

    invoke-virtual {v0, v2}, Landroid/hardware/SensorManager;->getDefaultSensor(I)Landroid/hardware/Sensor;

    move-result-object v0

    iput-object v0, p0, Lcom/youai/ShakeLisenter;->sensor:Landroid/hardware/Sensor;

    .line 49
    :cond_0
    iget-object v0, p0, Lcom/youai/ShakeLisenter;->sensor:Landroid/hardware/Sensor;

    if-eqz v0, :cond_1

    .line 50
    iget-object v0, p0, Lcom/youai/ShakeLisenter;->sensorManager:Landroid/hardware/SensorManager;

    iget-object v1, p0, Lcom/youai/ShakeLisenter;->sensor:Landroid/hardware/Sensor;

    invoke-virtual {v0, p0, v1, v2}, Landroid/hardware/SensorManager;->registerListener(Landroid/hardware/SensorEventListener;Landroid/hardware/Sensor;I)Z

    .line 54
    :cond_1
    return-void
.end method

.method public stop()V
    .locals 1

    .prologue
    .line 58
    iget-object v0, p0, Lcom/youai/ShakeLisenter;->sensorManager:Landroid/hardware/SensorManager;

    invoke-virtual {v0, p0}, Landroid/hardware/SensorManager;->unregisterListener(Landroid/hardware/SensorEventListener;)V

    .line 59
    return-void
.end method
