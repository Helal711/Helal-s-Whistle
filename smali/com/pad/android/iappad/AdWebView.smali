###### Class com.pad.android.iappad.AdWebView (com.pad.android.iappad.AdWebView)
.class public Lcom/pad/android/iappad/AdWebView;
.super Landroid/webkit/WebView;
.source "AdWebView.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/pad/android/iappad/AdWebView$AdWebChromeClient;,
        Lcom/pad/android/iappad/AdWebView$AdWebClient;
    }
.end annotation


# static fields
.field private static final LB_LOG:Ljava/lang/String; = "LBAdController"


# instance fields
.field private activity:Landroid/content/Context;

.field private controller:Lcom/pad/android/iappad/AdController;

.field private listener:Lcom/pad/android/listener/AdListener;

.field private loadUrl:Ljava/lang/String;

.field private loading:Z

.field private loadingDialog:Landroid/app/ProgressDialog;

.field private nativeOpen:Z

.field private results:Lorg/json/JSONObject;

.field private settings:Landroid/webkit/WebSettings;


# direct methods
.method public constructor <init>(Landroid/app/Activity;Lcom/pad/android/iappad/AdController;ZLcom/pad/android/listener/AdListener;)V
    .registers 6
    .param p1, "act"    # Landroid/app/Activity;
    .param p2, "cont"    # Lcom/pad/android/iappad/AdController;
    .param p3, "nO"    # Z
    .param p4, "list"    # Lcom/pad/android/listener/AdListener;

    .prologue
    const/4 v0, 0x0

    .line 47
    invoke-direct {p0, p1}, Landroid/webkit/WebView;-><init>(Landroid/content/Context;)V

    .line 41
    iput-boolean v0, p0, Lcom/pad/android/iappad/AdWebView;->loading:Z

    .line 42
    iput-boolean v0, p0, Lcom/pad/android/iappad/AdWebView;->nativeOpen:Z

    .line 48
    iput-object p1, p0, Lcom/pad/android/iappad/AdWebView;->activity:Landroid/content/Context;

    .line 49
    iput-object p2, p0, Lcom/pad/android/iappad/AdWebView;->controller:Lcom/pad/android/iappad/AdController;

    .line 50
    iput-boolean p3, p0, Lcom/pad/android/iappad/AdWebView;->nativeOpen:Z

    .line 51
    iput-object p4, p0, Lcom/pad/android/iappad/AdWebView;->listener:Lcom/pad/android/listener/AdListener;

    .line 52
    invoke-direct {p0}, Lcom/pad/android/iappad/AdWebView;->initialize()V

    .line 53
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .registers 4
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;

    .prologue
    const/4 v0, 0x0

    .line 57
    invoke-direct {p0, p1, p2}, Landroid/webkit/WebView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 41
    iput-boolean v0, p0, Lcom/pad/android/iappad/AdWebView;->loading:Z

    .line 42
    iput-boolean v0, p0, Lcom/pad/android/iappad/AdWebView;->nativeOpen:Z

    .line 58
    iput-object p1, p0, Lcom/pad/android/iappad/AdWebView;->activity:Landroid/content/Context;

    .line 59
    invoke-direct {p0, p2}, Lcom/pad/android/iappad/AdWebView;->buildFromXML(Landroid/util/AttributeSet;)V

    .line 60
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .registers 5
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;
    .param p3, "defStyle"    # I

    .prologue
    const/4 v0, 0x0

    .line 64
    invoke-direct {p0, p1, p2, p3}, Landroid/webkit/WebView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 41
    iput-boolean v0, p0, Lcom/pad/android/iappad/AdWebView;->loading:Z

    .line 42
    iput-boolean v0, p0, Lcom/pad/android/iappad/AdWebView;->nativeOpen:Z

    .line 65
    iput-object p1, p0, Lcom/pad/android/iappad/AdWebView;->activity:Landroid/content/Context;

    .line 66
    invoke-direct {p0, p2}, Lcom/pad/android/iappad/AdWebView;->buildFromXML(Landroid/util/AttributeSet;)V

    .line 67
    return-void
.end method

.method static synthetic access$0(Lcom/pad/android/iappad/AdWebView;)Ljava/lang/String;
    .registers 2

    .prologue
    .line 40
    iget-object v0, p0, Lcom/pad/android/iappad/AdWebView;->loadUrl:Ljava/lang/String;

    return-object v0
.end method

.method static synthetic access$1(Lcom/pad/android/iappad/AdWebView;)Z
    .registers 2

    .prologue
    .line 41
    iget-boolean v0, p0, Lcom/pad/android/iappad/AdWebView;->loading:Z

    return v0
.end method

.method static synthetic access$2(Lcom/pad/android/iappad/AdWebView;)Lorg/json/JSONObject;
    .registers 2

    .prologue
    .line 39
    iget-object v0, p0, Lcom/pad/android/iappad/AdWebView;->results:Lorg/json/JSONObject;

    return-object v0
.end method

.method static synthetic access$3(Lcom/pad/android/iappad/AdWebView;Z)V
    .registers 2

    .prologue
    .line 41
    iput-boolean p1, p0, Lcom/pad/android/iappad/AdWebView;->loading:Z

    return-void
.end method

.method static synthetic access$4(Lcom/pad/android/iappad/AdWebView;)Z
    .registers 2

    .prologue
    .line 42
    iget-boolean v0, p0, Lcom/pad/android/iappad/AdWebView;->nativeOpen:Z

    return v0
.end method

.method static synthetic access$5(Lcom/pad/android/iappad/AdWebView;)Landroid/app/ProgressDialog;
    .registers 2

    .prologue
    .line 43
    iget-object v0, p0, Lcom/pad/android/iappad/AdWebView;->loadingDialog:Landroid/app/ProgressDialog;

    return-object v0
.end method

.method static synthetic access$6(Lcom/pad/android/iappad/AdWebView;Landroid/app/ProgressDialog;)V
    .registers 2

    .prologue
    .line 43
    iput-object p1, p0, Lcom/pad/android/iappad/AdWebView;->loadingDialog:Landroid/app/ProgressDialog;

    return-void
.end method

.method private buildFromXML(Landroid/util/AttributeSet;)V
    .registers 6
    .param p1, "attrs"    # Landroid/util/AttributeSet;

    .prologue
    .line 81
    if-eqz p1, :cond_17

    .line 83
    new-instance v1, Lcom/pad/android/iappad/AdController;

    iget-object v0, p0, Lcom/pad/android/iappad/AdWebView;->activity:Landroid/content/Context;

    check-cast v0, Landroid/app/Activity;

    const/4 v2, 0x0

    const-string v3, "sectionid"

    invoke-interface {p1, v2, v3}, Landroid/util/AttributeSet;->getAttributeValue(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v0, v2}, Lcom/pad/android/iappad/AdController;-><init>(Landroid/app/Activity;Ljava/lang/String;)V

    iput-object v1, p0, Lcom/pad/android/iappad/AdWebView;->controller:Lcom/pad/android/iappad/AdController;

    .line 84
    invoke-direct {p0}, Lcom/pad/android/iappad/AdWebView;->initialize()V

    .line 86
    :cond_17
    return-void
.end method

.method private initialize()V
    .registers 5

    .prologue
    const/4 v1, 0x1

    .line 90
    invoke-virtual {p0}, Lcom/pad/android/iappad/AdWebView;->getSettings()Landroid/webkit/WebSettings;

    move-result-object v0

    iput-object v0, p0, Lcom/pad/android/iappad/AdWebView;->settings:Landroid/webkit/WebSettings;

    .line 91
    iget-object v0, p0, Lcom/pad/android/iappad/AdWebView;->settings:Landroid/webkit/WebSettings;

    invoke-virtual {v0, v1}, Landroid/webkit/WebSettings;->setJavaScriptEnabled(Z)V

    .line 92
    iget-object v0, p0, Lcom/pad/android/iappad/AdWebView;->settings:Landroid/webkit/WebSettings;

    invoke-virtual {v0, v1}, Landroid/webkit/WebSettings;->setJavaScriptCanOpenWindowsAutomatically(Z)V

    .line 93
    new-instance v0, Lcom/pad/android/iappad/AdJSInterface;

    iget-object v1, p0, Lcom/pad/android/iappad/AdWebView;->activity:Landroid/content/Context;

    iget-object v2, p0, Lcom/pad/android/iappad/AdWebView;->controller:Lcom/pad/android/iappad/AdController;

    iget-object v3, p0, Lcom/pad/android/iappad/AdWebView;->listener:Lcom/pad/android/listener/AdListener;

    invoke-direct {v0, v1, v2, v3}, Lcom/pad/android/iappad/AdJSInterface;-><init>(Landroid/content/Context;Lcom/pad/android/iappad/AdController;Lcom/pad/android/listener/AdListener;)V

    const-string v1, "LBOUT"

    invoke-virtual {p0, v0, v1}, Lcom/pad/android/iappad/AdWebView;->addJavascriptInterface(Ljava/lang/Object;Ljava/lang/String;)V

    .line 94
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x8

    if-lt v0, v1, :cond_2e

    .line 96
    iget-object v0, p0, Lcom/pad/android/iappad/AdWebView;->settings:Landroid/webkit/WebSettings;

    sget-object v1, Landroid/webkit/WebSettings$PluginState;->ON:Landroid/webkit/WebSettings$PluginState;

    invoke-virtual {v0, v1}, Landroid/webkit/WebSettings;->setPluginState(Landroid/webkit/WebSettings$PluginState;)V

    .line 103
    :cond_2e
    new-instance v0, Lcom/pad/android/iappad/AdWebView$AdWebChromeClient;

    iget-object v1, p0, Lcom/pad/android/iappad/AdWebView;->activity:Landroid/content/Context;

    invoke-direct {v0, p0, v1}, Lcom/pad/android/iappad/AdWebView$AdWebChromeClient;-><init>(Lcom/pad/android/iappad/AdWebView;Landroid/content/Context;)V

    invoke-virtual {p0, v0}, Lcom/pad/android/iappad/AdWebView;->setWebChromeClient(Landroid/webkit/WebChromeClient;)V

    .line 104
    new-instance v0, Lcom/pad/android/iappad/AdWebView$AdWebClient;

    iget-object v1, p0, Lcom/pad/android/iappad/AdWebView;->activity:Landroid/content/Context;

    iget-object v2, p0, Lcom/pad/android/iappad/AdWebView;->controller:Lcom/pad/android/iappad/AdController;

    invoke-direct {v0, p0, v1, v2, p0}, Lcom/pad/android/iappad/AdWebView$AdWebClient;-><init>(Lcom/pad/android/iappad/AdWebView;Landroid/content/Context;Lcom/pad/android/iappad/AdController;Lcom/pad/android/iappad/AdWebView;)V

    invoke-virtual {p0, v0}, Lcom/pad/android/iappad/AdWebView;->setWebViewClient(Landroid/webkit/WebViewClient;)V

    .line 105
    return-void
.end method


# virtual methods
.method public setLoadingURL(Ljava/lang/String;)V
    .registers 2
    .param p1, "lU"    # Ljava/lang/String;

    .prologue
    .line 76
    iput-object p1, p0, Lcom/pad/android/iappad/AdWebView;->loadUrl:Ljava/lang/String;

    .line 77
    return-void
.end method

.method public setResults(Lorg/json/JSONObject;)V
    .registers 2
    .param p1, "res"    # Lorg/json/JSONObject;

    .prologue
    .line 71
    iput-object p1, p0, Lcom/pad/android/iappad/AdWebView;->results:Lorg/json/JSONObject;

    .line 72
    return-void
.end method

.method public showAd()V
    .registers 2

    .prologue
    .line 109
    iget-object v0, p0, Lcom/pad/android/iappad/AdWebView;->controller:Lcom/pad/android/iappad/AdController;

    invoke-virtual {v0}, Lcom/pad/android/iappad/AdController;->loadAd()V

    .line 110
    return-void
.end method

###### Class com.pad.android.iappad.AdWebView.AdWebChromeClient (com.pad.android.iappad.AdWebView$AdWebChromeClient)
.class Lcom/pad/android/iappad/AdWebView$AdWebChromeClient;
.super Landroid/webkit/WebChromeClient;
.source "AdWebView.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/pad/android/iappad/AdWebView;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "AdWebChromeClient"
.end annotation


# instance fields
.field private ctx:Landroid/content/Context;

.field final synthetic this$0:Lcom/pad/android/iappad/AdWebView;


# direct methods
.method public constructor <init>(Lcom/pad/android/iappad/AdWebView;Landroid/content/Context;)V
    .registers 3
    .param p2, "ctx"    # Landroid/content/Context;

    .prologue
    .line 274
    iput-object p1, p0, Lcom/pad/android/iappad/AdWebView$AdWebChromeClient;->this$0:Lcom/pad/android/iappad/AdWebView;

    .line 273
    invoke-direct {p0}, Landroid/webkit/WebChromeClient;-><init>()V

    .line 275
    iput-object p2, p0, Lcom/pad/android/iappad/AdWebView$AdWebChromeClient;->ctx:Landroid/content/Context;

    .line 276
    return-void
.end method


# virtual methods
.method public onJsAlert(Landroid/webkit/WebView;Ljava/lang/String;Ljava/lang/String;Landroid/webkit/JsResult;)Z
    .registers 8
    .param p1, "view"    # Landroid/webkit/WebView;
    .param p2, "url"    # Ljava/lang/String;
    .param p3, "message"    # Ljava/lang/String;
    .param p4, "result"    # Landroid/webkit/JsResult;

    .prologue
    .line 280
    new-instance v0, Landroid/app/AlertDialog$Builder;

    iget-object v1, p0, Lcom/pad/android/iappad/AdWebView$AdWebChromeClient;->ctx:Landroid/content/Context;

    invoke-direct {v0, v1}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    .line 281
    const-string v1, "Alert"

    invoke-virtual {v0, v1}, Landroid/app/AlertDialog$Builder;->setTitle(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    .line 282
    invoke-virtual {v0, p3}, Landroid/app/AlertDialog$Builder;->setMessage(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    .line 283
    const v1, 0x104000a

    .line 284
    new-instance v2, Lcom/pad/android/iappad/AdWebView$AdWebChromeClient$1;

    invoke-direct {v2, p0, p4}, Lcom/pad/android/iappad/AdWebView$AdWebChromeClient$1;-><init>(Lcom/pad/android/iappad/AdWebView$AdWebChromeClient;Landroid/webkit/JsResult;)V

    .line 283
    invoke-virtual {v0, v1, v2}, Landroid/app/AlertDialog$Builder;->setPositiveButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    .line 291
    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/app/AlertDialog$Builder;->setCancelable(Z)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    .line 292
    invoke-virtual {v0}, Landroid/app/AlertDialog$Builder;->create()Landroid/app/AlertDialog;

    move-result-object v0

    .line 293
    invoke-virtual {v0}, Landroid/app/AlertDialog;->show()V

    .line 294
    const/4 v0, 0x1

    return v0
.end method

.method public onJsConfirm(Landroid/webkit/WebView;Ljava/lang/String;Ljava/lang/String;Landroid/webkit/JsResult;)Z
    .registers 8
    .param p1, "view"    # Landroid/webkit/WebView;
    .param p2, "url"    # Ljava/lang/String;
    .param p3, "message"    # Ljava/lang/String;
    .param p4, "result"    # Landroid/webkit/JsResult;

    .prologue
    .line 299
    new-instance v0, Landroid/app/AlertDialog$Builder;

    iget-object v1, p0, Lcom/pad/android/iappad/AdWebView$AdWebChromeClient;->ctx:Landroid/content/Context;

    invoke-direct {v0, v1}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    .line 300
    const-string v1, "Confirm"

    invoke-virtual {v0, v1}, Landroid/app/AlertDialog$Builder;->setTitle(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    .line 301
    invoke-virtual {v0, p3}, Landroid/app/AlertDialog$Builder;->setMessage(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    .line 302
    const v1, 0x104000a

    new-instance v2, Lcom/pad/android/iappad/AdWebView$AdWebChromeClient$2;

    invoke-direct {v2, p0, p4}, Lcom/pad/android/iappad/AdWebView$AdWebChromeClient$2;-><init>(Lcom/pad/android/iappad/AdWebView$AdWebChromeClient;Landroid/webkit/JsResult;)V

    invoke-virtual {v0, v1, v2}, Landroid/app/AlertDialog$Builder;->setPositiveButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    .line 307
    const/high16 v1, 0x1040000

    new-instance v2, Lcom/pad/android/iappad/AdWebView$AdWebChromeClient$3;

    invoke-direct {v2, p0, p4}, Lcom/pad/android/iappad/AdWebView$AdWebChromeClient$3;-><init>(Lcom/pad/android/iappad/AdWebView$AdWebChromeClient;Landroid/webkit/JsResult;)V

    invoke-virtual {v0, v1, v2}, Landroid/app/AlertDialog$Builder;->setNegativeButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    .line 312
    invoke-virtual {v0}, Landroid/app/AlertDialog$Builder;->create()Landroid/app/AlertDialog;

    move-result-object v0

    invoke-virtual {v0}, Landroid/app/AlertDialog;->show()V

    .line 313
    const/4 v0, 0x1

    return v0
.end method

###### Class com.pad.android.iappad.AdWebView.AdWebChromeClient.AnonymousClass1 (com.pad.android.iappad.AdWebView$AdWebChromeClient$1)
.class Lcom/pad/android/iappad/AdWebView$AdWebChromeClient$1;
.super Ljava/lang/Object;
.source "AdWebView.java"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/pad/android/iappad/AdWebView$AdWebChromeClient;->onJsAlert(Landroid/webkit/WebView;Ljava/lang/String;Ljava/lang/String;Landroid/webkit/JsResult;)Z
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/pad/android/iappad/AdWebView$AdWebChromeClient;

.field private final synthetic val$result:Landroid/webkit/JsResult;


# direct methods
.method constructor <init>(Lcom/pad/android/iappad/AdWebView$AdWebChromeClient;Landroid/webkit/JsResult;)V
    .registers 3

    .prologue
    .line 1
    iput-object p1, p0, Lcom/pad/android/iappad/AdWebView$AdWebChromeClient$1;->this$1:Lcom/pad/android/iappad/AdWebView$AdWebChromeClient;

    iput-object p2, p0, Lcom/pad/android/iappad/AdWebView$AdWebChromeClient$1;->val$result:Landroid/webkit/JsResult;

    .line 284
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;I)V
    .registers 4
    .param p1, "dialog"    # Landroid/content/DialogInterface;
    .param p2, "which"    # I

    .prologue
    .line 288
    iget-object v0, p0, Lcom/pad/android/iappad/AdWebView$AdWebChromeClient$1;->val$result:Landroid/webkit/JsResult;

    invoke-virtual {v0}, Landroid/webkit/JsResult;->confirm()V

    .line 289
    return-void
.end method

###### Class com.pad.android.iappad.AdWebView.AdWebChromeClient.AnonymousClass2 (com.pad.android.iappad.AdWebView$AdWebChromeClient$2)
.class Lcom/pad/android/iappad/AdWebView$AdWebChromeClient$2;
.super Ljava/lang/Object;
.source "AdWebView.java"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/pad/android/iappad/AdWebView$AdWebChromeClient;->onJsConfirm(Landroid/webkit/WebView;Ljava/lang/String;Ljava/lang/String;Landroid/webkit/JsResult;)Z
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/pad/android/iappad/AdWebView$AdWebChromeClient;

.field private final synthetic val$result:Landroid/webkit/JsResult;


# direct methods
.method constructor <init>(Lcom/pad/android/iappad/AdWebView$AdWebChromeClient;Landroid/webkit/JsResult;)V
    .registers 3

    .prologue
    .line 1
    iput-object p1, p0, Lcom/pad/android/iappad/AdWebView$AdWebChromeClient$2;->this$1:Lcom/pad/android/iappad/AdWebView$AdWebChromeClient;

    iput-object p2, p0, Lcom/pad/android/iappad/AdWebView$AdWebChromeClient$2;->val$result:Landroid/webkit/JsResult;

    .line 302
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;I)V
    .registers 4
    .param p1, "dialog"    # Landroid/content/DialogInterface;
    .param p2, "which"    # I

    .prologue
    .line 304
    iget-object v0, p0, Lcom/pad/android/iappad/AdWebView$AdWebChromeClient$2;->val$result:Landroid/webkit/JsResult;

    invoke-virtual {v0}, Landroid/webkit/JsResult;->confirm()V

    .line 305
    return-void
.end method

###### Class com.pad.android.iappad.AdWebView.AdWebChromeClient.AnonymousClass3 (com.pad.android.iappad.AdWebView$AdWebChromeClient$3)
.class Lcom/pad/android/iappad/AdWebView$AdWebChromeClient$3;
.super Ljava/lang/Object;
.source "AdWebView.java"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/pad/android/iappad/AdWebView$AdWebChromeClient;->onJsConfirm(Landroid/webkit/WebView;Ljava/lang/String;Ljava/lang/String;Landroid/webkit/JsResult;)Z
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/pad/android/iappad/AdWebView$AdWebChromeClient;

.field private final synthetic val$result:Landroid/webkit/JsResult;


# direct methods
.method constructor <init>(Lcom/pad/android/iappad/AdWebView$AdWebChromeClient;Landroid/webkit/JsResult;)V
    .registers 3

    .prologue
    .line 1
    iput-object p1, p0, Lcom/pad/android/iappad/AdWebView$AdWebChromeClient$3;->this$1:Lcom/pad/android/iappad/AdWebView$AdWebChromeClient;

    iput-object p2, p0, Lcom/pad/android/iappad/AdWebView$AdWebChromeClient$3;->val$result:Landroid/webkit/JsResult;

    .line 307
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;I)V
    .registers 4
    .param p1, "dialog"    # Landroid/content/DialogInterface;
    .param p2, "which"    # I

    .prologue
    .line 309
    iget-object v0, p0, Lcom/pad/android/iappad/AdWebView$AdWebChromeClient$3;->val$result:Landroid/webkit/JsResult;

    invoke-virtual {v0}, Landroid/webkit/JsResult;->cancel()V

    .line 310
    return-void
.end method

###### Class com.pad.android.iappad.AdWebView.AdWebClient (com.pad.android.iappad.AdWebView$AdWebClient)
.class Lcom/pad/android/iappad/AdWebView$AdWebClient;
.super Landroid/webkit/WebViewClient;
.source "AdWebView.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/pad/android/iappad/AdWebView;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "AdWebClient"
.end annotation


# instance fields
.field private activity:Landroid/content/Context;

.field private adView:Lcom/pad/android/iappad/AdWebView;

.field private controller:Lcom/pad/android/iappad/AdController;

.field final synthetic this$0:Lcom/pad/android/iappad/AdWebView;


# direct methods
.method public constructor <init>(Lcom/pad/android/iappad/AdWebView;Landroid/content/Context;Lcom/pad/android/iappad/AdController;Lcom/pad/android/iappad/AdWebView;)V
    .registers 5
    .param p2, "act"    # Landroid/content/Context;
    .param p3, "cont"    # Lcom/pad/android/iappad/AdController;
    .param p4, "adV"    # Lcom/pad/android/iappad/AdWebView;

    .prologue
    .line 119
    iput-object p1, p0, Lcom/pad/android/iappad/AdWebView$AdWebClient;->this$0:Lcom/pad/android/iappad/AdWebView;

    .line 118
    invoke-direct {p0}, Landroid/webkit/WebViewClient;-><init>()V

    .line 120
    iput-object p2, p0, Lcom/pad/android/iappad/AdWebView$AdWebClient;->activity:Landroid/content/Context;

    .line 121
    iput-object p3, p0, Lcom/pad/android/iappad/AdWebView$AdWebClient;->controller:Lcom/pad/android/iappad/AdController;

    .line 122
    iput-object p4, p0, Lcom/pad/android/iappad/AdWebView$AdWebClient;->adView:Lcom/pad/android/iappad/AdWebView;

    .line 123
    return-void
.end method


# virtual methods
.method public onPageFinished(Landroid/webkit/WebView;Ljava/lang/String;)V
    .registers 10
    .param p1, "view"    # Landroid/webkit/WebView;
    .param p2, "url"    # Ljava/lang/String;

    .prologue
    .line 213
    const-string v4, "LBAdController"

    const-string v5, "onPageFinished called"

    invoke-static {v4, v5}, Lcom/pad/android/util/AdLog;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 214
    iget-object v4, p0, Lcom/pad/android/iappad/AdWebView$AdWebClient;->this$0:Lcom/pad/android/iappad/AdWebView;

    invoke-static {v4}, Lcom/pad/android/iappad/AdWebView;->access$5(Lcom/pad/android/iappad/AdWebView;)Landroid/app/ProgressDialog;

    move-result-object v4

    if-eqz v4, :cond_24

    iget-object v4, p0, Lcom/pad/android/iappad/AdWebView$AdWebClient;->this$0:Lcom/pad/android/iappad/AdWebView;

    invoke-static {v4}, Lcom/pad/android/iappad/AdWebView;->access$5(Lcom/pad/android/iappad/AdWebView;)Landroid/app/ProgressDialog;

    move-result-object v4

    invoke-virtual {v4}, Landroid/app/ProgressDialog;->isShowing()Z

    move-result v4

    if-eqz v4, :cond_24

    .line 216
    iget-object v4, p0, Lcom/pad/android/iappad/AdWebView$AdWebClient;->this$0:Lcom/pad/android/iappad/AdWebView;

    invoke-static {v4}, Lcom/pad/android/iappad/AdWebView;->access$5(Lcom/pad/android/iappad/AdWebView;)Landroid/app/ProgressDialog;

    move-result-object v4

    invoke-virtual {v4}, Landroid/app/ProgressDialog;->dismiss()V

    .line 218
    :cond_24
    iget-object v4, p0, Lcom/pad/android/iappad/AdWebView$AdWebClient;->this$0:Lcom/pad/android/iappad/AdWebView;

    invoke-static {v4}, Lcom/pad/android/iappad/AdWebView;->access$0(Lcom/pad/android/iappad/AdWebView;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {p2, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_53

    .line 222
    const/4 v4, -0x1

    invoke-virtual {p1, v4}, Landroid/webkit/WebView;->setBackgroundColor(I)V

    .line 225
    iget-object v4, p0, Lcom/pad/android/iappad/AdWebView$AdWebClient;->adView:Lcom/pad/android/iappad/AdWebView;

    const-string v5, "javascript:window.LBOUT.processHTML(document.getElementsByTagName(\'body\')[0].getAttribute(\'ad_count\'))"

    invoke-virtual {v4, v5}, Lcom/pad/android/iappad/AdWebView;->loadUrl(Ljava/lang/String;)V

    .line 227
    iget-object v4, p0, Lcom/pad/android/iappad/AdWebView$AdWebClient;->activity:Landroid/content/Context;

    const-string v5, "android.permission.GET_ACCOUNTS"

    invoke-virtual {v4, v5}, Landroid/content/Context;->checkCallingOrSelfPermission(Ljava/lang/String;)I

    move-result v4

    if-nez v4, :cond_b0

    .line 229
    iget-object v4, p0, Lcom/pad/android/iappad/AdWebView$AdWebClient;->activity:Landroid/content/Context;

    invoke-static {v4}, Landroid/accounts/AccountManager;->get(Landroid/content/Context;)Landroid/accounts/AccountManager;

    move-result-object v1

    .line 230
    .local v1, "accManager":Landroid/accounts/AccountManager;
    invoke-virtual {v1}, Landroid/accounts/AccountManager;->getAccounts()[Landroid/accounts/Account;

    move-result-object v0

    .line 231
    .local v0, "acc":[Landroid/accounts/Account;
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_50
    array-length v4, v0

    if-lt v2, v4, :cond_7e

    .line 253
    .end local v0    # "acc":[Landroid/accounts/Account;
    .end local v1    # "accManager":Landroid/accounts/AccountManager;
    .end local v2    # "i":I
    :cond_53
    :goto_53
    iget-object v4, p0, Lcom/pad/android/iappad/AdWebView$AdWebClient;->this$0:Lcom/pad/android/iappad/AdWebView;

    const/4 v5, 0x0

    invoke-static {v4, v5}, Lcom/pad/android/iappad/AdWebView;->access$3(Lcom/pad/android/iappad/AdWebView;Z)V

    .line 254
    iget-object v4, p0, Lcom/pad/android/iappad/AdWebView$AdWebClient;->controller:Lcom/pad/android/iappad/AdController;

    iget-object v5, p0, Lcom/pad/android/iappad/AdWebView$AdWebClient;->this$0:Lcom/pad/android/iappad/AdWebView;

    invoke-static {v5}, Lcom/pad/android/iappad/AdWebView;->access$1(Lcom/pad/android/iappad/AdWebView;)Z

    move-result v5

    invoke-virtual {v4, v5}, Lcom/pad/android/iappad/AdController;->setLoading(Z)V

    .line 255
    iget-object v4, p0, Lcom/pad/android/iappad/AdWebView$AdWebClient;->adView:Lcom/pad/android/iappad/AdWebView;

    const/16 v5, 0x82

    invoke-virtual {v4, v5}, Lcom/pad/android/iappad/AdWebView;->requestFocus(I)Z

    .line 257
    const-string v4, "#app_close"

    invoke-virtual {p2, v4}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v4

    if-eqz v4, :cond_7d

    .line 261
    const-wide/16 v4, 0x3e8

    :try_start_75
    invoke-static {v4, v5}, Ljava/lang/Thread;->sleep(J)V

    .line 262
    iget-object v4, p0, Lcom/pad/android/iappad/AdWebView$AdWebClient;->controller:Lcom/pad/android/iappad/AdController;

    invoke-virtual {v4}, Lcom/pad/android/iappad/AdController;->destroyAd()V
    :try_end_7d
    .catch Ljava/lang/Exception; {:try_start_75 .. :try_end_7d} :catch_b8

    .line 266
    :cond_7d
    :goto_7d
    return-void

    .line 233
    .restart local v0    # "acc":[Landroid/accounts/Account;
    .restart local v1    # "accManager":Landroid/accounts/AccountManager;
    .restart local v2    # "i":I
    :cond_7e
    aget-object v3, v0, v2

    .line 234
    .local v3, "tmp":Landroid/accounts/Account;
    iget-object v4, v3, Landroid/accounts/Account;->type:Ljava/lang/String;

    const-string v5, "com.google"

    invoke-virtual {v4, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_ad

    .line 237
    iget-object v4, p0, Lcom/pad/android/iappad/AdWebView$AdWebClient;->adView:Lcom/pad/android/iappad/AdWebView;

    new-instance v5, Ljava/lang/StringBuilder;

    const-string v6, "javascript:(function() {var input = document.getElementsByName(\'Email\')[0];input.select();input.focus();input.value = \'"

    invoke-direct {v5, v6}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 241
    iget-object v6, v3, Landroid/accounts/Account;->name:Ljava/lang/String;

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, "\';"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    .line 242
    const-string v6, "})()"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    .line 237
    invoke-virtual {v4, v5}, Lcom/pad/android/iappad/AdWebView;->loadUrl(Ljava/lang/String;)V

    goto :goto_53

    .line 231
    :cond_ad
    add-int/lit8 v2, v2, 0x1

    goto :goto_50

    .line 249
    .end local v0    # "acc":[Landroid/accounts/Account;
    .end local v1    # "accManager":Landroid/accounts/AccountManager;
    .end local v2    # "i":I
    .end local v3    # "tmp":Landroid/accounts/Account;
    :cond_b0
    const-string v4, "LBAdController"

    const-string v5, "Get Accounts permission not granted"

    invoke-static {v4, v5}, Lcom/pad/android/util/AdLog;->d(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_53

    .line 264
    :catch_b8
    move-exception v4

    goto :goto_7d
.end method

.method public onPageStarted(Landroid/webkit/WebView;Ljava/lang/String;Landroid/graphics/Bitmap;)V
    .registers 11
    .param p1, "view"    # Landroid/webkit/WebView;
    .param p2, "url"    # Ljava/lang/String;
    .param p3, "favicon"    # Landroid/graphics/Bitmap;

    .prologue
    const/4 v6, 0x1

    const/4 v3, 0x0

    .line 128
    invoke-virtual {p1, v3, v3, v3, v3}, Landroid/webkit/WebView;->setPadding(IIII)V

    .line 129
    const/16 v2, 0x64

    invoke-virtual {p1, v2}, Landroid/webkit/WebView;->setInitialScale(I)V

    .line 130
    invoke-virtual {p1, v3}, Landroid/webkit/WebView;->setVerticalScrollBarEnabled(Z)V

    .line 131
    invoke-virtual {p1, v3}, Landroid/webkit/WebView;->setHorizontalScrollBarEnabled(Z)V

    .line 132
    iget-object v2, p0, Lcom/pad/android/iappad/AdWebView$AdWebClient;->activity:Landroid/content/Context;

    const-string v3, "input_method"

    invoke-virtual {v2, v3}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/view/inputmethod/InputMethodManager;

    .line 133
    .local v1, "im":Landroid/view/inputmethod/InputMethodManager;
    invoke-virtual {v1}, Landroid/view/inputmethod/InputMethodManager;->isAcceptingText()Z

    move-result v2

    if-eqz v2, :cond_23

    .line 135
    invoke-virtual {p1, v6}, Landroid/webkit/WebView;->setVerticalScrollBarEnabled(Z)V

    .line 139
    :cond_23
    iget-object v2, p0, Lcom/pad/android/iappad/AdWebView$AdWebClient;->this$0:Lcom/pad/android/iappad/AdWebView;

    invoke-static {v2}, Lcom/pad/android/iappad/AdWebView;->access$0(Lcom/pad/android/iappad/AdWebView;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p2, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_ab

    .line 141
    const-string v2, "LBAdController"

    new-instance v3, Ljava/lang/StringBuilder;

    const-string v4, "Home loaded - loading = "

    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v4, p0, Lcom/pad/android/iappad/AdWebView$AdWebClient;->this$0:Lcom/pad/android/iappad/AdWebView;

    invoke-static {v4}, Lcom/pad/android/iappad/AdWebView;->access$1(Lcom/pad/android/iappad/AdWebView;)Z

    move-result v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Lcom/pad/android/util/AdLog;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 142
    iget-object v2, p0, Lcom/pad/android/iappad/AdWebView$AdWebClient;->this$0:Lcom/pad/android/iappad/AdWebView;

    invoke-static {v2}, Lcom/pad/android/iappad/AdWebView;->access$1(Lcom/pad/android/iappad/AdWebView;)Z

    move-result v2

    if-nez v2, :cond_88

    .line 146
    :try_start_51
    iget-object v2, p0, Lcom/pad/android/iappad/AdWebView$AdWebClient;->this$0:Lcom/pad/android/iappad/AdWebView;

    invoke-static {v2}, Lcom/pad/android/iappad/AdWebView;->access$2(Lcom/pad/android/iappad/AdWebView;)Lorg/json/JSONObject;

    move-result-object v2

    const-string v3, "useclickwindow"

    invoke-virtual {v2, v3}, Lorg/json/JSONObject;->get(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v2

    const-string v3, "1"

    invoke-virtual {v2, v3}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_89

    .line 148
    const-string v2, "LBAdController"

    const-string v3, "Going to use ClickWindow details"

    invoke-static {v2, v3}, Lcom/pad/android/util/AdLog;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 149
    iget-object v2, p0, Lcom/pad/android/iappad/AdWebView$AdWebClient;->controller:Lcom/pad/android/iappad/AdController;

    const/4 v3, 0x1

    invoke-virtual {v2, v3}, Lcom/pad/android/iappad/AdController;->setHomeLoaded(Z)V

    .line 150
    iget-object v2, p0, Lcom/pad/android/iappad/AdWebView$AdWebClient;->this$0:Lcom/pad/android/iappad/AdWebView;

    const/4 v3, 0x0

    invoke-static {v2, v3}, Lcom/pad/android/iappad/AdWebView;->access$3(Lcom/pad/android/iappad/AdWebView;Z)V

    .line 151
    iget-object v2, p0, Lcom/pad/android/iappad/AdWebView$AdWebClient;->controller:Lcom/pad/android/iappad/AdController;

    iget-object v3, p0, Lcom/pad/android/iappad/AdWebView$AdWebClient;->this$0:Lcom/pad/android/iappad/AdWebView;

    invoke-static {v3}, Lcom/pad/android/iappad/AdWebView;->access$1(Lcom/pad/android/iappad/AdWebView;)Z

    move-result v3

    invoke-virtual {v2, v3}, Lcom/pad/android/iappad/AdController;->setLoading(Z)V

    .line 152
    iget-object v2, p0, Lcom/pad/android/iappad/AdWebView$AdWebClient;->controller:Lcom/pad/android/iappad/AdController;

    invoke-virtual {v2}, Lcom/pad/android/iappad/AdController;->onLinkClicked()V

    .line 210
    :cond_88
    :goto_88
    return-void

    .line 156
    :cond_89
    const-string v2, "LBAdController"

    const-string v3, "Normal window to be used"

    invoke-static {v2, v3}, Lcom/pad/android/util/AdLog;->i(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_90
    .catch Ljava/lang/Exception; {:try_start_51 .. :try_end_90} :catch_91

    goto :goto_88

    .line 160
    :catch_91
    move-exception v0

    .line 162
    .local v0, "e":Ljava/lang/Exception;
    const-string v2, "LBAdController"

    new-instance v3, Ljava/lang/StringBuilder;

    const-string v4, "Exception - "

    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Lcom/pad/android/util/AdLog;->e(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_88

    .line 169
    .end local v0    # "e":Ljava/lang/Exception;
    :cond_ab
    const-string v2, "LBAdController"

    const-string v3, "Link clicked!!"

    invoke-static {v2, v3}, Lcom/pad/android/util/AdLog;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 170
    iget-object v2, p0, Lcom/pad/android/iappad/AdWebView$AdWebClient;->this$0:Lcom/pad/android/iappad/AdWebView;

    invoke-static {v2}, Lcom/pad/android/iappad/AdWebView;->access$1(Lcom/pad/android/iappad/AdWebView;)Z

    move-result v2

    if-nez v2, :cond_88

    .line 172
    iget-object v2, p0, Lcom/pad/android/iappad/AdWebView$AdWebClient;->this$0:Lcom/pad/android/iappad/AdWebView;

    invoke-static {v2}, Lcom/pad/android/iappad/AdWebView;->access$4(Lcom/pad/android/iappad/AdWebView;)Z

    move-result v2

    if-nez v2, :cond_ea

    const-string v2, "market://"

    invoke-virtual {p2, v2}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v2

    if-nez v2, :cond_ea

    const-string v2, "http://market.android.com"

    invoke-virtual {p2, v2}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v2

    if-nez v2, :cond_ea

    const-string v2, "https://market.android.com"

    invoke-virtual {p2, v2}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v2

    if-nez v2, :cond_ea

    const-string v2, "https://play.google.com/"

    invoke-virtual {p2, v2}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v2

    if-nez v2, :cond_ea

    const-string v2, "http://play.google.com/"

    invoke-virtual {p2, v2}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_11d

    .line 176
    :cond_ea
    :try_start_ea
    const-string v2, "LBAdController"

    const-string v3, "Opening URL natively"

    invoke-static {v2, v3}, Lcom/pad/android/util/AdLog;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 177
    invoke-virtual {p1}, Landroid/webkit/WebView;->stopLoading()V
    :try_end_f4
    .catch Ljava/lang/Exception; {:try_start_ea .. :try_end_f4} :catch_115

    .line 180
    :try_start_f4
    iget-object v2, p0, Lcom/pad/android/iappad/AdWebView$AdWebClient;->this$0:Lcom/pad/android/iappad/AdWebView;

    invoke-static {v2}, Lcom/pad/android/iappad/AdWebView;->access$2(Lcom/pad/android/iappad/AdWebView;)Lorg/json/JSONObject;

    move-result-object v2

    const-string v3, "clickhelpurl"

    invoke-virtual {v2, v3}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p1, v2}, Landroid/webkit/WebView;->loadUrl(Ljava/lang/String;)V
    :try_end_103
    .catch Ljava/lang/Exception; {:try_start_f4 .. :try_end_103} :catch_183

    .line 183
    :goto_103
    :try_start_103
    iget-object v2, p0, Lcom/pad/android/iappad/AdWebView$AdWebClient;->activity:Landroid/content/Context;

    new-instance v3, Landroid/content/Intent;

    const-string v4, "android.intent.action.VIEW"

    invoke-static {p2}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v5

    invoke-direct {v3, v4, v5}, Landroid/content/Intent;-><init>(Ljava/lang/String;Landroid/net/Uri;)V

    invoke-virtual {v2, v3}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V
    :try_end_113
    .catch Ljava/lang/Exception; {:try_start_103 .. :try_end_113} :catch_115

    goto/16 :goto_88

    .line 185
    :catch_115
    move-exception v0

    .line 187
    .restart local v0    # "e":Ljava/lang/Exception;
    iget-object v2, p0, Lcom/pad/android/iappad/AdWebView$AdWebClient;->controller:Lcom/pad/android/iappad/AdController;

    invoke-virtual {v2}, Lcom/pad/android/iappad/AdController;->destroyAd()V

    goto/16 :goto_88

    .line 190
    .end local v0    # "e":Ljava/lang/Exception;
    :cond_11d
    const-string v2, "usenative=1"

    invoke-virtual {p2, v2}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v2

    if-eqz v2, :cond_13a

    .line 192
    invoke-virtual {p1}, Landroid/webkit/WebView;->stopLoading()V

    .line 193
    iget-object v2, p0, Lcom/pad/android/iappad/AdWebView$AdWebClient;->activity:Landroid/content/Context;

    new-instance v3, Landroid/content/Intent;

    const-string v4, "android.intent.action.VIEW"

    invoke-static {p2}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v5

    invoke-direct {v3, v4, v5}, Landroid/content/Intent;-><init>(Ljava/lang/String;Landroid/net/Uri;)V

    invoke-virtual {v2, v3}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    goto/16 :goto_88

    .line 195
    :cond_13a
    const-string v2, "tel:"

    invoke-virtual {p2, v2}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_159

    .line 197
    iget-object v2, p0, Lcom/pad/android/iappad/AdWebView$AdWebClient;->controller:Lcom/pad/android/iappad/AdController;

    invoke-virtual {v2}, Lcom/pad/android/iappad/AdController;->destroyAd()V

    .line 198
    iget-object v2, p0, Lcom/pad/android/iappad/AdWebView$AdWebClient;->activity:Landroid/content/Context;

    new-instance v3, Landroid/content/Intent;

    const-string v4, "android.intent.action.VIEW"

    invoke-static {p2}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v5

    invoke-direct {v3, v4, v5}, Landroid/content/Intent;-><init>(Ljava/lang/String;Landroid/net/Uri;)V

    invoke-virtual {v2, v3}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    goto/16 :goto_88

    .line 202
    :cond_159
    iget-object v2, p0, Lcom/pad/android/iappad/AdWebView$AdWebClient;->this$0:Lcom/pad/android/iappad/AdWebView;

    invoke-static {v2}, Lcom/pad/android/iappad/AdWebView;->access$5(Lcom/pad/android/iappad/AdWebView;)Landroid/app/ProgressDialog;

    move-result-object v2

    if-eqz v2, :cond_16d

    iget-object v2, p0, Lcom/pad/android/iappad/AdWebView$AdWebClient;->this$0:Lcom/pad/android/iappad/AdWebView;

    invoke-static {v2}, Lcom/pad/android/iappad/AdWebView;->access$5(Lcom/pad/android/iappad/AdWebView;)Landroid/app/ProgressDialog;

    move-result-object v2

    invoke-virtual {v2}, Landroid/app/ProgressDialog;->isShowing()Z

    move-result v2

    if-nez v2, :cond_17c

    .line 204
    :cond_16d
    iget-object v2, p0, Lcom/pad/android/iappad/AdWebView$AdWebClient;->this$0:Lcom/pad/android/iappad/AdWebView;

    iget-object v3, p0, Lcom/pad/android/iappad/AdWebView$AdWebClient;->activity:Landroid/content/Context;

    const-string v4, ""

    const-string v5, "Loading....Please wait!"

    invoke-static {v3, v4, v5, v6}, Landroid/app/ProgressDialog;->show(Landroid/content/Context;Ljava/lang/CharSequence;Ljava/lang/CharSequence;Z)Landroid/app/ProgressDialog;

    move-result-object v3

    invoke-static {v2, v3}, Lcom/pad/android/iappad/AdWebView;->access$6(Lcom/pad/android/iappad/AdWebView;Landroid/app/ProgressDialog;)V

    .line 206
    :cond_17c
    iget-object v2, p0, Lcom/pad/android/iappad/AdWebView$AdWebClient;->controller:Lcom/pad/android/iappad/AdController;

    invoke-virtual {v2}, Lcom/pad/android/iappad/AdController;->onLinkClicked()V

    goto/16 :goto_88

    .line 182
    :catch_183
    move-exception v2

    goto/16 :goto_103
.end method
