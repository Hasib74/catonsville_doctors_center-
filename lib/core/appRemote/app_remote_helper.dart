import 'package:schedule/presentation/auth/_controller/auth_controller.dart';

class AppRemoteHelper {
  Map<String, String> header({String? token}) {
    return {
      // 'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer ${token ?? AppAuthController.to.token}'
    };
  }
}
