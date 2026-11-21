###### Class com.pad.android.util.AdRequest (com.pad.android.util.AdRequest)
.class public Lcom/pad/android/util/AdRequest;
.super Ljava/lang/Object;
.source "AdRequest.java"


# static fields
.field private static final LB_LOG:Ljava/lang/String; = "LBAdController"


# instance fields
.field private activity:Landroid/app/Activity;

.field private context:Landroid/content/Context;

.field private domain:Ljava/lang/String;

.field private loadIcon:Z

.field private notificationLaunchType:Ljava/lang/String;

.field private requestInProgress:Z

.field private results:Lorg/json/JSONObject;

.field private sHeight:I

.field private sWidth:I

.field private sectionid:Ljava/lang/String;

.field private subid:Ljava/lang/String;

.field private tm:Landroid/telephony/TelephonyManager;

.field private tokens:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lorg/apache/http/NameValuePair;",
            ">;"
        }
    .end annotation
.end field

.field private useLocation:Z

.field private useNotification:Z


# direct methods
.method public constructor <init>(Landroid/app/Activity;Ljava/lang/String;)V
    .registers 5
    .param p1, "act"    # Landroid/app/Activity;
    .param p2, "secid"    # Ljava/lang/String;

    .prologue
    const/4 v1, 0x0

    .line 50
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 34
    iput-boolean v1, p0, Lcom/pad/android/util/AdRequest;->requestInProgress:Z

    .line 39
    iput-boolean v1, p0, Lcom/pad/android/util/AdRequest;->useNotification:Z

    .line 40
    iput-boolean v1, p0, Lcom/pad/android/util/AdRequest;->loadIcon:Z

    .line 42
    const-string v0, "App"

    iput-object v0, p0, Lcom/pad/android/util/AdRequest;->notificationLaunchType:Ljava/lang/String;

    .line 45
    iput-boolean v1, p0, Lcom/pad/android/util/AdRequest;->useLocation:Z

    .line 52
    iput-object p1, p0, Lcom/pad/android/util/AdRequest;->activity:Landroid/app/Activity;

    .line 53
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/pad/android/util/AdRequest;->context:Landroid/content/Context;

    .line 54
    iput-object p2, p0, Lcom/pad/android/util/AdRequest;->sectionid:Ljava/lang/String;

    .line 55
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .registers 7
    .param p1, "ctx"    # Landroid/content/Context;
    .param p2, "secid"    # Ljava/lang/String;
    .param p3, "type"    # Ljava/lang/String;
    .param p4, "nLT"    # Ljava/lang/String;

    .prologue
    const/4 v1, 0x0

    .line 57
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 34
    iput-boolean v1, p0, Lcom/pad/android/util/AdRequest;->requestInProgress:Z

    .line 39
    iput-boolean v1, p0, Lcom/pad/android/util/AdRequest;->useNotification:Z

    .line 40
    iput-boolean v1, p0, Lcom/pad/android/util/AdRequest;->loadIcon:Z

    .line 42
    const-string v0, "App"

    iput-object v0, p0, Lcom/pad/android/util/AdRequest;->notificationLaunchType:Ljava/lang/String;

    .line 45
    iput-boolean v1, p0, Lcom/pad/android/util/AdRequest;->useLocation:Z

    .line 59
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/pad/android/util/AdRequest;->activity:Landroid/app/Activity;

    .line 60
    iput-object p1, p0, Lcom/pad/android/util/AdRequest;->context:Landroid/content/Context;

    .line 61
    iput-object p2, p0, Lcom/pad/android/util/AdRequest;->sectionid:Ljava/lang/String;

    .line 62
    const-string v0, "notification"

    invoke-virtual {p3, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    iput-boolean v0, p0, Lcom/pad/android/util/AdRequest;->useNotification:Z

    .line 63
    const-string v0, "icon"

    invoke-virtual {p3, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    iput-boolean v0, p0, Lcom/pad/android/util/AdRequest;->loadIcon:Z

    .line 64
    iput-object p4, p0, Lcom/pad/android/util/AdRequest;->notificationLaunchType:Ljava/lang/String;

    .line 65
    return-void
.end method


# virtual methods
.method public makeLBRequest()Lorg/json/JSONObject;
    .registers 43

    .prologue
    .line 86
    move-object/from16 v0, p0

    iget-boolean v3, v0, Lcom/pad/android/util/AdRequest;->requestInProgress:Z

    if-eqz v3, :cond_8

    .line 88
    const/4 v3, 0x0

    .line 246
    :goto_7
    return-object v3

    .line 92
    :cond_8
    const/4 v3, 0x1

    move-object/from16 v0, p0

    iput-boolean v3, v0, Lcom/pad/android/util/AdRequest;->requestInProgress:Z

    .line 94
    new-instance v30, Ljava/util/Random;

    invoke-direct/range {v30 .. v30}, Ljava/util/Random;-><init>()V

    .line 95
    .local v30, "r":Ljava/util/Random;
    const/16 v3, 0x97

    move-object/from16 v0, v30

    invoke-virtual {v0, v3}, Ljava/util/Random;->nextInt(I)I

    move-result v3

    add-int/lit16 v0, v3, 0xfa

    move/from16 v31, v0

    .line 98
    .local v31, "rand":I
    move/from16 v0, v31

    int-to-long v3, v0

    :try_start_21
    invoke-static {v3, v4}, Ljava/lang/Thread;->sleep(J)V
    :try_end_24
    .catch Ljava/lang/Exception; {:try_start_21 .. :try_end_24} :catch_3b5

    .line 102
    :goto_24
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/pad/android/util/AdRequest;->activity:Landroid/app/Activity;

    if-nez v3, :cond_127

    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/pad/android/util/AdRequest;->context:Landroid/content/Context;

    .line 103
    .local v2, "toUse":Landroid/content/Context;
    :goto_2e
    const-string v3, "Preference"

    const/4 v4, 0x2

    invoke-virtual {v2, v3, v4}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v29

    .line 105
    .local v29, "pref":Landroid/content/SharedPreferences;
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/pad/android/util/AdRequest;->activity:Landroid/app/Activity;

    if-eqz v3, :cond_d6

    .line 108
    new-instance v12, Landroid/util/DisplayMetrics;

    invoke-direct {v12}, Landroid/util/DisplayMetrics;-><init>()V

    .line 109
    .local v12, "dm":Landroid/util/DisplayMetrics;
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/pad/android/util/AdRequest;->activity:Landroid/app/Activity;

    invoke-virtual {v3}, Landroid/app/Activity;->getWindowManager()Landroid/view/WindowManager;

    move-result-object v3

    invoke-interface {v3}, Landroid/view/WindowManager;->getDefaultDisplay()Landroid/view/Display;

    move-result-object v3

    invoke-virtual {v3, v12}, Landroid/view/Display;->getMetrics(Landroid/util/DisplayMetrics;)V

    .line 111
    new-instance v32, Landroid/graphics/Rect;

    invoke-direct/range {v32 .. v32}, Landroid/graphics/Rect;-><init>()V

    .line 112
    .local v32, "rect":Landroid/graphics/Rect;
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/pad/android/util/AdRequest;->activity:Landroid/app/Activity;

    invoke-virtual {v3}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    move-result-object v39

    .line 113
    .local v39, "win":Landroid/view/Window;
    invoke-virtual/range {v39 .. v39}, Landroid/view/Window;->getDecorView()Landroid/view/View;

    move-result-object v3

    move-object/from16 v0, v32

    invoke-virtual {v3, v0}, Landroid/view/View;->getWindowVisibleDisplayFrame(Landroid/graphics/Rect;)V

    .line 114
    move-object/from16 v0, v32

    iget v0, v0, Landroid/graphics/Rect;->top:I

    move/from16 v34, v0

    .line 115
    .local v34, "statusBarHeight":I
    const v3, 0x1020002

    move-object/from16 v0, v39

    invoke-virtual {v0, v3}, Landroid/view/Window;->findViewById(I)Landroid/view/View;

    move-result-object v3

    invoke-virtual {v3}, Landroid/view/View;->getTop()I

    move-result v10

    .line 116
    .local v10, "contentViewTop":I
    move/from16 v0, v34

    if-le v10, v0, :cond_12d

    sub-int v36, v10, v34

    .line 118
    .local v36, "titleBarHeight":I
    :goto_7e
    iget v3, v12, Landroid/util/DisplayMetrics;->widthPixels:I

    move-object/from16 v0, p0

    iput v3, v0, Lcom/pad/android/util/AdRequest;->sWidth:I

    .line 119
    iget v3, v12, Landroid/util/DisplayMetrics;->heightPixels:I

    sub-int v3, v3, v34

    sub-int v3, v3, v36

    move-object/from16 v0, p0

    iput v3, v0, Lcom/pad/android/util/AdRequest;->sHeight:I

    .line 121
    const-string v3, "LBAdController"

    new-instance v4, Ljava/lang/StringBuilder;

    const-string v5, "Device Width = "

    invoke-direct {v4, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    move-object/from16 v0, p0

    iget v5, v0, Lcom/pad/android/util/AdRequest;->sWidth:I

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, ", Height = "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    move-object/from16 v0, p0

    iget v5, v0, Lcom/pad/android/util/AdRequest;->sHeight:I

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Lcom/pad/android/util/AdLog;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 122
    const-string v3, "LBAdController"

    new-instance v4, Ljava/lang/StringBuilder;

    const-string v5, "SBH = "

    invoke-direct {v4, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    move/from16 v0, v34

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, ", TBH = "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    move/from16 v0, v36

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Lcom/pad/android/util/AdLog;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 125
    .end local v10    # "contentViewTop":I
    .end local v12    # "dm":Landroid/util/DisplayMetrics;
    .end local v32    # "rect":Landroid/graphics/Rect;
    .end local v34    # "statusBarHeight":I
    .end local v36    # "titleBarHeight":I
    .end local v39    # "win":Landroid/view/Window;
    :cond_d6
    new-instance v28, Lorg/apache/http/params/BasicHttpParams;

    invoke-direct/range {v28 .. v28}, Lorg/apache/http/params/BasicHttpParams;-><init>()V

    .line 126
    .local v28, "params":Lorg/apache/http/params/HttpParams;
    const-string v3, "http.protocol.version"

    sget-object v4, Lorg/apache/http/HttpVersion;->HTTP_1_1:Lorg/apache/http/HttpVersion;

    move-object/from16 v0, v28

    invoke-interface {v0, v3, v4}, Lorg/apache/http/params/HttpParams;->setParameter(Ljava/lang/String;Ljava/lang/Object;)Lorg/apache/http/params/HttpParams;

    .line 127
    new-instance v21, Lorg/apache/http/impl/client/DefaultHttpClient;

    move-object/from16 v0, v21

    move-object/from16 v1, v28

    invoke-direct {v0, v1}, Lorg/apache/http/impl/client/DefaultHttpClient;-><init>(Lorg/apache/http/params/HttpParams;)V

    .line 130
    .local v21, "httpclient":Lorg/apache/http/client/HttpClient;
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/pad/android/util/AdRequest;->activity:Landroid/app/Activity;

    if-eqz v3, :cond_131

    .line 132
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/pad/android/util/AdRequest;->activity:Landroid/app/Activity;

    invoke-virtual {v3}, Landroid/app/Activity;->getBaseContext()Landroid/content/Context;

    move-result-object v3

    const-string v4, "phone"

    invoke-virtual {v3, v4}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Landroid/telephony/TelephonyManager;

    move-object/from16 v0, p0

    iput-object v3, v0, Lcom/pad/android/util/AdRequest;->tm:Landroid/telephony/TelephonyManager;

    .line 139
    :goto_107
    const/4 v3, 0x2

    new-array v0, v3, [Ljava/lang/String;

    move-object/from16 v38, v0

    const/4 v3, 0x0

    const-string v4, "http://ad.leadboltapps.net"

    aput-object v4, v38, v3

    const/4 v3, 0x1

    const-string v4, "http://ad.leadbolt.net"

    aput-object v4, v38, v3

    .line 142
    .local v38, "urlDomains":[Ljava/lang/String;
    const/16 v18, 0x0

    .line 143
    .local v18, "found":Z
    const/16 v23, 0x0

    .local v23, "i":I
    :goto_11a
    move-object/from16 v0, v38

    array-length v3, v0

    move/from16 v0, v23

    if-lt v0, v3, :cond_142

    .line 246
    :cond_121
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/pad/android/util/AdRequest;->results:Lorg/json/JSONObject;

    goto/16 :goto_7

    .line 102
    .end local v2    # "toUse":Landroid/content/Context;
    .end local v18    # "found":Z
    .end local v21    # "httpclient":Lorg/apache/http/client/HttpClient;
    .end local v23    # "i":I
    .end local v28    # "params":Lorg/apache/http/params/HttpParams;
    .end local v29    # "pref":Landroid/content/SharedPreferences;
    .end local v38    # "urlDomains":[Ljava/lang/String;
    :cond_127
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/pad/android/util/AdRequest;->activity:Landroid/app/Activity;

    goto/16 :goto_2e

    .line 116
    .restart local v2    # "toUse":Landroid/content/Context;
    .restart local v10    # "contentViewTop":I
    .restart local v12    # "dm":Landroid/util/DisplayMetrics;
    .restart local v29    # "pref":Landroid/content/SharedPreferences;
    .restart local v32    # "rect":Landroid/graphics/Rect;
    .restart local v34    # "statusBarHeight":I
    .restart local v39    # "win":Landroid/view/Window;
    :cond_12d
    const/16 v36, 0x0

    goto/16 :goto_7e

    .line 136
    .end local v10    # "contentViewTop":I
    .end local v12    # "dm":Landroid/util/DisplayMetrics;
    .end local v32    # "rect":Landroid/graphics/Rect;
    .end local v34    # "statusBarHeight":I
    .end local v39    # "win":Landroid/view/Window;
    .restart local v21    # "httpclient":Lorg/apache/http/client/HttpClient;
    .restart local v28    # "params":Lorg/apache/http/params/HttpParams;
    :cond_131
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/pad/android/util/AdRequest;->context:Landroid/content/Context;

    const-string v4, "phone"

    invoke-virtual {v3, v4}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Landroid/telephony/TelephonyManager;

    move-object/from16 v0, p0

    iput-object v3, v0, Lcom/pad/android/util/AdRequest;->tm:Landroid/telephony/TelephonyManager;

    goto :goto_107

    .line 146
    .restart local v18    # "found":Z
    .restart local v23    # "i":I
    .restart local v38    # "urlDomains":[Ljava/lang/String;
    :cond_142
    if-nez v18, :cond_121

    .line 152
    aget-object v3, v38, v23

    move-object/from16 v0, p0

    iput-object v3, v0, Lcom/pad/android/util/AdRequest;->domain:Ljava/lang/String;

    .line 153
    new-instance v3, Ljava/lang/StringBuilder;

    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/pad/android/util/AdRequest;->domain:Ljava/lang/String;

    invoke-static {v4}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v4, "/show_app.conf?"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v37

    .line 154
    .local v37, "url":Ljava/lang/String;
    move-object/from16 v0, p0

    iget-boolean v3, v0, Lcom/pad/android/util/AdRequest;->useNotification:Z

    if-eqz v3, :cond_328

    .line 156
    new-instance v3, Ljava/lang/StringBuilder;

    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/pad/android/util/AdRequest;->domain:Ljava/lang/String;

    invoke-static {v4}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v4, "/show_notification?"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v37

    .line 163
    :cond_17e
    :goto_17e
    new-instance v3, Ljava/lang/StringBuilder;

    const-string v4, "&section_id="

    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/pad/android/util/AdRequest;->sectionid:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, "&appId=null&optin="

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, "SD_APP_OPTIN"

    const-string v5, "0"

    move-object/from16 v0, v29

    invoke-interface {v0, v4, v5}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v19

    .line 164
    .local v19, "get":Ljava/lang/String;
    move-object/from16 v0, p0

    iget-boolean v3, v0, Lcom/pad/android/util/AdRequest;->useNotification:Z

    if-eqz v3, :cond_254

    .line 167
    new-instance v3, Ljava/lang/StringBuilder;

    const-string v4, "SD_ITERATION_COUNTER_"

    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/pad/android/util/AdRequest;->sectionid:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    const-string v4, "0"

    move-object/from16 v0, v29

    invoke-interface {v0, v3, v4}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(Ljava/lang/String;)Ljava/lang/Integer;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/Integer;->intValue()I

    move-result v26

    .line 168
    .local v26, "iterationcounter":I
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-static/range {v19 .. v19}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v4, "&iteration_counter="

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    move/from16 v0, v26

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v19

    .line 169
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-static/range {v19 .. v19}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v4, "&launch_type="

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/pad/android/util/AdRequest;->notificationLaunchType:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v19

    .line 170
    new-instance v3, Ljava/lang/StringBuilder;

    const-string v4, "SD_NOTIFICATION_FIRED_"

    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/pad/android/util/AdRequest;->sectionid:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    const-wide/16 v4, -0x1

    move-object/from16 v0, v29

    invoke-interface {v0, v3, v4, v5}, Landroid/content/SharedPreferences;->getLong(Ljava/lang/String;J)J

    move-result-wide v16

    .line 171
    .local v16, "fireTime":J
    const-wide/16 v3, -0x1

    cmp-long v3, v16, v3

    if-nez v3, :cond_347

    const/16 v25, -0x1

    .line 172
    .local v25, "interval":I
    :goto_225
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-static/range {v19 .. v19}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v4, "&notification_fired="

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    move/from16 v0, v25

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v19

    .line 173
    const-string v3, "LBAdController"

    new-instance v4, Ljava/lang/StringBuilder;

    const-string v5, "NotificationFired = "

    invoke-direct {v4, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    move/from16 v0, v25

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Lcom/pad/android/util/AdLog;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 175
    .end local v16    # "fireTime":J
    .end local v25    # "interval":I
    .end local v26    # "iterationcounter":I
    :cond_254
    move-object/from16 v0, p0

    iget-boolean v3, v0, Lcom/pad/android/util/AdRequest;->loadIcon:Z

    if-eqz v3, :cond_28b

    .line 177
    new-instance v3, Ljava/lang/StringBuilder;

    const-string v4, "SD_ICON_DISPLAY_"

    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/pad/android/util/AdRequest;->sectionid:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    const/4 v4, 0x0

    move-object/from16 v0, v29

    invoke-interface {v0, v3, v4}, Landroid/content/SharedPreferences;->getInt(Ljava/lang/String;I)I

    move-result v11

    .line 178
    .local v11, "displayCount":I
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-static/range {v19 .. v19}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v4, "&icon_displayed_count="

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v11}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v19

    .line 181
    .end local v11    # "displayCount":I
    :cond_28b
    invoke-virtual/range {v19 .. v19}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Lcom/pad/android/util/AdEncryption;->encrypt(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v20

    .line 182
    .local v20, "getString":Ljava/lang/String;
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-static/range {v37 .. v37}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v4, "&get="

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    move-object/from16 v0, v20

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, "&section_id="

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/pad/android/util/AdRequest;->sectionid:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v37

    .line 183
    const-string v3, "LBAdController"

    new-instance v4, Ljava/lang/StringBuilder;

    const-string v5, "Get = "

    invoke-direct {v4, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    move-object/from16 v0, v20

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Lcom/pad/android/util/AdLog;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 186
    new-instance v22, Lorg/apache/http/client/methods/HttpPost;

    move-object/from16 v0, v22

    move-object/from16 v1, v37

    invoke-direct {v0, v1}, Lorg/apache/http/client/methods/HttpPost;-><init>(Ljava/lang/String;)V

    .line 191
    .local v22, "httppost":Lorg/apache/http/client/methods/HttpPost;
    :try_start_2dd
    new-instance v27, Ljava/util/ArrayList;

    const/4 v3, 0x2

    move-object/from16 v0, v27

    invoke-direct {v0, v3}, Ljava/util/ArrayList;-><init>(I)V

    .line 192
    .local v27, "pair":Ljava/util/List;, "Ljava/util/List<Lorg/apache/http/NameValuePair;>;"
    new-instance v40, Lorg/apache/http/message/BasicNameValuePair;

    const-string v41, "ref"

    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/pad/android/util/AdRequest;->tm:Landroid/telephony/TelephonyManager;

    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/pad/android/util/AdRequest;->subid:Ljava/lang/String;

    move-object/from16 v0, p0

    iget-object v5, v0, Lcom/pad/android/util/AdRequest;->tokens:Ljava/util/List;

    move-object/from16 v0, p0

    iget-boolean v6, v0, Lcom/pad/android/util/AdRequest;->useLocation:Z

    move-object/from16 v0, p0

    iget v7, v0, Lcom/pad/android/util/AdRequest;->sWidth:I

    move-object/from16 v0, p0

    iget v8, v0, Lcom/pad/android/util/AdRequest;->sHeight:I

    invoke-static/range {v2 .. v8}, Lcom/pad/android/util/AdRefValues;->adRefValues(Landroid/content/Context;Landroid/telephony/TelephonyManager;Ljava/lang/String;Ljava/util/List;ZII)Ljava/lang/String;

    move-result-object v3

    move-object/from16 v0, v40

    move-object/from16 v1, v41

    invoke-direct {v0, v1, v3}, Lorg/apache/http/message/BasicNameValuePair;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    move-object/from16 v0, v27

    move-object/from16 v1, v40

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 193
    new-instance v3, Lorg/apache/http/client/entity/UrlEncodedFormEntity;

    move-object/from16 v0, v27

    invoke-direct {v3, v0}, Lorg/apache/http/client/entity/UrlEncodedFormEntity;-><init>(Ljava/util/List;)V

    move-object/from16 v0, v22

    invoke-virtual {v0, v3}, Lorg/apache/http/client/methods/HttpPost;->setEntity(Lorg/apache/http/HttpEntity;)V
    :try_end_31f
    .catch Ljava/lang/Exception; {:try_start_2dd .. :try_end_31f} :catch_358

    .line 201
    .end local v27    # "pair":Ljava/util/List;, "Ljava/util/List<Lorg/apache/http/NameValuePair;>;"
    :goto_31f
    const/4 v9, 0x0

    .line 202
    .local v9, "connectionCount":I
    :goto_320
    const/16 v3, 0xa

    if-lt v9, v3, :cond_35f

    .line 143
    :cond_324
    add-int/lit8 v23, v23, 0x1

    goto/16 :goto_11a

    .line 158
    .end local v9    # "connectionCount":I
    .end local v19    # "get":Ljava/lang/String;
    .end local v20    # "getString":Ljava/lang/String;
    .end local v22    # "httppost":Lorg/apache/http/client/methods/HttpPost;
    :cond_328
    move-object/from16 v0, p0

    iget-boolean v3, v0, Lcom/pad/android/util/AdRequest;->loadIcon:Z

    if-eqz v3, :cond_17e

    .line 160
    new-instance v3, Ljava/lang/StringBuilder;

    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/pad/android/util/AdRequest;->domain:Ljava/lang/String;

    invoke-static {v4}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v4, "/show_app_icon.conf?"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v37

    goto/16 :goto_17e

    .line 171
    .restart local v16    # "fireTime":J
    .restart local v19    # "get":Ljava/lang/String;
    .restart local v26    # "iterationcounter":I
    :cond_347
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v3

    const-wide/16 v5, 0x3e8

    div-long/2addr v3, v5

    long-to-int v3, v3

    const-wide/16 v4, 0x3e8

    div-long v4, v16, v4

    long-to-int v4, v4

    sub-int v25, v3, v4

    goto/16 :goto_225

    .line 196
    .end local v16    # "fireTime":J
    .end local v26    # "iterationcounter":I
    .restart local v20    # "getString":Ljava/lang/String;
    .restart local v22    # "httppost":Lorg/apache/http/client/methods/HttpPost;
    :catch_358
    move-exception v13

    .line 198
    .local v13, "e":Ljava/lang/Exception;
    const-string v3, "LBAdController"

    invoke-static {v3, v13}, Lcom/pad/android/util/AdLog;->printStackTrace(Ljava/lang/String;Ljava/lang/Exception;)V

    goto :goto_31f

    .line 204
    .end local v13    # "e":Ljava/lang/Exception;
    .restart local v9    # "connectionCount":I
    :cond_35f
    if-nez v18, :cond_324

    .line 214
    :try_start_361
    invoke-interface/range {v21 .. v22}, Lorg/apache/http/client/HttpClient;->execute(Lorg/apache/http/client/methods/HttpUriRequest;)Lorg/apache/http/HttpResponse;

    move-result-object v33

    .line 216
    .local v33, "response":Lorg/apache/http/HttpResponse;
    invoke-interface/range {v33 .. v33}, Lorg/apache/http/HttpResponse;->getStatusLine()Lorg/apache/http/StatusLine;

    move-result-object v3

    invoke-interface {v3}, Lorg/apache/http/StatusLine;->getStatusCode()I

    move-result v3

    const/16 v4, 0xc8

    if-ne v3, v4, :cond_38f

    .line 218
    const/16 v18, 0x1

    .line 220
    invoke-interface/range {v33 .. v33}, Lorg/apache/http/HttpResponse;->getEntity()Lorg/apache/http/HttpEntity;

    move-result-object v14

    .line 221
    .local v14, "entity":Lorg/apache/http/HttpEntity;
    if-eqz v14, :cond_38f

    .line 224
    invoke-interface {v14}, Lorg/apache/http/HttpEntity;->getContent()Ljava/io/InputStream;

    move-result-object v24

    .line 225
    .local v24, "instream":Ljava/io/InputStream;
    invoke-static/range {v24 .. v24}, Lcom/pad/android/util/AdUtilFuncs;->convertStreamToString(Ljava/io/InputStream;)Ljava/lang/String;

    move-result-object v35

    .line 226
    .local v35, "str":Ljava/lang/String;
    new-instance v3, Lorg/json/JSONObject;

    move-object/from16 v0, v35

    invoke-direct {v3, v0}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    move-object/from16 v0, p0

    iput-object v3, v0, Lcom/pad/android/util/AdRequest;->results:Lorg/json/JSONObject;

    .line 228
    invoke-virtual/range {v24 .. v24}, Ljava/io/InputStream;->close()V
    :try_end_38f
    .catch Ljava/lang/Exception; {:try_start_361 .. :try_end_38f} :catch_397
    .catchall {:try_start_361 .. :try_end_38f} :catchall_3ae

    .line 241
    .end local v14    # "entity":Lorg/apache/http/HttpEntity;
    .end local v24    # "instream":Ljava/io/InputStream;
    .end local v35    # "str":Ljava/lang/String;
    :cond_38f
    const/4 v3, 0x0

    move-object/from16 v0, p0

    iput-boolean v3, v0, Lcom/pad/android/util/AdRequest;->requestInProgress:Z

    .line 243
    .end local v33    # "response":Lorg/apache/http/HttpResponse;
    :goto_394
    add-int/lit8 v9, v9, 0x1

    goto :goto_320

    .line 232
    :catch_397
    move-exception v15

    .line 234
    .local v15, "ex":Ljava/lang/Exception;
    :try_start_398
    const-string v3, "LBAdController"

    invoke-static {v3, v15}, Lcom/pad/android/util/AdLog;->printStackTrace(Ljava/lang/String;Ljava/lang/Exception;)V

    .line 235
    const/16 v18, 0x0

    .line 236
    new-instance v3, Lorg/json/JSONObject;

    invoke-direct {v3}, Lorg/json/JSONObject;-><init>()V

    move-object/from16 v0, p0

    iput-object v3, v0, Lcom/pad/android/util/AdRequest;->results:Lorg/json/JSONObject;
    :try_end_3a8
    .catchall {:try_start_398 .. :try_end_3a8} :catchall_3ae

    .line 241
    const/4 v3, 0x0

    move-object/from16 v0, p0

    iput-boolean v3, v0, Lcom/pad/android/util/AdRequest;->requestInProgress:Z

    goto :goto_394

    .line 240
    .end local v15    # "ex":Ljava/lang/Exception;
    :catchall_3ae
    move-exception v3

    .line 241
    const/4 v4, 0x0

    move-object/from16 v0, p0

    iput-boolean v4, v0, Lcom/pad/android/util/AdRequest;->requestInProgress:Z

    .line 242
    throw v3

    .line 100
    .end local v2    # "toUse":Landroid/content/Context;
    .end local v9    # "connectionCount":I
    .end local v18    # "found":Z
    .end local v19    # "get":Ljava/lang/String;
    .end local v20    # "getString":Ljava/lang/String;
    .end local v21    # "httpclient":Lorg/apache/http/client/HttpClient;
    .end local v22    # "httppost":Lorg/apache/http/client/methods/HttpPost;
    .end local v23    # "i":I
    .end local v28    # "params":Lorg/apache/http/params/HttpParams;
    .end local v29    # "pref":Landroid/content/SharedPreferences;
    .end local v37    # "url":Ljava/lang/String;
    .end local v38    # "urlDomains":[Ljava/lang/String;
    :catch_3b5
    move-exception v3

    goto/16 :goto_24
.end method

.method public setSubId(Ljava/lang/String;)V
    .registers 2
    .param p1, "sbid"    # Ljava/lang/String;

    .prologue
    .line 69
    iput-object p1, p0, Lcom/pad/android/util/AdRequest;->subid:Ljava/lang/String;

    .line 70
    return-void
.end method

.method public setTokens(Ljava/util/List;)V
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Lorg/apache/http/NameValuePair;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 74
    .local p1, "tks":Ljava/util/List;, "Ljava/util/List<Lorg/apache/http/NameValuePair;>;"
    iput-object p1, p0, Lcom/pad/android/util/AdRequest;->tokens:Ljava/util/List;

    .line 75
    return-void
.end method

.method public setUseLocation(Z)V
    .registers 5
    .param p1, "uL"    # Z

    .prologue
    .line 79
    iput-boolean p1, p0, Lcom/pad/android/util/AdRequest;->useLocation:Z

    .line 80
    const-string v0, "LBAdController"

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "setUseLocation: "

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/pad/android/util/AdLog;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 81
    return-void
.end method
