import 'package:flutter_test/flutter_test.dart';
import 'package:background_permission_checker/background_permission_checker.dart';
import 'package:background_permission_checker/background_permission_checker_platform_interface.dart';
import 'package:background_permission_checker/background_permission_checker_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockBackgroundPermissionCheckerPlatform
    with MockPlatformInterfaceMixin
    implements BackgroundPermissionCheckerPlatform {

  @override
  Future<String?> getPlatformVersion() => Future.value('42');
}

void main() {
  final BackgroundPermissionCheckerPlatform initialPlatform = BackgroundPermissionCheckerPlatform.instance;

  test('$MethodChannelBackgroundPermissionChecker is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelBackgroundPermissionChecker>());
  });

  test('getPlatformVersion', () async {
    BackgroundPermissionChecker backgroundPermissionCheckerPlugin = BackgroundPermissionChecker();
    MockBackgroundPermissionCheckerPlatform fakePlatform = MockBackgroundPermissionCheckerPlatform();
    BackgroundPermissionCheckerPlatform.instance = fakePlatform;

    expect(await backgroundPermissionCheckerPlugin.getPlatformVersion(), '42');
  });
}
