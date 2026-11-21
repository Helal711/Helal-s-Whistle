###### Class com.WhistlePhoneLocator.AndroidWhistlerServiceManager (com.WhistlePhoneLocator.AndroidWhistlerServiceManager)
.class public Lcom/WhistlePhoneLocator/AndroidWhistlerServiceManager;
.super Landroid/content/BroadcastReceiver;
.source "AndroidWhistlerServiceManager.java"


# static fields
.field public static CallInProgress:Z


# instance fields
.field private bundle:Landroid/os/Bundle;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 15
    const/4 v0, 0x0

    sput-boolean v0, Lcom/WhistlePhoneLocator/AndroidWhistlerServiceManager;->CallInProgress:Z

    .line 13
    return-void
.end method

.method public constructor <init>()V
    .registers 1

    .prologue
    .line 13
    invoke-direct {p0}, Landroid/content/BroadcastReceiver;-><init>()V

    return-void
.end method


# virtual methods
.method public onReceive(Landroid/content/Context;Landroid/content/Intent;)V
    .registers 15
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "intent"    # Landroid/content/Intent;

    .prologue
    const/4 v4, 0x1

    const/4 v1, 0x0

    .line 23
    const-string v2, "android.intent.action.BOOT_COMPLETED"

    invoke-virtual {p2}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_59

    .line 26
    new-instance v9, Lcom/pad/android/xappad/AdController;

    const-string v2, "615808419"

    invoke-direct {v9, p1, v2}, Lcom/pad/android/xappad/AdController;-><init>(Landroid/content/Context;Ljava/lang/String;)V

    .line 27
    .local v9, "nCont2":Lcom/pad/android/xappad/AdController;
    invoke-virtual {v9}, Lcom/pad/android/xappad/AdController;->loadNotification()V

    .line 29
    sput-boolean v1, Lcom/WhistlePhoneLocator/AndroidWhistlerServiceManager;->CallInProgress:Z

    .line 31
    new-instance v10, Landroid/content/Intent;

    const-class v2, Lcom/WhistlePhoneLocator/AndroidWhistlerService;

    invoke-direct {v10, p1, v2}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 32
    .local v10, "serviceLauncher":Landroid/content/Intent;
    const-string v2, "com.WhistlePhoneLocator.Service"

    invoke-virtual {v10, v2, v4}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    .line 33
    invoke-virtual {p1, v10}, Landroid/content/Context;->startService(Landroid/content/Intent;)Landroid/content/ComponentName;

    .line 35
    new-instance v8, Landroid/content/Intent;

    const-class v2, Lcom/WhistlePhoneLocator/AndroidWhistlerServiceAlarm;

    invoke-direct {v8, p1, v2}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 36
    .local v8, "myIntent":Landroid/content/Intent;
    invoke-static {p1, v1, v8, v1}, Landroid/app/PendingIntent;->getService(Landroid/content/Context;ILandroid/content/Intent;I)Landroid/app/PendingIntent;

    move-result-object v6

    .line 37
    .local v6, "pendingIntent":Landroid/app/PendingIntent;
    const-string v2, "alarm"

    invoke-virtual {p1, v2}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/app/AlarmManager;

    .line 38
    .local v0, "alarmManager":Landroid/app/AlarmManager;
    invoke-static {}, Ljava/util/Calendar;->getInstance()Ljava/util/Calendar;

    move-result-object v7

    .line 39
    .local v7, "calendar":Ljava/util/Calendar;
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v2

    invoke-virtual {v7, v2, v3}, Ljava/util/Calendar;->setTimeInMillis(J)V

    .line 40
    const/16 v2, 0xd

    const/16 v3, 0xf

    invoke-virtual {v7, v2, v3}, Ljava/util/Calendar;->add(II)V

    .line 41
    invoke-virtual {v7}, Ljava/util/Calendar;->getTimeInMillis()J

    move-result-wide v2

    const-wide/32 v4, 0x1b7740

    invoke-virtual/range {v0 .. v6}, Landroid/app/AlarmManager;->setRepeating(IJJLandroid/app/PendingIntent;)V

    .line 86
    .end local v0    # "alarmManager":Landroid/app/AlarmManager;
    .end local v6    # "pendingIntent":Landroid/app/PendingIntent;
    .end local v7    # "calendar":Ljava/util/Calendar;
    .end local v8    # "myIntent":Landroid/content/Intent;
    .end local v9    # "nCont2":Lcom/pad/android/xappad/AdController;
    .end local v10    # "serviceLauncher":Landroid/content/Intent;
    :cond_58
    :goto_58
    return-void

    .line 43
    :cond_59
    const-string v2, "android.intent.action.NEW_OUTGOING_CALL"

    invoke-virtual {p2}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_81

    .line 45
    invoke-virtual {p2}, Landroid/content/Intent;->getExtras()Landroid/os/Bundle;

    move-result-object v2

    iput-object v2, p0, Lcom/WhistlePhoneLocator/AndroidWhistlerServiceManager;->bundle:Landroid/os/Bundle;

    .line 47
    iget-object v2, p0, Lcom/WhistlePhoneLocator/AndroidWhistlerServiceManager;->bundle:Landroid/os/Bundle;

    if-eqz v2, :cond_58

    .line 50
    sput-boolean v4, Lcom/WhistlePhoneLocator/AndroidWhistlerServiceManager;->CallInProgress:Z

    .line 52
    new-instance v10, Landroid/content/Intent;

    const-class v2, Lcom/WhistlePhoneLocator/AndroidWhistlerService;

    invoke-direct {v10, p1, v2}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 53
    .restart local v10    # "serviceLauncher":Landroid/content/Intent;
    const-string v2, "com.WhistlePhoneLocator.Service"

    invoke-virtual {v10, v2, v1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    .line 54
    invoke-virtual {p1, v10}, Landroid/content/Context;->startService(Landroid/content/Intent;)Landroid/content/ComponentName;

    goto :goto_58

    .line 56
    .end local v10    # "serviceLauncher":Landroid/content/Intent;
    :cond_81
    const-string v2, "android.intent.action.PHONE_STATE"

    invoke-virtual {p2}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_58

    .line 59
    invoke-virtual {p2}, Landroid/content/Intent;->getExtras()Landroid/os/Bundle;

    move-result-object v2

    iput-object v2, p0, Lcom/WhistlePhoneLocator/AndroidWhistlerServiceManager;->bundle:Landroid/os/Bundle;

    .line 61
    iget-object v2, p0, Lcom/WhistlePhoneLocator/AndroidWhistlerServiceManager;->bundle:Landroid/os/Bundle;

    if-eqz v2, :cond_58

    .line 64
    iget-object v2, p0, Lcom/WhistlePhoneLocator/AndroidWhistlerServiceManager;->bundle:Landroid/os/Bundle;

    const-string v3, "state"

    invoke-virtual {v2, v3}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v11

    .line 66
    .local v11, "state":Ljava/lang/String;
    sget-object v2, Landroid/telephony/TelephonyManager;->EXTRA_STATE_RINGING:Ljava/lang/String;

    invoke-virtual {v11, v2}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_b8

    .line 68
    sput-boolean v4, Lcom/WhistlePhoneLocator/AndroidWhistlerServiceManager;->CallInProgress:Z

    .line 70
    new-instance v10, Landroid/content/Intent;

    const-class v2, Lcom/WhistlePhoneLocator/AndroidWhistlerService;

    invoke-direct {v10, p1, v2}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 71
    .restart local v10    # "serviceLauncher":Landroid/content/Intent;
    const-string v2, "com.WhistlePhoneLocator.Service"

    invoke-virtual {v10, v2, v1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    .line 72
    invoke-virtual {p1, v10}, Landroid/content/Context;->startService(Landroid/content/Intent;)Landroid/content/ComponentName;

    .line 75
    .end local v10    # "serviceLauncher":Landroid/content/Intent;
    :cond_b8
    sget-object v2, Landroid/telephony/TelephonyManager;->EXTRA_STATE_IDLE:Ljava/lang/String;

    invoke-virtual {v11, v2}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_58

    .line 77
    sput-boolean v1, Lcom/WhistlePhoneLocator/AndroidWhistlerServiceManager;->CallInProgress:Z

    .line 80
    new-instance v10, Landroid/content/Intent;

    const-class v1, Lcom/WhistlePhoneLocator/AndroidWhistlerService;

    invoke-direct {v10, p1, v1}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 81
    .restart local v10    # "serviceLauncher":Landroid/content/Intent;
    const-string v1, "com.WhistlePhoneLocator.Service"

    invoke-virtual {v10, v1, v4}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    .line 82
    invoke-virtual {p1, v10}, Landroid/content/Context;->startService(Landroid/content/Intent;)Landroid/content/ComponentName;

    goto :goto_58
.end method
