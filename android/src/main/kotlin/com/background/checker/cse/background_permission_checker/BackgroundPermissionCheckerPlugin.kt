package com.background.checker.cse.background_permission_checker

import io.flutter.embedding.engine.plugins.FlutterPlugin
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.common.MethodChannel.MethodCallHandler
import io.flutter.plugin.common.MethodChannel.Result


import android.app.AppOpsManager
import android.content.Context
import android.content.Intent
import android.os.Build

/** BackgroundPermissionCheckerPlugin */
class BackgroundPermissionCheckerPlugin: FlutterPlugin, MethodCallHandler {
  /// The MethodChannel that will the communication between Flutter and native Android
  ///
  /// This local reference serves to register the plugin with the Flutter Engine and unregister it
  /// when the Flutter Engine is detached from the Activity
  private lateinit var channel : MethodChannel

  override fun onAttachedToEngine(flutterPluginBinding: FlutterPlugin.FlutterPluginBinding) {
    channel = MethodChannel(flutterPluginBinding.binaryMessenger, "background_permission_checker")
    channel.setMethodCallHandler(this)
  }

  override fun onMethodCall(call: MethodCall, result: Result) {
    if (call.method == "getPlatformVersion") {
      result.success("Android ${android.os.Build.VERSION.RELEASE}")
    } else {
      result.notImplemented()
    }
  }


  private lateinit var channel: MethodChannel
  private lateinit var context: Context

  override fun onAttachedToEngine(binding: FlutterPlugin.FlutterPluginBinding) {
    channel = MethodChannel(binding.binaryMessenger, "background_permission_checker")
    channel.setMethodCallHandler(this)
    context = binding.applicationContext
  }

  override fun onMethodCall(call: MethodCall, result: MethodChannel.Result) {
    when (call.method) {

      "isAutoStartEnabled" -> {
        result.success(checkAutoStart())
      }

      "openAutoStartSettings" -> {
        openAutoStartSettings()
        result.success(true)
      }

      else -> result.notImplemented()
    }
  }

  private fun checkAutoStart(): Boolean {
    return try {
      val appOps = context.getSystemService(Context.APP_OPS_SERVICE) as AppOpsManager
      val mode = appOps.unsafeCheckOpNoThrow(
        "android:get_tasks",
        android.os.Process.myUid(),
        context.packageName
      )
      mode == AppOpsManager.MODE_ALLOWED
    } catch (e: Exception) {
      false
    }
  }

  private fun openAutoStartSettings() {
    val brand = Build.MANUFACTURER.lowercase()
    val intent = when {
      brand.contains("xiaomi") ->
        Intent().setClassName(
          "com.miui.securitycenter",
          "com.miui.permcenter.autostart.AutoStartManagementActivity"
        )

      brand.contains("oppo") ->
        Intent("oppo.intent.action.APP_PERMISSION_MANAGER")

      brand.contains("vivo") ->
        Intent().setClassName(
          "com.vivo.permissionmanager",
          "com.vivo.permissionmanager.activity.BgStartUpManagerActivity"
        )

      else ->
        Intent(android.provider.Settings.ACTION_APPLICATION_DETAILS_SETTINGS)
          .setData(android.net.Uri.parse("package:${context.packageName}"))
    }

    intent.addFlags(Intent.FLAG_ACTIVITY_NEW_TASK)
    context.startActivity(intent)
  }


  override fun onDetachedFromEngine(binding: FlutterPlugin.FlutterPluginBinding) {
    channel.setMethodCallHandler(null)
  }
}
