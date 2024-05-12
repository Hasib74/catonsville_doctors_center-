import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:schedule/core/widgets/app_toast.dart';

class AppContractUsController extends GetxController {
  static AppContractUsController to = Get.find();

  RxBool isLoading = false.obs;

  TextEditingController nameTextEditingController = new TextEditingController();
  TextEditingController phoneTextEditingController =
      new TextEditingController();
  TextEditingController gmailTextEditingController =
      new TextEditingController();
  TextEditingController messageTextEditingController =
      new TextEditingController();

  contract(BuildContext context) async {
    if (nameTextEditingController.value.text.isNotEmpty &&
        phoneTextEditingController.value.text.isNotEmpty &&
        gmailTextEditingController.value.text.isNotEmpty &&
        messageTextEditingController.value.text.isNotEmpty) {
      if (!gmailTextEditingController.value.text.isEmail) {
        AppToast.showErrorMessage(
            context: context, msg: "Please input correct gmail.");

        return;
      }

      if (!phoneTextEditingController.value.text.isPhoneNumber) {
        AppToast.showErrorMessage(
            context: context, msg: "Please input correct phone.");

        return;
      }

      isLoading.value = true;

      await Future.delayed(Duration(seconds: 2));

      AppToast.showSuccessMessage(
          context: context, msg: "Thank you.We will contract with you.");

      Get.back();

      isLoading.value = false;
    } else {
      AppToast.showErrorMessage(
          context: context, msg: "Fields can not be empty.");
    }
  }
}
