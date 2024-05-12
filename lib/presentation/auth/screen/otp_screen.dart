import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:otp_text_field/otp_field.dart';
import 'package:otp_text_field/otp_field_style.dart';
import 'package:otp_text_field/style.dart';
import 'package:schedule/core/appRoutes/app_routes.dart';
import 'package:schedule/core/utils/app_colors.dart';
import 'package:schedule/core/utils/app_spaces.dart';
import 'package:schedule/core/widgets/app_button.dart';
import 'package:schedule/core/widgets/app_toast.dart';
import 'package:schedule/presentation/auth/_controller/auth_controller.dart';

class OtpScreen extends StatelessWidget {
  String email;
  bool isFromRegistrationPage;

  OtpScreen(
      {Key? key, required this.email, required this.isFromRegistrationPage})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        backgroundColor: AppColors.transparent,
        elevation: 0,
        leading: InkWell(
          onTap: () {
            Get.back();
          },
          child: Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              AppSpaces.spaces_height_15,
              Text(
                "Verification Code",
                style: Theme.of(context).textTheme.headline3,
              ),
              AppSpaces.spaces_height_15,
              AppSpaces.spaces_height_15,
              AppSpaces.spaces_height_15,
              Text(
                "Please enter the verification code from ${email}",
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.bodyText1,
              ),
              AppSpaces.spaces_height_20,
              AppSpaces.spaces_height_20,
              Padding(
                padding: const EdgeInsets.only(left: 25, right: 25),
                child: TextField(
                  controller: AppAuthController.to.otpTextEditingController,
                  cursorColor: AppColors.primaryColor,
                  textAlign: TextAlign.center,
                  decoration: InputDecoration(
                      border: UnderlineInputBorder(
                          borderSide:
                              BorderSide(color: AppColors.primaryColor)),
                      focusColor: AppColors.primaryColor,
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: AppColors.primaryColor),
                      )),
                  style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: AppColors.primaryColor // This is not so important
                      ),
                ),
              ),
              AppSpaces.spaces_height_20,
              AppSpaces.spaces_height_20,
              InkWell(
                onTap: () async {
                  bool _isSuccess = await AppAuthController.to.resendOtp(email);

                  if (_isSuccess) {
                    AppToast.showErrorMessage(
                        context: context,
                        msg: "Successfully sent otp.Please check your mail.");
                  }
                },
                child: Text(
                  "Did not get code? Resend",
                  style: Theme.of(context).textTheme.bodyText1,
                ),
              ),
              AppSpaces.spaces_height_20,
              AppSpaces.spaces_height_20,
              AppSpaces.spaces_height_20,
              AppSpaces.spaces_height_20,
              AppSpaces.spaces_height_20,
              AppSpaces.spaces_height_20,
              Obx(() => AppButton(
                  text: "Verify Now",
                  isLoading: AppAuthController.to.isLoading.value,
                  onTab: () async {
                    bool _isSuccess = await AppAuthController.to.verifyOtp(
                        context,
                        AppAuthController
                            .to.otpTextEditingController.value.text);

                    Future.delayed(Duration(seconds: 2)).then((value) async {
                      if (_isSuccess) {
                        if (!isFromRegistrationPage) {
                          await Get.toNamed(AppRoutes.CHNAGE_PASSWORD)!
                              .then((value) {
                            Get.back();
                          });
                        } else {
                          Get.back(result: true);
                        }
                      } else {
                        AppToast.showErrorMessage(
                            context: context, msg: "Otp did not matched.");
                      }
                    });
                  }))
            ],
          ),
        ),
      ),
    );
  }
}
