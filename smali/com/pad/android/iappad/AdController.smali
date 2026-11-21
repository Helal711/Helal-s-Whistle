###### Class com.pad.android.iappad.AdController (com.pad.android.iappad.AdController)
.class public Lcom/pad/android/iappad/AdController;
.super Ljava/lang/Object;
.source "AdController.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/pad/android/iappad/AdController$OfferPolling;,
        Lcom/pad/android/iappad/AdController$PollRequest;,
        Lcom/pad/android/iappad/AdController$Polling;
    }
.end annotation


# static fields
.field public static final LB_LOG:Ljava/lang/String; = "LBAdController"

.field public static final SDK_LEVEL:Ljava/lang/String; = "06b"

.field public static final SDK_VERSION:Ljava/lang/String; = "3"


# instance fields
.field private final LB_MAX_POLL:I

.field private final LB_SET_MANUAL_AFTER:I

.field private activity:Landroid/app/Activity;

.field private adDestroyed:Z

.field private adDisplayInterval:Ljava/lang/String;

.field private adLoaded:Z

.field private adPolling:Lcom/pad/android/iappad/AdController$OfferPolling;

.field private additionalDockingMargin:I

.field private backBtn:Landroid/widget/Button;

.field private closeBtn:Landroid/widget/Button;

.field private completed:Z

.field private context:Landroid/content/Context;

.field private footer:Landroid/view/View;

.field private footerTitle:Landroid/widget/TextView;

.field private fwdBtn:Landroid/widget/Button;

.field private homeBtn:Landroid/widget/Button;

.field private homeLoaded:Z

.field private initialized:Z

.field private layout:Landroid/widget/RelativeLayout;

.field private linkClicked:Z

.field private listener:Lcom/pad/android/listener/AdListener;

.field private loadAd:Z

.field private loadProgress:Ljava/lang/Runnable;

.field private loadUrl:Ljava/lang/String;

.field private loading:Z

.field private loadingDialog:Landroid/app/ProgressDialog;

.field private lpC:Landroid/widget/RelativeLayout$LayoutParams;

.field private mainView:Landroid/webkit/WebView;

.field private mainViewParent:Landroid/view/ViewGroup;

.field private mask:Landroid/view/View;

.field private mlpC:Landroid/view/ViewGroup$MarginLayoutParams;

.field private nativeOpen:Z

.field private onAdLoaded:Z

.field private pollBtn:Landroid/widget/Button;

.field private pollCount:I

.field private pollManual:I

.field private pollMax:I

.field private pollingHandler:Landroid/os/Handler;

.field private pollingInitialized:Z

.field private progressHandler:Landroid/os/Handler;

.field private progressInterval:I

.field private refreshBtn:Landroid/widget/Button;

.field private results:Lorg/json/JSONObject;

.field private sHeight:I

.field private sWidth:I

.field private sectionid:Ljava/lang/String;

.field private subid:Ljava/lang/String;

.field private title:Landroid/widget/TextView;

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

.field private toolbar:Landroid/view/View;

.field private useLocation:Z

.field private webview:Lcom/pad/android/iappad/AdWebView;


# direct methods
.method public constructor <init>(Landroid/app/Activity;Ljava/lang/String;)V
    .registers 4
    .param p1, "act"    # Landroid/app/Activity;
    .param p2, "sid"    # Ljava/lang/String;

    .prologue
    .line 135
    new-instance v0, Landroid/widget/RelativeLayout;

    invoke-direct {v0, p1}, Landroid/widget/RelativeLayout;-><init>(Landroid/content/Context;)V

    invoke-direct {p0, p1, p2, v0}, Lcom/pad/android/iappad/AdController;-><init>(Landroid/app/Activity;Ljava/lang/String;Landroid/widget/RelativeLayout;)V

    .line 136
    return-void
.end method

.method public constructor <init>(Landroid/app/Activity;Ljava/lang/String;Landroid/webkit/WebView;)V
    .registers 6
    .param p1, "act"    # Landroid/app/Activity;
    .param p2, "sid"    # Ljava/lang/String;
    .param p3, "w"    # Landroid/webkit/WebView;

    .prologue
    const/4 v1, 0x0

    .line 147
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 61
    const/16 v0, 0x1f4

    iput v0, p0, Lcom/pad/android/iappad/AdController;->LB_MAX_POLL:I

    .line 62
    const/16 v0, 0xa

    iput v0, p0, Lcom/pad/android/iappad/AdController;->LB_SET_MANUAL_AFTER:I

    .line 74
    iput-boolean v1, p0, Lcom/pad/android/iappad/AdController;->completed:Z

    .line 75
    iput-boolean v1, p0, Lcom/pad/android/iappad/AdController;->homeLoaded:Z

    .line 76
    iput-boolean v1, p0, Lcom/pad/android/iappad/AdController;->linkClicked:Z

    .line 79
    iput-boolean v1, p0, Lcom/pad/android/iappad/AdController;->pollingInitialized:Z

    .line 80
    iput-boolean v1, p0, Lcom/pad/android/iappad/AdController;->useLocation:Z

    .line 81
    iput-boolean v1, p0, Lcom/pad/android/iappad/AdController;->nativeOpen:Z

    .line 85
    iput-boolean v1, p0, Lcom/pad/android/iappad/AdController;->initialized:Z

    .line 103
    iput v1, p0, Lcom/pad/android/iappad/AdController;->additionalDockingMargin:I

    .line 110
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/pad/android/iappad/AdController;->loadAd:Z

    .line 111
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/pad/android/iappad/AdController;->listener:Lcom/pad/android/listener/AdListener;

    .line 115
    iput v1, p0, Lcom/pad/android/iappad/AdController;->progressInterval:I

    .line 118
    iput-boolean v1, p0, Lcom/pad/android/iappad/AdController;->adLoaded:Z

    .line 119
    iput-boolean v1, p0, Lcom/pad/android/iappad/AdController;->adDestroyed:Z

    .line 120
    iput v1, p0, Lcom/pad/android/iappad/AdController;->pollCount:I

    .line 121
    iput v1, p0, Lcom/pad/android/iappad/AdController;->pollMax:I

    .line 122
    iput v1, p0, Lcom/pad/android/iappad/AdController;->pollManual:I

    .line 123
    iput-boolean v1, p0, Lcom/pad/android/iappad/AdController;->onAdLoaded:Z

    .line 149
    iput-object p1, p0, Lcom/pad/android/iappad/AdController;->activity:Landroid/app/Activity;

    .line 150
    iput-object p2, p0, Lcom/pad/android/iappad/AdController;->sectionid:Ljava/lang/String;

    .line 151
    iput-object p3, p0, Lcom/pad/android/iappad/AdController;->mainView:Landroid/webkit/WebView;

    .line 152
    new-instance v0, Landroid/widget/RelativeLayout;

    iget-object v1, p0, Lcom/pad/android/iappad/AdController;->activity:Landroid/app/Activity;

    invoke-direct {v0, v1}, Landroid/widget/RelativeLayout;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Lcom/pad/android/iappad/AdController;->layout:Landroid/widget/RelativeLayout;

    .line 153
    return-void
.end method

.method public constructor <init>(Landroid/app/Activity;Ljava/lang/String;Landroid/widget/RelativeLayout;)V
    .registers 7
    .param p1, "act"    # Landroid/app/Activity;
    .param p2, "sid"    # Ljava/lang/String;
    .param p3, "ly"    # Landroid/widget/RelativeLayout;

    .prologue
    const/4 v2, 0x0

    const/4 v1, 0x0

    .line 179
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 61
    const/16 v0, 0x1f4

    iput v0, p0, Lcom/pad/android/iappad/AdController;->LB_MAX_POLL:I

    .line 62
    const/16 v0, 0xa

    iput v0, p0, Lcom/pad/android/iappad/AdController;->LB_SET_MANUAL_AFTER:I

    .line 74
    iput-boolean v1, p0, Lcom/pad/android/iappad/AdController;->completed:Z

    .line 75
    iput-boolean v1, p0, Lcom/pad/android/iappad/AdController;->homeLoaded:Z

    .line 76
    iput-boolean v1, p0, Lcom/pad/android/iappad/AdController;->linkClicked:Z

    .line 79
    iput-boolean v1, p0, Lcom/pad/android/iappad/AdController;->pollingInitialized:Z

    .line 80
    iput-boolean v1, p0, Lcom/pad/android/iappad/AdController;->useLocation:Z

    .line 81
    iput-boolean v1, p0, Lcom/pad/android/iappad/AdController;->nativeOpen:Z

    .line 85
    iput-boolean v1, p0, Lcom/pad/android/iappad/AdController;->initialized:Z

    .line 103
    iput v1, p0, Lcom/pad/android/iappad/AdController;->additionalDockingMargin:I

    .line 110
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/pad/android/iappad/AdController;->loadAd:Z

    .line 111
    iput-object v2, p0, Lcom/pad/android/iappad/AdController;->listener:Lcom/pad/android/listener/AdListener;

    .line 115
    iput v1, p0, Lcom/pad/android/iappad/AdController;->progressInterval:I

    .line 118
    iput-boolean v1, p0, Lcom/pad/android/iappad/AdController;->adLoaded:Z

    .line 119
    iput-boolean v1, p0, Lcom/pad/android/iappad/AdController;->adDestroyed:Z

    .line 120
    iput v1, p0, Lcom/pad/android/iappad/AdController;->pollCount:I

    .line 121
    iput v1, p0, Lcom/pad/android/iappad/AdController;->pollMax:I

    .line 122
    iput v1, p0, Lcom/pad/android/iappad/AdController;->pollManual:I

    .line 123
    iput-boolean v1, p0, Lcom/pad/android/iappad/AdController;->onAdLoaded:Z

    .line 181
    iput-object p1, p0, Lcom/pad/android/iappad/AdController;->activity:Landroid/app/Activity;

    .line 182
    iput-object p2, p0, Lcom/pad/android/iappad/AdController;->sectionid:Ljava/lang/String;

    .line 183
    if-nez p3, :cond_3b

    .line 185
    new-instance p3, Landroid/widget/RelativeLayout;

    .end local p3    # "ly":Landroid/widget/RelativeLayout;
    invoke-direct {p3, p1}, Landroid/widget/RelativeLayout;-><init>(Landroid/content/Context;)V

    .line 187
    .restart local p3    # "ly":Landroid/widget/RelativeLayout;
    :cond_3b
    iput-object p3, p0, Lcom/pad/android/iappad/AdController;->layout:Landroid/widget/RelativeLayout;

    .line 188
    iput-object v2, p0, Lcom/pad/android/iappad/AdController;->mainView:Landroid/webkit/WebView;

    .line 189
    return-void
.end method

.method public constructor <init>(Landroid/app/Activity;Ljava/lang/String;Lcom/pad/android/listener/AdListener;)V
    .registers 5
    .param p1, "act"    # Landroid/app/Activity;
    .param p2, "sid"    # Ljava/lang/String;
    .param p3, "lt"    # Lcom/pad/android/listener/AdListener;

    .prologue
    .line 166
    new-instance v0, Landroid/widget/RelativeLayout;

    invoke-direct {v0, p1}, Landroid/widget/RelativeLayout;-><init>(Landroid/content/Context;)V

    invoke-direct {p0, p1, p2, v0}, Lcom/pad/android/iappad/AdController;-><init>(Landroid/app/Activity;Ljava/lang/String;Landroid/widget/RelativeLayout;)V

    .line 167
    iput-object p3, p0, Lcom/pad/android/iappad/AdController;->listener:Lcom/pad/android/listener/AdListener;

    .line 168
    return-void
.end method

.method static synthetic access$0(Lcom/pad/android/iappad/AdController;)Ljava/lang/String;
    .registers 2

    .prologue
    .line 91
    iget-object v0, p0, Lcom/pad/android/iappad/AdController;->sectionid:Ljava/lang/String;

    return-object v0
.end method

.method static synthetic access$1(Lcom/pad/android/iappad/AdController;)Lorg/json/JSONObject;
    .registers 2

    .prologue
    .line 73
    iget-object v0, p0, Lcom/pad/android/iappad/AdController;->results:Lorg/json/JSONObject;

    return-object v0
.end method

.method static synthetic access$10(Lcom/pad/android/iappad/AdController;)Lcom/pad/android/iappad/AdController$OfferPolling;
    .registers 2

    .prologue
    .line 77
    iget-object v0, p0, Lcom/pad/android/iappad/AdController;->adPolling:Lcom/pad/android/iappad/AdController$OfferPolling;

    return-object v0
.end method

.method static synthetic access$11(Lcom/pad/android/iappad/AdController;)V
    .registers 1

    .prologue
    .line 1392
    invoke-direct {p0}, Lcom/pad/android/iappad/AdController;->showManualPoll()V

    return-void
.end method

.method static synthetic access$12(Lcom/pad/android/iappad/AdController;Z)V
    .registers 2

    .prologue
    .line 74
    iput-boolean p1, p0, Lcom/pad/android/iappad/AdController;->completed:Z

    return-void
.end method

.method static synthetic access$13(Lcom/pad/android/iappad/AdController;)V
    .registers 1

    .prologue
    .line 1488
    invoke-direct {p0}, Lcom/pad/android/iappad/AdController;->closeUnlocker()V

    return-void
.end method

.method static synthetic access$14(Lcom/pad/android/iappad/AdController;)Z
    .registers 2

    .prologue
    .line 118
    iget-boolean v0, p0, Lcom/pad/android/iappad/AdController;->adLoaded:Z

    return v0
.end method

.method static synthetic access$15(Lcom/pad/android/iappad/AdController;)Z
    .registers 2

    .prologue
    .line 119
    iget-boolean v0, p0, Lcom/pad/android/iappad/AdController;->adDestroyed:Z

    return v0
.end method

.method static synthetic access$16(Lcom/pad/android/iappad/AdController;)Landroid/os/Handler;
    .registers 2

    .prologue
    .line 116
    iget-object v0, p0, Lcom/pad/android/iappad/AdController;->progressHandler:Landroid/os/Handler;

    return-object v0
.end method

.method static synthetic access$17(Lcom/pad/android/iappad/AdController;)Ljava/lang/Runnable;
    .registers 2

    .prologue
    .line 117
    iget-object v0, p0, Lcom/pad/android/iappad/AdController;->loadProgress:Ljava/lang/Runnable;

    return-object v0
.end method

.method static synthetic access$18(Lcom/pad/android/iappad/AdController;)I
    .registers 2

    .prologue
    .line 115
    iget v0, p0, Lcom/pad/android/iappad/AdController;->progressInterval:I

    return v0
.end method

.method static synthetic access$19(Lcom/pad/android/iappad/AdController;)V
    .registers 1

    .prologue
    .line 1562
    invoke-direct {p0}, Lcom/pad/android/iappad/AdController;->goForward()V

    return-void
.end method

.method static synthetic access$2(Lcom/pad/android/iappad/AdController;)V
    .registers 1

    .prologue
    .line 700
    invoke-direct {p0}, Lcom/pad/android/iappad/AdController;->displayAd()V

    return-void
.end method

.method static synthetic access$20(Lcom/pad/android/iappad/AdController;)V
    .registers 1

    .prologue
    .line 1554
    invoke-direct {p0}, Lcom/pad/android/iappad/AdController;->goBack()V

    return-void
.end method

.method static synthetic access$21(Lcom/pad/android/iappad/AdController;)Landroid/app/Activity;
    .registers 2

    .prologue
    .line 65
    iget-object v0, p0, Lcom/pad/android/iappad/AdController;->activity:Landroid/app/Activity;

    return-object v0
.end method

.method static synthetic access$22(Lcom/pad/android/iappad/AdController;Landroid/app/ProgressDialog;)V
    .registers 2

    .prologue
    .line 82
    iput-object p1, p0, Lcom/pad/android/iappad/AdController;->loadingDialog:Landroid/app/ProgressDialog;

    return-void
.end method

.method static synthetic access$23(Lcom/pad/android/iappad/AdController;Lcom/pad/android/iappad/AdController$OfferPolling;)V
    .registers 2

    .prologue
    .line 77
    iput-object p1, p0, Lcom/pad/android/iappad/AdController;->adPolling:Lcom/pad/android/iappad/AdController$OfferPolling;

    return-void
.end method

.method static synthetic access$24(Lcom/pad/android/iappad/AdController;Landroid/os/Handler;)V
    .registers 2

    .prologue
    .line 78
    iput-object p1, p0, Lcom/pad/android/iappad/AdController;->pollingHandler:Landroid/os/Handler;

    return-void
.end method

.method static synthetic access$3(Lcom/pad/android/iappad/AdController;)Lcom/pad/android/listener/AdListener;
    .registers 2

    .prologue
    .line 111
    iget-object v0, p0, Lcom/pad/android/iappad/AdController;->listener:Lcom/pad/android/listener/AdListener;

    return-object v0
.end method

.method static synthetic access$4(Lcom/pad/android/iappad/AdController;)Landroid/app/ProgressDialog;
    .registers 2

    .prologue
    .line 82
    iget-object v0, p0, Lcom/pad/android/iappad/AdController;->loadingDialog:Landroid/app/ProgressDialog;

    return-object v0
.end method

.method static synthetic access$5(Lcom/pad/android/iappad/AdController;)I
    .registers 2

    .prologue
    .line 120
    iget v0, p0, Lcom/pad/android/iappad/AdController;->pollCount:I

    return v0
.end method

.method static synthetic access$6(Lcom/pad/android/iappad/AdController;I)V
    .registers 2

    .prologue
    .line 120
    iput p1, p0, Lcom/pad/android/iappad/AdController;->pollCount:I

    return-void
.end method

.method static synthetic access$7(Lcom/pad/android/iappad/AdController;)I
    .registers 2

    .prologue
    .line 121
    iget v0, p0, Lcom/pad/android/iappad/AdController;->pollMax:I

    return v0
.end method

.method static synthetic access$8(Lcom/pad/android/iappad/AdController;)I
    .registers 2

    .prologue
    .line 122
    iget v0, p0, Lcom/pad/android/iappad/AdController;->pollManual:I

    return v0
.end method

.method static synthetic access$9(Lcom/pad/android/iappad/AdController;)Landroid/os/Handler;
    .registers 2

    .prologue
    .line 78
    iget-object v0, p0, Lcom/pad/android/iappad/AdController;->pollingHandler:Landroid/os/Handler;

    return-object v0
.end method

.method private closeUnlocker()V
    .registers 5

    .prologue
    const/4 v3, 0x0

    .line 1490
    invoke-direct {p0}, Lcom/pad/android/iappad/AdController;->getAdVisibility()I

    move-result v1

    if-eqz v1, :cond_8

    .line 1552
    :cond_7
    :goto_7
    return-void

    .line 1495
    :cond_8
    iget-object v1, p0, Lcom/pad/android/iappad/AdController;->listener:Lcom/pad/android/listener/AdListener;

    if-eqz v1, :cond_1c

    iget-boolean v1, p0, Lcom/pad/android/iappad/AdController;->completed:Z

    if-nez v1, :cond_1c

    .line 1499
    :try_start_10
    const-string v1, "LBAdController"

    const-string v2, "onAdClosed triggered"

    invoke-static {v1, v2}, Lcom/pad/android/util/AdLog;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 1500
    iget-object v1, p0, Lcom/pad/android/iappad/AdController;->listener:Lcom/pad/android/listener/AdListener;

    invoke-interface {v1}, Lcom/pad/android/listener/AdListener;->onAdClosed()V
    :try_end_1c
    .catch Ljava/lang/Exception; {:try_start_10 .. :try_end_1c} :catch_74

    .line 1509
    :cond_1c
    :goto_1c
    const/4 v1, 0x1

    iput-boolean v1, p0, Lcom/pad/android/iappad/AdController;->adDestroyed:Z

    .line 1510
    const-string v1, "LBAdController"

    const-string v2, "closeUnlocker called"

    invoke-static {v1, v2}, Lcom/pad/android/util/AdLog;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 1511
    iput-boolean v3, p0, Lcom/pad/android/iappad/AdController;->homeLoaded:Z

    .line 1512
    iput-boolean v3, p0, Lcom/pad/android/iappad/AdController;->linkClicked:Z

    .line 1513
    iput-boolean v3, p0, Lcom/pad/android/iappad/AdController;->pollingInitialized:Z

    .line 1514
    iget-object v1, p0, Lcom/pad/android/iappad/AdController;->pollingHandler:Landroid/os/Handler;

    if-eqz v1, :cond_37

    .line 1516
    iget-object v1, p0, Lcom/pad/android/iappad/AdController;->pollingHandler:Landroid/os/Handler;

    iget-object v2, p0, Lcom/pad/android/iappad/AdController;->adPolling:Lcom/pad/android/iappad/AdController$OfferPolling;

    invoke-virtual {v1, v2}, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V

    .line 1520
    :cond_37
    :try_start_37
    const-string v1, "android.webkit.WebView"

    invoke-static {v1}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v1

    const-string v2, "onPause"

    const/4 v3, 0x0

    invoke-virtual {v1, v2, v3}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v1

    iget-object v2, p0, Lcom/pad/android/iappad/AdController;->webview:Lcom/pad/android/iappad/AdWebView;

    const/4 v3, 0x0

    invoke-virtual {v1, v2, v3}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_4a
    .catch Ljava/lang/Exception; {:try_start_37 .. :try_end_4a} :catch_82

    .line 1526
    :goto_4a
    :try_start_4a
    iget-object v1, p0, Lcom/pad/android/iappad/AdController;->layout:Landroid/widget/RelativeLayout;

    invoke-virtual {v1}, Landroid/widget/RelativeLayout;->removeAllViews()V

    .line 1542
    iget-object v1, p0, Lcom/pad/android/iappad/AdController;->mainView:Landroid/webkit/WebView;

    if-eqz v1, :cond_7

    .line 1544
    iget-object v1, p0, Lcom/pad/android/iappad/AdController;->mainView:Landroid/webkit/WebView;

    const/4 v2, 0x0

    invoke-virtual {v1, v2}, Landroid/webkit/WebView;->setOnTouchListener(Landroid/view/View$OnTouchListener;)V
    :try_end_59
    .catch Ljava/lang/Exception; {:try_start_4a .. :try_end_59} :catch_5a

    goto :goto_7

    .line 1547
    :catch_5a
    move-exception v0

    .line 1550
    .local v0, "e":Ljava/lang/Exception;
    const-string v1, "LBAdController"

    new-instance v2, Ljava/lang/StringBuilder;

    const-string v3, "CloseUnlocker error - "

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/pad/android/util/AdLog;->e(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_7

    .line 1502
    .end local v0    # "e":Ljava/lang/Exception;
    :catch_74
    move-exception v0

    .line 1504
    .restart local v0    # "e":Ljava/lang/Exception;
    const-string v1, "LBAdController"

    const-string v2, "error when onAdClosed triggered"

    invoke-static {v1, v2}, Lcom/pad/android/util/AdLog;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 1505
    const-string v1, "LBAdController"

    invoke-static {v1, v0}, Lcom/pad/android/util/AdLog;->printStackTrace(Ljava/lang/String;Ljava/lang/Exception;)V

    goto :goto_1c

    .line 1522
    .end local v0    # "e":Ljava/lang/Exception;
    :catch_82
    move-exception v1

    goto :goto_4a
.end method

.method private displayAd()V
    .registers 51

    .prologue
    .line 702
    const-string v45, "LBAdController"

    const-string v46, "displayAd called"

    invoke-static/range {v45 .. v46}, Lcom/pad/android/util/AdLog;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 703
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/pad/android/iappad/AdController;->results:Lorg/json/JSONObject;

    move-object/from16 v45, v0

    if-nez v45, :cond_17

    .line 705
    const-string v45, "LBAdController"

    const-string v46, "Results are null - no ad will be loaded"

    invoke-static/range {v45 .. v46}, Lcom/pad/android/util/AdLog;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 1047
    :cond_16
    :goto_16
    return-void

    .line 711
    :cond_17
    :try_start_17
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/pad/android/iappad/AdController;->results:Lorg/json/JSONObject;

    move-object/from16 v45, v0

    const-string v46, "useclickwindow"

    invoke-virtual/range {v45 .. v46}, Lorg/json/JSONObject;->isNull(Ljava/lang/String;)Z

    move-result v45

    if-nez v45, :cond_74

    .line 713
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/pad/android/iappad/AdController;->results:Lorg/json/JSONObject;

    move-object/from16 v45, v0

    const-string v46, "useclickwindow"

    invoke-virtual/range {v45 .. v46}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v45

    const-string v46, "1"

    invoke-virtual/range {v45 .. v46}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v45

    if-eqz v45, :cond_74

    .line 715
    const/16 v45, 0x0

    move/from16 v0, v45

    move-object/from16 v1, p0

    iput-boolean v0, v1, Lcom/pad/android/iappad/AdController;->loading:Z

    .line 716
    const/16 v45, 0x0

    move/from16 v0, v45

    move-object/from16 v1, p0

    iput-boolean v0, v1, Lcom/pad/android/iappad/AdController;->linkClicked:Z

    .line 717
    const-string v45, "LBAdController"

    const-string v46, "Going to use click window - cancel out of here..."

    invoke-static/range {v45 .. v46}, Lcom/pad/android/util/AdLog;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 718
    invoke-direct/range {p0 .. p0}, Lcom/pad/android/iappad/AdController;->linkClicked()V
    :try_end_53
    .catch Ljava/lang/Exception; {:try_start_17 .. :try_end_53} :catch_54

    goto :goto_16

    .line 723
    :catch_54
    move-exception v14

    .line 725
    .local v14, "e":Ljava/lang/Exception;
    const-string v45, "LBAdController"

    move-object/from16 v0, v45

    invoke-static {v0, v14}, Lcom/pad/android/util/AdLog;->printStackTrace(Ljava/lang/String;Ljava/lang/Exception;)V

    .line 726
    const-string v45, "LBAdController"

    new-instance v46, Ljava/lang/StringBuilder;

    const-string v47, "Exception when using ClickWindow - "

    invoke-direct/range {v46 .. v47}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v14}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v47

    invoke-virtual/range {v46 .. v47}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v46

    invoke-virtual/range {v46 .. v46}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v46

    invoke-static/range {v45 .. v46}, Lcom/pad/android/util/AdLog;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 729
    .end local v14    # "e":Ljava/lang/Exception;
    :cond_74
    move-object/from16 v0, p0

    iget-boolean v0, v0, Lcom/pad/android/iappad/AdController;->homeLoaded:Z

    move/from16 v45, v0

    if-nez v45, :cond_16

    .line 731
    const-string v45, "LBAdController"

    const-string v46, "Going to load the Ad now..."

    invoke-static/range {v45 .. v46}, Lcom/pad/android/util/AdLog;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 732
    const/16 v45, 0x1

    move/from16 v0, v45

    move-object/from16 v1, p0

    iput-boolean v0, v1, Lcom/pad/android/iappad/AdController;->homeLoaded:Z

    .line 733
    const/16 v45, 0x0

    move/from16 v0, v45

    move-object/from16 v1, p0

    iput-boolean v0, v1, Lcom/pad/android/iappad/AdController;->linkClicked:Z

    .line 736
    const/16 v45, 0x1

    :try_start_95
    move/from16 v0, v45

    move-object/from16 v1, p0

    iput-boolean v0, v1, Lcom/pad/android/iappad/AdController;->loading:Z

    .line 737
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/pad/android/iappad/AdController;->results:Lorg/json/JSONObject;

    move-object/from16 v45, v0

    const-string v46, "show"

    invoke-virtual/range {v45 .. v46}, Lorg/json/JSONObject;->get(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v45

    const-string v46, "1"

    invoke-virtual/range {v45 .. v46}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v45

    if-eqz v45, :cond_951

    .line 739
    move-object/from16 v0, p0

    iget-boolean v0, v0, Lcom/pad/android/iappad/AdController;->completed:Z

    move/from16 v45, v0
    :try_end_b5
    .catch Lorg/json/JSONException; {:try_start_95 .. :try_end_b5} :catch_88f
    .catch Ljava/lang/Exception; {:try_start_95 .. :try_end_b5} :catch_8d3

    if-nez v45, :cond_944

    .line 744
    :try_start_b7
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/pad/android/iappad/AdController;->layout:Landroid/widget/RelativeLayout;

    move-object/from16 v45, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/pad/android/iappad/AdController;->webview:Lcom/pad/android/iappad/AdWebView;

    move-object/from16 v46, v0

    invoke-virtual/range {v45 .. v46}, Landroid/widget/RelativeLayout;->removeView(Landroid/view/View;)V

    .line 745
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/pad/android/iappad/AdController;->layout:Landroid/widget/RelativeLayout;

    move-object/from16 v45, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/pad/android/iappad/AdController;->toolbar:Landroid/view/View;

    move-object/from16 v46, v0

    invoke-virtual/range {v45 .. v46}, Landroid/widget/RelativeLayout;->removeView(Landroid/view/View;)V

    .line 746
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/pad/android/iappad/AdController;->layout:Landroid/widget/RelativeLayout;

    move-object/from16 v45, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/pad/android/iappad/AdController;->title:Landroid/widget/TextView;

    move-object/from16 v46, v0

    invoke-virtual/range {v45 .. v46}, Landroid/widget/RelativeLayout;->removeView(Landroid/view/View;)V

    .line 747
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/pad/android/iappad/AdController;->layout:Landroid/widget/RelativeLayout;

    move-object/from16 v45, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/pad/android/iappad/AdController;->footer:Landroid/view/View;

    move-object/from16 v46, v0

    invoke-virtual/range {v45 .. v46}, Landroid/widget/RelativeLayout;->removeView(Landroid/view/View;)V

    .line 748
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/pad/android/iappad/AdController;->layout:Landroid/widget/RelativeLayout;

    move-object/from16 v45, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/pad/android/iappad/AdController;->footerTitle:Landroid/widget/TextView;

    move-object/from16 v46, v0

    invoke-virtual/range {v45 .. v46}, Landroid/widget/RelativeLayout;->removeView(Landroid/view/View;)V

    .line 749
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/pad/android/iappad/AdController;->layout:Landroid/widget/RelativeLayout;

    move-object/from16 v45, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/pad/android/iappad/AdController;->backBtn:Landroid/widget/Button;

    move-object/from16 v46, v0

    invoke-virtual/range {v45 .. v46}, Landroid/widget/RelativeLayout;->removeView(Landroid/view/View;)V

    .line 750
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/pad/android/iappad/AdController;->layout:Landroid/widget/RelativeLayout;

    move-object/from16 v45, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/pad/android/iappad/AdController;->fwdBtn:Landroid/widget/Button;

    move-object/from16 v46, v0

    invoke-virtual/range {v45 .. v46}, Landroid/widget/RelativeLayout;->removeView(Landroid/view/View;)V

    .line 751
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/pad/android/iappad/AdController;->layout:Landroid/widget/RelativeLayout;

    move-object/from16 v45, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/pad/android/iappad/AdController;->closeBtn:Landroid/widget/Button;

    move-object/from16 v46, v0

    invoke-virtual/range {v45 .. v46}, Landroid/widget/RelativeLayout;->removeView(Landroid/view/View;)V

    .line 752
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/pad/android/iappad/AdController;->layout:Landroid/widget/RelativeLayout;

    move-object/from16 v45, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/pad/android/iappad/AdController;->homeBtn:Landroid/widget/Button;

    move-object/from16 v46, v0

    invoke-virtual/range {v45 .. v46}, Landroid/widget/RelativeLayout;->removeView(Landroid/view/View;)V

    .line 753
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/pad/android/iappad/AdController;->layout:Landroid/widget/RelativeLayout;

    move-object/from16 v45, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/pad/android/iappad/AdController;->refreshBtn:Landroid/widget/Button;

    move-object/from16 v46, v0

    invoke-virtual/range {v45 .. v46}, Landroid/widget/RelativeLayout;->removeView(Landroid/view/View;)V

    .line 754
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/pad/android/iappad/AdController;->layout:Landroid/widget/RelativeLayout;

    move-object/from16 v45, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/pad/android/iappad/AdController;->mask:Landroid/view/View;

    move-object/from16 v46, v0

    invoke-virtual/range {v45 .. v46}, Landroid/widget/RelativeLayout;->removeView(Landroid/view/View;)V

    .line 755
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/pad/android/iappad/AdController;->pollBtn:Landroid/widget/Button;

    move-object/from16 v45, v0

    if-eqz v45, :cond_16d

    .line 757
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/pad/android/iappad/AdController;->layout:Landroid/widget/RelativeLayout;

    move-object/from16 v45, v0

    invoke-virtual/range {v45 .. v45}, Landroid/widget/RelativeLayout;->removeAllViews()V
    :try_end_16d
    .catch Ljava/lang/Exception; {:try_start_b7 .. :try_end_16d} :catch_995
    .catch Lorg/json/JSONException; {:try_start_b7 .. :try_end_16d} :catch_88f

    .line 765
    :cond_16d
    :goto_16d
    :try_start_16d
    new-instance v45, Landroid/view/View;

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/pad/android/iappad/AdController;->activity:Landroid/app/Activity;

    move-object/from16 v46, v0

    invoke-direct/range {v45 .. v46}, Landroid/view/View;-><init>(Landroid/content/Context;)V

    move-object/from16 v0, v45

    move-object/from16 v1, p0

    iput-object v0, v1, Lcom/pad/android/iappad/AdController;->mask:Landroid/view/View;

    .line 766
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/pad/android/iappad/AdController;->mask:Landroid/view/View;

    move-object/from16 v45, v0

    const/16 v46, -0x1

    invoke-virtual/range {v45 .. v46}, Landroid/view/View;->setMinimumHeight(I)V

    .line 767
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/pad/android/iappad/AdController;->mask:Landroid/view/View;

    move-object/from16 v45, v0

    const/16 v46, -0x1

    invoke-virtual/range {v45 .. v46}, Landroid/view/View;->setMinimumWidth(I)V

    .line 771
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/pad/android/iappad/AdController;->mask:Landroid/view/View;

    move-object/from16 v45, v0

    const/high16 v46, -0x1000000

    invoke-virtual/range {v45 .. v46}, Landroid/view/View;->setBackgroundColor(I)V

    .line 772
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/pad/android/iappad/AdController;->results:Lorg/json/JSONObject;

    move-object/from16 v45, v0

    const-string v46, "maskalpha"

    invoke-virtual/range {v45 .. v46}, Lorg/json/JSONObject;->getDouble(Ljava/lang/String;)D

    move-result-wide v45

    const-wide v47, 0x406fe00000000000L    # 255.0

    mul-double v5, v45, v47

    .line 773
    .local v5, "alpha":D
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/pad/android/iappad/AdController;->mask:Landroid/view/View;

    move-object/from16 v45, v0

    invoke-virtual/range {v45 .. v45}, Landroid/view/View;->getBackground()Landroid/graphics/drawable/Drawable;

    move-result-object v45

    double-to-int v0, v5

    move/from16 v46, v0

    invoke-virtual/range {v45 .. v46}, Landroid/graphics/drawable/Drawable;->setAlpha(I)V

    .line 774
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/pad/android/iappad/AdController;->mask:Landroid/view/View;

    move-object/from16 v45, v0

    new-instance v46, Lcom/pad/android/iappad/AdController$2;

    move-object/from16 v0, v46

    move-object/from16 v1, p0

    invoke-direct {v0, v1}, Lcom/pad/android/iappad/AdController$2;-><init>(Lcom/pad/android/iappad/AdController;)V

    invoke-virtual/range {v45 .. v46}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V
    :try_end_1d4
    .catch Ljava/lang/Exception; {:try_start_16d .. :try_end_1d4} :catch_992
    .catch Lorg/json/JSONException; {:try_start_16d .. :try_end_1d4} :catch_88f

    .line 781
    .end local v5    # "alpha":D
    :goto_1d4
    :try_start_1d4
    new-instance v30, Landroid/view/ViewGroup$MarginLayoutParams;

    const/16 v45, -0x1

    const/16 v46, -0x1

    move-object/from16 v0, v30

    move/from16 v1, v45

    move/from16 v2, v46

    invoke-direct {v0, v1, v2}, Landroid/view/ViewGroup$MarginLayoutParams;-><init>(II)V

    .line 782
    .local v30, "mM":Landroid/view/ViewGroup$MarginLayoutParams;
    const/16 v45, 0x0

    const/16 v46, 0x0

    const/16 v47, 0x0

    const/16 v48, 0x0

    move-object/from16 v0, v30

    move/from16 v1, v45

    move/from16 v2, v46

    move/from16 v3, v47

    move/from16 v4, v48

    invoke-virtual {v0, v1, v2, v3, v4}, Landroid/view/ViewGroup$MarginLayoutParams;->setMargins(IIII)V

    .line 783
    new-instance v29, Landroid/widget/RelativeLayout$LayoutParams;

    invoke-direct/range {v29 .. v30}, Landroid/widget/RelativeLayout$LayoutParams;-><init>(Landroid/view/ViewGroup$MarginLayoutParams;)V

    .line 786
    .local v29, "mL":Landroid/widget/RelativeLayout$LayoutParams;
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/pad/android/iappad/AdController;->results:Lorg/json/JSONObject;

    move-object/from16 v45, v0

    const-string v46, "windowy"

    invoke-virtual/range {v45 .. v46}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    move-result v44

    .line 787
    .local v44, "windowYPos":I
    const-string v13, "Middle"
    :try_end_20b
    .catch Lorg/json/JSONException; {:try_start_1d4 .. :try_end_20b} :catch_88f
    .catch Ljava/lang/Exception; {:try_start_1d4 .. :try_end_20b} :catch_8d3

    .line 790
    .local v13, "docking":Ljava/lang/String;
    :try_start_20b
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/pad/android/iappad/AdController;->results:Lorg/json/JSONObject;

    move-object/from16 v45, v0

    const-string v46, "windowdockingy"

    invoke-virtual/range {v45 .. v46}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;
    :try_end_216
    .catch Ljava/lang/Exception; {:try_start_20b .. :try_end_216} :catch_98f
    .catch Lorg/json/JSONException; {:try_start_20b .. :try_end_216} :catch_88f

    move-result-object v13

    .line 793
    :goto_217
    :try_start_217
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/pad/android/iappad/AdController;->results:Lorg/json/JSONObject;

    move-object/from16 v45, v0

    const-string v46, "titlevisible"

    invoke-virtual/range {v45 .. v46}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    move-result v45

    if-nez v45, :cond_27c

    .line 799
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/pad/android/iappad/AdController;->webview:Lcom/pad/android/iappad/AdWebView;

    move-object/from16 v45, v0

    if-eqz v45, :cond_238

    .line 801
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/pad/android/iappad/AdController;->webview:Lcom/pad/android/iappad/AdWebView;

    move-object/from16 v45, v0

    const/16 v46, 0x0

    invoke-virtual/range {v45 .. v46}, Lcom/pad/android/iappad/AdWebView;->setBackgroundColor(I)V

    .line 804
    :cond_238
    move-object/from16 v0, p0

    iget v0, v0, Lcom/pad/android/iappad/AdController;->additionalDockingMargin:I

    move/from16 v45, v0

    if-lez v45, :cond_27c

    const-string v45, "Middle"

    move-object/from16 v0, v45

    invoke-virtual {v13, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v45

    if-nez v45, :cond_27c

    .line 805
    const-string v45, "LBAdController"

    new-instance v46, Ljava/lang/StringBuilder;

    const-string v47, "Additional Docking is set, adjusting banner by "

    invoke-direct/range {v46 .. v47}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    move-object/from16 v0, p0

    iget v0, v0, Lcom/pad/android/iappad/AdController;->additionalDockingMargin:I

    move/from16 v47, v0

    invoke-virtual/range {v46 .. v47}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v46

    const-string v47, "px"

    invoke-virtual/range {v46 .. v47}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v46

    invoke-virtual/range {v46 .. v46}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v46

    invoke-static/range {v45 .. v46}, Lcom/pad/android/util/AdLog;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 807
    const-string v45, "Top"

    move-object/from16 v0, v45

    invoke-virtual {v13, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v45

    if-eqz v45, :cond_8ad

    .line 809
    move-object/from16 v0, p0

    iget v0, v0, Lcom/pad/android/iappad/AdController;->additionalDockingMargin:I

    move/from16 v45, v0

    add-int v44, v44, v45

    .line 823
    :cond_27c
    :goto_27c
    new-instance v43, Landroid/view/ViewGroup$MarginLayoutParams;

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/pad/android/iappad/AdController;->results:Lorg/json/JSONObject;

    move-object/from16 v45, v0

    const-string v46, "windowwidth"

    invoke-virtual/range {v45 .. v46}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    move-result v45

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/pad/android/iappad/AdController;->results:Lorg/json/JSONObject;

    move-object/from16 v46, v0

    const-string v47, "windowheight"

    invoke-virtual/range {v46 .. v47}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    move-result v46

    move-object/from16 v0, v43

    move/from16 v1, v45

    move/from16 v2, v46

    invoke-direct {v0, v1, v2}, Landroid/view/ViewGroup$MarginLayoutParams;-><init>(II)V

    .line 824
    .local v43, "wM":Landroid/view/ViewGroup$MarginLayoutParams;
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/pad/android/iappad/AdController;->results:Lorg/json/JSONObject;

    move-object/from16 v45, v0

    const-string v46, "windowx"

    invoke-virtual/range {v45 .. v46}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    move-result v45

    const/16 v46, 0x0

    const/16 v47, 0x0

    move-object/from16 v0, v43

    move/from16 v1, v45

    move/from16 v2, v44

    move/from16 v3, v46

    move/from16 v4, v47

    invoke-virtual {v0, v1, v2, v3, v4}, Landroid/view/ViewGroup$MarginLayoutParams;->setMargins(IIII)V

    .line 825
    new-instance v42, Landroid/widget/RelativeLayout$LayoutParams;

    invoke-direct/range {v42 .. v43}, Landroid/widget/RelativeLayout$LayoutParams;-><init>(Landroid/view/ViewGroup$MarginLayoutParams;)V

    .line 828
    .local v42, "wL":Landroid/widget/RelativeLayout$LayoutParams;
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/pad/android/iappad/AdController;->results:Lorg/json/JSONObject;

    move-object/from16 v45, v0

    const-string v46, "titlex"

    invoke-virtual/range {v45 .. v46}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    move-result v38

    .line 829
    .local v38, "toolbarx":I
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/pad/android/iappad/AdController;->results:Lorg/json/JSONObject;

    move-object/from16 v45, v0

    const-string v46, "titley"

    invoke-virtual/range {v45 .. v46}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    move-result v39

    .line 830
    .local v39, "toolbary":I
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/pad/android/iappad/AdController;->results:Lorg/json/JSONObject;

    move-object/from16 v45, v0

    const-string v46, "titlewidth"

    invoke-virtual/range {v45 .. v46}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    move-result v37

    .line 831
    .local v37, "toolbarwidth":I
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/pad/android/iappad/AdController;->results:Lorg/json/JSONObject;

    move-object/from16 v45, v0

    const-string v46, "titleheight"

    invoke-virtual/range {v45 .. v46}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    move-result v36

    .line 832
    .local v36, "toolbarheight":I
    new-instance v32, Landroid/view/ViewGroup$MarginLayoutParams;

    move-object/from16 v0, v32

    move/from16 v1, v37

    move/from16 v2, v36

    invoke-direct {v0, v1, v2}, Landroid/view/ViewGroup$MarginLayoutParams;-><init>(II)V

    .line 833
    .local v32, "tM":Landroid/view/ViewGroup$MarginLayoutParams;
    const/16 v45, 0x0

    const/16 v46, 0x0

    move-object/from16 v0, v32

    move/from16 v1, v38

    move/from16 v2, v39

    move/from16 v3, v45

    move/from16 v4, v46

    invoke-virtual {v0, v1, v2, v3, v4}, Landroid/view/ViewGroup$MarginLayoutParams;->setMargins(IIII)V

    .line 834
    new-instance v31, Landroid/widget/RelativeLayout$LayoutParams;

    invoke-direct/range {v31 .. v32}, Landroid/widget/RelativeLayout$LayoutParams;-><init>(Landroid/view/ViewGroup$MarginLayoutParams;)V

    .line 835
    .local v31, "tL":Landroid/widget/RelativeLayout$LayoutParams;
    new-instance v45, Landroid/view/View;

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/pad/android/iappad/AdController;->activity:Landroid/app/Activity;

    move-object/from16 v46, v0

    invoke-direct/range {v45 .. v46}, Landroid/view/View;-><init>(Landroid/content/Context;)V

    move-object/from16 v0, v45

    move-object/from16 v1, p0

    iput-object v0, v1, Lcom/pad/android/iappad/AdController;->toolbar:Landroid/view/View;

    .line 836
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/pad/android/iappad/AdController;->results:Lorg/json/JSONObject;

    move-object/from16 v45, v0

    const-string v46, "titlecolor"

    invoke-virtual/range {v45 .. v46}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v12

    .line 837
    .local v12, "clr":Ljava/lang/String;
    const-string v45, ""

    move-object/from16 v0, v45

    invoke-virtual {v12, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v45

    if-nez v45, :cond_33b

    if-nez v12, :cond_33d

    .line 839
    :cond_33b
    const-string v12, "#E6E6E6"

    .line 841
    :cond_33d
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/pad/android/iappad/AdController;->toolbar:Landroid/view/View;

    move-object/from16 v45, v0

    invoke-static {v12}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    move-result v46

    invoke-virtual/range {v45 .. v46}, Landroid/view/View;->setBackgroundColor(I)V

    .line 844
    new-instance v45, Landroid/widget/TextView;

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/pad/android/iappad/AdController;->activity:Landroid/app/Activity;

    move-object/from16 v46, v0

    invoke-direct/range {v45 .. v46}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    move-object/from16 v0, v45

    move-object/from16 v1, p0

    iput-object v0, v1, Lcom/pad/android/iappad/AdController;->title:Landroid/widget/TextView;

    .line 845
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/pad/android/iappad/AdController;->title:Landroid/widget/TextView;

    move-object/from16 v45, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/pad/android/iappad/AdController;->results:Lorg/json/JSONObject;

    move-object/from16 v46, v0

    const-string v47, "titletext"

    invoke-virtual/range {v46 .. v47}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v46

    invoke-virtual/range {v45 .. v46}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 846
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/pad/android/iappad/AdController;->results:Lorg/json/JSONObject;

    move-object/from16 v45, v0

    const-string v46, "titletextcolor"

    invoke-virtual/range {v45 .. v46}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v9

    .line 847
    .local v9, "clk":Ljava/lang/String;
    const-string v45, ""

    move-object/from16 v0, v45

    invoke-virtual {v9, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v45

    if-nez v45, :cond_388

    if-nez v9, :cond_38a

    .line 849
    :cond_388
    const-string v9, "#E6E6E6"

    .line 851
    :cond_38a
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/pad/android/iappad/AdController;->title:Landroid/widget/TextView;

    move-object/from16 v45, v0

    invoke-static {v9}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    move-result v46

    invoke-virtual/range {v45 .. v46}, Landroid/widget/TextView;->setTextColor(I)V

    .line 852
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/pad/android/iappad/AdController;->results:Lorg/json/JSONObject;

    move-object/from16 v45, v0

    const-string v46, "titletextheight"

    invoke-virtual/range {v45 .. v46}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    move-result v33

    .line 853
    .local v33, "titletextheight":I
    new-instance v41, Landroid/view/ViewGroup$MarginLayoutParams;

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/pad/android/iappad/AdController;->results:Lorg/json/JSONObject;

    move-object/from16 v45, v0

    const-string v46, "titletextwidth"

    invoke-virtual/range {v45 .. v46}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    move-result v45

    move-object/from16 v0, v41

    move/from16 v1, v45

    move/from16 v2, v33

    invoke-direct {v0, v1, v2}, Landroid/view/ViewGroup$MarginLayoutParams;-><init>(II)V

    .line 854
    .local v41, "tvp":Landroid/view/ViewGroup$MarginLayoutParams;
    add-int/lit8 v34, v38, 0x14

    .line 855
    .local v34, "titlex":I
    sub-int v45, v36, v33

    div-int/lit8 v45, v45, 0x2

    add-int v45, v45, v39

    add-int/lit8 v35, v45, 0x4

    .line 856
    .local v35, "titley":I
    const/16 v45, 0x0

    const/16 v46, 0x0

    move-object/from16 v0, v41

    move/from16 v1, v34

    move/from16 v2, v35

    move/from16 v3, v45

    move/from16 v4, v46

    invoke-virtual {v0, v1, v2, v3, v4}, Landroid/view/ViewGroup$MarginLayoutParams;->setMargins(IIII)V

    .line 857
    new-instance v40, Landroid/widget/RelativeLayout$LayoutParams;

    invoke-direct/range {v40 .. v41}, Landroid/widget/RelativeLayout$LayoutParams;-><init>(Landroid/view/ViewGroup$MarginLayoutParams;)V

    .line 860
    .local v40, "tvl":Landroid/widget/RelativeLayout$LayoutParams;
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/pad/android/iappad/AdController;->results:Lorg/json/JSONObject;

    move-object/from16 v45, v0

    const-string v46, "footerx"

    invoke-virtual/range {v45 .. v46}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    move-result v23

    .line 861
    .local v23, "footerx":I
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/pad/android/iappad/AdController;->results:Lorg/json/JSONObject;

    move-object/from16 v45, v0

    const-string v46, "footery"

    invoke-virtual/range {v45 .. v46}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    move-result v24

    .line 862
    .local v24, "footery":I
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/pad/android/iappad/AdController;->results:Lorg/json/JSONObject;

    move-object/from16 v45, v0

    const-string v46, "footerheight"

    invoke-virtual/range {v45 .. v46}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    move-result v21

    .line 863
    .local v21, "footerheight":I
    new-instance v17, Landroid/view/ViewGroup$MarginLayoutParams;

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/pad/android/iappad/AdController;->results:Lorg/json/JSONObject;

    move-object/from16 v45, v0

    const-string v46, "footerwidth"

    invoke-virtual/range {v45 .. v46}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    move-result v45

    move-object/from16 v0, v17

    move/from16 v1, v45

    move/from16 v2, v21

    invoke-direct {v0, v1, v2}, Landroid/view/ViewGroup$MarginLayoutParams;-><init>(II)V

    .line 864
    .local v17, "fM":Landroid/view/ViewGroup$MarginLayoutParams;
    const/16 v45, 0x0

    const/16 v46, 0x0

    move-object/from16 v0, v17

    move/from16 v1, v23

    move/from16 v2, v24

    move/from16 v3, v45

    move/from16 v4, v46

    invoke-virtual {v0, v1, v2, v3, v4}, Landroid/view/ViewGroup$MarginLayoutParams;->setMargins(IIII)V

    .line 865
    new-instance v16, Landroid/widget/RelativeLayout$LayoutParams;

    invoke-direct/range {v16 .. v17}, Landroid/widget/RelativeLayout$LayoutParams;-><init>(Landroid/view/ViewGroup$MarginLayoutParams;)V

    .line 866
    .local v16, "fL":Landroid/widget/RelativeLayout$LayoutParams;
    new-instance v45, Landroid/view/View;

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/pad/android/iappad/AdController;->activity:Landroid/app/Activity;

    move-object/from16 v46, v0

    invoke-direct/range {v45 .. v46}, Landroid/view/View;-><init>(Landroid/content/Context;)V

    move-object/from16 v0, v45

    move-object/from16 v1, p0

    iput-object v0, v1, Lcom/pad/android/iappad/AdController;->footer:Landroid/view/View;

    .line 867
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/pad/android/iappad/AdController;->results:Lorg/json/JSONObject;

    move-object/from16 v45, v0

    const-string v46, "footercolor"

    invoke-virtual/range {v45 .. v46}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v15

    .line 868
    .local v15, "fClr":Ljava/lang/String;
    const-string v45, ""

    move-object/from16 v0, v45

    invoke-virtual {v15, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v45

    if-nez v45, :cond_454

    if-nez v15, :cond_456

    .line 870
    :cond_454
    const-string v15, "#E6E6E6"

    .line 872
    :cond_456
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/pad/android/iappad/AdController;->footer:Landroid/view/View;

    move-object/from16 v45, v0

    invoke-static {v15}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    move-result v46

    invoke-virtual/range {v45 .. v46}, Landroid/view/View;->setBackgroundColor(I)V

    .line 875
    new-instance v45, Landroid/widget/TextView;

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/pad/android/iappad/AdController;->activity:Landroid/app/Activity;

    move-object/from16 v46, v0

    invoke-direct/range {v45 .. v46}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    move-object/from16 v0, v45

    move-object/from16 v1, p0

    iput-object v0, v1, Lcom/pad/android/iappad/AdController;->footerTitle:Landroid/widget/TextView;

    .line 876
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/pad/android/iappad/AdController;->footerTitle:Landroid/widget/TextView;

    move-object/from16 v45, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/pad/android/iappad/AdController;->results:Lorg/json/JSONObject;

    move-object/from16 v46, v0

    const-string v47, "footertext"

    invoke-virtual/range {v46 .. v47}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v46

    invoke-virtual/range {v45 .. v46}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 877
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/pad/android/iappad/AdController;->footerTitle:Landroid/widget/TextView;

    move-object/from16 v45, v0

    const/high16 v46, 0x41200000    # 10.0f

    invoke-virtual/range {v45 .. v46}, Landroid/widget/TextView;->setTextSize(F)V

    .line 878
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/pad/android/iappad/AdController;->results:Lorg/json/JSONObject;

    move-object/from16 v45, v0

    const-string v46, "footertextheight"

    invoke-virtual/range {v45 .. v46}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    move-result v22

    .line 879
    .local v22, "footertextheight":I
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/pad/android/iappad/AdController;->results:Lorg/json/JSONObject;

    move-object/from16 v45, v0

    const-string v46, "footertextcolor"

    invoke-virtual/range {v45 .. v46}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v20

    .line 880
    .local v20, "fclk":Ljava/lang/String;
    const-string v45, ""

    move-object/from16 v0, v20

    move-object/from16 v1, v45

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v45

    if-nez v45, :cond_4ba

    if-nez v20, :cond_4bc

    .line 882
    :cond_4ba
    const-string v20, "#E6E6E6"

    .line 884
    :cond_4bc
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/pad/android/iappad/AdController;->footerTitle:Landroid/widget/TextView;

    move-object/from16 v45, v0

    invoke-static/range {v20 .. v20}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    move-result v46

    invoke-virtual/range {v45 .. v46}, Landroid/widget/TextView;->setTextColor(I)V

    .line 885
    new-instance v28, Landroid/view/ViewGroup$MarginLayoutParams;

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/pad/android/iappad/AdController;->results:Lorg/json/JSONObject;

    move-object/from16 v45, v0

    const-string v46, "footertextwidth"

    invoke-virtual/range {v45 .. v46}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    move-result v45

    move-object/from16 v0, v28

    move/from16 v1, v45

    move/from16 v2, v22

    invoke-direct {v0, v1, v2}, Landroid/view/ViewGroup$MarginLayoutParams;-><init>(II)V

    .line 886
    .local v28, "fvp":Landroid/view/ViewGroup$MarginLayoutParams;
    add-int/lit8 v18, v23, 0x14

    .line 887
    .local v18, "fTitlex":I
    sub-int v45, v21, v22

    div-int/lit8 v45, v45, 0x2

    add-int v19, v24, v45

    .line 888
    .local v19, "fTitley":I
    const/16 v45, 0x0

    const/16 v46, 0x0

    move-object/from16 v0, v28

    move/from16 v1, v18

    move/from16 v2, v19

    move/from16 v3, v45

    move/from16 v4, v46

    invoke-virtual {v0, v1, v2, v3, v4}, Landroid/view/ViewGroup$MarginLayoutParams;->setMargins(IIII)V

    .line 889
    new-instance v27, Landroid/widget/RelativeLayout$LayoutParams;

    invoke-direct/range {v27 .. v28}, Landroid/widget/RelativeLayout$LayoutParams;-><init>(Landroid/view/ViewGroup$MarginLayoutParams;)V

    .line 893
    .local v27, "fvl":Landroid/widget/RelativeLayout$LayoutParams;
    add-int/lit8 v45, v36, -0x5

    const/16 v46, 0x0

    invoke-static/range {v45 .. v46}, Ljava/lang/Math;->max(II)I

    move-result v8

    .line 894
    .local v8, "buttonHeight":I
    div-int/lit8 v45, v8, 0x2

    move/from16 v0, v45

    int-to-float v7, v0

    .line 895
    .local v7, "buttonFont":F
    new-instance v45, Landroid/widget/Button;

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/pad/android/iappad/AdController;->activity:Landroid/app/Activity;

    move-object/from16 v46, v0

    invoke-direct/range {v45 .. v46}, Landroid/widget/Button;-><init>(Landroid/content/Context;)V

    move-object/from16 v0, v45

    move-object/from16 v1, p0

    iput-object v0, v1, Lcom/pad/android/iappad/AdController;->closeBtn:Landroid/widget/Button;

    .line 896
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/pad/android/iappad/AdController;->closeBtn:Landroid/widget/Button;

    move-object/from16 v45, v0

    const-string v46, "X"

    invoke-virtual/range {v45 .. v46}, Landroid/widget/Button;->setText(Ljava/lang/CharSequence;)V

    .line 898
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/pad/android/iappad/AdController;->closeBtn:Landroid/widget/Button;

    move-object/from16 v45, v0

    move-object/from16 v0, v45

    invoke-virtual {v0, v7}, Landroid/widget/Button;->setTextSize(F)V

    .line 899
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/pad/android/iappad/AdController;->closeBtn:Landroid/widget/Button;

    move-object/from16 v45, v0

    invoke-static {v9}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    move-result v46

    invoke-virtual/range {v45 .. v46}, Landroid/widget/Button;->setTextColor(I)V

    .line 900
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/pad/android/iappad/AdController;->closeBtn:Landroid/widget/Button;

    move-object/from16 v45, v0

    const/16 v46, 0x0

    const/16 v47, 0x0

    const/16 v48, 0x0

    const/16 v49, 0x0

    invoke-virtual/range {v45 .. v49}, Landroid/widget/Button;->setPadding(IIII)V

    .line 901
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/pad/android/iappad/AdController;->closeBtn:Landroid/widget/Button;

    move-object/from16 v45, v0

    invoke-static {v12}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    move-result v46

    invoke-virtual/range {v45 .. v46}, Landroid/widget/Button;->setBackgroundColor(I)V

    .line 902
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/pad/android/iappad/AdController;->closeBtn:Landroid/widget/Button;

    move-object/from16 v45, v0

    new-instance v46, Lcom/pad/android/iappad/AdController$3;

    move-object/from16 v0, v46

    move-object/from16 v1, p0

    invoke-direct {v0, v1}, Lcom/pad/android/iappad/AdController$3;-><init>(Lcom/pad/android/iappad/AdController;)V

    invoke-virtual/range {v45 .. v46}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 908
    new-instance v45, Landroid/view/ViewGroup$MarginLayoutParams;

    const/16 v46, 0x37

    move-object/from16 v0, v45

    move/from16 v1, v46

    invoke-direct {v0, v1, v8}, Landroid/view/ViewGroup$MarginLayoutParams;-><init>(II)V

    move-object/from16 v0, v45

    move-object/from16 v1, p0

    iput-object v0, v1, Lcom/pad/android/iappad/AdController;->mlpC:Landroid/view/ViewGroup$MarginLayoutParams;

    .line 909
    add-int v45, v37, v38

    add-int/lit8 v45, v45, -0x37

    add-int/lit8 v10, v45, -0x5

    .line 910
    .local v10, "closex":I
    sub-int v45, v36, v8

    div-int/lit8 v45, v45, 0x2

    add-int v45, v45, v39

    add-int/lit8 v11, v45, 0x2

    .line 911
    .local v11, "closey":I
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/pad/android/iappad/AdController;->mlpC:Landroid/view/ViewGroup$MarginLayoutParams;

    move-object/from16 v45, v0

    const/16 v46, 0x0

    const/16 v47, 0x0

    move-object/from16 v0, v45

    move/from16 v1, v46

    move/from16 v2, v47

    invoke-virtual {v0, v10, v11, v1, v2}, Landroid/view/ViewGroup$MarginLayoutParams;->setMargins(IIII)V

    .line 912
    new-instance v45, Landroid/widget/RelativeLayout$LayoutParams;

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/pad/android/iappad/AdController;->mlpC:Landroid/view/ViewGroup$MarginLayoutParams;

    move-object/from16 v46, v0

    invoke-direct/range {v45 .. v46}, Landroid/widget/RelativeLayout$LayoutParams;-><init>(Landroid/view/ViewGroup$MarginLayoutParams;)V

    move-object/from16 v0, v45

    move-object/from16 v1, p0

    iput-object v0, v1, Lcom/pad/android/iappad/AdController;->lpC:Landroid/widget/RelativeLayout$LayoutParams;

    .line 914
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/pad/android/iappad/AdController;->mainView:Landroid/webkit/WebView;

    move-object/from16 v45, v0

    if-eqz v45, :cond_5ea

    .line 916
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/pad/android/iappad/AdController;->mainView:Landroid/webkit/WebView;

    move-object/from16 v45, v0

    invoke-virtual/range {v45 .. v45}, Landroid/webkit/WebView;->getParent()Landroid/view/ViewParent;

    move-result-object v45

    check-cast v45, Landroid/view/ViewGroup;

    move-object/from16 v0, v45

    move-object/from16 v1, p0

    iput-object v0, v1, Lcom/pad/android/iappad/AdController;->mainViewParent:Landroid/view/ViewGroup;

    .line 917
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/pad/android/iappad/AdController;->mainViewParent:Landroid/view/ViewGroup;

    move-object/from16 v45, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/pad/android/iappad/AdController;->mainView:Landroid/webkit/WebView;

    move-object/from16 v46, v0

    invoke-virtual/range {v45 .. v46}, Landroid/view/ViewGroup;->removeView(Landroid/view/View;)V

    .line 918
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/pad/android/iappad/AdController;->layout:Landroid/widget/RelativeLayout;

    move-object/from16 v45, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/pad/android/iappad/AdController;->mainView:Landroid/webkit/WebView;

    move-object/from16 v46, v0

    invoke-virtual/range {v45 .. v46}, Landroid/widget/RelativeLayout;->addView(Landroid/view/View;)V

    .line 921
    :cond_5ea
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/pad/android/iappad/AdController;->results:Lorg/json/JSONObject;

    move-object/from16 v45, v0

    const-string v46, "maskvisible"

    invoke-virtual/range {v45 .. v46}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    move-result v45

    const/16 v46, 0x1

    move/from16 v0, v45

    move/from16 v1, v46

    if-ne v0, v1, :cond_62d

    .line 923
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/pad/android/iappad/AdController;->layout:Landroid/widget/RelativeLayout;

    move-object/from16 v45, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/pad/android/iappad/AdController;->mask:Landroid/view/View;

    move-object/from16 v46, v0

    move-object/from16 v0, v45

    move-object/from16 v1, v46

    move-object/from16 v2, v29

    invoke-virtual {v0, v1, v2}, Landroid/widget/RelativeLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 925
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/pad/android/iappad/AdController;->mainView:Landroid/webkit/WebView;

    move-object/from16 v45, v0

    if-eqz v45, :cond_62d

    .line 927
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/pad/android/iappad/AdController;->mainView:Landroid/webkit/WebView;

    move-object/from16 v45, v0

    new-instance v46, Lcom/pad/android/iappad/AdController$4;

    move-object/from16 v0, v46

    move-object/from16 v1, p0

    invoke-direct {v0, v1}, Lcom/pad/android/iappad/AdController$4;-><init>(Lcom/pad/android/iappad/AdController;)V

    invoke-virtual/range {v45 .. v46}, Landroid/webkit/WebView;->setOnTouchListener(Landroid/view/View$OnTouchListener;)V

    .line 935
    :cond_62d
    const-string v45, "LBAdController"

    const-string v46, "Going to attach WebView to layout"

    invoke-static/range {v45 .. v46}, Lcom/pad/android/util/AdLog;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 936
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/pad/android/iappad/AdController;->layout:Landroid/widget/RelativeLayout;

    move-object/from16 v45, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/pad/android/iappad/AdController;->webview:Lcom/pad/android/iappad/AdWebView;

    move-object/from16 v46, v0

    move-object/from16 v0, v45

    move-object/from16 v1, v46

    move-object/from16 v2, v42

    invoke-virtual {v0, v1, v2}, Landroid/widget/RelativeLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 937
    const-string v45, "LBAdController"

    const-string v46, "WebView attached to layout"

    invoke-static/range {v45 .. v46}, Lcom/pad/android/util/AdLog;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 938
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/pad/android/iappad/AdController;->results:Lorg/json/JSONObject;

    move-object/from16 v45, v0

    const-string v46, "titlevisible"

    invoke-virtual/range {v45 .. v46}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    move-result v45

    const/16 v46, 0x1

    move/from16 v0, v45

    move/from16 v1, v46

    if-ne v0, v1, :cond_6cb

    .line 940
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/pad/android/iappad/AdController;->layout:Landroid/widget/RelativeLayout;

    move-object/from16 v45, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/pad/android/iappad/AdController;->toolbar:Landroid/view/View;

    move-object/from16 v46, v0

    move-object/from16 v0, v45

    move-object/from16 v1, v46

    move-object/from16 v2, v31

    invoke-virtual {v0, v1, v2}, Landroid/widget/RelativeLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 941
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/pad/android/iappad/AdController;->results:Lorg/json/JSONObject;

    move-object/from16 v45, v0

    const-string v46, "titletext"

    invoke-virtual/range {v45 .. v46}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v45

    const-string v46, ""

    invoke-virtual/range {v45 .. v46}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v45

    if-nez v45, :cond_6a2

    .line 943
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/pad/android/iappad/AdController;->layout:Landroid/widget/RelativeLayout;

    move-object/from16 v45, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/pad/android/iappad/AdController;->title:Landroid/widget/TextView;

    move-object/from16 v46, v0

    move-object/from16 v0, v45

    move-object/from16 v1, v46

    move-object/from16 v2, v40

    invoke-virtual {v0, v1, v2}, Landroid/widget/RelativeLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 946
    :cond_6a2
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/pad/android/iappad/AdController;->results:Lorg/json/JSONObject;

    move-object/from16 v45, v0

    const-string v46, "showclose"

    invoke-virtual/range {v45 .. v46}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    move-result v45

    const/16 v46, 0x1

    move/from16 v0, v45

    move/from16 v1, v46

    if-ne v0, v1, :cond_6cb

    .line 948
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/pad/android/iappad/AdController;->layout:Landroid/widget/RelativeLayout;

    move-object/from16 v45, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/pad/android/iappad/AdController;->closeBtn:Landroid/widget/Button;

    move-object/from16 v46, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/pad/android/iappad/AdController;->lpC:Landroid/widget/RelativeLayout$LayoutParams;

    move-object/from16 v47, v0

    invoke-virtual/range {v45 .. v47}, Landroid/widget/RelativeLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 951
    :cond_6cb
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/pad/android/iappad/AdController;->results:Lorg/json/JSONObject;

    move-object/from16 v45, v0

    const-string v46, "footervisible"

    invoke-virtual/range {v45 .. v46}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    move-result v45

    const/16 v46, 0x1

    move/from16 v0, v45

    move/from16 v1, v46

    if-ne v0, v1, :cond_71d

    .line 953
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/pad/android/iappad/AdController;->layout:Landroid/widget/RelativeLayout;

    move-object/from16 v45, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/pad/android/iappad/AdController;->footer:Landroid/view/View;

    move-object/from16 v46, v0

    move-object/from16 v0, v45

    move-object/from16 v1, v46

    move-object/from16 v2, v16

    invoke-virtual {v0, v1, v2}, Landroid/widget/RelativeLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 954
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/pad/android/iappad/AdController;->results:Lorg/json/JSONObject;

    move-object/from16 v45, v0

    const-string v46, "footertext"

    invoke-virtual/range {v45 .. v46}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v45

    const-string v46, ""

    invoke-virtual/range {v45 .. v46}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v45

    if-nez v45, :cond_71d

    .line 956
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/pad/android/iappad/AdController;->layout:Landroid/widget/RelativeLayout;

    move-object/from16 v45, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/pad/android/iappad/AdController;->footerTitle:Landroid/widget/TextView;

    move-object/from16 v46, v0

    move-object/from16 v0, v45

    move-object/from16 v1, v46

    move-object/from16 v2, v27

    invoke-virtual {v0, v1, v2}, Landroid/widget/RelativeLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V
    :try_end_71d
    .catch Lorg/json/JSONException; {:try_start_217 .. :try_end_71d} :catch_88f
    .catch Ljava/lang/Exception; {:try_start_217 .. :try_end_71d} :catch_8d3

    .line 962
    :cond_71d
    :try_start_71d
    new-instance v45, Ljava/lang/StringBuilder;

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/pad/android/iappad/AdController;->results:Lorg/json/JSONObject;

    move-object/from16 v46, v0

    const-string v47, "adurl"

    invoke-virtual/range {v46 .. v47}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v46

    invoke-static/range {v46 .. v46}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v46

    invoke-direct/range {v45 .. v46}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/pad/android/iappad/AdController;->sectionid:Ljava/lang/String;

    move-object/from16 v46, v0

    invoke-virtual/range {v45 .. v46}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v45

    invoke-virtual/range {v45 .. v45}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v45

    move-object/from16 v0, v45

    move-object/from16 v1, p0

    iput-object v0, v1, Lcom/pad/android/iappad/AdController;->loadUrl:Ljava/lang/String;

    .line 963
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/pad/android/iappad/AdController;->webview:Lcom/pad/android/iappad/AdWebView;

    move-object/from16 v45, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/pad/android/iappad/AdController;->loadUrl:Ljava/lang/String;

    move-object/from16 v46, v0

    invoke-virtual/range {v45 .. v46}, Lcom/pad/android/iappad/AdWebView;->setLoadingURL(Ljava/lang/String;)V

    .line 964
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/pad/android/iappad/AdController;->webview:Lcom/pad/android/iappad/AdWebView;

    move-object/from16 v45, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/pad/android/iappad/AdController;->loadUrl:Ljava/lang/String;

    move-object/from16 v46, v0

    invoke-virtual/range {v45 .. v46}, Lcom/pad/android/iappad/AdWebView;->loadUrl(Ljava/lang/String;)V

    .line 965
    const/16 v45, 0x1

    move/from16 v0, v45

    move-object/from16 v1, p0

    iput-boolean v0, v1, Lcom/pad/android/iappad/AdController;->loading:Z
    :try_end_76c
    .catch Ljava/lang/Exception; {:try_start_71d .. :try_end_76c} :catch_8c5
    .catch Lorg/json/JSONException; {:try_start_71d .. :try_end_76c} :catch_88f

    .line 973
    :goto_76c
    :try_start_76c
    new-instance v25, Landroid/view/ViewGroup$MarginLayoutParams;

    move-object/from16 v0, p0

    iget v0, v0, Lcom/pad/android/iappad/AdController;->sWidth:I

    move/from16 v45, v0

    move-object/from16 v0, p0

    iget v0, v0, Lcom/pad/android/iappad/AdController;->sHeight:I

    move/from16 v46, v0

    move-object/from16 v0, v25

    move/from16 v1, v45

    move/from16 v2, v46

    invoke-direct {v0, v1, v2}, Landroid/view/ViewGroup$MarginLayoutParams;-><init>(II)V

    .line 974
    .local v25, "full":Landroid/view/ViewGroup$MarginLayoutParams;
    const/16 v45, 0x0

    const/16 v46, 0x0

    const/16 v47, 0x0

    const/16 v48, 0x0

    move-object/from16 v0, v25

    move/from16 v1, v45

    move/from16 v2, v46

    move/from16 v3, v47

    move/from16 v4, v48

    invoke-virtual {v0, v1, v2, v3, v4}, Landroid/view/ViewGroup$MarginLayoutParams;->setMargins(IIII)V

    .line 975
    new-instance v26, Landroid/widget/RelativeLayout$LayoutParams;

    move-object/from16 v0, v26

    move-object/from16 v1, v25

    invoke-direct {v0, v1}, Landroid/widget/RelativeLayout$LayoutParams;-><init>(Landroid/view/ViewGroup$MarginLayoutParams;)V
    :try_end_7a1
    .catch Lorg/json/JSONException; {:try_start_76c .. :try_end_7a1} :catch_88f
    .catch Ljava/lang/Exception; {:try_start_76c .. :try_end_7a1} :catch_8d3

    .line 978
    .local v26, "fullParams":Landroid/widget/RelativeLayout$LayoutParams;
    :try_start_7a1
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/pad/android/iappad/AdController;->activity:Landroid/app/Activity;

    move-object/from16 v45, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/pad/android/iappad/AdController;->layout:Landroid/widget/RelativeLayout;

    move-object/from16 v46, v0

    move-object/from16 v0, v45

    move-object/from16 v1, v46

    move-object/from16 v2, v26

    invoke-virtual {v0, v1, v2}, Landroid/app/Activity;->addContentView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V
    :try_end_7b6
    .catch Ljava/lang/Exception; {:try_start_7a1 .. :try_end_7b6} :catch_8f8
    .catch Lorg/json/JSONException; {:try_start_7a1 .. :try_end_7b6} :catch_88f

    .line 985
    :goto_7b6
    :try_start_7b6
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/pad/android/iappad/AdController;->results:Lorg/json/JSONObject;

    move-object/from16 v45, v0

    const-string v46, "pollenable"

    invoke-virtual/range {v45 .. v46}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    move-result v45

    const/16 v46, 0x1

    move/from16 v0, v45

    move/from16 v1, v46

    if-ne v0, v1, :cond_913

    move-object/from16 v0, p0

    iget-boolean v0, v0, Lcom/pad/android/iappad/AdController;->pollingInitialized:Z

    move/from16 v45, v0

    if-nez v45, :cond_913

    move-object/from16 v0, p0

    iget v0, v0, Lcom/pad/android/iappad/AdController;->pollCount:I

    move/from16 v45, v0

    move-object/from16 v0, p0

    iget v0, v0, Lcom/pad/android/iappad/AdController;->pollMax:I

    move/from16 v46, v0

    move/from16 v0, v45

    move/from16 v1, v46

    if-gt v0, v1, :cond_913

    move-object/from16 v0, p0

    iget v0, v0, Lcom/pad/android/iappad/AdController;->pollCount:I

    move/from16 v45, v0

    move-object/from16 v0, p0

    iget v0, v0, Lcom/pad/android/iappad/AdController;->pollManual:I

    move/from16 v46, v0

    move/from16 v0, v45

    move/from16 v1, v46

    if-ge v0, v1, :cond_913

    .line 987
    const-string v45, "LBAdController"

    const-string v46, "Polling going to be set..."

    invoke-static/range {v45 .. v46}, Lcom/pad/android/util/AdLog;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 988
    const/16 v45, 0x1

    move/from16 v0, v45

    move-object/from16 v1, p0

    iput-boolean v0, v1, Lcom/pad/android/iappad/AdController;->pollingInitialized:Z

    .line 989
    new-instance v45, Lcom/pad/android/iappad/AdController$OfferPolling;

    move-object/from16 v0, v45

    move-object/from16 v1, p0

    invoke-direct {v0, v1}, Lcom/pad/android/iappad/AdController$OfferPolling;-><init>(Lcom/pad/android/iappad/AdController;)V

    move-object/from16 v0, v45

    move-object/from16 v1, p0

    iput-object v0, v1, Lcom/pad/android/iappad/AdController;->adPolling:Lcom/pad/android/iappad/AdController$OfferPolling;

    .line 990
    new-instance v45, Landroid/os/Handler;

    invoke-direct/range {v45 .. v45}, Landroid/os/Handler;-><init>()V

    move-object/from16 v0, v45

    move-object/from16 v1, p0

    iput-object v0, v1, Lcom/pad/android/iappad/AdController;->pollingHandler:Landroid/os/Handler;
    :try_end_81f
    .catch Lorg/json/JSONException; {:try_start_7b6 .. :try_end_81f} :catch_88f
    .catch Ljava/lang/Exception; {:try_start_7b6 .. :try_end_81f} :catch_8d3

    .line 993
    :try_start_81f
    const-string v45, "LBAdController"

    new-instance v46, Ljava/lang/StringBuilder;

    const-string v47, "Polling initialized every "

    invoke-direct/range {v46 .. v47}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/pad/android/iappad/AdController;->results:Lorg/json/JSONObject;

    move-object/from16 v47, v0

    const-string v48, "pollinterval"

    invoke-virtual/range {v47 .. v48}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    move-result v47

    invoke-virtual/range {v46 .. v47}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v46

    const-string v47, "s"

    invoke-virtual/range {v46 .. v47}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v46

    invoke-virtual/range {v46 .. v46}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v46

    invoke-static/range {v45 .. v46}, Lcom/pad/android/util/AdLog;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 994
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/pad/android/iappad/AdController;->pollingHandler:Landroid/os/Handler;

    move-object/from16 v45, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/pad/android/iappad/AdController;->adPolling:Lcom/pad/android/iappad/AdController$OfferPolling;

    move-object/from16 v46, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/pad/android/iappad/AdController;->results:Lorg/json/JSONObject;

    move-object/from16 v47, v0

    const-string v48, "pollinterval"

    invoke-virtual/range {v47 .. v48}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    move-result v47

    move/from16 v0, v47

    mul-int/lit16 v0, v0, 0x3e8

    move/from16 v47, v0

    move/from16 v0, v47

    int-to-long v0, v0

    move-wide/from16 v47, v0

    invoke-virtual/range {v45 .. v48}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z
    :try_end_86b
    .catch Ljava/lang/Exception; {:try_start_81f .. :try_end_86b} :catch_86d
    .catch Lorg/json/JSONException; {:try_start_81f .. :try_end_86b} :catch_88f

    goto/16 :goto_16

    .line 996
    :catch_86d
    move-exception v14

    .line 997
    .restart local v14    # "e":Ljava/lang/Exception;
    :try_start_86e
    const-string v45, "LBAdController"

    new-instance v46, Ljava/lang/StringBuilder;

    const-string v47, "Error in initializing polling - "

    invoke-direct/range {v46 .. v47}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v14}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v47

    invoke-virtual/range {v46 .. v47}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v46

    invoke-virtual/range {v46 .. v46}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v46

    invoke-static/range {v45 .. v46}, Lcom/pad/android/util/AdLog;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 998
    const-string v45, "LBAdController"

    move-object/from16 v0, v45

    invoke-static {v0, v14}, Lcom/pad/android/util/AdLog;->printStackTrace(Ljava/lang/String;Ljava/lang/Exception;)V
    :try_end_88d
    .catch Lorg/json/JSONException; {:try_start_86e .. :try_end_88d} :catch_88f
    .catch Ljava/lang/Exception; {:try_start_86e .. :try_end_88d} :catch_8d3

    goto/16 :goto_16

    .line 1035
    .end local v7    # "buttonFont":F
    .end local v8    # "buttonHeight":I
    .end local v9    # "clk":Ljava/lang/String;
    .end local v10    # "closex":I
    .end local v11    # "closey":I
    .end local v12    # "clr":Ljava/lang/String;
    .end local v13    # "docking":Ljava/lang/String;
    .end local v14    # "e":Ljava/lang/Exception;
    .end local v15    # "fClr":Ljava/lang/String;
    .end local v16    # "fL":Landroid/widget/RelativeLayout$LayoutParams;
    .end local v17    # "fM":Landroid/view/ViewGroup$MarginLayoutParams;
    .end local v18    # "fTitlex":I
    .end local v19    # "fTitley":I
    .end local v20    # "fclk":Ljava/lang/String;
    .end local v21    # "footerheight":I
    .end local v22    # "footertextheight":I
    .end local v23    # "footerx":I
    .end local v24    # "footery":I
    .end local v25    # "full":Landroid/view/ViewGroup$MarginLayoutParams;
    .end local v26    # "fullParams":Landroid/widget/RelativeLayout$LayoutParams;
    .end local v27    # "fvl":Landroid/widget/RelativeLayout$LayoutParams;
    .end local v28    # "fvp":Landroid/view/ViewGroup$MarginLayoutParams;
    .end local v29    # "mL":Landroid/widget/RelativeLayout$LayoutParams;
    .end local v30    # "mM":Landroid/view/ViewGroup$MarginLayoutParams;
    .end local v31    # "tL":Landroid/widget/RelativeLayout$LayoutParams;
    .end local v32    # "tM":Landroid/view/ViewGroup$MarginLayoutParams;
    .end local v33    # "titletextheight":I
    .end local v34    # "titlex":I
    .end local v35    # "titley":I
    .end local v36    # "toolbarheight":I
    .end local v37    # "toolbarwidth":I
    .end local v38    # "toolbarx":I
    .end local v39    # "toolbary":I
    .end local v40    # "tvl":Landroid/widget/RelativeLayout$LayoutParams;
    .end local v41    # "tvp":Landroid/view/ViewGroup$MarginLayoutParams;
    .end local v42    # "wL":Landroid/widget/RelativeLayout$LayoutParams;
    .end local v43    # "wM":Landroid/view/ViewGroup$MarginLayoutParams;
    .end local v44    # "windowYPos":I
    :catch_88f
    move-exception v14

    .line 1037
    .local v14, "e":Lorg/json/JSONException;
    invoke-direct/range {p0 .. p0}, Lcom/pad/android/iappad/AdController;->closeUnlocker()V

    .line 1038
    const-string v45, "AdController"

    new-instance v46, Ljava/lang/StringBuilder;

    const-string v47, "JSONException - "

    invoke-direct/range {v46 .. v47}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v14}, Lorg/json/JSONException;->getMessage()Ljava/lang/String;

    move-result-object v47

    invoke-virtual/range {v46 .. v47}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v46

    invoke-virtual/range {v46 .. v46}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v46

    invoke-static/range {v45 .. v46}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    goto/16 :goto_16

    .line 811
    .end local v14    # "e":Lorg/json/JSONException;
    .restart local v13    # "docking":Ljava/lang/String;
    .restart local v29    # "mL":Landroid/widget/RelativeLayout$LayoutParams;
    .restart local v30    # "mM":Landroid/view/ViewGroup$MarginLayoutParams;
    .restart local v44    # "windowYPos":I
    :cond_8ad
    :try_start_8ad
    const-string v45, "Bottom"

    move-object/from16 v0, v45

    invoke-virtual {v13, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v45

    if-eqz v45, :cond_27c

    .line 813
    move-object/from16 v0, p0

    iget v0, v0, Lcom/pad/android/iappad/AdController;->additionalDockingMargin:I

    move/from16 v45, v0

    sub-int v44, v44, v45

    .line 814
    if-gez v44, :cond_27c

    .line 816
    const/16 v44, 0x0

    goto/16 :goto_27c

    .line 967
    .restart local v7    # "buttonFont":F
    .restart local v8    # "buttonHeight":I
    .restart local v9    # "clk":Ljava/lang/String;
    .restart local v10    # "closex":I
    .restart local v11    # "closey":I
    .restart local v12    # "clr":Ljava/lang/String;
    .restart local v15    # "fClr":Ljava/lang/String;
    .restart local v16    # "fL":Landroid/widget/RelativeLayout$LayoutParams;
    .restart local v17    # "fM":Landroid/view/ViewGroup$MarginLayoutParams;
    .restart local v18    # "fTitlex":I
    .restart local v19    # "fTitley":I
    .restart local v20    # "fclk":Ljava/lang/String;
    .restart local v21    # "footerheight":I
    .restart local v22    # "footertextheight":I
    .restart local v23    # "footerx":I
    .restart local v24    # "footery":I
    .restart local v27    # "fvl":Landroid/widget/RelativeLayout$LayoutParams;
    .restart local v28    # "fvp":Landroid/view/ViewGroup$MarginLayoutParams;
    .restart local v31    # "tL":Landroid/widget/RelativeLayout$LayoutParams;
    .restart local v32    # "tM":Landroid/view/ViewGroup$MarginLayoutParams;
    .restart local v33    # "titletextheight":I
    .restart local v34    # "titlex":I
    .restart local v35    # "titley":I
    .restart local v36    # "toolbarheight":I
    .restart local v37    # "toolbarwidth":I
    .restart local v38    # "toolbarx":I
    .restart local v39    # "toolbary":I
    .restart local v40    # "tvl":Landroid/widget/RelativeLayout$LayoutParams;
    .restart local v41    # "tvp":Landroid/view/ViewGroup$MarginLayoutParams;
    .restart local v42    # "wL":Landroid/widget/RelativeLayout$LayoutParams;
    .restart local v43    # "wM":Landroid/view/ViewGroup$MarginLayoutParams;
    :catch_8c5
    move-exception v14

    .line 970
    .local v14, "e":Ljava/lang/Exception;
    invoke-direct/range {p0 .. p0}, Lcom/pad/android/iappad/AdController;->closeUnlocker()V

    .line 971
    const/16 v45, 0x0

    move/from16 v0, v45

    move-object/from16 v1, p0

    iput-boolean v0, v1, Lcom/pad/android/iappad/AdController;->loading:Z
    :try_end_8d1
    .catch Lorg/json/JSONException; {:try_start_8ad .. :try_end_8d1} :catch_88f
    .catch Ljava/lang/Exception; {:try_start_8ad .. :try_end_8d1} :catch_8d3

    goto/16 :goto_76c

    .line 1040
    .end local v7    # "buttonFont":F
    .end local v8    # "buttonHeight":I
    .end local v9    # "clk":Ljava/lang/String;
    .end local v10    # "closex":I
    .end local v11    # "closey":I
    .end local v12    # "clr":Ljava/lang/String;
    .end local v13    # "docking":Ljava/lang/String;
    .end local v14    # "e":Ljava/lang/Exception;
    .end local v15    # "fClr":Ljava/lang/String;
    .end local v16    # "fL":Landroid/widget/RelativeLayout$LayoutParams;
    .end local v17    # "fM":Landroid/view/ViewGroup$MarginLayoutParams;
    .end local v18    # "fTitlex":I
    .end local v19    # "fTitley":I
    .end local v20    # "fclk":Ljava/lang/String;
    .end local v21    # "footerheight":I
    .end local v22    # "footertextheight":I
    .end local v23    # "footerx":I
    .end local v24    # "footery":I
    .end local v27    # "fvl":Landroid/widget/RelativeLayout$LayoutParams;
    .end local v28    # "fvp":Landroid/view/ViewGroup$MarginLayoutParams;
    .end local v29    # "mL":Landroid/widget/RelativeLayout$LayoutParams;
    .end local v30    # "mM":Landroid/view/ViewGroup$MarginLayoutParams;
    .end local v31    # "tL":Landroid/widget/RelativeLayout$LayoutParams;
    .end local v32    # "tM":Landroid/view/ViewGroup$MarginLayoutParams;
    .end local v33    # "titletextheight":I
    .end local v34    # "titlex":I
    .end local v35    # "titley":I
    .end local v36    # "toolbarheight":I
    .end local v37    # "toolbarwidth":I
    .end local v38    # "toolbarx":I
    .end local v39    # "toolbary":I
    .end local v40    # "tvl":Landroid/widget/RelativeLayout$LayoutParams;
    .end local v41    # "tvp":Landroid/view/ViewGroup$MarginLayoutParams;
    .end local v42    # "wL":Landroid/widget/RelativeLayout$LayoutParams;
    .end local v43    # "wM":Landroid/view/ViewGroup$MarginLayoutParams;
    .end local v44    # "windowYPos":I
    :catch_8d3
    move-exception v14

    .line 1042
    .restart local v14    # "e":Ljava/lang/Exception;
    invoke-direct/range {p0 .. p0}, Lcom/pad/android/iappad/AdController;->closeUnlocker()V

    .line 1043
    const-string v45, "LBAdController"

    move-object/from16 v0, v45

    invoke-static {v0, v14}, Lcom/pad/android/util/AdLog;->printStackTrace(Ljava/lang/String;Ljava/lang/Exception;)V

    .line 1044
    const-string v45, "AdController"

    new-instance v46, Ljava/lang/StringBuilder;

    const-string v47, "Exception - "

    invoke-direct/range {v46 .. v47}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v14}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v47

    invoke-virtual/range {v46 .. v47}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v46

    invoke-virtual/range {v46 .. v46}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v46

    invoke-static/range {v45 .. v46}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    goto/16 :goto_16

    .line 980
    .end local v14    # "e":Ljava/lang/Exception;
    .restart local v7    # "buttonFont":F
    .restart local v8    # "buttonHeight":I
    .restart local v9    # "clk":Ljava/lang/String;
    .restart local v10    # "closex":I
    .restart local v11    # "closey":I
    .restart local v12    # "clr":Ljava/lang/String;
    .restart local v13    # "docking":Ljava/lang/String;
    .restart local v15    # "fClr":Ljava/lang/String;
    .restart local v16    # "fL":Landroid/widget/RelativeLayout$LayoutParams;
    .restart local v17    # "fM":Landroid/view/ViewGroup$MarginLayoutParams;
    .restart local v18    # "fTitlex":I
    .restart local v19    # "fTitley":I
    .restart local v20    # "fclk":Ljava/lang/String;
    .restart local v21    # "footerheight":I
    .restart local v22    # "footertextheight":I
    .restart local v23    # "footerx":I
    .restart local v24    # "footery":I
    .restart local v25    # "full":Landroid/view/ViewGroup$MarginLayoutParams;
    .restart local v26    # "fullParams":Landroid/widget/RelativeLayout$LayoutParams;
    .restart local v27    # "fvl":Landroid/widget/RelativeLayout$LayoutParams;
    .restart local v28    # "fvp":Landroid/view/ViewGroup$MarginLayoutParams;
    .restart local v29    # "mL":Landroid/widget/RelativeLayout$LayoutParams;
    .restart local v30    # "mM":Landroid/view/ViewGroup$MarginLayoutParams;
    .restart local v31    # "tL":Landroid/widget/RelativeLayout$LayoutParams;
    .restart local v32    # "tM":Landroid/view/ViewGroup$MarginLayoutParams;
    .restart local v33    # "titletextheight":I
    .restart local v34    # "titlex":I
    .restart local v35    # "titley":I
    .restart local v36    # "toolbarheight":I
    .restart local v37    # "toolbarwidth":I
    .restart local v38    # "toolbarx":I
    .restart local v39    # "toolbary":I
    .restart local v40    # "tvl":Landroid/widget/RelativeLayout$LayoutParams;
    .restart local v41    # "tvp":Landroid/view/ViewGroup$MarginLayoutParams;
    .restart local v42    # "wL":Landroid/widget/RelativeLayout$LayoutParams;
    .restart local v43    # "wM":Landroid/view/ViewGroup$MarginLayoutParams;
    .restart local v44    # "windowYPos":I
    :catch_8f8
    move-exception v14

    .line 982
    .restart local v14    # "e":Ljava/lang/Exception;
    :try_start_8f9
    const-string v45, "LBAdController"

    new-instance v46, Ljava/lang/StringBuilder;

    const-string v47, "Issue attaching layout to activity - "

    invoke-direct/range {v46 .. v47}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v14}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v47

    invoke-virtual/range {v46 .. v47}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v46

    invoke-virtual/range {v46 .. v46}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v46

    invoke-static/range {v45 .. v46}, Lcom/pad/android/util/AdLog;->e(Ljava/lang/String;Ljava/lang/String;)V

    goto/16 :goto_7b6

    .line 1001
    .end local v14    # "e":Ljava/lang/Exception;
    :cond_913
    move-object/from16 v0, p0

    iget v0, v0, Lcom/pad/android/iappad/AdController;->pollCount:I

    move/from16 v45, v0

    move-object/from16 v0, p0

    iget v0, v0, Lcom/pad/android/iappad/AdController;->pollMax:I

    move/from16 v46, v0

    move/from16 v0, v45

    move/from16 v1, v46

    if-le v0, v1, :cond_16

    move-object/from16 v0, p0

    iget v0, v0, Lcom/pad/android/iappad/AdController;->pollCount:I

    move/from16 v45, v0

    move-object/from16 v0, p0

    iget v0, v0, Lcom/pad/android/iappad/AdController;->pollManual:I

    move/from16 v46, v0

    move/from16 v0, v45

    move/from16 v1, v46

    if-lt v0, v1, :cond_16

    .line 1003
    const/16 v45, 0x0

    move/from16 v0, v45

    move-object/from16 v1, p0

    iput-boolean v0, v1, Lcom/pad/android/iappad/AdController;->pollingInitialized:Z

    .line 1004
    invoke-direct/range {p0 .. p0}, Lcom/pad/android/iappad/AdController;->showManualPoll()V

    goto/16 :goto_16

    .line 1009
    .end local v7    # "buttonFont":F
    .end local v8    # "buttonHeight":I
    .end local v9    # "clk":Ljava/lang/String;
    .end local v10    # "closex":I
    .end local v11    # "closey":I
    .end local v12    # "clr":Ljava/lang/String;
    .end local v13    # "docking":Ljava/lang/String;
    .end local v15    # "fClr":Ljava/lang/String;
    .end local v16    # "fL":Landroid/widget/RelativeLayout$LayoutParams;
    .end local v17    # "fM":Landroid/view/ViewGroup$MarginLayoutParams;
    .end local v18    # "fTitlex":I
    .end local v19    # "fTitley":I
    .end local v20    # "fclk":Ljava/lang/String;
    .end local v21    # "footerheight":I
    .end local v22    # "footertextheight":I
    .end local v23    # "footerx":I
    .end local v24    # "footery":I
    .end local v25    # "full":Landroid/view/ViewGroup$MarginLayoutParams;
    .end local v26    # "fullParams":Landroid/widget/RelativeLayout$LayoutParams;
    .end local v27    # "fvl":Landroid/widget/RelativeLayout$LayoutParams;
    .end local v28    # "fvp":Landroid/view/ViewGroup$MarginLayoutParams;
    .end local v29    # "mL":Landroid/widget/RelativeLayout$LayoutParams;
    .end local v30    # "mM":Landroid/view/ViewGroup$MarginLayoutParams;
    .end local v31    # "tL":Landroid/widget/RelativeLayout$LayoutParams;
    .end local v32    # "tM":Landroid/view/ViewGroup$MarginLayoutParams;
    .end local v33    # "titletextheight":I
    .end local v34    # "titlex":I
    .end local v35    # "titley":I
    .end local v36    # "toolbarheight":I
    .end local v37    # "toolbarwidth":I
    .end local v38    # "toolbarx":I
    .end local v39    # "toolbary":I
    .end local v40    # "tvl":Landroid/widget/RelativeLayout$LayoutParams;
    .end local v41    # "tvp":Landroid/view/ViewGroup$MarginLayoutParams;
    .end local v42    # "wL":Landroid/widget/RelativeLayout$LayoutParams;
    .end local v43    # "wM":Landroid/view/ViewGroup$MarginLayoutParams;
    .end local v44    # "windowYPos":I
    :cond_944
    const/16 v45, 0x0

    move/from16 v0, v45

    move-object/from16 v1, p0

    iput-boolean v0, v1, Lcom/pad/android/iappad/AdController;->loading:Z

    .line 1010
    invoke-direct/range {p0 .. p0}, Lcom/pad/android/iappad/AdController;->closeUnlocker()V

    goto/16 :goto_16

    .line 1016
    :cond_951
    const/16 v45, 0x0

    move/from16 v0, v45

    move-object/from16 v1, p0

    iput-boolean v0, v1, Lcom/pad/android/iappad/AdController;->loading:Z

    .line 1017
    invoke-direct/range {p0 .. p0}, Lcom/pad/android/iappad/AdController;->closeUnlocker()V

    .line 1018
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/pad/android/iappad/AdController;->listener:Lcom/pad/android/listener/AdListener;

    move-object/from16 v45, v0
    :try_end_962
    .catch Lorg/json/JSONException; {:try_start_8f9 .. :try_end_962} :catch_88f
    .catch Ljava/lang/Exception; {:try_start_8f9 .. :try_end_962} :catch_8d3

    if-eqz v45, :cond_16

    .line 1023
    :try_start_964
    const-string v45, "LBAdController"

    const-string v46, "onAdFailed triggered"

    invoke-static/range {v45 .. v46}, Lcom/pad/android/util/AdLog;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 1024
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/pad/android/iappad/AdController;->listener:Lcom/pad/android/listener/AdListener;

    move-object/from16 v45, v0

    invoke-interface/range {v45 .. v45}, Lcom/pad/android/listener/AdListener;->onAdFailed()V

    .line 1025
    const/16 v45, 0x1

    move/from16 v0, v45

    move-object/from16 v1, p0

    iput-boolean v0, v1, Lcom/pad/android/iappad/AdController;->adLoaded:Z
    :try_end_97c
    .catch Ljava/lang/Exception; {:try_start_964 .. :try_end_97c} :catch_97e
    .catch Lorg/json/JSONException; {:try_start_964 .. :try_end_97c} :catch_88f

    goto/16 :goto_16

    .line 1027
    :catch_97e
    move-exception v14

    .line 1029
    .restart local v14    # "e":Ljava/lang/Exception;
    :try_start_97f
    const-string v45, "LBAdController"

    const-string v46, "Error while calling onAdFailed"

    invoke-static/range {v45 .. v46}, Lcom/pad/android/util/AdLog;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 1030
    const-string v45, "LBAdController"

    move-object/from16 v0, v45

    invoke-static {v0, v14}, Lcom/pad/android/util/AdLog;->printStackTrace(Ljava/lang/String;Ljava/lang/Exception;)V
    :try_end_98d
    .catch Lorg/json/JSONException; {:try_start_97f .. :try_end_98d} :catch_88f
    .catch Ljava/lang/Exception; {:try_start_97f .. :try_end_98d} :catch_8d3

    goto/16 :goto_16

    .line 792
    .end local v14    # "e":Ljava/lang/Exception;
    .restart local v13    # "docking":Ljava/lang/String;
    .restart local v29    # "mL":Landroid/widget/RelativeLayout$LayoutParams;
    .restart local v30    # "mM":Landroid/view/ViewGroup$MarginLayoutParams;
    .restart local v44    # "windowYPos":I
    :catch_98f
    move-exception v45

    goto/16 :goto_217

    .line 779
    .end local v13    # "docking":Ljava/lang/String;
    .end local v29    # "mL":Landroid/widget/RelativeLayout$LayoutParams;
    .end local v30    # "mM":Landroid/view/ViewGroup$MarginLayoutParams;
    .end local v44    # "windowYPos":I
    :catch_992
    move-exception v45

    goto/16 :goto_1d4

    .line 760
    :catch_995
    move-exception v45

    goto/16 :goto_16d
.end method

.method private getAdVisibility()I
    .registers 2

    .prologue
    .line 379
    iget-object v0, p0, Lcom/pad/android/iappad/AdController;->webview:Lcom/pad/android/iappad/AdWebView;

    if-eqz v0, :cond_b

    .line 381
    iget-object v0, p0, Lcom/pad/android/iappad/AdController;->webview:Lcom/pad/android/iappad/AdWebView;

    invoke-virtual {v0}, Lcom/pad/android/iappad/AdWebView;->getVisibility()I

    move-result v0

    .line 385
    :goto_a
    return v0

    :cond_b
    const/4 v0, 0x4

    goto :goto_a
.end method

.method private goBack()V
    .registers 2

    .prologue
    .line 1556
    iget-object v0, p0, Lcom/pad/android/iappad/AdController;->webview:Lcom/pad/android/iappad/AdWebView;

    invoke-virtual {v0}, Lcom/pad/android/iappad/AdWebView;->canGoBack()Z

    move-result v0

    if-eqz v0, :cond_d

    .line 1558
    iget-object v0, p0, Lcom/pad/android/iappad/AdController;->webview:Lcom/pad/android/iappad/AdWebView;

    invoke-virtual {v0}, Lcom/pad/android/iappad/AdWebView;->goBack()V

    .line 1560
    :cond_d
    return-void
.end method

.method private goForward()V
    .registers 2

    .prologue
    .line 1564
    iget-object v0, p0, Lcom/pad/android/iappad/AdController;->webview:Lcom/pad/android/iappad/AdWebView;

    invoke-virtual {v0}, Lcom/pad/android/iappad/AdWebView;->canGoForward()Z

    move-result v0

    if-eqz v0, :cond_d

    .line 1566
    iget-object v0, p0, Lcom/pad/android/iappad/AdController;->webview:Lcom/pad/android/iappad/AdWebView;

    invoke-virtual {v0}, Lcom/pad/android/iappad/AdWebView;->goForward()V

    .line 1568
    :cond_d
    return-void
.end method

.method private initialize()V
    .registers 6

    .prologue
    .line 606
    iget-boolean v2, p0, Lcom/pad/android/iappad/AdController;->loadAd:Z

    if-eqz v2, :cond_3b

    invoke-virtual {p0}, Lcom/pad/android/iappad/AdController;->adShowStatus()Ljava/lang/String;

    move-result-object v2

    const-string v3, "hidden"

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_3b

    .line 608
    const-string v2, "LBAdController"

    const-string v3, "Ad paused, will not show"

    invoke-static {v2, v3}, Lcom/pad/android/util/AdLog;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 609
    iget-object v2, p0, Lcom/pad/android/iappad/AdController;->listener:Lcom/pad/android/listener/AdListener;

    if-eqz v2, :cond_2c

    .line 614
    :try_start_1b
    const-string v2, "LBAdController"

    const-string v3, "onAdPaused triggered"

    invoke-static {v2, v3}, Lcom/pad/android/util/AdLog;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 615
    iget-object v2, p0, Lcom/pad/android/iappad/AdController;->listener:Lcom/pad/android/listener/AdListener;

    invoke-interface {v2}, Lcom/pad/android/listener/AdListener;->onAdPaused()V

    .line 616
    iget-object v2, p0, Lcom/pad/android/iappad/AdController;->listener:Lcom/pad/android/listener/AdListener;

    invoke-interface {v2}, Lcom/pad/android/listener/AdListener;->onAdHidden()V
    :try_end_2c
    .catch Ljava/lang/Exception; {:try_start_1b .. :try_end_2c} :catch_2d

    .line 633
    :cond_2c
    :goto_2c
    return-void

    .line 618
    :catch_2d
    move-exception v0

    .line 620
    .local v0, "e":Ljava/lang/Exception;
    const-string v2, "LBAdController"

    const-string v3, "Error while calling onAdPaused"

    invoke-static {v2, v3}, Lcom/pad/android/util/AdLog;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 621
    const-string v2, "LBAdController"

    invoke-static {v2, v0}, Lcom/pad/android/util/AdLog;->printStackTrace(Ljava/lang/String;Ljava/lang/Exception;)V

    goto :goto_2c

    .line 626
    .end local v0    # "e":Ljava/lang/Exception;
    :cond_3b
    const-string v2, "LBAdController"

    const-string v3, "initializing..."

    invoke-static {v2, v3}, Lcom/pad/android/util/AdLog;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 628
    new-instance v1, Lcom/pad/android/iappad/AdTask;

    iget-object v2, p0, Lcom/pad/android/iappad/AdController;->activity:Landroid/app/Activity;

    iget-object v3, p0, Lcom/pad/android/iappad/AdController;->sectionid:Ljava/lang/String;

    invoke-direct {v1, p0, v2, v3}, Lcom/pad/android/iappad/AdTask;-><init>(Lcom/pad/android/iappad/AdController;Landroid/app/Activity;Ljava/lang/String;)V

    .line 629
    .local v1, "task":Lcom/pad/android/iappad/AdTask;
    iget-object v2, p0, Lcom/pad/android/iappad/AdController;->subid:Ljava/lang/String;

    invoke-virtual {v1, v2}, Lcom/pad/android/iappad/AdTask;->setSubId(Ljava/lang/String;)V

    .line 630
    iget-object v2, p0, Lcom/pad/android/iappad/AdController;->tokens:Ljava/util/List;

    invoke-virtual {v1, v2}, Lcom/pad/android/iappad/AdTask;->setTokens(Ljava/util/List;)V

    .line 631
    iget-boolean v2, p0, Lcom/pad/android/iappad/AdController;->useLocation:Z

    invoke-virtual {v1, v2}, Lcom/pad/android/iappad/AdTask;->setUseLocation(Z)V

    .line 632
    const/4 v2, 0x1

    new-array v2, v2, [Ljava/lang/String;

    const/4 v3, 0x0

    const-string v4, ""

    aput-object v4, v2, v3

    invoke-virtual {v1, v2}, Lcom/pad/android/iappad/AdTask;->execute([Ljava/lang/Object;)Landroid/os/AsyncTask;

    goto :goto_2c
.end method

.method private linkClicked()V
    .registers 59

    .prologue
    .line 1051
    const-string v53, "LBAdController"

    const-string v54, "linkClicked called"

    invoke-static/range {v53 .. v54}, Lcom/pad/android/util/AdLog;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 1052
    move-object/from16 v0, p0

    iget-boolean v0, v0, Lcom/pad/android/iappad/AdController;->linkClicked:Z

    move/from16 v53, v0

    if-nez v53, :cond_961

    .line 1054
    const-string v53, "LBAdController"

    const-string v54, "Loading window..."

    invoke-static/range {v53 .. v54}, Lcom/pad/android/util/AdLog;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 1055
    const/16 v53, 0x0

    move/from16 v0, v53

    move-object/from16 v1, p0

    iput-boolean v0, v1, Lcom/pad/android/iappad/AdController;->homeLoaded:Z

    .line 1056
    const/16 v53, 0x1

    move/from16 v0, v53

    move-object/from16 v1, p0

    iput-boolean v0, v1, Lcom/pad/android/iappad/AdController;->linkClicked:Z

    .line 1057
    move-object/from16 v0, p0

    iget-boolean v0, v0, Lcom/pad/android/iappad/AdController;->loading:Z

    move/from16 v53, v0

    if-nez v53, :cond_961

    .line 1059
    const-string v53, "LBAdController"

    const-string v54, "remove the views if required first..."

    invoke-static/range {v53 .. v54}, Lcom/pad/android/util/AdLog;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 1065
    :try_start_35
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/pad/android/iappad/AdController;->layout:Landroid/widget/RelativeLayout;

    move-object/from16 v53, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/pad/android/iappad/AdController;->webview:Lcom/pad/android/iappad/AdWebView;

    move-object/from16 v54, v0

    invoke-virtual/range {v53 .. v54}, Landroid/widget/RelativeLayout;->removeView(Landroid/view/View;)V

    .line 1066
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/pad/android/iappad/AdController;->layout:Landroid/widget/RelativeLayout;

    move-object/from16 v53, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/pad/android/iappad/AdController;->toolbar:Landroid/view/View;

    move-object/from16 v54, v0

    invoke-virtual/range {v53 .. v54}, Landroid/widget/RelativeLayout;->removeView(Landroid/view/View;)V

    .line 1067
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/pad/android/iappad/AdController;->layout:Landroid/widget/RelativeLayout;

    move-object/from16 v53, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/pad/android/iappad/AdController;->title:Landroid/widget/TextView;

    move-object/from16 v54, v0

    invoke-virtual/range {v53 .. v54}, Landroid/widget/RelativeLayout;->removeView(Landroid/view/View;)V

    .line 1068
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/pad/android/iappad/AdController;->layout:Landroid/widget/RelativeLayout;

    move-object/from16 v53, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/pad/android/iappad/AdController;->footer:Landroid/view/View;

    move-object/from16 v54, v0

    invoke-virtual/range {v53 .. v54}, Landroid/widget/RelativeLayout;->removeView(Landroid/view/View;)V

    .line 1069
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/pad/android/iappad/AdController;->layout:Landroid/widget/RelativeLayout;

    move-object/from16 v53, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/pad/android/iappad/AdController;->footerTitle:Landroid/widget/TextView;

    move-object/from16 v54, v0

    invoke-virtual/range {v53 .. v54}, Landroid/widget/RelativeLayout;->removeView(Landroid/view/View;)V

    .line 1070
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/pad/android/iappad/AdController;->layout:Landroid/widget/RelativeLayout;

    move-object/from16 v53, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/pad/android/iappad/AdController;->backBtn:Landroid/widget/Button;

    move-object/from16 v54, v0

    invoke-virtual/range {v53 .. v54}, Landroid/widget/RelativeLayout;->removeView(Landroid/view/View;)V

    .line 1071
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/pad/android/iappad/AdController;->layout:Landroid/widget/RelativeLayout;

    move-object/from16 v53, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/pad/android/iappad/AdController;->fwdBtn:Landroid/widget/Button;

    move-object/from16 v54, v0

    invoke-virtual/range {v53 .. v54}, Landroid/widget/RelativeLayout;->removeView(Landroid/view/View;)V

    .line 1072
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/pad/android/iappad/AdController;->layout:Landroid/widget/RelativeLayout;

    move-object/from16 v53, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/pad/android/iappad/AdController;->closeBtn:Landroid/widget/Button;

    move-object/from16 v54, v0

    invoke-virtual/range {v53 .. v54}, Landroid/widget/RelativeLayout;->removeView(Landroid/view/View;)V

    .line 1073
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/pad/android/iappad/AdController;->layout:Landroid/widget/RelativeLayout;

    move-object/from16 v53, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/pad/android/iappad/AdController;->homeBtn:Landroid/widget/Button;

    move-object/from16 v54, v0

    invoke-virtual/range {v53 .. v54}, Landroid/widget/RelativeLayout;->removeView(Landroid/view/View;)V

    .line 1074
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/pad/android/iappad/AdController;->layout:Landroid/widget/RelativeLayout;

    move-object/from16 v53, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/pad/android/iappad/AdController;->refreshBtn:Landroid/widget/Button;

    move-object/from16 v54, v0

    invoke-virtual/range {v53 .. v54}, Landroid/widget/RelativeLayout;->removeView(Landroid/view/View;)V

    .line 1075
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/pad/android/iappad/AdController;->pollBtn:Landroid/widget/Button;

    move-object/from16 v53, v0

    if-eqz v53, :cond_dc

    .line 1077
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/pad/android/iappad/AdController;->layout:Landroid/widget/RelativeLayout;

    move-object/from16 v53, v0

    invoke-virtual/range {v53 .. v53}, Landroid/widget/RelativeLayout;->removeAllViews()V
    :try_end_dc
    .catch Ljava/lang/Exception; {:try_start_35 .. :try_end_dc} :catch_a19
    .catch Lorg/json/JSONException; {:try_start_35 .. :try_end_dc} :catch_977

    .line 1083
    :cond_dc
    :goto_dc
    :try_start_dc
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/pad/android/iappad/AdController;->results:Lorg/json/JSONObject;

    move-object/from16 v53, v0

    const-string v54, "clickwindowx"

    invoke-virtual/range {v53 .. v54}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    move-result v51

    .line 1084
    .local v51, "windowx":I
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/pad/android/iappad/AdController;->results:Lorg/json/JSONObject;

    move-object/from16 v53, v0

    const-string v54, "clickwindowy"

    invoke-virtual/range {v53 .. v54}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    move-result v52

    .line 1085
    .local v52, "windowy":I
    new-instance v50, Landroid/view/ViewGroup$MarginLayoutParams;

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/pad/android/iappad/AdController;->results:Lorg/json/JSONObject;

    move-object/from16 v53, v0

    const-string v54, "clickwindowwidth"

    invoke-virtual/range {v53 .. v54}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    move-result v53

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/pad/android/iappad/AdController;->results:Lorg/json/JSONObject;

    move-object/from16 v54, v0

    const-string v55, "clickwindowheight"

    invoke-virtual/range {v54 .. v55}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    move-result v54

    move-object/from16 v0, v50

    move/from16 v1, v53

    move/from16 v2, v54

    invoke-direct {v0, v1, v2}, Landroid/view/ViewGroup$MarginLayoutParams;-><init>(II)V

    .line 1086
    .local v50, "wM":Landroid/view/ViewGroup$MarginLayoutParams;
    const/16 v53, 0x0

    const/16 v54, 0x0

    invoke-virtual/range {v50 .. v54}, Landroid/view/ViewGroup$MarginLayoutParams;->setMargins(IIII)V

    .line 1087
    new-instance v49, Landroid/widget/RelativeLayout$LayoutParams;

    invoke-direct/range {v49 .. v50}, Landroid/widget/RelativeLayout$LayoutParams;-><init>(Landroid/view/ViewGroup$MarginLayoutParams;)V

    .line 1090
    .local v49, "wL":Landroid/widget/RelativeLayout$LayoutParams;
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/pad/android/iappad/AdController;->results:Lorg/json/JSONObject;

    move-object/from16 v53, v0

    const-string v54, "clicktitlewidth"

    invoke-virtual/range {v53 .. v54}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    move-result v44

    .line 1091
    .local v44, "toolbarwidth":I
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/pad/android/iappad/AdController;->results:Lorg/json/JSONObject;

    move-object/from16 v53, v0

    const-string v54, "clicktitleheight"

    invoke-virtual/range {v53 .. v54}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    move-result v43

    .line 1092
    .local v43, "toolbarheight":I
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/pad/android/iappad/AdController;->results:Lorg/json/JSONObject;

    move-object/from16 v53, v0

    const-string v54, "clicktitlex"

    invoke-virtual/range {v53 .. v54}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    move-result v45

    .line 1093
    .local v45, "toolbarx":I
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/pad/android/iappad/AdController;->results:Lorg/json/JSONObject;

    move-object/from16 v53, v0

    const-string v54, "clicktitley"

    invoke-virtual/range {v53 .. v54}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    move-result v46

    .line 1094
    .local v46, "toolbary":I
    new-instance v38, Landroid/view/ViewGroup$MarginLayoutParams;

    move-object/from16 v0, v38

    move/from16 v1, v44

    move/from16 v2, v43

    invoke-direct {v0, v1, v2}, Landroid/view/ViewGroup$MarginLayoutParams;-><init>(II)V

    .line 1095
    .local v38, "tM":Landroid/view/ViewGroup$MarginLayoutParams;
    const/16 v53, 0x0

    const/16 v54, 0x0

    move-object/from16 v0, v38

    move/from16 v1, v45

    move/from16 v2, v46

    move/from16 v3, v53

    move/from16 v4, v54

    invoke-virtual {v0, v1, v2, v3, v4}, Landroid/view/ViewGroup$MarginLayoutParams;->setMargins(IIII)V

    .line 1096
    new-instance v37, Landroid/widget/RelativeLayout$LayoutParams;

    invoke-direct/range {v37 .. v38}, Landroid/widget/RelativeLayout$LayoutParams;-><init>(Landroid/view/ViewGroup$MarginLayoutParams;)V
    :try_end_174
    .catch Lorg/json/JSONException; {:try_start_dc .. :try_end_174} :catch_977

    .line 1098
    .local v37, "tL":Landroid/widget/RelativeLayout$LayoutParams;
    :try_start_174
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/pad/android/iappad/AdController;->toolbar:Landroid/view/View;

    move-object/from16 v53, v0

    invoke-virtual/range {v53 .. v53}, Landroid/view/View;->invalidate()V
    :try_end_17d
    .catch Ljava/lang/Exception; {:try_start_174 .. :try_end_17d} :catch_a16
    .catch Lorg/json/JSONException; {:try_start_174 .. :try_end_17d} :catch_977

    .line 1101
    :goto_17d
    :try_start_17d
    new-instance v53, Landroid/view/View;

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/pad/android/iappad/AdController;->activity:Landroid/app/Activity;

    move-object/from16 v54, v0

    invoke-direct/range {v53 .. v54}, Landroid/view/View;-><init>(Landroid/content/Context;)V

    move-object/from16 v0, v53

    move-object/from16 v1, p0

    iput-object v0, v1, Lcom/pad/android/iappad/AdController;->toolbar:Landroid/view/View;

    .line 1102
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/pad/android/iappad/AdController;->results:Lorg/json/JSONObject;

    move-object/from16 v53, v0

    const-string v54, "clicktitlecolor"

    invoke-virtual/range {v53 .. v54}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v12

    .line 1103
    .local v12, "clr":Ljava/lang/String;
    const-string v53, ""

    move-object/from16 v0, v53

    invoke-virtual {v12, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v53

    if-nez v53, :cond_1a6

    if-nez v12, :cond_1a8

    .line 1105
    :cond_1a6
    const-string v12, "#E6E6E6"

    .line 1107
    :cond_1a8
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/pad/android/iappad/AdController;->toolbar:Landroid/view/View;

    move-object/from16 v53, v0

    invoke-static {v12}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    move-result v54

    invoke-virtual/range {v53 .. v54}, Landroid/view/View;->setBackgroundColor(I)V
    :try_end_1b5
    .catch Lorg/json/JSONException; {:try_start_17d .. :try_end_1b5} :catch_977

    .line 1111
    :try_start_1b5
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/pad/android/iappad/AdController;->title:Landroid/widget/TextView;

    move-object/from16 v53, v0

    invoke-virtual/range {v53 .. v53}, Landroid/widget/TextView;->invalidate()V
    :try_end_1be
    .catch Ljava/lang/Exception; {:try_start_1b5 .. :try_end_1be} :catch_a13
    .catch Lorg/json/JSONException; {:try_start_1b5 .. :try_end_1be} :catch_977

    .line 1114
    :goto_1be
    :try_start_1be
    new-instance v53, Landroid/widget/TextView;

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/pad/android/iappad/AdController;->activity:Landroid/app/Activity;

    move-object/from16 v54, v0

    invoke-direct/range {v53 .. v54}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    move-object/from16 v0, v53

    move-object/from16 v1, p0

    iput-object v0, v1, Lcom/pad/android/iappad/AdController;->title:Landroid/widget/TextView;

    .line 1115
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/pad/android/iappad/AdController;->title:Landroid/widget/TextView;

    move-object/from16 v53, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/pad/android/iappad/AdController;->results:Lorg/json/JSONObject;

    move-object/from16 v54, v0

    const-string v55, "clicktitletext"

    invoke-virtual/range {v54 .. v55}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v54

    invoke-virtual/range {v53 .. v54}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 1117
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/pad/android/iappad/AdController;->results:Lorg/json/JSONObject;

    move-object/from16 v53, v0

    const-string v54, "clicktitletextcolor"

    invoke-virtual/range {v53 .. v54}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v9

    .line 1118
    .local v9, "clk":Ljava/lang/String;
    const-string v53, ""

    move-object/from16 v0, v53

    invoke-virtual {v9, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v53

    if-nez v53, :cond_1fc

    if-nez v9, :cond_1fe

    .line 1120
    :cond_1fc
    const-string v9, "#000000"

    .line 1123
    :cond_1fe
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/pad/android/iappad/AdController;->title:Landroid/widget/TextView;

    move-object/from16 v53, v0

    invoke-static {v9}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    move-result v54

    invoke-virtual/range {v53 .. v54}, Landroid/widget/TextView;->setTextColor(I)V

    .line 1124
    new-instance v48, Landroid/view/ViewGroup$MarginLayoutParams;

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/pad/android/iappad/AdController;->results:Lorg/json/JSONObject;

    move-object/from16 v53, v0

    const-string v54, "clicktitletextwidth"

    invoke-virtual/range {v53 .. v54}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    move-result v53

    add-int/lit8 v54, v43, -0x2

    move-object/from16 v0, v48

    move/from16 v1, v53

    move/from16 v2, v54

    invoke-direct {v0, v1, v2}, Landroid/view/ViewGroup$MarginLayoutParams;-><init>(II)V

    .line 1125
    .local v48, "tvp":Landroid/view/ViewGroup$MarginLayoutParams;
    add-int/lit8 v41, v45, 0x14

    .line 1126
    .local v41, "titlex":I
    add-int/lit8 v42, v46, 0x8

    .line 1127
    .local v42, "titley":I
    const/16 v53, 0x0

    const/16 v54, 0x0

    move-object/from16 v0, v48

    move/from16 v1, v41

    move/from16 v2, v42

    move/from16 v3, v53

    move/from16 v4, v54

    invoke-virtual {v0, v1, v2, v3, v4}, Landroid/view/ViewGroup$MarginLayoutParams;->setMargins(IIII)V

    .line 1129
    new-instance v47, Landroid/widget/RelativeLayout$LayoutParams;

    invoke-direct/range {v47 .. v48}, Landroid/widget/RelativeLayout$LayoutParams;-><init>(Landroid/view/ViewGroup$MarginLayoutParams;)V

    .line 1132
    .local v47, "tvl":Landroid/widget/RelativeLayout$LayoutParams;
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/pad/android/iappad/AdController;->results:Lorg/json/JSONObject;

    move-object/from16 v53, v0

    const-string v54, "clickfooterx"

    invoke-virtual/range {v53 .. v54}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    move-result v24

    .line 1133
    .local v24, "footerx":I
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/pad/android/iappad/AdController;->results:Lorg/json/JSONObject;

    move-object/from16 v53, v0

    const-string v54, "clickfootery"

    invoke-virtual/range {v53 .. v54}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    move-result v25

    .line 1134
    .local v25, "footery":I
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/pad/android/iappad/AdController;->results:Lorg/json/JSONObject;

    move-object/from16 v53, v0

    const-string v54, "clickfooterheight"

    invoke-virtual/range {v53 .. v54}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    move-result v23

    .line 1135
    .local v23, "footerheight":I
    new-instance v19, Landroid/view/ViewGroup$MarginLayoutParams;

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/pad/android/iappad/AdController;->results:Lorg/json/JSONObject;

    move-object/from16 v53, v0

    const-string v54, "clickfooterwidth"

    invoke-virtual/range {v53 .. v54}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    move-result v53

    move-object/from16 v0, v19

    move/from16 v1, v53

    move/from16 v2, v23

    invoke-direct {v0, v1, v2}, Landroid/view/ViewGroup$MarginLayoutParams;-><init>(II)V

    .line 1136
    .local v19, "fM":Landroid/view/ViewGroup$MarginLayoutParams;
    const/16 v53, 0x0

    const/16 v54, 0x0

    move-object/from16 v0, v19

    move/from16 v1, v24

    move/from16 v2, v25

    move/from16 v3, v53

    move/from16 v4, v54

    invoke-virtual {v0, v1, v2, v3, v4}, Landroid/view/ViewGroup$MarginLayoutParams;->setMargins(IIII)V

    .line 1137
    new-instance v18, Landroid/widget/RelativeLayout$LayoutParams;

    invoke-direct/range {v18 .. v19}, Landroid/widget/RelativeLayout$LayoutParams;-><init>(Landroid/view/ViewGroup$MarginLayoutParams;)V

    .line 1138
    .local v18, "fL":Landroid/widget/RelativeLayout$LayoutParams;
    new-instance v53, Landroid/view/View;

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/pad/android/iappad/AdController;->activity:Landroid/app/Activity;

    move-object/from16 v54, v0

    invoke-direct/range {v53 .. v54}, Landroid/view/View;-><init>(Landroid/content/Context;)V

    move-object/from16 v0, v53

    move-object/from16 v1, p0

    iput-object v0, v1, Lcom/pad/android/iappad/AdController;->footer:Landroid/view/View;

    .line 1139
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/pad/android/iappad/AdController;->results:Lorg/json/JSONObject;

    move-object/from16 v53, v0

    const-string v54, "clickfootercolor"

    invoke-virtual/range {v53 .. v54}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v17

    .line 1140
    .local v17, "fClr":Ljava/lang/String;
    const-string v53, ""

    move-object/from16 v0, v17

    move-object/from16 v1, v53

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v53

    if-nez v53, :cond_2ba

    if-nez v17, :cond_2bc

    .line 1142
    :cond_2ba
    const-string v17, "#E6E6E6"

    .line 1144
    :cond_2bc
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/pad/android/iappad/AdController;->footer:Landroid/view/View;

    move-object/from16 v53, v0

    invoke-static/range {v17 .. v17}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    move-result v54

    invoke-virtual/range {v53 .. v54}, Landroid/view/View;->setBackgroundColor(I)V

    .line 1147
    new-instance v53, Landroid/widget/TextView;

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/pad/android/iappad/AdController;->activity:Landroid/app/Activity;

    move-object/from16 v54, v0

    invoke-direct/range {v53 .. v54}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    move-object/from16 v0, v53

    move-object/from16 v1, p0

    iput-object v0, v1, Lcom/pad/android/iappad/AdController;->footerTitle:Landroid/widget/TextView;

    .line 1148
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/pad/android/iappad/AdController;->footerTitle:Landroid/widget/TextView;

    move-object/from16 v53, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/pad/android/iappad/AdController;->results:Lorg/json/JSONObject;

    move-object/from16 v54, v0

    const-string v55, "clickfootertext"

    invoke-virtual/range {v54 .. v55}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v54

    invoke-virtual/range {v53 .. v54}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 1149
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/pad/android/iappad/AdController;->footerTitle:Landroid/widget/TextView;

    move-object/from16 v53, v0

    const/high16 v54, 0x41200000    # 10.0f

    invoke-virtual/range {v53 .. v54}, Landroid/widget/TextView;->setTextSize(F)V

    .line 1150
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/pad/android/iappad/AdController;->results:Lorg/json/JSONObject;

    move-object/from16 v53, v0

    const-string v54, "clickfootertextcolor"

    invoke-virtual/range {v53 .. v54}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v16

    .line 1151
    .local v16, "fClk":Ljava/lang/String;
    const-string v53, ""

    move-object/from16 v0, v16

    move-object/from16 v1, v53

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v53

    if-nez v53, :cond_314

    if-nez v16, :cond_316

    .line 1153
    :cond_314
    const-string v16, "#000000"

    .line 1155
    :cond_316
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/pad/android/iappad/AdController;->footerTitle:Landroid/widget/TextView;

    move-object/from16 v53, v0

    invoke-static/range {v16 .. v16}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    move-result v54

    invoke-virtual/range {v53 .. v54}, Landroid/widget/TextView;->setTextColor(I)V

    .line 1156
    new-instance v29, Landroid/view/ViewGroup$MarginLayoutParams;

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/pad/android/iappad/AdController;->results:Lorg/json/JSONObject;

    move-object/from16 v53, v0

    const-string v54, "clickfootertextwidth"

    invoke-virtual/range {v53 .. v54}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    move-result v53

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/pad/android/iappad/AdController;->results:Lorg/json/JSONObject;

    move-object/from16 v54, v0

    const-string v55, "clickfootertextheight"

    invoke-virtual/range {v54 .. v55}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    move-result v54

    move-object/from16 v0, v29

    move/from16 v1, v53

    move/from16 v2, v54

    invoke-direct {v0, v1, v2}, Landroid/view/ViewGroup$MarginLayoutParams;-><init>(II)V

    .line 1157
    .local v29, "fvp":Landroid/view/ViewGroup$MarginLayoutParams;
    move/from16 v20, v24

    .line 1158
    .local v20, "fTitlex":I
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/pad/android/iappad/AdController;->results:Lorg/json/JSONObject;

    move-object/from16 v53, v0

    const-string v54, "shownavigation"

    invoke-virtual/range {v53 .. v54}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    move-result v53

    const/16 v54, 0x1

    move/from16 v0, v53

    move/from16 v1, v54

    if-ne v0, v1, :cond_962

    .line 1160
    add-int/lit8 v20, v20, 0x46

    .line 1166
    :goto_35e
    add-int/lit8 v21, v25, 0x5

    .line 1167
    .local v21, "fTitley":I
    const/16 v53, 0x0

    const/16 v54, 0x0

    move-object/from16 v0, v29

    move/from16 v1, v20

    move/from16 v2, v21

    move/from16 v3, v53

    move/from16 v4, v54

    invoke-virtual {v0, v1, v2, v3, v4}, Landroid/view/ViewGroup$MarginLayoutParams;->setMargins(IIII)V

    .line 1168
    new-instance v28, Landroid/widget/RelativeLayout$LayoutParams;

    invoke-direct/range {v28 .. v29}, Landroid/widget/RelativeLayout$LayoutParams;-><init>(Landroid/view/ViewGroup$MarginLayoutParams;)V

    .line 1171
    .local v28, "fvl":Landroid/widget/RelativeLayout$LayoutParams;
    add-int/lit8 v53, v43, -0x5

    const/16 v54, 0x0

    invoke-static/range {v53 .. v54}, Ljava/lang/Math;->max(II)I

    move-result v40

    .line 1172
    .local v40, "titleBtnHeight":I
    div-int/lit8 v53, v40, 0x2

    move/from16 v0, v53

    int-to-float v0, v0

    move/from16 v39, v0

    .line 1173
    .local v39, "titleBtnFont":F
    const/high16 v53, 0x41200000    # 10.0f

    cmpl-float v53, v39, v53

    if-lez v53, :cond_38d

    .line 1175
    const/high16 v39, 0x41200000    # 10.0f

    .line 1177
    :cond_38d
    add-int/lit8 v53, v23, -0x5

    const/16 v54, 0x0

    invoke-static/range {v53 .. v54}, Ljava/lang/Math;->max(II)I

    move-result v35

    .line 1178
    .local v35, "navBtnHeight":I
    div-int/lit8 v53, v35, 0x2

    move/from16 v0, v53

    int-to-float v0, v0

    move/from16 v34, v0

    .line 1179
    .local v34, "navBtnFont":F
    const/high16 v53, 0x41200000    # 10.0f

    cmpl-float v53, v34, v53

    if-lez v53, :cond_3a4

    .line 1181
    const/high16 v34, 0x41200000    # 10.0f

    .line 1185
    :cond_3a4
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/pad/android/iappad/AdController;->homeBtn:Landroid/widget/Button;

    move-object/from16 v53, v0

    if-eqz v53, :cond_3b5

    .line 1187
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/pad/android/iappad/AdController;->homeBtn:Landroid/widget/Button;

    move-object/from16 v53, v0

    invoke-virtual/range {v53 .. v53}, Landroid/widget/Button;->invalidate()V

    .line 1189
    :cond_3b5
    new-instance v53, Landroid/widget/Button;

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/pad/android/iappad/AdController;->activity:Landroid/app/Activity;

    move-object/from16 v54, v0

    invoke-direct/range {v53 .. v54}, Landroid/widget/Button;-><init>(Landroid/content/Context;)V

    move-object/from16 v0, v53

    move-object/from16 v1, p0

    iput-object v0, v1, Lcom/pad/android/iappad/AdController;->homeBtn:Landroid/widget/Button;

    .line 1190
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/pad/android/iappad/AdController;->homeBtn:Landroid/widget/Button;

    move-object/from16 v53, v0

    const-string v54, "Back"

    invoke-virtual/range {v53 .. v54}, Landroid/widget/Button;->setText(Ljava/lang/CharSequence;)V

    .line 1191
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/pad/android/iappad/AdController;->homeBtn:Landroid/widget/Button;

    move-object/from16 v53, v0

    move-object/from16 v0, v53

    move/from16 v1, v34

    invoke-virtual {v0, v1}, Landroid/widget/Button;->setTextSize(F)V

    .line 1192
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/pad/android/iappad/AdController;->homeBtn:Landroid/widget/Button;

    move-object/from16 v53, v0

    invoke-static {v9}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    move-result v54

    invoke-virtual/range {v53 .. v54}, Landroid/widget/Button;->setTextColor(I)V

    .line 1193
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/pad/android/iappad/AdController;->homeBtn:Landroid/widget/Button;

    move-object/from16 v53, v0

    const/16 v54, 0x0

    const/16 v55, 0x0

    const/16 v56, 0x0

    const/16 v57, 0x0

    invoke-virtual/range {v53 .. v57}, Landroid/widget/Button;->setPadding(IIII)V

    .line 1194
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/pad/android/iappad/AdController;->homeBtn:Landroid/widget/Button;

    move-object/from16 v53, v0

    invoke-static/range {v17 .. v17}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    move-result v54

    invoke-virtual/range {v53 .. v54}, Landroid/widget/Button;->setBackgroundColor(I)V

    .line 1195
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/pad/android/iappad/AdController;->homeBtn:Landroid/widget/Button;

    move-object/from16 v53, v0

    new-instance v54, Lcom/pad/android/iappad/AdController$5;

    move-object/from16 v0, v54

    move-object/from16 v1, p0

    invoke-direct {v0, v1}, Lcom/pad/android/iappad/AdController$5;-><init>(Lcom/pad/android/iappad/AdController;)V

    invoke-virtual/range {v53 .. v54}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 1200
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/pad/android/iappad/AdController;->closeBtn:Landroid/widget/Button;

    move-object/from16 v53, v0

    if-eqz v53, :cond_42c

    .line 1202
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/pad/android/iappad/AdController;->closeBtn:Landroid/widget/Button;

    move-object/from16 v53, v0

    invoke-virtual/range {v53 .. v53}, Landroid/widget/Button;->invalidate()V

    .line 1204
    :cond_42c
    new-instance v53, Landroid/widget/Button;

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/pad/android/iappad/AdController;->activity:Landroid/app/Activity;

    move-object/from16 v54, v0

    invoke-direct/range {v53 .. v54}, Landroid/widget/Button;-><init>(Landroid/content/Context;)V

    move-object/from16 v0, v53

    move-object/from16 v1, p0

    iput-object v0, v1, Lcom/pad/android/iappad/AdController;->closeBtn:Landroid/widget/Button;

    .line 1205
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/pad/android/iappad/AdController;->closeBtn:Landroid/widget/Button;

    move-object/from16 v53, v0

    const-string v54, "X"

    invoke-virtual/range {v53 .. v54}, Landroid/widget/Button;->setText(Ljava/lang/CharSequence;)V

    .line 1207
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/pad/android/iappad/AdController;->closeBtn:Landroid/widget/Button;

    move-object/from16 v53, v0

    move-object/from16 v0, v53

    move/from16 v1, v39

    invoke-virtual {v0, v1}, Landroid/widget/Button;->setTextSize(F)V

    .line 1208
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/pad/android/iappad/AdController;->closeBtn:Landroid/widget/Button;

    move-object/from16 v53, v0

    invoke-static {v9}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    move-result v54

    invoke-virtual/range {v53 .. v54}, Landroid/widget/Button;->setTextColor(I)V

    .line 1209
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/pad/android/iappad/AdController;->closeBtn:Landroid/widget/Button;

    move-object/from16 v53, v0

    const/16 v54, 0x0

    const/16 v55, 0x0

    const/16 v56, 0x0

    const/16 v57, 0x0

    invoke-virtual/range {v53 .. v57}, Landroid/widget/Button;->setPadding(IIII)V

    .line 1210
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/pad/android/iappad/AdController;->closeBtn:Landroid/widget/Button;

    move-object/from16 v53, v0

    invoke-static {v12}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    move-result v54

    invoke-virtual/range {v53 .. v54}, Landroid/widget/Button;->setBackgroundColor(I)V

    .line 1211
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/pad/android/iappad/AdController;->closeBtn:Landroid/widget/Button;

    move-object/from16 v53, v0

    new-instance v54, Lcom/pad/android/iappad/AdController$6;

    move-object/from16 v0, v54

    move-object/from16 v1, p0

    invoke-direct {v0, v1}, Lcom/pad/android/iappad/AdController$6;-><init>(Lcom/pad/android/iappad/AdController;)V

    invoke-virtual/range {v53 .. v54}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 1217
    new-instance v53, Landroid/widget/Button;

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/pad/android/iappad/AdController;->activity:Landroid/app/Activity;

    move-object/from16 v54, v0

    invoke-direct/range {v53 .. v54}, Landroid/widget/Button;-><init>(Landroid/content/Context;)V

    move-object/from16 v0, v53

    move-object/from16 v1, p0

    iput-object v0, v1, Lcom/pad/android/iappad/AdController;->fwdBtn:Landroid/widget/Button;

    .line 1218
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/pad/android/iappad/AdController;->fwdBtn:Landroid/widget/Button;

    move-object/from16 v53, v0

    const-string v54, ">"

    invoke-virtual/range {v53 .. v54}, Landroid/widget/Button;->setText(Ljava/lang/CharSequence;)V

    .line 1219
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/pad/android/iappad/AdController;->fwdBtn:Landroid/widget/Button;

    move-object/from16 v53, v0

    move-object/from16 v0, v53

    move/from16 v1, v34

    invoke-virtual {v0, v1}, Landroid/widget/Button;->setTextSize(F)V

    .line 1220
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/pad/android/iappad/AdController;->fwdBtn:Landroid/widget/Button;

    move-object/from16 v53, v0

    invoke-static {v9}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    move-result v54

    invoke-virtual/range {v53 .. v54}, Landroid/widget/Button;->setTextColor(I)V

    .line 1221
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/pad/android/iappad/AdController;->fwdBtn:Landroid/widget/Button;

    move-object/from16 v53, v0

    const/16 v54, 0x0

    const/16 v55, 0x0

    const/16 v56, 0x0

    const/16 v57, 0x0

    invoke-virtual/range {v53 .. v57}, Landroid/widget/Button;->setPadding(IIII)V

    .line 1222
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/pad/android/iappad/AdController;->fwdBtn:Landroid/widget/Button;

    move-object/from16 v53, v0

    invoke-static/range {v17 .. v17}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    move-result v54

    invoke-virtual/range {v53 .. v54}, Landroid/widget/Button;->setBackgroundColor(I)V

    .line 1223
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/pad/android/iappad/AdController;->fwdBtn:Landroid/widget/Button;

    move-object/from16 v53, v0

    new-instance v54, Lcom/pad/android/iappad/AdController$7;

    move-object/from16 v0, v54

    move-object/from16 v1, p0

    invoke-direct {v0, v1}, Lcom/pad/android/iappad/AdController$7;-><init>(Lcom/pad/android/iappad/AdController;)V

    invoke-virtual/range {v53 .. v54}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 1229
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/pad/android/iappad/AdController;->backBtn:Landroid/widget/Button;

    move-object/from16 v53, v0

    if-eqz v53, :cond_509

    .line 1231
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/pad/android/iappad/AdController;->backBtn:Landroid/widget/Button;

    move-object/from16 v53, v0

    invoke-virtual/range {v53 .. v53}, Landroid/widget/Button;->invalidate()V

    .line 1233
    :cond_509
    new-instance v53, Landroid/widget/Button;

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/pad/android/iappad/AdController;->activity:Landroid/app/Activity;

    move-object/from16 v54, v0

    invoke-direct/range {v53 .. v54}, Landroid/widget/Button;-><init>(Landroid/content/Context;)V

    move-object/from16 v0, v53

    move-object/from16 v1, p0

    iput-object v0, v1, Lcom/pad/android/iappad/AdController;->backBtn:Landroid/widget/Button;

    .line 1234
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/pad/android/iappad/AdController;->backBtn:Landroid/widget/Button;

    move-object/from16 v53, v0

    const-string v54, "<"

    invoke-virtual/range {v53 .. v54}, Landroid/widget/Button;->setText(Ljava/lang/CharSequence;)V

    .line 1235
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/pad/android/iappad/AdController;->backBtn:Landroid/widget/Button;

    move-object/from16 v53, v0

    move-object/from16 v0, v53

    move/from16 v1, v34

    invoke-virtual {v0, v1}, Landroid/widget/Button;->setTextSize(F)V

    .line 1236
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/pad/android/iappad/AdController;->backBtn:Landroid/widget/Button;

    move-object/from16 v53, v0

    invoke-static {v9}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    move-result v54

    invoke-virtual/range {v53 .. v54}, Landroid/widget/Button;->setTextColor(I)V

    .line 1237
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/pad/android/iappad/AdController;->backBtn:Landroid/widget/Button;

    move-object/from16 v53, v0

    const/16 v54, 0x0

    const/16 v55, 0x0

    const/16 v56, 0x0

    const/16 v57, 0x0

    invoke-virtual/range {v53 .. v57}, Landroid/widget/Button;->setPadding(IIII)V

    .line 1238
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/pad/android/iappad/AdController;->backBtn:Landroid/widget/Button;

    move-object/from16 v53, v0

    invoke-static/range {v17 .. v17}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    move-result v54

    invoke-virtual/range {v53 .. v54}, Landroid/widget/Button;->setBackgroundColor(I)V

    .line 1239
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/pad/android/iappad/AdController;->backBtn:Landroid/widget/Button;

    move-object/from16 v53, v0

    new-instance v54, Lcom/pad/android/iappad/AdController$8;

    move-object/from16 v0, v54

    move-object/from16 v1, p0

    invoke-direct {v0, v1}, Lcom/pad/android/iappad/AdController$8;-><init>(Lcom/pad/android/iappad/AdController;)V

    invoke-virtual/range {v53 .. v54}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 1245
    new-instance v33, Landroid/view/ViewGroup$MarginLayoutParams;

    const/16 v53, 0x1e

    move-object/from16 v0, v33

    move/from16 v1, v53

    move/from16 v2, v35

    invoke-direct {v0, v1, v2}, Landroid/view/ViewGroup$MarginLayoutParams;-><init>(II)V

    .line 1246
    .local v33, "nB":Landroid/view/ViewGroup$MarginLayoutParams;
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/pad/android/iappad/AdController;->results:Lorg/json/JSONObject;

    move-object/from16 v53, v0

    const-string v54, "clickfooterheight"

    invoke-virtual/range {v53 .. v54}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    move-result v53

    sub-int v53, v53, v35

    div-int/lit8 v53, v53, 0x2

    add-int v53, v53, v25

    add-int/lit8 v8, v53, 0x3

    .line 1247
    .local v8, "btny":I
    add-int/lit8 v53, v24, 0x5

    const/16 v54, 0x0

    const/16 v55, 0x0

    move-object/from16 v0, v33

    move/from16 v1, v53

    move/from16 v2, v54

    move/from16 v3, v55

    invoke-virtual {v0, v1, v8, v2, v3}, Landroid/view/ViewGroup$MarginLayoutParams;->setMargins(IIII)V

    .line 1248
    new-instance v5, Landroid/widget/RelativeLayout$LayoutParams;

    move-object/from16 v0, v33

    invoke-direct {v5, v0}, Landroid/widget/RelativeLayout$LayoutParams;-><init>(Landroid/view/ViewGroup$MarginLayoutParams;)V

    .line 1249
    .local v5, "bB":Landroid/widget/RelativeLayout$LayoutParams;
    add-int/lit8 v53, v24, 0x5

    add-int/lit8 v53, v53, 0x1e

    const/16 v54, 0x0

    const/16 v55, 0x0

    move-object/from16 v0, v33

    move/from16 v1, v53

    move/from16 v2, v54

    move/from16 v3, v55

    invoke-virtual {v0, v1, v8, v2, v3}, Landroid/view/ViewGroup$MarginLayoutParams;->setMargins(IIII)V

    .line 1250
    new-instance v15, Landroid/widget/RelativeLayout$LayoutParams;

    move-object/from16 v0, v33

    invoke-direct {v15, v0}, Landroid/widget/RelativeLayout$LayoutParams;-><init>(Landroid/view/ViewGroup$MarginLayoutParams;)V

    .line 1254
    .local v15, "fB":Landroid/widget/RelativeLayout$LayoutParams;
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/pad/android/iappad/AdController;->layout:Landroid/widget/RelativeLayout;

    move-object/from16 v53, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/pad/android/iappad/AdController;->webview:Lcom/pad/android/iappad/AdWebView;

    move-object/from16 v54, v0

    move-object/from16 v0, v53

    move-object/from16 v1, v54

    move-object/from16 v2, v49

    invoke-virtual {v0, v1, v2}, Landroid/widget/RelativeLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 1256
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/pad/android/iappad/AdController;->listener:Lcom/pad/android/listener/AdListener;

    move-object/from16 v53, v0
    :try_end_5dd
    .catch Lorg/json/JSONException; {:try_start_1be .. :try_end_5dd} :catch_977

    if-eqz v53, :cond_603

    .line 1262
    :try_start_5df
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/pad/android/iappad/AdController;->results:Lorg/json/JSONObject;

    move-object/from16 v53, v0

    const-string v54, "useclickwindow"

    invoke-virtual/range {v53 .. v54}, Lorg/json/JSONObject;->get(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v53

    const-string v54, "1"

    invoke-virtual/range {v53 .. v54}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v53

    if-nez v53, :cond_603

    .line 1264
    const-string v53, "LBAdController"

    const-string v54, "onAdClicked triggered"

    invoke-static/range {v53 .. v54}, Lcom/pad/android/util/AdLog;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 1265
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/pad/android/iappad/AdController;->listener:Lcom/pad/android/listener/AdListener;

    move-object/from16 v53, v0

    invoke-interface/range {v53 .. v53}, Lcom/pad/android/listener/AdListener;->onAdClicked()V
    :try_end_603
    .catch Ljava/lang/Exception; {:try_start_5df .. :try_end_603} :catch_966
    .catch Lorg/json/JSONException; {:try_start_5df .. :try_end_603} :catch_977

    .line 1275
    :cond_603
    :goto_603
    :try_start_603
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/pad/android/iappad/AdController;->results:Lorg/json/JSONObject;

    move-object/from16 v53, v0

    const-string v54, "clicktitlevisible"

    invoke-virtual/range {v53 .. v54}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    move-result v53

    const/16 v54, 0x1

    move/from16 v0, v53

    move/from16 v1, v54

    if-ne v0, v1, :cond_6c3

    .line 1277
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/pad/android/iappad/AdController;->layout:Landroid/widget/RelativeLayout;

    move-object/from16 v53, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/pad/android/iappad/AdController;->toolbar:Landroid/view/View;

    move-object/from16 v54, v0

    move-object/from16 v0, v53

    move-object/from16 v1, v54

    move-object/from16 v2, v37

    invoke-virtual {v0, v1, v2}, Landroid/widget/RelativeLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 1278
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/pad/android/iappad/AdController;->results:Lorg/json/JSONObject;

    move-object/from16 v53, v0

    const-string v54, "clicktitletext"

    invoke-virtual/range {v53 .. v54}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v53

    const-string v54, ""

    invoke-virtual/range {v53 .. v54}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v53

    if-nez v53, :cond_655

    .line 1280
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/pad/android/iappad/AdController;->layout:Landroid/widget/RelativeLayout;

    move-object/from16 v53, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/pad/android/iappad/AdController;->title:Landroid/widget/TextView;

    move-object/from16 v54, v0

    move-object/from16 v0, v53

    move-object/from16 v1, v54

    move-object/from16 v2, v47

    invoke-virtual {v0, v1, v2}, Landroid/widget/RelativeLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 1282
    :cond_655
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/pad/android/iappad/AdController;->results:Lorg/json/JSONObject;

    move-object/from16 v53, v0

    const-string v54, "showclose"

    invoke-virtual/range {v53 .. v54}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    move-result v53

    const/16 v54, 0x1

    move/from16 v0, v53

    move/from16 v1, v54

    if-ne v0, v1, :cond_6c3

    .line 1284
    new-instance v53, Landroid/view/ViewGroup$MarginLayoutParams;

    const/16 v54, 0x37

    move-object/from16 v0, v53

    move/from16 v1, v54

    move/from16 v2, v40

    invoke-direct {v0, v1, v2}, Landroid/view/ViewGroup$MarginLayoutParams;-><init>(II)V

    move-object/from16 v0, v53

    move-object/from16 v1, p0

    iput-object v0, v1, Lcom/pad/android/iappad/AdController;->mlpC:Landroid/view/ViewGroup$MarginLayoutParams;

    .line 1285
    add-int v53, v44, v45

    add-int/lit8 v53, v53, -0x37

    add-int/lit8 v10, v53, -0x5

    .line 1286
    .local v10, "closex":I
    sub-int v53, v43, v40

    div-int/lit8 v53, v53, 0x2

    add-int v53, v53, v46

    add-int/lit8 v11, v53, 0x2

    .line 1287
    .local v11, "closey":I
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/pad/android/iappad/AdController;->mlpC:Landroid/view/ViewGroup$MarginLayoutParams;

    move-object/from16 v53, v0

    const/16 v54, 0x0

    const/16 v55, 0x0

    move-object/from16 v0, v53

    move/from16 v1, v54

    move/from16 v2, v55

    invoke-virtual {v0, v10, v11, v1, v2}, Landroid/view/ViewGroup$MarginLayoutParams;->setMargins(IIII)V

    .line 1288
    new-instance v53, Landroid/widget/RelativeLayout$LayoutParams;

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/pad/android/iappad/AdController;->mlpC:Landroid/view/ViewGroup$MarginLayoutParams;

    move-object/from16 v54, v0

    invoke-direct/range {v53 .. v54}, Landroid/widget/RelativeLayout$LayoutParams;-><init>(Landroid/view/ViewGroup$MarginLayoutParams;)V

    move-object/from16 v0, v53

    move-object/from16 v1, p0

    iput-object v0, v1, Lcom/pad/android/iappad/AdController;->lpC:Landroid/widget/RelativeLayout$LayoutParams;

    .line 1289
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/pad/android/iappad/AdController;->layout:Landroid/widget/RelativeLayout;

    move-object/from16 v53, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/pad/android/iappad/AdController;->closeBtn:Landroid/widget/Button;

    move-object/from16 v54, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/pad/android/iappad/AdController;->lpC:Landroid/widget/RelativeLayout$LayoutParams;

    move-object/from16 v55, v0

    invoke-virtual/range {v53 .. v55}, Landroid/widget/RelativeLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 1293
    .end local v10    # "closex":I
    .end local v11    # "closey":I
    :cond_6c3
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/pad/android/iappad/AdController;->results:Lorg/json/JSONObject;

    move-object/from16 v53, v0

    const-string v54, "clickfootervisible"

    invoke-virtual/range {v53 .. v54}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    move-result v53

    const/16 v54, 0x1

    move/from16 v0, v53

    move/from16 v1, v54

    if-ne v0, v1, :cond_7b5

    .line 1295
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/pad/android/iappad/AdController;->layout:Landroid/widget/RelativeLayout;

    move-object/from16 v53, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/pad/android/iappad/AdController;->footer:Landroid/view/View;

    move-object/from16 v54, v0

    move-object/from16 v0, v53

    move-object/from16 v1, v54

    move-object/from16 v2, v18

    invoke-virtual {v0, v1, v2}, Landroid/widget/RelativeLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 1296
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/pad/android/iappad/AdController;->results:Lorg/json/JSONObject;

    move-object/from16 v53, v0

    const-string v54, "clickfootertext"

    invoke-virtual/range {v53 .. v54}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v53

    const-string v54, ""

    invoke-virtual/range {v53 .. v54}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v53

    if-nez v53, :cond_715

    .line 1298
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/pad/android/iappad/AdController;->layout:Landroid/widget/RelativeLayout;

    move-object/from16 v53, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/pad/android/iappad/AdController;->footerTitle:Landroid/widget/TextView;

    move-object/from16 v54, v0

    move-object/from16 v0, v53

    move-object/from16 v1, v54

    move-object/from16 v2, v28

    invoke-virtual {v0, v1, v2}, Landroid/widget/RelativeLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 1300
    :cond_715
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/pad/android/iappad/AdController;->results:Lorg/json/JSONObject;

    move-object/from16 v53, v0

    const-string v54, "shownavigation"

    invoke-virtual/range {v53 .. v54}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    move-result v53

    const/16 v54, 0x1

    move/from16 v0, v53

    move/from16 v1, v54

    if-ne v0, v1, :cond_74f

    .line 1302
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/pad/android/iappad/AdController;->layout:Landroid/widget/RelativeLayout;

    move-object/from16 v53, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/pad/android/iappad/AdController;->backBtn:Landroid/widget/Button;

    move-object/from16 v54, v0

    move-object/from16 v0, v53

    move-object/from16 v1, v54

    invoke-virtual {v0, v1, v5}, Landroid/widget/RelativeLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 1303
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/pad/android/iappad/AdController;->layout:Landroid/widget/RelativeLayout;

    move-object/from16 v53, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/pad/android/iappad/AdController;->fwdBtn:Landroid/widget/Button;

    move-object/from16 v54, v0

    move-object/from16 v0, v53

    move-object/from16 v1, v54

    invoke-virtual {v0, v1, v15}, Landroid/widget/RelativeLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 1305
    :cond_74f
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/pad/android/iappad/AdController;->results:Lorg/json/JSONObject;

    move-object/from16 v53, v0

    const-string v54, "showback"

    invoke-virtual/range {v53 .. v54}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    move-result v53

    const/16 v54, 0x1

    move/from16 v0, v53

    move/from16 v1, v54

    if-ne v0, v1, :cond_7b5

    .line 1307
    new-instance v30, Landroid/view/ViewGroup$MarginLayoutParams;

    const/16 v53, 0x37

    move-object/from16 v0, v30

    move/from16 v1, v53

    move/from16 v2, v35

    invoke-direct {v0, v1, v2}, Landroid/view/ViewGroup$MarginLayoutParams;-><init>(II)V

    .line 1308
    .local v30, "hB":Landroid/view/ViewGroup$MarginLayoutParams;
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/pad/android/iappad/AdController;->results:Lorg/json/JSONObject;

    move-object/from16 v53, v0

    const-string v54, "clickfooterwidth"

    invoke-virtual/range {v53 .. v54}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    move-result v22

    .line 1309
    .local v22, "footerW":I
    add-int v53, v22, v24

    add-int/lit8 v53, v53, -0x37

    add-int/lit8 v6, v53, -0x5

    .line 1310
    .local v6, "backX":I
    sub-int v53, v23, v35

    div-int/lit8 v53, v53, 0x2

    add-int v53, v53, v25

    add-int/lit8 v7, v53, 0x2

    .line 1311
    .local v7, "backY":I
    const/16 v53, 0x0

    const/16 v54, 0x0

    move-object/from16 v0, v30

    move/from16 v1, v53

    move/from16 v2, v54

    invoke-virtual {v0, v6, v7, v1, v2}, Landroid/view/ViewGroup$MarginLayoutParams;->setMargins(IIII)V

    .line 1312
    new-instance v31, Landroid/widget/RelativeLayout$LayoutParams;

    move-object/from16 v0, v31

    move-object/from16 v1, v30

    invoke-direct {v0, v1}, Landroid/widget/RelativeLayout$LayoutParams;-><init>(Landroid/view/ViewGroup$MarginLayoutParams;)V

    .line 1313
    .local v31, "hL":Landroid/widget/RelativeLayout$LayoutParams;
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/pad/android/iappad/AdController;->layout:Landroid/widget/RelativeLayout;

    move-object/from16 v53, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/pad/android/iappad/AdController;->homeBtn:Landroid/widget/Button;

    move-object/from16 v54, v0

    move-object/from16 v0, v53

    move-object/from16 v1, v54

    move-object/from16 v2, v31

    invoke-virtual {v0, v1, v2}, Landroid/widget/RelativeLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 1318
    .end local v6    # "backX":I
    .end local v7    # "backY":I
    .end local v22    # "footerW":I
    .end local v30    # "hB":Landroid/view/ViewGroup$MarginLayoutParams;
    .end local v31    # "hL":Landroid/widget/RelativeLayout$LayoutParams;
    :cond_7b5
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/pad/android/iappad/AdController;->results:Lorg/json/JSONObject;

    move-object/from16 v53, v0

    const-string v54, "useclickwindow"

    invoke-virtual/range {v53 .. v54}, Lorg/json/JSONObject;->get(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v53

    const-string v54, "1"

    invoke-virtual/range {v53 .. v54}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z
    :try_end_7c6
    .catch Lorg/json/JSONException; {:try_start_603 .. :try_end_7c6} :catch_977

    move-result v53

    if-eqz v53, :cond_862

    .line 1322
    :try_start_7c9
    new-instance v53, Ljava/lang/StringBuilder;

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/pad/android/iappad/AdController;->results:Lorg/json/JSONObject;

    move-object/from16 v54, v0

    const-string v55, "adurl"

    invoke-virtual/range {v54 .. v55}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v54

    invoke-static/range {v54 .. v54}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v54

    invoke-direct/range {v53 .. v54}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/pad/android/iappad/AdController;->sectionid:Ljava/lang/String;

    move-object/from16 v54, v0

    invoke-virtual/range {v53 .. v54}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v53

    invoke-virtual/range {v53 .. v53}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v53

    move-object/from16 v0, v53

    move-object/from16 v1, p0

    iput-object v0, v1, Lcom/pad/android/iappad/AdController;->loadUrl:Ljava/lang/String;

    .line 1323
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/pad/android/iappad/AdController;->webview:Lcom/pad/android/iappad/AdWebView;

    move-object/from16 v53, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/pad/android/iappad/AdController;->loadUrl:Ljava/lang/String;

    move-object/from16 v54, v0

    invoke-virtual/range {v53 .. v54}, Lcom/pad/android/iappad/AdWebView;->setLoadingURL(Ljava/lang/String;)V

    .line 1324
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/pad/android/iappad/AdController;->webview:Lcom/pad/android/iappad/AdWebView;

    move-object/from16 v53, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/pad/android/iappad/AdController;->loadUrl:Ljava/lang/String;

    move-object/from16 v54, v0

    invoke-virtual/range {v53 .. v54}, Lcom/pad/android/iappad/AdWebView;->loadUrl(Ljava/lang/String;)V

    .line 1325
    const/16 v53, 0x1

    move/from16 v0, v53

    move-object/from16 v1, p0

    iput-boolean v0, v1, Lcom/pad/android/iappad/AdController;->loading:Z
    :try_end_818
    .catch Ljava/lang/Exception; {:try_start_7c9 .. :try_end_818} :catch_998
    .catch Lorg/json/JSONException; {:try_start_7c9 .. :try_end_818} :catch_977

    .line 1335
    :goto_818
    :try_start_818
    new-instance v26, Landroid/view/ViewGroup$MarginLayoutParams;

    move-object/from16 v0, p0

    iget v0, v0, Lcom/pad/android/iappad/AdController;->sWidth:I

    move/from16 v53, v0

    move-object/from16 v0, p0

    iget v0, v0, Lcom/pad/android/iappad/AdController;->sHeight:I

    move/from16 v54, v0

    move-object/from16 v0, v26

    move/from16 v1, v53

    move/from16 v2, v54

    invoke-direct {v0, v1, v2}, Landroid/view/ViewGroup$MarginLayoutParams;-><init>(II)V

    .line 1336
    .local v26, "full":Landroid/view/ViewGroup$MarginLayoutParams;
    const/16 v53, 0x0

    const/16 v54, 0x0

    const/16 v55, 0x0

    const/16 v56, 0x0

    move-object/from16 v0, v26

    move/from16 v1, v53

    move/from16 v2, v54

    move/from16 v3, v55

    move/from16 v4, v56

    invoke-virtual {v0, v1, v2, v3, v4}, Landroid/view/ViewGroup$MarginLayoutParams;->setMargins(IIII)V

    .line 1337
    new-instance v27, Landroid/widget/RelativeLayout$LayoutParams;

    move-object/from16 v0, v27

    move-object/from16 v1, v26

    invoke-direct {v0, v1}, Landroid/widget/RelativeLayout$LayoutParams;-><init>(Landroid/view/ViewGroup$MarginLayoutParams;)V
    :try_end_84d
    .catch Ljava/lang/Exception; {:try_start_818 .. :try_end_84d} :catch_a0d
    .catch Lorg/json/JSONException; {:try_start_818 .. :try_end_84d} :catch_977

    .line 1340
    .local v27, "fullParams":Landroid/widget/RelativeLayout$LayoutParams;
    :try_start_84d
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/pad/android/iappad/AdController;->activity:Landroid/app/Activity;

    move-object/from16 v53, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/pad/android/iappad/AdController;->layout:Landroid/widget/RelativeLayout;

    move-object/from16 v54, v0

    move-object/from16 v0, v53

    move-object/from16 v1, v54

    move-object/from16 v2, v27

    invoke-virtual {v0, v1, v2}, Landroid/app/Activity;->addContentView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V
    :try_end_862
    .catch Ljava/lang/Exception; {:try_start_84d .. :try_end_862} :catch_a10
    .catch Lorg/json/JSONException; {:try_start_84d .. :try_end_862} :catch_977

    .line 1348
    .end local v26    # "full":Landroid/view/ViewGroup$MarginLayoutParams;
    .end local v27    # "fullParams":Landroid/widget/RelativeLayout$LayoutParams;
    :cond_862
    :goto_862
    :try_start_862
    const-string v53, "LBAdController"

    new-instance v54, Ljava/lang/StringBuilder;

    const-string v55, "pE = "

    invoke-direct/range {v54 .. v55}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/pad/android/iappad/AdController;->results:Lorg/json/JSONObject;

    move-object/from16 v55, v0

    const-string v56, "pollenable"

    invoke-virtual/range {v55 .. v56}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    move-result v55

    invoke-virtual/range {v54 .. v55}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v54

    const-string v55, ", pI = "

    invoke-virtual/range {v54 .. v55}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v54

    move-object/from16 v0, p0

    iget-boolean v0, v0, Lcom/pad/android/iappad/AdController;->pollingInitialized:Z

    move/from16 v55, v0

    invoke-virtual/range {v54 .. v55}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v54

    const-string v55, ", pC = "

    invoke-virtual/range {v54 .. v55}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v54

    move-object/from16 v0, p0

    iget v0, v0, Lcom/pad/android/iappad/AdController;->pollCount:I

    move/from16 v55, v0

    invoke-virtual/range {v54 .. v55}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v54

    const-string v55, ", pM = "

    invoke-virtual/range {v54 .. v55}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v54

    move-object/from16 v0, p0

    iget v0, v0, Lcom/pad/android/iappad/AdController;->pollMax:I

    move/from16 v55, v0

    invoke-virtual/range {v54 .. v55}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v54

    const-string v55, ", pMl = "

    invoke-virtual/range {v54 .. v55}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v54

    move-object/from16 v0, p0

    iget v0, v0, Lcom/pad/android/iappad/AdController;->pollManual:I

    move/from16 v55, v0

    invoke-virtual/range {v54 .. v55}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v54

    invoke-virtual/range {v54 .. v54}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v54

    invoke-static/range {v53 .. v54}, Lcom/pad/android/util/AdLog;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 1349
    const/16 v32, 0x0

    .line 1350
    .local v32, "iP":Z
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/pad/android/iappad/AdController;->results:Lorg/json/JSONObject;

    move-object/from16 v53, v0

    const-string v54, "pollenable"

    invoke-virtual/range {v53 .. v54}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    move-result v36

    .line 1351
    .local v36, "pE":I
    const/16 v53, 0x1

    move/from16 v0, v36

    move/from16 v1, v53

    if-ne v0, v1, :cond_9a6

    move-object/from16 v0, p0

    iget-boolean v0, v0, Lcom/pad/android/iappad/AdController;->pollingInitialized:Z

    move/from16 v53, v0

    if-nez v53, :cond_9a6

    move-object/from16 v0, p0

    iget v0, v0, Lcom/pad/android/iappad/AdController;->pollCount:I

    move/from16 v53, v0

    if-lez v53, :cond_9a6

    .line 1353
    const/16 v32, 0x1

    .line 1364
    :cond_8ea
    :goto_8ea
    if-eqz v32, :cond_9f6

    .line 1366
    const-string v53, "LBAdController"

    const-string v54, "Polling to be initialized in linkClicked"

    invoke-static/range {v53 .. v54}, Lcom/pad/android/util/AdLog;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 1367
    const/16 v53, 0x1

    move/from16 v0, v53

    move-object/from16 v1, p0

    iput-boolean v0, v1, Lcom/pad/android/iappad/AdController;->pollingInitialized:Z

    .line 1368
    new-instance v53, Lcom/pad/android/iappad/AdController$OfferPolling;

    move-object/from16 v0, v53

    move-object/from16 v1, p0

    invoke-direct {v0, v1}, Lcom/pad/android/iappad/AdController$OfferPolling;-><init>(Lcom/pad/android/iappad/AdController;)V

    move-object/from16 v0, v53

    move-object/from16 v1, p0

    iput-object v0, v1, Lcom/pad/android/iappad/AdController;->adPolling:Lcom/pad/android/iappad/AdController$OfferPolling;

    .line 1369
    new-instance v53, Landroid/os/Handler;

    invoke-direct/range {v53 .. v53}, Landroid/os/Handler;-><init>()V

    move-object/from16 v0, v53

    move-object/from16 v1, p0

    iput-object v0, v1, Lcom/pad/android/iappad/AdController;->pollingHandler:Landroid/os/Handler;
    :try_end_915
    .catch Lorg/json/JSONException; {:try_start_862 .. :try_end_915} :catch_977

    .line 1372
    :try_start_915
    const-string v53, "LBAdController"

    new-instance v54, Ljava/lang/StringBuilder;

    const-string v55, "Polling initialized every "

    invoke-direct/range {v54 .. v55}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/pad/android/iappad/AdController;->results:Lorg/json/JSONObject;

    move-object/from16 v55, v0

    const-string v56, "pollinterval"

    invoke-virtual/range {v55 .. v56}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    move-result v55

    invoke-virtual/range {v54 .. v55}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v54

    const-string v55, "s"

    invoke-virtual/range {v54 .. v55}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v54

    invoke-virtual/range {v54 .. v54}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v54

    invoke-static/range {v53 .. v54}, Lcom/pad/android/util/AdLog;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 1373
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/pad/android/iappad/AdController;->pollingHandler:Landroid/os/Handler;

    move-object/from16 v53, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/pad/android/iappad/AdController;->adPolling:Lcom/pad/android/iappad/AdController$OfferPolling;

    move-object/from16 v54, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/pad/android/iappad/AdController;->results:Lorg/json/JSONObject;

    move-object/from16 v55, v0

    const-string v56, "pollinterval"

    invoke-virtual/range {v55 .. v56}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    move-result v55

    move/from16 v0, v55

    mul-int/lit16 v0, v0, 0x3e8

    move/from16 v55, v0

    move/from16 v0, v55

    int-to-long v0, v0

    move-wide/from16 v55, v0

    invoke-virtual/range {v53 .. v56}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z
    :try_end_961
    .catch Ljava/lang/Exception; {:try_start_915 .. :try_end_961} :catch_a0a
    .catch Lorg/json/JSONException; {:try_start_915 .. :try_end_961} :catch_977

    .line 1390
    .end local v5    # "bB":Landroid/widget/RelativeLayout$LayoutParams;
    .end local v8    # "btny":I
    .end local v9    # "clk":Ljava/lang/String;
    .end local v12    # "clr":Ljava/lang/String;
    .end local v15    # "fB":Landroid/widget/RelativeLayout$LayoutParams;
    .end local v16    # "fClk":Ljava/lang/String;
    .end local v17    # "fClr":Ljava/lang/String;
    .end local v18    # "fL":Landroid/widget/RelativeLayout$LayoutParams;
    .end local v19    # "fM":Landroid/view/ViewGroup$MarginLayoutParams;
    .end local v20    # "fTitlex":I
    .end local v21    # "fTitley":I
    .end local v23    # "footerheight":I
    .end local v24    # "footerx":I
    .end local v25    # "footery":I
    .end local v28    # "fvl":Landroid/widget/RelativeLayout$LayoutParams;
    .end local v29    # "fvp":Landroid/view/ViewGroup$MarginLayoutParams;
    .end local v32    # "iP":Z
    .end local v33    # "nB":Landroid/view/ViewGroup$MarginLayoutParams;
    .end local v34    # "navBtnFont":F
    .end local v35    # "navBtnHeight":I
    .end local v36    # "pE":I
    .end local v37    # "tL":Landroid/widget/RelativeLayout$LayoutParams;
    .end local v38    # "tM":Landroid/view/ViewGroup$MarginLayoutParams;
    .end local v39    # "titleBtnFont":F
    .end local v40    # "titleBtnHeight":I
    .end local v41    # "titlex":I
    .end local v42    # "titley":I
    .end local v43    # "toolbarheight":I
    .end local v44    # "toolbarwidth":I
    .end local v45    # "toolbarx":I
    .end local v46    # "toolbary":I
    .end local v47    # "tvl":Landroid/widget/RelativeLayout$LayoutParams;
    .end local v48    # "tvp":Landroid/view/ViewGroup$MarginLayoutParams;
    .end local v49    # "wL":Landroid/widget/RelativeLayout$LayoutParams;
    .end local v50    # "wM":Landroid/view/ViewGroup$MarginLayoutParams;
    .end local v51    # "windowx":I
    .end local v52    # "windowy":I
    :cond_961
    :goto_961
    return-void

    .line 1164
    .restart local v9    # "clk":Ljava/lang/String;
    .restart local v12    # "clr":Ljava/lang/String;
    .restart local v16    # "fClk":Ljava/lang/String;
    .restart local v17    # "fClr":Ljava/lang/String;
    .restart local v18    # "fL":Landroid/widget/RelativeLayout$LayoutParams;
    .restart local v19    # "fM":Landroid/view/ViewGroup$MarginLayoutParams;
    .restart local v20    # "fTitlex":I
    .restart local v23    # "footerheight":I
    .restart local v24    # "footerx":I
    .restart local v25    # "footery":I
    .restart local v29    # "fvp":Landroid/view/ViewGroup$MarginLayoutParams;
    .restart local v37    # "tL":Landroid/widget/RelativeLayout$LayoutParams;
    .restart local v38    # "tM":Landroid/view/ViewGroup$MarginLayoutParams;
    .restart local v41    # "titlex":I
    .restart local v42    # "titley":I
    .restart local v43    # "toolbarheight":I
    .restart local v44    # "toolbarwidth":I
    .restart local v45    # "toolbarx":I
    .restart local v46    # "toolbary":I
    .restart local v47    # "tvl":Landroid/widget/RelativeLayout$LayoutParams;
    .restart local v48    # "tvp":Landroid/view/ViewGroup$MarginLayoutParams;
    .restart local v49    # "wL":Landroid/widget/RelativeLayout$LayoutParams;
    .restart local v50    # "wM":Landroid/view/ViewGroup$MarginLayoutParams;
    .restart local v51    # "windowx":I
    .restart local v52    # "windowy":I
    :cond_962
    add-int/lit8 v20, v20, 0x14

    goto/16 :goto_35e

    .line 1268
    .restart local v5    # "bB":Landroid/widget/RelativeLayout$LayoutParams;
    .restart local v8    # "btny":I
    .restart local v15    # "fB":Landroid/widget/RelativeLayout$LayoutParams;
    .restart local v21    # "fTitley":I
    .restart local v28    # "fvl":Landroid/widget/RelativeLayout$LayoutParams;
    .restart local v33    # "nB":Landroid/view/ViewGroup$MarginLayoutParams;
    .restart local v34    # "navBtnFont":F
    .restart local v35    # "navBtnHeight":I
    .restart local v39    # "titleBtnFont":F
    .restart local v40    # "titleBtnHeight":I
    :catch_966
    move-exception v13

    .line 1270
    .local v13, "e":Ljava/lang/Exception;
    :try_start_967
    const-string v53, "LBAdController"

    const-string v54, "error when onAdClicked triggered"

    invoke-static/range {v53 .. v54}, Lcom/pad/android/util/AdLog;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 1271
    const-string v53, "LBAdController"

    move-object/from16 v0, v53

    invoke-static {v0, v13}, Lcom/pad/android/util/AdLog;->printStackTrace(Ljava/lang/String;Ljava/lang/Exception;)V
    :try_end_975
    .catch Lorg/json/JSONException; {:try_start_967 .. :try_end_975} :catch_977

    goto/16 :goto_603

    .line 1384
    .end local v5    # "bB":Landroid/widget/RelativeLayout$LayoutParams;
    .end local v8    # "btny":I
    .end local v9    # "clk":Ljava/lang/String;
    .end local v12    # "clr":Ljava/lang/String;
    .end local v13    # "e":Ljava/lang/Exception;
    .end local v15    # "fB":Landroid/widget/RelativeLayout$LayoutParams;
    .end local v16    # "fClk":Ljava/lang/String;
    .end local v17    # "fClr":Ljava/lang/String;
    .end local v18    # "fL":Landroid/widget/RelativeLayout$LayoutParams;
    .end local v19    # "fM":Landroid/view/ViewGroup$MarginLayoutParams;
    .end local v20    # "fTitlex":I
    .end local v21    # "fTitley":I
    .end local v23    # "footerheight":I
    .end local v24    # "footerx":I
    .end local v25    # "footery":I
    .end local v28    # "fvl":Landroid/widget/RelativeLayout$LayoutParams;
    .end local v29    # "fvp":Landroid/view/ViewGroup$MarginLayoutParams;
    .end local v33    # "nB":Landroid/view/ViewGroup$MarginLayoutParams;
    .end local v34    # "navBtnFont":F
    .end local v35    # "navBtnHeight":I
    .end local v37    # "tL":Landroid/widget/RelativeLayout$LayoutParams;
    .end local v38    # "tM":Landroid/view/ViewGroup$MarginLayoutParams;
    .end local v39    # "titleBtnFont":F
    .end local v40    # "titleBtnHeight":I
    .end local v41    # "titlex":I
    .end local v42    # "titley":I
    .end local v43    # "toolbarheight":I
    .end local v44    # "toolbarwidth":I
    .end local v45    # "toolbarx":I
    .end local v46    # "toolbary":I
    .end local v47    # "tvl":Landroid/widget/RelativeLayout$LayoutParams;
    .end local v48    # "tvp":Landroid/view/ViewGroup$MarginLayoutParams;
    .end local v49    # "wL":Landroid/widget/RelativeLayout$LayoutParams;
    .end local v50    # "wM":Landroid/view/ViewGroup$MarginLayoutParams;
    .end local v51    # "windowx":I
    .end local v52    # "windowy":I
    :catch_977
    move-exception v14

    .line 1385
    .local v14, "ex":Lorg/json/JSONException;
    const-string v53, "LBAdController"

    move-object/from16 v0, v53

    invoke-static {v0, v14}, Lcom/pad/android/util/AdLog;->printStackTrace(Ljava/lang/String;Ljava/lang/Exception;)V

    .line 1386
    const-string v53, "LBAdController"

    new-instance v54, Ljava/lang/StringBuilder;

    const-string v55, "JSON Exception - "

    invoke-direct/range {v54 .. v55}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v14}, Lorg/json/JSONException;->getMessage()Ljava/lang/String;

    move-result-object v55

    invoke-virtual/range {v54 .. v55}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v54

    invoke-virtual/range {v54 .. v54}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v54

    invoke-static/range {v53 .. v54}, Lcom/pad/android/util/AdLog;->e(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_961

    .line 1327
    .end local v14    # "ex":Lorg/json/JSONException;
    .restart local v5    # "bB":Landroid/widget/RelativeLayout$LayoutParams;
    .restart local v8    # "btny":I
    .restart local v9    # "clk":Ljava/lang/String;
    .restart local v12    # "clr":Ljava/lang/String;
    .restart local v15    # "fB":Landroid/widget/RelativeLayout$LayoutParams;
    .restart local v16    # "fClk":Ljava/lang/String;
    .restart local v17    # "fClr":Ljava/lang/String;
    .restart local v18    # "fL":Landroid/widget/RelativeLayout$LayoutParams;
    .restart local v19    # "fM":Landroid/view/ViewGroup$MarginLayoutParams;
    .restart local v20    # "fTitlex":I
    .restart local v21    # "fTitley":I
    .restart local v23    # "footerheight":I
    .restart local v24    # "footerx":I
    .restart local v25    # "footery":I
    .restart local v28    # "fvl":Landroid/widget/RelativeLayout$LayoutParams;
    .restart local v29    # "fvp":Landroid/view/ViewGroup$MarginLayoutParams;
    .restart local v33    # "nB":Landroid/view/ViewGroup$MarginLayoutParams;
    .restart local v34    # "navBtnFont":F
    .restart local v35    # "navBtnHeight":I
    .restart local v37    # "tL":Landroid/widget/RelativeLayout$LayoutParams;
    .restart local v38    # "tM":Landroid/view/ViewGroup$MarginLayoutParams;
    .restart local v39    # "titleBtnFont":F
    .restart local v40    # "titleBtnHeight":I
    .restart local v41    # "titlex":I
    .restart local v42    # "titley":I
    .restart local v43    # "toolbarheight":I
    .restart local v44    # "toolbarwidth":I
    .restart local v45    # "toolbarx":I
    .restart local v46    # "toolbary":I
    .restart local v47    # "tvl":Landroid/widget/RelativeLayout$LayoutParams;
    .restart local v48    # "tvp":Landroid/view/ViewGroup$MarginLayoutParams;
    .restart local v49    # "wL":Landroid/widget/RelativeLayout$LayoutParams;
    .restart local v50    # "wM":Landroid/view/ViewGroup$MarginLayoutParams;
    .restart local v51    # "windowx":I
    .restart local v52    # "windowy":I
    :catch_998
    move-exception v13

    .line 1330
    .restart local v13    # "e":Ljava/lang/Exception;
    :try_start_999
    invoke-direct/range {p0 .. p0}, Lcom/pad/android/iappad/AdController;->closeUnlocker()V

    .line 1331
    const/16 v53, 0x0

    move/from16 v0, v53

    move-object/from16 v1, p0

    iput-boolean v0, v1, Lcom/pad/android/iappad/AdController;->loading:Z

    goto/16 :goto_818

    .line 1355
    .end local v13    # "e":Ljava/lang/Exception;
    .restart local v32    # "iP":Z
    .restart local v36    # "pE":I
    :cond_9a6
    move-object/from16 v0, p0

    iget v0, v0, Lcom/pad/android/iappad/AdController;->pollCount:I

    move/from16 v53, v0

    move-object/from16 v0, p0

    iget v0, v0, Lcom/pad/android/iappad/AdController;->pollMax:I

    move/from16 v54, v0

    move/from16 v0, v53

    move/from16 v1, v54

    if-gt v0, v1, :cond_9ce

    move-object/from16 v0, p0

    iget v0, v0, Lcom/pad/android/iappad/AdController;->pollCount:I

    move/from16 v53, v0

    move-object/from16 v0, p0

    iget v0, v0, Lcom/pad/android/iappad/AdController;->pollManual:I

    move/from16 v54, v0

    move/from16 v0, v53

    move/from16 v1, v54

    if-ge v0, v1, :cond_9ce

    .line 1357
    const/16 v32, 0x1

    goto/16 :goto_8ea

    .line 1359
    :cond_9ce
    move-object/from16 v0, p0

    iget v0, v0, Lcom/pad/android/iappad/AdController;->pollCount:I

    move/from16 v53, v0

    move-object/from16 v0, p0

    iget v0, v0, Lcom/pad/android/iappad/AdController;->pollMax:I

    move/from16 v54, v0

    move/from16 v0, v53

    move/from16 v1, v54

    if-le v0, v1, :cond_8ea

    move-object/from16 v0, p0

    iget v0, v0, Lcom/pad/android/iappad/AdController;->pollCount:I

    move/from16 v53, v0

    move-object/from16 v0, p0

    iget v0, v0, Lcom/pad/android/iappad/AdController;->pollManual:I

    move/from16 v54, v0

    move/from16 v0, v53

    move/from16 v1, v54

    if-lt v0, v1, :cond_8ea

    .line 1361
    const/16 v32, 0x0

    goto/16 :goto_8ea

    .line 1379
    :cond_9f6
    const-string v53, "LBAdController"

    const-string v54, "Manual Polling in linkClicked"

    invoke-static/range {v53 .. v54}, Lcom/pad/android/util/AdLog;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 1380
    const/16 v53, 0x0

    move/from16 v0, v53

    move-object/from16 v1, p0

    iput-boolean v0, v1, Lcom/pad/android/iappad/AdController;->pollingInitialized:Z

    .line 1381
    invoke-direct/range {p0 .. p0}, Lcom/pad/android/iappad/AdController;->showManualPoll()V
    :try_end_a08
    .catch Lorg/json/JSONException; {:try_start_999 .. :try_end_a08} :catch_977

    goto/16 :goto_961

    .line 1375
    :catch_a0a
    move-exception v53

    goto/16 :goto_961

    .line 1344
    .end local v32    # "iP":Z
    .end local v36    # "pE":I
    :catch_a0d
    move-exception v53

    goto/16 :goto_862

    .line 1342
    .restart local v26    # "full":Landroid/view/ViewGroup$MarginLayoutParams;
    .restart local v27    # "fullParams":Landroid/widget/RelativeLayout$LayoutParams;
    :catch_a10
    move-exception v53

    goto/16 :goto_862

    .line 1112
    .end local v5    # "bB":Landroid/widget/RelativeLayout$LayoutParams;
    .end local v8    # "btny":I
    .end local v9    # "clk":Ljava/lang/String;
    .end local v15    # "fB":Landroid/widget/RelativeLayout$LayoutParams;
    .end local v16    # "fClk":Ljava/lang/String;
    .end local v17    # "fClr":Ljava/lang/String;
    .end local v18    # "fL":Landroid/widget/RelativeLayout$LayoutParams;
    .end local v19    # "fM":Landroid/view/ViewGroup$MarginLayoutParams;
    .end local v20    # "fTitlex":I
    .end local v21    # "fTitley":I
    .end local v23    # "footerheight":I
    .end local v24    # "footerx":I
    .end local v25    # "footery":I
    .end local v26    # "full":Landroid/view/ViewGroup$MarginLayoutParams;
    .end local v27    # "fullParams":Landroid/widget/RelativeLayout$LayoutParams;
    .end local v28    # "fvl":Landroid/widget/RelativeLayout$LayoutParams;
    .end local v29    # "fvp":Landroid/view/ViewGroup$MarginLayoutParams;
    .end local v33    # "nB":Landroid/view/ViewGroup$MarginLayoutParams;
    .end local v34    # "navBtnFont":F
    .end local v35    # "navBtnHeight":I
    .end local v39    # "titleBtnFont":F
    .end local v40    # "titleBtnHeight":I
    .end local v41    # "titlex":I
    .end local v42    # "titley":I
    .end local v47    # "tvl":Landroid/widget/RelativeLayout$LayoutParams;
    .end local v48    # "tvp":Landroid/view/ViewGroup$MarginLayoutParams;
    :catch_a13
    move-exception v53

    goto/16 :goto_1be

    .line 1099
    .end local v12    # "clr":Ljava/lang/String;
    :catch_a16
    move-exception v53

    goto/16 :goto_17d

    .line 1080
    .end local v37    # "tL":Landroid/widget/RelativeLayout$LayoutParams;
    .end local v38    # "tM":Landroid/view/ViewGroup$MarginLayoutParams;
    .end local v43    # "toolbarheight":I
    .end local v44    # "toolbarwidth":I
    .end local v45    # "toolbarx":I
    .end local v46    # "toolbary":I
    .end local v49    # "wL":Landroid/widget/RelativeLayout$LayoutParams;
    .end local v50    # "wM":Landroid/view/ViewGroup$MarginLayoutParams;
    .end local v51    # "windowx":I
    .end local v52    # "windowy":I
    :catch_a19
    move-exception v53

    goto/16 :goto_dc
.end method

.method private showManualPoll()V
    .registers 20

    .prologue
    .line 1396
    :try_start_0
    move-object/from16 v0, p0

    iget-object v14, v0, Lcom/pad/android/iappad/AdController;->results:Lorg/json/JSONObject;

    const-string v15, "clickfootervisible"

    invoke-virtual {v14, v15}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v14

    const-string v15, "1"

    invoke-virtual {v14, v15}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    :try_end_f
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_f} :catch_13

    move-result v14

    if-nez v14, :cond_14

    .line 1486
    :cond_12
    :goto_12
    return-void

    .line 1401
    :catch_13
    move-exception v14

    .line 1403
    :cond_14
    const/4 v14, 0x0

    move-object/from16 v0, p0

    iput-boolean v14, v0, Lcom/pad/android/iappad/AdController;->pollingInitialized:Z

    .line 1404
    move-object/from16 v0, p0

    iget-object v14, v0, Lcom/pad/android/iappad/AdController;->pollingHandler:Landroid/os/Handler;

    if-eqz v14, :cond_2a

    .line 1406
    move-object/from16 v0, p0

    iget-object v14, v0, Lcom/pad/android/iappad/AdController;->pollingHandler:Landroid/os/Handler;

    move-object/from16 v0, p0

    iget-object v15, v0, Lcom/pad/android/iappad/AdController;->adPolling:Lcom/pad/android/iappad/AdController$OfferPolling;

    invoke-virtual {v14, v15}, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V

    .line 1408
    :cond_2a
    new-instance v14, Landroid/widget/Button;

    move-object/from16 v0, p0

    iget-object v15, v0, Lcom/pad/android/iappad/AdController;->activity:Landroid/app/Activity;

    invoke-direct {v14, v15}, Landroid/widget/Button;-><init>(Landroid/content/Context;)V

    move-object/from16 v0, p0

    iput-object v14, v0, Lcom/pad/android/iappad/AdController;->pollBtn:Landroid/widget/Button;

    .line 1409
    move-object/from16 v0, p0

    iget-object v14, v0, Lcom/pad/android/iappad/AdController;->pollBtn:Landroid/widget/Button;

    const-string v15, "Refresh"

    invoke-virtual {v14, v15}, Landroid/widget/Button;->setText(Ljava/lang/CharSequence;)V

    .line 1411
    const/4 v13, 0x0

    .line 1412
    .local v13, "pollBtnHeight":I
    const-string v4, "#E6E6E6"

    .line 1413
    .local v4, "clr":Ljava/lang/String;
    const-string v3, "#000000"

    .line 1414
    .local v3, "clk":Ljava/lang/String;
    move-object/from16 v0, p0

    iget-boolean v14, v0, Lcom/pad/android/iappad/AdController;->linkClicked:Z

    if-eqz v14, :cond_88

    .line 1418
    :try_start_4b
    move-object/from16 v0, p0

    iget-object v14, v0, Lcom/pad/android/iappad/AdController;->results:Lorg/json/JSONObject;

    const-string v15, "clickfooterheight"

    invoke-virtual {v14, v15}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    move-result v14

    add-int/lit8 v14, v14, -0x5

    const/4 v15, 0x0

    invoke-static {v14, v15}, Ljava/lang/Math;->max(II)I

    move-result v13

    .line 1419
    move-object/from16 v0, p0

    iget-object v14, v0, Lcom/pad/android/iappad/AdController;->results:Lorg/json/JSONObject;

    const-string v15, "clickfootercolor"

    invoke-virtual {v14, v15}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    .line 1420
    move-object/from16 v0, p0

    iget-object v14, v0, Lcom/pad/android/iappad/AdController;->results:Lorg/json/JSONObject;

    const-string v15, "clicktitletextcolor"

    invoke-virtual {v14, v15}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    .line 1421
    const-string v14, ""

    invoke-virtual {v4, v14}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v14

    if-nez v14, :cond_7a

    if-nez v4, :cond_7c

    .line 1423
    :cond_7a
    const-string v4, "#E6E6E6"

    .line 1425
    :cond_7c
    const-string v14, ""

    invoke-virtual {v3, v14}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v14

    if-nez v14, :cond_86

    if-nez v3, :cond_88

    .line 1427
    :cond_86
    const-string v3, "#000000"
    :try_end_88
    .catch Ljava/lang/Exception; {:try_start_4b .. :try_end_88} :catch_143

    .line 1433
    :cond_88
    :goto_88
    div-int/lit8 v14, v13, 0x2

    int-to-float v12, v14

    .line 1434
    .local v12, "pollBtnFont":F
    const/high16 v14, 0x41200000    # 10.0f

    cmpl-float v14, v12, v14

    if-lez v14, :cond_93

    .line 1436
    const/high16 v12, 0x41200000    # 10.0f

    .line 1439
    :cond_93
    move-object/from16 v0, p0

    iget-object v14, v0, Lcom/pad/android/iappad/AdController;->pollBtn:Landroid/widget/Button;

    const/4 v15, 0x0

    const/16 v16, 0x0

    const/16 v17, 0x0

    const/16 v18, 0x0

    invoke-virtual/range {v14 .. v18}, Landroid/widget/Button;->setPadding(IIII)V

    .line 1440
    move-object/from16 v0, p0

    iget-object v14, v0, Lcom/pad/android/iappad/AdController;->pollBtn:Landroid/widget/Button;

    invoke-virtual {v14, v12}, Landroid/widget/Button;->setTextSize(F)V

    .line 1441
    move-object/from16 v0, p0

    iget-object v14, v0, Lcom/pad/android/iappad/AdController;->pollBtn:Landroid/widget/Button;

    invoke-static {v3}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    move-result v15

    invoke-virtual {v14, v15}, Landroid/widget/Button;->setTextColor(I)V

    .line 1442
    move-object/from16 v0, p0

    iget-object v14, v0, Lcom/pad/android/iappad/AdController;->pollBtn:Landroid/widget/Button;

    invoke-static {v4}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    move-result v15

    invoke-virtual {v14, v15}, Landroid/widget/Button;->setBackgroundColor(I)V

    .line 1443
    move-object/from16 v0, p0

    iget-object v14, v0, Lcom/pad/android/iappad/AdController;->pollBtn:Landroid/widget/Button;

    new-instance v15, Lcom/pad/android/iappad/AdController$9;

    move-object/from16 v0, p0

    invoke-direct {v15, v0}, Lcom/pad/android/iappad/AdController$9;-><init>(Lcom/pad/android/iappad/AdController;)V

    invoke-virtual {v14, v15}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 1464
    move-object/from16 v0, p0

    iget-boolean v14, v0, Lcom/pad/android/iappad/AdController;->linkClicked:Z

    if-eqz v14, :cond_12

    .line 1469
    :try_start_d2
    move-object/from16 v0, p0

    iget-object v14, v0, Lcom/pad/android/iappad/AdController;->results:Lorg/json/JSONObject;

    const-string v15, "clickfooterx"

    invoke-virtual {v14, v15}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    move-result v8

    .line 1470
    .local v8, "footerx":I
    move-object/from16 v0, p0

    iget-object v14, v0, Lcom/pad/android/iappad/AdController;->results:Lorg/json/JSONObject;

    const-string v15, "clickfootery"

    invoke-virtual {v14, v15}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    move-result v9

    .line 1471
    .local v9, "footery":I
    move-object/from16 v0, p0

    iget-object v14, v0, Lcom/pad/android/iappad/AdController;->results:Lorg/json/JSONObject;

    const-string v15, "clickfooterheight"

    invoke-virtual {v14, v15}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    move-result v7

    .line 1472
    .local v7, "footerheight":I
    new-instance v10, Landroid/view/ViewGroup$MarginLayoutParams;

    const/16 v14, 0x37

    invoke-direct {v10, v14, v13}, Landroid/view/ViewGroup$MarginLayoutParams;-><init>(II)V

    .line 1473
    .local v10, "hB":Landroid/view/ViewGroup$MarginLayoutParams;
    move-object/from16 v0, p0

    iget-object v14, v0, Lcom/pad/android/iappad/AdController;->results:Lorg/json/JSONObject;

    const-string v15, "clickfooterwidth"

    invoke-virtual {v14, v15}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    move-result v6

    .line 1474
    .local v6, "footerW":I
    add-int v14, v6, v8

    add-int/lit8 v1, v14, -0x78

    .line 1475
    .local v1, "backX":I
    sub-int v14, v7, v13

    div-int/lit8 v14, v14, 0x2

    add-int/2addr v14, v9

    add-int/lit8 v2, v14, 0x2

    .line 1476
    .local v2, "backY":I
    const/4 v14, 0x0

    const/4 v15, 0x0

    invoke-virtual {v10, v1, v2, v14, v15}, Landroid/view/ViewGroup$MarginLayoutParams;->setMargins(IIII)V

    .line 1477
    new-instance v11, Landroid/widget/RelativeLayout$LayoutParams;

    invoke-direct {v11, v10}, Landroid/widget/RelativeLayout$LayoutParams;-><init>(Landroid/view/ViewGroup$MarginLayoutParams;)V

    .line 1478
    .local v11, "hL":Landroid/widget/RelativeLayout$LayoutParams;
    move-object/from16 v0, p0

    iget-object v14, v0, Lcom/pad/android/iappad/AdController;->layout:Landroid/widget/RelativeLayout;

    move-object/from16 v0, p0

    iget-object v15, v0, Lcom/pad/android/iappad/AdController;->pollBtn:Landroid/widget/Button;

    invoke-virtual {v14, v15, v11}, Landroid/widget/RelativeLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V
    :try_end_121
    .catch Ljava/lang/Exception; {:try_start_d2 .. :try_end_121} :catch_123

    goto/16 :goto_12

    .line 1480
    .end local v1    # "backX":I
    .end local v2    # "backY":I
    .end local v6    # "footerW":I
    .end local v7    # "footerheight":I
    .end local v8    # "footerx":I
    .end local v9    # "footery":I
    .end local v10    # "hB":Landroid/view/ViewGroup$MarginLayoutParams;
    .end local v11    # "hL":Landroid/widget/RelativeLayout$LayoutParams;
    :catch_123
    move-exception v5

    .line 1482
    .local v5, "e":Ljava/lang/Exception;
    const-string v14, "LBAdController"

    new-instance v15, Ljava/lang/StringBuilder;

    const-string v16, "Error (add Manual Poll btn before click): "

    invoke-direct/range {v15 .. v16}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v5}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v16

    invoke-virtual/range {v15 .. v16}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v15

    invoke-virtual {v15}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v15

    invoke-static {v14, v15}, Lcom/pad/android/util/AdLog;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 1483
    const-string v14, "LBAdController"

    invoke-static {v14, v5}, Lcom/pad/android/util/AdLog;->printStackTrace(Ljava/lang/String;Ljava/lang/Exception;)V

    goto/16 :goto_12

    .line 1430
    .end local v5    # "e":Ljava/lang/Exception;
    .end local v12    # "pollBtnFont":F
    :catch_143
    move-exception v14

    goto/16 :goto_88
.end method


# virtual methods
.method public adShowStatus()Ljava/lang/String;
    .registers 5

    .prologue
    .line 356
    iget-object v2, p0, Lcom/pad/android/iappad/AdController;->activity:Landroid/app/Activity;

    if-eqz v2, :cond_25

    iget-object v1, p0, Lcom/pad/android/iappad/AdController;->activity:Landroid/app/Activity;

    .line 357
    .local v1, "toUse":Landroid/content/Context;
    :goto_6
    const-string v2, "Preference"

    const/4 v3, 0x2

    invoke-virtual {v1, v2, v3}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v0

    .line 358
    .local v0, "pref":Landroid/content/SharedPreferences;
    new-instance v2, Ljava/lang/StringBuilder;

    const-string v3, "SD_ADSTATUS_"

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v3, p0, Lcom/pad/android/iappad/AdController;->sectionid:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    const-string v3, "default"

    invoke-interface {v0, v2, v3}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    return-object v2

    .line 356
    .end local v0    # "pref":Landroid/content/SharedPreferences;
    .end local v1    # "toUse":Landroid/content/Context;
    :cond_25
    iget-object v1, p0, Lcom/pad/android/iappad/AdController;->context:Landroid/content/Context;

    goto :goto_6
.end method

.method public destroyAd()V
    .registers 3

    .prologue
    .line 287
    const-string v0, "LBAdController"

    const-string v1, "destroyAd called"

    invoke-static {v0, v1}, Lcom/pad/android/util/AdLog;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 288
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/pad/android/iappad/AdController;->adDestroyed:Z

    .line 289
    invoke-direct {p0}, Lcom/pad/android/iappad/AdController;->closeUnlocker()V

    .line 290
    return-void
.end method

.method public getAdDestroyed()Z
    .registers 2

    .prologue
    .line 1778
    iget-boolean v0, p0, Lcom/pad/android/iappad/AdController;->adDestroyed:Z

    return v0
.end method

.method public getAdLoaded()Z
    .registers 2

    .prologue
    .line 1792
    iget-boolean v0, p0, Lcom/pad/android/iappad/AdController;->adLoaded:Z

    return v0
.end method

.method public getOnAdLoaded()Z
    .registers 2

    .prologue
    .line 1783
    iget-boolean v0, p0, Lcom/pad/android/iappad/AdController;->onAdLoaded:Z

    return v0
.end method

.method public hideAd()V
    .registers 1

    .prologue
    .line 342
    invoke-virtual {p0}, Lcom/pad/android/iappad/AdController;->pauseAd()V

    .line 343
    return-void
.end method

.method public initialized()V
    .registers 23

    .prologue
    .line 437
    const/16 v18, 0x1

    move/from16 v0, v18

    move-object/from16 v1, p0

    iput-boolean v0, v1, Lcom/pad/android/iappad/AdController;->initialized:Z

    .line 438
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/pad/android/iappad/AdController;->results:Lorg/json/JSONObject;

    move-object/from16 v18, v0

    if-eqz v18, :cond_28d

    .line 442
    :try_start_10
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/pad/android/iappad/AdController;->results:Lorg/json/JSONObject;

    move-object/from16 v18, v0

    const-string v19, "show"

    invoke-virtual/range {v18 .. v19}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v18

    const-string v19, "0"

    invoke-virtual/range {v18 .. v19}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v18

    if-eqz v18, :cond_37

    .line 445
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/pad/android/iappad/AdController;->listener:Lcom/pad/android/listener/AdListener;

    move-object/from16 v18, v0

    if-eqz v18, :cond_35

    .line 447
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/pad/android/iappad/AdController;->listener:Lcom/pad/android/listener/AdListener;

    move-object/from16 v18, v0

    invoke-interface/range {v18 .. v18}, Lcom/pad/android/listener/AdListener;->onAdFailed()V
    :try_end_35
    .catch Ljava/lang/Exception; {:try_start_10 .. :try_end_35} :catch_36

    .line 580
    :cond_35
    :goto_35
    return-void

    .line 451
    :catch_36
    move-exception v18

    .line 454
    :cond_37
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/pad/android/iappad/AdController;->activity:Landroid/app/Activity;

    move-object/from16 v18, v0

    if-eqz v18, :cond_98

    .line 457
    new-instance v6, Landroid/util/DisplayMetrics;

    invoke-direct {v6}, Landroid/util/DisplayMetrics;-><init>()V

    .line 458
    .local v6, "dm":Landroid/util/DisplayMetrics;
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/pad/android/iappad/AdController;->activity:Landroid/app/Activity;

    move-object/from16 v18, v0

    invoke-virtual/range {v18 .. v18}, Landroid/app/Activity;->getWindowManager()Landroid/view/WindowManager;

    move-result-object v18

    invoke-interface/range {v18 .. v18}, Landroid/view/WindowManager;->getDefaultDisplay()Landroid/view/Display;

    move-result-object v18

    move-object/from16 v0, v18

    invoke-virtual {v0, v6}, Landroid/view/Display;->getMetrics(Landroid/util/DisplayMetrics;)V

    .line 460
    new-instance v14, Landroid/graphics/Rect;

    invoke-direct {v14}, Landroid/graphics/Rect;-><init>()V

    .line 461
    .local v14, "rect":Landroid/graphics/Rect;
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/pad/android/iappad/AdController;->activity:Landroid/app/Activity;

    move-object/from16 v18, v0

    invoke-virtual/range {v18 .. v18}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    move-result-object v17

    .line 462
    .local v17, "win":Landroid/view/Window;
    invoke-virtual/range {v17 .. v17}, Landroid/view/Window;->getDecorView()Landroid/view/View;

    move-result-object v18

    move-object/from16 v0, v18

    invoke-virtual {v0, v14}, Landroid/view/View;->getWindowVisibleDisplayFrame(Landroid/graphics/Rect;)V

    .line 463
    iget v15, v14, Landroid/graphics/Rect;->top:I

    .line 464
    .local v15, "statusBarHeight":I
    const v18, 0x1020002

    invoke-virtual/range {v17 .. v18}, Landroid/view/Window;->findViewById(I)Landroid/view/View;

    move-result-object v18

    invoke-virtual/range {v18 .. v18}, Landroid/view/View;->getTop()I

    move-result v5

    .line 465
    .local v5, "contentViewTop":I
    if-le v5, v15, :cond_200

    sub-int v16, v5, v15

    .line 467
    .local v16, "titleBarHeight":I
    :goto_80
    iget v0, v6, Landroid/util/DisplayMetrics;->widthPixels:I

    move/from16 v18, v0

    move/from16 v0, v18

    move-object/from16 v1, p0

    iput v0, v1, Lcom/pad/android/iappad/AdController;->sWidth:I

    .line 468
    iget v0, v6, Landroid/util/DisplayMetrics;->heightPixels:I

    move/from16 v18, v0

    sub-int v18, v18, v15

    sub-int v18, v18, v16

    move/from16 v0, v18

    move-object/from16 v1, p0

    iput v0, v1, Lcom/pad/android/iappad/AdController;->sHeight:I

    .line 474
    .end local v5    # "contentViewTop":I
    .end local v6    # "dm":Landroid/util/DisplayMetrics;
    .end local v14    # "rect":Landroid/graphics/Rect;
    .end local v15    # "statusBarHeight":I
    .end local v16    # "titleBarHeight":I
    .end local v17    # "win":Landroid/view/Window;
    :cond_98
    :try_start_98
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/pad/android/iappad/AdController;->results:Lorg/json/JSONObject;

    move-object/from16 v18, v0

    const-string v19, "pollmaxcount"

    invoke-virtual/range {v18 .. v19}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    move-result v18

    move/from16 v0, v18

    move-object/from16 v1, p0

    iput v0, v1, Lcom/pad/android/iappad/AdController;->pollMax:I

    .line 475
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/pad/android/iappad/AdController;->results:Lorg/json/JSONObject;

    move-object/from16 v18, v0

    const-string v19, "pollmanualafter"

    invoke-virtual/range {v18 .. v19}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    move-result v10

    .line 476
    .local v10, "pMA":I
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/pad/android/iappad/AdController;->results:Lorg/json/JSONObject;

    move-object/from16 v18, v0

    const-string v19, "pollinterval"

    invoke-virtual/range {v18 .. v19}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    move-result v12

    .line 477
    .local v12, "pollInterval":I
    if-lez v12, :cond_204

    .line 479
    mul-int/lit8 v18, v10, 0x3c

    div-int v18, v18, v12

    move/from16 v0, v18

    move-object/from16 v1, p0

    iput v0, v1, Lcom/pad/android/iappad/AdController;->pollManual:I
    :try_end_ce
    .catch Ljava/lang/Exception; {:try_start_98 .. :try_end_ce} :catch_20e

    .line 494
    .end local v10    # "pMA":I
    .end local v12    # "pollInterval":I
    :goto_ce
    :try_start_ce
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/pad/android/iappad/AdController;->results:Lorg/json/JSONObject;

    move-object/from16 v18, v0

    const-string v19, "usenative"

    invoke-virtual/range {v18 .. v19}, Lorg/json/JSONObject;->get(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v18

    const-string v19, "1"

    invoke-virtual/range {v18 .. v19}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v18

    if-eqz v18, :cond_ea

    .line 496
    const/16 v18, 0x1

    move/from16 v0, v18

    move-object/from16 v1, p0

    iput-boolean v0, v1, Lcom/pad/android/iappad/AdController;->nativeOpen:Z
    :try_end_ea
    .catch Lorg/json/JSONException; {:try_start_ce .. :try_end_ea} :catch_2a6

    .line 502
    :cond_ea
    :goto_ea
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/pad/android/iappad/AdController;->activity:Landroid/app/Activity;

    move-object/from16 v18, v0

    const-string v19, "Preference"

    const/16 v20, 0x2

    invoke-virtual/range {v18 .. v20}, Landroid/app/Activity;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v13

    .line 503
    .local v13, "pref":Landroid/content/SharedPreferences;
    invoke-interface {v13}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v8

    .line 506
    .local v8, "editor":Landroid/content/SharedPreferences$Editor;
    :try_start_fc
    new-instance v18, Ljava/lang/StringBuilder;

    const-string v19, "SD_"

    invoke-direct/range {v18 .. v19}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/pad/android/iappad/AdController;->sectionid:Ljava/lang/String;

    move-object/from16 v19, v0

    invoke-virtual/range {v18 .. v19}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v18

    invoke-virtual/range {v18 .. v18}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v18

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/pad/android/iappad/AdController;->results:Lorg/json/JSONObject;

    move-object/from16 v19, v0

    const-string v20, "displayinterval"

    invoke-virtual/range {v19 .. v20}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v19

    move-object/from16 v0, v18

    move-object/from16 v1, v19

    invoke-interface {v8, v0, v1}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;
    :try_end_124
    .catch Ljava/lang/Exception; {:try_start_fc .. :try_end_124} :catch_221

    .line 522
    :goto_124
    invoke-interface {v8}, Landroid/content/SharedPreferences$Editor;->commit()Z

    .line 526
    :try_start_127
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/pad/android/iappad/AdController;->results:Lorg/json/JSONObject;

    move-object/from16 v18, v0

    const-string v19, "invalidateoptin"

    invoke-virtual/range {v18 .. v19}, Lorg/json/JSONObject;->isNull(Ljava/lang/String;)Z

    move-result v18

    if-nez v18, :cond_15b

    .line 528
    const-string v9, "0"
    :try_end_137
    .catch Ljava/lang/Exception; {:try_start_127 .. :try_end_137} :catch_2a0

    .line 531
    .local v9, "invalidate":Ljava/lang/String;
    :try_start_137
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/pad/android/iappad/AdController;->results:Lorg/json/JSONObject;

    move-object/from16 v18, v0

    const-string v19, "invalidateoptin"

    invoke-virtual/range {v18 .. v19}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;
    :try_end_142
    .catch Ljava/lang/Exception; {:try_start_137 .. :try_end_142} :catch_2a3

    move-result-object v9

    .line 533
    :goto_143
    :try_start_143
    const-string v18, "1"

    move-object/from16 v0, v18

    invoke-virtual {v9, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v18

    if-eqz v18, :cond_15b

    .line 535
    const-string v18, "SD_APP_OPTIN_SHOWN"

    const-string v19, "invalid"

    move-object/from16 v0, v18

    move-object/from16 v1, v19

    invoke-interface {v8, v0, v1}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    .line 536
    invoke-interface {v8}, Landroid/content/SharedPreferences$Editor;->commit()Z
    :try_end_15b
    .catch Ljava/lang/Exception; {:try_start_143 .. :try_end_15b} :catch_2a0

    .line 541
    .end local v9    # "invalidate":Ljava/lang/String;
    :cond_15b
    :goto_15b
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/pad/android/iappad/AdController;->webview:Lcom/pad/android/iappad/AdWebView;

    move-object/from16 v18, v0

    if-nez v18, :cond_1b4

    .line 543
    new-instance v18, Lcom/pad/android/iappad/AdWebView;

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/pad/android/iappad/AdController;->activity:Landroid/app/Activity;

    move-object/from16 v19, v0

    move-object/from16 v0, p0

    iget-boolean v0, v0, Lcom/pad/android/iappad/AdController;->nativeOpen:Z

    move/from16 v20, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/pad/android/iappad/AdController;->listener:Lcom/pad/android/listener/AdListener;

    move-object/from16 v21, v0

    move-object/from16 v0, v18

    move-object/from16 v1, v19

    move-object/from16 v2, p0

    move/from16 v3, v20

    move-object/from16 v4, v21

    invoke-direct {v0, v1, v2, v3, v4}, Lcom/pad/android/iappad/AdWebView;-><init>(Landroid/app/Activity;Lcom/pad/android/iappad/AdController;ZLcom/pad/android/listener/AdListener;)V

    move-object/from16 v0, v18

    move-object/from16 v1, p0

    iput-object v0, v1, Lcom/pad/android/iappad/AdController;->webview:Lcom/pad/android/iappad/AdWebView;

    .line 544
    sget v18, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v19, 0xb

    move/from16 v0, v18

    move/from16 v1, v19

    if-lt v0, v1, :cond_1a5

    .line 548
    :try_start_194
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/pad/android/iappad/AdController;->activity:Landroid/app/Activity;

    move-object/from16 v18, v0

    invoke-virtual/range {v18 .. v18}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    move-result-object v18

    const/high16 v19, 0x1000000

    const/high16 v20, 0x1000000

    invoke-virtual/range {v18 .. v20}, Landroid/view/Window;->setFlags(II)V
    :try_end_1a5
    .catch Ljava/lang/Exception; {:try_start_194 .. :try_end_1a5} :catch_27c

    .line 556
    :cond_1a5
    :goto_1a5
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/pad/android/iappad/AdController;->webview:Lcom/pad/android/iappad/AdWebView;

    move-object/from16 v18, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/pad/android/iappad/AdController;->results:Lorg/json/JSONObject;

    move-object/from16 v19, v0

    invoke-virtual/range {v18 .. v19}, Lcom/pad/android/iappad/AdWebView;->setResults(Lorg/json/JSONObject;)V

    .line 563
    :cond_1b4
    :try_start_1b4
    new-instance v11, Lcom/pad/android/iappad/AdController$PollRequest;

    const/16 v18, 0x0

    move-object/from16 v0, p0

    move-object/from16 v1, v18

    invoke-direct {v11, v0, v1}, Lcom/pad/android/iappad/AdController$PollRequest;-><init>(Lcom/pad/android/iappad/AdController;Lcom/pad/android/iappad/AdController$PollRequest;)V

    .line 564
    .local v11, "pR":Lcom/pad/android/iappad/AdController$PollRequest;
    const/16 v18, 0x1

    move/from16 v0, v18

    new-array v0, v0, [Ljava/lang/String;

    move-object/from16 v18, v0

    const/16 v19, 0x0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/pad/android/iappad/AdController;->results:Lorg/json/JSONObject;

    move-object/from16 v20, v0

    const-string v21, "pollurl"

    invoke-virtual/range {v20 .. v21}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v20

    aput-object v20, v18, v19

    move-object/from16 v0, v18

    invoke-virtual {v11, v0}, Lcom/pad/android/iappad/AdController$PollRequest;->execute([Ljava/lang/Object;)Landroid/os/AsyncTask;
    :try_end_1dc
    .catch Ljava/lang/Exception; {:try_start_1b4 .. :try_end_1dc} :catch_1de

    goto/16 :goto_35

    .line 566
    .end local v11    # "pR":Lcom/pad/android/iappad/AdController$PollRequest;
    :catch_1de
    move-exception v7

    .line 568
    .local v7, "e":Ljava/lang/Exception;
    const-string v18, "LBAdController"

    move-object/from16 v0, v18

    invoke-static {v0, v7}, Lcom/pad/android/util/AdLog;->printStackTrace(Ljava/lang/String;Ljava/lang/Exception;)V

    .line 569
    const-string v18, "LBAdController"

    new-instance v19, Ljava/lang/StringBuilder;

    const-string v20, "Error while trying to call pollurl - "

    invoke-direct/range {v19 .. v20}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v7}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v20

    invoke-virtual/range {v19 .. v20}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v19

    invoke-virtual/range {v19 .. v19}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v19

    invoke-static/range {v18 .. v19}, Lcom/pad/android/util/AdLog;->e(Ljava/lang/String;Ljava/lang/String;)V

    goto/16 :goto_35

    .line 465
    .end local v7    # "e":Ljava/lang/Exception;
    .end local v8    # "editor":Landroid/content/SharedPreferences$Editor;
    .end local v13    # "pref":Landroid/content/SharedPreferences;
    .restart local v5    # "contentViewTop":I
    .restart local v6    # "dm":Landroid/util/DisplayMetrics;
    .restart local v14    # "rect":Landroid/graphics/Rect;
    .restart local v15    # "statusBarHeight":I
    .restart local v17    # "win":Landroid/view/Window;
    :cond_200
    const/16 v16, 0x0

    goto/16 :goto_80

    .line 483
    .end local v5    # "contentViewTop":I
    .end local v6    # "dm":Landroid/util/DisplayMetrics;
    .end local v14    # "rect":Landroid/graphics/Rect;
    .end local v15    # "statusBarHeight":I
    .end local v17    # "win":Landroid/view/Window;
    .restart local v10    # "pMA":I
    .restart local v12    # "pollInterval":I
    :cond_204
    const/16 v18, 0xa

    :try_start_206
    move/from16 v0, v18

    move-object/from16 v1, p0

    iput v0, v1, Lcom/pad/android/iappad/AdController;->pollManual:I
    :try_end_20c
    .catch Ljava/lang/Exception; {:try_start_206 .. :try_end_20c} :catch_20e

    goto/16 :goto_ce

    .line 486
    .end local v10    # "pMA":I
    .end local v12    # "pollInterval":I
    :catch_20e
    move-exception v7

    .line 488
    .restart local v7    # "e":Ljava/lang/Exception;
    const/16 v18, 0x1f4

    move/from16 v0, v18

    move-object/from16 v1, p0

    iput v0, v1, Lcom/pad/android/iappad/AdController;->pollMax:I

    .line 489
    const/16 v18, 0xa

    move/from16 v0, v18

    move-object/from16 v1, p0

    iput v0, v1, Lcom/pad/android/iappad/AdController;->pollManual:I

    goto/16 :goto_ce

    .line 509
    .end local v7    # "e":Ljava/lang/Exception;
    .restart local v8    # "editor":Landroid/content/SharedPreferences$Editor;
    .restart local v13    # "pref":Landroid/content/SharedPreferences;
    :catch_221
    move-exception v7

    .line 511
    .restart local v7    # "e":Ljava/lang/Exception;
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/pad/android/iappad/AdController;->adDisplayInterval:Ljava/lang/String;

    move-object/from16 v18, v0

    if-eqz v18, :cond_25c

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/pad/android/iappad/AdController;->adDisplayInterval:Ljava/lang/String;

    move-object/from16 v18, v0

    const-string v19, "0"

    invoke-virtual/range {v18 .. v19}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v18

    if-nez v18, :cond_25c

    .line 513
    new-instance v18, Ljava/lang/StringBuilder;

    const-string v19, "SD_"

    invoke-direct/range {v18 .. v19}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/pad/android/iappad/AdController;->sectionid:Ljava/lang/String;

    move-object/from16 v19, v0

    invoke-virtual/range {v18 .. v19}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v18

    invoke-virtual/range {v18 .. v18}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v18

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/pad/android/iappad/AdController;->adDisplayInterval:Ljava/lang/String;

    move-object/from16 v19, v0

    move-object/from16 v0, v18

    move-object/from16 v1, v19

    invoke-interface {v8, v0, v1}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    goto/16 :goto_124

    .line 518
    :cond_25c
    new-instance v18, Ljava/lang/StringBuilder;

    const-string v19, "SD_"

    invoke-direct/range {v18 .. v19}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/pad/android/iappad/AdController;->sectionid:Ljava/lang/String;

    move-object/from16 v19, v0

    invoke-virtual/range {v18 .. v19}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v18

    invoke-virtual/range {v18 .. v18}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v18

    const-string v19, "0"

    move-object/from16 v0, v18

    move-object/from16 v1, v19

    invoke-interface {v8, v0, v1}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    goto/16 :goto_124

    .line 550
    .end local v7    # "e":Ljava/lang/Exception;
    :catch_27c
    move-exception v7

    .line 552
    .restart local v7    # "e":Ljava/lang/Exception;
    const-string v18, "LBAdController"

    const-string v19, "Error when setting Hardware Acceleration Flags"

    invoke-static/range {v18 .. v19}, Lcom/pad/android/util/AdLog;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 553
    const-string v18, "LBAdController"

    move-object/from16 v0, v18

    invoke-static {v0, v7}, Lcom/pad/android/util/AdLog;->printStackTrace(Ljava/lang/String;Ljava/lang/Exception;)V

    goto/16 :goto_1a5

    .line 575
    .end local v7    # "e":Ljava/lang/Exception;
    .end local v8    # "editor":Landroid/content/SharedPreferences$Editor;
    .end local v13    # "pref":Landroid/content/SharedPreferences;
    :cond_28d
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/pad/android/iappad/AdController;->listener:Lcom/pad/android/listener/AdListener;

    move-object/from16 v18, v0

    if-eqz v18, :cond_35

    .line 577
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/pad/android/iappad/AdController;->listener:Lcom/pad/android/listener/AdListener;

    move-object/from16 v18, v0

    invoke-interface/range {v18 .. v18}, Lcom/pad/android/listener/AdListener;->onAdFailed()V

    goto/16 :goto_35

    .line 539
    .restart local v8    # "editor":Landroid/content/SharedPreferences$Editor;
    .restart local v13    # "pref":Landroid/content/SharedPreferences;
    :catch_2a0
    move-exception v18

    goto/16 :goto_15b

    .line 532
    .restart local v9    # "invalidate":Ljava/lang/String;
    :catch_2a3
    move-exception v18

    goto/16 :goto_143

    .line 499
    .end local v8    # "editor":Landroid/content/SharedPreferences$Editor;
    .end local v9    # "invalidate":Ljava/lang/String;
    .end local v13    # "pref":Landroid/content/SharedPreferences;
    :catch_2a6
    move-exception v18

    goto/16 :goto_ea
.end method

.method public loadAd()V
    .registers 9

    .prologue
    .line 643
    iget-object v4, p0, Lcom/pad/android/iappad/AdController;->activity:Landroid/app/Activity;

    const-string v5, "Preference"

    const/4 v6, 0x2

    invoke-virtual {v4, v5, v6}, Landroid/app/Activity;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v3

    .line 644
    .local v3, "pref":Landroid/content/SharedPreferences;
    const-string v4, "SD_APP_OPTIN_SHOWN"

    const-string v5, "notset"

    invoke-interface {v3, v4, v5}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 645
    .local v2, "optinShowed":Ljava/lang/String;
    const-string v4, "SD_APP_OPTIN"

    const-string v5, "notset"

    invoke-interface {v3, v4, v5}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 647
    .local v1, "optin":Ljava/lang/String;
    const-string v4, "notset"

    invoke-virtual {v2, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-nez v4, :cond_37

    const-string v4, "0"

    invoke-virtual {v1, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_37

    .line 650
    invoke-interface {v3}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    .line 651
    .local v0, "editor":Landroid/content/SharedPreferences$Editor;
    const-string v4, "SD_APP_OPTIN_SHOWN"

    const-string v5, "invalid"

    invoke-interface {v0, v4, v5}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    .line 652
    invoke-interface {v0}, Landroid/content/SharedPreferences$Editor;->commit()Z

    .line 655
    .end local v0    # "editor":Landroid/content/SharedPreferences$Editor;
    :cond_37
    const-string v4, "LBAdController"

    const-string v5, "loadAd called"

    invoke-static {v4, v5}, Lcom/pad/android/util/AdLog;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 656
    const/4 v4, 0x0

    iput-boolean v4, p0, Lcom/pad/android/iappad/AdController;->onAdLoaded:Z

    .line 657
    iget-boolean v4, p0, Lcom/pad/android/iappad/AdController;->initialized:Z

    if-nez v4, :cond_76

    .line 659
    const/4 v4, 0x1

    iput-boolean v4, p0, Lcom/pad/android/iappad/AdController;->loadAd:Z

    .line 660
    invoke-direct {p0}, Lcom/pad/android/iappad/AdController;->initialize()V

    .line 666
    :goto_4b
    iget-object v4, p0, Lcom/pad/android/iappad/AdController;->listener:Lcom/pad/android/listener/AdListener;

    if-eqz v4, :cond_75

    iget v4, p0, Lcom/pad/android/iappad/AdController;->progressInterval:I

    if-lez v4, :cond_75

    .line 668
    iget-object v4, p0, Lcom/pad/android/iappad/AdController;->loadProgress:Ljava/lang/Runnable;

    if-nez v4, :cond_5e

    .line 670
    new-instance v4, Lcom/pad/android/iappad/AdController$1;

    invoke-direct {v4, p0}, Lcom/pad/android/iappad/AdController$1;-><init>(Lcom/pad/android/iappad/AdController;)V

    iput-object v4, p0, Lcom/pad/android/iappad/AdController;->loadProgress:Ljava/lang/Runnable;

    .line 690
    :cond_5e
    iget-object v4, p0, Lcom/pad/android/iappad/AdController;->progressHandler:Landroid/os/Handler;

    if-nez v4, :cond_75

    .line 693
    new-instance v4, Landroid/os/Handler;

    invoke-direct {v4}, Landroid/os/Handler;-><init>()V

    iput-object v4, p0, Lcom/pad/android/iappad/AdController;->progressHandler:Landroid/os/Handler;

    .line 694
    iget-object v4, p0, Lcom/pad/android/iappad/AdController;->progressHandler:Landroid/os/Handler;

    iget-object v5, p0, Lcom/pad/android/iappad/AdController;->loadProgress:Ljava/lang/Runnable;

    iget v6, p0, Lcom/pad/android/iappad/AdController;->progressInterval:I

    mul-int/lit16 v6, v6, 0x3e8

    int-to-long v6, v6

    invoke-virtual {v4, v5, v6, v7}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 698
    :cond_75
    return-void

    .line 664
    :cond_76
    invoke-direct {p0}, Lcom/pad/android/iappad/AdController;->displayAd()V

    goto :goto_4b
.end method

.method public loadOptin(Landroid/app/Activity;Ljava/lang/String;Lcom/pad/android/listener/AdOptinListener;)V
    .registers 7
    .param p1, "act"    # Landroid/app/Activity;
    .param p2, "section"    # Ljava/lang/String;
    .param p3, "oListener"    # Lcom/pad/android/listener/AdOptinListener;

    .prologue
    .line 363
    if-eqz p1, :cond_12

    .line 365
    instance-of v1, p1, Landroid/app/Activity;

    if-eqz v1, :cond_13

    .line 367
    new-instance v0, Lcom/pad/android/util/AdOptinRequest;

    const/4 v1, 0x0

    invoke-direct {v0, p1, p2, v1, p3}, Lcom/pad/android/util/AdOptinRequest;-><init>(Landroid/app/Activity;Ljava/lang/String;Landroid/content/Context;Lcom/pad/android/listener/AdOptinListener;)V

    .line 368
    .local v0, "optin":Lcom/pad/android/util/AdOptinRequest;
    const/4 v1, 0x0

    new-array v1, v1, [Ljava/lang/Void;

    invoke-virtual {v0, v1}, Lcom/pad/android/util/AdOptinRequest;->execute([Ljava/lang/Object;)Landroid/os/AsyncTask;

    .line 375
    .end local v0    # "optin":Lcom/pad/android/util/AdOptinRequest;
    :cond_12
    :goto_12
    return-void

    .line 372
    :cond_13
    const-string v1, "com.pad.android.iappad.AdController"

    const-string v2, "Activity required for loadOptin - incorrect value passed"

    invoke-static {v1, v2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_12
.end method

.method public onBackPressed()Z
    .registers 2

    .prologue
    .line 1764
    iget-boolean v0, p0, Lcom/pad/android/iappad/AdController;->linkClicked:Z

    if-eqz v0, :cond_9

    .line 1766
    invoke-virtual {p0}, Lcom/pad/android/iappad/AdController;->loadAd()V

    .line 1767
    const/4 v0, 0x1

    .line 1769
    :goto_8
    return v0

    :cond_9
    const/4 v0, 0x0

    goto :goto_8
.end method

.method public onLinkClicked()V
    .registers 1

    .prologue
    .line 396
    invoke-direct {p0}, Lcom/pad/android/iappad/AdController;->linkClicked()V

    .line 397
    return-void
.end method

.method public pauseAd()V
    .registers 6

    .prologue
    .line 300
    iget-object v3, p0, Lcom/pad/android/iappad/AdController;->activity:Landroid/app/Activity;

    if-eqz v3, :cond_2b

    iget-object v2, p0, Lcom/pad/android/iappad/AdController;->activity:Landroid/app/Activity;

    .line 301
    .local v2, "toUse":Landroid/content/Context;
    :goto_6
    const-string v3, "Preference"

    const/4 v4, 0x2

    invoke-virtual {v2, v3, v4}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v1

    .line 302
    .local v1, "pref":Landroid/content/SharedPreferences;
    invoke-interface {v1}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    .line 304
    .local v0, "editor":Landroid/content/SharedPreferences$Editor;
    new-instance v3, Ljava/lang/StringBuilder;

    const-string v4, "SD_ADSTATUS_"

    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v4, p0, Lcom/pad/android/iappad/AdController;->sectionid:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    const-string v4, "hidden"

    invoke-interface {v0, v3, v4}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    .line 305
    invoke-interface {v0}, Landroid/content/SharedPreferences$Editor;->commit()Z

    .line 306
    return-void

    .line 300
    .end local v0    # "editor":Landroid/content/SharedPreferences$Editor;
    .end local v1    # "pref":Landroid/content/SharedPreferences;
    .end local v2    # "toUse":Landroid/content/Context;
    :cond_2b
    iget-object v2, p0, Lcom/pad/android/iappad/AdController;->context:Landroid/content/Context;

    goto :goto_6
.end method

.method public resumeAd()V
    .registers 8

    .prologue
    .line 316
    iget-object v4, p0, Lcom/pad/android/iappad/AdController;->activity:Landroid/app/Activity;

    if-eqz v4, :cond_34

    iget-object v3, p0, Lcom/pad/android/iappad/AdController;->activity:Landroid/app/Activity;

    .line 317
    .local v3, "toUse":Landroid/content/Context;
    :goto_6
    const-string v4, "Preference"

    const/4 v5, 0x2

    invoke-virtual {v3, v4, v5}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v2

    .line 318
    .local v2, "pref":Landroid/content/SharedPreferences;
    invoke-interface {v2}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v1

    .line 320
    .local v1, "editor":Landroid/content/SharedPreferences$Editor;
    new-instance v4, Ljava/lang/StringBuilder;

    const-string v5, "SD_ADSTATUS_"

    invoke-direct {v4, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v5, p0, Lcom/pad/android/iappad/AdController;->sectionid:Ljava/lang/String;

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    const-string v5, "default"

    invoke-interface {v1, v4, v5}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    .line 321
    invoke-interface {v1}, Landroid/content/SharedPreferences$Editor;->commit()Z

    .line 322
    iget-object v4, p0, Lcom/pad/android/iappad/AdController;->listener:Lcom/pad/android/listener/AdListener;

    if-eqz v4, :cond_33

    .line 326
    :try_start_2e
    iget-object v4, p0, Lcom/pad/android/iappad/AdController;->listener:Lcom/pad/android/listener/AdListener;

    invoke-interface {v4}, Lcom/pad/android/listener/AdListener;->onAdResumed()V
    :try_end_33
    .catch Ljava/lang/Exception; {:try_start_2e .. :try_end_33} :catch_37

    .line 334
    :cond_33
    :goto_33
    return-void

    .line 316
    .end local v1    # "editor":Landroid/content/SharedPreferences$Editor;
    .end local v2    # "pref":Landroid/content/SharedPreferences;
    .end local v3    # "toUse":Landroid/content/Context;
    :cond_34
    iget-object v3, p0, Lcom/pad/android/iappad/AdController;->context:Landroid/content/Context;

    goto :goto_6

    .line 328
    .restart local v1    # "editor":Landroid/content/SharedPreferences$Editor;
    .restart local v2    # "pref":Landroid/content/SharedPreferences;
    .restart local v3    # "toUse":Landroid/content/Context;
    :catch_37
    move-exception v0

    .line 330
    .local v0, "e":Ljava/lang/Exception;
    const-string v4, "LBAdController"

    invoke-static {v4, v0}, Lcom/pad/android/util/AdLog;->printStackTrace(Ljava/lang/String;Ljava/lang/Exception;)V

    .line 331
    const-string v4, "LBAdController"

    new-instance v5, Ljava/lang/StringBuilder;

    const-string v6, "Error while triggering onAdResumed - "

    invoke-direct {v5, v6}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Lcom/pad/android/util/AdLog;->e(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_33
.end method

.method public setAdDestroyed(Z)V
    .registers 2
    .param p1, "aD"    # Z

    .prologue
    .line 1774
    iput-boolean p1, p0, Lcom/pad/android/iappad/AdController;->adDestroyed:Z

    .line 1775
    return-void
.end method

.method public setAdLoaded(Z)V
    .registers 2
    .param p1, "aL"    # Z

    .prologue
    .line 1796
    iput-boolean p1, p0, Lcom/pad/android/iappad/AdController;->adLoaded:Z

    .line 1797
    return-void
.end method

.method public setAdditionalDockingMargin(I)V
    .registers 5
    .param p1, "newOffset"    # I

    .prologue
    .line 226
    iput p1, p0, Lcom/pad/android/iappad/AdController;->additionalDockingMargin:I

    .line 227
    const-string v0, "LBAdController"

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "setAdditionalDockingMargin: "

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/pad/android/util/AdLog;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 228
    return-void
.end method

.method public setAsynchTask(Z)V
    .registers 2
    .param p1, "asynch"    # Z

    .prologue
    .line 241
    return-void
.end method

.method public setCompleted(Z)V
    .registers 2
    .param p1, "c"    # Z

    .prologue
    .line 406
    iput-boolean p1, p0, Lcom/pad/android/iappad/AdController;->completed:Z

    .line 407
    return-void
.end method

.method public setHomeLoaded(Z)V
    .registers 2
    .param p1, "hL"    # Z

    .prologue
    .line 391
    iput-boolean p1, p0, Lcom/pad/android/iappad/AdController;->homeLoaded:Z

    .line 392
    return-void
.end method

.method public setLayout(Landroid/widget/RelativeLayout;)V
    .registers 2
    .param p1, "ly"    # Landroid/widget/RelativeLayout;

    .prologue
    .line 214
    iput-object p1, p0, Lcom/pad/android/iappad/AdController;->layout:Landroid/widget/RelativeLayout;

    .line 215
    return-void
.end method

.method public setLoading(Z)V
    .registers 2
    .param p1, "l"    # Z

    .prologue
    .line 401
    iput-boolean p1, p0, Lcom/pad/android/iappad/AdController;->loading:Z

    .line 402
    return-void
.end method

.method public setOnAdLoaded(Z)V
    .registers 2
    .param p1, "sOA"    # Z

    .prologue
    .line 1787
    iput-boolean p1, p0, Lcom/pad/android/iappad/AdController;->onAdLoaded:Z

    .line 1788
    return-void
.end method

.method public setOnProgressInterval(I)V
    .registers 2
    .param p1, "pI"    # I

    .prologue
    .line 276
    iput p1, p0, Lcom/pad/android/iappad/AdController;->progressInterval:I

    .line 277
    return-void
.end method

.method public setResults(Lorg/json/JSONObject;)V
    .registers 2
    .param p1, "res"    # Lorg/json/JSONObject;

    .prologue
    .line 429
    if-eqz p1, :cond_4

    .line 431
    iput-object p1, p0, Lcom/pad/android/iappad/AdController;->results:Lorg/json/JSONObject;

    .line 433
    :cond_4
    return-void
.end method

.method public setSubId(Ljava/lang/String;)V
    .registers 2
    .param p1, "sbid"    # Ljava/lang/String;

    .prologue
    .line 252
    iput-object p1, p0, Lcom/pad/android/iappad/AdController;->subid:Ljava/lang/String;

    .line 253
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
    .line 264
    .local p1, "tks":Ljava/util/List;, "Ljava/util/List<Lorg/apache/http/NameValuePair;>;"
    iput-object p1, p0, Lcom/pad/android/iappad/AdController;->tokens:Ljava/util/List;

    .line 265
    return-void
.end method

.method public setUseLocation(Z)V
    .registers 5
    .param p1, "uL"    # Z

    .prologue
    .line 201
    iput-boolean p1, p0, Lcom/pad/android/iappad/AdController;->useLocation:Z

    .line 202
    const-string v0, "LBAdController"

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "setUseLocation: "

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/pad/android/util/AdLog;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 203
    return-void
.end method

.method public showAd()V
    .registers 1

    .prologue
    .line 351
    invoke-virtual {p0}, Lcom/pad/android/iappad/AdController;->resumeAd()V

    .line 352
    return-void
.end method

.method public triggerAdCompleted()V
    .registers 4

    .prologue
    .line 411
    iget-object v1, p0, Lcom/pad/android/iappad/AdController;->listener:Lcom/pad/android/listener/AdListener;

    if-eqz v1, :cond_10

    .line 416
    :try_start_4
    const-string v1, "LBAdController"

    const-string v2, "onAdCompleted triggered"

    invoke-static {v1, v2}, Lcom/pad/android/util/AdLog;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 417
    iget-object v1, p0, Lcom/pad/android/iappad/AdController;->listener:Lcom/pad/android/listener/AdListener;

    invoke-interface {v1}, Lcom/pad/android/listener/AdListener;->onAdCompleted()V
    :try_end_10
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_10} :catch_11

    .line 425
    :cond_10
    :goto_10
    return-void

    .line 419
    :catch_11
    move-exception v0

    .line 421
    .local v0, "e":Ljava/lang/Exception;
    const-string v1, "LBAdController"

    const-string v2, "error when onAdCompleted triggered"

    invoke-static {v1, v2}, Lcom/pad/android/util/AdLog;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 422
    const-string v1, "LBAdController"

    invoke-static {v1, v0}, Lcom/pad/android/util/AdLog;->printStackTrace(Ljava/lang/String;Ljava/lang/Exception;)V

    goto :goto_10
.end method

.method public triggerAdFailed()V
    .registers 4

    .prologue
    .line 584
    const-string v1, "LBAdController"

    const-string v2, "No Internet connection detected. No Ads loaded"

    invoke-static {v1, v2}, Lcom/pad/android/util/AdLog;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 585
    iget-object v1, p0, Lcom/pad/android/iappad/AdController;->listener:Lcom/pad/android/listener/AdListener;

    if-eqz v1, :cond_1a

    .line 590
    :try_start_b
    const-string v1, "LBAdController"

    const-string v2, "onAdFailed triggered"

    invoke-static {v1, v2}, Lcom/pad/android/util/AdLog;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 591
    iget-object v1, p0, Lcom/pad/android/iappad/AdController;->listener:Lcom/pad/android/listener/AdListener;

    invoke-interface {v1}, Lcom/pad/android/listener/AdListener;->onAdFailed()V

    .line 592
    const/4 v1, 0x1

    iput-boolean v1, p0, Lcom/pad/android/iappad/AdController;->adLoaded:Z
    :try_end_1a
    .catch Ljava/lang/Exception; {:try_start_b .. :try_end_1a} :catch_1b

    .line 600
    :cond_1a
    :goto_1a
    return-void

    .line 594
    :catch_1b
    move-exception v0

    .line 596
    .local v0, "e":Ljava/lang/Exception;
    const-string v1, "LBAdController"

    const-string v2, "Error while calling onAdFailed"

    invoke-static {v1, v2}, Lcom/pad/android/util/AdLog;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 597
    const-string v1, "LBAdController"

    invoke-static {v1, v0}, Lcom/pad/android/util/AdLog;->printStackTrace(Ljava/lang/String;Ljava/lang/Exception;)V

    goto :goto_1a
.end method

###### Class com.pad.android.iappad.AdController.AnonymousClass1 (com.pad.android.iappad.AdController$1)
.class Lcom/pad/android/iappad/AdController$1;
.super Ljava/lang/Object;
.source "AdController.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/pad/android/iappad/AdController;->loadAd()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/pad/android/iappad/AdController;


# direct methods
.method constructor <init>(Lcom/pad/android/iappad/AdController;)V
    .registers 2

    .prologue
    .line 1
    iput-object p1, p0, Lcom/pad/android/iappad/AdController$1;->this$0:Lcom/pad/android/iappad/AdController;

    .line 670
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .registers 6

    .prologue
    .line 675
    :try_start_0
    iget-object v1, p0, Lcom/pad/android/iappad/AdController$1;->this$0:Lcom/pad/android/iappad/AdController;

    invoke-static {v1}, Lcom/pad/android/iappad/AdController;->access$14(Lcom/pad/android/iappad/AdController;)Z

    move-result v1

    if-nez v1, :cond_38

    iget-object v1, p0, Lcom/pad/android/iappad/AdController$1;->this$0:Lcom/pad/android/iappad/AdController;

    invoke-static {v1}, Lcom/pad/android/iappad/AdController;->access$15(Lcom/pad/android/iappad/AdController;)Z

    move-result v1

    if-nez v1, :cond_38

    .line 677
    const-string v1, "LBAdController"

    const-string v2, "onAdProgress triggered"

    invoke-static {v1, v2}, Lcom/pad/android/util/AdLog;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 678
    iget-object v1, p0, Lcom/pad/android/iappad/AdController$1;->this$0:Lcom/pad/android/iappad/AdController;

    invoke-static {v1}, Lcom/pad/android/iappad/AdController;->access$3(Lcom/pad/android/iappad/AdController;)Lcom/pad/android/listener/AdListener;

    move-result-object v1

    invoke-interface {v1}, Lcom/pad/android/listener/AdListener;->onAdProgress()V

    .line 679
    iget-object v1, p0, Lcom/pad/android/iappad/AdController$1;->this$0:Lcom/pad/android/iappad/AdController;

    invoke-static {v1}, Lcom/pad/android/iappad/AdController;->access$16(Lcom/pad/android/iappad/AdController;)Landroid/os/Handler;

    move-result-object v1

    iget-object v2, p0, Lcom/pad/android/iappad/AdController$1;->this$0:Lcom/pad/android/iappad/AdController;

    invoke-static {v2}, Lcom/pad/android/iappad/AdController;->access$17(Lcom/pad/android/iappad/AdController;)Ljava/lang/Runnable;

    move-result-object v2

    iget-object v3, p0, Lcom/pad/android/iappad/AdController$1;->this$0:Lcom/pad/android/iappad/AdController;

    invoke-static {v3}, Lcom/pad/android/iappad/AdController;->access$18(Lcom/pad/android/iappad/AdController;)I

    move-result v3

    mul-int/lit16 v3, v3, 0x3e8

    int-to-long v3, v3

    invoke-virtual {v1, v2, v3, v4}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z
    :try_end_38
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_38} :catch_39

    .line 687
    :cond_38
    :goto_38
    return-void

    .line 682
    :catch_39
    move-exception v0

    .line 684
    .local v0, "e":Ljava/lang/Exception;
    const-string v1, "LBAdController"

    const-string v2, "error when onAdProgress triggered"

    invoke-static {v1, v2}, Lcom/pad/android/util/AdLog;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 685
    const-string v1, "LBAdController"

    invoke-static {v1, v0}, Lcom/pad/android/util/AdLog;->printStackTrace(Ljava/lang/String;Ljava/lang/Exception;)V

    goto :goto_38
.end method

###### Class com.pad.android.iappad.AdController.AnonymousClass2 (com.pad.android.iappad.AdController$2)
.class Lcom/pad/android/iappad/AdController$2;
.super Ljava/lang/Object;
.source "AdController.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/pad/android/iappad/AdController;->displayAd()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/pad/android/iappad/AdController;


# direct methods
.method constructor <init>(Lcom/pad/android/iappad/AdController;)V
    .registers 2

    .prologue
    .line 1
    iput-object p1, p0, Lcom/pad/android/iappad/AdController$2;->this$0:Lcom/pad/android/iappad/AdController;

    .line 774
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .registers 2
    .param p1, "v"    # Landroid/view/View;

    .prologue
    .line 776
    return-void
.end method

###### Class com.pad.android.iappad.AdController.AnonymousClass3 (com.pad.android.iappad.AdController$3)
.class Lcom/pad/android/iappad/AdController$3;
.super Ljava/lang/Object;
.source "AdController.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/pad/android/iappad/AdController;->displayAd()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/pad/android/iappad/AdController;


# direct methods
.method constructor <init>(Lcom/pad/android/iappad/AdController;)V
    .registers 2

    .prologue
    .line 1
    iput-object p1, p0, Lcom/pad/android/iappad/AdController$3;->this$0:Lcom/pad/android/iappad/AdController;

    .line 902
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .registers 3
    .param p1, "v"    # Landroid/view/View;

    .prologue
    .line 904
    iget-object v0, p0, Lcom/pad/android/iappad/AdController$3;->this$0:Lcom/pad/android/iappad/AdController;

    invoke-static {v0}, Lcom/pad/android/iappad/AdController;->access$13(Lcom/pad/android/iappad/AdController;)V

    .line 905
    return-void
.end method

###### Class com.pad.android.iappad.AdController.AnonymousClass4 (com.pad.android.iappad.AdController$4)
.class Lcom/pad/android/iappad/AdController$4;
.super Ljava/lang/Object;
.source "AdController.java"

# interfaces
.implements Landroid/view/View$OnTouchListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/pad/android/iappad/AdController;->displayAd()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/pad/android/iappad/AdController;


# direct methods
.method constructor <init>(Lcom/pad/android/iappad/AdController;)V
    .registers 2

    .prologue
    .line 1
    iput-object p1, p0, Lcom/pad/android/iappad/AdController$4;->this$0:Lcom/pad/android/iappad/AdController;

    .line 927
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onTouch(Landroid/view/View;Landroid/view/MotionEvent;)Z
    .registers 4
    .param p1, "v"    # Landroid/view/View;
    .param p2, "event"    # Landroid/view/MotionEvent;

    .prologue
    .line 929
    const/4 v0, 0x3

    invoke-virtual {p2, v0}, Landroid/view/MotionEvent;->setAction(I)V

    .line 930
    const/4 v0, 0x0

    return v0
.end method

###### Class com.pad.android.iappad.AdController.AnonymousClass5 (com.pad.android.iappad.AdController$5)
.class Lcom/pad/android/iappad/AdController$5;
.super Ljava/lang/Object;
.source "AdController.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/pad/android/iappad/AdController;->linkClicked()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/pad/android/iappad/AdController;


# direct methods
.method constructor <init>(Lcom/pad/android/iappad/AdController;)V
    .registers 2

    .prologue
    .line 1
    iput-object p1, p0, Lcom/pad/android/iappad/AdController$5;->this$0:Lcom/pad/android/iappad/AdController;

    .line 1195
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .registers 3
    .param p1, "v"    # Landroid/view/View;

    .prologue
    .line 1197
    iget-object v0, p0, Lcom/pad/android/iappad/AdController$5;->this$0:Lcom/pad/android/iappad/AdController;

    invoke-virtual {v0}, Lcom/pad/android/iappad/AdController;->loadAd()V

    .line 1198
    return-void
.end method

###### Class com.pad.android.iappad.AdController.AnonymousClass6 (com.pad.android.iappad.AdController$6)
.class Lcom/pad/android/iappad/AdController$6;
.super Ljava/lang/Object;
.source "AdController.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/pad/android/iappad/AdController;->linkClicked()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/pad/android/iappad/AdController;


# direct methods
.method constructor <init>(Lcom/pad/android/iappad/AdController;)V
    .registers 2

    .prologue
    .line 1
    iput-object p1, p0, Lcom/pad/android/iappad/AdController$6;->this$0:Lcom/pad/android/iappad/AdController;

    .line 1211
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .registers 3
    .param p1, "v"    # Landroid/view/View;

    .prologue
    .line 1213
    iget-object v0, p0, Lcom/pad/android/iappad/AdController$6;->this$0:Lcom/pad/android/iappad/AdController;

    invoke-static {v0}, Lcom/pad/android/iappad/AdController;->access$13(Lcom/pad/android/iappad/AdController;)V

    .line 1214
    return-void
.end method

###### Class com.pad.android.iappad.AdController.AnonymousClass7 (com.pad.android.iappad.AdController$7)
.class Lcom/pad/android/iappad/AdController$7;
.super Ljava/lang/Object;
.source "AdController.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/pad/android/iappad/AdController;->linkClicked()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/pad/android/iappad/AdController;


# direct methods
.method constructor <init>(Lcom/pad/android/iappad/AdController;)V
    .registers 2

    .prologue
    .line 1
    iput-object p1, p0, Lcom/pad/android/iappad/AdController$7;->this$0:Lcom/pad/android/iappad/AdController;

    .line 1223
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .registers 3
    .param p1, "v"    # Landroid/view/View;

    .prologue
    .line 1225
    iget-object v0, p0, Lcom/pad/android/iappad/AdController$7;->this$0:Lcom/pad/android/iappad/AdController;

    invoke-static {v0}, Lcom/pad/android/iappad/AdController;->access$19(Lcom/pad/android/iappad/AdController;)V

    .line 1226
    return-void
.end method

###### Class com.pad.android.iappad.AdController.AnonymousClass8 (com.pad.android.iappad.AdController$8)
.class Lcom/pad/android/iappad/AdController$8;
.super Ljava/lang/Object;
.source "AdController.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/pad/android/iappad/AdController;->linkClicked()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/pad/android/iappad/AdController;


# direct methods
.method constructor <init>(Lcom/pad/android/iappad/AdController;)V
    .registers 2

    .prologue
    .line 1
    iput-object p1, p0, Lcom/pad/android/iappad/AdController$8;->this$0:Lcom/pad/android/iappad/AdController;

    .line 1239
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .registers 3
    .param p1, "v"    # Landroid/view/View;

    .prologue
    .line 1241
    iget-object v0, p0, Lcom/pad/android/iappad/AdController$8;->this$0:Lcom/pad/android/iappad/AdController;

    invoke-static {v0}, Lcom/pad/android/iappad/AdController;->access$20(Lcom/pad/android/iappad/AdController;)V

    .line 1242
    return-void
.end method

###### Class com.pad.android.iappad.AdController.AnonymousClass9 (com.pad.android.iappad.AdController$9)
.class Lcom/pad/android/iappad/AdController$9;
.super Ljava/lang/Object;
.source "AdController.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/pad/android/iappad/AdController;->showManualPoll()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/pad/android/iappad/AdController;


# direct methods
.method constructor <init>(Lcom/pad/android/iappad/AdController;)V
    .registers 2

    .prologue
    .line 1
    iput-object p1, p0, Lcom/pad/android/iappad/AdController$9;->this$0:Lcom/pad/android/iappad/AdController;

    .line 1443
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .registers 8
    .param p1, "v"    # Landroid/view/View;

    .prologue
    .line 1445
    iget-object v1, p0, Lcom/pad/android/iappad/AdController$9;->this$0:Lcom/pad/android/iappad/AdController;

    iget-object v2, p0, Lcom/pad/android/iappad/AdController$9;->this$0:Lcom/pad/android/iappad/AdController;

    invoke-static {v2}, Lcom/pad/android/iappad/AdController;->access$21(Lcom/pad/android/iappad/AdController;)Landroid/app/Activity;

    move-result-object v2

    const-string v3, ""

    const-string v4, "Checking....Please Wait!"

    const/4 v5, 0x1

    invoke-static {v2, v3, v4, v5}, Landroid/app/ProgressDialog;->show(Landroid/content/Context;Ljava/lang/CharSequence;Ljava/lang/CharSequence;Z)Landroid/app/ProgressDialog;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/pad/android/iappad/AdController;->access$22(Lcom/pad/android/iappad/AdController;Landroid/app/ProgressDialog;)V

    .line 1446
    iget-object v1, p0, Lcom/pad/android/iappad/AdController$9;->this$0:Lcom/pad/android/iappad/AdController;

    invoke-static {v1}, Lcom/pad/android/iappad/AdController;->access$10(Lcom/pad/android/iappad/AdController;)Lcom/pad/android/iappad/AdController$OfferPolling;

    move-result-object v1

    if-nez v1, :cond_28

    .line 1448
    iget-object v1, p0, Lcom/pad/android/iappad/AdController$9;->this$0:Lcom/pad/android/iappad/AdController;

    new-instance v2, Lcom/pad/android/iappad/AdController$OfferPolling;

    iget-object v3, p0, Lcom/pad/android/iappad/AdController$9;->this$0:Lcom/pad/android/iappad/AdController;

    invoke-direct {v2, v3}, Lcom/pad/android/iappad/AdController$OfferPolling;-><init>(Lcom/pad/android/iappad/AdController;)V

    invoke-static {v1, v2}, Lcom/pad/android/iappad/AdController;->access$23(Lcom/pad/android/iappad/AdController;Lcom/pad/android/iappad/AdController$OfferPolling;)V

    .line 1450
    :cond_28
    iget-object v1, p0, Lcom/pad/android/iappad/AdController$9;->this$0:Lcom/pad/android/iappad/AdController;

    new-instance v2, Landroid/os/Handler;

    invoke-direct {v2}, Landroid/os/Handler;-><init>()V

    invoke-static {v1, v2}, Lcom/pad/android/iappad/AdController;->access$24(Lcom/pad/android/iappad/AdController;Landroid/os/Handler;)V

    .line 1453
    :try_start_32
    const-string v1, "LBAdController"

    const-string v2, "Manually Polling"

    invoke-static {v1, v2}, Lcom/pad/android/util/AdLog;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 1454
    iget-object v1, p0, Lcom/pad/android/iappad/AdController$9;->this$0:Lcom/pad/android/iappad/AdController;

    invoke-static {v1}, Lcom/pad/android/iappad/AdController;->access$9(Lcom/pad/android/iappad/AdController;)Landroid/os/Handler;

    move-result-object v1

    iget-object v2, p0, Lcom/pad/android/iappad/AdController$9;->this$0:Lcom/pad/android/iappad/AdController;

    invoke-static {v2}, Lcom/pad/android/iappad/AdController;->access$10(Lcom/pad/android/iappad/AdController;)Lcom/pad/android/iappad/AdController$OfferPolling;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z
    :try_end_48
    .catch Ljava/lang/Exception; {:try_start_32 .. :try_end_48} :catch_49

    .line 1461
    :goto_48
    return-void

    .line 1456
    :catch_49
    move-exception v0

    .line 1458
    .local v0, "e":Ljava/lang/Exception;
    const-string v1, "LBAdController"

    new-instance v2, Ljava/lang/StringBuilder;

    const-string v3, "Error in manual polling - "

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/pad/android/util/AdLog;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 1459
    const-string v1, "LBAdController"

    invoke-static {v1, v0}, Lcom/pad/android/util/AdLog;->printStackTrace(Ljava/lang/String;Ljava/lang/Exception;)V

    goto :goto_48
.end method

###### Class com.pad.android.iappad.AdController.OfferPolling (com.pad.android.iappad.AdController$OfferPolling)
.class Lcom/pad/android/iappad/AdController$OfferPolling;
.super Ljava/util/TimerTask;
.source "AdController.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/pad/android/iappad/AdController;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = "OfferPolling"
.end annotation


# instance fields
.field final synthetic this$0:Lcom/pad/android/iappad/AdController;


# direct methods
.method constructor <init>(Lcom/pad/android/iappad/AdController;)V
    .registers 2

    .prologue
    .line 1741
    iput-object p1, p0, Lcom/pad/android/iappad/AdController$OfferPolling;->this$0:Lcom/pad/android/iappad/AdController;

    invoke-direct {p0}, Ljava/util/TimerTask;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .registers 7

    .prologue
    .line 1746
    new-instance v0, Lcom/pad/android/iappad/AdController$Polling;

    iget-object v1, p0, Lcom/pad/android/iappad/AdController$OfferPolling;->this$0:Lcom/pad/android/iappad/AdController;

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2}, Lcom/pad/android/iappad/AdController$Polling;-><init>(Lcom/pad/android/iappad/AdController;Lcom/pad/android/iappad/AdController$Polling;)V

    .line 1749
    .local v0, "poll":Lcom/pad/android/iappad/AdController$Polling;
    const/4 v1, 0x1

    :try_start_9
    new-array v1, v1, [Ljava/lang/String;

    const/4 v2, 0x0

    new-instance v3, Ljava/lang/StringBuilder;

    iget-object v4, p0, Lcom/pad/android/iappad/AdController$OfferPolling;->this$0:Lcom/pad/android/iappad/AdController;

    invoke-static {v4}, Lcom/pad/android/iappad/AdController;->access$1(Lcom/pad/android/iappad/AdController;)Lorg/json/JSONObject;

    move-result-object v4

    const-string v5, "pollurl"

    invoke-virtual {v4, v5}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    invoke-static {v4}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v4, p0, Lcom/pad/android/iappad/AdController$OfferPolling;->this$0:Lcom/pad/android/iappad/AdController;

    invoke-static {v4}, Lcom/pad/android/iappad/AdController;->access$0(Lcom/pad/android/iappad/AdController;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    aput-object v3, v1, v2

    invoke-virtual {v0, v1}, Lcom/pad/android/iappad/AdController$Polling;->execute([Ljava/lang/Object;)Landroid/os/AsyncTask;
    :try_end_34
    .catch Ljava/lang/Exception; {:try_start_9 .. :try_end_34} :catch_35

    .line 1752
    :goto_34
    return-void

    .line 1751
    :catch_35
    move-exception v1

    goto :goto_34
.end method

###### Class com.pad.android.iappad.AdController.PollRequest (com.pad.android.iappad.AdController$PollRequest)
.class Lcom/pad/android/iappad/AdController$PollRequest;
.super Landroid/os/AsyncTask;
.source "AdController.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/pad/android/iappad/AdController;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "PollRequest"
.end annotation

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
.field private pollRes:Ljava/lang/String;

.field final synthetic this$0:Lcom/pad/android/iappad/AdController;


# direct methods
.method private constructor <init>(Lcom/pad/android/iappad/AdController;)V
    .registers 3

    .prologue
    .line 1572
    iput-object p1, p0, Lcom/pad/android/iappad/AdController$PollRequest;->this$0:Lcom/pad/android/iappad/AdController;

    invoke-direct {p0}, Landroid/os/AsyncTask;-><init>()V

    .line 1574
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/pad/android/iappad/AdController$PollRequest;->pollRes:Ljava/lang/String;

    return-void
.end method

.method synthetic constructor <init>(Lcom/pad/android/iappad/AdController;Lcom/pad/android/iappad/AdController$PollRequest;)V
    .registers 3

    .prologue
    .line 1572
    invoke-direct {p0, p1}, Lcom/pad/android/iappad/AdController$PollRequest;-><init>(Lcom/pad/android/iappad/AdController;)V

    return-void
.end method

.method static synthetic access$3(Lcom/pad/android/iappad/AdController$PollRequest;)Lcom/pad/android/iappad/AdController;
    .registers 2

    .prologue
    .line 1572
    iget-object v0, p0, Lcom/pad/android/iappad/AdController$PollRequest;->this$0:Lcom/pad/android/iappad/AdController;

    return-object v0
.end method


# virtual methods
.method protected bridge varargs synthetic doInBackground([Ljava/lang/Object;)Ljava/lang/Object;
    .registers 3

    .prologue
    .line 1
    check-cast p1, [Ljava/lang/String;

    invoke-virtual {p0, p1}, Lcom/pad/android/iappad/AdController$PollRequest;->doInBackground([Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method protected varargs doInBackground([Ljava/lang/String;)Ljava/lang/String;
    .registers 12
    .param p1, "pollUrl"    # [Ljava/lang/String;

    .prologue
    const/4 v6, 0x0

    const/4 v9, 0x0

    .line 1578
    const-string v7, "LBAdController"

    const-string v8, "Initial Poll Started...."

    invoke-static {v7, v8}, Lcom/pad/android/util/AdLog;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 1579
    aget-object v7, p1, v9

    if-eqz v7, :cond_6c

    .line 1583
    :try_start_d
    new-instance v2, Lorg/apache/http/impl/client/DefaultHttpClient;

    invoke-direct {v2}, Lorg/apache/http/impl/client/DefaultHttpClient;-><init>()V

    .line 1584
    .local v2, "httpclient":Lorg/apache/http/client/HttpClient;
    new-instance v3, Lorg/apache/http/client/methods/HttpGet;

    new-instance v7, Ljava/lang/StringBuilder;

    const/4 v8, 0x0

    aget-object v8, p1, v8

    invoke-static {v8}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v8

    invoke-direct {v7, v8}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v8, p0, Lcom/pad/android/iappad/AdController$PollRequest;->this$0:Lcom/pad/android/iappad/AdController;

    invoke-static {v8}, Lcom/pad/android/iappad/AdController;->access$0(Lcom/pad/android/iappad/AdController;)Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-direct {v3, v7}, Lorg/apache/http/client/methods/HttpGet;-><init>(Ljava/lang/String;)V

    .line 1589
    .local v3, "httpget":Lorg/apache/http/client/methods/HttpGet;
    invoke-interface {v2, v3}, Lorg/apache/http/client/HttpClient;->execute(Lorg/apache/http/client/methods/HttpUriRequest;)Lorg/apache/http/HttpResponse;

    move-result-object v5

    .line 1590
    .local v5, "response":Lorg/apache/http/HttpResponse;
    invoke-interface {v5}, Lorg/apache/http/HttpResponse;->getStatusLine()Lorg/apache/http/StatusLine;

    move-result-object v7

    invoke-interface {v7}, Lorg/apache/http/StatusLine;->getStatusCode()I

    move-result v7

    const/16 v8, 0xc8

    if-ne v7, v8, :cond_6a

    .line 1592
    invoke-interface {v5}, Lorg/apache/http/HttpResponse;->getEntity()Lorg/apache/http/HttpEntity;

    move-result-object v1

    .line 1593
    .local v1, "entity":Lorg/apache/http/HttpEntity;
    if-eqz v1, :cond_6a

    .line 1595
    invoke-interface {v1}, Lorg/apache/http/HttpEntity;->getContent()Ljava/io/InputStream;

    move-result-object v4

    .line 1596
    .local v4, "instream":Ljava/io/InputStream;
    invoke-static {v4}, Lcom/pad/android/util/AdUtilFuncs;->convertStreamToString(Ljava/io/InputStream;)Ljava/lang/String;

    move-result-object v7

    iput-object v7, p0, Lcom/pad/android/iappad/AdController$PollRequest;->pollRes:Ljava/lang/String;

    .line 1597
    const-string v7, "LBAdController"

    new-instance v8, Ljava/lang/StringBuilder;

    const-string v9, "Result "

    invoke-direct {v8, v9}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v9, p0, Lcom/pad/android/iappad/AdController$PollRequest;->pollRes:Ljava/lang/String;

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-static {v7, v8}, Lcom/pad/android/util/AdLog;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 1598
    invoke-virtual {v4}, Ljava/io/InputStream;->close()V
    :try_end_6a
    .catch Ljava/lang/Exception; {:try_start_d .. :try_end_6a} :catch_6d

    .line 1606
    .end local v1    # "entity":Lorg/apache/http/HttpEntity;
    .end local v2    # "httpclient":Lorg/apache/http/client/HttpClient;
    .end local v3    # "httpget":Lorg/apache/http/client/methods/HttpGet;
    .end local v4    # "instream":Ljava/io/InputStream;
    .end local v5    # "response":Lorg/apache/http/HttpResponse;
    :cond_6a
    :goto_6a
    iget-object v6, p0, Lcom/pad/android/iappad/AdController$PollRequest;->pollRes:Ljava/lang/String;

    .line 1608
    :cond_6c
    return-object v6

    .line 1602
    :catch_6d
    move-exception v0

    .line 1604
    .local v0, "e":Ljava/lang/Exception;
    iput-object v6, p0, Lcom/pad/android/iappad/AdController$PollRequest;->pollRes:Ljava/lang/String;

    goto :goto_6a
.end method

.method protected bridge synthetic onPostExecute(Ljava/lang/Object;)V
    .registers 2

    .prologue
    .line 1
    check-cast p1, Ljava/lang/String;

    invoke-virtual {p0, p1}, Lcom/pad/android/iappad/AdController$PollRequest;->onPostExecute(Ljava/lang/String;)V

    return-void
.end method

.method protected onPostExecute(Ljava/lang/String;)V
    .registers 8
    .param p1, "res"    # Ljava/lang/String;

    .prologue
    .line 1613
    invoke-super {p0, p1}, Landroid/os/AsyncTask;->onPostExecute(Ljava/lang/Object;)V

    .line 1614
    if-eqz p1, :cond_11

    invoke-virtual {p1}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v3

    const-string v4, "0"

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_63

    .line 1618
    :cond_11
    :try_start_11
    iget-object v3, p0, Lcom/pad/android/iappad/AdController$PollRequest;->this$0:Lcom/pad/android/iappad/AdController;

    invoke-static {v3}, Lcom/pad/android/iappad/AdController;->access$1(Lcom/pad/android/iappad/AdController;)Lorg/json/JSONObject;

    move-result-object v3

    const-string v4, "timeopen"

    invoke-virtual {v3, v4}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    move-result v3

    if-lez v3, :cond_56

    .line 1620
    iget-object v3, p0, Lcom/pad/android/iappad/AdController$PollRequest;->this$0:Lcom/pad/android/iappad/AdController;

    invoke-static {v3}, Lcom/pad/android/iappad/AdController;->access$1(Lcom/pad/android/iappad/AdController;)Lorg/json/JSONObject;

    move-result-object v3

    const-string v4, "timeopen"

    invoke-virtual {v3, v4}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    move-result v3

    mul-int/lit16 v2, v3, 0x3e8

    .line 1621
    .local v2, "time":I
    const-string v3, "LBAdController"

    new-instance v4, Ljava/lang/StringBuilder;

    const-string v5, "Tease Time used - ad will load after "

    invoke-direct {v4, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, "ms"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Lcom/pad/android/util/AdLog;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 1622
    new-instance v1, Landroid/os/Handler;

    invoke-direct {v1}, Landroid/os/Handler;-><init>()V

    .line 1623
    .local v1, "handl":Landroid/os/Handler;
    new-instance v3, Lcom/pad/android/iappad/AdController$PollRequest$1;

    invoke-direct {v3, p0}, Lcom/pad/android/iappad/AdController$PollRequest$1;-><init>(Lcom/pad/android/iappad/AdController$PollRequest;)V

    .line 1627
    int-to-long v4, v2

    .line 1623
    invoke-virtual {v1, v3, v4, v5}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 1660
    .end local v1    # "handl":Landroid/os/Handler;
    .end local v2    # "time":I
    :cond_55
    :goto_55
    return-void

    .line 1632
    :cond_56
    iget-object v3, p0, Lcom/pad/android/iappad/AdController$PollRequest;->this$0:Lcom/pad/android/iappad/AdController;

    invoke-static {v3}, Lcom/pad/android/iappad/AdController;->access$2(Lcom/pad/android/iappad/AdController;)V
    :try_end_5b
    .catch Ljava/lang/Exception; {:try_start_11 .. :try_end_5b} :catch_5c

    goto :goto_55

    .line 1635
    :catch_5c
    move-exception v0

    .line 1638
    .local v0, "e":Ljava/lang/Exception;
    iget-object v3, p0, Lcom/pad/android/iappad/AdController$PollRequest;->this$0:Lcom/pad/android/iappad/AdController;

    invoke-static {v3}, Lcom/pad/android/iappad/AdController;->access$2(Lcom/pad/android/iappad/AdController;)V

    goto :goto_55

    .line 1641
    .end local v0    # "e":Ljava/lang/Exception;
    :cond_63
    invoke-virtual {p1}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v3

    const-string v4, "1"

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_55

    .line 1643
    const-string v3, "LBAdController"

    const-string v4, "Going to trigger onAdAlreadyCompleted event"

    invoke-static {v3, v4}, Lcom/pad/android/util/AdLog;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 1645
    iget-object v3, p0, Lcom/pad/android/iappad/AdController$PollRequest;->this$0:Lcom/pad/android/iappad/AdController;

    invoke-static {v3}, Lcom/pad/android/iappad/AdController;->access$3(Lcom/pad/android/iappad/AdController;)Lcom/pad/android/listener/AdListener;

    move-result-object v3

    if-eqz v3, :cond_55

    .line 1650
    :try_start_7e
    const-string v3, "LBAdController"

    const-string v4, "onAdAlreadyCompleted triggered"

    invoke-static {v3, v4}, Lcom/pad/android/util/AdLog;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 1651
    iget-object v3, p0, Lcom/pad/android/iappad/AdController$PollRequest;->this$0:Lcom/pad/android/iappad/AdController;

    invoke-static {v3}, Lcom/pad/android/iappad/AdController;->access$3(Lcom/pad/android/iappad/AdController;)Lcom/pad/android/listener/AdListener;

    move-result-object v3

    invoke-interface {v3}, Lcom/pad/android/listener/AdListener;->onAdAlreadyCompleted()V
    :try_end_8e
    .catch Ljava/lang/Exception; {:try_start_7e .. :try_end_8e} :catch_8f

    goto :goto_55

    .line 1653
    :catch_8f
    move-exception v0

    .line 1655
    .restart local v0    # "e":Ljava/lang/Exception;
    const-string v3, "LBAdController"

    const-string v4, "error when onAdAlreadyCompleted triggered"

    invoke-static {v3, v4}, Lcom/pad/android/util/AdLog;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 1656
    const-string v3, "LBAdController"

    invoke-static {v3, v0}, Lcom/pad/android/util/AdLog;->printStackTrace(Ljava/lang/String;Ljava/lang/Exception;)V

    goto :goto_55
.end method

###### Class com.pad.android.iappad.AdController.PollRequest.AnonymousClass1 (com.pad.android.iappad.AdController$PollRequest$1)
.class Lcom/pad/android/iappad/AdController$PollRequest$1;
.super Ljava/lang/Object;
.source "AdController.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/pad/android/iappad/AdController$PollRequest;->onPostExecute(Ljava/lang/String;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/pad/android/iappad/AdController$PollRequest;


# direct methods
.method constructor <init>(Lcom/pad/android/iappad/AdController$PollRequest;)V
    .registers 2

    .prologue
    .line 1
    iput-object p1, p0, Lcom/pad/android/iappad/AdController$PollRequest$1;->this$1:Lcom/pad/android/iappad/AdController$PollRequest;

    .line 1623
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .registers 3

    .prologue
    .line 1625
    const-string v0, "LBAdController"

    const-string v1, "Tease Time passed - loading Ad"

    invoke-static {v0, v1}, Lcom/pad/android/util/AdLog;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 1626
    iget-object v0, p0, Lcom/pad/android/iappad/AdController$PollRequest$1;->this$1:Lcom/pad/android/iappad/AdController$PollRequest;

    invoke-static {v0}, Lcom/pad/android/iappad/AdController$PollRequest;->access$3(Lcom/pad/android/iappad/AdController$PollRequest;)Lcom/pad/android/iappad/AdController;

    move-result-object v0

    invoke-static {v0}, Lcom/pad/android/iappad/AdController;->access$2(Lcom/pad/android/iappad/AdController;)V

    .line 1627
    return-void
.end method

###### Class com.pad.android.iappad.AdController.Polling (com.pad.android.iappad.AdController$Polling)
.class Lcom/pad/android/iappad/AdController$Polling;
.super Landroid/os/AsyncTask;
.source "AdController.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/pad/android/iappad/AdController;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "Polling"
.end annotation

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
.field final synthetic this$0:Lcom/pad/android/iappad/AdController;


# direct methods
.method private constructor <init>(Lcom/pad/android/iappad/AdController;)V
    .registers 2

    .prologue
    .line 1664
    iput-object p1, p0, Lcom/pad/android/iappad/AdController$Polling;->this$0:Lcom/pad/android/iappad/AdController;

    invoke-direct {p0}, Landroid/os/AsyncTask;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lcom/pad/android/iappad/AdController;Lcom/pad/android/iappad/AdController$Polling;)V
    .registers 3

    .prologue
    .line 1664
    invoke-direct {p0, p1}, Lcom/pad/android/iappad/AdController$Polling;-><init>(Lcom/pad/android/iappad/AdController;)V

    return-void
.end method


# virtual methods
.method protected bridge varargs synthetic doInBackground([Ljava/lang/Object;)Ljava/lang/Object;
    .registers 3

    .prologue
    .line 1
    check-cast p1, [Ljava/lang/String;

    invoke-virtual {p0, p1}, Lcom/pad/android/iappad/AdController$Polling;->doInBackground([Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method protected varargs doInBackground([Ljava/lang/String;)Ljava/lang/String;
    .registers 11
    .param p1, "pollUrl"    # [Ljava/lang/String;

    .prologue
    const/4 v6, 0x0

    .line 1669
    const-string v5, "0"

    .line 1670
    .local v5, "success":Ljava/lang/String;
    aget-object v6, p1, v6

    if-eqz v6, :cond_67

    .line 1672
    const-string v6, "LBAdController"

    const-string v7, "Polling..."

    invoke-static {v6, v7}, Lcom/pad/android/util/AdLog;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 1675
    :try_start_e
    new-instance v1, Lorg/apache/http/impl/client/DefaultHttpClient;

    invoke-direct {v1}, Lorg/apache/http/impl/client/DefaultHttpClient;-><init>()V

    .line 1676
    .local v1, "httpclient":Lorg/apache/http/client/HttpClient;
    new-instance v2, Lorg/apache/http/client/methods/HttpGet;

    new-instance v6, Ljava/lang/StringBuilder;

    const/4 v7, 0x0

    aget-object v7, p1, v7

    invoke-static {v7}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v7

    invoke-direct {v6, v7}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v7, p0, Lcom/pad/android/iappad/AdController$Polling;->this$0:Lcom/pad/android/iappad/AdController;

    invoke-static {v7}, Lcom/pad/android/iappad/AdController;->access$0(Lcom/pad/android/iappad/AdController;)Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-direct {v2, v6}, Lorg/apache/http/client/methods/HttpGet;-><init>(Ljava/lang/String;)V

    .line 1679
    .local v2, "httpget":Lorg/apache/http/client/methods/HttpGet;
    invoke-interface {v1, v2}, Lorg/apache/http/client/HttpClient;->execute(Lorg/apache/http/client/methods/HttpUriRequest;)Lorg/apache/http/HttpResponse;

    move-result-object v4

    .line 1680
    .local v4, "response":Lorg/apache/http/HttpResponse;
    invoke-interface {v4}, Lorg/apache/http/HttpResponse;->getStatusLine()Lorg/apache/http/StatusLine;

    move-result-object v6

    invoke-interface {v6}, Lorg/apache/http/StatusLine;->getStatusCode()I

    move-result v6

    const/16 v7, 0xc8

    if-ne v6, v7, :cond_67

    .line 1682
    invoke-interface {v4}, Lorg/apache/http/HttpResponse;->getEntity()Lorg/apache/http/HttpEntity;

    move-result-object v0

    .line 1683
    .local v0, "entity":Lorg/apache/http/HttpEntity;
    if-eqz v0, :cond_67

    .line 1685
    invoke-interface {v0}, Lorg/apache/http/HttpEntity;->getContent()Ljava/io/InputStream;

    move-result-object v3

    .line 1686
    .local v3, "instream":Ljava/io/InputStream;
    invoke-static {v3}, Lcom/pad/android/util/AdUtilFuncs;->convertStreamToString(Ljava/io/InputStream;)Ljava/lang/String;

    move-result-object v5

    .line 1687
    const-string v6, "LBAdController"

    new-instance v7, Ljava/lang/StringBuilder;

    const-string v8, "Polling Result - "

    invoke-direct {v7, v8}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v7, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-static {v6, v7}, Lcom/pad/android/util/AdLog;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 1688
    invoke-virtual {v3}, Ljava/io/InputStream;->close()V
    :try_end_67
    .catch Ljava/lang/Exception; {:try_start_e .. :try_end_67} :catch_68

    .line 1694
    .end local v0    # "entity":Lorg/apache/http/HttpEntity;
    .end local v1    # "httpclient":Lorg/apache/http/client/HttpClient;
    .end local v2    # "httpget":Lorg/apache/http/client/methods/HttpGet;
    .end local v3    # "instream":Ljava/io/InputStream;
    .end local v4    # "response":Lorg/apache/http/HttpResponse;
    :cond_67
    :goto_67
    return-object v5

    .line 1692
    :catch_68
    move-exception v6

    goto :goto_67
.end method

.method protected bridge synthetic onPostExecute(Ljava/lang/Object;)V
    .registers 2

    .prologue
    .line 1
    check-cast p1, Ljava/lang/String;

    invoke-virtual {p0, p1}, Lcom/pad/android/iappad/AdController$Polling;->onPostExecute(Ljava/lang/String;)V

    return-void
.end method

.method protected onPostExecute(Ljava/lang/String;)V
    .registers 7
    .param p1, "res"    # Ljava/lang/String;

    .prologue
    .line 1699
    iget-object v1, p0, Lcom/pad/android/iappad/AdController$Polling;->this$0:Lcom/pad/android/iappad/AdController;

    invoke-static {v1}, Lcom/pad/android/iappad/AdController;->access$4(Lcom/pad/android/iappad/AdController;)Landroid/app/ProgressDialog;

    move-result-object v1

    if-eqz v1, :cond_1d

    iget-object v1, p0, Lcom/pad/android/iappad/AdController$Polling;->this$0:Lcom/pad/android/iappad/AdController;

    invoke-static {v1}, Lcom/pad/android/iappad/AdController;->access$4(Lcom/pad/android/iappad/AdController;)Landroid/app/ProgressDialog;

    move-result-object v1

    invoke-virtual {v1}, Landroid/app/ProgressDialog;->isShowing()Z

    move-result v1

    if-eqz v1, :cond_1d

    .line 1701
    iget-object v1, p0, Lcom/pad/android/iappad/AdController$Polling;->this$0:Lcom/pad/android/iappad/AdController;

    invoke-static {v1}, Lcom/pad/android/iappad/AdController;->access$4(Lcom/pad/android/iappad/AdController;)Landroid/app/ProgressDialog;

    move-result-object v1

    invoke-virtual {v1}, Landroid/app/ProgressDialog;->dismiss()V

    .line 1703
    :cond_1d
    iget-object v1, p0, Lcom/pad/android/iappad/AdController$Polling;->this$0:Lcom/pad/android/iappad/AdController;

    invoke-static {v1}, Lcom/pad/android/iappad/AdController;->access$5(Lcom/pad/android/iappad/AdController;)I

    move-result v2

    add-int/lit8 v2, v2, 0x1

    invoke-static {v1, v2}, Lcom/pad/android/iappad/AdController;->access$6(Lcom/pad/android/iappad/AdController;I)V

    .line 1704
    const-string v1, "0"

    invoke-virtual {p1, v1}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v1

    if-eqz v1, :cond_73

    .line 1708
    :try_start_30
    iget-object v1, p0, Lcom/pad/android/iappad/AdController$Polling;->this$0:Lcom/pad/android/iappad/AdController;

    invoke-static {v1}, Lcom/pad/android/iappad/AdController;->access$5(Lcom/pad/android/iappad/AdController;)I

    move-result v1

    iget-object v2, p0, Lcom/pad/android/iappad/AdController$Polling;->this$0:Lcom/pad/android/iappad/AdController;

    invoke-static {v2}, Lcom/pad/android/iappad/AdController;->access$7(Lcom/pad/android/iappad/AdController;)I

    move-result v2

    if-gt v1, v2, :cond_6b

    iget-object v1, p0, Lcom/pad/android/iappad/AdController$Polling;->this$0:Lcom/pad/android/iappad/AdController;

    invoke-static {v1}, Lcom/pad/android/iappad/AdController;->access$5(Lcom/pad/android/iappad/AdController;)I

    move-result v1

    iget-object v2, p0, Lcom/pad/android/iappad/AdController$Polling;->this$0:Lcom/pad/android/iappad/AdController;

    invoke-static {v2}, Lcom/pad/android/iappad/AdController;->access$8(Lcom/pad/android/iappad/AdController;)I

    move-result v2

    if-ge v1, v2, :cond_6b

    .line 1710
    iget-object v1, p0, Lcom/pad/android/iappad/AdController$Polling;->this$0:Lcom/pad/android/iappad/AdController;

    invoke-static {v1}, Lcom/pad/android/iappad/AdController;->access$9(Lcom/pad/android/iappad/AdController;)Landroid/os/Handler;

    move-result-object v1

    iget-object v2, p0, Lcom/pad/android/iappad/AdController$Polling;->this$0:Lcom/pad/android/iappad/AdController;

    invoke-static {v2}, Lcom/pad/android/iappad/AdController;->access$10(Lcom/pad/android/iappad/AdController;)Lcom/pad/android/iappad/AdController$OfferPolling;

    move-result-object v2

    iget-object v3, p0, Lcom/pad/android/iappad/AdController$Polling;->this$0:Lcom/pad/android/iappad/AdController;

    invoke-static {v3}, Lcom/pad/android/iappad/AdController;->access$1(Lcom/pad/android/iappad/AdController;)Lorg/json/JSONObject;

    move-result-object v3

    const-string v4, "pollinterval"

    invoke-virtual {v3, v4}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    move-result v3

    mul-int/lit16 v3, v3, 0x3e8

    int-to-long v3, v3

    invoke-virtual {v1, v2, v3, v4}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 1738
    :cond_6a
    :goto_6a
    return-void

    .line 1714
    :cond_6b
    iget-object v1, p0, Lcom/pad/android/iappad/AdController$Polling;->this$0:Lcom/pad/android/iappad/AdController;

    invoke-static {v1}, Lcom/pad/android/iappad/AdController;->access$11(Lcom/pad/android/iappad/AdController;)V
    :try_end_70
    .catch Ljava/lang/Exception; {:try_start_30 .. :try_end_70} :catch_71

    goto :goto_6a

    .line 1717
    :catch_71
    move-exception v1

    goto :goto_6a

    .line 1719
    :cond_73
    const-string v1, "1"

    invoke-virtual {p1, v1}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v1

    if-eqz v1, :cond_6a

    .line 1721
    iget-object v1, p0, Lcom/pad/android/iappad/AdController$Polling;->this$0:Lcom/pad/android/iappad/AdController;

    const/4 v2, 0x1

    invoke-static {v1, v2}, Lcom/pad/android/iappad/AdController;->access$12(Lcom/pad/android/iappad/AdController;Z)V

    .line 1722
    iget-object v1, p0, Lcom/pad/android/iappad/AdController$Polling;->this$0:Lcom/pad/android/iappad/AdController;

    invoke-static {v1}, Lcom/pad/android/iappad/AdController;->access$13(Lcom/pad/android/iappad/AdController;)V

    .line 1723
    iget-object v1, p0, Lcom/pad/android/iappad/AdController$Polling;->this$0:Lcom/pad/android/iappad/AdController;

    invoke-static {v1}, Lcom/pad/android/iappad/AdController;->access$3(Lcom/pad/android/iappad/AdController;)Lcom/pad/android/listener/AdListener;

    move-result-object v1

    if-eqz v1, :cond_6a

    .line 1728
    :try_start_8e
    const-string v1, "LBAdController"

    const-string v2, "onAdCompleted triggered"

    invoke-static {v1, v2}, Lcom/pad/android/util/AdLog;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 1729
    iget-object v1, p0, Lcom/pad/android/iappad/AdController$Polling;->this$0:Lcom/pad/android/iappad/AdController;

    invoke-static {v1}, Lcom/pad/android/iappad/AdController;->access$3(Lcom/pad/android/iappad/AdController;)Lcom/pad/android/listener/AdListener;

    move-result-object v1

    invoke-interface {v1}, Lcom/pad/android/listener/AdListener;->onAdCompleted()V
    :try_end_9e
    .catch Ljava/lang/Exception; {:try_start_8e .. :try_end_9e} :catch_9f

    goto :goto_6a

    .line 1731
    :catch_9f
    move-exception v0

    .line 1733
    .local v0, "e":Ljava/lang/Exception;
    const-string v1, "LBAdController"

    const-string v2, "error when onAdCompleted triggered"

    invoke-static {v1, v2}, Lcom/pad/android/util/AdLog;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 1734
    const-string v1, "LBAdController"

    invoke-static {v1, v0}, Lcom/pad/android/util/AdLog;->printStackTrace(Ljava/lang/String;Ljava/lang/Exception;)V

    goto :goto_6a
.end method
