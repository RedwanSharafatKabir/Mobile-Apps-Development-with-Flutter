package com.example.test_streaming

import android.os.Build
import io.flutter.embedding.android.FlutterActivity
import android.os.Bundle
import androidx.annotation.RequiresApi
import com.pedro.library.view.OpenGlView
import io.flutter.plugin.common.MethodChannel

class MainActivity : FlutterActivity() {

    private val CHANNEL = "com.example.live_stream_flutter/stream"
    private lateinit var openGlView: OpenGlView
    private var service: RtpService? = null

    @RequiresApi(Build.VERSION_CODES.LOLLIPOP)
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)

        openGlView = findViewById(R.id.openGlView)

        RtpService.observer.observe(this) {
            service = it
            startPreview()
        }

        MethodChannel(flutterEngine!!.dartExecutor.binaryMessenger, CHANNEL).setMethodCallHandler { call, result ->
            when (call.method) {
                "startStream" -> {
                    val url = call.argument<String>("url")
                    if (url != null) {
                        startStream(url)
                        result.success("Stream started")
                    } else {
                        result.error("INVALID_URL", "URL is required", null)
                    }
                }
                "stopStream" -> {
                    stopStream()
                    result.success("Stream stopped")
                }
                else -> result.notImplemented()
            }
        }
    }

    @RequiresApi(Build.VERSION_CODES.LOLLIPOP)
    private fun startPreview() {
        if (openGlView.holder.surface.isValid) {
            service?.setView(openGlView)
        }

        if (service?.isOnPreview() != true && openGlView.holder.surface.isValid) {
            service?.startPreview()
        }
    }

    @RequiresApi(Build.VERSION_CODES.LOLLIPOP)
    private fun startStream(url: String) {
        service?.setView(openGlView)
        service?.startStream(url)
    }

    @RequiresApi(Build.VERSION_CODES.LOLLIPOP)
    private fun stopStream() {
        if (service?.isStreaming() == true) {
            service?.stopStream()
        }
    }
}
