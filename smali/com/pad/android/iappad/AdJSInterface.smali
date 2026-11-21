###### Class com.pad.android.iappad.AdJSInterface (com.pad.android.iappad.AdJSInterface)
.class public Lcom/pad/android/iappad/AdJSInterface;
.super Ljava/lang/Object;
.source "AdJSInterface.java"


# instance fields
.field private activity:Landroid/content/Context;

.field private controller:Lcom/pad/android/iappad/AdController;

.field private listener:Lcom/pad/android/listener/AdListener;


# direct methods
.method public constructor <init>(Landroid/content/Context;Lcom/pad/android/iappad/AdController;Lcom/pad/android/listener/AdListener;)V
    .registers 4
    .param p1, "act"    # Landroid/content/Context;
    .param p2, "cont"    # Lcom/pad/android/iappad/AdController;
    .param p3, "list"    # Lcom/pad/android/listener/AdListener;

    .prologue
    .line 16
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 18
    iput-object p1, p0, Lcom/pad/android/iappad/AdJSInterface;->activity:Landroid/content/Context;

    .line 19
    iput-object p2, p0, Lcom/pad/android/iappad/AdJSInterface;->controller:Lcom/pad/android/iappad/AdController;

    .line 20
    iput-object p3, p0, Lcom/pad/android/iappad/AdJSInterface;->listener:Lcom/pad/android/listener/AdListener;

    .line 21
    return-void
.end method

.method static synthetic access$0(Lcom/pad/android/iappad/AdJSInterface;)Lcom/pad/android/iappad/AdController;
    .registers 2

    .prologue
    .line 12
    iget-object v0, p0, Lcom/pad/android/iappad/AdJSInterface;->controller:Lcom/pad/android/iappad/AdController;

    return-object v0
.end method

.method private closeAd()V
    .registers 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 87
    iget-object v0, p0, Lcom/pad/android/iappad/AdJSInterface;->activity:Landroid/content/Context;

    check-cast v0, Landroid/app/Activity;

    new-instance v1, Lcom/pad/android/iappad/AdJSInterface$1;

    invoke-direct {v1, p0}, Lcom/pad/android/iappad/AdJSInterface$1;-><init>(Lcom/pad/android/iappad/AdJSInterface;)V

    invoke-virtual {v0, v1}, Landroid/app/Activity;->runOnUiThread(Ljava/lang/Runnable;)V

    .line 93
    return-void
.end method


# virtual methods
.method public close()V
    .registers 2

    .prologue
    .line 69
    :try_start_0
    invoke-direct {p0}, Lcom/pad/android/iappad/AdJSInterface;->closeAd()V
    :try_end_3
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_3} :catch_4

    .line 72
    :goto_3
    return-void

    .line 71
    :catch_4
    move-exception v0

    goto :goto_3
.end method

.method public complete()V
    .registers 3

    .prologue
    .line 78
    :try_start_0
    iget-object v0, p0, Lcom/pad/android/iappad/AdJSInterface;->controller:Lcom/pad/android/iappad/AdController;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Lcom/pad/android/iappad/AdController;->setCompleted(Z)V

    .line 79
    invoke-direct {p0}, Lcom/pad/android/iappad/AdJSInterface;->closeAd()V

    .line 80
    iget-object v0, p0, Lcom/pad/android/iappad/AdJSInterface;->controller:Lcom/pad/android/iappad/AdController;

    invoke-virtual {v0}, Lcom/pad/android/iappad/AdController;->triggerAdCompleted()V
    :try_end_e
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_e} :catch_f

    .line 83
    :goto_e
    return-void

    .line 82
    :catch_f
    move-exception v0

    goto :goto_e
.end method

.method public processHTML(Ljava/lang/String;)V
    .registers 7
    .param p1, "content"    # Ljava/lang/String;

    .prologue
    const/4 v4, 0x1

    .line 25
    const-string v1, "LBAdController"

    new-instance v2, Ljava/lang/StringBuilder;

    const-string v3, "Ad Count = "

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/pad/android/util/AdLog;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 27
    if-eqz p1, :cond_34

    const-string v1, "0"

    invoke-virtual {p1, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_34

    .line 29
    iget-object v1, p0, Lcom/pad/android/iappad/AdJSInterface;->controller:Lcom/pad/android/iappad/AdController;

    invoke-virtual {v1, v4}, Lcom/pad/android/iappad/AdController;->setAdDestroyed(Z)V

    .line 30
    iget-object v1, p0, Lcom/pad/android/iappad/AdJSInterface;->listener:Lcom/pad/android/listener/AdListener;

    if-eqz v1, :cond_34

    .line 35
    :try_start_28
    const-string v1, "LBAdController"

    const-string v2, "onAdFailed triggered"

    invoke-static {v1, v2}, Lcom/pad/android/util/AdLog;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 36
    iget-object v1, p0, Lcom/pad/android/iappad/AdJSInterface;->listener:Lcom/pad/android/listener/AdListener;

    invoke-interface {v1}, Lcom/pad/android/listener/AdListener;->onAdFailed()V
    :try_end_34
    .catch Ljava/lang/Exception; {:try_start_28 .. :try_end_34} :catch_61

    .line 44
    :cond_34
    :goto_34
    iget-object v1, p0, Lcom/pad/android/iappad/AdJSInterface;->listener:Lcom/pad/android/listener/AdListener;

    if-eqz v1, :cond_60

    iget-object v1, p0, Lcom/pad/android/iappad/AdJSInterface;->controller:Lcom/pad/android/iappad/AdController;

    invoke-virtual {v1}, Lcom/pad/android/iappad/AdController;->getAdDestroyed()Z

    move-result v1

    if-nez v1, :cond_60

    .line 49
    :try_start_40
    const-string v1, "LBAdController"

    const-string v2, "onAdLoaded triggered"

    invoke-static {v1, v2}, Lcom/pad/android/util/AdLog;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 50
    iget-object v1, p0, Lcom/pad/android/iappad/AdJSInterface;->controller:Lcom/pad/android/iappad/AdController;

    invoke-virtual {v1}, Lcom/pad/android/iappad/AdController;->getOnAdLoaded()Z

    move-result v1

    if-nez v1, :cond_5a

    .line 52
    iget-object v1, p0, Lcom/pad/android/iappad/AdJSInterface;->listener:Lcom/pad/android/listener/AdListener;

    invoke-interface {v1}, Lcom/pad/android/listener/AdListener;->onAdLoaded()V

    .line 53
    iget-object v1, p0, Lcom/pad/android/iappad/AdJSInterface;->controller:Lcom/pad/android/iappad/AdController;

    const/4 v2, 0x1

    invoke-virtual {v1, v2}, Lcom/pad/android/iappad/AdController;->setOnAdLoaded(Z)V

    .line 55
    :cond_5a
    iget-object v1, p0, Lcom/pad/android/iappad/AdJSInterface;->controller:Lcom/pad/android/iappad/AdController;

    const/4 v2, 0x1

    invoke-virtual {v1, v2}, Lcom/pad/android/iappad/AdController;->setAdLoaded(Z)V
    :try_end_60
    .catch Ljava/lang/Exception; {:try_start_40 .. :try_end_60} :catch_6a

    .line 63
    :cond_60
    :goto_60
    return-void

    .line 38
    :catch_61
    move-exception v0

    .line 40
    .local v0, "e":Ljava/lang/Exception;
    const-string v1, "LBAdController"

    const-string v2, "Error while calling onAdFailed"

    invoke-static {v1, v2}, Lcom/pad/android/util/AdLog;->i(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_34

    .line 57
    .end local v0    # "e":Ljava/lang/Exception;
    :catch_6a
    move-exception v0

    .line 59
    .restart local v0    # "e":Ljava/lang/Exception;
    const-string v1, "LBAdController"

    const-string v2, "Error while calling onAdLoaded"

    invoke-static {v1, v2}, Lcom/pad/android/util/AdLog;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 60
    const-string v1, "LBAdController"

    invoke-static {v1, v0}, Lcom/pad/android/util/AdLog;->printStackTrace(Ljava/lang/String;Ljava/lang/Exception;)V

    goto :goto_60
.end method

###### Class com.pad.android.iappad.AdJSInterface.AnonymousClass1 (com.pad.android.iappad.AdJSInterface$1)
.class Lcom/pad/android/iappad/AdJSInterface$1;
.super Ljava/lang/Object;
.source "AdJSInterface.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/pad/android/iappad/AdJSInterface;->closeAd()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/pad/android/iappad/AdJSInterface;


# direct methods
.method constructor <init>(Lcom/pad/android/iappad/AdJSInterface;)V
    .registers 2

    .prologue
    .line 1
    iput-object p1, p0, Lcom/pad/android/iappad/AdJSInterface$1;->this$0:Lcom/pad/android/iappad/AdJSInterface;

    .line 87
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .registers 2

    .prologue
    .line 90
    iget-object v0, p0, Lcom/pad/android/iappad/AdJSInterface$1;->this$0:Lcom/pad/android/iappad/AdJSInterface;

    invoke-static {v0}, Lcom/pad/android/iappad/AdJSInterface;->access$0(Lcom/pad/android/iappad/AdJSInterface;)Lcom/pad/android/iappad/AdController;

    move-result-object v0

    invoke-virtual {v0}, Lcom/pad/android/iappad/AdController;->destroyAd()V

    .line 91
    return-void
.end method
