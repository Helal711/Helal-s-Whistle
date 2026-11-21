###### Class com.WhistlePhoneLocator.AndroidWhistlerServiceAlarm (com.WhistlePhoneLocator.AndroidWhistlerServiceAlarm)
.class public Lcom/WhistlePhoneLocator/AndroidWhistlerServiceAlarm;
.super Landroid/app/Service;
.source "AndroidWhistlerServiceAlarm.java"


# instance fields
.field private DetectorEnabledFromPrefs:Ljava/lang/Boolean;

.field mStartTime:J


# direct methods
.method public constructor <init>()V
    .registers 2

    .prologue
    .line 9
    invoke-direct {p0}, Landroid/app/Service;-><init>()V

    .line 12
    const/4 v0, 0x0

    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    iput-object v0, p0, Lcom/WhistlePhoneLocator/AndroidWhistlerServiceAlarm;->DetectorEnabledFromPrefs:Ljava/lang/Boolean;

    .line 9
    return-void
.end method


# virtual methods
.method ReadDetectorState()V
    .registers 4

    .prologue
    .line 64
    invoke-static {p0}, Landroid/preference/PreferenceManager;->getDefaultSharedPreferences(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v0

    .line 65
    .local v0, "prefs":Landroid/content/SharedPreferences;
    const-string v1, "detectionEnable"

    const/4 v2, 0x0

    invoke-interface {v0, v1, v2}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v1

    invoke-static {v1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v1

    iput-object v1, p0, Lcom/WhistlePhoneLocator/AndroidWhistlerServiceAlarm;->DetectorEnabledFromPrefs:Ljava/lang/Boolean;

    .line 66
    return-void
.end method

.method public onBind(Landroid/content/Intent;)Landroid/os/IBinder;
    .registers 3
    .param p1, "intent"    # Landroid/content/Intent;

    .prologue
    .line 22
    const/4 v0, 0x0

    return-object v0
.end method

.method public onCreate()V
    .registers 1

    .prologue
    .line 17
    return-void
.end method

.method public onDestroy()V
    .registers 1

    .prologue
    .line 28
    return-void
.end method

.method public onStartCommand(Landroid/content/Intent;II)I
    .registers 10
    .param p1, "intent"    # Landroid/content/Intent;
    .param p2, "flags"    # I
    .param p3, "startId"    # I

    .prologue
    const/4 v5, 0x1

    .line 34
    invoke-virtual {p0}, Lcom/WhistlePhoneLocator/AndroidWhistlerServiceAlarm;->ReadDetectorState()V

    .line 35
    sget-wide v1, Lcom/WhistlePhoneLocator/AndroidWhistlerApp;->basicCounter:J

    sget-wide v3, Lcom/WhistlePhoneLocator/AndroidWhistlerService;->ServiceCounter:J

    cmp-long v1, v1, v3

    if-nez v1, :cond_2b

    iget-object v1, p0, Lcom/WhistlePhoneLocator/AndroidWhistlerServiceAlarm;->DetectorEnabledFromPrefs:Ljava/lang/Boolean;

    invoke-virtual {v1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v1

    if-eqz v1, :cond_2b

    sget-boolean v1, Lcom/WhistlePhoneLocator/AndroidWhistlerServiceManager;->CallInProgress:Z

    if-nez v1, :cond_2b

    .line 38
    new-instance v0, Landroid/content/Intent;

    invoke-virtual {p0}, Lcom/WhistlePhoneLocator/AndroidWhistlerServiceAlarm;->getApplicationContext()Landroid/content/Context;

    move-result-object v1

    const-class v2, Lcom/WhistlePhoneLocator/AndroidWhistlerService;

    invoke-direct {v0, v1, v2}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 39
    .local v0, "intentS":Landroid/content/Intent;
    const-string v1, "com.WhistlePhoneLocator.Service"

    invoke-virtual {v0, v1, v5}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    .line 40
    invoke-virtual {p0, v0}, Lcom/WhistlePhoneLocator/AndroidWhistlerServiceAlarm;->startService(Landroid/content/Intent;)Landroid/content/ComponentName;

    .line 49
    .end local v0    # "intentS":Landroid/content/Intent;
    :cond_2b
    sget-wide v1, Lcom/WhistlePhoneLocator/AndroidWhistlerService;->ServiceCounter:J

    sput-wide v1, Lcom/WhistlePhoneLocator/AndroidWhistlerApp;->basicCounter:J

    .line 50
    return v5
.end method

.method public onUnbind(Landroid/content/Intent;)Z
    .registers 3
    .param p1, "intent"    # Landroid/content/Intent;

    .prologue
    .line 56
    invoke-super {p0, p1}, Landroid/app/Service;->onUnbind(Landroid/content/Intent;)Z

    move-result v0

    return v0
.end method
