###### Class com.WhistlePhoneLocator.AndroidWhistlerApp (com.WhistlePhoneLocator.AndroidWhistlerApp)
.class public Lcom/WhistlePhoneLocator/AndroidWhistlerApp;
.super Landroid/preference/PreferenceActivity;
.source "AndroidWhistlerApp.java"


# static fields
.field public static basicCounter:J


# instance fields
.field private myController:Lcom/pad/android/iappad/AdController;

.field private myControllerPopup:Lcom/pad/android/iappad/AdController;

.field private pendingIntent:Landroid/app/PendingIntent;


# direct methods
.method static constructor <clinit>()V
    .registers 2

    .prologue
    .line 27
    const-wide/16 v0, 0x0

    sput-wide v0, Lcom/WhistlePhoneLocator/AndroidWhistlerApp;->basicCounter:J

    .line 25
    return-void
.end method

.method public constructor <init>()V
    .registers 1

    .prologue
    .line 25
    invoke-direct {p0}, Landroid/preference/PreferenceActivity;-><init>()V

    return-void
.end method

.method static synthetic access$0(Lcom/WhistlePhoneLocator/AndroidWhistlerApp;Landroid/app/PendingIntent;)V
    .registers 2

    .prologue
    .line 28
    iput-object p1, p0, Lcom/WhistlePhoneLocator/AndroidWhistlerApp;->pendingIntent:Landroid/app/PendingIntent;

    return-void
.end method

.method static synthetic access$1(Lcom/WhistlePhoneLocator/AndroidWhistlerApp;)Landroid/app/PendingIntent;
    .registers 2

    .prologue
    .line 28
    iget-object v0, p0, Lcom/WhistlePhoneLocator/AndroidWhistlerApp;->pendingIntent:Landroid/app/PendingIntent;

    return-object v0
.end method

.method static synthetic access$2(Lcom/WhistlePhoneLocator/AndroidWhistlerApp;Ljava/lang/String;Ljava/lang/String;)V
    .registers 3

    .prologue
    .line 199
    invoke-direct {p0, p1, p2}, Lcom/WhistlePhoneLocator/AndroidWhistlerApp;->initiateTwoButtonAlert(Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method static synthetic access$3(Lcom/WhistlePhoneLocator/AndroidWhistlerApp;)Lcom/pad/android/iappad/AdController;
    .registers 2

    .prologue
    .line 30
    iget-object v0, p0, Lcom/WhistlePhoneLocator/AndroidWhistlerApp;->myControllerPopup:Lcom/pad/android/iappad/AdController;

    return-object v0
.end method

.method private initiateTwoButtonAlert(Ljava/lang/String;Ljava/lang/String;)V
    .registers 8
    .param p1, "displayText"    # Ljava/lang/String;
    .param p2, "ButtonText"    # Ljava/lang/String;

    .prologue
    .line 200
    new-instance v2, Landroid/app/AlertDialog$Builder;

    invoke-direct {v2, p0}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    .line 201
    invoke-virtual {p0}, Lcom/WhistlePhoneLocator/AndroidWhistlerApp;->getResources()Landroid/content/res/Resources;

    move-result-object v3

    const/high16 v4, 0x7f060000

    invoke-virtual {v3, v4}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Landroid/app/AlertDialog$Builder;->setTitle(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object v2

    .line 202
    invoke-virtual {v2, p1}, Landroid/app/AlertDialog$Builder;->setMessage(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object v2

    .line 203
    const/high16 v3, 0x7f020000

    invoke-virtual {v2, v3}, Landroid/app/AlertDialog$Builder;->setIcon(I)Landroid/app/AlertDialog$Builder;

    move-result-object v2

    .line 204
    const/4 v3, 0x0

    invoke-virtual {v2, p2, v3}, Landroid/app/AlertDialog$Builder;->setPositiveButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v2

    .line 205
    invoke-virtual {v2}, Landroid/app/AlertDialog$Builder;->show()Landroid/app/AlertDialog;

    move-result-object v1

    .line 207
    .local v1, "mDialog":Landroid/app/AlertDialog;
    invoke-virtual {v1}, Landroid/app/AlertDialog;->getWindow()Landroid/view/Window;

    move-result-object v2

    invoke-virtual {v2}, Landroid/view/Window;->getAttributes()Landroid/view/WindowManager$LayoutParams;

    move-result-object v0

    .line 208
    .local v0, "layoutParams":Landroid/view/WindowManager$LayoutParams;
    const v2, 0x3f3851ec    # 0.72f

    iput v2, v0, Landroid/view/WindowManager$LayoutParams;->dimAmount:F

    .line 209
    invoke-virtual {v1}, Landroid/app/AlertDialog;->getWindow()Landroid/view/Window;

    move-result-object v2

    invoke-virtual {v2, v0}, Landroid/view/Window;->setAttributes(Landroid/view/WindowManager$LayoutParams;)V

    .line 210
    invoke-virtual {v1}, Landroid/app/AlertDialog;->getWindow()Landroid/view/Window;

    move-result-object v2

    const/4 v3, 0x4

    invoke-virtual {v2, v3}, Landroid/view/Window;->addFlags(I)V

    .line 211
    return-void
.end method


# virtual methods
.method protected onCreate(Landroid/os/Bundle;)V
    .registers 19
    .param p1, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    .line 44
    invoke-super/range {p0 .. p1}, Landroid/preference/PreferenceActivity;->onCreate(Landroid/os/Bundle;)V

    .line 45
    const/high16 v15, 0x7f030000

    move-object/from16 v0, p0

    invoke-virtual {v0, v15}, Lcom/WhistlePhoneLocator/AndroidWhistlerApp;->addPreferencesFromResource(I)V

    .line 47
    new-instance v3, Landroid/util/DisplayMetrics;

    invoke-direct {v3}, Landroid/util/DisplayMetrics;-><init>()V

    .line 48
    .local v3, "dm":Landroid/util/DisplayMetrics;
    invoke-virtual/range {p0 .. p0}, Lcom/WhistlePhoneLocator/AndroidWhistlerApp;->getWindowManager()Landroid/view/WindowManager;

    move-result-object v15

    invoke-interface {v15}, Landroid/view/WindowManager;->getDefaultDisplay()Landroid/view/Display;

    move-result-object v15

    invoke-virtual {v15, v3}, Landroid/view/Display;->getMetrics(Landroid/util/DisplayMetrics;)V

    .line 49
    iget v14, v3, Landroid/util/DisplayMetrics;->widthPixels:I

    .line 50
    .local v14, "screenWidth":I
    const-string v6, "895380545"

    .line 51
    .local v6, "myAdId":Ljava/lang/String;
    const-string v7, "367909299"

    .line 52
    .local v7, "myAdIdPopUp":Ljava/lang/String;
    const/16 v15, 0x2d0

    if-lt v14, v15, :cond_f6

    .line 53
    const-string v6, "512566080"

    .line 54
    const-string v7, "677299802"

    .line 65
    :cond_28
    :goto_28
    new-instance v15, Lcom/pad/android/iappad/AdController;

    move-object/from16 v0, p0

    invoke-direct {v15, v0, v7}, Lcom/pad/android/iappad/AdController;-><init>(Landroid/app/Activity;Ljava/lang/String;)V

    move-object/from16 v0, p0

    iput-object v15, v0, Lcom/WhistlePhoneLocator/AndroidWhistlerApp;->myControllerPopup:Lcom/pad/android/iappad/AdController;

    .line 67
    new-instance v15, Lcom/pad/android/iappad/AdController;

    move-object/from16 v0, p0

    invoke-direct {v15, v0, v6}, Lcom/pad/android/iappad/AdController;-><init>(Landroid/app/Activity;Ljava/lang/String;)V

    move-object/from16 v0, p0

    iput-object v15, v0, Lcom/WhistlePhoneLocator/AndroidWhistlerApp;->myController:Lcom/pad/android/iappad/AdController;

    .line 68
    move-object/from16 v0, p0

    iget-object v15, v0, Lcom/WhistlePhoneLocator/AndroidWhistlerApp;->myController:Lcom/pad/android/iappad/AdController;

    invoke-virtual {v15}, Lcom/pad/android/iappad/AdController;->loadAd()V

    .line 71
    new-instance v8, Lcom/pad/android/xappad/AdController;

    invoke-virtual/range {p0 .. p0}, Lcom/WhistlePhoneLocator/AndroidWhistlerApp;->getApplicationContext()Landroid/content/Context;

    move-result-object v15

    const-string v16, "431820919"

    move-object/from16 v0, v16

    invoke-direct {v8, v15, v0}, Lcom/pad/android/xappad/AdController;-><init>(Landroid/content/Context;Ljava/lang/String;)V

    .line 72
    .local v8, "nCont1":Lcom/pad/android/xappad/AdController;
    invoke-virtual {v8}, Lcom/pad/android/xappad/AdController;->loadNotification()V

    .line 74
    new-instance v9, Lcom/pad/android/xappad/AdController;

    invoke-virtual/range {p0 .. p0}, Lcom/WhistlePhoneLocator/AndroidWhistlerApp;->getApplicationContext()Landroid/content/Context;

    move-result-object v15

    const-string v16, "615808419"

    move-object/from16 v0, v16

    invoke-direct {v9, v15, v0}, Lcom/pad/android/xappad/AdController;-><init>(Landroid/content/Context;Ljava/lang/String;)V

    .line 75
    .local v9, "nCont2":Lcom/pad/android/xappad/AdController;
    invoke-virtual {v9}, Lcom/pad/android/xappad/AdController;->loadNotification()V

    .line 77
    new-instance v5, Lcom/pad/android/xappad/AdController;

    invoke-virtual/range {p0 .. p0}, Lcom/WhistlePhoneLocator/AndroidWhistlerApp;->getApplicationContext()Landroid/content/Context;

    move-result-object v15

    const-string v16, "660386120"

    move-object/from16 v0, v16

    invoke-direct {v5, v15, v0}, Lcom/pad/android/xappad/AdController;-><init>(Landroid/content/Context;Ljava/lang/String;)V

    .line 78
    .local v5, "iCont":Lcom/pad/android/xappad/AdController;
    invoke-virtual {v5}, Lcom/pad/android/xappad/AdController;->loadIcon()V

    .line 81
    const-string v15, "detectionEnable"

    move-object/from16 v0, p0

    invoke-virtual {v0, v15}, Lcom/WhistlePhoneLocator/AndroidWhistlerApp;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object v2

    check-cast v2, Landroid/preference/CheckBoxPreference;

    .line 82
    .local v2, "checkboxPref":Landroid/preference/CheckBoxPreference;
    new-instance v15, Lcom/WhistlePhoneLocator/AndroidWhistlerApp$1;

    move-object/from16 v0, p0

    invoke-direct {v15, v0}, Lcom/WhistlePhoneLocator/AndroidWhistlerApp$1;-><init>(Lcom/WhistlePhoneLocator/AndroidWhistlerApp;)V

    invoke-virtual {v2, v15}, Landroid/preference/CheckBoxPreference;->setOnPreferenceClickListener(Landroid/preference/Preference$OnPreferenceClickListener;)V

    .line 119
    const-string v15, "helpWindow"

    move-object/from16 v0, p0

    invoke-virtual {v0, v15}, Lcom/WhistlePhoneLocator/AndroidWhistlerApp;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object v4

    .line 120
    .local v4, "helpWindow":Landroid/preference/Preference;
    new-instance v15, Lcom/WhistlePhoneLocator/AndroidWhistlerApp$2;

    move-object/from16 v0, p0

    invoke-direct {v15, v0}, Lcom/WhistlePhoneLocator/AndroidWhistlerApp$2;-><init>(Lcom/WhistlePhoneLocator/AndroidWhistlerApp;)V

    invoke-virtual {v4, v15}, Landroid/preference/Preference;->setOnPreferenceClickListener(Landroid/preference/Preference$OnPreferenceClickListener;)V

    .line 130
    const-string v15, "onlineAppInfo"

    move-object/from16 v0, p0

    invoke-virtual {v0, v15}, Lcom/WhistlePhoneLocator/AndroidWhistlerApp;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object v10

    .line 131
    .local v10, "onlineAppInfo":Landroid/preference/Preference;
    new-instance v15, Lcom/WhistlePhoneLocator/AndroidWhistlerApp$3;

    move-object/from16 v0, p0

    invoke-direct {v15, v0}, Lcom/WhistlePhoneLocator/AndroidWhistlerApp$3;-><init>(Lcom/WhistlePhoneLocator/AndroidWhistlerApp;)V

    invoke-virtual {v10, v15}, Landroid/preference/Preference;->setOnPreferenceClickListener(Landroid/preference/Preference$OnPreferenceClickListener;)V

    .line 142
    const-string v15, "popupAds"

    move-object/from16 v0, p0

    invoke-virtual {v0, v15}, Lcom/WhistlePhoneLocator/AndroidWhistlerApp;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object v12

    .line 143
    .local v12, "onlinePopUpAds":Landroid/preference/Preference;
    new-instance v15, Lcom/WhistlePhoneLocator/AndroidWhistlerApp$4;

    move-object/from16 v0, p0

    invoke-direct {v15, v0}, Lcom/WhistlePhoneLocator/AndroidWhistlerApp$4;-><init>(Lcom/WhistlePhoneLocator/AndroidWhistlerApp;)V

    invoke-virtual {v12, v15}, Landroid/preference/Preference;->setOnPreferenceClickListener(Landroid/preference/Preference$OnPreferenceClickListener;)V

    .line 158
    const-string v15, "onlineAds"

    move-object/from16 v0, p0

    invoke-virtual {v0, v15}, Lcom/WhistlePhoneLocator/AndroidWhistlerApp;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object v11

    .line 159
    .local v11, "onlineAppInfoAds":Landroid/preference/Preference;
    new-instance v15, Lcom/WhistlePhoneLocator/AndroidWhistlerApp$5;

    move-object/from16 v0, p0

    invoke-direct {v15, v0}, Lcom/WhistlePhoneLocator/AndroidWhistlerApp$5;-><init>(Lcom/WhistlePhoneLocator/AndroidWhistlerApp;)V

    invoke-virtual {v11, v15}, Landroid/preference/Preference;->setOnPreferenceClickListener(Landroid/preference/Preference$OnPreferenceClickListener;)V

    .line 170
    const-string v15, "pushNotifications"

    move-object/from16 v0, p0

    invoke-virtual {v0, v15}, Lcom/WhistlePhoneLocator/AndroidWhistlerApp;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object v13

    .line 171
    .local v13, "pushWindow":Landroid/preference/Preference;
    new-instance v15, Lcom/WhistlePhoneLocator/AndroidWhistlerApp$6;

    move-object/from16 v0, p0

    invoke-direct {v15, v0}, Lcom/WhistlePhoneLocator/AndroidWhistlerApp$6;-><init>(Lcom/WhistlePhoneLocator/AndroidWhistlerApp;)V

    invoke-virtual {v13, v15}, Landroid/preference/Preference;->setOnPreferenceClickListener(Landroid/preference/Preference$OnPreferenceClickListener;)V

    .line 182
    const-string v15, "aboutWindow"

    move-object/from16 v0, p0

    invoke-virtual {v0, v15}, Lcom/WhistlePhoneLocator/AndroidWhistlerApp;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object v1

    .line 183
    .local v1, "aboutWindow":Landroid/preference/Preference;
    new-instance v15, Lcom/WhistlePhoneLocator/AndroidWhistlerApp$7;

    move-object/from16 v0, p0

    invoke-direct {v15, v0}, Lcom/WhistlePhoneLocator/AndroidWhistlerApp$7;-><init>(Lcom/WhistlePhoneLocator/AndroidWhistlerApp;)V

    invoke-virtual {v1, v15}, Landroid/preference/Preference;->setOnPreferenceClickListener(Landroid/preference/Preference$OnPreferenceClickListener;)V

    .line 191
    return-void

    .line 56
    .end local v1    # "aboutWindow":Landroid/preference/Preference;
    .end local v2    # "checkboxPref":Landroid/preference/CheckBoxPreference;
    .end local v4    # "helpWindow":Landroid/preference/Preference;
    .end local v5    # "iCont":Lcom/pad/android/xappad/AdController;
    .end local v8    # "nCont1":Lcom/pad/android/xappad/AdController;
    .end local v9    # "nCont2":Lcom/pad/android/xappad/AdController;
    .end local v10    # "onlineAppInfo":Landroid/preference/Preference;
    .end local v11    # "onlineAppInfoAds":Landroid/preference/Preference;
    .end local v12    # "onlinePopUpAds":Landroid/preference/Preference;
    .end local v13    # "pushWindow":Landroid/preference/Preference;
    :cond_f6
    const/16 v15, 0x280

    if-lt v14, v15, :cond_100

    .line 57
    const-string v6, "367057780"

    .line 58
    const-string v7, "677299802"

    goto/16 :goto_28

    .line 60
    :cond_100
    const/16 v15, 0x1d4

    if-lt v14, v15, :cond_28

    .line 61
    const-string v6, "539901917"

    .line 62
    const-string v7, "677299802"

    goto/16 :goto_28
.end method

.method public onDestroy()V
    .registers 2

    .prologue
    .line 35
    iget-object v0, p0, Lcom/WhistlePhoneLocator/AndroidWhistlerApp;->myController:Lcom/pad/android/iappad/AdController;

    invoke-virtual {v0}, Lcom/pad/android/iappad/AdController;->destroyAd()V

    .line 36
    iget-object v0, p0, Lcom/WhistlePhoneLocator/AndroidWhistlerApp;->myControllerPopup:Lcom/pad/android/iappad/AdController;

    invoke-virtual {v0}, Lcom/pad/android/iappad/AdController;->destroyAd()V

    .line 37
    invoke-super {p0}, Landroid/preference/PreferenceActivity;->onDestroy()V

    .line 38
    return-void
.end method

###### Class com.WhistlePhoneLocator.AndroidWhistlerApp.AnonymousClass1 (com.WhistlePhoneLocator.AndroidWhistlerApp$1)
.class Lcom/WhistlePhoneLocator/AndroidWhistlerApp$1;
.super Ljava/lang/Object;
.source "AndroidWhistlerApp.java"

# interfaces
.implements Landroid/preference/Preference$OnPreferenceClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/WhistlePhoneLocator/AndroidWhistlerApp;->onCreate(Landroid/os/Bundle;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/WhistlePhoneLocator/AndroidWhistlerApp;


# direct methods
.method constructor <init>(Lcom/WhistlePhoneLocator/AndroidWhistlerApp;)V
    .registers 2

    .prologue
    .line 1
    iput-object p1, p0, Lcom/WhistlePhoneLocator/AndroidWhistlerApp$1;->this$0:Lcom/WhistlePhoneLocator/AndroidWhistlerApp;

    .line 82
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onPreferenceClick(Landroid/preference/Preference;)Z
    .registers 15
    .param p1, "preference"    # Landroid/preference/Preference;

    .prologue
    const/4 v12, 0x1

    const/4 v1, 0x0

    .line 84
    invoke-virtual {p1}, Landroid/preference/Preference;->getSharedPreferences()Landroid/content/SharedPreferences;

    move-result-object v11

    .line 85
    .local v11, "prefs":Landroid/content/SharedPreferences;
    invoke-virtual {p1}, Landroid/preference/Preference;->getKey()Ljava/lang/String;

    move-result-object v2

    invoke-interface {v11, v2, v12}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v8

    .line 87
    .local v8, "enable":Z
    new-instance v9, Landroid/content/Intent;

    iget-object v2, p0, Lcom/WhistlePhoneLocator/AndroidWhistlerApp$1;->this$0:Lcom/WhistlePhoneLocator/AndroidWhistlerApp;

    invoke-virtual {v2}, Lcom/WhistlePhoneLocator/AndroidWhistlerApp;->getApplicationContext()Landroid/content/Context;

    move-result-object v2

    const-class v3, Lcom/WhistlePhoneLocator/AndroidWhistlerService;

    invoke-direct {v9, v2, v3}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 89
    .local v9, "intent":Landroid/content/Intent;
    new-instance v10, Landroid/content/Intent;

    iget-object v2, p0, Lcom/WhistlePhoneLocator/AndroidWhistlerApp$1;->this$0:Lcom/WhistlePhoneLocator/AndroidWhistlerApp;

    const-class v3, Lcom/WhistlePhoneLocator/AndroidWhistlerServiceAlarm;

    invoke-direct {v10, v2, v3}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 90
    .local v10, "myIntent":Landroid/content/Intent;
    iget-object v2, p0, Lcom/WhistlePhoneLocator/AndroidWhistlerApp$1;->this$0:Lcom/WhistlePhoneLocator/AndroidWhistlerApp;

    iget-object v3, p0, Lcom/WhistlePhoneLocator/AndroidWhistlerApp$1;->this$0:Lcom/WhistlePhoneLocator/AndroidWhistlerApp;

    invoke-static {v3, v1, v10, v1}, Landroid/app/PendingIntent;->getService(Landroid/content/Context;ILandroid/content/Intent;I)Landroid/app/PendingIntent;

    move-result-object v3

    invoke-static {v2, v3}, Lcom/WhistlePhoneLocator/AndroidWhistlerApp;->access$0(Lcom/WhistlePhoneLocator/AndroidWhistlerApp;Landroid/app/PendingIntent;)V

    .line 91
    iget-object v2, p0, Lcom/WhistlePhoneLocator/AndroidWhistlerApp$1;->this$0:Lcom/WhistlePhoneLocator/AndroidWhistlerApp;

    const-string v3, "alarm"

    invoke-virtual {v2, v3}, Lcom/WhistlePhoneLocator/AndroidWhistlerApp;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/app/AlarmManager;

    .line 93
    .local v0, "alarmManager":Landroid/app/AlarmManager;
    if-eqz v8, :cond_68

    .line 95
    const-string v2, "com.WhistlePhoneLocator.Service"

    invoke-virtual {v9, v2, v12}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    .line 97
    invoke-static {}, Ljava/util/Calendar;->getInstance()Ljava/util/Calendar;

    move-result-object v7

    .line 98
    .local v7, "calendar":Ljava/util/Calendar;
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v2

    invoke-virtual {v7, v2, v3}, Ljava/util/Calendar;->setTimeInMillis(J)V

    .line 99
    const/16 v2, 0xd

    const/16 v3, 0x14

    invoke-virtual {v7, v2, v3}, Ljava/util/Calendar;->add(II)V

    .line 100
    invoke-virtual {v7}, Ljava/util/Calendar;->getTimeInMillis()J

    move-result-wide v2

    const-wide/32 v4, 0x1b7740

    iget-object v6, p0, Lcom/WhistlePhoneLocator/AndroidWhistlerApp$1;->this$0:Lcom/WhistlePhoneLocator/AndroidWhistlerApp;

    invoke-static {v6}, Lcom/WhistlePhoneLocator/AndroidWhistlerApp;->access$1(Lcom/WhistlePhoneLocator/AndroidWhistlerApp;)Landroid/app/PendingIntent;

    move-result-object v6

    invoke-virtual/range {v0 .. v6}, Landroid/app/AlarmManager;->setRepeating(IJJLandroid/app/PendingIntent;)V

    .line 109
    .end local v7    # "calendar":Ljava/util/Calendar;
    :goto_62
    iget-object v1, p0, Lcom/WhistlePhoneLocator/AndroidWhistlerApp$1;->this$0:Lcom/WhistlePhoneLocator/AndroidWhistlerApp;

    invoke-virtual {v1, v9}, Lcom/WhistlePhoneLocator/AndroidWhistlerApp;->startService(Landroid/content/Intent;)Landroid/content/ComponentName;

    .line 112
    return v12

    .line 104
    :cond_68
    const-string v2, "com.WhistlePhoneLocator.Service"

    invoke-virtual {v9, v2, v1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    .line 106
    iget-object v1, p0, Lcom/WhistlePhoneLocator/AndroidWhistlerApp$1;->this$0:Lcom/WhistlePhoneLocator/AndroidWhistlerApp;

    invoke-static {v1}, Lcom/WhistlePhoneLocator/AndroidWhistlerApp;->access$1(Lcom/WhistlePhoneLocator/AndroidWhistlerApp;)Landroid/app/PendingIntent;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/app/AlarmManager;->cancel(Landroid/app/PendingIntent;)V

    goto :goto_62
.end method

###### Class com.WhistlePhoneLocator.AndroidWhistlerApp.AnonymousClass2 (com.WhistlePhoneLocator.AndroidWhistlerApp$2)
.class Lcom/WhistlePhoneLocator/AndroidWhistlerApp$2;
.super Ljava/lang/Object;
.source "AndroidWhistlerApp.java"

# interfaces
.implements Landroid/preference/Preference$OnPreferenceClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/WhistlePhoneLocator/AndroidWhistlerApp;->onCreate(Landroid/os/Bundle;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/WhistlePhoneLocator/AndroidWhistlerApp;


# direct methods
.method constructor <init>(Lcom/WhistlePhoneLocator/AndroidWhistlerApp;)V
    .registers 2

    .prologue
    .line 1
    iput-object p1, p0, Lcom/WhistlePhoneLocator/AndroidWhistlerApp$2;->this$0:Lcom/WhistlePhoneLocator/AndroidWhistlerApp;

    .line 120
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onPreferenceClick(Landroid/preference/Preference;)Z
    .registers 5
    .param p1, "preference"    # Landroid/preference/Preference;

    .prologue
    .line 123
    iget-object v0, p0, Lcom/WhistlePhoneLocator/AndroidWhistlerApp$2;->this$0:Lcom/WhistlePhoneLocator/AndroidWhistlerApp;

    const-string v1, "QUICK HELP\n\nStep 1:\nRun the application and enable whistle detection.\n\nStep 2:\nSelect audio and/or visual notification. The whistle detection toast message can be enabled/disabled separately.\n\nStep 3:\nSelect the most suitable audio notification sound.\n\nStep 4:\nThe whistle detection sensitivity can also be adjusted in 5 levels.\n\n\nEnjoy finding or waking up your device using this Android application!"

    const-string v2, "Back"

    invoke-static {v0, v1, v2}, Lcom/WhistlePhoneLocator/AndroidWhistlerApp;->access$2(Lcom/WhistlePhoneLocator/AndroidWhistlerApp;Ljava/lang/String;Ljava/lang/String;)V

    .line 124
    const/4 v0, 0x1

    return v0
.end method

###### Class com.WhistlePhoneLocator.AndroidWhistlerApp.AnonymousClass3 (com.WhistlePhoneLocator.AndroidWhistlerApp$3)
.class Lcom/WhistlePhoneLocator/AndroidWhistlerApp$3;
.super Ljava/lang/Object;
.source "AndroidWhistlerApp.java"

# interfaces
.implements Landroid/preference/Preference$OnPreferenceClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/WhistlePhoneLocator/AndroidWhistlerApp;->onCreate(Landroid/os/Bundle;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/WhistlePhoneLocator/AndroidWhistlerApp;


# direct methods
.method constructor <init>(Lcom/WhistlePhoneLocator/AndroidWhistlerApp;)V
    .registers 2

    .prologue
    .line 1
    iput-object p1, p0, Lcom/WhistlePhoneLocator/AndroidWhistlerApp$3;->this$0:Lcom/WhistlePhoneLocator/AndroidWhistlerApp;

    .line 131
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onPreferenceClick(Landroid/preference/Preference;)Z
    .registers 5
    .param p1, "preference"    # Landroid/preference/Preference;

    .prologue
    .line 134
    new-instance v0, Landroid/content/Intent;

    const-string v1, "android.intent.action.VIEW"

    const-string v2, "http://www.wix.com/kotnik/whistlepro"

    invoke-static {v2}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v2

    invoke-direct {v0, v1, v2}, Landroid/content/Intent;-><init>(Ljava/lang/String;Landroid/net/Uri;)V

    .line 135
    .local v0, "i1":Landroid/content/Intent;
    iget-object v1, p0, Lcom/WhistlePhoneLocator/AndroidWhistlerApp$3;->this$0:Lcom/WhistlePhoneLocator/AndroidWhistlerApp;

    invoke-virtual {v1, v0}, Lcom/WhistlePhoneLocator/AndroidWhistlerApp;->startActivity(Landroid/content/Intent;)V

    .line 136
    const/4 v1, 0x1

    return v1
.end method

###### Class com.WhistlePhoneLocator.AndroidWhistlerApp.AnonymousClass4 (com.WhistlePhoneLocator.AndroidWhistlerApp$4)
.class Lcom/WhistlePhoneLocator/AndroidWhistlerApp$4;
.super Ljava/lang/Object;
.source "AndroidWhistlerApp.java"

# interfaces
.implements Landroid/preference/Preference$OnPreferenceClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/WhistlePhoneLocator/AndroidWhistlerApp;->onCreate(Landroid/os/Bundle;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/WhistlePhoneLocator/AndroidWhistlerApp;


# direct methods
.method constructor <init>(Lcom/WhistlePhoneLocator/AndroidWhistlerApp;)V
    .registers 2

    .prologue
    .line 1
    iput-object p1, p0, Lcom/WhistlePhoneLocator/AndroidWhistlerApp$4;->this$0:Lcom/WhistlePhoneLocator/AndroidWhistlerApp;

    .line 143
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onPreferenceClick(Landroid/preference/Preference;)Z
    .registers 3
    .param p1, "preference"    # Landroid/preference/Preference;

    .prologue
    .line 147
    iget-object v0, p0, Lcom/WhistlePhoneLocator/AndroidWhistlerApp$4;->this$0:Lcom/WhistlePhoneLocator/AndroidWhistlerApp;

    invoke-static {v0}, Lcom/WhistlePhoneLocator/AndroidWhistlerApp;->access$3(Lcom/WhistlePhoneLocator/AndroidWhistlerApp;)Lcom/pad/android/iappad/AdController;

    move-result-object v0

    invoke-virtual {v0}, Lcom/pad/android/iappad/AdController;->loadAd()V

    .line 151
    const/4 v0, 0x1

    return v0
.end method

###### Class com.WhistlePhoneLocator.AndroidWhistlerApp.AnonymousClass5 (com.WhistlePhoneLocator.AndroidWhistlerApp$5)
.class Lcom/WhistlePhoneLocator/AndroidWhistlerApp$5;
.super Ljava/lang/Object;
.source "AndroidWhistlerApp.java"

# interfaces
.implements Landroid/preference/Preference$OnPreferenceClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/WhistlePhoneLocator/AndroidWhistlerApp;->onCreate(Landroid/os/Bundle;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/WhistlePhoneLocator/AndroidWhistlerApp;


# direct methods
.method constructor <init>(Lcom/WhistlePhoneLocator/AndroidWhistlerApp;)V
    .registers 2

    .prologue
    .line 1
    iput-object p1, p0, Lcom/WhistlePhoneLocator/AndroidWhistlerApp$5;->this$0:Lcom/WhistlePhoneLocator/AndroidWhistlerApp;

    .line 159
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onPreferenceClick(Landroid/preference/Preference;)Z
    .registers 5
    .param p1, "preference"    # Landroid/preference/Preference;

    .prologue
    .line 162
    new-instance v0, Landroid/content/Intent;

    const-string v1, "android.intent.action.VIEW"

    const-string v2, "http://ad.leadboltads.net/show_app_wall?section_id=156630333"

    invoke-static {v2}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v2

    invoke-direct {v0, v1, v2}, Landroid/content/Intent;-><init>(Ljava/lang/String;Landroid/net/Uri;)V

    .line 163
    .local v0, "i2":Landroid/content/Intent;
    iget-object v1, p0, Lcom/WhistlePhoneLocator/AndroidWhistlerApp$5;->this$0:Lcom/WhistlePhoneLocator/AndroidWhistlerApp;

    invoke-virtual {v1, v0}, Lcom/WhistlePhoneLocator/AndroidWhistlerApp;->startActivity(Landroid/content/Intent;)V

    .line 164
    const/4 v1, 0x1

    return v1
.end method

###### Class com.WhistlePhoneLocator.AndroidWhistlerApp.AnonymousClass6 (com.WhistlePhoneLocator.AndroidWhistlerApp$6)
.class Lcom/WhistlePhoneLocator/AndroidWhistlerApp$6;
.super Ljava/lang/Object;
.source "AndroidWhistlerApp.java"

# interfaces
.implements Landroid/preference/Preference$OnPreferenceClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/WhistlePhoneLocator/AndroidWhistlerApp;->onCreate(Landroid/os/Bundle;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/WhistlePhoneLocator/AndroidWhistlerApp;


# direct methods
.method constructor <init>(Lcom/WhistlePhoneLocator/AndroidWhistlerApp;)V
    .registers 2

    .prologue
    .line 1
    iput-object p1, p0, Lcom/WhistlePhoneLocator/AndroidWhistlerApp$6;->this$0:Lcom/WhistlePhoneLocator/AndroidWhistlerApp;

    .line 171
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onPreferenceClick(Landroid/preference/Preference;)Z
    .registers 5
    .param p1, "preference"    # Landroid/preference/Preference;

    .prologue
    .line 174
    iget-object v0, p0, Lcom/WhistlePhoneLocator/AndroidWhistlerApp$6;->this$0:Lcom/WhistlePhoneLocator/AndroidWhistlerApp;

    const-string v1, "\nPush Notification Disable\n\nIn order to permanently disable push notifications triggered by Whistle Locator PRO, please visit the following site and follow the instructions provided there:\n\nhttp://opt.leadbolt.com\n\nThank you!"

    const-string v2, "Back"

    invoke-static {v0, v1, v2}, Lcom/WhistlePhoneLocator/AndroidWhistlerApp;->access$2(Lcom/WhistlePhoneLocator/AndroidWhistlerApp;Ljava/lang/String;Ljava/lang/String;)V

    .line 175
    const/4 v0, 0x1

    return v0
.end method

###### Class com.WhistlePhoneLocator.AndroidWhistlerApp.AnonymousClass7 (com.WhistlePhoneLocator.AndroidWhistlerApp$7)
.class Lcom/WhistlePhoneLocator/AndroidWhistlerApp$7;
.super Ljava/lang/Object;
.source "AndroidWhistlerApp.java"

# interfaces
.implements Landroid/preference/Preference$OnPreferenceClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/WhistlePhoneLocator/AndroidWhistlerApp;->onCreate(Landroid/os/Bundle;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/WhistlePhoneLocator/AndroidWhistlerApp;


# direct methods
.method constructor <init>(Lcom/WhistlePhoneLocator/AndroidWhistlerApp;)V
    .registers 2

    .prologue
    .line 1
    iput-object p1, p0, Lcom/WhistlePhoneLocator/AndroidWhistlerApp$7;->this$0:Lcom/WhistlePhoneLocator/AndroidWhistlerApp;

    .line 183
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onPreferenceClick(Landroid/preference/Preference;)Z
    .registers 5
    .param p1, "preference"    # Landroid/preference/Preference;

    .prologue
    .line 186
    iget-object v0, p0, Lcom/WhistlePhoneLocator/AndroidWhistlerApp$7;->this$0:Lcom/WhistlePhoneLocator/AndroidWhistlerApp;

    const-string v1, "\nVersion: 3.1 (PRO)\nDate: September 16, 2012\n\nAuthor:\nBojan Kotnik\nbojan1.kotnik@gmail.com\n"

    const-string v2, "Back"

    invoke-static {v0, v1, v2}, Lcom/WhistlePhoneLocator/AndroidWhistlerApp;->access$2(Lcom/WhistlePhoneLocator/AndroidWhistlerApp;Ljava/lang/String;Ljava/lang/String;)V

    .line 187
    const/4 v0, 0x1

    return v0
.end method
