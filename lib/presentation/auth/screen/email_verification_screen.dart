/*
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:schedule/core/appRoutes/app_routes.dart';

import '../../../core/utils/app_spaces.dart';
import '../../../core/widgets/app_button.dart';
import '../../../core/widgets/app_text_filed.dart';
import '../_controller/auth_controller.dart';

class EmailVerificationScreen extends StatelessWidget {
  const EmailVerificationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AppAuthController.to.emailController.clear();
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            color: Colors.white,
          ),
          onPressed: () {
            Get.back();
          },
        ),
        title: const Text("Verify Email"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(padding: EdgeInsets.symmetric(vertical: 40)),
            Text(
              "Please verify your email.",
              style: Theme.of(context).textTheme.headline5,
            ),
            Padding(padding: EdgeInsets.symmetric(vertical: 40)),
            AppTextFieldWidget(
                controller: AppAuthController.to.emailController,
                hint: "Enter email"),
            AppSpaces.spaces_height_25,
            Obx(() => AppButton(
                isLoading: AppAuthController.to.isLoading.value,
                text: "Send Request",
                onTab: () async {
                  var _res = await AppAuthController.to
                      .mailVarificationAndSendCodeToMail(context);

                  if (_res) {
                    await Get.toNamed(AppRoutes.OTP_SCREEN,
                        arguments:
                            [AppAuthController.to.emailController.value.text , false]);

                    Get.back();
                  }
                })),
          ],
        ),
      ),
    );
  }
}
*/
