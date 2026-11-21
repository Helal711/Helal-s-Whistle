###### Class com.WhistlePhoneLocator.AndroidWhistlerService (com.WhistlePhoneLocator.AndroidWhistlerService)
.class public Lcom/WhistlePhoneLocator/AndroidWhistlerService;
.super Landroid/app/Service;
.source "AndroidWhistlerService.java"


# annotations
.annotation build Landroid/annotation/SuppressLint;
    value = {
        "HandlerLeak"
    }
.end annotation


# static fields
.field public static ServiceCounter:J


# instance fields
.field private AudioNotification:Ljava/lang/Boolean;

.field private DetectorEnabledFromPrefs:Ljava/lang/Boolean;

.field private MediaVolume:I

.field private PowerStatusAcquired:I

.field private SelectedAudio:Ljava/lang/String;

.field private SelectedSensitivity:Ljava/lang/String;

.field private ToastEnabledFromPrefs:Ljava/lang/Boolean;

.field private ToastSelector:I

.field private VisualNotification:Ljava/lang/Boolean;

.field WDE:Lcom/WhistlePhoneLocator/WhistleDetectorEngine;

.field private WDEresult:I

.field private audio:Landroid/media/AudioManager;

.field private flags:I

.field private handler:Landroid/os/Handler;

.field private isPlaying:Z

.field private isRecording:Z

.field mPlayer:Landroid/media/MediaPlayer;

.field private maxMediaVolumeFlag:Ljava/lang/Boolean;

.field private pm:Landroid/os/PowerManager;

.field private sensitivity:S

.field private wl:Landroid/os/PowerManager$WakeLock;

.field private wl1:Landroid/os/PowerManager$WakeLock;


# direct methods
.method static constructor <clinit>()V
    .registers 2

    .prologue
    .line 26
    const-wide/16 v0, 0x0

    sput-wide v0, Lcom/WhistlePhoneLocator/AndroidWhistlerService;->ServiceCounter:J

    .line 24
    return-void
.end method

.method public constructor <init>()V
    .registers 4

    .prologue
    const/4 v2, 0x1

    const/4 v1, 0x0

    .line 24
    invoke-direct {p0}, Landroid/app/Service;-><init>()V

    .line 30
    iput-boolean v1, p0, Lcom/WhistlePhoneLocator/AndroidWhistlerService;->isRecording:Z

    .line 31
    iput-boolean v1, p0, Lcom/WhistlePhoneLocator/AndroidWhistlerService;->isPlaying:Z

    .line 32
    iput v1, p0, Lcom/WhistlePhoneLocator/AndroidWhistlerService;->ToastSelector:I

    .line 33
    iput v1, p0, Lcom/WhistlePhoneLocator/AndroidWhistlerService;->WDEresult:I

    .line 35
    iput v1, p0, Lcom/WhistlePhoneLocator/AndroidWhistlerService;->PowerStatusAcquired:I

    .line 45
    invoke-static {v2}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    iput-object v0, p0, Lcom/WhistlePhoneLocator/AndroidWhistlerService;->AudioNotification:Ljava/lang/Boolean;

    .line 46
    invoke-static {v2}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    iput-object v0, p0, Lcom/WhistlePhoneLocator/AndroidWhistlerService;->VisualNotification:Ljava/lang/Boolean;

    .line 47
    invoke-static {v1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    iput-object v0, p0, Lcom/WhistlePhoneLocator/AndroidWhistlerService;->maxMediaVolumeFlag:Ljava/lang/Boolean;

    .line 48
    invoke-static {v1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    iput-object v0, p0, Lcom/WhistlePhoneLocator/AndroidWhistlerService;->DetectorEnabledFromPrefs:Ljava/lang/Boolean;

    .line 49
    invoke-static {v1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    iput-object v0, p0, Lcom/WhistlePhoneLocator/AndroidWhistlerService;->ToastEnabledFromPrefs:Ljava/lang/Boolean;

    .line 50
    const-string v0, "3"

    iput-object v0, p0, Lcom/WhistlePhoneLocator/AndroidWhistlerService;->SelectedAudio:Ljava/lang/String;

    .line 51
    const-string v0, "3"

    iput-object v0, p0, Lcom/WhistlePhoneLocator/AndroidWhistlerService;->SelectedSensitivity:Ljava/lang/String;

    .line 52
    const/4 v0, 0x3

    iput-short v0, p0, Lcom/WhistlePhoneLocator/AndroidWhistlerService;->sensitivity:S

    .line 384
    new-instance v0, Lcom/WhistlePhoneLocator/AndroidWhistlerService$1;

    invoke-direct {v0, p0}, Lcom/WhistlePhoneLocator/AndroidWhistlerService$1;-><init>(Lcom/WhistlePhoneLocator/AndroidWhistlerService;)V

    iput-object v0, p0, Lcom/WhistlePhoneLocator/AndroidWhistlerService;->handler:Landroid/os/Handler;

    .line 24
    return-void
.end method

.method static synthetic access$0(Lcom/WhistlePhoneLocator/AndroidWhistlerService;)I
    .registers 2

    .prologue
    .line 32
    iget v0, p0, Lcom/WhistlePhoneLocator/AndroidWhistlerService;->ToastSelector:I

    return v0
.end method

.method static synthetic access$1(Lcom/WhistlePhoneLocator/AndroidWhistlerService;)Ljava/lang/Boolean;
    .registers 2

    .prologue
    .line 49
    iget-object v0, p0, Lcom/WhistlePhoneLocator/AndroidWhistlerService;->ToastEnabledFromPrefs:Ljava/lang/Boolean;

    return-object v0
.end method


# virtual methods
.method public AudioProcessor()V
    .registers 16

    .prologue
    .line 141
    const v2, 0xac44

    .line 142
    .local v2, "FSampling":I
    const/4 v6, 0x0

    .line 144
    .local v6, "LocalCounter":I
    new-instance v1, Lcom/WhistlePhoneLocator/WhistleDetectorEngine;

    invoke-direct {v1}, Lcom/WhistlePhoneLocator/WhistleDetectorEngine;-><init>()V

    iput-object v1, p0, Lcom/WhistlePhoneLocator/AndroidWhistlerService;->WDE:Lcom/WhistlePhoneLocator/WhistleDetectorEngine;

    .line 148
    const v1, 0x1000001a

    iput v1, p0, Lcom/WhistlePhoneLocator/AndroidWhistlerService;->flags:I

    .line 149
    iget-object v1, p0, Lcom/WhistlePhoneLocator/AndroidWhistlerService;->pm:Landroid/os/PowerManager;

    iget v5, p0, Lcom/WhistlePhoneLocator/AndroidWhistlerService;->flags:I

    const-string v11, "AndroidWhistlerService"

    invoke-virtual {v1, v5, v11}, Landroid/os/PowerManager;->newWakeLock(ILjava/lang/String;)Landroid/os/PowerManager$WakeLock;

    move-result-object v1

    iput-object v1, p0, Lcom/WhistlePhoneLocator/AndroidWhistlerService;->wl:Landroid/os/PowerManager$WakeLock;

    .line 151
    const/16 v3, 0x10

    .line 152
    .local v3, "channelConfiguration":I
    const/4 v4, 0x2

    .line 156
    .local v4, "audioEncoding":I
    const/16 v1, 0x2000

    new-array v7, v1, [S

    .line 162
    .local v7, "buffer":[S
    :try_start_23
    invoke-static {v2, v3, v4}, Landroid/media/AudioRecord;->getMinBufferSize(III)I

    move-result v8

    .line 164
    .local v8, "bufferSizeRecord":I
    const/16 v1, 0x500

    if-ge v8, v1, :cond_2d

    .line 165
    const/16 v8, 0x500

    .line 168
    :cond_2d
    new-instance v0, Landroid/media/AudioRecord;

    const/4 v1, 0x1

    const/16 v5, 0x5000

    invoke-direct/range {v0 .. v5}, Landroid/media/AudioRecord;-><init>(IIIII)V

    .line 169
    .local v0, "audioRecord":Landroid/media/AudioRecord;
    invoke-virtual {v0}, Landroid/media/AudioRecord;->startRecording()V

    .line 171
    const/4 v10, 0x0

    .line 172
    .local v10, "toggle":I
    :cond_39
    :goto_39
    iget-boolean v1, p0, Lcom/WhistlePhoneLocator/AndroidWhistlerService;->isRecording:Z

    if-nez v1, :cond_44

    .line 205
    invoke-virtual {v0}, Landroid/media/AudioRecord;->stop()V

    .line 206
    invoke-virtual {v0}, Landroid/media/AudioRecord;->release()V

    .line 212
    .end local v0    # "audioRecord":Landroid/media/AudioRecord;
    .end local v8    # "bufferSizeRecord":I
    .end local v10    # "toggle":I
    :goto_43
    return-void

    .line 174
    .restart local v0    # "audioRecord":Landroid/media/AudioRecord;
    .restart local v8    # "bufferSizeRecord":I
    .restart local v10    # "toggle":I
    :cond_44
    const/4 v1, 0x0

    const/16 v5, 0x113a

    invoke-virtual {v0, v7, v1, v5}, Landroid/media/AudioRecord;->read([SII)I

    .line 176
    if-nez v10, :cond_82

    .line 178
    iget-object v1, p0, Lcom/WhistlePhoneLocator/AndroidWhistlerService;->WDE:Lcom/WhistlePhoneLocator/WhistleDetectorEngine;

    iget-short v5, p0, Lcom/WhistlePhoneLocator/AndroidWhistlerService;->sensitivity:S

    invoke-virtual {v1, v7, v5}, Lcom/WhistlePhoneLocator/WhistleDetectorEngine;->WhistleProcessAndDetect([SS)I

    move-result v1

    iput v1, p0, Lcom/WhistlePhoneLocator/AndroidWhistlerService;->WDEresult:I

    .line 180
    iget v1, p0, Lcom/WhistlePhoneLocator/AndroidWhistlerService;->WDEresult:I

    const/4 v5, 0x1

    if-ne v1, v5, :cond_6a

    iget-boolean v1, p0, Lcom/WhistlePhoneLocator/AndroidWhistlerService;->isPlaying:Z

    if-nez v1, :cond_6a

    .line 182
    const/4 v1, 0x0

    iput v1, p0, Lcom/WhistlePhoneLocator/AndroidWhistlerService;->WDEresult:I

    .line 184
    new-instance v1, Lcom/WhistlePhoneLocator/AndroidWhistlerService$3;

    invoke-direct {v1, p0}, Lcom/WhistlePhoneLocator/AndroidWhistlerService$3;-><init>(Lcom/WhistlePhoneLocator/AndroidWhistlerService;)V

    .line 191
    invoke-virtual {v1}, Lcom/WhistlePhoneLocator/AndroidWhistlerService$3;->start()V

    .line 193
    :cond_6a
    const/4 v10, 0x1

    .line 197
    :goto_6b
    add-int/lit8 v6, v6, 0x1

    .line 198
    const/16 v1, 0xa

    if-ne v6, v1, :cond_39

    .line 200
    sget-wide v11, Lcom/WhistlePhoneLocator/AndroidWhistlerService;->ServiceCounter:J

    const-wide/16 v13, 0x1

    add-long/2addr v11, v13

    sput-wide v11, Lcom/WhistlePhoneLocator/AndroidWhistlerService;->ServiceCounter:J

    .line 201
    const/4 v6, 0x0

    .line 202
    invoke-virtual {p0}, Lcom/WhistlePhoneLocator/AndroidWhistlerService;->ReadSensitivity()V
    :try_end_7c
    .catch Ljava/lang/IllegalStateException; {:try_start_23 .. :try_end_7c} :catch_7d

    goto :goto_39

    .line 208
    .end local v0    # "audioRecord":Landroid/media/AudioRecord;
    .end local v8    # "bufferSizeRecord":I
    .end local v10    # "toggle":I
    :catch_7d
    move-exception v9

    .line 210
    .local v9, "e":Ljava/lang/IllegalStateException;
    invoke-virtual {v9}, Ljava/lang/IllegalStateException;->printStackTrace()V

    goto :goto_43

    .line 196
    .end local v9    # "e":Ljava/lang/IllegalStateException;
    .restart local v0    # "audioRecord":Landroid/media/AudioRecord;
    .restart local v8    # "bufferSizeRecord":I
    .restart local v10    # "toggle":I
    :cond_82
    const/4 v10, 0x0

    goto :goto_6b
.end method

.method public NotificationFunctionality()V
    .registers 11

    .prologue
    const/16 v9, 0x10

    const/4 v8, 0x1

    const/4 v7, 0x0

    const/4 v6, 0x3

    .line 217
    iput-boolean v8, p0, Lcom/WhistlePhoneLocator/AndroidWhistlerService;->isPlaying:Z

    .line 220
    invoke-virtual {p0}, Lcom/WhistlePhoneLocator/AndroidWhistlerService;->ReadPreferences()V

    .line 222
    iput v6, p0, Lcom/WhistlePhoneLocator/AndroidWhistlerService;->ToastSelector:I

    .line 223
    iget-object v1, p0, Lcom/WhistlePhoneLocator/AndroidWhistlerService;->handler:Landroid/os/Handler;

    invoke-virtual {v1, v7}, Landroid/os/Handler;->sendEmptyMessage(I)Z

    .line 226
    iget-object v1, p0, Lcom/WhistlePhoneLocator/AndroidWhistlerService;->VisualNotification:Ljava/lang/Boolean;

    invoke-virtual {v1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v1

    if-eqz v1, :cond_29

    iget v1, p0, Lcom/WhistlePhoneLocator/AndroidWhistlerService;->PowerStatusAcquired:I

    if-nez v1, :cond_29

    .line 229
    iget-object v1, p0, Lcom/WhistlePhoneLocator/AndroidWhistlerService;->wl1:Landroid/os/PowerManager$WakeLock;

    invoke-virtual {v1}, Landroid/os/PowerManager$WakeLock;->release()V

    .line 230
    iget-object v1, p0, Lcom/WhistlePhoneLocator/AndroidWhistlerService;->wl:Landroid/os/PowerManager$WakeLock;

    invoke-virtual {v1}, Landroid/os/PowerManager$WakeLock;->acquire()V

    .line 231
    iput v8, p0, Lcom/WhistlePhoneLocator/AndroidWhistlerService;->PowerStatusAcquired:I

    .line 235
    :cond_29
    iget-object v1, p0, Lcom/WhistlePhoneLocator/AndroidWhistlerService;->AudioNotification:Ljava/lang/Boolean;

    invoke-virtual {v1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v1

    if-eqz v1, :cond_282

    .line 238
    iget-object v1, p0, Lcom/WhistlePhoneLocator/AndroidWhistlerService;->maxMediaVolumeFlag:Ljava/lang/Boolean;

    invoke-virtual {v1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v1

    if-eqz v1, :cond_5e

    .line 241
    const-string v1, "audio"

    invoke-virtual {p0, v1}, Lcom/WhistlePhoneLocator/AndroidWhistlerService;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/media/AudioManager;

    iput-object v1, p0, Lcom/WhistlePhoneLocator/AndroidWhistlerService;->audio:Landroid/media/AudioManager;

    .line 242
    iget-object v1, p0, Lcom/WhistlePhoneLocator/AndroidWhistlerService;->audio:Landroid/media/AudioManager;

    invoke-virtual {v1, v6}, Landroid/media/AudioManager;->getStreamVolume(I)I

    move-result v1

    iput v1, p0, Lcom/WhistlePhoneLocator/AndroidWhistlerService;->MediaVolume:I

    .line 243
    iget-object v1, p0, Lcom/WhistlePhoneLocator/AndroidWhistlerService;->audio:Landroid/media/AudioManager;

    const-wide v2, 0x3fee666666666666L    # 0.95

    iget-object v4, p0, Lcom/WhistlePhoneLocator/AndroidWhistlerService;->audio:Landroid/media/AudioManager;

    invoke-virtual {v4, v6}, Landroid/media/AudioManager;->getStreamMaxVolume(I)I

    move-result v4

    int-to-double v4, v4

    mul-double/2addr v2, v4

    double-to-int v2, v2

    invoke-virtual {v1, v6, v2, v9}, Landroid/media/AudioManager;->setStreamVolume(III)V

    .line 246
    :cond_5e
    iget-object v1, p0, Lcom/WhistlePhoneLocator/AndroidWhistlerService;->SelectedAudio:Ljava/lang/String;

    const-string v2, "1"

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_b6

    .line 247
    const/high16 v1, 0x7f040000

    invoke-static {p0, v1}, Landroid/media/MediaPlayer;->create(Landroid/content/Context;I)Landroid/media/MediaPlayer;

    move-result-object v1

    iput-object v1, p0, Lcom/WhistlePhoneLocator/AndroidWhistlerService;->mPlayer:Landroid/media/MediaPlayer;

    .line 274
    :cond_70
    :goto_70
    iget-object v1, p0, Lcom/WhistlePhoneLocator/AndroidWhistlerService;->mPlayer:Landroid/media/MediaPlayer;

    invoke-virtual {v1}, Landroid/media/MediaPlayer;->start()V

    .line 277
    :try_start_75
    iget-object v1, p0, Lcom/WhistlePhoneLocator/AndroidWhistlerService;->SelectedAudio:Ljava/lang/String;

    const-string v2, "1"

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_1b0

    .line 278
    const-wide/16 v1, 0x1450

    invoke-static {v1, v2}, Ljava/lang/Thread;->sleep(J)V
    :try_end_84
    .catch Ljava/lang/InterruptedException; {:try_start_75 .. :try_end_84} :catch_1c1

    .line 308
    :cond_84
    :goto_84
    iget-boolean v1, p0, Lcom/WhistlePhoneLocator/AndroidWhistlerService;->isPlaying:Z

    if-eqz v1, :cond_a3

    .line 310
    iget-object v1, p0, Lcom/WhistlePhoneLocator/AndroidWhistlerService;->mPlayer:Landroid/media/MediaPlayer;

    invoke-virtual {v1}, Landroid/media/MediaPlayer;->stop()V

    .line 311
    iget-object v1, p0, Lcom/WhistlePhoneLocator/AndroidWhistlerService;->mPlayer:Landroid/media/MediaPlayer;

    invoke-virtual {v1}, Landroid/media/MediaPlayer;->release()V

    .line 313
    iget-object v1, p0, Lcom/WhistlePhoneLocator/AndroidWhistlerService;->maxMediaVolumeFlag:Ljava/lang/Boolean;

    invoke-virtual {v1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v1

    if-eqz v1, :cond_a1

    .line 314
    iget-object v1, p0, Lcom/WhistlePhoneLocator/AndroidWhistlerService;->audio:Landroid/media/AudioManager;

    iget v2, p0, Lcom/WhistlePhoneLocator/AndroidWhistlerService;->MediaVolume:I

    invoke-virtual {v1, v6, v2, v9}, Landroid/media/AudioManager;->setStreamVolume(III)V

    .line 315
    :cond_a1
    iput-boolean v7, p0, Lcom/WhistlePhoneLocator/AndroidWhistlerService;->isPlaying:Z

    .line 330
    :cond_a3
    :goto_a3
    iget v1, p0, Lcom/WhistlePhoneLocator/AndroidWhistlerService;->PowerStatusAcquired:I

    if-ne v1, v8, :cond_b3

    .line 332
    iput v7, p0, Lcom/WhistlePhoneLocator/AndroidWhistlerService;->PowerStatusAcquired:I

    .line 333
    iget-object v1, p0, Lcom/WhistlePhoneLocator/AndroidWhistlerService;->wl:Landroid/os/PowerManager$WakeLock;

    invoke-virtual {v1}, Landroid/os/PowerManager$WakeLock;->release()V

    .line 334
    iget-object v1, p0, Lcom/WhistlePhoneLocator/AndroidWhistlerService;->wl1:Landroid/os/PowerManager$WakeLock;

    invoke-virtual {v1}, Landroid/os/PowerManager$WakeLock;->acquire()V

    .line 337
    :cond_b3
    iput-boolean v7, p0, Lcom/WhistlePhoneLocator/AndroidWhistlerService;->isPlaying:Z

    .line 338
    return-void

    .line 248
    :cond_b6
    iget-object v1, p0, Lcom/WhistlePhoneLocator/AndroidWhistlerService;->SelectedAudio:Ljava/lang/String;

    const-string v2, "2"

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_ca

    .line 249
    const v1, 0x7f040005

    invoke-static {p0, v1}, Landroid/media/MediaPlayer;->create(Landroid/content/Context;I)Landroid/media/MediaPlayer;

    move-result-object v1

    iput-object v1, p0, Lcom/WhistlePhoneLocator/AndroidWhistlerService;->mPlayer:Landroid/media/MediaPlayer;

    goto :goto_70

    .line 250
    :cond_ca
    iget-object v1, p0, Lcom/WhistlePhoneLocator/AndroidWhistlerService;->SelectedAudio:Ljava/lang/String;

    const-string v2, "3"

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_de

    .line 251
    const v1, 0x7f040006

    invoke-static {p0, v1}, Landroid/media/MediaPlayer;->create(Landroid/content/Context;I)Landroid/media/MediaPlayer;

    move-result-object v1

    iput-object v1, p0, Lcom/WhistlePhoneLocator/AndroidWhistlerService;->mPlayer:Landroid/media/MediaPlayer;

    goto :goto_70

    .line 252
    :cond_de
    iget-object v1, p0, Lcom/WhistlePhoneLocator/AndroidWhistlerService;->SelectedAudio:Ljava/lang/String;

    const-string v2, "4"

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_f3

    .line 253
    const v1, 0x7f040007

    invoke-static {p0, v1}, Landroid/media/MediaPlayer;->create(Landroid/content/Context;I)Landroid/media/MediaPlayer;

    move-result-object v1

    iput-object v1, p0, Lcom/WhistlePhoneLocator/AndroidWhistlerService;->mPlayer:Landroid/media/MediaPlayer;

    goto/16 :goto_70

    .line 254
    :cond_f3
    iget-object v1, p0, Lcom/WhistlePhoneLocator/AndroidWhistlerService;->SelectedAudio:Ljava/lang/String;

    const-string v2, "5"

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_108

    .line 255
    const v1, 0x7f040008

    invoke-static {p0, v1}, Landroid/media/MediaPlayer;->create(Landroid/content/Context;I)Landroid/media/MediaPlayer;

    move-result-object v1

    iput-object v1, p0, Lcom/WhistlePhoneLocator/AndroidWhistlerService;->mPlayer:Landroid/media/MediaPlayer;

    goto/16 :goto_70

    .line 256
    :cond_108
    iget-object v1, p0, Lcom/WhistlePhoneLocator/AndroidWhistlerService;->SelectedAudio:Ljava/lang/String;

    const-string v2, "6"

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_11d

    .line 257
    const v1, 0x7f040009

    invoke-static {p0, v1}, Landroid/media/MediaPlayer;->create(Landroid/content/Context;I)Landroid/media/MediaPlayer;

    move-result-object v1

    iput-object v1, p0, Lcom/WhistlePhoneLocator/AndroidWhistlerService;->mPlayer:Landroid/media/MediaPlayer;

    goto/16 :goto_70

    .line 258
    :cond_11d
    iget-object v1, p0, Lcom/WhistlePhoneLocator/AndroidWhistlerService;->SelectedAudio:Ljava/lang/String;

    const-string v2, "7"

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_132

    .line 259
    const v1, 0x7f04000a

    invoke-static {p0, v1}, Landroid/media/MediaPlayer;->create(Landroid/content/Context;I)Landroid/media/MediaPlayer;

    move-result-object v1

    iput-object v1, p0, Lcom/WhistlePhoneLocator/AndroidWhistlerService;->mPlayer:Landroid/media/MediaPlayer;

    goto/16 :goto_70

    .line 260
    :cond_132
    iget-object v1, p0, Lcom/WhistlePhoneLocator/AndroidWhistlerService;->SelectedAudio:Ljava/lang/String;

    const-string v2, "8"

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_147

    .line 261
    const v1, 0x7f04000b

    invoke-static {p0, v1}, Landroid/media/MediaPlayer;->create(Landroid/content/Context;I)Landroid/media/MediaPlayer;

    move-result-object v1

    iput-object v1, p0, Lcom/WhistlePhoneLocator/AndroidWhistlerService;->mPlayer:Landroid/media/MediaPlayer;

    goto/16 :goto_70

    .line 262
    :cond_147
    iget-object v1, p0, Lcom/WhistlePhoneLocator/AndroidWhistlerService;->SelectedAudio:Ljava/lang/String;

    const-string v2, "9"

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_15c

    .line 263
    const v1, 0x7f04000c

    invoke-static {p0, v1}, Landroid/media/MediaPlayer;->create(Landroid/content/Context;I)Landroid/media/MediaPlayer;

    move-result-object v1

    iput-object v1, p0, Lcom/WhistlePhoneLocator/AndroidWhistlerService;->mPlayer:Landroid/media/MediaPlayer;

    goto/16 :goto_70

    .line 264
    :cond_15c
    iget-object v1, p0, Lcom/WhistlePhoneLocator/AndroidWhistlerService;->SelectedAudio:Ljava/lang/String;

    const-string v2, "10"

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_171

    .line 265
    const v1, 0x7f040001

    invoke-static {p0, v1}, Landroid/media/MediaPlayer;->create(Landroid/content/Context;I)Landroid/media/MediaPlayer;

    move-result-object v1

    iput-object v1, p0, Lcom/WhistlePhoneLocator/AndroidWhistlerService;->mPlayer:Landroid/media/MediaPlayer;

    goto/16 :goto_70

    .line 266
    :cond_171
    iget-object v1, p0, Lcom/WhistlePhoneLocator/AndroidWhistlerService;->SelectedAudio:Ljava/lang/String;

    const-string v2, "11"

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_186

    .line 267
    const v1, 0x7f040002

    invoke-static {p0, v1}, Landroid/media/MediaPlayer;->create(Landroid/content/Context;I)Landroid/media/MediaPlayer;

    move-result-object v1

    iput-object v1, p0, Lcom/WhistlePhoneLocator/AndroidWhistlerService;->mPlayer:Landroid/media/MediaPlayer;

    goto/16 :goto_70

    .line 268
    :cond_186
    iget-object v1, p0, Lcom/WhistlePhoneLocator/AndroidWhistlerService;->SelectedAudio:Ljava/lang/String;

    const-string v2, "12"

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_19b

    .line 269
    const v1, 0x7f040003

    invoke-static {p0, v1}, Landroid/media/MediaPlayer;->create(Landroid/content/Context;I)Landroid/media/MediaPlayer;

    move-result-object v1

    iput-object v1, p0, Lcom/WhistlePhoneLocator/AndroidWhistlerService;->mPlayer:Landroid/media/MediaPlayer;

    goto/16 :goto_70

    .line 270
    :cond_19b
    iget-object v1, p0, Lcom/WhistlePhoneLocator/AndroidWhistlerService;->SelectedAudio:Ljava/lang/String;

    const-string v2, "13"

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_70

    .line 271
    const v1, 0x7f040004

    invoke-static {p0, v1}, Landroid/media/MediaPlayer;->create(Landroid/content/Context;I)Landroid/media/MediaPlayer;

    move-result-object v1

    iput-object v1, p0, Lcom/WhistlePhoneLocator/AndroidWhistlerService;->mPlayer:Landroid/media/MediaPlayer;

    goto/16 :goto_70

    .line 279
    :cond_1b0
    :try_start_1b0
    iget-object v1, p0, Lcom/WhistlePhoneLocator/AndroidWhistlerService;->SelectedAudio:Ljava/lang/String;

    const-string v2, "2"

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_1c7

    .line 280
    const-wide/16 v1, 0x14b4

    invoke-static {v1, v2}, Ljava/lang/Thread;->sleep(J)V
    :try_end_1bf
    .catch Ljava/lang/InterruptedException; {:try_start_1b0 .. :try_end_1bf} :catch_1c1

    goto/16 :goto_84

    .line 303
    :catch_1c1
    move-exception v0

    .line 305
    .local v0, "e":Ljava/lang/InterruptedException;
    invoke-virtual {v0}, Ljava/lang/InterruptedException;->printStackTrace()V

    goto/16 :goto_84

    .line 281
    .end local v0    # "e":Ljava/lang/InterruptedException;
    :cond_1c7
    :try_start_1c7
    iget-object v1, p0, Lcom/WhistlePhoneLocator/AndroidWhistlerService;->SelectedAudio:Ljava/lang/String;

    const-string v2, "3"

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_1d8

    .line 282
    const-wide/16 v1, 0x3d86

    invoke-static {v1, v2}, Ljava/lang/Thread;->sleep(J)V

    goto/16 :goto_84

    .line 283
    :cond_1d8
    iget-object v1, p0, Lcom/WhistlePhoneLocator/AndroidWhistlerService;->SelectedAudio:Ljava/lang/String;

    const-string v2, "4"

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_1e9

    .line 284
    const-wide/16 v1, 0x41d2

    invoke-static {v1, v2}, Ljava/lang/Thread;->sleep(J)V

    goto/16 :goto_84

    .line 285
    :cond_1e9
    iget-object v1, p0, Lcom/WhistlePhoneLocator/AndroidWhistlerService;->SelectedAudio:Ljava/lang/String;

    const-string v2, "5"

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_1fa

    .line 286
    const-wide/16 v1, 0x6cf2

    invoke-static {v1, v2}, Ljava/lang/Thread;->sleep(J)V

    goto/16 :goto_84

    .line 287
    :cond_1fa
    iget-object v1, p0, Lcom/WhistlePhoneLocator/AndroidWhistlerService;->SelectedAudio:Ljava/lang/String;

    const-string v2, "6"

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_20b

    .line 288
    const-wide/16 v1, 0x35c0

    invoke-static {v1, v2}, Ljava/lang/Thread;->sleep(J)V

    goto/16 :goto_84

    .line 289
    :cond_20b
    iget-object v1, p0, Lcom/WhistlePhoneLocator/AndroidWhistlerService;->SelectedAudio:Ljava/lang/String;

    const-string v2, "7"

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_21c

    .line 290
    const-wide/16 v1, 0x6810

    invoke-static {v1, v2}, Ljava/lang/Thread;->sleep(J)V

    goto/16 :goto_84

    .line 291
    :cond_21c
    iget-object v1, p0, Lcom/WhistlePhoneLocator/AndroidWhistlerService;->SelectedAudio:Ljava/lang/String;

    const-string v2, "8"

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_22d

    .line 292
    const-wide/16 v1, 0x3264

    invoke-static {v1, v2}, Ljava/lang/Thread;->sleep(J)V

    goto/16 :goto_84

    .line 293
    :cond_22d
    iget-object v1, p0, Lcom/WhistlePhoneLocator/AndroidWhistlerService;->SelectedAudio:Ljava/lang/String;

    const-string v2, "9"

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_23e

    .line 294
    const-wide/16 v1, 0x4196

    invoke-static {v1, v2}, Ljava/lang/Thread;->sleep(J)V

    goto/16 :goto_84

    .line 295
    :cond_23e
    iget-object v1, p0, Lcom/WhistlePhoneLocator/AndroidWhistlerService;->SelectedAudio:Ljava/lang/String;

    const-string v2, "10"

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_24f

    .line 296
    const-wide/16 v1, 0x588e

    invoke-static {v1, v2}, Ljava/lang/Thread;->sleep(J)V

    goto/16 :goto_84

    .line 297
    :cond_24f
    iget-object v1, p0, Lcom/WhistlePhoneLocator/AndroidWhistlerService;->SelectedAudio:Ljava/lang/String;

    const-string v2, "11"

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_260

    .line 298
    const-wide/16 v1, 0x50b4

    invoke-static {v1, v2}, Ljava/lang/Thread;->sleep(J)V

    goto/16 :goto_84

    .line 299
    :cond_260
    iget-object v1, p0, Lcom/WhistlePhoneLocator/AndroidWhistlerService;->SelectedAudio:Ljava/lang/String;

    const-string v2, "12"

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_271

    .line 300
    const-wide/16 v1, 0x765c

    invoke-static {v1, v2}, Ljava/lang/Thread;->sleep(J)V

    goto/16 :goto_84

    .line 301
    :cond_271
    iget-object v1, p0, Lcom/WhistlePhoneLocator/AndroidWhistlerService;->SelectedAudio:Ljava/lang/String;

    const-string v2, "13"

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_84

    .line 302
    const-wide/16 v1, 0x38a4

    invoke-static {v1, v2}, Ljava/lang/Thread;->sleep(J)V
    :try_end_280
    .catch Ljava/lang/InterruptedException; {:try_start_1c7 .. :try_end_280} :catch_1c1

    goto/16 :goto_84

    .line 321
    :cond_282
    const-wide/16 v1, 0x1770

    :try_start_284
    invoke-static {v1, v2}, Ljava/lang/Thread;->sleep(J)V
    :try_end_287
    .catch Ljava/lang/InterruptedException; {:try_start_284 .. :try_end_287} :catch_289

    goto/16 :goto_a3

    .line 322
    :catch_289
    move-exception v0

    .line 324
    .restart local v0    # "e":Ljava/lang/InterruptedException;
    invoke-virtual {v0}, Ljava/lang/InterruptedException;->printStackTrace()V

    goto/16 :goto_a3
.end method

.method ReadDetectorState()V
    .registers 4

    .prologue
    .line 361
    invoke-static {p0}, Landroid/preference/PreferenceManager;->getDefaultSharedPreferences(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v0

    .line 362
    .local v0, "prefs":Landroid/content/SharedPreferences;
    const-string v1, "detectionEnable"

    const/4 v2, 0x0

    invoke-interface {v0, v1, v2}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v1

    invoke-static {v1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v1

    iput-object v1, p0, Lcom/WhistlePhoneLocator/AndroidWhistlerService;->DetectorEnabledFromPrefs:Ljava/lang/Boolean;

    .line 363
    return-void
.end method

.method ReadPreferences()V
    .registers 5

    .prologue
    const/4 v2, 0x1

    const/4 v3, 0x0

    .line 346
    invoke-static {p0}, Landroid/preference/PreferenceManager;->getDefaultSharedPreferences(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v0

    .line 347
    .local v0, "prefs":Landroid/content/SharedPreferences;
    const-string v1, "audioNotification"

    invoke-interface {v0, v1, v2}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v1

    invoke-static {v1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v1

    iput-object v1, p0, Lcom/WhistlePhoneLocator/AndroidWhistlerService;->AudioNotification:Ljava/lang/Boolean;

    .line 348
    const-string v1, "visualNotification"

    invoke-interface {v0, v1, v2}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v1

    invoke-static {v1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v1

    iput-object v1, p0, Lcom/WhistlePhoneLocator/AndroidWhistlerService;->VisualNotification:Ljava/lang/Boolean;

    .line 349
    const-string v1, "maxVolume"

    invoke-interface {v0, v1, v3}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v1

    invoke-static {v1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v1

    iput-object v1, p0, Lcom/WhistlePhoneLocator/AndroidWhistlerService;->maxMediaVolumeFlag:Ljava/lang/Boolean;

    .line 350
    const-string v1, "selectAudio"

    const-string v2, "6"

    invoke-interface {v0, v1, v2}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lcom/WhistlePhoneLocator/AndroidWhistlerService;->SelectedAudio:Ljava/lang/String;

    .line 351
    const-string v1, "toastNotification"

    invoke-interface {v0, v1, v3}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v1

    invoke-static {v1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v1

    iput-object v1, p0, Lcom/WhistlePhoneLocator/AndroidWhistlerService;->ToastEnabledFromPrefs:Ljava/lang/Boolean;

    .line 353
    iget-object v1, p0, Lcom/WhistlePhoneLocator/AndroidWhistlerService;->AudioNotification:Ljava/lang/Boolean;

    invoke-virtual {v1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v1

    if-nez v1, :cond_4e

    .line 354
    invoke-static {v3}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v1

    iput-object v1, p0, Lcom/WhistlePhoneLocator/AndroidWhistlerService;->maxMediaVolumeFlag:Ljava/lang/Boolean;

    .line 355
    :cond_4e
    return-void
.end method

.method ReadSensitivity()V
    .registers 4

    .prologue
    .line 369
    invoke-static {p0}, Landroid/preference/PreferenceManager;->getDefaultSharedPreferences(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v0

    .line 370
    .local v0, "prefs":Landroid/content/SharedPreferences;
    const-string v1, "selectSensitivity"

    const-string v2, "3"

    invoke-interface {v0, v1, v2}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lcom/WhistlePhoneLocator/AndroidWhistlerService;->SelectedSensitivity:Ljava/lang/String;

    .line 372
    iget-object v1, p0, Lcom/WhistlePhoneLocator/AndroidWhistlerService;->SelectedSensitivity:Ljava/lang/String;

    const-string v2, "1"

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_1c

    .line 373
    const/4 v1, 0x1

    iput-short v1, p0, Lcom/WhistlePhoneLocator/AndroidWhistlerService;->sensitivity:S

    .line 382
    :cond_1b
    :goto_1b
    return-void

    .line 374
    :cond_1c
    iget-object v1, p0, Lcom/WhistlePhoneLocator/AndroidWhistlerService;->SelectedSensitivity:Ljava/lang/String;

    const-string v2, "2"

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2a

    .line 375
    const/4 v1, 0x2

    iput-short v1, p0, Lcom/WhistlePhoneLocator/AndroidWhistlerService;->sensitivity:S

    goto :goto_1b

    .line 376
    :cond_2a
    iget-object v1, p0, Lcom/WhistlePhoneLocator/AndroidWhistlerService;->SelectedSensitivity:Ljava/lang/String;

    const-string v2, "3"

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_38

    .line 377
    const/4 v1, 0x3

    iput-short v1, p0, Lcom/WhistlePhoneLocator/AndroidWhistlerService;->sensitivity:S

    goto :goto_1b

    .line 378
    :cond_38
    iget-object v1, p0, Lcom/WhistlePhoneLocator/AndroidWhistlerService;->SelectedSensitivity:Ljava/lang/String;

    const-string v2, "4"

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_46

    .line 379
    const/4 v1, 0x4

    iput-short v1, p0, Lcom/WhistlePhoneLocator/AndroidWhistlerService;->sensitivity:S

    goto :goto_1b

    .line 380
    :cond_46
    iget-object v1, p0, Lcom/WhistlePhoneLocator/AndroidWhistlerService;->SelectedSensitivity:Ljava/lang/String;

    const-string v2, "5"

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_1b

    .line 381
    const/4 v1, 0x5

    iput-short v1, p0, Lcom/WhistlePhoneLocator/AndroidWhistlerService;->sensitivity:S

    goto :goto_1b
.end method

.method public onBind(Landroid/content/Intent;)Landroid/os/IBinder;
    .registers 3
    .param p1, "arg0"    # Landroid/content/Intent;

    .prologue
    .line 68
    const/4 v0, 0x0

    return-object v0
.end method

.method public onCreate()V
    .registers 4

    .prologue
    .line 58
    const-string v0, "power"

    invoke-virtual {p0, v0}, Lcom/WhistlePhoneLocator/AndroidWhistlerService;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/os/PowerManager;

    iput-object v0, p0, Lcom/WhistlePhoneLocator/AndroidWhistlerService;->pm:Landroid/os/PowerManager;

    .line 59
    iget-object v0, p0, Lcom/WhistlePhoneLocator/AndroidWhistlerService;->pm:Landroid/os/PowerManager;

    const/4 v1, 0x1

    const-string v2, "AndroidWhistlerService"

    invoke-virtual {v0, v1, v2}, Landroid/os/PowerManager;->newWakeLock(ILjava/lang/String;)Landroid/os/PowerManager$WakeLock;

    move-result-object v0

    iput-object v0, p0, Lcom/WhistlePhoneLocator/AndroidWhistlerService;->wl1:Landroid/os/PowerManager$WakeLock;

    .line 60
    iget-object v0, p0, Lcom/WhistlePhoneLocator/AndroidWhistlerService;->wl1:Landroid/os/PowerManager$WakeLock;

    invoke-virtual {v0}, Landroid/os/PowerManager$WakeLock;->acquire()V

    .line 62
    new-instance v0, Landroid/media/MediaPlayer;

    invoke-direct {v0}, Landroid/media/MediaPlayer;-><init>()V

    iput-object v0, p0, Lcom/WhistlePhoneLocator/AndroidWhistlerService;->mPlayer:Landroid/media/MediaPlayer;

    .line 63
    return-void
.end method

.method public onDestroy()V
    .registers 4

    .prologue
    const/4 v2, 0x0

    .line 76
    iput-boolean v2, p0, Lcom/WhistlePhoneLocator/AndroidWhistlerService;->isRecording:Z

    .line 77
    const/4 v0, 0x2

    iput v0, p0, Lcom/WhistlePhoneLocator/AndroidWhistlerService;->ToastSelector:I

    .line 78
    iget-object v0, p0, Lcom/WhistlePhoneLocator/AndroidWhistlerService;->handler:Landroid/os/Handler;

    invoke-virtual {v0, v2}, Landroid/os/Handler;->sendEmptyMessage(I)Z

    .line 79
    iget-object v0, p0, Lcom/WhistlePhoneLocator/AndroidWhistlerService;->mPlayer:Landroid/media/MediaPlayer;

    invoke-virtual {v0}, Landroid/media/MediaPlayer;->release()V

    .line 80
    iget-boolean v0, p0, Lcom/WhistlePhoneLocator/AndroidWhistlerService;->isPlaying:Z

    if-eqz v0, :cond_16

    .line 82
    iput-boolean v2, p0, Lcom/WhistlePhoneLocator/AndroidWhistlerService;->isPlaying:Z

    .line 87
    :cond_16
    iget v0, p0, Lcom/WhistlePhoneLocator/AndroidWhistlerService;->PowerStatusAcquired:I

    const/4 v1, 0x1

    if-ne v0, v1, :cond_23

    .line 89
    iput v2, p0, Lcom/WhistlePhoneLocator/AndroidWhistlerService;->PowerStatusAcquired:I

    .line 90
    iget-object v0, p0, Lcom/WhistlePhoneLocator/AndroidWhistlerService;->wl:Landroid/os/PowerManager$WakeLock;

    invoke-virtual {v0}, Landroid/os/PowerManager$WakeLock;->release()V

    .line 97
    :goto_22
    return-void

    .line 94
    :cond_23
    iget-object v0, p0, Lcom/WhistlePhoneLocator/AndroidWhistlerService;->wl1:Landroid/os/PowerManager$WakeLock;

    invoke-virtual {v0}, Landroid/os/PowerManager$WakeLock;->release()V

    goto :goto_22
.end method

.method public onStartCommand(Landroid/content/Intent;II)I
    .registers 7
    .param p1, "intent"    # Landroid/content/Intent;
    .param p2, "flags"    # I
    .param p3, "startId"    # I

    .prologue
    const/4 v2, 0x1

    .line 107
    if-eqz p1, :cond_2f

    .line 109
    :try_start_3
    invoke-virtual {p0}, Lcom/WhistlePhoneLocator/AndroidWhistlerService;->ReadDetectorState()V

    .line 110
    const-string v0, "com.WhistlePhoneLocator.Service"

    const/4 v1, 0x1

    invoke-virtual {p1, v0, v1}, Landroid/content/Intent;->getBooleanExtra(Ljava/lang/String;Z)Z

    move-result v0

    if-eqz v0, :cond_30

    iget-object v0, p0, Lcom/WhistlePhoneLocator/AndroidWhistlerService;->DetectorEnabledFromPrefs:Ljava/lang/Boolean;

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    if-eqz v0, :cond_30

    iget-boolean v0, p0, Lcom/WhistlePhoneLocator/AndroidWhistlerService;->isRecording:Z

    if-nez v0, :cond_30

    .line 112
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/WhistlePhoneLocator/AndroidWhistlerService;->isRecording:Z

    .line 113
    const/4 v0, 0x1

    iput v0, p0, Lcom/WhistlePhoneLocator/AndroidWhistlerService;->ToastSelector:I

    .line 114
    iget-object v0, p0, Lcom/WhistlePhoneLocator/AndroidWhistlerService;->handler:Landroid/os/Handler;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/os/Handler;->sendEmptyMessage(I)Z

    .line 115
    new-instance v0, Lcom/WhistlePhoneLocator/AndroidWhistlerService$2;

    invoke-direct {v0, p0}, Lcom/WhistlePhoneLocator/AndroidWhistlerService$2;-><init>(Lcom/WhistlePhoneLocator/AndroidWhistlerService;)V

    .line 122
    invoke-virtual {v0}, Lcom/WhistlePhoneLocator/AndroidWhistlerService$2;->start()V

    .line 135
    :cond_2f
    :goto_2f
    return v2

    .line 126
    :cond_30
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/WhistlePhoneLocator/AndroidWhistlerService;->isRecording:Z

    .line 127
    invoke-virtual {p0}, Lcom/WhistlePhoneLocator/AndroidWhistlerService;->stopSelf()V
    :try_end_36
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_36} :catch_37

    goto :goto_2f

    .line 131
    :catch_37
    move-exception v0

    goto :goto_2f
.end method

###### Class com.WhistlePhoneLocator.AndroidWhistlerService.AnonymousClass1 (com.WhistlePhoneLocator.AndroidWhistlerService$1)
.class Lcom/WhistlePhoneLocator/AndroidWhistlerService$1;
.super Landroid/os/Handler;
.source "AndroidWhistlerService.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/WhistlePhoneLocator/AndroidWhistlerService;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/WhistlePhoneLocator/AndroidWhistlerService;


# direct methods
.method constructor <init>(Lcom/WhistlePhoneLocator/AndroidWhistlerService;)V
    .registers 2

    .prologue
    .line 1
    iput-object p1, p0, Lcom/WhistlePhoneLocator/AndroidWhistlerService$1;->this$0:Lcom/WhistlePhoneLocator/AndroidWhistlerService;

    .line 384
    invoke-direct {p0}, Landroid/os/Handler;-><init>()V

    return-void
.end method


# virtual methods
.method public handleMessage(Landroid/os/Message;)V
    .registers 5
    .param p1, "msg"    # Landroid/os/Message;

    .prologue
    .line 387
    iget-object v1, p0, Lcom/WhistlePhoneLocator/AndroidWhistlerService$1;->this$0:Lcom/WhistlePhoneLocator/AndroidWhistlerService;

    invoke-virtual {v1}, Lcom/WhistlePhoneLocator/AndroidWhistlerService;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    .line 399
    .local v0, "context":Landroid/content/Context;
    iget-object v1, p0, Lcom/WhistlePhoneLocator/AndroidWhistlerService$1;->this$0:Lcom/WhistlePhoneLocator/AndroidWhistlerService;

    invoke-static {v1}, Lcom/WhistlePhoneLocator/AndroidWhistlerService;->access$0(Lcom/WhistlePhoneLocator/AndroidWhistlerService;)I

    move-result v1

    const/4 v2, 0x3

    if-ne v1, v2, :cond_25

    iget-object v1, p0, Lcom/WhistlePhoneLocator/AndroidWhistlerService$1;->this$0:Lcom/WhistlePhoneLocator/AndroidWhistlerService;

    invoke-static {v1}, Lcom/WhistlePhoneLocator/AndroidWhistlerService;->access$1(Lcom/WhistlePhoneLocator/AndroidWhistlerService;)Ljava/lang/Boolean;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v1

    if-eqz v1, :cond_25

    .line 400
    const-string v1, "Whistle Locator PRO message:\n      WHISTLE DETECTED!!"

    const/4 v2, 0x1

    invoke-static {v0, v1, v2}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v1

    invoke-virtual {v1}, Landroid/widget/Toast;->show()V

    .line 402
    :cond_25
    return-void
.end method

###### Class com.WhistlePhoneLocator.AndroidWhistlerService.AnonymousClass2 (com.WhistlePhoneLocator.AndroidWhistlerService$2)
.class Lcom/WhistlePhoneLocator/AndroidWhistlerService$2;
.super Ljava/lang/Thread;
.source "AndroidWhistlerService.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/WhistlePhoneLocator/AndroidWhistlerService;->onStartCommand(Landroid/content/Intent;II)I
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/WhistlePhoneLocator/AndroidWhistlerService;


# direct methods
.method constructor <init>(Lcom/WhistlePhoneLocator/AndroidWhistlerService;)V
    .registers 2

    .prologue
    .line 1
    iput-object p1, p0, Lcom/WhistlePhoneLocator/AndroidWhistlerService$2;->this$0:Lcom/WhistlePhoneLocator/AndroidWhistlerService;

    .line 115
    invoke-direct {p0}, Ljava/lang/Thread;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .registers 2

    .prologue
    .line 120
    iget-object v0, p0, Lcom/WhistlePhoneLocator/AndroidWhistlerService$2;->this$0:Lcom/WhistlePhoneLocator/AndroidWhistlerService;

    invoke-virtual {v0}, Lcom/WhistlePhoneLocator/AndroidWhistlerService;->AudioProcessor()V

    .line 121
    return-void
.end method

###### Class com.WhistlePhoneLocator.AndroidWhistlerService.AnonymousClass3 (com.WhistlePhoneLocator.AndroidWhistlerService$3)
.class Lcom/WhistlePhoneLocator/AndroidWhistlerService$3;
.super Ljava/lang/Thread;
.source "AndroidWhistlerService.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/WhistlePhoneLocator/AndroidWhistlerService;->AudioProcessor()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/WhistlePhoneLocator/AndroidWhistlerService;


# direct methods
.method constructor <init>(Lcom/WhistlePhoneLocator/AndroidWhistlerService;)V
    .registers 2

    .prologue
    .line 1
    iput-object p1, p0, Lcom/WhistlePhoneLocator/AndroidWhistlerService$3;->this$0:Lcom/WhistlePhoneLocator/AndroidWhistlerService;

    .line 184
    invoke-direct {p0}, Ljava/lang/Thread;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .registers 2

    .prologue
    .line 189
    iget-object v0, p0, Lcom/WhistlePhoneLocator/AndroidWhistlerService$3;->this$0:Lcom/WhistlePhoneLocator/AndroidWhistlerService;

    invoke-virtual {v0}, Lcom/WhistlePhoneLocator/AndroidWhistlerService;->NotificationFunctionality()V

    .line 190
    return-void
.end method
