###### Class com.WhistlePhoneLocator.WhistleDetectorEngine (com.WhistlePhoneLocator.WhistleDetectorEngine)
.class public Lcom/WhistlePhoneLocator/WhistleDetectorEngine;
.super Ljava/lang/Object;
.source "WhistleDetectorEngine.java"


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 16
    const-string v0, "ndk_whistle"

    invoke-static {v0}, Ljava/lang/System;->loadLibrary(Ljava/lang/String;)V

    .line 13
    return-void
.end method

.method public constructor <init>()V
    .registers 1

    .prologue
    .line 13
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public native WhistleProcessAndDetect([SS)I
.end method
