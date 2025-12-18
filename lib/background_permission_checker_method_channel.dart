import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'background_permission_checker_platform_interface.dart';

/// An implementation of [BackgroundPermissionCheckerPlatform] that uses method channels.
class MethodChannelBackgroundPermissionChecker extends BackgroundPermissionCheckerPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('background_permission_checker');

  @override
  Future<String?> getPlatformVersion() async {
    final version = await methodChannel.invokeMethod<String>('getPlatformVersion');
    return version;
  }
}
