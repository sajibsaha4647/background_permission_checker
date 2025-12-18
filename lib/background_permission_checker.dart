import 'package:flutter/services.dart';

class BackgroundChecker {
  static const MethodChannel _channel =
  MethodChannel('background_permission_checker');

  static Future<bool> isAutoStartEnabled() async {
    return await _channel.invokeMethod('isAutoStartEnabled');
  }

  static Future<void> openAutoStartSettings() async {
    await _channel.invokeMethod('openAutoStartSettings');
  }
}
