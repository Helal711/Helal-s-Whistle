###### Class com.pad.android.iappad.AdTask (com.pad.android.iappad.AdTask)
.class public Lcom/pad/android/iappad/AdTask;
.super Landroid/os/AsyncTask;
.source "AdTask.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Landroid/os/AsyncTask",
        "<",
        "Ljava/lang/String;",
        "Ljava/lang/Void;",
        "Ljava/lang/String;",
        ">;"
    }
.end annotation


# instance fields
.field private activity:Landroid/app/Activity;

.field private adCon:Lcom/pad/android/iappad/AdController;

.field private results:Lorg/json/JSONObject;

.field private sectionid:Ljava/lang/String;

.field private subid:Ljava/lang/String;

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


# direct methods
.method public constructor <init>(Lcom/pad/android/iappad/AdController;Landroid/app/Activity;Ljava/lang/String;)V
    .registers 5
    .param p1, "aCon"    # Lcom/pad/android/iappad/AdController;
    .param p2, "act"    # Landroid/app/Activity;
    .param p3, "sid"    # Ljava/lang/String;

    .prologue
    .line 27
    invoke-direct {p0}, Landroid/os/AsyncTask;-><init>()V

    .line 25
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/pad/android/iappad/AdTask;->useLocation:Z

    .line 29
    iput-object p1, p0, Lcom/pad/android/iappad/AdTask;->adCon:Lcom/pad/android/iappad/AdController;

    .line 30
    iput-object p2, p0, Lcom/pad/android/iappad/AdTask;->activity:Landroid/app/Activity;

    .line 31
    iput-object p3, p0, Lcom/pad/android/iappad/AdTask;->sectionid:Ljava/lang/String;

    .line 32
    return-void
.end method


# virtual methods
.method protected bridge varargs synthetic doInBackground([Ljava/lang/Object;)Ljava/lang/Object;
    .registers 3

    .prologue
    .line 1
    check-cast p1, [Ljava/lang/String;

    invoke-virtual {p0, p1}, Lcom/pad/android/iappad/AdTask;->doInBackground([Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method protected varargs doInBackground([Ljava/lang/String;)Ljava/lang/String;
    .registers 7
    .param p1, "arg0"    # [Ljava/lang/String;

    .prologue
    .line 62
    iget-object v3, p0, Lcom/pad/android/iappad/AdTask;->activity:Landroid/app/Activity;

    const-string v4, "connectivity"

    invoke-virtual {v3, v4}, Landroid/app/Activity;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/net/ConnectivityManager;

    .line 63
    .local v0, "cm":Landroid/net/ConnectivityManager;
    invoke-virtual {v0}, Landroid/net/ConnectivityManager;->getActiveNetworkInfo()Landroid/net/NetworkInfo;

    move-result-object v1

    .line 64
    .local v1, "netInfo":Landroid/net/NetworkInfo;
    if-eqz v1, :cond_2e

    .line 66
    new-instance v2, Lcom/pad/android/util/AdRequest;

    iget-object v3, p0, Lcom/pad/android/iappad/AdTask;->activity:Landroid/app/Activity;

    iget-object v4, p0, Lcom/pad/android/iappad/AdTask;->sectionid:Ljava/lang/String;

    invoke-direct {v2, v3, v4}, Lcom/pad/android/util/AdRequest;-><init>(Landroid/app/Activity;Ljava/lang/String;)V

    .line 67
    .local v2, "req":Lcom/pad/android/util/AdRequest;
    iget-object v3, p0, Lcom/pad/android/iappad/AdTask;->subid:Ljava/lang/String;

    invoke-virtual {v2, v3}, Lcom/pad/android/util/AdRequest;->setSubId(Ljava/lang/String;)V

    .line 68
    iget-object v3, p0, Lcom/pad/android/iappad/AdTask;->tokens:Ljava/util/List;

    invoke-virtual {v2, v3}, Lcom/pad/android/util/AdRequest;->setTokens(Ljava/util/List;)V

    .line 69
    iget-boolean v3, p0, Lcom/pad/android/iappad/AdTask;->useLocation:Z

    invoke-virtual {v2, v3}, Lcom/pad/android/util/AdRequest;->setUseLocation(Z)V

    .line 70
    invoke-virtual {v2}, Lcom/pad/android/util/AdRequest;->makeLBRequest()Lorg/json/JSONObject;

    move-result-object v3

    iput-object v3, p0, Lcom/pad/android/iappad/AdTask;->results:Lorg/json/JSONObject;

    .line 72
    .end local v2    # "req":Lcom/pad/android/util/AdRequest;
    :cond_2e
    const/4 v3, 0x0

    return-object v3
.end method

.method protected onCancelled()V
    .registers 1

    .prologue
    .line 56
    invoke-super {p0}, Landroid/os/AsyncTask;->onCancelled()V

    .line 57
    return-void
.end method

.method protected bridge synthetic onPostExecute(Ljava/lang/Object;)V
    .registers 2

    .prologue
    .line 1
    check-cast p1, Ljava/lang/String;

    invoke-virtual {p0, p1}, Lcom/pad/android/iappad/AdTask;->onPostExecute(Ljava/lang/String;)V

    return-void
.end method

.method protected onPostExecute(Ljava/lang/String;)V
    .registers 4
    .param p1, "res"    # Ljava/lang/String;

    .prologue
    .line 77
    iget-object v0, p0, Lcom/pad/android/iappad/AdTask;->adCon:Lcom/pad/android/iappad/AdController;

    if-eqz v0, :cond_15

    iget-object v0, p0, Lcom/pad/android/iappad/AdTask;->results:Lorg/json/JSONObject;

    if-eqz v0, :cond_15

    .line 79
    iget-object v0, p0, Lcom/pad/android/iappad/AdTask;->adCon:Lcom/pad/android/iappad/AdController;

    iget-object v1, p0, Lcom/pad/android/iappad/AdTask;->results:Lorg/json/JSONObject;

    invoke-virtual {v0, v1}, Lcom/pad/android/iappad/AdController;->setResults(Lorg/json/JSONObject;)V

    .line 80
    iget-object v0, p0, Lcom/pad/android/iappad/AdTask;->adCon:Lcom/pad/android/iappad/AdController;

    invoke-virtual {v0}, Lcom/pad/android/iappad/AdController;->initialized()V

    .line 88
    :cond_14
    :goto_14
    return-void

    .line 82
    :cond_15
    iget-object v0, p0, Lcom/pad/android/iappad/AdTask;->adCon:Lcom/pad/android/iappad/AdController;

    if-eqz v0, :cond_14

    .line 85
    iget-object v0, p0, Lcom/pad/android/iappad/AdTask;->adCon:Lcom/pad/android/iappad/AdController;

    invoke-virtual {v0}, Lcom/pad/android/iappad/AdController;->triggerAdFailed()V

    .line 86
    const-string v0, "LBAdController"

    const-string v1, "Failed to get results from server"

    invoke-static {v0, v1}, Lcom/pad/android/util/AdLog;->e(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_14
.end method

.method protected onPreExecute()V
    .registers 1

    .prologue
    .line 51
    invoke-super {p0}, Landroid/os/AsyncTask;->onPreExecute()V

    .line 52
    return-void
.end method

.method public setSubId(Ljava/lang/String;)V
    .registers 2
    .param p1, "sid"    # Ljava/lang/String;

    .prologue
    .line 36
    iput-object p1, p0, Lcom/pad/android/iappad/AdTask;->subid:Ljava/lang/String;

    .line 37
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
    .line 41
    .local p1, "tks":Ljava/util/List;, "Ljava/util/List<Lorg/apache/http/NameValuePair;>;"
    iput-object p1, p0, Lcom/pad/android/iappad/AdTask;->tokens:Ljava/util/List;

    .line 42
    return-void
.end method

.method public setUseLocation(Z)V
    .registers 2
    .param p1, "uL"    # Z

    .prologue
    .line 46
    iput-boolean p1, p0, Lcom/pad/android/iappad/AdTask;->useLocation:Z

    .line 47
    return-void
.end method
