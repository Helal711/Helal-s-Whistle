###### Class com.pad.android.util.AdUtilFuncs (com.pad.android.util.AdUtilFuncs)
.class public Lcom/pad/android/util/AdUtilFuncs;
.super Ljava/lang/Object;
.source "AdUtilFuncs.java"


# static fields
.field private static final LB_LOG:Ljava/lang/String; = "LBAdController"


# direct methods
.method public constructor <init>()V
    .registers 1

    .prologue
    .line 9
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static convertStreamToString(Ljava/io/InputStream;)Ljava/lang/String;
    .registers 7
    .param p0, "is"    # Ljava/io/InputStream;

    .prologue
    .line 20
    new-instance v2, Ljava/io/BufferedReader;

    new-instance v4, Ljava/io/InputStreamReader;

    invoke-direct {v4, p0}, Ljava/io/InputStreamReader;-><init>(Ljava/io/InputStream;)V

    const/16 v5, 0x2000

    invoke-direct {v2, v4, v5}, Ljava/io/BufferedReader;-><init>(Ljava/io/Reader;I)V

    .line 21
    .local v2, "reader":Ljava/io/BufferedReader;
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    .line 23
    .local v3, "sb":Ljava/lang/StringBuilder;
    const/4 v1, 0x0

    .line 26
    .local v1, "line":Ljava/lang/String;
    :goto_12
    :try_start_12
    invoke-virtual {v2}, Ljava/io/BufferedReader;->readLine()Ljava/lang/String;
    :try_end_15
    .catch Ljava/io/IOException; {:try_start_12 .. :try_end_15} :catch_37
    .catchall {:try_start_12 .. :try_end_15} :catchall_48

    move-result-object v1

    if-nez v1, :cond_20

    .line 39
    :try_start_18
    invoke-virtual {p0}, Ljava/io/InputStream;->close()V
    :try_end_1b
    .catch Ljava/io/IOException; {:try_start_18 .. :try_end_1b} :catch_54

    .line 46
    :goto_1b
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    return-object v4

    .line 28
    :cond_20
    :try_start_20
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-static {v1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v5

    invoke-direct {v4, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v5, "\n"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    :try_end_36
    .catch Ljava/io/IOException; {:try_start_20 .. :try_end_36} :catch_37
    .catchall {:try_start_20 .. :try_end_36} :catchall_48

    goto :goto_12

    .line 31
    :catch_37
    move-exception v0

    .line 33
    .local v0, "e":Ljava/io/IOException;
    :try_start_38
    const-string v4, "LBAdController"

    invoke-static {v4, v0}, Lcom/pad/android/util/AdLog;->printStackTrace(Ljava/lang/String;Ljava/lang/Exception;)V
    :try_end_3d
    .catchall {:try_start_38 .. :try_end_3d} :catchall_48

    .line 39
    :try_start_3d
    invoke-virtual {p0}, Ljava/io/InputStream;->close()V
    :try_end_40
    .catch Ljava/io/IOException; {:try_start_3d .. :try_end_40} :catch_41

    goto :goto_1b

    .line 41
    :catch_41
    move-exception v0

    .line 43
    const-string v4, "LBAdController"

    invoke-static {v4, v0}, Lcom/pad/android/util/AdLog;->printStackTrace(Ljava/lang/String;Ljava/lang/Exception;)V

    goto :goto_1b

    .line 36
    .end local v0    # "e":Ljava/io/IOException;
    :catchall_48
    move-exception v4

    .line 39
    :try_start_49
    invoke-virtual {p0}, Ljava/io/InputStream;->close()V
    :try_end_4c
    .catch Ljava/io/IOException; {:try_start_49 .. :try_end_4c} :catch_4d

    .line 45
    :goto_4c
    throw v4

    .line 41
    :catch_4d
    move-exception v0

    .line 43
    .restart local v0    # "e":Ljava/io/IOException;
    const-string v5, "LBAdController"

    invoke-static {v5, v0}, Lcom/pad/android/util/AdLog;->printStackTrace(Ljava/lang/String;Ljava/lang/Exception;)V

    goto :goto_4c

    .line 41
    .end local v0    # "e":Ljava/io/IOException;
    :catch_54
    move-exception v0

    .line 43
    .restart local v0    # "e":Ljava/io/IOException;
    const-string v4, "LBAdController"

    invoke-static {v4, v0}, Lcom/pad/android/util/AdLog;->printStackTrace(Ljava/lang/String;Ljava/lang/Exception;)V

    goto :goto_1b
.end method
