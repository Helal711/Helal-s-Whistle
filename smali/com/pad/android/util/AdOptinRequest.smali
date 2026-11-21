###### Class com.pad.android.util.AdOptinRequest (com.pad.android.util.AdOptinRequest)
.class public Lcom/pad/android/util/AdOptinRequest;
.super Landroid/os/AsyncTask;
.source "AdOptinRequest.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Landroid/os/AsyncTask",
        "<",
        "Ljava/lang/Void;",
        "Ljava/lang/Void;",
        "Lorg/json/JSONObject;",
        ">;"
    }
.end annotation


# instance fields
.field private final LB_LOG:Ljava/lang/String;

.field private activity:Landroid/app/Activity;

.field private context:Landroid/content/Context;

.field private oListener:Lcom/pad/android/listener/AdOptinListener;

.field private optinValues:Lorg/json/JSONObject;

.field private sectionid:Ljava/lang/String;


# direct methods
.method public constructor <init>(Landroid/app/Activity;Ljava/lang/String;Landroid/content/Context;Lcom/pad/android/listener/AdOptinListener;)V
    .registers 7
    .param p1, "act"    # Landroid/app/Activity;
    .param p2, "secid"    # Ljava/lang/String;
    .param p3, "ctx"    # Landroid/content/Context;
    .param p4, "list"    # Lcom/pad/android/listener/AdOptinListener;

    .prologue
    const/4 v1, 0x0

    .line 47
    invoke-direct {p0}, Landroid/os/AsyncTask;-><init>()V

    .line 38
    const-string v0, "LBAdController"

    iput-object v0, p0, Lcom/pad/android/util/AdOptinRequest;->LB_LOG:Ljava/lang/String;

    .line 40
    iput-object v1, p0, Lcom/pad/android/util/AdOptinRequest;->activity:Landroid/app/Activity;

    .line 41
    iput-object v1, p0, Lcom/pad/android/util/AdOptinRequest;->sectionid:Ljava/lang/String;

    .line 42
    iput-object v1, p0, Lcom/pad/android/util/AdOptinRequest;->context:Landroid/content/Context;

    .line 43
    iput-object v1, p0, Lcom/pad/android/util/AdOptinRequest;->oListener:Lcom/pad/android/listener/AdOptinListener;

    .line 49
    iput-object p1, p0, Lcom/pad/android/util/AdOptinRequest;->activity:Landroid/app/Activity;

    .line 50
    iput-object p2, p0, Lcom/pad/android/util/AdOptinRequest;->sectionid:Ljava/lang/String;

    .line 51
    iput-object p3, p0, Lcom/pad/android/util/AdOptinRequest;->context:Landroid/content/Context;

    .line 52
    iput-object p4, p0, Lcom/pad/android/util/AdOptinRequest;->oListener:Lcom/pad/android/listener/AdOptinListener;

    .line 53
    return-void
.end method

.method private makeOptinRequest()Lorg/json/JSONObject;
    .registers 39

    .prologue
    .line 71
    const/16 v27, 0x0

    .line 72
    .local v27, "res":Lorg/json/JSONObject;
    const-string v4, "LBAdController"

    new-instance v5, Ljava/lang/StringBuilder;

    const-string v6, "AdOptin started - "

    invoke-direct {v5, v6}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    move-object/from16 v0, p0

    iget-object v6, v0, Lcom/pad/android/util/AdOptinRequest;->activity:Landroid/app/Activity;

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, ", "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    move-object/from16 v0, p0

    iget-object v6, v0, Lcom/pad/android/util/AdOptinRequest;->sectionid:Ljava/lang/String;

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, ", "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    move-object/from16 v0, p0

    iget-object v6, v0, Lcom/pad/android/util/AdOptinRequest;->context:Landroid/content/Context;

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, ", "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    move-object/from16 v0, p0

    iget-object v6, v0, Lcom/pad/android/util/AdOptinRequest;->oListener:Lcom/pad/android/listener/AdOptinListener;

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Lcom/pad/android/util/AdLog;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 73
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/pad/android/util/AdOptinRequest;->activity:Landroid/app/Activity;

    if-nez v4, :cond_50

    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/pad/android/util/AdOptinRequest;->context:Landroid/content/Context;

    if-eqz v4, :cond_136

    .line 76
    :cond_50
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/pad/android/util/AdOptinRequest;->activity:Landroid/app/Activity;

    if-eqz v4, :cond_137

    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/pad/android/util/AdOptinRequest;->activity:Landroid/app/Activity;

    .line 77
    .local v2, "toUse":Landroid/content/Context;
    :goto_5a
    const-string v4, "Preference"

    const/4 v5, 0x2

    invoke-virtual {v2, v4, v5}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v25

    .line 78
    .local v25, "pref":Landroid/content/SharedPreferences;
    const-string v4, "SD_APP_OPTIN_SHOWN"

    const-string v5, "notset"

    move-object/from16 v0, v25

    invoke-interface {v0, v4, v5}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v20

    .line 79
    .local v20, "makeRequest":Ljava/lang/String;
    const-string v32, ""

    .line 80
    .local v32, "toReturn":Ljava/lang/String;
    const-string v4, "notset"

    move-object/from16 v0, v20

    invoke-virtual {v0, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-nez v4, :cond_81

    const-string v4, "invalid"

    move-object/from16 v0, v20

    invoke-virtual {v0, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_136

    .line 82
    :cond_81
    const-string v4, "LBAdController"

    const-string v5, "Cookie is ok, going to check internet"

    invoke-static {v4, v5}, Lcom/pad/android/util/AdLog;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 83
    const-string v4, "connectivity"

    invoke-virtual {v2, v4}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Landroid/net/ConnectivityManager;

    .line 85
    .local v9, "cm":Landroid/net/ConnectivityManager;
    invoke-virtual {v9}, Landroid/net/ConnectivityManager;->getActiveNetworkInfo()Landroid/net/NetworkInfo;

    move-result-object v21

    .line 86
    .local v21, "netInfo":Landroid/net/NetworkInfo;
    if-eqz v21, :cond_136

    .line 88
    const-string v4, "LBAdController"

    const-string v5, "Internet available - going to make the request"

    invoke-static {v4, v5}, Lcom/pad/android/util/AdLog;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 89
    const/4 v7, 0x0

    .local v7, "deviceWidth":I
    const/4 v8, 0x0

    .line 91
    .local v8, "deviceHeight":I
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/pad/android/util/AdOptinRequest;->activity:Landroid/app/Activity;

    if-eqz v4, :cond_f0

    .line 94
    new-instance v12, Landroid/util/DisplayMetrics;

    invoke-direct {v12}, Landroid/util/DisplayMetrics;-><init>()V

    .line 95
    .local v12, "dm":Landroid/util/DisplayMetrics;
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/pad/android/util/AdOptinRequest;->activity:Landroid/app/Activity;

    invoke-virtual {v4}, Landroid/app/Activity;->getWindowManager()Landroid/view/WindowManager;

    move-result-object v4

    invoke-interface {v4}, Landroid/view/WindowManager;->getDefaultDisplay()Landroid/view/Display;

    move-result-object v4

    invoke-virtual {v4, v12}, Landroid/view/Display;->getMetrics(Landroid/util/DisplayMetrics;)V

    .line 97
    new-instance v26, Landroid/graphics/Rect;

    invoke-direct/range {v26 .. v26}, Landroid/graphics/Rect;-><init>()V

    .line 98
    .local v26, "rect":Landroid/graphics/Rect;
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/pad/android/util/AdOptinRequest;->activity:Landroid/app/Activity;

    invoke-virtual {v4}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    move-result-object v35

    .line 99
    .local v35, "win":Landroid/view/Window;
    invoke-virtual/range {v35 .. v35}, Landroid/view/Window;->getDecorView()Landroid/view/View;

    move-result-object v4

    move-object/from16 v0, v26

    invoke-virtual {v4, v0}, Landroid/view/View;->getWindowVisibleDisplayFrame(Landroid/graphics/Rect;)V

    .line 100
    move-object/from16 v0, v26

    iget v0, v0, Landroid/graphics/Rect;->top:I

    move/from16 v30, v0

    .line 101
    .local v30, "statusBarHeight":I
    const v4, 0x1020002

    move-object/from16 v0, v35

    invoke-virtual {v0, v4}, Landroid/view/Window;->findViewById(I)Landroid/view/View;

    move-result-object v4

    invoke-virtual {v4}, Landroid/view/View;->getTop()I

    move-result v11

    .line 102
    .local v11, "contentViewTop":I
    move/from16 v0, v30

    if-le v11, v0, :cond_13d

    sub-int v31, v11, v30

    .line 104
    .local v31, "titleBarHeight":I
    :goto_e8
    iget v7, v12, Landroid/util/DisplayMetrics;->widthPixels:I

    .line 105
    iget v4, v12, Landroid/util/DisplayMetrics;->heightPixels:I

    sub-int v4, v4, v30

    sub-int v8, v4, v31

    .line 108
    .end local v11    # "contentViewTop":I
    .end local v12    # "dm":Landroid/util/DisplayMetrics;
    .end local v26    # "rect":Landroid/graphics/Rect;
    .end local v30    # "statusBarHeight":I
    .end local v31    # "titleBarHeight":I
    .end local v35    # "win":Landroid/view/Window;
    :cond_f0
    new-instance v24, Lorg/apache/http/params/BasicHttpParams;

    invoke-direct/range {v24 .. v24}, Lorg/apache/http/params/BasicHttpParams;-><init>()V

    .line 109
    .local v24, "params":Lorg/apache/http/params/HttpParams;
    const-string v4, "http.protocol.version"

    sget-object v5, Lorg/apache/http/HttpVersion;->HTTP_1_1:Lorg/apache/http/HttpVersion;

    move-object/from16 v0, v24

    invoke-interface {v0, v4, v5}, Lorg/apache/http/params/HttpParams;->setParameter(Ljava/lang/String;Ljava/lang/Object;)Lorg/apache/http/params/HttpParams;

    .line 110
    new-instance v16, Lorg/apache/http/impl/client/DefaultHttpClient;

    move-object/from16 v0, v16

    move-object/from16 v1, v24

    invoke-direct {v0, v1}, Lorg/apache/http/impl/client/DefaultHttpClient;-><init>(Lorg/apache/http/params/HttpParams;)V

    .line 112
    .local v16, "httpclient":Lorg/apache/http/client/HttpClient;
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/pad/android/util/AdOptinRequest;->activity:Landroid/app/Activity;

    if-eqz v4, :cond_140

    .line 114
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/pad/android/util/AdOptinRequest;->activity:Landroid/app/Activity;

    invoke-virtual {v4}, Landroid/app/Activity;->getBaseContext()Landroid/content/Context;

    move-result-object v4

    const-string v5, "phone"

    invoke-virtual {v4, v5}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Landroid/telephony/TelephonyManager;

    .line 121
    .local v3, "tele":Landroid/telephony/TelephonyManager;
    :goto_11d
    const/4 v4, 0x2

    new-array v0, v4, [Ljava/lang/String;

    move-object/from16 v34, v0

    const/4 v4, 0x0

    const-string v5, "http://ad.leadboltapps.net"

    aput-object v5, v34, v4

    const/4 v4, 0x1

    const-string v5, "http://ad.leadbolt.net"

    aput-object v5, v34, v4

    .line 123
    .local v34, "urlDomains":[Ljava/lang/String;
    const/4 v15, 0x0

    .line 124
    .local v15, "found":Z
    const/16 v18, 0x0

    .local v18, "i":I
    :goto_12f
    move-object/from16 v0, v34

    array-length v4, v0

    move/from16 v0, v18

    if-lt v0, v4, :cond_14d

    .line 199
    .end local v2    # "toUse":Landroid/content/Context;
    .end local v3    # "tele":Landroid/telephony/TelephonyManager;
    .end local v7    # "deviceWidth":I
    .end local v8    # "deviceHeight":I
    .end local v9    # "cm":Landroid/net/ConnectivityManager;
    .end local v15    # "found":Z
    .end local v16    # "httpclient":Lorg/apache/http/client/HttpClient;
    .end local v18    # "i":I
    .end local v20    # "makeRequest":Ljava/lang/String;
    .end local v21    # "netInfo":Landroid/net/NetworkInfo;
    .end local v24    # "params":Lorg/apache/http/params/HttpParams;
    .end local v25    # "pref":Landroid/content/SharedPreferences;
    .end local v32    # "toReturn":Ljava/lang/String;
    .end local v34    # "urlDomains":[Ljava/lang/String;
    :cond_136
    return-object v27

    .line 76
    :cond_137
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/pad/android/util/AdOptinRequest;->context:Landroid/content/Context;

    goto/16 :goto_5a

    .line 102
    .restart local v2    # "toUse":Landroid/content/Context;
    .restart local v7    # "deviceWidth":I
    .restart local v8    # "deviceHeight":I
    .restart local v9    # "cm":Landroid/net/ConnectivityManager;
    .restart local v11    # "contentViewTop":I
    .restart local v12    # "dm":Landroid/util/DisplayMetrics;
    .restart local v20    # "makeRequest":Ljava/lang/String;
    .restart local v21    # "netInfo":Landroid/net/NetworkInfo;
    .restart local v25    # "pref":Landroid/content/SharedPreferences;
    .restart local v26    # "rect":Landroid/graphics/Rect;
    .restart local v30    # "statusBarHeight":I
    .restart local v32    # "toReturn":Ljava/lang/String;
    .restart local v35    # "win":Landroid/view/Window;
    :cond_13d
    const/16 v31, 0x0

    goto :goto_e8

    .line 118
    .end local v11    # "contentViewTop":I
    .end local v12    # "dm":Landroid/util/DisplayMetrics;
    .end local v26    # "rect":Landroid/graphics/Rect;
    .end local v30    # "statusBarHeight":I
    .end local v35    # "win":Landroid/view/Window;
    .restart local v16    # "httpclient":Lorg/apache/http/client/HttpClient;
    .restart local v24    # "params":Lorg/apache/http/params/HttpParams;
    :cond_140
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/pad/android/util/AdOptinRequest;->context:Landroid/content/Context;

    const-string v5, "phone"

    invoke-virtual {v4, v5}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Landroid/telephony/TelephonyManager;

    .restart local v3    # "tele":Landroid/telephony/TelephonyManager;
    goto :goto_11d

    .line 127
    .restart local v15    # "found":Z
    .restart local v18    # "i":I
    .restart local v34    # "urlDomains":[Ljava/lang/String;
    :cond_14d
    if-nez v15, :cond_136

    .line 133
    aget-object v22, v34, v18

    .line 134
    .local v22, "optindomain":Ljava/lang/String;
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-static/range {v22 .. v22}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v5

    invoke-direct {v4, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v5, "/optin.php?"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v33

    .line 135
    .local v33, "url":Ljava/lang/String;
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-static/range {v33 .. v33}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v5

    invoke-direct {v4, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v5, "&section_id="

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    move-object/from16 v0, p0

    iget-object v5, v0, Lcom/pad/android/util/AdOptinRequest;->sectionid:Ljava/lang/String;

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v33

    .line 137
    new-instance v17, Lorg/apache/http/client/methods/HttpPost;

    move-object/from16 v0, v17

    move-object/from16 v1, v33

    invoke-direct {v0, v1}, Lorg/apache/http/client/methods/HttpPost;-><init>(Ljava/lang/String;)V

    .line 142
    .local v17, "httppost":Lorg/apache/http/client/methods/HttpPost;
    :try_start_188
    new-instance v23, Ljava/util/ArrayList;

    const/4 v4, 0x2

    move-object/from16 v0, v23

    invoke-direct {v0, v4}, Ljava/util/ArrayList;-><init>(I)V

    .line 143
    .local v23, "pair":Ljava/util/List;, "Ljava/util/List<Lorg/apache/http/NameValuePair;>;"
    new-instance v36, Lorg/apache/http/message/BasicNameValuePair;

    const-string v37, "ref"

    const-string v4, ""

    const/4 v5, 0x0

    const/4 v6, 0x0

    invoke-static/range {v2 .. v8}, Lcom/pad/android/util/AdRefValues;->adRefValues(Landroid/content/Context;Landroid/telephony/TelephonyManager;Ljava/lang/String;Ljava/util/List;ZII)Ljava/lang/String;

    move-result-object v4

    move-object/from16 v0, v36

    move-object/from16 v1, v37

    invoke-direct {v0, v1, v4}, Lorg/apache/http/message/BasicNameValuePair;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    move-object/from16 v0, v23

    move-object/from16 v1, v36

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 144
    new-instance v4, Lorg/apache/http/client/entity/UrlEncodedFormEntity;

    move-object/from16 v0, v23

    invoke-direct {v4, v0}, Lorg/apache/http/client/entity/UrlEncodedFormEntity;-><init>(Ljava/util/List;)V

    move-object/from16 v0, v17

    invoke-virtual {v0, v4}, Lorg/apache/http/client/methods/HttpPost;->setEntity(Lorg/apache/http/HttpEntity;)V
    :try_end_1b6
    .catch Ljava/lang/Exception; {:try_start_188 .. :try_end_1b6} :catch_1c3

    .line 152
    .end local v23    # "pair":Ljava/util/List;, "Ljava/util/List<Lorg/apache/http/NameValuePair;>;"
    :goto_1b6
    const/4 v10, 0x0

    .local v10, "connectionCount":I
    move-object/from16 v28, v27

    .line 153
    .end local v27    # "res":Lorg/json/JSONObject;
    .local v28, "res":Lorg/json/JSONObject;
    :cond_1b9
    :goto_1b9
    const/16 v4, 0xa

    if-lt v10, v4, :cond_1ca

    .line 124
    :cond_1bd
    add-int/lit8 v18, v18, 0x1

    move-object/from16 v27, v28

    .end local v28    # "res":Lorg/json/JSONObject;
    .restart local v27    # "res":Lorg/json/JSONObject;
    goto/16 :goto_12f

    .line 147
    .end local v10    # "connectionCount":I
    :catch_1c3
    move-exception v13

    .line 149
    .local v13, "e":Ljava/lang/Exception;
    const-string v4, "LBAdController"

    invoke-static {v4, v13}, Lcom/pad/android/util/AdLog;->printStackTrace(Ljava/lang/String;Ljava/lang/Exception;)V

    goto :goto_1b6

    .line 155
    .end local v13    # "e":Ljava/lang/Exception;
    .end local v27    # "res":Lorg/json/JSONObject;
    .restart local v10    # "connectionCount":I
    .restart local v28    # "res":Lorg/json/JSONObject;
    :cond_1ca
    if-nez v15, :cond_1bd

    .line 165
    :try_start_1cc
    invoke-interface/range {v16 .. v17}, Lorg/apache/http/client/HttpClient;->execute(Lorg/apache/http/client/methods/HttpUriRequest;)Lorg/apache/http/HttpResponse;

    move-result-object v29

    .line 167
    .local v29, "response":Lorg/apache/http/HttpResponse;
    invoke-interface/range {v29 .. v29}, Lorg/apache/http/HttpResponse;->getStatusLine()Lorg/apache/http/StatusLine;

    move-result-object v4

    invoke-interface {v4}, Lorg/apache/http/StatusLine;->getStatusCode()I

    move-result v4

    const/16 v5, 0xc8

    if-ne v4, v5, :cond_1b9

    .line 169
    const/4 v15, 0x1

    .line 171
    invoke-interface/range {v29 .. v29}, Lorg/apache/http/HttpResponse;->getEntity()Lorg/apache/http/HttpEntity;

    move-result-object v14

    .line 172
    .local v14, "entity":Lorg/apache/http/HttpEntity;
    if-eqz v14, :cond_1b9

    .line 175
    invoke-interface {v14}, Lorg/apache/http/HttpEntity;->getContent()Ljava/io/InputStream;

    move-result-object v19

    .line 176
    .local v19, "instream":Ljava/io/InputStream;
    invoke-static/range {v19 .. v19}, Lcom/pad/android/util/AdUtilFuncs;->convertStreamToString(Ljava/io/InputStream;)Ljava/lang/String;
    :try_end_1ea
    .catch Ljava/lang/Exception; {:try_start_1cc .. :try_end_1ea} :catch_216

    move-result-object v32

    .line 179
    :try_start_1eb
    new-instance v27, Lorg/json/JSONObject;

    move-object/from16 v0, v27

    move-object/from16 v1, v32

    invoke-direct {v0, v1}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V
    :try_end_1f4
    .catch Lorg/json/JSONException; {:try_start_1eb .. :try_end_1f4} :catch_1f7
    .catch Ljava/lang/Exception; {:try_start_1eb .. :try_end_1f4} :catch_216

    .end local v28    # "res":Lorg/json/JSONObject;
    .restart local v27    # "res":Lorg/json/JSONObject;
    move-object/from16 v28, v27

    .end local v27    # "res":Lorg/json/JSONObject;
    .restart local v28    # "res":Lorg/json/JSONObject;
    goto :goto_1b9

    .line 181
    :catch_1f7
    move-exception v13

    .line 183
    .local v13, "e":Lorg/json/JSONException;
    :try_start_1f8
    const-string v4, "LBAdController"

    invoke-static {v4, v13}, Lcom/pad/android/util/AdLog;->printStackTrace(Ljava/lang/String;Ljava/lang/Exception;)V

    .line 184
    const-string v4, "LBAdController"

    new-instance v5, Ljava/lang/StringBuilder;

    const-string v6, "Error in creating JSON Object for Optin - "

    invoke-direct {v5, v6}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v13}, Lorg/json/JSONException;->getMessage()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Lcom/pad/android/util/AdLog;->e(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_215
    .catch Ljava/lang/Exception; {:try_start_1f8 .. :try_end_215} :catch_216

    goto :goto_1b9

    .line 189
    .end local v13    # "e":Lorg/json/JSONException;
    .end local v14    # "entity":Lorg/apache/http/HttpEntity;
    .end local v19    # "instream":Ljava/io/InputStream;
    .end local v29    # "response":Lorg/apache/http/HttpResponse;
    :catch_216
    move-exception v13

    .line 191
    .local v13, "e":Ljava/lang/Exception;
    const-string v4, "LBAdController"

    invoke-static {v4, v13}, Lcom/pad/android/util/AdLog;->printStackTrace(Ljava/lang/String;Ljava/lang/Exception;)V

    goto :goto_1b9
.end method


# virtual methods
.method protected bridge varargs synthetic doInBackground([Ljava/lang/Object;)Ljava/lang/Object;
    .registers 3

    .prologue
    .line 1
    check-cast p1, [Ljava/lang/Void;

    invoke-virtual {p0, p1}, Lcom/pad/android/util/AdOptinRequest;->doInBackground([Ljava/lang/Void;)Lorg/json/JSONObject;

    move-result-object v0

    return-object v0
.end method

.method protected varargs doInBackground([Ljava/lang/Void;)Lorg/json/JSONObject;
    .registers 6
    .param p1, "params"    # [Ljava/lang/Void;

    .prologue
    .line 58
    iget-object v3, p0, Lcom/pad/android/util/AdOptinRequest;->activity:Landroid/app/Activity;

    if-eqz v3, :cond_19

    iget-object v2, p0, Lcom/pad/android/util/AdOptinRequest;->activity:Landroid/app/Activity;

    .line 59
    .local v2, "toUse":Landroid/content/Context;
    :goto_6
    const-string v3, "connectivity"

    invoke-virtual {v2, v3}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/net/ConnectivityManager;

    .line 60
    .local v0, "cm":Landroid/net/ConnectivityManager;
    invoke-virtual {v0}, Landroid/net/ConnectivityManager;->getActiveNetworkInfo()Landroid/net/NetworkInfo;

    move-result-object v1

    .line 61
    .local v1, "netInfo":Landroid/net/NetworkInfo;
    if-eqz v1, :cond_1c

    .line 64
    invoke-direct {p0}, Lcom/pad/android/util/AdOptinRequest;->makeOptinRequest()Lorg/json/JSONObject;

    move-result-object v3

    .line 66
    :goto_18
    return-object v3

    .line 58
    .end local v0    # "cm":Landroid/net/ConnectivityManager;
    .end local v1    # "netInfo":Landroid/net/NetworkInfo;
    .end local v2    # "toUse":Landroid/content/Context;
    :cond_19
    iget-object v2, p0, Lcom/pad/android/util/AdOptinRequest;->context:Landroid/content/Context;

    goto :goto_6

    .line 66
    .restart local v0    # "cm":Landroid/net/ConnectivityManager;
    .restart local v1    # "netInfo":Landroid/net/NetworkInfo;
    .restart local v2    # "toUse":Landroid/content/Context;
    :cond_1c
    const/4 v3, 0x0

    goto :goto_18
.end method

.method protected bridge synthetic onPostExecute(Ljava/lang/Object;)V
    .registers 2

    .prologue
    .line 1
    check-cast p1, Lorg/json/JSONObject;

    invoke-virtual {p0, p1}, Lcom/pad/android/util/AdOptinRequest;->onPostExecute(Lorg/json/JSONObject;)V

    return-void
.end method

.method protected onPostExecute(Lorg/json/JSONObject;)V
    .registers 14
    .param p1, "res"    # Lorg/json/JSONObject;

    .prologue
    const/4 v10, 0x1

    .line 204
    if-nez p1, :cond_d

    .line 206
    iget-object v7, p0, Lcom/pad/android/util/AdOptinRequest;->oListener:Lcom/pad/android/listener/AdOptinListener;

    if-eqz v7, :cond_c

    .line 208
    iget-object v7, p0, Lcom/pad/android/util/AdOptinRequest;->oListener:Lcom/pad/android/listener/AdOptinListener;

    invoke-interface {v7}, Lcom/pad/android/listener/AdOptinListener;->onAdOptin()V

    .line 343
    :cond_c
    :goto_c
    return-void

    .line 212
    :cond_d
    iput-object p1, p0, Lcom/pad/android/util/AdOptinRequest;->optinValues:Lorg/json/JSONObject;

    .line 213
    iget-object v7, p0, Lcom/pad/android/util/AdOptinRequest;->activity:Landroid/app/Activity;

    if-nez v7, :cond_17

    iget-object v7, p0, Lcom/pad/android/util/AdOptinRequest;->context:Landroid/content/Context;

    if-eqz v7, :cond_1b3

    :cond_17
    iget-object v7, p0, Lcom/pad/android/util/AdOptinRequest;->optinValues:Lorg/json/JSONObject;

    if-eqz v7, :cond_1b3

    .line 215
    iget-object v7, p0, Lcom/pad/android/util/AdOptinRequest;->activity:Landroid/app/Activity;

    if-eqz v7, :cond_a9

    iget-object v6, p0, Lcom/pad/android/util/AdOptinRequest;->activity:Landroid/app/Activity;

    .line 216
    .local v6, "toUse":Landroid/content/Context;
    :goto_21
    const-string v7, "Preference"

    const/4 v8, 0x2

    invoke-virtual {v6, v7, v8}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v5

    .line 217
    .local v5, "pref":Landroid/content/SharedPreferences;
    invoke-interface {v5}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v1

    .line 219
    .local v1, "editor":Landroid/content/SharedPreferences$Editor;
    iget-object v7, p0, Lcom/pad/android/util/AdOptinRequest;->optinValues:Lorg/json/JSONObject;

    if-eqz v7, :cond_c

    .line 222
    const-string v4, ""

    .local v4, "optinType":Ljava/lang/String;
    const-string v2, ""

    .line 225
    .local v2, "optinText":Ljava/lang/String;
    :try_start_34
    iget-object v7, p0, Lcom/pad/android/util/AdOptinRequest;->optinValues:Lorg/json/JSONObject;

    const-string v8, "optintype"

    invoke-virtual {v7, v8}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    .line 226
    iget-object v7, p0, Lcom/pad/android/util/AdOptinRequest;->optinValues:Lorg/json/JSONObject;

    const-string v8, "optintext"

    invoke-virtual {v7, v8}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;
    :try_end_43
    .catch Ljava/lang/Exception; {:try_start_34 .. :try_end_43} :catch_1be

    move-result-object v2

    .line 230
    :goto_44
    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v8

    invoke-virtual {v7, v8, v9}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    .line 233
    .local v3, "optinTime":Ljava/lang/String;
    iget-object v7, p0, Lcom/pad/android/util/AdOptinRequest;->context:Landroid/content/Context;

    if-eqz v7, :cond_d1

    .line 235
    const-string v7, "LBAdController"

    const-string v8, "Context not null, so just flash toast...."

    invoke-static {v7, v8}, Lcom/pad/android/util/AdLog;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 236
    const-string v7, "display"

    invoke-virtual {v4, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-nez v7, :cond_78

    const-string v7, "confirm"

    invoke-virtual {v4, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-nez v7, :cond_78

    const-string v7, "webconfirm"

    invoke-virtual {v4, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_ad

    .line 239
    :cond_78
    iget-object v7, p0, Lcom/pad/android/util/AdOptinRequest;->context:Landroid/content/Context;

    const/4 v8, 0x0

    invoke-static {v7, v2, v8}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v7

    invoke-virtual {v7}, Landroid/widget/Toast;->show()V

    .line 240
    const-string v7, "SD_APP_OPTIN"

    invoke-interface {v1, v7, v3}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    .line 241
    invoke-interface {v1}, Landroid/content/SharedPreferences$Editor;->commit()Z

    .line 255
    :cond_8a
    :goto_8a
    const-string v7, "SD_APP_OPTIN_SHOWN"

    const-string v8, "1"

    invoke-interface {v1, v7, v8}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    .line 256
    invoke-interface {v1}, Landroid/content/SharedPreferences$Editor;->commit()Z

    .line 257
    iget-object v7, p0, Lcom/pad/android/util/AdOptinRequest;->oListener:Lcom/pad/android/listener/AdOptinListener;

    if-eqz v7, :cond_9d

    .line 259
    iget-object v7, p0, Lcom/pad/android/util/AdOptinRequest;->oListener:Lcom/pad/android/listener/AdOptinListener;

    invoke-interface {v7}, Lcom/pad/android/listener/AdOptinListener;->onAdOptin()V

    .line 332
    :cond_9d
    :goto_9d
    const-string v7, "SD_APP_OPTIN_SHOWN"

    const-string v8, "1"

    invoke-interface {v1, v7, v8}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    .line 333
    invoke-interface {v1}, Landroid/content/SharedPreferences$Editor;->commit()Z

    goto/16 :goto_c

    .line 215
    .end local v1    # "editor":Landroid/content/SharedPreferences$Editor;
    .end local v2    # "optinText":Ljava/lang/String;
    .end local v3    # "optinTime":Ljava/lang/String;
    .end local v4    # "optinType":Ljava/lang/String;
    .end local v5    # "pref":Landroid/content/SharedPreferences;
    .end local v6    # "toUse":Landroid/content/Context;
    :cond_a9
    iget-object v6, p0, Lcom/pad/android/util/AdOptinRequest;->context:Landroid/content/Context;

    goto/16 :goto_21

    .line 243
    .restart local v1    # "editor":Landroid/content/SharedPreferences$Editor;
    .restart local v2    # "optinText":Ljava/lang/String;
    .restart local v3    # "optinTime":Ljava/lang/String;
    .restart local v4    # "optinType":Ljava/lang/String;
    .restart local v5    # "pref":Landroid/content/SharedPreferences;
    .restart local v6    # "toUse":Landroid/content/Context;
    :cond_ad
    const-string v7, "deny"

    invoke-virtual {v4, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_c0

    .line 246
    const-string v7, "SD_APP_OPTIN"

    const-string v8, "0"

    invoke-interface {v1, v7, v8}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    .line 247
    invoke-interface {v1}, Landroid/content/SharedPreferences$Editor;->commit()Z

    goto :goto_8a

    .line 249
    :cond_c0
    const-string v7, "nodisplay"

    invoke-virtual {v4, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_8a

    .line 252
    const-string v7, "SD_APP_OPTIN"

    invoke-interface {v1, v7, v3}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    .line 253
    invoke-interface {v1}, Landroid/content/SharedPreferences$Editor;->commit()Z

    goto :goto_8a

    .line 264
    :cond_d1
    const-string v7, "LBAdController"

    new-instance v8, Ljava/lang/StringBuilder;

    const-string v9, "values received = "

    invoke-direct {v8, v9}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v9, p0, Lcom/pad/android/util/AdOptinRequest;->optinValues:Lorg/json/JSONObject;

    invoke-virtual {v9}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-static {v7, v8}, Lcom/pad/android/util/AdLog;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 265
    iget-object v7, p0, Lcom/pad/android/util/AdOptinRequest;->optinValues:Lorg/json/JSONObject;

    invoke-virtual {v7}, Lorg/json/JSONObject;->length()I

    move-result v7

    if-ne v7, v10, :cond_fe

    .line 268
    iget-object v7, p0, Lcom/pad/android/util/AdOptinRequest;->oListener:Lcom/pad/android/listener/AdOptinListener;

    if-eqz v7, :cond_c

    .line 270
    iget-object v7, p0, Lcom/pad/android/util/AdOptinRequest;->oListener:Lcom/pad/android/listener/AdOptinListener;

    invoke-interface {v7}, Lcom/pad/android/listener/AdOptinListener;->onAdOptin()V

    goto/16 :goto_c

    .line 274
    :cond_fe
    const-string v7, "display"

    invoke-virtual {v4, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_13b

    .line 277
    iget-object v7, p0, Lcom/pad/android/util/AdOptinRequest;->activity:Landroid/app/Activity;

    if-eqz v7, :cond_131

    .line 279
    iget-object v7, p0, Lcom/pad/android/util/AdOptinRequest;->activity:Landroid/app/Activity;

    invoke-virtual {v7}, Landroid/app/Activity;->getApplicationContext()Landroid/content/Context;

    move-result-object v7

    invoke-static {v7, v2, v10}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v7

    invoke-virtual {v7}, Landroid/widget/Toast;->show()V

    .line 286
    :goto_117
    const-string v7, "SD_APP_OPTIN"

    invoke-interface {v1, v7, v3}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    .line 287
    const-string v7, "SD_APP_OPTIN_SHOWN"

    const-string v8, "1"

    invoke-interface {v1, v7, v8}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    .line 288
    invoke-interface {v1}, Landroid/content/SharedPreferences$Editor;->commit()Z

    .line 290
    iget-object v7, p0, Lcom/pad/android/util/AdOptinRequest;->oListener:Lcom/pad/android/listener/AdOptinListener;

    if-eqz v7, :cond_9d

    .line 292
    iget-object v7, p0, Lcom/pad/android/util/AdOptinRequest;->oListener:Lcom/pad/android/listener/AdOptinListener;

    invoke-interface {v7}, Lcom/pad/android/listener/AdOptinListener;->onAdOptin()V

    goto/16 :goto_9d

    .line 283
    :cond_131
    iget-object v7, p0, Lcom/pad/android/util/AdOptinRequest;->context:Landroid/content/Context;

    invoke-static {v7, v2, v10}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v7

    invoke-virtual {v7}, Landroid/widget/Toast;->show()V

    goto :goto_117

    .line 295
    :cond_13b
    const-string v7, "deny"

    invoke-virtual {v4, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_158

    .line 298
    const-string v7, "SD_APP_OPTIN"

    const-string v8, "0"

    invoke-interface {v1, v7, v8}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    .line 299
    invoke-interface {v1}, Landroid/content/SharedPreferences$Editor;->commit()Z

    .line 301
    iget-object v7, p0, Lcom/pad/android/util/AdOptinRequest;->oListener:Lcom/pad/android/listener/AdOptinListener;

    if-eqz v7, :cond_9d

    .line 303
    iget-object v7, p0, Lcom/pad/android/util/AdOptinRequest;->oListener:Lcom/pad/android/listener/AdOptinListener;

    invoke-interface {v7}, Lcom/pad/android/listener/AdOptinListener;->onAdOptin()V

    goto/16 :goto_9d

    .line 306
    :cond_158
    const-string v7, "nodisplay"

    invoke-virtual {v4, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_173

    .line 309
    const-string v7, "SD_APP_OPTIN"

    invoke-interface {v1, v7, v3}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    .line 310
    invoke-interface {v1}, Landroid/content/SharedPreferences$Editor;->commit()Z

    .line 312
    iget-object v7, p0, Lcom/pad/android/util/AdOptinRequest;->oListener:Lcom/pad/android/listener/AdOptinListener;

    if-eqz v7, :cond_9d

    .line 314
    iget-object v7, p0, Lcom/pad/android/util/AdOptinRequest;->oListener:Lcom/pad/android/listener/AdOptinListener;

    invoke-interface {v7}, Lcom/pad/android/listener/AdOptinListener;->onAdOptin()V

    goto/16 :goto_9d

    .line 317
    :cond_173
    const-string v7, "webconfirm"

    invoke-virtual {v4, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_9d

    .line 319
    iget-object v7, p0, Lcom/pad/android/util/AdOptinRequest;->optinValues:Lorg/json/JSONObject;

    const-string v8, "weboptinurl"

    invoke-virtual {v7, v8}, Lorg/json/JSONObject;->isNull(Ljava/lang/String;)Z

    move-result v7

    if-nez v7, :cond_9d

    .line 323
    :try_start_185
    new-instance v7, Lcom/pad/android/util/AdOptinView;

    iget-object v8, p0, Lcom/pad/android/util/AdOptinRequest;->activity:Landroid/app/Activity;

    new-instance v9, Ljava/lang/StringBuilder;

    iget-object v10, p0, Lcom/pad/android/util/AdOptinRequest;->optinValues:Lorg/json/JSONObject;

    const-string v11, "weboptinurl"

    invoke-virtual {v10, v11}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v10

    invoke-static {v10}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v10

    invoke-direct {v9, v10}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v10, p0, Lcom/pad/android/util/AdOptinRequest;->sectionid:Ljava/lang/String;

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    iget-object v10, p0, Lcom/pad/android/util/AdOptinRequest;->oListener:Lcom/pad/android/listener/AdOptinListener;

    invoke-direct {v7, v8, v9, v10}, Lcom/pad/android/util/AdOptinView;-><init>(Landroid/app/Activity;Ljava/lang/String;Lcom/pad/android/listener/AdOptinListener;)V
    :try_end_1a9
    .catch Ljava/lang/Exception; {:try_start_185 .. :try_end_1a9} :catch_1ab

    goto/16 :goto_9d

    .line 325
    :catch_1ab
    move-exception v0

    .line 327
    .local v0, "e":Ljava/lang/Exception;
    const-string v7, "LBAdController"

    invoke-static {v7, v0}, Lcom/pad/android/util/AdLog;->printStackTrace(Ljava/lang/String;Ljava/lang/Exception;)V

    goto/16 :goto_9d

    .line 338
    .end local v0    # "e":Ljava/lang/Exception;
    .end local v1    # "editor":Landroid/content/SharedPreferences$Editor;
    .end local v2    # "optinText":Ljava/lang/String;
    .end local v3    # "optinTime":Ljava/lang/String;
    .end local v4    # "optinType":Ljava/lang/String;
    .end local v5    # "pref":Landroid/content/SharedPreferences;
    .end local v6    # "toUse":Landroid/content/Context;
    :cond_1b3
    iget-object v7, p0, Lcom/pad/android/util/AdOptinRequest;->oListener:Lcom/pad/android/listener/AdOptinListener;

    if-eqz v7, :cond_c

    .line 340
    iget-object v7, p0, Lcom/pad/android/util/AdOptinRequest;->oListener:Lcom/pad/android/listener/AdOptinListener;

    invoke-interface {v7}, Lcom/pad/android/listener/AdOptinListener;->onAdOptin()V

    goto/16 :goto_c

    .line 228
    .restart local v1    # "editor":Landroid/content/SharedPreferences$Editor;
    .restart local v2    # "optinText":Ljava/lang/String;
    .restart local v4    # "optinType":Ljava/lang/String;
    .restart local v5    # "pref":Landroid/content/SharedPreferences;
    .restart local v6    # "toUse":Landroid/content/Context;
    :catch_1be
    move-exception v7

    goto/16 :goto_44
.end method
