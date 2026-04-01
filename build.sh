#!/bin/bash

# SEE AI Assistant Build Script

echo "🚀 Building SEE AI Assistant..."

# Check if Android SDK is set
if [ -z "$ANDROID_SDK_ROOT" ] && [ -z "$ANDROID_HOME" ]; then
    echo "❌ Error: ANDROID_SDK_ROOT or ANDROID_HOME not set"
    echo "Please set your Android SDK path"
    exit 1
fi

# Clean build
echo "🧹 Cleaning previous build..."
./gradlew clean

# Build debug APK
echo "🔨 Building debug APK..."
./gradlew assembleDebug

# Check if build succeeded
if [ $? -eq 0 ]; then
    echo "✅ Build successful!"
    echo "📱 APK location: app/build/outputs/apk/debug/app-debug.apk"
    
    # Optional: Install on connected device
    if [ "$1" == "--install" ]; then
        echo "📲 Installing on device..."
        adb install -r app/build/outputs/apk/debug/app-debug.apk
    fi
else
    echo "❌ Build failed!"
    exit 1
fi
