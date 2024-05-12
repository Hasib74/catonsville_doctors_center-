import 'package:get/get.dart';
import 'package:schedule/core/appRoutes/app_routes.dart';
import 'package:schedule/presentation/auth/_controller/auth_controller.dart';

class AppControllerSplashScreen extends GetxController {
  RxDouble animatedPadding = 150.0.obs;

  static AppControllerSplashScreen to = Get.find();

  changePadding() async {
    Future.delayed(const Duration(milliseconds: 500)).then((value) {
      animatedPadding(0);
    });
  }

  holdSplashScreenForSomeTimeThenGoToHomeScreen() {
    Future.delayed(const Duration(seconds: 3)).then((value) {
      // Get.to(AppRoutes.HOME);
      Get.offAllNamed(AppRoutes.HOME);
    });
  }
}
