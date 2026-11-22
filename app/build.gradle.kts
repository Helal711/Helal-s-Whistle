plugins {
    id("com.android.application")
}

android {
    namespace = "com.helal711.whistle"
    compileSdk = 36

    defaultConfig {
        applicationId = "com.helal711.whistle"
        minSdk = 24
        targetSdk = 36
        versionCode = 18
        versionName = "4.0"
    }

    signingConfigs {
        create("debugConfig") {
            storeFile = file("${rootDir}/debug.keystore")
            storePassword = "android"
            keyAlias = "androiddebugkey"
            keyPassword = "android"
        }
    }

    buildTypes {
        debug {
            signingConfig = signingConfigs.getByName("debugConfig")
        }
        release {
            isMinifyEnabled = false
        }
    }

    compileOptions {
        sourceCompatibility = JavaVersion.VERSION_17
        targetCompatibility = JavaVersion.VERSION_17
    }
}

dependencies {
    implementation("androidx.appcompat:appcompat:1.7.0")
    implementation("com.google.android.material:material:1.12.0")
    implementation("androidx.core:core:1.15.0")
    testImplementation("junit:junit:4.13.2")
}
