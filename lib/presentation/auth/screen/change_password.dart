/*
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:schedule/core/utils/app_spaces.dart';
import 'package:schedule/core/widgets/app_button.dart';
import 'package:schedule/core/widgets/app_text_filed.dart';
import 'package:schedule/presentation/auth/_controller/auth_controller.dart';

class ChangePasswordScreen extends StatelessWidget {
  const ChangePasswordScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // AppAuthController.to.emailController.clear();
    AppAuthController.to.passwordController.clear();
    AppAuthController.to.confirmPasswordController.clear();
    AppAuthController.to.newPasswordController.clear();
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
        title: const Text("Reset Password"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            AppSpaces.spaces_height_40,
            AbsorbPointer(
              absorbing: true,
              child: Opacity(
                opacity: 0.7,
                child: AppTextFieldWidget(
                    controller: AppAuthController.to.emailController,
                    hint: "Enter email"),
              ),
            ),
            AppSpaces.spaces_height_10,
            AppTextFieldWidget(
              obscureText: true,
              controller: AppAuthController.to.newPasswordController,
              hint: "Enter New Password",
            ),
            AppSpaces.spaces_height_10,
            AppTextFieldWidget(
                obscureText: true,
                controller: AppAuthController.to.confirmPasswordController,
                hint: "Confirm Password"),
            AppSpaces.spaces_height_25,
            Obx(() => AppButton(
                isLoading: AppAuthController.to.isLoading.value,
                text: "Submit",
                onTab: () async {
                  bool _isSuccess =
                      await AppAuthController.to.ChangePasswordScreen(context);

                  if (_isSuccess) {
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
