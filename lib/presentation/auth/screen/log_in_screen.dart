import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loading_indicator/loading_indicator.dart';
import 'package:schedule/core/appRoutes/app_routes.dart';
import 'package:schedule/core/utils/app_assets.dart';
import 'package:schedule/core/utils/app_colors.dart';
import 'package:schedule/core/utils/app_spaces.dart';
import 'package:schedule/core/widgets/app_text_filed.dart';

import '../../../core/widgets/app_button.dart';
import '../_controller/auth_controller.dart';

class LogInScreen extends StatelessWidget {
  const LogInScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AppAuthController.to.emailController.clear();
    AppAuthController.to.passwordController.clear();
    AppAuthController.to.isLoading.value = false;

    Get.closeCurrentSnackbar();

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Spacer(),
              AppSpaces.spaces_height_15,

              Row(
                children: [
                  AppSpaces.spaces_width_15,
                  InkWell(
                    onTap: () {
                      Get.back(result: false);
                    },
                    child: Row(
                      children: [
                        Icon(
                          Icons.arrow_back_ios,
                          color: AppColors.black,
                        ),
                        Text(
                          "Back",
                          style: TextStyle(color: AppColors.black),
                        ),
                      ],
                    ),
                  )
                ],
              ),
              AppSpaces.spaces_height_30,
              AppSpaces.spaces_height_30,
              Image(
                image: AssetImage(
                  AppAssets.logo,
                ),
                height: 160,
                width: 160,
              ),

              AppSpaces.spaces_height_35,
              AppTextFieldWidget(
                  hint: "Enter your email address",
                  controller: AppAuthController.to.emailController),
              AppSpaces.spaces_height_20,
              AppTextFieldWidget(
                  hint: "Enter your password",
                  obscureText: true,
                  controller: AppAuthController.to.passwordController),

              AppSpaces.spaces_height_35,
              _logInButton(context),

              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                    onPressed: () async {
                      var _result =
                          await Get.toNamed(AppRoutes.EMAIL_VERIFICATION);
                    },
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(right: 16),
                          child: Text(
                            "Forgot Password?",
                            style: TextStyle(
                              color: AppColors.black,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),

              AppSpaces.spaces_height_25,
              TextButton(
                onPressed: () async {
                  var _result = await Get.toNamed(AppRoutes.REGISTRATION);

                  if (_result) {
                    Get.back(result: true);
                  }
                },
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Don't have an account?",
                      style: TextStyle(
                        color: AppColors.black,
                      ),
                    ),
                    Text(
                      " Sign Up",
                      style: TextStyle(color: AppColors.primaryColor),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  _logInButton(BuildContext context) {
    return Obx(() {
      return AbsorbPointer(
        absorbing: AppAuthController.to.isLoading.value,
        child: AppButton(
            text: "Sign In",
            isLoading: AppAuthController.to.isLoading.value,
            onTab: () async {
             await AppAuthController.to.logIn(context);

              // Get.toNamed(AppRoutes.HOME);
            }),
      );
    });
  }
}
