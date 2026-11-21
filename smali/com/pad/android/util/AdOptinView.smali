###### Class com.pad.android.util.AdOptinView (com.pad.android.util.AdOptinView)
.class public Lcom/pad/android/util/AdOptinView;
.super Landroid/webkit/WebView;
.source "AdOptinView.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/pad/android/util/AdOptinView$AdOptinJSInterface;
    }
.end annotation


# instance fields
.field private activity:Landroid/app/Activity;

.field private layout:Landroid/widget/RelativeLayout;

.field private loadingDialog:Landroid/app/ProgressDialog;

.field private oListener:Lcom/pad/android/listener/AdOptinListener;

.field private optinUrl:Ljava/lang/String;


# direct methods
.method public constructor <init>(Landroid/app/Activity;Ljava/lang/String;Lcom/pad/android/listener/AdOptinListener;)V
    .registers 4
    .param p1, "act"    # Landroid/app/Activity;
    .param p2, "url"    # Ljava/lang/String;
    .param p3, "oL"    # Lcom/pad/android/listener/AdOptinListener;

    .prologue
    .line 33
    invoke-direct {p0, p1}, Landroid/webkit/WebView;-><init>(Landroid/content/Context;)V

    .line 34
    iput-object p1, p0, Lcom/pad/android/util/AdOptinView;->activity:Landroid/app/Activity;

    .line 35
    iput-object p2, p0, Lcom/pad/android/util/AdOptinView;->optinUrl:Ljava/lang/String;

    .line 36
    iput-object p3, p0, Lcom/pad/android/util/AdOptinView;->oListener:Lcom/pad/android/listener/AdOptinListener;

    .line 37
    invoke-direct {p0}, Lcom/pad/android/util/AdOptinView;->initialize()V

    .line 38
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;)V
    .registers 2
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 42
    invoke-direct {p0, p1}, Landroid/webkit/WebView;-><init>(Landroid/content/Context;)V

    .line 43
    return-void
.end method

.method static synthetic access$0(Lcom/pad/android/util/AdOptinView;)Landroid/app/Activity;
    .registers 2

    .prologue
    .line 25
    iget-object v0, p0, Lcom/pad/android/util/AdOptinView;->activity:Landroid/app/Activity;

    return-object v0
.end method

.method static synthetic access$1(Lcom/pad/android/util/AdOptinView;)V
    .registers 1

    .prologue
    .line 115
    invoke-direct {p0}, Lcom/pad/android/util/AdOptinView;->closeView()V

    return-void
.end method

.method static synthetic access$2(Lcom/pad/android/util/AdOptinView;)Lcom/pad/android/listener/AdOptinListener;
    .registers 2

    .prologue
    .line 27
    iget-object v0, p0, Lcom/pad/android/util/AdOptinView;->oListener:Lcom/pad/android/listener/AdOptinListener;

    return-object v0
.end method

.method static synthetic access$3(Lcom/pad/android/util/AdOptinView;)Ljava/lang/String;
    .registers 2

    .prologue
    .line 26
    iget-object v0, p0, Lcom/pad/android/util/AdOptinView;->optinUrl:Ljava/lang/String;

    return-object v0
.end method

.method static synthetic access$4(Lcom/pad/android/util/AdOptinView;)Landroid/app/ProgressDialog;
    .registers 2

    .prologue
    .line 28
    iget-object v0, p0, Lcom/pad/android/util/AdOptinView;->loadingDialog:Landroid/app/ProgressDialog;

    return-object v0
.end method

.method static synthetic access$5(Lcom/pad/android/util/AdOptinView;Landroid/app/ProgressDialog;)V
    .registers 2

    .prologue
    .line 28
    iput-object p1, p0, Lcom/pad/android/util/AdOptinView;->loadingDialog:Landroid/app/ProgressDialog;

    return-void
.end method

.method static synthetic access$6(Lcom/pad/android/util/AdOptinView;)Landroid/widget/RelativeLayout;
    .registers 2

    .prologue
    .line 29
    iget-object v0, p0, Lcom/pad/android/util/AdOptinView;->layout:Landroid/widget/RelativeLayout;

    return-object v0
.end method

.method private closeView()V
    .registers 3

    .prologue
    .line 117
    iget-object v0, p0, Lcom/pad/android/util/AdOptinView;->activity:Landroid/app/Activity;

    new-instance v1, Lcom/pad/android/util/AdOptinView$2;

    invoke-direct {v1, p0}, Lcom/pad/android/util/AdOptinView$2;-><init>(Lcom/pad/android/util/AdOptinView;)V

    invoke-virtual {v0, v1}, Landroid/app/Activity;->runOnUiThread(Ljava/lang/Runnable;)V

    .line 131
    return-void
.end method

.method private initialize()V
    .registers 15

    .prologue
    const/4 v12, 0x1

    const/4 v11, 0x0

    .line 47
    invoke-virtual {p0}, Lcom/pad/android/util/AdOptinView;->getSettings()Landroid/webkit/WebSettings;

    move-result-object v5

    .line 48
    .local v5, "settings":Landroid/webkit/WebSettings;
    invoke-virtual {v5, v12}, Landroid/webkit/WebSettings;->setJavaScriptEnabled(Z)V

    .line 49
    invoke-virtual {v5, v12}, Landroid/webkit/WebSettings;->setJavaScriptCanOpenWindowsAutomatically(Z)V

    .line 50
    new-instance v12, Lcom/pad/android/util/AdOptinView$AdOptinJSInterface;

    invoke-direct {v12, p0}, Lcom/pad/android/util/AdOptinView$AdOptinJSInterface;-><init>(Lcom/pad/android/util/AdOptinView;)V

    const-string v13, "LBOPTIN"

    invoke-virtual {p0, v12, v13}, Lcom/pad/android/util/AdOptinView;->addJavascriptInterface(Ljava/lang/Object;Ljava/lang/String;)V

    .line 51
    sget v12, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v13, 0x8

    if-lt v12, v13, :cond_21

    .line 53
    sget-object v12, Landroid/webkit/WebSettings$PluginState;->ON:Landroid/webkit/WebSettings$PluginState;

    invoke-virtual {v5, v12}, Landroid/webkit/WebSettings;->setPluginState(Landroid/webkit/WebSettings$PluginState;)V

    .line 59
    :cond_21
    new-instance v12, Lcom/pad/android/util/AdOptinView$1;

    invoke-direct {v12, p0}, Lcom/pad/android/util/AdOptinView$1;-><init>(Lcom/pad/android/util/AdOptinView;)V

    invoke-virtual {p0, v12}, Lcom/pad/android/util/AdOptinView;->setWebViewClient(Landroid/webkit/WebViewClient;)V

    .line 92
    iget-object v12, p0, Lcom/pad/android/util/AdOptinView;->optinUrl:Ljava/lang/String;

    invoke-virtual {p0, v12}, Lcom/pad/android/util/AdOptinView;->loadUrl(Ljava/lang/String;)V

    .line 93
    new-instance v12, Landroid/widget/RelativeLayout;

    iget-object v13, p0, Lcom/pad/android/util/AdOptinView;->activity:Landroid/app/Activity;

    invoke-direct {v12, v13}, Landroid/widget/RelativeLayout;-><init>(Landroid/content/Context;)V

    iput-object v12, p0, Lcom/pad/android/util/AdOptinView;->layout:Landroid/widget/RelativeLayout;

    .line 95
    new-instance v1, Landroid/util/DisplayMetrics;

    invoke-direct {v1}, Landroid/util/DisplayMetrics;-><init>()V

    .line 96
    .local v1, "dm":Landroid/util/DisplayMetrics;
    iget-object v12, p0, Lcom/pad/android/util/AdOptinView;->activity:Landroid/app/Activity;

    invoke-virtual {v12}, Landroid/app/Activity;->getWindowManager()Landroid/view/WindowManager;

    move-result-object v12

    invoke-interface {v12}, Landroid/view/WindowManager;->getDefaultDisplay()Landroid/view/Display;

    move-result-object v12

    invoke-virtual {v12, v1}, Landroid/view/Display;->getMetrics(Landroid/util/DisplayMetrics;)V

    .line 98
    new-instance v2, Landroid/graphics/Rect;

    invoke-direct {v2}, Landroid/graphics/Rect;-><init>()V

    .line 99
    .local v2, "rect":Landroid/graphics/Rect;
    iget-object v12, p0, Lcom/pad/android/util/AdOptinView;->activity:Landroid/app/Activity;

    invoke-virtual {v12}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    move-result-object v10

    .line 100
    .local v10, "win":Landroid/view/Window;
    invoke-virtual {v10}, Landroid/view/Window;->getDecorView()Landroid/view/View;

    move-result-object v12

    invoke-virtual {v12, v2}, Landroid/view/View;->getWindowVisibleDisplayFrame(Landroid/graphics/Rect;)V

    .line 101
    iget v6, v2, Landroid/graphics/Rect;->top:I

    .line 102
    .local v6, "statusBarHeight":I
    const v12, 0x1020002

    invoke-virtual {v10, v12}, Landroid/view/Window;->findViewById(I)Landroid/view/View;

    move-result-object v12

    invoke-virtual {v12}, Landroid/view/View;->getTop()I

    move-result v0

    .line 103
    .local v0, "contentViewTop":I
    if-le v0, v6, :cond_8d

    sub-int v7, v0, v6

    .line 105
    .local v7, "titleBarHeight":I
    :goto_6c
    iget v4, v1, Landroid/util/DisplayMetrics;->widthPixels:I

    .line 106
    .local v4, "sWidth":I
    iget v12, v1, Landroid/util/DisplayMetrics;->heightPixels:I

    sub-int/2addr v12, v6

    sub-int v3, v12, v7

    .line 108
    .local v3, "sHeight":I
    new-instance v9, Landroid/view/ViewGroup$MarginLayoutParams;

    invoke-direct {v9, v4, v3}, Landroid/view/ViewGroup$MarginLayoutParams;-><init>(II)V

    .line 109
    .local v9, "wM":Landroid/view/ViewGroup$MarginLayoutParams;
    invoke-virtual {v9, v11, v11, v11, v11}, Landroid/view/ViewGroup$MarginLayoutParams;->setMargins(IIII)V

    .line 110
    new-instance v8, Landroid/widget/RelativeLayout$LayoutParams;

    invoke-direct {v8, v9}, Landroid/widget/RelativeLayout$LayoutParams;-><init>(Landroid/view/ViewGroup$MarginLayoutParams;)V

    .line 111
    .local v8, "wL":Landroid/widget/RelativeLayout$LayoutParams;
    iget-object v11, p0, Lcom/pad/android/util/AdOptinView;->layout:Landroid/widget/RelativeLayout;

    invoke-virtual {v11, p0, v8}, Landroid/widget/RelativeLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 112
    iget-object v11, p0, Lcom/pad/android/util/AdOptinView;->activity:Landroid/app/Activity;

    iget-object v12, p0, Lcom/pad/android/util/AdOptinView;->layout:Landroid/widget/RelativeLayout;

    invoke-virtual {v11, v12, v8}, Landroid/app/Activity;->addContentView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 113
    return-void

    .end local v3    # "sHeight":I
    .end local v4    # "sWidth":I
    .end local v7    # "titleBarHeight":I
    .end local v8    # "wL":Landroid/widget/RelativeLayout$LayoutParams;
    .end local v9    # "wM":Landroid/view/ViewGroup$MarginLayoutParams;
    :cond_8d
    move v7, v11

    .line 103
    goto :goto_6c
.end method

###### Class com.pad.android.util.AdOptinView.AnonymousClass1 (com.pad.android.util.AdOptinView$1)
.class Lcom/pad/android/util/AdOptinView$1;
.super Landroid/webkit/WebViewClient;
.source "AdOptinView.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/pad/android/util/AdOptinView;->initialize()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/pad/android/util/AdOptinView;


# direct methods
.method constructor <init>(Lcom/pad/android/util/AdOptinView;)V
    .registers 2

    .prologue
    .line 1
    iput-object p1, p0, Lcom/pad/android/util/AdOptinView$1;->this$0:Lcom/pad/android/util/AdOptinView;

    .line 59
    invoke-direct {p0}, Landroid/webkit/WebViewClient;-><init>()V

    return-void
.end method


# virtual methods
.method public onPageFinished(Landroid/webkit/WebView;Ljava/lang/String;)V
    .registers 5
    .param p1, "view"    # Landroid/webkit/WebView;
    .param p2, "url"    # Ljava/lang/String;

    .prologue
    .line 85
    iget-object v0, p0, Lcom/pad/android/util/AdOptinView$1;->this$0:Lcom/pad/android/util/AdOptinView;

    const/16 v1, 0x82

    invoke-virtual {v0, v1}, Lcom/pad/android/util/AdOptinView;->requestFocus(I)Z

    .line 86
    iget-object v0, p0, Lcom/pad/android/util/AdOptinView$1;->this$0:Lcom/pad/android/util/AdOptinView;

    invoke-static {v0}, Lcom/pad/android/util/AdOptinView;->access$4(Lcom/pad/android/util/AdOptinView;)Landroid/app/ProgressDialog;

    move-result-object v0

    if-eqz v0, :cond_24

    iget-object v0, p0, Lcom/pad/android/util/AdOptinView$1;->this$0:Lcom/pad/android/util/AdOptinView;

    invoke-static {v0}, Lcom/pad/android/util/AdOptinView;->access$4(Lcom/pad/android/util/AdOptinView;)Landroid/app/ProgressDialog;

    move-result-object v0

    invoke-virtual {v0}, Landroid/app/ProgressDialog;->isShowing()Z

    move-result v0

    if-eqz v0, :cond_24

    .line 88
    iget-object v0, p0, Lcom/pad/android/util/AdOptinView$1;->this$0:Lcom/pad/android/util/AdOptinView;

    invoke-static {v0}, Lcom/pad/android/util/AdOptinView;->access$4(Lcom/pad/android/util/AdOptinView;)Landroid/app/ProgressDialog;

    move-result-object v0

    invoke-virtual {v0}, Landroid/app/ProgressDialog;->dismiss()V

    .line 90
    :cond_24
    return-void
.end method

.method public onPageStarted(Landroid/webkit/WebView;Ljava/lang/String;Landroid/graphics/Bitmap;)V
    .registers 10
    .param p1, "view"    # Landroid/webkit/WebView;
    .param p2, "url"    # Ljava/lang/String;
    .param p3, "favicon"    # Landroid/graphics/Bitmap;

    .prologue
    .line 64
    iget-object v1, p0, Lcom/pad/android/util/AdOptinView$1;->this$0:Lcom/pad/android/util/AdOptinView;

    invoke-static {v1}, Lcom/pad/android/util/AdOptinView;->access$3(Lcom/pad/android/util/AdOptinView;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p2, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_24

    .line 66
    invoke-virtual {p1}, Landroid/webkit/WebView;->stopLoading()V

    .line 67
    iget-object v1, p0, Lcom/pad/android/util/AdOptinView$1;->this$0:Lcom/pad/android/util/AdOptinView;

    invoke-static {v1}, Lcom/pad/android/util/AdOptinView;->access$0(Lcom/pad/android/util/AdOptinView;)Landroid/app/Activity;

    move-result-object v1

    new-instance v2, Landroid/content/Intent;

    const-string v3, "android.intent.action.VIEW"

    invoke-static {p2}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v4

    invoke-direct {v2, v3, v4}, Landroid/content/Intent;-><init>(Ljava/lang/String;Landroid/net/Uri;)V

    invoke-virtual {v1, v2}, Landroid/app/Activity;->startActivity(Landroid/content/Intent;)V

    .line 81
    :cond_23
    :goto_23
    return-void

    .line 69
    :cond_24
    iget-object v1, p0, Lcom/pad/android/util/AdOptinView$1;->this$0:Lcom/pad/android/util/AdOptinView;

    invoke-static {v1}, Lcom/pad/android/util/AdOptinView;->access$4(Lcom/pad/android/util/AdOptinView;)Landroid/app/ProgressDialog;

    move-result-object v1

    if-eqz v1, :cond_38

    iget-object v1, p0, Lcom/pad/android/util/AdOptinView$1;->this$0:Lcom/pad/android/util/AdOptinView;

    invoke-static {v1}, Lcom/pad/android/util/AdOptinView;->access$4(Lcom/pad/android/util/AdOptinView;)Landroid/app/ProgressDialog;

    move-result-object v1

    invoke-virtual {v1}, Landroid/app/ProgressDialog;->isShowing()Z

    move-result v1

    if-nez v1, :cond_23

    .line 73
    :cond_38
    :try_start_38
    iget-object v1, p0, Lcom/pad/android/util/AdOptinView$1;->this$0:Lcom/pad/android/util/AdOptinView;

    iget-object v2, p0, Lcom/pad/android/util/AdOptinView$1;->this$0:Lcom/pad/android/util/AdOptinView;

    invoke-static {v2}, Lcom/pad/android/util/AdOptinView;->access$0(Lcom/pad/android/util/AdOptinView;)Landroid/app/Activity;

    move-result-object v2

    const-string v3, ""

    const-string v4, "Loading....Please wait!"

    const/4 v5, 0x1

    invoke-static {v2, v3, v4, v5}, Landroid/app/ProgressDialog;->show(Landroid/content/Context;Ljava/lang/CharSequence;Ljava/lang/CharSequence;Z)Landroid/app/ProgressDialog;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/pad/android/util/AdOptinView;->access$5(Lcom/pad/android/util/AdOptinView;Landroid/app/ProgressDialog;)V
    :try_end_4c
    .catch Ljava/lang/Exception; {:try_start_38 .. :try_end_4c} :catch_4d

    goto :goto_23

    .line 75
    :catch_4d
    move-exception v0

    .line 77
    .local v0, "e":Ljava/lang/Exception;
    const-string v1, "LBADController"

    new-instance v2, Ljava/lang/StringBuilder;

    const-string v3, "Error when trying to show dialog - "

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/pad/android/util/AdLog;->e(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_23
.end method

###### Class com.pad.android.util.AdOptinView.AnonymousClass2 (com.pad.android.util.AdOptinView$2)
.class Lcom/pad/android/util/AdOptinView$2;
.super Ljava/lang/Object;
.source "AdOptinView.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/pad/android/util/AdOptinView;->closeView()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/pad/android/util/AdOptinView;


# direct methods
.method constructor <init>(Lcom/pad/android/util/AdOptinView;)V
    .registers 2

    .prologue
    .line 1
    iput-object p1, p0, Lcom/pad/android/util/AdOptinView$2;->this$0:Lcom/pad/android/util/AdOptinView;

    .line 117
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .registers 4

    .prologue
    .line 120
    iget-object v0, p0, Lcom/pad/android/util/AdOptinView$2;->this$0:Lcom/pad/android/util/AdOptinView;

    invoke-static {v0}, Lcom/pad/android/util/AdOptinView;->access$6(Lcom/pad/android/util/AdOptinView;)Landroid/widget/RelativeLayout;

    move-result-object v0

    if-eqz v0, :cond_11

    .line 122
    iget-object v0, p0, Lcom/pad/android/util/AdOptinView$2;->this$0:Lcom/pad/android/util/AdOptinView;

    invoke-static {v0}, Lcom/pad/android/util/AdOptinView;->access$6(Lcom/pad/android/util/AdOptinView;)Landroid/widget/RelativeLayout;

    move-result-object v0

    invoke-virtual {v0}, Landroid/widget/RelativeLayout;->removeAllViews()V

    .line 124
    :cond_11
    iget-object v0, p0, Lcom/pad/android/util/AdOptinView$2;->this$0:Lcom/pad/android/util/AdOptinView;

    const/4 v1, 0x4

    invoke-virtual {v0, v1}, Lcom/pad/android/util/AdOptinView;->setVisibility(I)V

    .line 127
    :try_start_17
    const-string v0, "android.webkit.WebView"

    invoke-static {v0}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    const-string v1, "onPause"

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v0

    const/4 v1, 0x0

    invoke-virtual {v0, p0, v1}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_28
    .catch Ljava/lang/Exception; {:try_start_17 .. :try_end_28} :catch_29

    .line 129
    :goto_28
    return-void

    .line 128
    :catch_29
    move-exception v0

    goto :goto_28
.end method

###### Class com.pad.android.util.AdOptinView.AdOptinJSInterface (com.pad.android.util.AdOptinView$AdOptinJSInterface)
.class Lcom/pad/android/util/AdOptinView$AdOptinJSInterface;
.super Ljava/lang/Object;
.source "AdOptinView.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/pad/android/util/AdOptinView;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = "AdOptinJSInterface"
.end annotation


# instance fields
.field final synthetic this$0:Lcom/pad/android/util/AdOptinView;


# direct methods
.method constructor <init>(Lcom/pad/android/util/AdOptinView;)V
    .registers 2

    .prologue
    .line 133
    iput-object p1, p0, Lcom/pad/android/util/AdOptinView$AdOptinJSInterface;->this$0:Lcom/pad/android/util/AdOptinView;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public cancelclicked()V
    .registers 6

    .prologue
    .line 151
    iget-object v2, p0, Lcom/pad/android/util/AdOptinView$AdOptinJSInterface;->this$0:Lcom/pad/android/util/AdOptinView;

    invoke-static {v2}, Lcom/pad/android/util/AdOptinView;->access$0(Lcom/pad/android/util/AdOptinView;)Landroid/app/Activity;

    move-result-object v2

    const-string v3, "Preference"

    const/4 v4, 0x2

    invoke-virtual {v2, v3, v4}, Landroid/app/Activity;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v1

    .line 152
    .local v1, "pref":Landroid/content/SharedPreferences;
    invoke-interface {v1}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    .line 153
    .local v0, "edit":Landroid/content/SharedPreferences$Editor;
    const-string v2, "SD_APP_OPTIN"

    const-string v3, "0"

    invoke-interface {v0, v2, v3}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    .line 154
    const-string v2, "SD_APP_OPTIN_SHOWN"

    const-string v3, "1"

    invoke-interface {v0, v2, v3}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    .line 155
    invoke-interface {v0}, Landroid/content/SharedPreferences$Editor;->commit()Z

    .line 156
    iget-object v2, p0, Lcom/pad/android/util/AdOptinView$AdOptinJSInterface;->this$0:Lcom/pad/android/util/AdOptinView;

    invoke-static {v2}, Lcom/pad/android/util/AdOptinView;->access$1(Lcom/pad/android/util/AdOptinView;)V

    .line 157
    iget-object v2, p0, Lcom/pad/android/util/AdOptinView$AdOptinJSInterface;->this$0:Lcom/pad/android/util/AdOptinView;

    invoke-static {v2}, Lcom/pad/android/util/AdOptinView;->access$2(Lcom/pad/android/util/AdOptinView;)Lcom/pad/android/listener/AdOptinListener;

    move-result-object v2

    if-eqz v2, :cond_38

    .line 159
    iget-object v2, p0, Lcom/pad/android/util/AdOptinView$AdOptinJSInterface;->this$0:Lcom/pad/android/util/AdOptinView;

    invoke-static {v2}, Lcom/pad/android/util/AdOptinView;->access$2(Lcom/pad/android/util/AdOptinView;)Lcom/pad/android/listener/AdOptinListener;

    move-result-object v2

    invoke-interface {v2}, Lcom/pad/android/listener/AdOptinListener;->onAdOptin()V

    .line 161
    :cond_38
    return-void
.end method

.method public okclicked()V
    .registers 7

    .prologue
    .line 137
    iget-object v2, p0, Lcom/pad/android/util/AdOptinView$AdOptinJSInterface;->this$0:Lcom/pad/android/util/AdOptinView;

    invoke-static {v2}, Lcom/pad/android/util/AdOptinView;->access$0(Lcom/pad/android/util/AdOptinView;)Landroid/app/Activity;

    move-result-object v2

    const-string v3, "Preference"

    const/4 v4, 0x2

    invoke-virtual {v2, v3, v4}, Landroid/app/Activity;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v1

    .line 138
    .local v1, "pref":Landroid/content/SharedPreferences;
    invoke-interface {v1}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    .line 139
    .local v0, "edit":Landroid/content/SharedPreferences$Editor;
    const-string v2, "SD_APP_OPTIN"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v4

    invoke-virtual {v3, v4, v5}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-interface {v0, v2, v3}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    .line 140
    const-string v2, "SD_APP_OPTIN_SHOWN"

    const-string v3, "1"

    invoke-interface {v0, v2, v3}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    .line 141
    invoke-interface {v0}, Landroid/content/SharedPreferences$Editor;->commit()Z

    .line 142
    iget-object v2, p0, Lcom/pad/android/util/AdOptinView$AdOptinJSInterface;->this$0:Lcom/pad/android/util/AdOptinView;

    invoke-static {v2}, Lcom/pad/android/util/AdOptinView;->access$1(Lcom/pad/android/util/AdOptinView;)V

    .line 143
    iget-object v2, p0, Lcom/pad/android/util/AdOptinView$AdOptinJSInterface;->this$0:Lcom/pad/android/util/AdOptinView;

    invoke-static {v2}, Lcom/pad/android/util/AdOptinView;->access$2(Lcom/pad/android/util/AdOptinView;)Lcom/pad/android/listener/AdOptinListener;

    move-result-object v2

    if-eqz v2, :cond_47

    .line 145
    iget-object v2, p0, Lcom/pad/android/util/AdOptinView$AdOptinJSInterface;->this$0:Lcom/pad/android/util/AdOptinView;

    invoke-static {v2}, Lcom/pad/android/util/AdOptinView;->access$2(Lcom/pad/android/util/AdOptinView;)Lcom/pad/android/listener/AdOptinListener;

    move-result-object v2

    invoke-interface {v2}, Lcom/pad/android/listener/AdOptinListener;->onAdOptin()V

    .line 147
    :cond_47
    return-void
.end method
