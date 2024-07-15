package com.zegocloud.livestreaming.cohosting

import com.zegocloud.livestreaming.cohosting.ZegoBeautyPlugin
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine

class MainActivity: FlutterActivity() {
    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)
        ZegoBeautyPlugin(flutterEngine.dartExecutor.binaryMessenger, context)
    }
}
