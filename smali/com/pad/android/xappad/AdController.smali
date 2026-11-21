###### Class com.pad.android.xappad.AdController (com.pad.android.xappad.AdController)
.class public Lcom/pad/android/xappad/AdController;
.super Ljava/lang/Object;
.source "AdController.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/pad/android/xappad/AdController$AdIcon;
    }
.end annotation


# static fields
.field public static final LB_LOG:Ljava/lang/String; = "LBAdController"

.field public static final SDK_LEVEL:Ljava/lang/String; = "06b"

.field public static final SDK_VERSION:Ljava/lang/String; = "3"


# instance fields
.field private final MAX_APP_ICONS:I

.field private am:Landroid/app/AlarmManager;

.field private context:Landroid/content/Context;

.field private initialized:Z

.field private listenNotif:Lcom/pad/android/listener/AdNotificationListener;

.field private loadIcon:Z

.field private notificationLaunchType:Ljava/lang/String;

.field private onRequest:Z

.field private onTimer:Z

.field private pendingAlarmIntent:Landroid/app/PendingIntent;

.field private results:Lorg/json/JSONObject;

.field private sectionid:Ljava/lang/String;

.field private useNotification:Z


# direct methods
.method public constructor <init>(Landroid/content/Context;Ljava/lang/String;)V
    .registers 5
    .param p1, "ctx"    # Landroid/content/Context;
    .param p2, "sid"    # Ljava/lang/String;

    .prologue
    const/4 v1, 0x0

    .line 67
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 41
    const/4 v0, 0x5

    iput v0, p0, Lcom/pad/android/xappad/AdController;->MAX_APP_ICONS:I

    .line 48
    iput-boolean v1, p0, Lcom/pad/android/xappad/AdController;->initialized:Z

    .line 50
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/pad/android/xappad/AdController;->results:Lorg/json/JSONObject;

    .line 52
    iput-boolean v1, p0, Lcom/pad/android/xappad/AdController;->useNotification:Z

    .line 53
    iput-boolean v1, p0, Lcom/pad/android/xappad/AdController;->onTimer:Z

    .line 54
    iput-boolean v1, p0, Lcom/pad/android/xappad/AdController;->onRequest:Z

    .line 55
    iput-boolean v1, p0, Lcom/pad/android/xappad/AdController;->loadIcon:Z

    .line 69
    iput-object p1, p0, Lcom/pad/android/xappad/AdController;->context:Landroid/content/Context;

    .line 70
    iput-object p2, p0, Lcom/pad/android/xappad/AdController;->sectionid:Ljava/lang/String;

    .line 71
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Ljava/lang/String;Lcom/pad/android/listener/AdNotificationListener;)V
    .registers 4
    .param p1, "ctx"    # Landroid/content/Context;
    .param p2, "sid"    # Ljava/lang/String;
    .param p3, "lt"    # Lcom/pad/android/listener/AdNotificationListener;

    .prologue
    .line 97
    invoke-direct {p0, p1, p2}, Lcom/pad/android/xappad/AdController;-><init>(Landroid/content/Context;Ljava/lang/String;)V

    .line 98
    iput-object p3, p0, Lcom/pad/android/xappad/AdController;->listenNotif:Lcom/pad/android/listener/AdNotificationListener;

    .line 99
    return-void
.end method

.method static synthetic access$0(Lcom/pad/android/xappad/AdController;)Lorg/json/JSONObject;
    .registers 2

    .prologue
    .line 50
    iget-object v0, p0, Lcom/pad/android/xappad/AdController;->results:Lorg/json/JSONObject;

    return-object v0
.end method

.method static synthetic access$1(Lcom/pad/android/xappad/AdController;)Landroid/content/Context;
    .registers 2

    .prologue
    .line 45
    iget-object v0, p0, Lcom/pad/android/xappad/AdController;->context:Landroid/content/Context;

    return-object v0
.end method

.method static synthetic access$2(Lcom/pad/android/xappad/AdController;)Ljava/lang/String;
    .registers 2

    .prologue
    .line 46
    iget-object v0, p0, Lcom/pad/android/xappad/AdController;->sectionid:Ljava/lang/String;

    return-object v0
.end method

.method private displayIcon()V
    .registers 5

    .prologue
    .line 896
    const-string v2, "LBAdController"

    const-string v3, "displayIcon called"

    invoke-static {v2, v3}, Lcom/pad/android/util/AdLog;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 897
    iget-object v2, p0, Lcom/pad/android/xappad/AdController;->results:Lorg/json/JSONObject;

    if-nez v2, :cond_13

    .line 899
    const-string v2, "LBAdController"

    const-string v3, "Results are null - no icon will be loaded"

    invoke-static {v2, v3}, Lcom/pad/android/util/AdLog;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 915
    :cond_12
    :goto_12
    return-void

    .line 905
    :cond_13
    :try_start_13
    iget-object v2, p0, Lcom/pad/android/xappad/AdController;->results:Lorg/json/JSONObject;

    const-string v3, "show"

    invoke-virtual {v2, v3}, Lorg/json/JSONObject;->get(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v2

    const-string v3, "1"

    invoke-virtual {v2, v3}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_12

    iget-object v2, p0, Lcom/pad/android/xappad/AdController;->context:Landroid/content/Context;

    if-eqz v2, :cond_12

    .line 907
    new-instance v1, Lcom/pad/android/xappad/AdController$AdIcon;

    const/4 v2, 0x0

    invoke-direct {v1, p0, v2}, Lcom/pad/android/xappad/AdController$AdIcon;-><init>(Lcom/pad/android/xappad/AdController;Lcom/pad/android/xappad/AdController$AdIcon;)V

    .line 908
    .local v1, "ic":Lcom/pad/android/xappad/AdController$AdIcon;
    const/4 v2, 0x0

    new-array v2, v2, [Ljava/lang/Void;

    invoke-virtual {v1, v2}, Lcom/pad/android/xappad/AdController$AdIcon;->execute([Ljava/lang/Object;)Landroid/os/AsyncTask;
    :try_end_33
    .catch Ljava/lang/Exception; {:try_start_13 .. :try_end_33} :catch_34

    goto :goto_12

    .line 911
    .end local v1    # "ic":Lcom/pad/android/xappad/AdController$AdIcon;
    :catch_34
    move-exception v0

    .line 913
    .local v0, "e":Ljava/lang/Exception;
    const-string v2, "LBAdController"

    invoke-static {v2, v0}, Lcom/pad/android/util/AdLog;->printStackTrace(Ljava/lang/String;Ljava/lang/Exception;)V

    goto :goto_12
.end method

.method private incrementIterationCounter()V
    .registers 7

    .prologue
    .line 847
    const-string v3, "LBAdController"

    const-string v4, "increment counter called"

    invoke-static {v3, v4}, Lcom/pad/android/util/AdLog;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 849
    iget-object v3, p0, Lcom/pad/android/xappad/AdController;->context:Landroid/content/Context;

    const-string v4, "Preference"

    const/4 v5, 0x2

    invoke-virtual {v3, v4, v5}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v2

    .line 850
    .local v2, "pref":Landroid/content/SharedPreferences;
    invoke-interface {v2}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    .line 852
    .local v0, "editor":Landroid/content/SharedPreferences$Editor;
    new-instance v3, Ljava/lang/StringBuilder;

    const-string v4, "SD_ITERATION_COUNTER_"

    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v4, p0, Lcom/pad/android/xappad/AdController;->sectionid:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    const-string v4, "0"

    invoke-interface {v2, v3, v4}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(Ljava/lang/String;)Ljava/lang/Integer;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/Integer;->intValue()I

    move-result v1

    .line 853
    .local v1, "iterationcounter":I
    new-instance v3, Ljava/lang/StringBuilder;

    const-string v4, "SD_ITERATION_COUNTER_"

    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v4, p0, Lcom/pad/android/xappad/AdController;->sectionid:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    add-int/lit8 v5, v1, 0x1

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-interface {v0, v3, v4}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    .line 854
    invoke-interface {v0}, Landroid/content/SharedPreferences$Editor;->commit()Z

    .line 855
    return-void
.end method

.method private invalidateOptin()V
    .registers 7

    .prologue
    .line 233
    iget-object v3, p0, Lcom/pad/android/xappad/AdController;->results:Lorg/json/JSONObject;

    if-eqz v3, :cond_37

    iget-object v3, p0, Lcom/pad/android/xappad/AdController;->results:Lorg/json/JSONObject;

    const-string v4, "invalidateoptin"

    invoke-virtual {v3, v4}, Lorg/json/JSONObject;->isNull(Ljava/lang/String;)Z

    move-result v3

    if-nez v3, :cond_37

    .line 235
    const-string v1, "0"

    .line 238
    .local v1, "invalidate":Ljava/lang/String;
    :try_start_10
    iget-object v3, p0, Lcom/pad/android/xappad/AdController;->results:Lorg/json/JSONObject;

    const-string v4, "invalidateoptin"

    invoke-virtual {v3, v4}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;
    :try_end_17
    .catch Ljava/lang/Exception; {:try_start_10 .. :try_end_17} :catch_38

    move-result-object v1

    .line 240
    :goto_18
    const-string v3, "1"

    invoke-virtual {v1, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_37

    .line 242
    iget-object v3, p0, Lcom/pad/android/xappad/AdController;->context:Landroid/content/Context;

    const-string v4, "Preference"

    const/4 v5, 0x2

    invoke-virtual {v3, v4, v5}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v2

    .line 243
    .local v2, "pref":Landroid/content/SharedPreferences;
    invoke-interface {v2}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    .line 244
    .local v0, "editor":Landroid/content/SharedPreferences$Editor;
    const-string v3, "SD_APP_OPTIN_SHOWN"

    const-string v4, "invalid"

    invoke-interface {v0, v3, v4}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    .line 245
    invoke-interface {v0}, Landroid/content/SharedPreferences$Editor;->commit()Z

    .line 248
    .end local v0    # "editor":Landroid/content/SharedPreferences$Editor;
    .end local v1    # "invalidate":Ljava/lang/String;
    .end local v2    # "pref":Landroid/content/SharedPreferences;
    :cond_37
    return-void

    .line 239
    .restart local v1    # "invalidate":Ljava/lang/String;
    :catch_38
    move-exception v3

    goto :goto_18
.end method

.method private loadNotificationDetails()V
    .registers 25

    .prologue
    .line 721
    const-string v20, "LBAdController"

    const-string v21, "loadNotificationDetails called"

    invoke-static/range {v20 .. v21}, Lcom/pad/android/util/AdLog;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 722
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/pad/android/xappad/AdController;->results:Lorg/json/JSONObject;

    move-object/from16 v20, v0

    if-nez v20, :cond_17

    .line 724
    const-string v20, "LBAdController"

    const-string v21, "Notification will not be loaded - no internet connection"

    invoke-static/range {v20 .. v21}, Lcom/pad/android/util/AdLog;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 843
    :cond_16
    :goto_16
    return-void

    .line 730
    :cond_17
    :try_start_17
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/pad/android/xappad/AdController;->results:Lorg/json/JSONObject;

    move-object/from16 v20, v0

    const-string v21, "show"

    invoke-virtual/range {v20 .. v21}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v20

    const-string v21, "1"

    invoke-virtual/range {v20 .. v21}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v20

    if-eqz v20, :cond_1c8

    .line 732
    const-string v20, "LBAdController"

    const-string v21, "notification to be fired"

    invoke-static/range {v20 .. v21}, Lcom/pad/android/util/AdLog;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 734
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/pad/android/xappad/AdController;->context:Landroid/content/Context;

    move-object/from16 v20, v0

    const-string v21, "notification"

    invoke-virtual/range {v20 .. v21}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v14

    check-cast v14, Landroid/app/NotificationManager;

    .line 735
    .local v14, "notificationManager":Landroid/app/NotificationManager;
    const/16 v20, 0x5

    move/from16 v0, v20

    new-array v9, v0, [I
    :try_end_46
    .catch Ljava/lang/Exception; {:try_start_17 .. :try_end_46} :catch_212
    .catchall {:try_start_17 .. :try_end_46} :catchall_260

    fill-array-data v9, :array_2ac

    .line 738
    .local v9, "iconArray":[I
    const/4 v8, 0x0

    .line 741
    .local v8, "icon":I
    :try_start_4a
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/pad/android/xappad/AdController;->results:Lorg/json/JSONObject;

    move-object/from16 v20, v0

    const-string v21, "notificationicon"

    invoke-virtual/range {v20 .. v21}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I
    :try_end_55
    .catch Ljava/lang/Exception; {:try_start_4a .. :try_end_55} :catch_208
    .catchall {:try_start_4a .. :try_end_55} :catchall_20e

    move-result v8

    .line 749
    :try_start_56
    aget v8, v9, v8

    .line 751
    :goto_58
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/pad/android/xappad/AdController;->results:Lorg/json/JSONObject;

    move-object/from16 v20, v0

    const-string v21, "notificationtext"

    invoke-virtual/range {v20 .. v21}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v16

    .line 752
    .local v16, "text":Ljava/lang/CharSequence;
    const-string v10, ""
    :try_end_66
    .catch Ljava/lang/Exception; {:try_start_56 .. :try_end_66} :catch_212
    .catchall {:try_start_56 .. :try_end_66} :catchall_260

    .line 755
    .local v10, "instruction":Ljava/lang/CharSequence;
    :try_start_66
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/pad/android/xappad/AdController;->results:Lorg/json/JSONObject;

    move-object/from16 v20, v0

    const-string v21, "notificationinstruction"

    invoke-virtual/range {v20 .. v21}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;
    :try_end_71
    .catch Ljava/lang/Exception; {:try_start_66 .. :try_end_71} :catch_2a8
    .catchall {:try_start_66 .. :try_end_71} :catchall_260

    move-result-object v10

    .line 758
    :goto_72
    :try_start_72
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/pad/android/xappad/AdController;->results:Lorg/json/JSONObject;

    move-object/from16 v20, v0

    const-string v21, "notificationtext"

    invoke-virtual/range {v20 .. v21}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    .line 759
    .local v5, "contentTitle":Ljava/lang/CharSequence;
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/pad/android/xappad/AdController;->results:Lorg/json/JSONObject;

    move-object/from16 v20, v0

    const-string v21, "notificationdescription"

    invoke-virtual/range {v20 .. v21}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;
    :try_end_89
    .catch Ljava/lang/Exception; {:try_start_72 .. :try_end_89} :catch_212
    .catchall {:try_start_72 .. :try_end_89} :catchall_260

    move-result-object v4

    .line 763
    .local v4, "contentText":Ljava/lang/CharSequence;
    :try_start_8a
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/pad/android/xappad/AdController;->results:Lorg/json/JSONObject;

    move-object/from16 v20, v0

    const-string v21, "notificationdisplay"

    invoke-virtual/range {v20 .. v21}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v17

    .line 764
    .local v17, "toUseText":Ljava/lang/String;
    const-string v20, ""

    move-object/from16 v0, v17

    move-object/from16 v1, v20

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v20

    if-nez v20, :cond_25a

    .line 766
    const-string v20, "notificationtext"

    move-object/from16 v0, v17

    move-object/from16 v1, v20

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v20

    if-eqz v20, :cond_bd

    .line 768
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/pad/android/xappad/AdController;->results:Lorg/json/JSONObject;

    move-object/from16 v20, v0

    move-object/from16 v0, v20

    move-object/from16 v1, v17

    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;
    :try_end_bb
    .catch Ljava/lang/Exception; {:try_start_8a .. :try_end_bb} :catch_2a5
    .catchall {:try_start_8a .. :try_end_bb} :catchall_260

    move-result-object v5

    .line 769
    move-object v4, v10

    .line 780
    .end local v17    # "toUseText":Ljava/lang/String;
    :cond_bd
    :goto_bd
    :try_start_bd
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v18

    .line 781
    .local v18, "when":J
    new-instance v11, Landroid/content/Intent;

    const-string v20, "android.intent.action.VIEW"

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/pad/android/xappad/AdController;->results:Lorg/json/JSONObject;

    move-object/from16 v21, v0

    const-string v22, "notificationurl"

    invoke-virtual/range {v21 .. v22}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v21

    invoke-static/range {v21 .. v21}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v21

    move-object/from16 v0, v20

    move-object/from16 v1, v21

    invoke-direct {v11, v0, v1}, Landroid/content/Intent;-><init>(Ljava/lang/String;Landroid/net/Uri;)V

    .line 782
    .local v11, "intent":Landroid/content/Intent;
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/pad/android/xappad/AdController;->context:Landroid/content/Context;

    move-object/from16 v20, v0

    const/16 v21, 0x0

    const/16 v22, 0x0

    move-object/from16 v0, v20

    move/from16 v1, v21

    move/from16 v2, v22

    invoke-static {v0, v1, v11, v2}, Landroid/app/PendingIntent;->getActivity(Landroid/content/Context;ILandroid/content/Intent;I)Landroid/app/PendingIntent;

    move-result-object v3

    .line 783
    .local v3, "contentIntent":Landroid/app/PendingIntent;
    new-instance v13, Landroid/app/Notification;

    move-object/from16 v0, v16

    move-wide/from16 v1, v18

    invoke-direct {v13, v8, v0, v1, v2}, Landroid/app/Notification;-><init>(ILjava/lang/CharSequence;J)V

    .line 784
    .local v13, "notification":Landroid/app/Notification;
    iget v0, v13, Landroid/app/Notification;->flags:I

    move/from16 v20, v0

    or-int/lit8 v20, v20, 0x10

    move/from16 v0, v20

    iput v0, v13, Landroid/app/Notification;->flags:I

    .line 786
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/pad/android/xappad/AdController;->context:Landroid/content/Context;

    move-object/from16 v20, v0

    move-object/from16 v0, v20

    invoke-virtual {v13, v0, v5, v4, v3}, Landroid/app/Notification;->setLatestEventInfo(Landroid/content/Context;Ljava/lang/CharSequence;Ljava/lang/CharSequence;Landroid/app/PendingIntent;)V

    .line 789
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/pad/android/xappad/AdController;->context:Landroid/content/Context;

    move-object/from16 v20, v0

    const-string v21, "Preference"

    const/16 v22, 0x2

    invoke-virtual/range {v20 .. v22}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v15

    .line 790
    .local v15, "pref":Landroid/content/SharedPreferences;
    invoke-interface {v15}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v7

    .line 791
    .local v7, "editor":Landroid/content/SharedPreferences$Editor;
    new-instance v20, Ljava/lang/StringBuilder;

    const-string v21, "SD_NOTIFICATION_ID_"

    invoke-direct/range {v20 .. v21}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/pad/android/xappad/AdController;->sectionid:Ljava/lang/String;

    move-object/from16 v21, v0

    invoke-virtual/range {v20 .. v21}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v20

    invoke-virtual/range {v20 .. v20}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v20

    const/16 v21, 0x0

    move-object/from16 v0, v20

    move/from16 v1, v21

    invoke-interface {v15, v0, v1}, Landroid/content/SharedPreferences;->getInt(Ljava/lang/String;I)I

    move-result v12

    .line 792
    .local v12, "lastid":I
    const-string v20, "LBAdController"

    new-instance v21, Ljava/lang/StringBuilder;

    const-string v22, "Stored Pref - "

    invoke-direct/range {v21 .. v22}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    move-object/from16 v0, v21

    invoke-virtual {v0, v12}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v21

    invoke-virtual/range {v21 .. v21}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v21

    invoke-static/range {v20 .. v21}, Lcom/pad/android/util/AdLog;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 793
    if-nez v12, :cond_159

    .line 795
    const/16 v12, 0x2711

    .line 799
    :cond_159
    const/16 v20, 0x3e9

    move/from16 v0, v20

    invoke-virtual {v14, v0, v13}, Landroid/app/NotificationManager;->notify(ILandroid/app/Notification;)V
    :try_end_160
    .catch Ljava/lang/Exception; {:try_start_bd .. :try_end_160} :catch_212
    .catchall {:try_start_bd .. :try_end_160} :catchall_260

    .line 802
    :try_start_160
    new-instance v20, Ljava/lang/StringBuilder;

    const-string v21, "SD_NOTIFICATION_FIRED_"

    invoke-direct/range {v20 .. v21}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/pad/android/xappad/AdController;->sectionid:Ljava/lang/String;

    move-object/from16 v21, v0

    invoke-virtual/range {v20 .. v21}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v20

    invoke-virtual/range {v20 .. v20}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v20

    move-object/from16 v0, v20

    move-wide/from16 v1, v18

    invoke-interface {v7, v0, v1, v2}, Landroid/content/SharedPreferences$Editor;->putLong(Ljava/lang/String;J)Landroid/content/SharedPreferences$Editor;

    .line 803
    invoke-interface {v7}, Landroid/content/SharedPreferences$Editor;->commit()Z
    :try_end_17f
    .catch Ljava/lang/Exception; {:try_start_160 .. :try_end_17f} :catch_2a2
    .catchall {:try_start_160 .. :try_end_17f} :catchall_260

    .line 806
    :goto_17f
    :try_start_17f
    const-string v20, "LBAdController"

    new-instance v21, Ljava/lang/StringBuilder;

    const-string v22, "New Notification created with ID - "

    invoke-direct/range {v21 .. v22}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    move-object/from16 v0, v21

    invoke-virtual {v0, v12}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v21

    invoke-virtual/range {v21 .. v21}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v21

    invoke-static/range {v20 .. v21}, Lcom/pad/android/util/AdLog;->d(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_195
    .catch Ljava/lang/Exception; {:try_start_17f .. :try_end_195} :catch_212
    .catchall {:try_start_17f .. :try_end_195} :catchall_260

    .line 810
    :try_start_195
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/pad/android/xappad/AdController;->results:Lorg/json/JSONObject;

    move-object/from16 v20, v0

    const-string v21, "notificationmultiple"

    invoke-virtual/range {v20 .. v21}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v20

    const-string v21, "1"

    invoke-virtual/range {v20 .. v21}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v20

    if-eqz v20, :cond_1c8

    .line 813
    new-instance v20, Ljava/lang/StringBuilder;

    const-string v21, "SD_NOTIFICATION_ID_"

    invoke-direct/range {v20 .. v21}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/pad/android/xappad/AdController;->sectionid:Ljava/lang/String;

    move-object/from16 v21, v0

    invoke-virtual/range {v20 .. v21}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v20

    invoke-virtual/range {v20 .. v20}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v20

    add-int/lit8 v12, v12, 0x1

    move-object/from16 v0, v20

    invoke-interface {v7, v0, v12}, Landroid/content/SharedPreferences$Editor;->putInt(Ljava/lang/String;I)Landroid/content/SharedPreferences$Editor;

    .line 814
    invoke-interface {v7}, Landroid/content/SharedPreferences$Editor;->commit()Z
    :try_end_1c8
    .catch Ljava/lang/Exception; {:try_start_195 .. :try_end_1c8} :catch_29f
    .catchall {:try_start_195 .. :try_end_1c8} :catchall_260

    .line 828
    .end local v3    # "contentIntent":Landroid/app/PendingIntent;
    .end local v4    # "contentText":Ljava/lang/CharSequence;
    .end local v5    # "contentTitle":Ljava/lang/CharSequence;
    .end local v7    # "editor":Landroid/content/SharedPreferences$Editor;
    .end local v8    # "icon":I
    .end local v9    # "iconArray":[I
    .end local v10    # "instruction":Ljava/lang/CharSequence;
    .end local v11    # "intent":Landroid/content/Intent;
    .end local v12    # "lastid":I
    .end local v13    # "notification":Landroid/app/Notification;
    .end local v14    # "notificationManager":Landroid/app/NotificationManager;
    .end local v15    # "pref":Landroid/content/SharedPreferences;
    .end local v16    # "text":Ljava/lang/CharSequence;
    .end local v18    # "when":J
    :cond_1c8
    :goto_1c8
    invoke-direct/range {p0 .. p0}, Lcom/pad/android/xappad/AdController;->incrementIterationCounter()V

    .line 831
    :try_start_1cb
    move-object/from16 v0, p0

    iget-boolean v0, v0, Lcom/pad/android/xappad/AdController;->onTimer:Z

    move/from16 v20, v0

    if-nez v20, :cond_1e1

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/pad/android/xappad/AdController;->notificationLaunchType:Ljava/lang/String;

    move-object/from16 v20, v0

    const-string v21, "Alarm"

    invoke-virtual/range {v20 .. v21}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v20

    if-eqz v20, :cond_16

    .line 833
    :cond_1e1
    invoke-direct/range {p0 .. p0}, Lcom/pad/android/xappad/AdController;->setAlarm()V
    :try_end_1e4
    .catch Ljava/lang/Exception; {:try_start_1cb .. :try_end_1e4} :catch_1e6

    goto/16 :goto_16

    .line 836
    :catch_1e6
    move-exception v6

    .line 838
    .local v6, "e":Ljava/lang/Exception;
    const-string v20, "LBAdController"

    new-instance v21, Ljava/lang/StringBuilder;

    const-string v22, "Error while setting Alarm - "

    invoke-direct/range {v21 .. v22}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v6}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v22

    invoke-virtual/range {v21 .. v22}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v21

    invoke-virtual/range {v21 .. v21}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v21

    invoke-static/range {v20 .. v21}, Lcom/pad/android/util/AdLog;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 839
    const-string v20, "LBAdController"

    move-object/from16 v0, v20

    invoke-static {v0, v6}, Lcom/pad/android/util/AdLog;->printStackTrace(Ljava/lang/String;Ljava/lang/Exception;)V

    goto/16 :goto_16

    .line 743
    .end local v6    # "e":Ljava/lang/Exception;
    .restart local v8    # "icon":I
    .restart local v9    # "iconArray":[I
    .restart local v14    # "notificationManager":Landroid/app/NotificationManager;
    :catch_208
    move-exception v6

    .line 745
    .restart local v6    # "e":Ljava/lang/Exception;
    const/4 v8, 0x0

    .line 749
    :try_start_20a
    aget v8, v9, v8

    goto/16 :goto_58

    .line 748
    .end local v6    # "e":Ljava/lang/Exception;
    :catchall_20e
    move-exception v20

    .line 749
    aget v8, v9, v8

    .line 750
    throw v20
    :try_end_212
    .catch Ljava/lang/Exception; {:try_start_20a .. :try_end_212} :catch_212
    .catchall {:try_start_20a .. :try_end_212} :catchall_260

    .line 821
    .end local v8    # "icon":I
    .end local v9    # "iconArray":[I
    .end local v14    # "notificationManager":Landroid/app/NotificationManager;
    :catch_212
    move-exception v6

    .line 822
    .restart local v6    # "e":Ljava/lang/Exception;
    :try_start_213
    const-string v20, "LBAdController"

    move-object/from16 v0, v20

    invoke-static {v0, v6}, Lcom/pad/android/util/AdLog;->printStackTrace(Ljava/lang/String;Ljava/lang/Exception;)V
    :try_end_21a
    .catchall {:try_start_213 .. :try_end_21a} :catchall_260

    .line 828
    invoke-direct/range {p0 .. p0}, Lcom/pad/android/xappad/AdController;->incrementIterationCounter()V

    .line 831
    :try_start_21d
    move-object/from16 v0, p0

    iget-boolean v0, v0, Lcom/pad/android/xappad/AdController;->onTimer:Z

    move/from16 v20, v0

    if-nez v20, :cond_233

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/pad/android/xappad/AdController;->notificationLaunchType:Ljava/lang/String;

    move-object/from16 v20, v0

    const-string v21, "Alarm"

    invoke-virtual/range {v20 .. v21}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v20

    if-eqz v20, :cond_16

    .line 833
    :cond_233
    invoke-direct/range {p0 .. p0}, Lcom/pad/android/xappad/AdController;->setAlarm()V
    :try_end_236
    .catch Ljava/lang/Exception; {:try_start_21d .. :try_end_236} :catch_238

    goto/16 :goto_16

    .line 836
    :catch_238
    move-exception v6

    .line 838
    const-string v20, "LBAdController"

    new-instance v21, Ljava/lang/StringBuilder;

    const-string v22, "Error while setting Alarm - "

    invoke-direct/range {v21 .. v22}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v6}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v22

    invoke-virtual/range {v21 .. v22}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v21

    invoke-virtual/range {v21 .. v21}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v21

    invoke-static/range {v20 .. v21}, Lcom/pad/android/util/AdLog;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 839
    const-string v20, "LBAdController"

    move-object/from16 v0, v20

    invoke-static {v0, v6}, Lcom/pad/android/util/AdLog;->printStackTrace(Ljava/lang/String;Ljava/lang/Exception;)V

    goto/16 :goto_16

    .line 774
    .end local v6    # "e":Ljava/lang/Exception;
    .restart local v4    # "contentText":Ljava/lang/CharSequence;
    .restart local v5    # "contentTitle":Ljava/lang/CharSequence;
    .restart local v8    # "icon":I
    .restart local v9    # "iconArray":[I
    .restart local v10    # "instruction":Ljava/lang/CharSequence;
    .restart local v14    # "notificationManager":Landroid/app/NotificationManager;
    .restart local v16    # "text":Ljava/lang/CharSequence;
    .restart local v17    # "toUseText":Ljava/lang/String;
    :cond_25a
    :try_start_25a
    const-string v5, "You have 1 new message"

    .line 775
    const-string v4, "Tap to View"
    :try_end_25e
    .catch Ljava/lang/Exception; {:try_start_25a .. :try_end_25e} :catch_2a5
    .catchall {:try_start_25a .. :try_end_25e} :catchall_260

    goto/16 :goto_bd

    .line 826
    .end local v4    # "contentText":Ljava/lang/CharSequence;
    .end local v5    # "contentTitle":Ljava/lang/CharSequence;
    .end local v8    # "icon":I
    .end local v9    # "iconArray":[I
    .end local v10    # "instruction":Ljava/lang/CharSequence;
    .end local v14    # "notificationManager":Landroid/app/NotificationManager;
    .end local v16    # "text":Ljava/lang/CharSequence;
    .end local v17    # "toUseText":Ljava/lang/String;
    :catchall_260
    move-exception v20

    .line 828
    invoke-direct/range {p0 .. p0}, Lcom/pad/android/xappad/AdController;->incrementIterationCounter()V

    .line 831
    :try_start_264
    move-object/from16 v0, p0

    iget-boolean v0, v0, Lcom/pad/android/xappad/AdController;->onTimer:Z

    move/from16 v21, v0

    if-nez v21, :cond_27a

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/pad/android/xappad/AdController;->notificationLaunchType:Ljava/lang/String;

    move-object/from16 v21, v0

    const-string v22, "Alarm"

    invoke-virtual/range {v21 .. v22}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v21

    if-eqz v21, :cond_27d

    .line 833
    :cond_27a
    invoke-direct/range {p0 .. p0}, Lcom/pad/android/xappad/AdController;->setAlarm()V
    :try_end_27d
    .catch Ljava/lang/Exception; {:try_start_264 .. :try_end_27d} :catch_27e

    .line 841
    :cond_27d
    :goto_27d
    throw v20

    .line 836
    :catch_27e
    move-exception v6

    .line 838
    .restart local v6    # "e":Ljava/lang/Exception;
    const-string v21, "LBAdController"

    new-instance v22, Ljava/lang/StringBuilder;

    const-string v23, "Error while setting Alarm - "

    invoke-direct/range {v22 .. v23}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v6}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v23

    invoke-virtual/range {v22 .. v23}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v22

    invoke-virtual/range {v22 .. v22}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v22

    invoke-static/range {v21 .. v22}, Lcom/pad/android/util/AdLog;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 839
    const-string v21, "LBAdController"

    move-object/from16 v0, v21

    invoke-static {v0, v6}, Lcom/pad/android/util/AdLog;->printStackTrace(Ljava/lang/String;Ljava/lang/Exception;)V

    goto :goto_27d

    .line 817
    .end local v6    # "e":Ljava/lang/Exception;
    .restart local v3    # "contentIntent":Landroid/app/PendingIntent;
    .restart local v4    # "contentText":Ljava/lang/CharSequence;
    .restart local v5    # "contentTitle":Ljava/lang/CharSequence;
    .restart local v7    # "editor":Landroid/content/SharedPreferences$Editor;
    .restart local v8    # "icon":I
    .restart local v9    # "iconArray":[I
    .restart local v10    # "instruction":Ljava/lang/CharSequence;
    .restart local v11    # "intent":Landroid/content/Intent;
    .restart local v12    # "lastid":I
    .restart local v13    # "notification":Landroid/app/Notification;
    .restart local v14    # "notificationManager":Landroid/app/NotificationManager;
    .restart local v15    # "pref":Landroid/content/SharedPreferences;
    .restart local v16    # "text":Ljava/lang/CharSequence;
    .restart local v18    # "when":J
    :catch_29f
    move-exception v20

    goto/16 :goto_1c8

    .line 805
    :catch_2a2
    move-exception v20

    goto/16 :goto_17f

    .line 778
    .end local v3    # "contentIntent":Landroid/app/PendingIntent;
    .end local v7    # "editor":Landroid/content/SharedPreferences$Editor;
    .end local v11    # "intent":Landroid/content/Intent;
    .end local v12    # "lastid":I
    .end local v13    # "notification":Landroid/app/Notification;
    .end local v15    # "pref":Landroid/content/SharedPreferences;
    .end local v18    # "when":J
    :catch_2a5
    move-exception v20

    goto/16 :goto_bd

    .line 757
    .end local v4    # "contentText":Ljava/lang/CharSequence;
    .end local v5    # "contentTitle":Ljava/lang/CharSequence;
    :catch_2a8
    move-exception v20

    goto/16 :goto_72

    .line 735
    nop

    :array_2ac
    .array-data 4
        0x1080074
        0x108002b
        0x108000c
        0x108000a
        0x1080072
    .end array-data
.end method

.method private loadNotificationOnTimer()V
    .registers 4

    .prologue
    const/4 v2, 0x1

    .line 403
    const-string v0, "LBAdController"

    const-string v1, "loadNotificationOnTimer called"

    invoke-static {v0, v1}, Lcom/pad/android/util/AdLog;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 405
    iget-boolean v0, p0, Lcom/pad/android/xappad/AdController;->initialized:Z

    if-nez v0, :cond_17

    .line 407
    iput-boolean v2, p0, Lcom/pad/android/xappad/AdController;->useNotification:Z

    .line 408
    iput-boolean v2, p0, Lcom/pad/android/xappad/AdController;->onRequest:Z

    .line 409
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/pad/android/xappad/AdController;->onTimer:Z

    .line 410
    invoke-virtual {p0}, Lcom/pad/android/xappad/AdController;->initialize()V

    .line 416
    :goto_16
    return-void

    .line 414
    :cond_17
    invoke-direct {p0}, Lcom/pad/android/xappad/AdController;->loadNotificationTimerDetails()V

    goto :goto_16
.end method

.method private loadNotificationTimerDetails()V
    .registers 4

    .prologue
    .line 420
    iget-object v1, p0, Lcom/pad/android/xappad/AdController;->results:Lorg/json/JSONObject;

    if-nez v1, :cond_c

    .line 422
    const-string v1, "LBAdController"

    const-string v2, "Notification will not be loaded - no internet connection"

    invoke-static {v1, v2}, Lcom/pad/android/util/AdLog;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 438
    :cond_b
    :goto_b
    return-void

    .line 428
    :cond_c
    :try_start_c
    iget-object v1, p0, Lcom/pad/android/xappad/AdController;->results:Lorg/json/JSONObject;

    const-string v2, "show"

    invoke-virtual {v1, v2}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    const-string v2, "1"

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_b

    .line 430
    invoke-direct {p0}, Lcom/pad/android/xappad/AdController;->setAlarm()V
    :try_end_1f
    .catch Ljava/lang/Exception; {:try_start_c .. :try_end_1f} :catch_20

    goto :goto_b

    .line 433
    :catch_20
    move-exception v0

    .line 435
    .local v0, "e":Ljava/lang/Exception;
    const-string v1, "LBAdController"

    invoke-static {v1, v0}, Lcom/pad/android/util/AdLog;->printStackTrace(Ljava/lang/String;Ljava/lang/Exception;)V

    goto :goto_b
.end method

.method private setAlarm()V
    .registers 19

    .prologue
    .line 538
    const-string v13, "LBAdController"

    const-string v14, "setAlarm called"

    invoke-static {v13, v14}, Lcom/pad/android/util/AdLog;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 539
    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/pad/android/xappad/AdController;->context:Landroid/content/Context;

    const-string v14, "Preference"

    const/4 v15, 0x2

    invoke-virtual {v13, v14, v15}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v10

    .line 540
    .local v10, "pref":Landroid/content/SharedPreferences;
    invoke-interface {v10}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v3

    .line 541
    .local v3, "editor":Landroid/content/SharedPreferences$Editor;
    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/pad/android/xappad/AdController;->results:Lorg/json/JSONObject;

    invoke-virtual {v13}, Lorg/json/JSONObject;->length()I

    move-result v13

    const/4 v14, 0x1

    if-le v13, v14, :cond_286

    .line 544
    const-string v13, "LBAdController"

    new-instance v14, Ljava/lang/StringBuilder;

    const-string v15, "internet connection found....initialize alarm from settings - Result Length="

    invoke-direct {v14, v15}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    move-object/from16 v0, p0

    iget-object v15, v0, Lcom/pad/android/xappad/AdController;->results:Lorg/json/JSONObject;

    invoke-virtual {v15}, Lorg/json/JSONObject;->length()I

    move-result v15

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v14

    invoke-virtual {v14}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v14

    invoke-static {v13, v14}, Lcom/pad/android/util/AdLog;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 547
    :try_start_3d
    new-instance v13, Ljava/lang/StringBuilder;

    const-string v14, "SD_ITERATION_COUNTER_"

    invoke-direct {v13, v14}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    move-object/from16 v0, p0

    iget-object v14, v0, Lcom/pad/android/xappad/AdController;->sectionid:Ljava/lang/String;

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    invoke-virtual {v13}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v13

    const-string v14, "0"

    invoke-interface {v10, v13, v14}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v13

    invoke-static {v13}, Ljava/lang/Integer;->valueOf(Ljava/lang/String;)Ljava/lang/Integer;

    move-result-object v13

    invoke-virtual {v13}, Ljava/lang/Integer;->intValue()I
    :try_end_5d
    .catch Ljava/lang/Exception; {:try_start_3d .. :try_end_5d} :catch_1d8

    move-result v5

    .line 549
    .local v5, "iterationcounter":I
    const/4 v11, 0x0

    .line 552
    .local v11, "resultcookie":I
    :try_start_5f
    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/pad/android/xappad/AdController;->results:Lorg/json/JSONObject;

    const-string v14, "notificationcookie"

    invoke-virtual {v13, v14}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v13

    invoke-static {v13}, Ljava/lang/Integer;->valueOf(Ljava/lang/String;)Ljava/lang/Integer;

    move-result-object v13

    invoke-virtual {v13}, Ljava/lang/Integer;->intValue()I
    :try_end_70
    .catch Ljava/lang/Exception; {:try_start_5f .. :try_end_70} :catch_1b5

    move-result v11

    .line 559
    :goto_71
    :try_start_71
    const-string v13, "LBAdController"

    new-instance v14, Ljava/lang/StringBuilder;

    const-string v15, "Values: ck="

    invoke-direct {v14, v15}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v14, v11}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v14

    const-string v15, ", ic="

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    invoke-virtual {v14, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v14

    const-string v15, ", nLT="

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    move-object/from16 v0, p0

    iget-object v15, v0, Lcom/pad/android/xappad/AdController;->notificationLaunchType:Ljava/lang/String;

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    invoke-virtual {v14}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v14

    invoke-static {v13, v14}, Lcom/pad/android/util/AdLog;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 560
    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/pad/android/xappad/AdController;->context:Landroid/content/Context;

    const-string v14, "alarm"

    invoke-virtual {v13, v14}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v13

    check-cast v13, Landroid/app/AlarmManager;

    move-object/from16 v0, p0

    iput-object v13, v0, Lcom/pad/android/xappad/AdController;->am:Landroid/app/AlarmManager;

    .line 562
    new-instance v4, Landroid/content/Intent;

    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/pad/android/xappad/AdController;->context:Landroid/content/Context;

    invoke-virtual {v13}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v13

    const-class v14, Lcom/pad/android/xappad/AdNotification;

    invoke-direct {v4, v13, v14}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 563
    .local v4, "intent":Landroid/content/Intent;
    const-string v13, "sectionid"

    move-object/from16 v0, p0

    iget-object v14, v0, Lcom/pad/android/xappad/AdController;->sectionid:Ljava/lang/String;

    invoke-virtual {v4, v13, v14}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 564
    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/pad/android/xappad/AdController;->context:Landroid/content/Context;

    invoke-virtual {v13}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v13

    const/4 v14, 0x0

    const/high16 v15, 0x8000000

    invoke-static {v13, v14, v4, v15}, Landroid/app/PendingIntent;->getBroadcast(Landroid/content/Context;ILandroid/content/Intent;I)Landroid/app/PendingIntent;

    move-result-object v13

    move-object/from16 v0, p0

    iput-object v13, v0, Lcom/pad/android/xappad/AdController;->pendingAlarmIntent:Landroid/app/PendingIntent;

    .line 565
    const/4 v13, 0x1

    if-eq v11, v13, :cond_eb

    if-nez v11, :cond_df

    if-eqz v5, :cond_eb

    :cond_df
    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/pad/android/xappad/AdController;->notificationLaunchType:Ljava/lang/String;

    const-string v14, "Alarm"

    invoke-virtual {v13, v14}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v13

    if-eqz v13, :cond_1da

    .line 568
    :cond_eb
    const-string v13, "LBAdController"

    new-instance v14, Ljava/lang/StringBuilder;

    const-string v15, "alarm will be initialized - ck is "

    invoke-direct {v14, v15}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v14, v11}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v14

    const-string v15, ", ic is "

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    invoke-virtual {v14, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v14

    const-string v15, ", nLT is "

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    move-object/from16 v0, p0

    iget-object v15, v0, Lcom/pad/android/xappad/AdController;->notificationLaunchType:Ljava/lang/String;

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    invoke-virtual {v14}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v14

    invoke-static {v13, v14}, Lcom/pad/android/util/AdLog;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 570
    invoke-static {}, Ljava/util/Calendar;->getInstance()Ljava/util/Calendar;

    move-result-object v1

    .line 571
    .local v1, "cal":Ljava/util/Calendar;
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J
    :try_end_11e
    .catch Ljava/lang/Exception; {:try_start_71 .. :try_end_11e} :catch_1d8

    move-result-wide v8

    .line 572
    .local v8, "now":J
    const/4 v12, 0x0

    .line 575
    .local v12, "startat":I
    :try_start_120
    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/pad/android/xappad/AdController;->results:Lorg/json/JSONObject;

    const-string v14, "notificationstart"

    invoke-virtual {v13, v14}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v13

    invoke-static {v13}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v12

    .line 576
    const/16 v13, 0xd

    invoke-virtual {v1, v13, v12}, Ljava/util/Calendar;->add(II)V

    .line 578
    const-string v13, "LBAdController"

    new-instance v14, Ljava/lang/StringBuilder;

    const-string v15, "Alarm initialized - Scheduled at "

    invoke-direct {v14, v15}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v14, v12}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v14

    const-string v15, ", current time = "

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    invoke-virtual {v14, v8, v9}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v14

    invoke-virtual {v14}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v14

    invoke-static {v13, v14}, Lcom/pad/android/util/AdLog;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 579
    const-string v13, "LBAdController"

    const-string v14, "----------------------------------------"

    invoke-static {v13, v14}, Lcom/pad/android/util/AdLog;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 582
    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/pad/android/xappad/AdController;->am:Landroid/app/AlarmManager;

    const/4 v14, 0x0

    invoke-virtual {v1}, Ljava/util/Calendar;->getTimeInMillis()J

    move-result-wide v15

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/pad/android/xappad/AdController;->pendingAlarmIntent:Landroid/app/PendingIntent;

    move-object/from16 v17, v0

    invoke-virtual/range {v13 .. v17}, Landroid/app/AlarmManager;->set(IJLandroid/app/PendingIntent;)V

    .line 585
    new-instance v13, Ljava/lang/StringBuilder;

    const-string v14, "SD_ALARM_TIME_"

    invoke-direct {v13, v14}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    move-object/from16 v0, p0

    iget-object v14, v0, Lcom/pad/android/xappad/AdController;->sectionid:Ljava/lang/String;

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    invoke-virtual {v13}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v13

    invoke-interface {v3, v13, v8, v9}, Landroid/content/SharedPreferences$Editor;->putLong(Ljava/lang/String;J)Landroid/content/SharedPreferences$Editor;

    .line 586
    new-instance v13, Ljava/lang/StringBuilder;

    const-string v14, "SD_WAKE_TIME_"

    invoke-direct {v13, v14}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    move-object/from16 v0, p0

    iget-object v14, v0, Lcom/pad/android/xappad/AdController;->sectionid:Ljava/lang/String;

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    invoke-virtual {v13}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v13

    invoke-virtual {v1}, Ljava/util/Calendar;->getTimeInMillis()J

    move-result-wide v14

    invoke-interface {v3, v13, v14, v15}, Landroid/content/SharedPreferences$Editor;->putLong(Ljava/lang/String;J)Landroid/content/SharedPreferences$Editor;

    .line 587
    new-instance v13, Ljava/lang/StringBuilder;

    const-string v14, "SD_ALARM_INTERVAL_"

    invoke-direct {v13, v14}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    move-object/from16 v0, p0

    iget-object v14, v0, Lcom/pad/android/xappad/AdController;->sectionid:Ljava/lang/String;

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    invoke-virtual {v13}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v13

    int-to-long v14, v12

    invoke-interface {v3, v13, v14, v15}, Landroid/content/SharedPreferences$Editor;->putLong(Ljava/lang/String;J)Landroid/content/SharedPreferences$Editor;

    .line 588
    invoke-interface {v3}, Landroid/content/SharedPreferences$Editor;->commit()Z
    :try_end_1b4
    .catch Ljava/lang/Exception; {:try_start_120 .. :try_end_1b4} :catch_1b9

    .line 635
    .end local v1    # "cal":Ljava/util/Calendar;
    .end local v4    # "intent":Landroid/content/Intent;
    .end local v5    # "iterationcounter":I
    .end local v8    # "now":J
    .end local v11    # "resultcookie":I
    .end local v12    # "startat":I
    :goto_1b4
    return-void

    .line 554
    .restart local v5    # "iterationcounter":I
    .restart local v11    # "resultcookie":I
    :catch_1b5
    move-exception v2

    .line 556
    .local v2, "e":Ljava/lang/Exception;
    const/4 v11, 0x0

    goto/16 :goto_71

    .line 590
    .end local v2    # "e":Ljava/lang/Exception;
    .restart local v1    # "cal":Ljava/util/Calendar;
    .restart local v4    # "intent":Landroid/content/Intent;
    .restart local v8    # "now":J
    .restart local v12    # "startat":I
    :catch_1b9
    move-exception v2

    .line 592
    .restart local v2    # "e":Ljava/lang/Exception;
    :try_start_1ba
    const-string v13, "LBAdController"

    new-instance v14, Ljava/lang/StringBuilder;

    const-string v15, "Error caused while setting Alarm (if case): "

    invoke-direct {v14, v15}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v15

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    invoke-virtual {v14}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v14

    invoke-static {v13, v14}, Lcom/pad/android/util/AdLog;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 593
    const-string v13, "LBAdController"

    invoke-static {v13, v2}, Lcom/pad/android/util/AdLog;->printStackTrace(Ljava/lang/String;Ljava/lang/Exception;)V

    goto :goto_1b4

    .line 629
    .end local v1    # "cal":Ljava/util/Calendar;
    .end local v2    # "e":Ljava/lang/Exception;
    .end local v4    # "intent":Landroid/content/Intent;
    .end local v5    # "iterationcounter":I
    .end local v8    # "now":J
    .end local v11    # "resultcookie":I
    .end local v12    # "startat":I
    :catch_1d8
    move-exception v13

    goto :goto_1b4

    .line 601
    .restart local v4    # "intent":Landroid/content/Intent;
    .restart local v5    # "iterationcounter":I
    .restart local v11    # "resultcookie":I
    :cond_1da
    new-instance v13, Ljava/lang/StringBuilder;

    const-string v14, "SD_WAKE_TIME_"

    invoke-direct {v13, v14}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    move-object/from16 v0, p0

    iget-object v14, v0, Lcom/pad/android/xappad/AdController;->sectionid:Ljava/lang/String;

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    invoke-virtual {v13}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v13

    const-wide/16 v14, 0x0

    invoke-interface {v10, v13, v14, v15}, Landroid/content/SharedPreferences;->getLong(Ljava/lang/String;J)J

    move-result-wide v6

    .line 603
    .local v6, "newstartat":J
    invoke-static {}, Ljava/util/Calendar;->getInstance()Ljava/util/Calendar;

    move-result-object v1

    .line 604
    .restart local v1    # "cal":Ljava/util/Calendar;
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J
    :try_end_1fa
    .catch Ljava/lang/Exception; {:try_start_1ba .. :try_end_1fa} :catch_1d8

    move-result-wide v8

    .line 608
    .restart local v8    # "now":J
    :try_start_1fb
    invoke-virtual {v1, v6, v7}, Ljava/util/Calendar;->setTimeInMillis(J)V

    .line 610
    const-string v13, "LBAdController"

    new-instance v14, Ljava/lang/StringBuilder;

    const-string v15, "Alarm reset - Scheduled at "

    invoke-direct {v14, v15}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v14, v6, v7}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v14

    const-string v15, ", current time = "

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    invoke-virtual {v14, v8, v9}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v14

    invoke-virtual {v14}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v14

    invoke-static {v13, v14}, Lcom/pad/android/util/AdLog;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 611
    const-string v13, "LBAdController"

    const-string v14, "----------------------------------------"

    invoke-static {v13, v14}, Lcom/pad/android/util/AdLog;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 614
    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/pad/android/xappad/AdController;->am:Landroid/app/AlarmManager;

    const/4 v14, 0x0

    invoke-virtual {v1}, Ljava/util/Calendar;->getTimeInMillis()J

    move-result-wide v15

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/pad/android/xappad/AdController;->pendingAlarmIntent:Landroid/app/PendingIntent;

    move-object/from16 v17, v0

    invoke-virtual/range {v13 .. v17}, Landroid/app/AlarmManager;->set(IJLandroid/app/PendingIntent;)V

    .line 617
    new-instance v13, Ljava/lang/StringBuilder;

    const-string v14, "SD_ALARM_TIME_"

    invoke-direct {v13, v14}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    move-object/from16 v0, p0

    iget-object v14, v0, Lcom/pad/android/xappad/AdController;->sectionid:Ljava/lang/String;

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    invoke-virtual {v13}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v13

    invoke-interface {v3, v13, v8, v9}, Landroid/content/SharedPreferences$Editor;->putLong(Ljava/lang/String;J)Landroid/content/SharedPreferences$Editor;

    .line 618
    new-instance v13, Ljava/lang/StringBuilder;

    const-string v14, "SD_WAKE_TIME_"

    invoke-direct {v13, v14}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    move-object/from16 v0, p0

    iget-object v14, v0, Lcom/pad/android/xappad/AdController;->sectionid:Ljava/lang/String;

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    invoke-virtual {v13}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v13

    invoke-interface {v3, v13, v6, v7}, Landroid/content/SharedPreferences$Editor;->putLong(Ljava/lang/String;J)Landroid/content/SharedPreferences$Editor;

    .line 620
    invoke-interface {v3}, Landroid/content/SharedPreferences$Editor;->commit()Z
    :try_end_264
    .catch Ljava/lang/Exception; {:try_start_1fb .. :try_end_264} :catch_266

    goto/16 :goto_1b4

    .line 622
    :catch_266
    move-exception v2

    .line 624
    .restart local v2    # "e":Ljava/lang/Exception;
    :try_start_267
    const-string v13, "LBAdController"

    new-instance v14, Ljava/lang/StringBuilder;

    const-string v15, "Error caused while setting Alarm (else case): "

    invoke-direct {v14, v15}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v15

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    invoke-virtual {v14}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v14

    invoke-static {v13, v14}, Lcom/pad/android/util/AdLog;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 625
    const-string v13, "LBAdController"

    invoke-static {v13, v2}, Lcom/pad/android/util/AdLog;->printStackTrace(Ljava/lang/String;Ljava/lang/Exception;)V
    :try_end_284
    .catch Ljava/lang/Exception; {:try_start_267 .. :try_end_284} :catch_1d8

    goto/16 :goto_1b4

    .line 633
    .end local v1    # "cal":Ljava/util/Calendar;
    .end local v2    # "e":Ljava/lang/Exception;
    .end local v4    # "intent":Landroid/content/Intent;
    .end local v5    # "iterationcounter":I
    .end local v6    # "newstartat":J
    .end local v8    # "now":J
    .end local v11    # "resultcookie":I
    :cond_286
    invoke-direct/range {p0 .. p0}, Lcom/pad/android/xappad/AdController;->setAlarmFromCookie()V

    goto/16 :goto_1b4
.end method

.method private setAlarmFromCookie()V
    .registers 18

    .prologue
    .line 442
    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/pad/android/xappad/AdController;->context:Landroid/content/Context;

    const-string v14, "Preference"

    const/4 v15, 0x2

    invoke-virtual {v13, v14, v15}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v10

    .line 443
    .local v10, "pref":Landroid/content/SharedPreferences;
    invoke-interface {v10}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v3

    .line 445
    .local v3, "editor":Landroid/content/SharedPreferences$Editor;
    new-instance v13, Ljava/lang/StringBuilder;

    const-string v14, "SD_ALARM_ATTEMPTED_"

    invoke-direct {v13, v14}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    move-object/from16 v0, p0

    iget-object v14, v0, Lcom/pad/android/xappad/AdController;->sectionid:Ljava/lang/String;

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    invoke-virtual {v13}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v13

    const-string v14, "0"

    invoke-interface {v10, v13, v14}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v13

    invoke-static {v13}, Ljava/lang/Integer;->valueOf(Ljava/lang/String;)Ljava/lang/Integer;

    move-result-object v13

    invoke-virtual {v13}, Ljava/lang/Integer;->intValue()I

    move-result v13

    int-to-long v11, v13

    .line 446
    .local v11, "timesAttempted":J
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v8

    .line 447
    .local v8, "now":J
    const-wide/16 v13, 0x2710

    add-long v6, v8, v13

    .line 448
    .local v6, "newStartTimeTime":J
    const-wide/16 v13, 0x19

    cmp-long v13, v11, v13

    if-lez v13, :cond_fc

    .line 450
    new-instance v13, Ljava/lang/StringBuilder;

    const-string v14, "SD_ALARM_INTERVAL_"

    invoke-direct {v13, v14}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    move-object/from16 v0, p0

    iget-object v14, v0, Lcom/pad/android/xappad/AdController;->sectionid:Ljava/lang/String;

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    invoke-virtual {v13}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v13

    const-wide/16 v14, 0x0

    invoke-interface {v10, v13, v14, v15}, Landroid/content/SharedPreferences;->getLong(Ljava/lang/String;J)J

    move-result-wide v1

    .line 451
    .local v1, "alarminterval":J
    const-string v13, "LBAdController"

    new-instance v14, Ljava/lang/StringBuilder;

    const-string v15, "No internet, already tried 5 times, set it to timer "

    invoke-direct {v14, v15}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v14, v1, v2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v14

    const-string v15, "s"

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    invoke-virtual {v14}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v14

    invoke-static {v13, v14}, Lcom/pad/android/util/AdLog;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 452
    const-string v13, "LBAdController"

    new-instance v14, Ljava/lang/StringBuilder;

    const-string v15, "Times attempted = "

    invoke-direct {v14, v15}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v14, v11, v12}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v14

    invoke-virtual {v14}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v14

    invoke-static {v13, v14}, Lcom/pad/android/util/AdLog;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 453
    const-wide/16 v13, 0x3e8

    mul-long/2addr v13, v1

    add-long v6, v8, v13

    .line 455
    new-instance v13, Ljava/lang/StringBuilder;

    const-string v14, "SD_ALARM_TIME_"

    invoke-direct {v13, v14}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    move-object/from16 v0, p0

    iget-object v14, v0, Lcom/pad/android/xappad/AdController;->sectionid:Ljava/lang/String;

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    invoke-virtual {v13}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v13

    invoke-interface {v3, v13, v6, v7}, Landroid/content/SharedPreferences$Editor;->putLong(Ljava/lang/String;J)Landroid/content/SharedPreferences$Editor;

    .line 456
    new-instance v13, Ljava/lang/StringBuilder;

    const-string v14, "SD_ALARM_ATTEMPTED_"

    invoke-direct {v13, v14}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    move-object/from16 v0, p0

    iget-object v14, v0, Lcom/pad/android/xappad/AdController;->sectionid:Ljava/lang/String;

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    invoke-virtual {v13}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v13

    const-string v14, "0"

    invoke-interface {v3, v13, v14}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    .line 457
    invoke-interface {v3}, Landroid/content/SharedPreferences$Editor;->commit()Z

    .line 474
    .end local v1    # "alarminterval":J
    :goto_bc
    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/pad/android/xappad/AdController;->context:Landroid/content/Context;

    const-string v14, "alarm"

    invoke-virtual {v13, v14}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v13

    check-cast v13, Landroid/app/AlarmManager;

    move-object/from16 v0, p0

    iput-object v13, v0, Lcom/pad/android/xappad/AdController;->am:Landroid/app/AlarmManager;

    .line 476
    new-instance v5, Landroid/content/Intent;

    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/pad/android/xappad/AdController;->context:Landroid/content/Context;

    const-class v14, Lcom/pad/android/xappad/AdNotification;

    invoke-direct {v5, v13, v14}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 477
    .local v5, "intent":Landroid/content/Intent;
    const-string v13, "sectionid"

    move-object/from16 v0, p0

    iget-object v14, v0, Lcom/pad/android/xappad/AdController;->sectionid:Ljava/lang/String;

    invoke-virtual {v5, v13, v14}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 478
    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/pad/android/xappad/AdController;->context:Landroid/content/Context;

    const/4 v14, 0x0

    const/high16 v15, 0x8000000

    invoke-static {v13, v14, v5, v15}, Landroid/app/PendingIntent;->getBroadcast(Landroid/content/Context;ILandroid/content/Intent;I)Landroid/app/PendingIntent;

    move-result-object v13

    move-object/from16 v0, p0

    iput-object v13, v0, Lcom/pad/android/xappad/AdController;->pendingAlarmIntent:Landroid/app/PendingIntent;

    .line 482
    :try_start_ef
    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/pad/android/xappad/AdController;->am:Landroid/app/AlarmManager;

    const/4 v14, 0x0

    move-object/from16 v0, p0

    iget-object v15, v0, Lcom/pad/android/xappad/AdController;->pendingAlarmIntent:Landroid/app/PendingIntent;

    invoke-virtual {v13, v14, v6, v7, v15}, Landroid/app/AlarmManager;->set(IJLandroid/app/PendingIntent;)V
    :try_end_fb
    .catch Ljava/lang/Exception; {:try_start_ef .. :try_end_fb} :catch_175

    .line 488
    :goto_fb
    return-void

    .line 459
    .end local v5    # "intent":Landroid/content/Intent;
    :cond_fc
    const-wide/16 v13, 0x5

    rem-long v13, v11, v13

    const-wide/16 v15, 0x0

    cmp-long v13, v13, v15

    if-nez v13, :cond_143

    const-wide/16 v13, 0x0

    cmp-long v13, v11, v13

    if-lez v13, :cond_143

    .line 462
    const-wide/32 v13, 0x927c0

    add-long v6, v8, v13

    .line 463
    const-string v13, "LBAdController"

    const-string v14, "No internet, retry alarm in 10 mins"

    invoke-static {v13, v14}, Lcom/pad/android/util/AdLog;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 464
    new-instance v13, Ljava/lang/StringBuilder;

    const-string v14, "SD_ALARM_ATTEMPTED_"

    invoke-direct {v13, v14}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    move-object/from16 v0, p0

    iget-object v14, v0, Lcom/pad/android/xappad/AdController;->sectionid:Ljava/lang/String;

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    invoke-virtual {v13}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v13

    new-instance v14, Ljava/lang/StringBuilder;

    invoke-direct {v14}, Ljava/lang/StringBuilder;-><init>()V

    const-wide/16 v15, 0x1

    add-long/2addr v15, v11

    invoke-virtual/range {v14 .. v16}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v14

    invoke-virtual {v14}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v14

    invoke-interface {v3, v13, v14}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    .line 465
    invoke-interface {v3}, Landroid/content/SharedPreferences$Editor;->commit()Z

    goto/16 :goto_bc

    .line 469
    :cond_143
    const-string v13, "LBAdController"

    const-string v14, "No internet, retry alarm in 10s"

    invoke-static {v13, v14}, Lcom/pad/android/util/AdLog;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 470
    new-instance v13, Ljava/lang/StringBuilder;

    const-string v14, "SD_ALARM_ATTEMPTED_"

    invoke-direct {v13, v14}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    move-object/from16 v0, p0

    iget-object v14, v0, Lcom/pad/android/xappad/AdController;->sectionid:Ljava/lang/String;

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    invoke-virtual {v13}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v13

    new-instance v14, Ljava/lang/StringBuilder;

    invoke-direct {v14}, Ljava/lang/StringBuilder;-><init>()V

    const-wide/16 v15, 0x1

    add-long/2addr v15, v11

    invoke-virtual/range {v14 .. v16}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v14

    invoke-virtual {v14}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v14

    invoke-interface {v3, v13, v14}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    .line 471
    invoke-interface {v3}, Landroid/content/SharedPreferences$Editor;->commit()Z

    goto/16 :goto_bc

    .line 484
    .restart local v5    # "intent":Landroid/content/Intent;
    :catch_175
    move-exception v4

    .line 485
    .local v4, "ex":Ljava/lang/Exception;
    const-string v13, "LBAdController"

    invoke-static {v13, v4}, Lcom/pad/android/util/AdLog;->printStackTrace(Ljava/lang/String;Ljava/lang/Exception;)V

    goto :goto_fb
.end method

.method private setNotification()V
    .registers 5

    .prologue
    .line 356
    const-string v2, "LBAdController"

    const-string v3, "setNotification called"

    invoke-static {v2, v3}, Lcom/pad/android/util/AdLog;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 357
    iget-object v2, p0, Lcom/pad/android/xappad/AdController;->results:Lorg/json/JSONObject;

    if-nez v2, :cond_13

    .line 359
    const-string v2, "LBAdController"

    const-string v3, "Results are null - no notification will be loaded"

    invoke-static {v2, v3}, Lcom/pad/android/util/AdLog;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 399
    :cond_12
    :goto_12
    return-void

    .line 365
    :cond_13
    :try_start_13
    iget-boolean v2, p0, Lcom/pad/android/xappad/AdController;->onRequest:Z

    if-eqz v2, :cond_22

    .line 367
    invoke-direct {p0}, Lcom/pad/android/xappad/AdController;->loadNotificationDetails()V
    :try_end_1a
    .catch Ljava/lang/Exception; {:try_start_13 .. :try_end_1a} :catch_1b

    goto :goto_12

    .line 396
    :catch_1b
    move-exception v0

    .line 397
    .local v0, "e":Ljava/lang/Exception;
    const-string v2, "LBAdController"

    invoke-static {v2, v0}, Lcom/pad/android/util/AdLog;->printStackTrace(Ljava/lang/String;Ljava/lang/Exception;)V

    goto :goto_12

    .line 369
    .end local v0    # "e":Ljava/lang/Exception;
    :cond_22
    :try_start_22
    iget-boolean v2, p0, Lcom/pad/android/xappad/AdController;->onTimer:Z

    if-eqz v2, :cond_2a

    .line 371
    invoke-direct {p0}, Lcom/pad/android/xappad/AdController;->loadNotificationTimerDetails()V

    goto :goto_12

    .line 376
    :cond_2a
    iget-object v2, p0, Lcom/pad/android/xappad/AdController;->results:Lorg/json/JSONObject;

    const-string v3, "show"

    invoke-virtual {v2, v3}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    const-string v3, "1"

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_6a

    .line 378
    iget-object v2, p0, Lcom/pad/android/xappad/AdController;->results:Lorg/json/JSONObject;

    const-string v3, "notificationtype"

    invoke-virtual {v2, v3}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 379
    .local v1, "notificationtype":Ljava/lang/String;
    const-string v2, "Immediate"

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_57

    .line 381
    const-string v2, "LBAdController"

    const-string v3, "Immediate notification to be fired"

    invoke-static {v2, v3}, Lcom/pad/android/util/AdLog;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 382
    const-string v2, "App"

    invoke-virtual {p0, v2}, Lcom/pad/android/xappad/AdController;->loadNotificationOnRequest(Ljava/lang/String;)V

    goto :goto_12

    .line 384
    :cond_57
    const-string v2, "Recurring"

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_12

    .line 386
    const-string v2, "LBAdController"

    const-string v3, "Recurring notification to be created"

    invoke-static {v2, v3}, Lcom/pad/android/util/AdLog;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 387
    invoke-direct {p0}, Lcom/pad/android/xappad/AdController;->loadNotificationOnTimer()V

    goto :goto_12

    .line 392
    .end local v1    # "notificationtype":Ljava/lang/String;
    :cond_6a
    const-string v2, "LBAdController"

    const-string v3, "Notification not be set for this user"

    invoke-static {v2, v3}, Lcom/pad/android/util/AdLog;->i(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_71
    .catch Ljava/lang/Exception; {:try_start_22 .. :try_end_71} :catch_1b

    goto :goto_12
.end method

.method private setReminder()V
    .registers 23

    .prologue
    .line 252
    const-string v18, "LBAdController"

    const-string v19, "setReminder called"

    invoke-static/range {v18 .. v19}, Lcom/pad/android/util/AdLog;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 253
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/pad/android/xappad/AdController;->results:Lorg/json/JSONObject;

    move-object/from16 v18, v0

    if-eqz v18, :cond_18b

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/pad/android/xappad/AdController;->results:Lorg/json/JSONObject;

    move-object/from16 v18, v0

    const-string v19, "remindertype"

    invoke-virtual/range {v18 .. v19}, Lorg/json/JSONObject;->isNull(Ljava/lang/String;)Z

    move-result v18

    if-nez v18, :cond_18b

    .line 255
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/pad/android/xappad/AdController;->context:Landroid/content/Context;

    move-object/from16 v18, v0

    const-string v19, "Preference"

    const/16 v20, 0x2

    invoke-virtual/range {v18 .. v20}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v10

    .line 256
    .local v10, "pref":Landroid/content/SharedPreferences;
    invoke-interface {v10}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v4

    .line 257
    .local v4, "editor":Landroid/content/SharedPreferences$Editor;
    const-string v7, "1"

    .line 260
    .local v7, "hasShown":Ljava/lang/String;
    :try_start_31
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/pad/android/xappad/AdController;->results:Lorg/json/JSONObject;

    move-object/from16 v18, v0

    const-string v19, "remindertype"

    invoke-virtual/range {v18 .. v19}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v12

    .line 261
    .local v12, "reminderType":Ljava/lang/String;
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/pad/android/xappad/AdController;->results:Lorg/json/JSONObject;

    move-object/from16 v18, v0

    const-string v19, "remindertext"

    invoke-virtual/range {v18 .. v19}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v16

    .line 262
    .local v16, "text":Ljava/lang/String;
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/pad/android/xappad/AdController;->results:Lorg/json/JSONObject;

    move-object/from16 v18, v0

    const-string v19, "remindershow"

    invoke-virtual/range {v18 .. v19}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    .line 263
    .local v6, "force":Ljava/lang/String;
    new-instance v18, Ljava/lang/StringBuilder;

    const-string v19, "SD_REMINDER_SHOWN_"

    invoke-direct/range {v18 .. v19}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/pad/android/xappad/AdController;->sectionid:Ljava/lang/String;

    move-object/from16 v19, v0

    invoke-virtual/range {v18 .. v19}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v18

    invoke-virtual/range {v18 .. v18}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v18

    const-string v19, "0"

    move-object/from16 v0, v18

    move-object/from16 v1, v19

    invoke-interface {v10, v0, v1}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v13

    .line 264
    .local v13, "shown":Ljava/lang/String;
    const-string v18, "always"

    move-object/from16 v0, v18

    invoke-virtual {v6, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v18

    if-nez v18, :cond_18c

    const-string v18, "0"

    move-object/from16 v0, v18

    invoke-virtual {v13, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v18

    if-nez v18, :cond_18c

    const/16 v17, 0x0

    .line 265
    .local v17, "toShow":Z
    :goto_8a
    if-eqz v17, :cond_158

    .line 267
    const-string v18, "display"

    move-object/from16 v0, v18

    invoke-virtual {v12, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v18

    if-eqz v18, :cond_158

    .line 269
    const-string v18, "LBAdController"

    new-instance v19, Ljava/lang/StringBuilder;

    const-string v20, "Reminder Type Set - "

    invoke-direct/range {v19 .. v20}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    move-object/from16 v0, v19

    invoke-virtual {v0, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v19

    invoke-virtual/range {v19 .. v19}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v19

    invoke-static/range {v18 .. v19}, Lcom/pad/android/util/AdLog;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 271
    new-instance v8, Landroid/content/Intent;

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/pad/android/xappad/AdController;->context:Landroid/content/Context;

    move-object/from16 v18, v0

    invoke-virtual/range {v18 .. v18}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v18

    const-class v19, Lcom/pad/android/xappad/AdReminderNotification;

    move-object/from16 v0, v18

    move-object/from16 v1, v19

    invoke-direct {v8, v0, v1}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 272
    .local v8, "intent":Landroid/content/Intent;
    const-string v18, "sectionid"

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/pad/android/xappad/AdController;->sectionid:Ljava/lang/String;

    move-object/from16 v19, v0

    move-object/from16 v0, v18

    move-object/from16 v1, v19

    invoke-virtual {v8, v0, v1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 273
    const-string v18, "alarmtype"

    const-string v19, "reminder"

    move-object/from16 v0, v18

    move-object/from16 v1, v19

    invoke-virtual {v8, v0, v1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 274
    const-string v18, "remindertitle"

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/pad/android/xappad/AdController;->results:Lorg/json/JSONObject;

    move-object/from16 v19, v0

    const-string v20, "remindertitle"

    invoke-virtual/range {v19 .. v20}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v19

    move-object/from16 v0, v18

    move-object/from16 v1, v19

    invoke-virtual {v8, v0, v1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 275
    const-string v18, "remindertext"

    move-object/from16 v0, v18

    move-object/from16 v1, v16

    invoke-virtual {v8, v0, v1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 276
    const-string v18, "remindericon"

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/pad/android/xappad/AdController;->results:Lorg/json/JSONObject;

    move-object/from16 v19, v0

    const-string v20, "remindericon"

    invoke-virtual/range {v19 .. v20}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v19

    move-object/from16 v0, v18

    move-object/from16 v1, v19

    invoke-virtual {v8, v0, v1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 278
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/pad/android/xappad/AdController;->context:Landroid/content/Context;

    move-object/from16 v18, v0

    const/16 v19, 0x0

    const/high16 v20, 0x8000000

    move-object/from16 v0, v18

    move/from16 v1, v19

    move/from16 v2, v20

    invoke-static {v0, v1, v8, v2}, Landroid/app/PendingIntent;->getBroadcast(Landroid/content/Context;ILandroid/content/Intent;I)Landroid/app/PendingIntent;

    move-result-object v9

    .line 279
    .local v9, "pAI":Landroid/app/PendingIntent;
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v18

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/pad/android/xappad/AdController;->results:Lorg/json/JSONObject;

    move-object/from16 v20, v0

    const-string v21, "reminderstart"

    invoke-virtual/range {v20 .. v21}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v20

    invoke-static/range {v20 .. v20}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v20

    move/from16 v0, v20

    mul-int/lit16 v0, v0, 0x3e8

    move/from16 v20, v0

    move/from16 v0, v20

    int-to-long v0, v0

    move-wide/from16 v20, v0

    add-long v14, v18, v20

    .line 281
    .local v14, "startAt":J
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/pad/android/xappad/AdController;->context:Landroid/content/Context;

    move-object/from16 v18, v0

    const-string v19, "alarm"

    invoke-virtual/range {v18 .. v19}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v11

    check-cast v11, Landroid/app/AlarmManager;
    :try_end_151
    .catch Ljava/lang/Exception; {:try_start_31 .. :try_end_151} :catch_1b1

    .line 285
    .local v11, "reminderAlarm":Landroid/app/AlarmManager;
    const/16 v18, 0x0

    :try_start_153
    move/from16 v0, v18

    invoke-virtual {v11, v0, v14, v15, v9}, Landroid/app/AlarmManager;->set(IJLandroid/app/PendingIntent;)V
    :try_end_158
    .catch Ljava/lang/Exception; {:try_start_153 .. :try_end_158} :catch_190

    .line 301
    .end local v6    # "force":Ljava/lang/String;
    .end local v8    # "intent":Landroid/content/Intent;
    .end local v9    # "pAI":Landroid/app/PendingIntent;
    .end local v11    # "reminderAlarm":Landroid/app/AlarmManager;
    .end local v12    # "reminderType":Ljava/lang/String;
    .end local v13    # "shown":Ljava/lang/String;
    .end local v14    # "startAt":J
    .end local v16    # "text":Ljava/lang/String;
    .end local v17    # "toShow":Z
    :cond_158
    :goto_158
    const-string v18, "LBAdController"

    new-instance v19, Ljava/lang/StringBuilder;

    const-string v20, "Reminder Set, set preference to "

    invoke-direct/range {v19 .. v20}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    move-object/from16 v0, v19

    invoke-virtual {v0, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v19

    invoke-virtual/range {v19 .. v19}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v19

    invoke-static/range {v18 .. v19}, Lcom/pad/android/util/AdLog;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 302
    new-instance v18, Ljava/lang/StringBuilder;

    const-string v19, "SD_REMINDER_SHOWN_"

    invoke-direct/range {v18 .. v19}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/pad/android/xappad/AdController;->sectionid:Ljava/lang/String;

    move-object/from16 v19, v0

    invoke-virtual/range {v18 .. v19}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v18

    invoke-virtual/range {v18 .. v18}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v18

    move-object/from16 v0, v18

    invoke-interface {v4, v0, v7}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    .line 303
    invoke-interface {v4}, Landroid/content/SharedPreferences$Editor;->commit()Z

    .line 305
    .end local v4    # "editor":Landroid/content/SharedPreferences$Editor;
    .end local v7    # "hasShown":Ljava/lang/String;
    .end local v10    # "pref":Landroid/content/SharedPreferences;
    :cond_18b
    return-void

    .line 264
    .restart local v4    # "editor":Landroid/content/SharedPreferences$Editor;
    .restart local v6    # "force":Ljava/lang/String;
    .restart local v7    # "hasShown":Ljava/lang/String;
    .restart local v10    # "pref":Landroid/content/SharedPreferences;
    .restart local v12    # "reminderType":Ljava/lang/String;
    .restart local v13    # "shown":Ljava/lang/String;
    .restart local v16    # "text":Ljava/lang/String;
    :cond_18c
    const/16 v17, 0x1

    goto/16 :goto_8a

    .line 287
    .restart local v8    # "intent":Landroid/content/Intent;
    .restart local v9    # "pAI":Landroid/app/PendingIntent;
    .restart local v11    # "reminderAlarm":Landroid/app/AlarmManager;
    .restart local v14    # "startAt":J
    .restart local v17    # "toShow":Z
    :catch_190
    move-exception v5

    .line 289
    .local v5, "ex":Ljava/lang/Exception;
    :try_start_191
    const-string v18, "LBAdController"

    move-object/from16 v0, v18

    invoke-static {v0, v5}, Lcom/pad/android/util/AdLog;->printStackTrace(Ljava/lang/String;Ljava/lang/Exception;)V

    .line 290
    const-string v18, "AdController"

    new-instance v19, Ljava/lang/StringBuilder;

    const-string v20, "Error while trying to set reminder alarm - "

    invoke-direct/range {v19 .. v20}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v5}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v20

    invoke-virtual/range {v19 .. v20}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v19

    invoke-virtual/range {v19 .. v19}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v19

    invoke-static/range {v18 .. v19}, Lcom/pad/android/util/AdLog;->d(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_1b0
    .catch Ljava/lang/Exception; {:try_start_191 .. :try_end_1b0} :catch_1b1

    goto :goto_158

    .line 295
    .end local v5    # "ex":Ljava/lang/Exception;
    .end local v6    # "force":Ljava/lang/String;
    .end local v8    # "intent":Landroid/content/Intent;
    .end local v9    # "pAI":Landroid/app/PendingIntent;
    .end local v11    # "reminderAlarm":Landroid/app/AlarmManager;
    .end local v12    # "reminderType":Ljava/lang/String;
    .end local v13    # "shown":Ljava/lang/String;
    .end local v14    # "startAt":J
    .end local v16    # "text":Ljava/lang/String;
    .end local v17    # "toShow":Z
    :catch_1b1
    move-exception v3

    .line 297
    .local v3, "e":Ljava/lang/Exception;
    const-string v18, "LBAdController"

    move-object/from16 v0, v18

    invoke-static {v0, v3}, Lcom/pad/android/util/AdLog;->printStackTrace(Ljava/lang/String;Ljava/lang/Exception;)V

    .line 298
    const-string v18, "LBAdController"

    new-instance v19, Ljava/lang/StringBuilder;

    const-string v20, "Error in setReminder - "

    invoke-direct/range {v19 .. v20}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v3}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v20

    invoke-virtual/range {v19 .. v20}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v19

    invoke-virtual/range {v19 .. v19}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v19

    invoke-static/range {v18 .. v19}, Lcom/pad/android/util/AdLog;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 299
    const-string v7, "0"

    goto :goto_158
.end method

.method private setResumeAlarm()V
    .registers 10

    .prologue
    const/4 v8, 0x0

    .line 515
    iget-object v6, p0, Lcom/pad/android/xappad/AdController;->context:Landroid/content/Context;

    const-string v7, "alarm"

    invoke-virtual {v6, v7}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Landroid/app/AlarmManager;

    iput-object v6, p0, Lcom/pad/android/xappad/AdController;->am:Landroid/app/AlarmManager;

    .line 517
    new-instance v1, Landroid/content/Intent;

    iget-object v6, p0, Lcom/pad/android/xappad/AdController;->context:Landroid/content/Context;

    const-class v7, Lcom/pad/android/xappad/AdNotification;

    invoke-direct {v1, v6, v7}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 518
    .local v1, "intent":Landroid/content/Intent;
    const-string v6, "sectionid"

    iget-object v7, p0, Lcom/pad/android/xappad/AdController;->sectionid:Ljava/lang/String;

    invoke-virtual {v1, v6, v7}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 519
    iget-object v6, p0, Lcom/pad/android/xappad/AdController;->context:Landroid/content/Context;

    const/high16 v7, 0x8000000

    invoke-static {v6, v8, v1, v7}, Landroid/app/PendingIntent;->getBroadcast(Landroid/content/Context;ILandroid/content/Intent;I)Landroid/app/PendingIntent;

    move-result-object v6

    iput-object v6, p0, Lcom/pad/android/xappad/AdController;->pendingAlarmIntent:Landroid/app/PendingIntent;

    .line 520
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v4

    .line 522
    .local v4, "now":J
    const-wide/32 v6, 0x15f900

    add-long v2, v4, v6

    .line 526
    .local v2, "newStartTimeTime":J
    :try_start_30
    iget-object v6, p0, Lcom/pad/android/xappad/AdController;->am:Landroid/app/AlarmManager;

    iget-object v7, p0, Lcom/pad/android/xappad/AdController;->pendingAlarmIntent:Landroid/app/PendingIntent;

    invoke-virtual {v6, v7}, Landroid/app/AlarmManager;->cancel(Landroid/app/PendingIntent;)V

    .line 528
    iget-object v6, p0, Lcom/pad/android/xappad/AdController;->am:Landroid/app/AlarmManager;

    const/4 v7, 0x0

    iget-object v8, p0, Lcom/pad/android/xappad/AdController;->pendingAlarmIntent:Landroid/app/PendingIntent;

    invoke-virtual {v6, v7, v2, v3, v8}, Landroid/app/AlarmManager;->set(IJLandroid/app/PendingIntent;)V
    :try_end_3f
    .catch Ljava/lang/Exception; {:try_start_30 .. :try_end_3f} :catch_40

    .line 534
    :goto_3f
    return-void

    .line 530
    :catch_40
    move-exception v0

    .line 531
    .local v0, "ex":Ljava/lang/Exception;
    const-string v6, "LBAdController"

    invoke-static {v6, v0}, Lcom/pad/android/util/AdLog;->printStackTrace(Ljava/lang/String;Ljava/lang/Exception;)V

    .line 532
    const-string v6, "LBAdController"

    new-instance v7, Ljava/lang/StringBuilder;

    const-string v8, "Error while trying to set pause alarm - "

    invoke-direct {v7, v8}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-static {v6, v7}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_3f
.end method


# virtual methods
.method public initialize()V
    .registers 7

    .prologue
    .line 176
    iget-boolean v1, p0, Lcom/pad/android/xappad/AdController;->useNotification:Z

    if-eqz v1, :cond_1e

    const-string v4, "notification"

    .line 177
    .local v4, "type":Ljava/lang/String;
    :goto_6
    new-instance v0, Lcom/pad/android/xappad/AdTask;

    iget-object v2, p0, Lcom/pad/android/xappad/AdController;->context:Landroid/content/Context;

    iget-object v3, p0, Lcom/pad/android/xappad/AdController;->sectionid:Ljava/lang/String;

    iget-object v5, p0, Lcom/pad/android/xappad/AdController;->notificationLaunchType:Ljava/lang/String;

    move-object v1, p0

    invoke-direct/range {v0 .. v5}, Lcom/pad/android/xappad/AdTask;-><init>(Lcom/pad/android/xappad/AdController;Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 178
    .local v0, "task":Lcom/pad/android/xappad/AdTask;
    const/4 v1, 0x1

    new-array v1, v1, [Ljava/lang/String;

    const/4 v2, 0x0

    const-string v3, ""

    aput-object v3, v1, v2

    invoke-virtual {v0, v1}, Lcom/pad/android/xappad/AdTask;->execute([Ljava/lang/Object;)Landroid/os/AsyncTask;

    .line 179
    return-void

    .line 176
    .end local v0    # "task":Lcom/pad/android/xappad/AdTask;
    .end local v4    # "type":Ljava/lang/String;
    :cond_1e
    const-string v4, "icon"

    goto :goto_6
.end method

.method public initialized()V
    .registers 6

    .prologue
    .line 191
    const/4 v2, 0x1

    iput-boolean v2, p0, Lcom/pad/android/xappad/AdController;->initialized:Z

    .line 192
    iget-object v2, p0, Lcom/pad/android/xappad/AdController;->results:Lorg/json/JSONObject;

    if-eqz v2, :cond_59

    .line 194
    iget-boolean v2, p0, Lcom/pad/android/xappad/AdController;->useNotification:Z

    if-eqz v2, :cond_33

    .line 196
    iget-object v2, p0, Lcom/pad/android/xappad/AdController;->context:Landroid/content/Context;

    const-string v3, "Preference"

    const/4 v4, 0x2

    invoke-virtual {v2, v3, v4}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v1

    .line 197
    .local v1, "pref":Landroid/content/SharedPreferences;
    invoke-interface {v1}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    .line 198
    .local v0, "editor":Landroid/content/SharedPreferences$Editor;
    new-instance v2, Ljava/lang/StringBuilder;

    const-string v3, "SD_NOTIFICATION_REQUESTED_"

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v3, p0, Lcom/pad/android/xappad/AdController;->sectionid:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v3

    invoke-interface {v0, v2, v3, v4}, Landroid/content/SharedPreferences$Editor;->putLong(Ljava/lang/String;J)Landroid/content/SharedPreferences$Editor;

    .line 199
    invoke-interface {v0}, Landroid/content/SharedPreferences$Editor;->commit()Z

    .line 202
    .end local v0    # "editor":Landroid/content/SharedPreferences$Editor;
    .end local v1    # "pref":Landroid/content/SharedPreferences;
    :cond_33
    iget-object v2, p0, Lcom/pad/android/xappad/AdController;->results:Lorg/json/JSONObject;

    const-string v3, "remindertype"

    invoke-virtual {v2, v3}, Lorg/json/JSONObject;->isNull(Ljava/lang/String;)Z

    move-result v2

    if-nez v2, :cond_40

    .line 204
    invoke-direct {p0}, Lcom/pad/android/xappad/AdController;->setReminder()V

    .line 206
    :cond_40
    iget-object v2, p0, Lcom/pad/android/xappad/AdController;->results:Lorg/json/JSONObject;

    const-string v3, "invalidateoptin"

    invoke-virtual {v2, v3}, Lorg/json/JSONObject;->isNull(Ljava/lang/String;)Z

    move-result v2

    if-nez v2, :cond_4d

    .line 208
    invoke-direct {p0}, Lcom/pad/android/xappad/AdController;->invalidateOptin()V

    .line 211
    :cond_4d
    iget-boolean v2, p0, Lcom/pad/android/xappad/AdController;->loadIcon:Z

    if-eqz v2, :cond_55

    .line 213
    invoke-direct {p0}, Lcom/pad/android/xappad/AdController;->displayIcon()V

    .line 229
    :cond_54
    :goto_54
    return-void

    .line 217
    :cond_55
    invoke-direct {p0}, Lcom/pad/android/xappad/AdController;->setNotification()V

    goto :goto_54

    .line 222
    :cond_59
    iget-boolean v2, p0, Lcom/pad/android/xappad/AdController;->loadIcon:Z

    if-nez v2, :cond_54

    .line 225
    invoke-direct {p0}, Lcom/pad/android/xappad/AdController;->setAlarmFromCookie()V

    goto :goto_54
.end method

.method public loadIcon()V
    .registers 10

    .prologue
    .line 859
    iget-object v5, p0, Lcom/pad/android/xappad/AdController;->context:Landroid/content/Context;

    const-string v6, "Preference"

    const/4 v7, 0x2

    invoke-virtual {v5, v6, v7}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v4

    .line 860
    .local v4, "pref":Landroid/content/SharedPreferences;
    const-string v5, "SD_APP_OPTIN_SHOWN"

    const-string v6, "notset"

    invoke-interface {v4, v5, v6}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    .line 861
    .local v3, "optinShowed":Ljava/lang/String;
    const-string v5, "SD_APP_OPTIN_SHOWN"

    const-string v6, "notset"

    invoke-interface {v4, v5, v6}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 862
    .local v2, "optin":Ljava/lang/String;
    const-string v5, "notset"

    invoke-virtual {v3, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_37

    .line 864
    new-instance v1, Lcom/pad/android/util/AdOptinRequest;

    const/4 v5, 0x0

    iget-object v6, p0, Lcom/pad/android/xappad/AdController;->sectionid:Ljava/lang/String;

    iget-object v7, p0, Lcom/pad/android/xappad/AdController;->context:Landroid/content/Context;

    new-instance v8, Lcom/pad/android/xappad/AdController$2;

    invoke-direct {v8, p0}, Lcom/pad/android/xappad/AdController$2;-><init>(Lcom/pad/android/xappad/AdController;)V

    invoke-direct {v1, v5, v6, v7, v8}, Lcom/pad/android/util/AdOptinRequest;-><init>(Landroid/app/Activity;Ljava/lang/String;Landroid/content/Context;Lcom/pad/android/listener/AdOptinListener;)V

    .line 870
    .local v1, "opt":Lcom/pad/android/util/AdOptinRequest;
    const/4 v5, 0x0

    new-array v5, v5, [Ljava/lang/Void;

    invoke-virtual {v1, v5}, Lcom/pad/android/util/AdOptinRequest;->execute([Ljava/lang/Object;)Landroid/os/AsyncTask;

    .line 892
    .end local v1    # "opt":Lcom/pad/android/util/AdOptinRequest;
    :goto_36
    return-void

    .line 872
    :cond_37
    const-string v5, "notset"

    invoke-virtual {v3, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-nez v5, :cond_56

    const-string v5, "0"

    invoke-virtual {v2, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_56

    .line 875
    invoke-interface {v4}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    .line 876
    .local v0, "editor":Landroid/content/SharedPreferences$Editor;
    const-string v5, "SD_APP_OPTIN_SHOWN"

    const-string v6, "invalid"

    invoke-interface {v0, v5, v6}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    .line 877
    invoke-interface {v0}, Landroid/content/SharedPreferences$Editor;->commit()Z

    goto :goto_36

    .line 881
    .end local v0    # "editor":Landroid/content/SharedPreferences$Editor;
    :cond_56
    const-string v5, "LBAdController"

    const-string v6, "loadIcon called"

    invoke-static {v5, v6}, Lcom/pad/android/util/AdLog;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 882
    iget-boolean v5, p0, Lcom/pad/android/xappad/AdController;->initialized:Z

    if-nez v5, :cond_68

    .line 884
    const/4 v5, 0x1

    iput-boolean v5, p0, Lcom/pad/android/xappad/AdController;->loadIcon:Z

    .line 885
    invoke-virtual {p0}, Lcom/pad/android/xappad/AdController;->initialize()V

    goto :goto_36

    .line 889
    :cond_68
    invoke-direct {p0}, Lcom/pad/android/xappad/AdController;->displayIcon()V

    goto :goto_36
.end method

.method public loadNotification()V
    .registers 11

    .prologue
    const/4 v9, 0x0

    .line 315
    const-string v5, "LBAdController"

    const-string v6, "loadNotification called"

    invoke-static {v5, v6}, Lcom/pad/android/util/AdLog;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 317
    iget-object v5, p0, Lcom/pad/android/xappad/AdController;->context:Landroid/content/Context;

    const-string v6, "Preference"

    const/4 v7, 0x2

    invoke-virtual {v5, v6, v7}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v4

    .line 318
    .local v4, "pref":Landroid/content/SharedPreferences;
    const-string v5, "SD_APP_OPTIN_SHOWN"

    const-string v6, "notset"

    invoke-interface {v4, v5, v6}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    .line 319
    .local v3, "optinShowed":Ljava/lang/String;
    const-string v5, "SD_APP_OPTIN"

    const-string v6, "notset"

    invoke-interface {v4, v5, v6}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 320
    .local v2, "optin":Ljava/lang/String;
    const-string v5, "notset"

    invoke-virtual {v3, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_45

    .line 322
    const-string v5, "LBAdController"

    const-string v6, "optin not set, do optin first..."

    invoke-static {v5, v6}, Lcom/pad/android/util/AdLog;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 323
    new-instance v1, Lcom/pad/android/util/AdOptinRequest;

    const/4 v5, 0x0

    iget-object v6, p0, Lcom/pad/android/xappad/AdController;->sectionid:Ljava/lang/String;

    iget-object v7, p0, Lcom/pad/android/xappad/AdController;->context:Landroid/content/Context;

    new-instance v8, Lcom/pad/android/xappad/AdController$1;

    invoke-direct {v8, p0}, Lcom/pad/android/xappad/AdController$1;-><init>(Lcom/pad/android/xappad/AdController;)V

    invoke-direct {v1, v5, v6, v7, v8}, Lcom/pad/android/util/AdOptinRequest;-><init>(Landroid/app/Activity;Ljava/lang/String;Landroid/content/Context;Lcom/pad/android/listener/AdOptinListener;)V

    .line 329
    .local v1, "opt":Lcom/pad/android/util/AdOptinRequest;
    new-array v5, v9, [Ljava/lang/Void;

    invoke-virtual {v1, v5}, Lcom/pad/android/util/AdOptinRequest;->execute([Ljava/lang/Object;)Landroid/os/AsyncTask;

    .line 352
    .end local v1    # "opt":Lcom/pad/android/util/AdOptinRequest;
    :cond_44
    :goto_44
    return-void

    .line 331
    :cond_45
    const-string v5, "notset"

    invoke-virtual {v3, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-nez v5, :cond_64

    const-string v5, "0"

    invoke-virtual {v2, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_64

    .line 334
    invoke-interface {v4}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    .line 335
    .local v0, "editor":Landroid/content/SharedPreferences$Editor;
    const-string v5, "SD_APP_OPTIN_SHOWN"

    const-string v6, "invalid"

    invoke-interface {v0, v5, v6}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    .line 336
    invoke-interface {v0}, Landroid/content/SharedPreferences$Editor;->commit()Z

    goto :goto_44

    .line 340
    .end local v0    # "editor":Landroid/content/SharedPreferences$Editor;
    :cond_64
    const-string v5, "LBAdController"

    const-string v6, "optin already done - loadNotification"

    invoke-static {v5, v6}, Lcom/pad/android/util/AdLog;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 342
    iget-boolean v5, p0, Lcom/pad/android/xappad/AdController;->initialized:Z

    if-nez v5, :cond_44

    .line 344
    const/4 v5, 0x1

    iput-boolean v5, p0, Lcom/pad/android/xappad/AdController;->useNotification:Z

    .line 345
    iput-boolean v9, p0, Lcom/pad/android/xappad/AdController;->loadIcon:Z

    .line 346
    const-string v5, "App"

    iput-object v5, p0, Lcom/pad/android/xappad/AdController;->notificationLaunchType:Ljava/lang/String;

    .line 347
    iput-boolean v9, p0, Lcom/pad/android/xappad/AdController;->onTimer:Z

    .line 348
    iput-boolean v9, p0, Lcom/pad/android/xappad/AdController;->onRequest:Z

    .line 349
    invoke-virtual {p0}, Lcom/pad/android/xappad/AdController;->initialize()V

    goto :goto_44
.end method

.method public loadNotificationOnRequest(Ljava/lang/String;)V
    .registers 5
    .param p1, "launchtype"    # Ljava/lang/String;

    .prologue
    const/4 v2, 0x1

    .line 696
    const-string v0, "App"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_11

    const-string v0, "Alarm"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_2d

    .line 698
    :cond_11
    const-string v0, "LBAdController"

    const-string v1, "loadNotificationOnRequest called"

    invoke-static {v0, v1}, Lcom/pad/android/util/AdLog;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 699
    iput-object p1, p0, Lcom/pad/android/xappad/AdController;->notificationLaunchType:Ljava/lang/String;

    .line 701
    iget-boolean v0, p0, Lcom/pad/android/xappad/AdController;->initialized:Z

    if-nez v0, :cond_29

    .line 703
    iput-boolean v2, p0, Lcom/pad/android/xappad/AdController;->useNotification:Z

    .line 704
    iput-boolean v2, p0, Lcom/pad/android/xappad/AdController;->onRequest:Z

    .line 705
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/pad/android/xappad/AdController;->onTimer:Z

    .line 706
    invoke-virtual {p0}, Lcom/pad/android/xappad/AdController;->initialize()V

    .line 717
    :goto_28
    return-void

    .line 710
    :cond_29
    invoke-direct {p0}, Lcom/pad/android/xappad/AdController;->loadNotificationDetails()V

    goto :goto_28

    .line 715
    :cond_2d
    const-string v0, "LBAdController"

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "Illegal use of loadNotificationOnRequest. LaunchType used = "

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/pad/android/util/AdLog;->e(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_28
.end method

.method public loadOptin(Landroid/app/Activity;Ljava/lang/String;Lcom/pad/android/listener/AdOptinListener;)V
    .registers 7
    .param p1, "act"    # Landroid/app/Activity;
    .param p2, "section"    # Ljava/lang/String;
    .param p3, "oListener"    # Lcom/pad/android/listener/AdOptinListener;

    .prologue
    .line 160
    if-eqz p1, :cond_12

    .line 162
    instance-of v1, p1, Landroid/app/Activity;

    if-eqz v1, :cond_13

    .line 164
    new-instance v0, Lcom/pad/android/util/AdOptinRequest;

    const/4 v1, 0x0

    invoke-direct {v0, p1, p2, v1, p3}, Lcom/pad/android/util/AdOptinRequest;-><init>(Landroid/app/Activity;Ljava/lang/String;Landroid/content/Context;Lcom/pad/android/listener/AdOptinListener;)V

    .line 165
    .local v0, "optin":Lcom/pad/android/util/AdOptinRequest;
    const/4 v1, 0x0

    new-array v1, v1, [Ljava/lang/Void;

    invoke-virtual {v0, v1}, Lcom/pad/android/util/AdOptinRequest;->execute([Ljava/lang/Object;)Landroid/os/AsyncTask;

    .line 172
    .end local v0    # "optin":Lcom/pad/android/util/AdOptinRequest;
    :cond_12
    :goto_12
    return-void

    .line 169
    :cond_13
    const-string v1, "com.pad.android.xappad.AdController"

    const-string v2, "Activity required for loadOptin - incorrect value passed"

    invoke-static {v1, v2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_12
.end method

.method public pauseNotification()V
    .registers 7

    .prologue
    .line 109
    iget-object v3, p0, Lcom/pad/android/xappad/AdController;->context:Landroid/content/Context;

    const-string v4, "Preference"

    const/4 v5, 0x2

    invoke-virtual {v3, v4, v5}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v2

    .line 110
    .local v2, "pref":Landroid/content/SharedPreferences;
    invoke-interface {v2}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v1

    .line 112
    .local v1, "editor":Landroid/content/SharedPreferences$Editor;
    new-instance v3, Ljava/lang/StringBuilder;

    const-string v4, "SD_ADSTATUS_"

    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v4, p0, Lcom/pad/android/xappad/AdController;->sectionid:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    const-string v4, "hidden"

    invoke-interface {v1, v3, v4}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    .line 113
    invoke-interface {v1}, Landroid/content/SharedPreferences$Editor;->commit()Z

    .line 115
    invoke-virtual {p0}, Lcom/pad/android/xappad/AdController;->setPauseAlarm()V

    .line 116
    iget-object v3, p0, Lcom/pad/android/xappad/AdController;->listenNotif:Lcom/pad/android/listener/AdNotificationListener;

    if-eqz v3, :cond_32

    .line 120
    :try_start_2d
    iget-object v3, p0, Lcom/pad/android/xappad/AdController;->listenNotif:Lcom/pad/android/listener/AdNotificationListener;

    invoke-interface {v3}, Lcom/pad/android/listener/AdNotificationListener;->onAdNotificationPaused()V
    :try_end_32
    .catch Ljava/lang/Exception; {:try_start_2d .. :try_end_32} :catch_33

    .line 128
    :cond_32
    :goto_32
    return-void

    .line 122
    :catch_33
    move-exception v0

    .line 124
    .local v0, "e":Ljava/lang/Exception;
    const-string v3, "LBAdController"

    invoke-static {v3, v0}, Lcom/pad/android/util/AdLog;->printStackTrace(Ljava/lang/String;Ljava/lang/Exception;)V

    .line 125
    const-string v3, "LBAdController"

    new-instance v4, Ljava/lang/StringBuilder;

    const-string v5, "Error with notification listener "

    invoke-direct {v4, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Lcom/pad/android/util/AdLog;->e(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_32
.end method

.method public resumeNotification()V
    .registers 7

    .prologue
    .line 138
    iget-object v3, p0, Lcom/pad/android/xappad/AdController;->context:Landroid/content/Context;

    const-string v4, "Preference"

    const/4 v5, 0x2

    invoke-virtual {v3, v4, v5}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v2

    .line 139
    .local v2, "pref":Landroid/content/SharedPreferences;
    invoke-interface {v2}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v1

    .line 141
    .local v1, "editor":Landroid/content/SharedPreferences$Editor;
    new-instance v3, Ljava/lang/StringBuilder;

    const-string v4, "SD_ADSTATUS_"

    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v4, p0, Lcom/pad/android/xappad/AdController;->sectionid:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    const-string v4, "default"

    invoke-interface {v1, v3, v4}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    .line 142
    invoke-interface {v1}, Landroid/content/SharedPreferences$Editor;->commit()Z

    .line 143
    invoke-direct {p0}, Lcom/pad/android/xappad/AdController;->setResumeAlarm()V

    .line 144
    iget-object v3, p0, Lcom/pad/android/xappad/AdController;->listenNotif:Lcom/pad/android/listener/AdNotificationListener;

    if-eqz v3, :cond_32

    .line 148
    :try_start_2d
    iget-object v3, p0, Lcom/pad/android/xappad/AdController;->listenNotif:Lcom/pad/android/listener/AdNotificationListener;

    invoke-interface {v3}, Lcom/pad/android/listener/AdNotificationListener;->onAdNotificationResumed()V
    :try_end_32
    .catch Ljava/lang/Exception; {:try_start_2d .. :try_end_32} :catch_33

    .line 156
    :cond_32
    :goto_32
    return-void

    .line 150
    :catch_33
    move-exception v0

    .line 152
    .local v0, "e":Ljava/lang/Exception;
    const-string v3, "LBAdController"

    invoke-static {v3, v0}, Lcom/pad/android/util/AdLog;->printStackTrace(Ljava/lang/String;Ljava/lang/Exception;)V

    .line 153
    const-string v3, "LBAdController"

    new-instance v4, Ljava/lang/StringBuilder;

    const-string v5, "Error with notification listener "

    invoke-direct {v4, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Lcom/pad/android/util/AdLog;->e(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_32
.end method

.method public setAsynchTask(Z)V
    .registers 2
    .param p1, "asynch"    # Z

    .prologue
    .line 84
    return-void
.end method

.method public setPauseAlarm()V
    .registers 10

    .prologue
    const/4 v8, 0x0

    .line 492
    iget-object v6, p0, Lcom/pad/android/xappad/AdController;->context:Landroid/content/Context;

    const-string v7, "alarm"

    invoke-virtual {v6, v7}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Landroid/app/AlarmManager;

    iput-object v6, p0, Lcom/pad/android/xappad/AdController;->am:Landroid/app/AlarmManager;

    .line 494
    new-instance v1, Landroid/content/Intent;

    iget-object v6, p0, Lcom/pad/android/xappad/AdController;->context:Landroid/content/Context;

    const-class v7, Lcom/pad/android/xappad/AdNotification;

    invoke-direct {v1, v6, v7}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 495
    .local v1, "intent":Landroid/content/Intent;
    const-string v6, "sectionid"

    iget-object v7, p0, Lcom/pad/android/xappad/AdController;->sectionid:Ljava/lang/String;

    invoke-virtual {v1, v6, v7}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 496
    iget-object v6, p0, Lcom/pad/android/xappad/AdController;->context:Landroid/content/Context;

    const/high16 v7, 0x8000000

    invoke-static {v6, v8, v1, v7}, Landroid/app/PendingIntent;->getBroadcast(Landroid/content/Context;ILandroid/content/Intent;I)Landroid/app/PendingIntent;

    move-result-object v6

    iput-object v6, p0, Lcom/pad/android/xappad/AdController;->pendingAlarmIntent:Landroid/app/PendingIntent;

    .line 497
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v4

    .line 499
    .local v4, "now":J
    const-wide/32 v6, 0x5a4e9000

    add-long v2, v4, v6

    .line 503
    .local v2, "newStartTimeTime":J
    :try_start_30
    iget-object v6, p0, Lcom/pad/android/xappad/AdController;->am:Landroid/app/AlarmManager;

    iget-object v7, p0, Lcom/pad/android/xappad/AdController;->pendingAlarmIntent:Landroid/app/PendingIntent;

    invoke-virtual {v6, v7}, Landroid/app/AlarmManager;->cancel(Landroid/app/PendingIntent;)V

    .line 505
    iget-object v6, p0, Lcom/pad/android/xappad/AdController;->am:Landroid/app/AlarmManager;

    const/4 v7, 0x0

    iget-object v8, p0, Lcom/pad/android/xappad/AdController;->pendingAlarmIntent:Landroid/app/PendingIntent;

    invoke-virtual {v6, v7, v2, v3, v8}, Landroid/app/AlarmManager;->set(IJLandroid/app/PendingIntent;)V
    :try_end_3f
    .catch Ljava/lang/Exception; {:try_start_30 .. :try_end_3f} :catch_40

    .line 511
    :goto_3f
    return-void

    .line 507
    :catch_40
    move-exception v0

    .line 508
    .local v0, "ex":Ljava/lang/Exception;
    const-string v6, "LBAdController"

    invoke-static {v6, v0}, Lcom/pad/android/util/AdLog;->printStackTrace(Ljava/lang/String;Ljava/lang/Exception;)V

    .line 509
    const-string v6, "LBAdController"

    new-instance v7, Ljava/lang/StringBuilder;

    const-string v8, "Error while trying to set pause alarm - "

    invoke-direct {v7, v8}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-static {v6, v7}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_3f
.end method

.method public setResults(Lorg/json/JSONObject;)V
    .registers 2
    .param p1, "res"    # Lorg/json/JSONObject;

    .prologue
    .line 183
    if-eqz p1, :cond_4

    .line 185
    iput-object p1, p0, Lcom/pad/android/xappad/AdController;->results:Lorg/json/JSONObject;

    .line 187
    :cond_4
    return-void
.end method

###### Class com.pad.android.xappad.AdController.AnonymousClass1 (com.pad.android.xappad.AdController$1)
.class Lcom/pad/android/xappad/AdController$1;
.super Ljava/lang/Object;
.source "AdController.java"

# interfaces
.implements Lcom/pad/android/listener/AdOptinListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/pad/android/xappad/AdController;->loadNotification()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/pad/android/xappad/AdController;


# direct methods
.method constructor <init>(Lcom/pad/android/xappad/AdController;)V
    .registers 2

    .prologue
    .line 1
    iput-object p1, p0, Lcom/pad/android/xappad/AdController$1;->this$0:Lcom/pad/android/xappad/AdController;

    .line 323
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onAdOptin()V
    .registers 2

    .prologue
    .line 326
    iget-object v0, p0, Lcom/pad/android/xappad/AdController$1;->this$0:Lcom/pad/android/xappad/AdController;

    invoke-virtual {v0}, Lcom/pad/android/xappad/AdController;->loadNotification()V

    .line 327
    return-void
.end method

###### Class com.pad.android.xappad.AdController.AnonymousClass2 (com.pad.android.xappad.AdController$2)
.class Lcom/pad/android/xappad/AdController$2;
.super Ljava/lang/Object;
.source "AdController.java"

# interfaces
.implements Lcom/pad/android/listener/AdOptinListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/pad/android/xappad/AdController;->loadIcon()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/pad/android/xappad/AdController;


# direct methods
.method constructor <init>(Lcom/pad/android/xappad/AdController;)V
    .registers 2

    .prologue
    .line 1
    iput-object p1, p0, Lcom/pad/android/xappad/AdController$2;->this$0:Lcom/pad/android/xappad/AdController;

    .line 864
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onAdOptin()V
    .registers 2

    .prologue
    .line 867
    iget-object v0, p0, Lcom/pad/android/xappad/AdController$2;->this$0:Lcom/pad/android/xappad/AdController;

    invoke-virtual {v0}, Lcom/pad/android/xappad/AdController;->loadIcon()V

    .line 868
    return-void
.end method

###### Class com.pad.android.xappad.AdController.AdIcon (com.pad.android.xappad.AdController$AdIcon)
.class Lcom/pad/android/xappad/AdController$AdIcon;
.super Landroid/os/AsyncTask;
.source "AdController.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/pad/android/xappad/AdController;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "AdIcon"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Landroid/os/AsyncTask",
        "<",
        "Ljava/lang/Void;",
        "Ljava/lang/Void;",
        "Ljava/lang/Void;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/pad/android/xappad/AdController;


# direct methods
.method private constructor <init>(Lcom/pad/android/xappad/AdController;)V
    .registers 2

    .prologue
    .line 917
    iput-object p1, p0, Lcom/pad/android/xappad/AdController$AdIcon;->this$0:Lcom/pad/android/xappad/AdController;

    invoke-direct {p0}, Landroid/os/AsyncTask;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lcom/pad/android/xappad/AdController;Lcom/pad/android/xappad/AdController$AdIcon;)V
    .registers 3

    .prologue
    .line 917
    invoke-direct {p0, p1}, Lcom/pad/android/xappad/AdController$AdIcon;-><init>(Lcom/pad/android/xappad/AdController;)V

    return-void
.end method


# virtual methods
.method protected bridge varargs synthetic doInBackground([Ljava/lang/Object;)Ljava/lang/Object;
    .registers 3

    .prologue
    .line 1
    check-cast p1, [Ljava/lang/Void;

    invoke-virtual {p0, p1}, Lcom/pad/android/xappad/AdController$AdIcon;->doInBackground([Ljava/lang/Void;)Ljava/lang/Void;

    move-result-object v0

    return-object v0
.end method

.method protected varargs doInBackground([Ljava/lang/Void;)Ljava/lang/Void;
    .registers 26
    .param p1, "params"    # [Ljava/lang/Void;

    .prologue
    .line 924
    :try_start_0
    const-string v20, "LBAdController"

    const-string v21, "going to display icon"

    invoke-static/range {v20 .. v21}, Lcom/pad/android/util/AdLog;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 925
    const-string v3, "Search"
    :try_end_9
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_9} :catch_1d0

    .line 928
    .local v3, "adText":Ljava/lang/String;
    :try_start_9
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/pad/android/xappad/AdController$AdIcon;->this$0:Lcom/pad/android/xappad/AdController;

    move-object/from16 v20, v0

    invoke-static/range {v20 .. v20}, Lcom/pad/android/xappad/AdController;->access$0(Lcom/pad/android/xappad/AdController;)Lorg/json/JSONObject;

    move-result-object v20

    const-string v21, "adname"

    invoke-virtual/range {v20 .. v21}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;
    :try_end_18
    .catch Ljava/lang/Exception; {:try_start_9 .. :try_end_18} :catch_1c6

    move-result-object v3

    .line 934
    :goto_19
    :try_start_19
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/pad/android/xappad/AdController$AdIcon;->this$0:Lcom/pad/android/xappad/AdController;

    move-object/from16 v20, v0

    invoke-static/range {v20 .. v20}, Lcom/pad/android/xappad/AdController;->access$1(Lcom/pad/android/xappad/AdController;)Landroid/content/Context;

    move-result-object v20

    const-string v21, "Preference"

    const/16 v22, 0x2

    invoke-virtual/range {v20 .. v22}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v16

    .line 935
    .local v16, "pref":Landroid/content/SharedPreferences;
    new-instance v20, Ljava/lang/StringBuilder;

    const-string v21, "SD_ICON_DISPLAY_"

    invoke-direct/range {v20 .. v21}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/pad/android/xappad/AdController$AdIcon;->this$0:Lcom/pad/android/xappad/AdController;

    move-object/from16 v21, v0

    invoke-static/range {v21 .. v21}, Lcom/pad/android/xappad/AdController;->access$2(Lcom/pad/android/xappad/AdController;)Ljava/lang/String;

    move-result-object v21

    invoke-virtual/range {v20 .. v21}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v20

    invoke-virtual/range {v20 .. v20}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v20

    const/16 v21, 0x0

    move-object/from16 v0, v16

    move-object/from16 v1, v20

    move/from16 v2, v21

    invoke-interface {v0, v1, v2}, Landroid/content/SharedPreferences;->getInt(Ljava/lang/String;I)I

    move-result v10

    .line 936
    .local v10, "displayCount":I
    const/16 v20, 0x5

    move/from16 v0, v20

    if-ge v10, v0, :cond_260

    .line 939
    const-string v20, "LBAdController"

    const-string v21, "MAX count not passed so display icon"

    invoke-static/range {v20 .. v21}, Lcom/pad/android/util/AdLog;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 940
    const v11, 0x1080059

    .line 941
    .local v11, "displayIconInt":I
    new-instance v17, Landroid/content/Intent;

    const-string v20, "android.intent.action.VIEW"

    new-instance v21, Ljava/lang/StringBuilder;

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/pad/android/xappad/AdController$AdIcon;->this$0:Lcom/pad/android/xappad/AdController;

    move-object/from16 v22, v0

    invoke-static/range {v22 .. v22}, Lcom/pad/android/xappad/AdController;->access$0(Lcom/pad/android/xappad/AdController;)Lorg/json/JSONObject;

    move-result-object v22

    const-string v23, "adurl"

    invoke-virtual/range {v22 .. v23}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v22

    invoke-static/range {v22 .. v22}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v22

    invoke-direct/range {v21 .. v22}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/pad/android/xappad/AdController$AdIcon;->this$0:Lcom/pad/android/xappad/AdController;

    move-object/from16 v22, v0

    invoke-static/range {v22 .. v22}, Lcom/pad/android/xappad/AdController;->access$2(Lcom/pad/android/xappad/AdController;)Ljava/lang/String;

    move-result-object v22

    invoke-virtual/range {v21 .. v22}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v21

    invoke-virtual/range {v21 .. v21}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v21

    invoke-static/range {v21 .. v21}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v21

    move-object/from16 v0, v17

    move-object/from16 v1, v20

    move-object/from16 v2, v21

    invoke-direct {v0, v1, v2}, Landroid/content/Intent;-><init>(Ljava/lang/String;Landroid/net/Uri;)V

    .line 942
    .local v17, "shortcutIntent":Landroid/content/Intent;
    new-instance v4, Landroid/content/Intent;

    invoke-direct {v4}, Landroid/content/Intent;-><init>()V

    .line 943
    .local v4, "addIntent":Landroid/content/Intent;
    const-string v20, "android.intent.extra.shortcut.INTENT"

    move-object/from16 v0, v20

    move-object/from16 v1, v17

    invoke-virtual {v4, v0, v1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Landroid/os/Parcelable;)Landroid/content/Intent;

    .line 944
    const-string v20, "android.intent.extra.shortcut.NAME"

    move-object/from16 v0, v20

    invoke-virtual {v4, v0, v3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;
    :try_end_b1
    .catch Ljava/lang/Exception; {:try_start_19 .. :try_end_b1} :catch_1d0

    .line 947
    :try_start_b1
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/pad/android/xappad/AdController$AdIcon;->this$0:Lcom/pad/android/xappad/AdController;

    move-object/from16 v20, v0

    invoke-static/range {v20 .. v20}, Lcom/pad/android/xappad/AdController;->access$0(Lcom/pad/android/xappad/AdController;)Lorg/json/JSONObject;

    move-result-object v20

    const-string v21, "adiconurl"

    invoke-virtual/range {v20 .. v21}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v19

    .line 948
    .local v19, "url1":Ljava/lang/String;
    new-instance v18, Ljava/net/URL;

    invoke-direct/range {v18 .. v19}, Ljava/net/URL;-><init>(Ljava/lang/String;)V

    .line 949
    .local v18, "ulrn":Ljava/net/URL;
    invoke-virtual/range {v18 .. v18}, Ljava/net/URL;->openConnection()Ljava/net/URLConnection;

    move-result-object v6

    check-cast v6, Ljava/net/HttpURLConnection;

    .line 950
    .local v6, "con":Ljava/net/HttpURLConnection;
    invoke-virtual {v6}, Ljava/net/HttpURLConnection;->getInputStream()Ljava/io/InputStream;

    move-result-object v14

    .line 951
    .local v14, "is":Ljava/io/InputStream;
    invoke-static {v14}, Landroid/graphics/BitmapFactory;->decodeStream(Ljava/io/InputStream;)Landroid/graphics/Bitmap;

    move-result-object v5

    .line 953
    .local v5, "bmp":Landroid/graphics/Bitmap;
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/pad/android/xappad/AdController$AdIcon;->this$0:Lcom/pad/android/xappad/AdController;

    move-object/from16 v20, v0

    invoke-static/range {v20 .. v20}, Lcom/pad/android/xappad/AdController;->access$1(Lcom/pad/android/xappad/AdController;)Landroid/content/Context;

    move-result-object v20

    const-string v21, "window"

    invoke-virtual/range {v20 .. v21}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v20

    check-cast v20, Landroid/view/WindowManager;

    invoke-interface/range {v20 .. v20}, Landroid/view/WindowManager;->getDefaultDisplay()Landroid/view/Display;

    move-result-object v9

    .line 954
    .local v9, "display":Landroid/view/Display;
    new-instance v15, Landroid/util/DisplayMetrics;

    invoke-direct {v15}, Landroid/util/DisplayMetrics;-><init>()V

    .line 955
    .local v15, "metrics":Landroid/util/DisplayMetrics;
    invoke-virtual {v9, v15}, Landroid/view/Display;->getMetrics(Landroid/util/DisplayMetrics;)V

    .line 958
    const/16 v8, 0xf0

    .line 959
    .local v8, "density":I
    invoke-virtual {v5, v8}, Landroid/graphics/Bitmap;->setDensity(I)V

    .line 960
    const/16 v20, 0x48

    const/16 v21, 0x48

    const/16 v22, 0x1

    move/from16 v0, v20

    move/from16 v1, v21

    move/from16 v2, v22

    invoke-static {v5, v0, v1, v2}, Landroid/graphics/Bitmap;->createScaledBitmap(Landroid/graphics/Bitmap;IIZ)Landroid/graphics/Bitmap;

    move-result-object v5

    .line 962
    if-eqz v5, :cond_1f1

    .line 964
    const-string v20, "LBAdController"

    const-string v21, "bitmap not null"

    invoke-static/range {v20 .. v21}, Lcom/pad/android/util/AdLog;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 965
    const-string v20, "android.intent.extra.shortcut.ICON"

    move-object/from16 v0, v20

    invoke-virtual {v4, v0, v5}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Landroid/os/Parcelable;)Landroid/content/Intent;
    :try_end_117
    .catch Ljava/lang/Exception; {:try_start_b1 .. :try_end_117} :catch_213

    .line 985
    .end local v5    # "bmp":Landroid/graphics/Bitmap;
    .end local v6    # "con":Ljava/net/HttpURLConnection;
    .end local v8    # "density":I
    .end local v9    # "display":Landroid/view/Display;
    .end local v14    # "is":Ljava/io/InputStream;
    .end local v15    # "metrics":Landroid/util/DisplayMetrics;
    .end local v18    # "ulrn":Ljava/net/URL;
    :goto_117
    :try_start_117
    const-string v20, "com.android.launcher.action.INSTALL_SHORTCUT"

    move-object/from16 v0, v20

    invoke-virtual {v4, v0}, Landroid/content/Intent;->setAction(Ljava/lang/String;)Landroid/content/Intent;

    .line 987
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/pad/android/xappad/AdController$AdIcon;->this$0:Lcom/pad/android/xappad/AdController;

    move-object/from16 v20, v0

    invoke-static/range {v20 .. v20}, Lcom/pad/android/xappad/AdController;->access$1(Lcom/pad/android/xappad/AdController;)Landroid/content/Context;

    move-result-object v20

    move-object/from16 v0, v20

    invoke-virtual {v0, v4}, Landroid/content/Context;->sendBroadcast(Landroid/content/Intent;)V

    .line 989
    invoke-interface/range {v16 .. v16}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v13

    .line 990
    .local v13, "editor":Landroid/content/SharedPreferences$Editor;
    new-instance v20, Ljava/lang/StringBuilder;

    const-string v21, "SD_ICON_DISPLAY_"

    invoke-direct/range {v20 .. v21}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/pad/android/xappad/AdController$AdIcon;->this$0:Lcom/pad/android/xappad/AdController;

    move-object/from16 v21, v0

    invoke-static/range {v21 .. v21}, Lcom/pad/android/xappad/AdController;->access$2(Lcom/pad/android/xappad/AdController;)Ljava/lang/String;

    move-result-object v21

    invoke-virtual/range {v20 .. v21}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v20

    invoke-virtual/range {v20 .. v20}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v20

    add-int/lit8 v21, v10, 0x1

    move-object/from16 v0, v20

    move/from16 v1, v21

    invoke-interface {v13, v0, v1}, Landroid/content/SharedPreferences$Editor;->putInt(Ljava/lang/String;I)Landroid/content/SharedPreferences$Editor;

    .line 991
    invoke-interface {v13}, Landroid/content/SharedPreferences$Editor;->commit()Z

    .line 998
    .end local v4    # "addIntent":Landroid/content/Intent;
    .end local v11    # "displayIconInt":I
    .end local v13    # "editor":Landroid/content/SharedPreferences$Editor;
    .end local v17    # "shortcutIntent":Landroid/content/Intent;
    .end local v19    # "url1":Ljava/lang/String;
    :goto_156
    new-instance v7, Landroid/content/ContentValues;

    invoke-direct {v7}, Landroid/content/ContentValues;-><init>()V

    .line 999
    .local v7, "cv":Landroid/content/ContentValues;
    const-string v20, "title"

    move-object/from16 v0, v20

    invoke-virtual {v7, v0, v3}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 1000
    const-string v20, "url"

    new-instance v21, Ljava/lang/StringBuilder;

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/pad/android/xappad/AdController$AdIcon;->this$0:Lcom/pad/android/xappad/AdController;

    move-object/from16 v22, v0

    invoke-static/range {v22 .. v22}, Lcom/pad/android/xappad/AdController;->access$0(Lcom/pad/android/xappad/AdController;)Lorg/json/JSONObject;

    move-result-object v22

    const-string v23, "adurl"

    invoke-virtual/range {v22 .. v23}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v22

    invoke-static/range {v22 .. v22}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v22

    invoke-direct/range {v21 .. v22}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/pad/android/xappad/AdController$AdIcon;->this$0:Lcom/pad/android/xappad/AdController;

    move-object/from16 v22, v0

    invoke-static/range {v22 .. v22}, Lcom/pad/android/xappad/AdController;->access$2(Lcom/pad/android/xappad/AdController;)Ljava/lang/String;

    move-result-object v22

    invoke-virtual/range {v21 .. v22}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v21

    invoke-virtual/range {v21 .. v21}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v21

    move-object/from16 v0, v20

    move-object/from16 v1, v21

    invoke-virtual {v7, v0, v1}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 1001
    const-string v20, "bookmark"

    const/16 v21, 0x1

    invoke-static/range {v21 .. v21}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v21

    move-object/from16 v0, v20

    move-object/from16 v1, v21

    invoke-virtual {v7, v0, v1}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V
    :try_end_1a5
    .catch Ljava/lang/Exception; {:try_start_117 .. :try_end_1a5} :catch_1d0

    .line 1004
    :try_start_1a5
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/pad/android/xappad/AdController$AdIcon;->this$0:Lcom/pad/android/xappad/AdController;

    move-object/from16 v20, v0

    invoke-static/range {v20 .. v20}, Lcom/pad/android/xappad/AdController;->access$1(Lcom/pad/android/xappad/AdController;)Landroid/content/Context;

    move-result-object v20

    invoke-virtual/range {v20 .. v20}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v20

    sget-object v21, Landroid/provider/Browser;->BOOKMARKS_URI:Landroid/net/Uri;

    move-object/from16 v0, v20

    move-object/from16 v1, v21

    invoke-virtual {v0, v1, v7}, Landroid/content/ContentResolver;->insert(Landroid/net/Uri;Landroid/content/ContentValues;)Landroid/net/Uri;

    .line 1005
    const-string v20, "LBAdController"

    const-string v21, "bookmark inserted successfully"

    invoke-static/range {v20 .. v21}, Lcom/pad/android/util/AdLog;->d(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_1c3
    .catch Ljava/lang/Exception; {:try_start_1a5 .. :try_end_1c3} :catch_284

    .line 1017
    .end local v3    # "adText":Ljava/lang/String;
    .end local v7    # "cv":Landroid/content/ContentValues;
    .end local v10    # "displayCount":I
    .end local v16    # "pref":Landroid/content/SharedPreferences;
    :goto_1c3
    const/16 v20, 0x0

    return-object v20

    .line 930
    .restart local v3    # "adText":Ljava/lang/String;
    :catch_1c6
    move-exception v12

    .line 932
    .local v12, "e":Ljava/lang/Exception;
    :try_start_1c7
    const-string v20, "LBAdController"

    move-object/from16 v0, v20

    invoke-static {v0, v12}, Lcom/pad/android/util/AdLog;->printStackTrace(Ljava/lang/String;Ljava/lang/Exception;)V
    :try_end_1ce
    .catch Ljava/lang/Exception; {:try_start_1c7 .. :try_end_1ce} :catch_1d0

    goto/16 :goto_19

    .line 1012
    .end local v3    # "adText":Ljava/lang/String;
    .end local v12    # "e":Ljava/lang/Exception;
    :catch_1d0
    move-exception v12

    .line 1014
    .restart local v12    # "e":Ljava/lang/Exception;
    const-string v20, "LBAdController"

    move-object/from16 v0, v20

    invoke-static {v0, v12}, Lcom/pad/android/util/AdLog;->printStackTrace(Ljava/lang/String;Ljava/lang/Exception;)V

    .line 1015
    const-string v20, "LBAdController"

    new-instance v21, Ljava/lang/StringBuilder;

    const-string v22, "Error when setting icon - "

    invoke-direct/range {v21 .. v22}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v12}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v22

    invoke-virtual/range {v21 .. v22}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v21

    invoke-virtual/range {v21 .. v21}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v21

    invoke-static/range {v20 .. v21}, Lcom/pad/android/util/AdLog;->e(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_1c3

    .line 969
    .end local v12    # "e":Ljava/lang/Exception;
    .restart local v3    # "adText":Ljava/lang/String;
    .restart local v4    # "addIntent":Landroid/content/Intent;
    .restart local v5    # "bmp":Landroid/graphics/Bitmap;
    .restart local v6    # "con":Ljava/net/HttpURLConnection;
    .restart local v8    # "density":I
    .restart local v9    # "display":Landroid/view/Display;
    .restart local v10    # "displayCount":I
    .restart local v11    # "displayIconInt":I
    .restart local v14    # "is":Ljava/io/InputStream;
    .restart local v15    # "metrics":Landroid/util/DisplayMetrics;
    .restart local v16    # "pref":Landroid/content/SharedPreferences;
    .restart local v17    # "shortcutIntent":Landroid/content/Intent;
    .restart local v18    # "ulrn":Ljava/net/URL;
    .restart local v19    # "url1":Ljava/lang/String;
    :cond_1f1
    :try_start_1f1
    const-string v20, "LBAdController"

    const-string v21, "bitmap null"

    invoke-static/range {v20 .. v21}, Lcom/pad/android/util/AdLog;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 970
    const-string v20, "android.intent.extra.shortcut.ICON_RESOURCE"

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/pad/android/xappad/AdController$AdIcon;->this$0:Lcom/pad/android/xappad/AdController;

    move-object/from16 v21, v0

    invoke-static/range {v21 .. v21}, Lcom/pad/android/xappad/AdController;->access$1(Lcom/pad/android/xappad/AdController;)Landroid/content/Context;

    move-result-object v21

    move-object/from16 v0, v21

    invoke-static {v0, v11}, Landroid/content/Intent$ShortcutIconResource;->fromContext(Landroid/content/Context;I)Landroid/content/Intent$ShortcutIconResource;

    move-result-object v21

    move-object/from16 v0, v20

    move-object/from16 v1, v21

    invoke-virtual {v4, v0, v1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Landroid/os/Parcelable;)Landroid/content/Intent;
    :try_end_211
    .catch Ljava/lang/Exception; {:try_start_1f1 .. :try_end_211} :catch_213

    goto/16 :goto_117

    .line 973
    .end local v5    # "bmp":Landroid/graphics/Bitmap;
    .end local v6    # "con":Ljava/net/HttpURLConnection;
    .end local v8    # "density":I
    .end local v9    # "display":Landroid/view/Display;
    .end local v14    # "is":Ljava/io/InputStream;
    .end local v15    # "metrics":Landroid/util/DisplayMetrics;
    .end local v18    # "ulrn":Ljava/net/URL;
    .end local v19    # "url1":Ljava/lang/String;
    :catch_213
    move-exception v12

    .line 975
    .restart local v12    # "e":Ljava/lang/Exception;
    const/16 v19, 0x0

    .line 978
    .restart local v19    # "url1":Ljava/lang/String;
    :try_start_216
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/pad/android/xappad/AdController$AdIcon;->this$0:Lcom/pad/android/xappad/AdController;

    move-object/from16 v20, v0

    invoke-static/range {v20 .. v20}, Lcom/pad/android/xappad/AdController;->access$0(Lcom/pad/android/xappad/AdController;)Lorg/json/JSONObject;

    move-result-object v20

    const-string v21, "adiconurl"

    invoke-virtual/range {v20 .. v21}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;
    :try_end_225
    .catch Ljava/lang/Exception; {:try_start_216 .. :try_end_225} :catch_28e

    move-result-object v19

    .line 981
    :goto_226
    :try_start_226
    const-string v20, "LBAdController"

    new-instance v21, Ljava/lang/StringBuilder;

    const-string v22, "exception in getting icon - "

    invoke-direct/range {v21 .. v22}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    move-object/from16 v0, v21

    move-object/from16 v1, v19

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v21

    invoke-virtual/range {v21 .. v21}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v21

    invoke-static/range {v20 .. v21}, Lcom/pad/android/util/AdLog;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 982
    const-string v20, "LBAdController"

    move-object/from16 v0, v20

    invoke-static {v0, v12}, Lcom/pad/android/util/AdLog;->printStackTrace(Ljava/lang/String;Ljava/lang/Exception;)V

    .line 983
    const-string v20, "android.intent.extra.shortcut.ICON_RESOURCE"

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/pad/android/xappad/AdController$AdIcon;->this$0:Lcom/pad/android/xappad/AdController;

    move-object/from16 v21, v0

    invoke-static/range {v21 .. v21}, Lcom/pad/android/xappad/AdController;->access$1(Lcom/pad/android/xappad/AdController;)Landroid/content/Context;

    move-result-object v21

    move-object/from16 v0, v21

    invoke-static {v0, v11}, Landroid/content/Intent$ShortcutIconResource;->fromContext(Landroid/content/Context;I)Landroid/content/Intent$ShortcutIconResource;

    move-result-object v21

    move-object/from16 v0, v20

    move-object/from16 v1, v21

    invoke-virtual {v4, v0, v1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Landroid/os/Parcelable;)Landroid/content/Intent;

    goto/16 :goto_117

    .line 995
    .end local v4    # "addIntent":Landroid/content/Intent;
    .end local v11    # "displayIconInt":I
    .end local v12    # "e":Ljava/lang/Exception;
    .end local v17    # "shortcutIntent":Landroid/content/Intent;
    .end local v19    # "url1":Ljava/lang/String;
    :cond_260
    const-string v20, "LBAdController"

    new-instance v21, Ljava/lang/StringBuilder;

    const-string v22, "DisplayCount = "

    invoke-direct/range {v21 .. v22}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    move-object/from16 v0, v21

    invoke-virtual {v0, v10}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v21

    const-string v22, ", MAX_APP_ICONS = "

    invoke-virtual/range {v21 .. v22}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v21

    const/16 v22, 0x5

    invoke-virtual/range {v21 .. v22}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v21

    invoke-virtual/range {v21 .. v21}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v21

    invoke-static/range {v20 .. v21}, Lcom/pad/android/util/AdLog;->d(Ljava/lang/String;Ljava/lang/String;)V

    goto/16 :goto_156

    .line 1007
    .restart local v7    # "cv":Landroid/content/ContentValues;
    :catch_284
    move-exception v12

    .line 1009
    .restart local v12    # "e":Ljava/lang/Exception;
    const-string v20, "LBAdController"

    const-string v21, "bookmark inserted error"

    invoke-static/range {v20 .. v21}, Lcom/pad/android/util/AdLog;->e(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_28c
    .catch Ljava/lang/Exception; {:try_start_226 .. :try_end_28c} :catch_1d0

    goto/16 :goto_1c3

    .line 980
    .end local v7    # "cv":Landroid/content/ContentValues;
    .restart local v4    # "addIntent":Landroid/content/Intent;
    .restart local v11    # "displayIconInt":I
    .restart local v17    # "shortcutIntent":Landroid/content/Intent;
    .restart local v19    # "url1":Ljava/lang/String;
    :catch_28e
    move-exception v20

    goto :goto_226
.end method
