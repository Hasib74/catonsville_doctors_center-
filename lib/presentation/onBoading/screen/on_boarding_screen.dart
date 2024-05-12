import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:schedule/core/appRoutes/app_routes.dart';
import 'package:schedule/core/utils/app_assets.dart';
import 'package:schedule/core/utils/app_colors.dart';

class OnBoardingScreen extends StatelessWidget {
  OnBoardingScreen({Key? key}) : super(key: key);

  var pageDecoration = PageDecoration(
      titleTextStyle: TextStyle(fontSize: 28.0, fontWeight: FontWeight.w700),
      // bodyPadding: EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 16.0),
      // pageColor: Colors.white,

      //  pageColor: AppColors.primaryColor,
      imageFlex: 4,
      bodyFlex: 0,
      //imagePadding: EdgeInsets.zero,
      bodyTextStyle: Get.textTheme.bodyText1 ?? TextStyle());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IntroductionScreen(
        pages: [
          PageViewModel(
              decoration: pageDecoration,
              title: "Welcome",
              image: Container(
                  width: Get.size.width,
                  height: Get.height,
                  child: Image(
                    image: AssetImage(AppAssets.hair_cut_one),
                    fit: BoxFit.cover,
                  )),
              body:
                  "Download the Stockpile app and master the market with our mini-lesson. Download the Stockpile app and master the market with our mini-lesson. Download the Stockpile app and master the market with our mini-lesson."),
          PageViewModel(
              title: "Welcome",
              decoration: pageDecoration,
              image: Container(
                  width: Get.size.width,
                  height: Get.height,
                  child: Image(
                    image: AssetImage(
                      AppAssets.haire_cut_pic_two,
                    ),
                    fit: BoxFit.cover,
                  )),
              body:
                  "Download the Stockpile app and master the market with our mini-lesson."),
          PageViewModel(
            title: "Welcome",
            decoration: pageDecoration,
            image: Container(
                width: Get.size.width,
                height: Get.height,
                child: Image(
                  image: AssetImage(AppAssets.haire_cut_three),
                  fit: BoxFit.cover,
                )),
            body:
                "Download the Stockpile app and master the market with our mini-lesson.",
          ),
        ],
        done: Text("Done"),
        onDone: () {
          Get.toNamed(AppRoutes.LOG_IN);
        },
        next: Text("Next"),
      ),
    );
  }
}
