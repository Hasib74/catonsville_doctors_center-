import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:schedule/core/utils/app_assets.dart';

import '../_controller/controller_splash_screen.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(AppControllerSplashScreen());

    AppControllerSplashScreen.to.changePadding();
    AppControllerSplashScreen.to.holdSplashScreenForSomeTimeThenGoToHomeScreen();

    return Scaffold(
      body: Obx(() => Center(
            child: AnimatedPadding(
              duration: const Duration(
                seconds: 3,
              ),
              padding: EdgeInsets.all(
                  AppControllerSplashScreen.to.animatedPadding.value),
              child: SizedBox(
                width: 220.0,
                height: 220,
                child: Image(image: AssetImage(AppAssets.logo)),
              ),
            ),
          )),
    );
  }
}
