import 'package:package_info_plus/package_info_plus.dart';

class AppFunctions {
  static Future<String> getVersion() async {
    PackageInfo packageInfo = await PackageInfo.fromPlatform();
    String version = packageInfo.version;
    String code = packageInfo.buildNumber;

    print("Version: $version");

    return version;
  }
}
