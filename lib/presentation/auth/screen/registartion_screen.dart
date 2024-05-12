import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:schedule/core/appRoutes/app_routes.dart';
import 'package:schedule/core/utils/app_colors.dart';
import 'package:schedule/presentation/auth/_controller/auth_controller.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../core/utils/app_assets.dart';
import '../../../core/utils/app_spaces.dart';
import '../../../core/widgets/app_button.dart';
import '../../../core/widgets/app_text_filed.dart';

class RegistrationScreen extends StatelessWidget {
  const RegistrationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AppAuthController.to.emailController.clear();

    AppAuthController.to.passwordController.clear();

    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.only(left: 16),
                child: IconButton(
                  icon: Icon(
                    Icons.arrow_back_ios,
                    color: AppColors.primaryColor,
                  ),
                  onPressed: () {
                    Get.back();
                  },
                ),
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                child: new Column(
                  children: [
                    Image(
                      image: AssetImage(
                        AppAssets.logo,
                      ),
                      height: 160,
                      width: 160,
                    ),
                    AppSpaces.spaces_height_30,
                    AppTextFieldWidget(
                        hint: "Enter your first name",
                        controller: AppAuthController.to.firstNameController),
                    AppSpaces.spaces_height_20,
                    AppTextFieldWidget(
                        hint: "Enter your last name",
                        controller: AppAuthController.to.lastNameController),
                    AppSpaces.spaces_height_20,
                    AppTextFieldWidget(
                       textInputType: TextInputType.phone,
                        hint: "Enter your phone",
                        controller: AppAuthController.to.phoneController),
                    AppSpaces.spaces_height_20,
                    AppTextFieldWidget(
                        hint: "Enter your email",
                        controller: AppAuthController.to.emailController),
                    AppSpaces.spaces_height_20,
                    AppTextFieldWidget(
                        hint: "Enter your password",
                        obscureText: true,
                        controller: AppAuthController.to.passwordController),
                    AppSpaces.spaces_height_20,
                    AppTextFieldWidget(
                        hint: "Confirm password",
                        obscureText: true,
                        controller:
                            AppAuthController.to.confirmPasswordController),
                    AppSpaces.spaces_height_15,
                    Row(
                      children: [
                        Obx(() => Checkbox(
                            checkColor: Colors.white,
                            activeColor: AppColors.primaryColor,
                            value: AppAuthController.to.isTramsSelected.value,
                            onChanged: (change) {
                              AppAuthController.to.isTramsSelected.value =
                                  !AppAuthController.to.isTramsSelected.value;
                            })),
                        Expanded(
                          child: Text("I accept Terms and conditions."),
                        ),
                        InkWell(
                          onTap: () async {
                            if (!await launchUrl(Uri.parse(
                                "https://scheduler1.baadhan.com/privacy/policy"))) {
                              throw Exception(
                                  'Could not launch https://scheduler1.baadhan.com/privacy/policy');
                            }
                          },
                          child: Text(
                            "Privacy Policy",
                            style: new TextStyle(
                                color: AppColors.primaryColor,
                                decoration: TextDecoration.underline),
                          ),
                        )
                      ],
                    ),
                    AppSpaces.spaces_height_30,
                    Obx(() {
                      return AppButton(
                          text: "Sign Up",
                          isLoading: AppAuthController.to.isLoading.value,
                          onTab: () async {
                            bool isSuccess =
                                await AppAuthController.to.signUp(context);
                            //Get.toNamed(AppRoutes.HOME);

                            print("Is success ....: ${isSuccess}");

                            if (isSuccess) {
                              // bool _isSuccess = await Get.toNamed(
                              //     AppRoutes.OTP_SCREEN,
                              //     arguments: [
                              //       AppAuthController
                              //           .to.emailController.value.text,
                              //       true
                              //     ]);

                              AppAuthController.to.logIn(context);
                            }

                            if (isSuccess) {
                              Get.back(result: true);
                            }
                          });
                    }),
                    AppSpaces.spaces_height_30,
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
