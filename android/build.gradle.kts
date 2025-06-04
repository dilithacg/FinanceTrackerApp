// Project-level build.gradle.kts

pluginManagement {
    repositories {
        gradlePluginPortal()
        google()
        mavenCentral()
    }
}

plugins {
    // Apply Google Services plugin, versioned and disabled here
    id("com.google.gms.google-services") version "4.4.2" apply false
}

dependencyResolutionManagement {
    repositories {
        google()
        mavenCentral()
    }
}
