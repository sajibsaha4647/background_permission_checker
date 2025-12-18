import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'background_permission_checker_method_channel.dart';

abstract class BackgroundPermissionCheckerPlatform extends PlatformInterface {
  /// Constructs a BackgroundPermissionCheckerPlatform.
  BackgroundPermissionCheckerPlatform() : super(token: _token);

  static final Object _token = Object();

  static BackgroundPermissionCheckerPlatform _instance = MethodChannelBackgroundPermissionChecker();

  /// The default instance of [BackgroundPermissionCheckerPlatform] to use.
  ///
  /// Defaults to [MethodChannelBackgroundPermissionChecker].
  static BackgroundPermissionCheckerPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [BackgroundPermissionCheckerPlatform] when
  /// they register themselves.
  static set instance(BackgroundPermissionCheckerPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }
}
