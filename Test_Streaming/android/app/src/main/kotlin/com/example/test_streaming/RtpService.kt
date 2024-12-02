package com.example.test_streaming

import android.app.Notification
import android.app.NotificationChannel
import android.app.NotificationManager
import android.app.Service
import android.content.Context
import android.content.Intent
import android.os.Build
import android.os.IBinder
import android.util.Log
import android.util.Range
import androidx.annotation.RequiresApi
import androidx.core.app.NotificationCompat
import androidx.lifecycle.MutableLiveData
import com.pedro.common.ConnectChecker
import com.pedro.encoder.input.gl.render.filters.BaseFilterRender
import com.pedro.library.base.Camera2Base
import com.pedro.library.rtmp.RtmpCamera2
import com.pedro.library.rtsp.RtspCamera2
import com.pedro.library.view.OpenGlView

class RtpService : Service() {

  companion object {
    private const val TAG = "RtpService"
    private const val channelId = "rtpStreamChannel"
    private const val notifyId = 123456
    private var notificationManager: NotificationManager? = null
    val observer = MutableLiveData<RtpService?>()
  }

  private var camera2Base: Camera2Base? = null

  override fun onBind(p0: Intent?): IBinder? {
    return null
  }

  override fun onStartCommand(intent: Intent?, flags: Int, startId: Int): Int {
    Log.i(TAG, "RTP service started")
    return START_STICKY
  }

  @RequiresApi(Build.VERSION_CODES.LOLLIPOP)
  override fun onCreate() {
    super.onCreate()
    Log.i(TAG, "$TAG create")

    notificationManager = getSystemService(Context.NOTIFICATION_SERVICE) as NotificationManager

    if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.O) {
      val channel = NotificationChannel(channelId, channelId, NotificationManager.IMPORTANCE_HIGH)
      notificationManager?.createNotificationChannel(channel)
    }

    keepAliveTrick()

    camera2Base = RtmpCamera2(this, connectChecker)
    observer.postValue(this)
  }

  @RequiresApi(Build.VERSION_CODES.LOLLIPOP)
  override fun onDestroy() {
    super.onDestroy()
    Log.i(TAG, "RTP service destroy")
    stopRecord()
    stopStream()
    stopPreview()
    observer.postValue(null)
  }

  private fun keepAliveTrick() {
    if (Build.VERSION.SDK_INT > Build.VERSION_CODES.O) {
      val notification = NotificationCompat.Builder(this, channelId)
        .setOngoing(true)
        .setContentTitle("")
        .setContentText("").build()
      startForeground(1, notification)
    } else {
      startForeground(1, Notification())
    }
  }

  private fun showNotification(text: String) {
    val notification = NotificationCompat.Builder(applicationContext, channelId)
      .setSmallIcon(R.mipmap.ic_launcher)
      .setContentTitle("RTP Stream")
      .setContentText(text).build()
    notificationManager?.notify(notifyId, notification)
  }

  @RequiresApi(Build.VERSION_CODES.LOLLIPOP)
  fun prepare(endpoint: String): Boolean {
    if (endpoint.startsWith("rtmp")) {
      camera2Base = RtmpCamera2(this, connectChecker)
    }
    else if (endpoint.startsWith("rtsp")){
      camera2Base = RtspCamera2(this, connectChecker)
    }

    return camera2Base?.prepareVideo() ?: false && camera2Base?.prepareAudio() ?: false
  }

  @RequiresApi(Build.VERSION_CODES.LOLLIPOP)
  fun startPreview() {
    camera2Base?.startPreview()
  }

  @RequiresApi(Build.VERSION_CODES.LOLLIPOP)
  fun stopPreview() {
    camera2Base?.stopPreview()
  }

  @RequiresApi(Build.VERSION_CODES.LOLLIPOP)
  fun switchCamera() {
    camera2Base?.switchCamera()
  }

  @RequiresApi(Build.VERSION_CODES.LOLLIPOP)
  fun onFlashLight(){
    camera2Base?.enableLantern()
  }

  @RequiresApi(Build.VERSION_CODES.LOLLIPOP)
  fun offFlashLight(){
    camera2Base?.disableLantern()
  }

  @RequiresApi(Build.VERSION_CODES.LOLLIPOP)
  fun enableAudio(){
    camera2Base?.enableAudio()
  }

  @RequiresApi(Build.VERSION_CODES.LOLLIPOP)
  fun disableAudio(){
    camera2Base?.disableAudio()
  }

  @RequiresApi(Build.VERSION_CODES.LOLLIPOP)
  fun isFrontCamera(): Boolean = camera2Base?.isFrontCamera ?: false

  @RequiresApi(Build.VERSION_CODES.LOLLIPOP)
  fun isStreaming(): Boolean = camera2Base?.isStreaming ?: false

  @RequiresApi(Build.VERSION_CODES.LOLLIPOP)
  fun isRecording(): Boolean = camera2Base?.isRecording ?: false

  @RequiresApi(Build.VERSION_CODES.LOLLIPOP)
  fun isOnPreview(): Boolean = camera2Base?.isOnPreview ?: false

  @RequiresApi(Build.VERSION_CODES.LOLLIPOP)
  fun setBitrate(bitrate: Int){
    camera2Base?.setVideoBitrateOnFly(bitrate)
  }

  @RequiresApi(Build.VERSION_CODES.LOLLIPOP)
  fun getBitrate(): Int?{
    return camera2Base?.bitrate
  }

  @RequiresApi(Build.VERSION_CODES.LOLLIPOP)
  fun getSupportedFps(): MutableList<Range<Int>>?{
    return camera2Base?.supportedFps
  }

  @RequiresApi(Build.VERSION_CODES.LOLLIPOP)
  fun setFilter(filter: BaseFilterRender){
    camera2Base?.glInterface?.setFilter(filter)
  }

  @RequiresApi(Build.VERSION_CODES.LOLLIPOP)
  fun removeFilter(filter: BaseFilterRender){
    camera2Base?.glInterface?.removeFilter(filter)
  }

  @RequiresApi(Build.VERSION_CODES.LOLLIPOP)
  fun muteVideo() {
    camera2Base?.glInterface?.muteVideo()
  }

  @RequiresApi(Build.VERSION_CODES.LOLLIPOP)
  fun unMuteVideo() {
    camera2Base?.glInterface?.unMuteVideo()
  }

  @RequiresApi(Build.VERSION_CODES.LOLLIPOP)
  fun startStream(endpoint: String) {
    camera2Base?.startStream(endpoint)
  }

  @RequiresApi(Build.VERSION_CODES.LOLLIPOP)
  fun stopStream() {
    camera2Base?.stopStream()
  }

  @RequiresApi(Build.VERSION_CODES.LOLLIPOP)
  fun startRecord(path: String) {
    camera2Base?.startRecord(path) {
      Log.i(TAG, "record state: ${it.name}")
    }
  }

  @RequiresApi(Build.VERSION_CODES.LOLLIPOP)
  fun stopRecord() {
    camera2Base?.stopRecord()
  }

  @RequiresApi(Build.VERSION_CODES.LOLLIPOP)
  fun setView(openGlView: OpenGlView) {
    camera2Base?.replaceView(openGlView)
  }

  @RequiresApi(Build.VERSION_CODES.LOLLIPOP)
  fun setView(context: Context) {
    camera2Base?.replaceView(context)
  }

  @RequiresApi(Build.VERSION_CODES.LOLLIPOP)
  fun setTries(tries: Int){
    camera2Base?.streamClient!!.setReTries(tries)
  }

  private val connectChecker = object : ConnectChecker {
    override fun onConnectionStarted(url: String) {
      showNotification("Stream connection started")
    }

    override fun onConnectionSuccess() {
      showNotification("Stream started")
    }

    override fun onNewBitrate(bitrate: Long) {

    }

    @RequiresApi(Build.VERSION_CODES.LOLLIPOP)
    override fun onConnectionFailed(reason: String) {
      if (camera2Base?.streamClient!!.reTry(5000, reason, null)) {
        showNotification("Connection lost, will try to reconnect")

      } else {
        camera2Base?.stopStream()
      }
    }

    override fun onDisconnect() {
      showNotification("Stream stopped")
    }

    override fun onAuthError() {
      showNotification("Stream auth error")
    }

    override fun onAuthSuccess() {
      showNotification("Stream auth success")
    }
  }
}
