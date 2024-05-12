import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:schedule/core/localDB/local_database_manager.dart';
import 'package:schedule/presentation/auth/_controller/auth_controller.dart';

import '../../../core/appRemote/app_remote_helper.dart';
import '../../_common/widgets/app_loading.dart';
import 'package:http/http.dart' as http;

class AppDrawerController extends GetxController {
  static AppDrawerController to = Get.find(tag: "AppDrawerController");

  Rx isLoading = false.obs;

  logOut() async {
    //  isLoading.value = true;

    AppAuthController.to.token = null;
    return await AppLocalDatabaseManager().logOut();

    // isLoading.value = false;
  }

  deleteAccount(BuildContext context) async {
    AppLoadingDialog.show(context);

    http.Response _userRes = await http.get(
      Uri.parse("https://scheduler1.baadhan.com/api/user/get"),
      headers: AppRemoteHelper().header(token: AppAuthController.to.token!),
    );


    print("Base url : https://scheduler1.baadhan.com/api/get/user");

    print(
        "_userRes header: ${AppRemoteHelper().header(token: AppAuthController.to.token!)}");
    print("_userRes response: ${_userRes.body} ${_userRes.statusCode}");
    isLoading.value = false;

    if (_userRes.statusCode == 200) {
      isLoading.value = true;

      printInfo(info: "User ifo : ${_userRes.body}");

      print(
          "Delete account api  : ${"https://scheduler1.baadhan.com/api/user/account/delete/${jsonDecode(_userRes.body)["message"]["id"]}"}");

      http.Response _deleteRes = await http.post(
        Uri.parse(
            "https://scheduler1.baadhan.com/api/user/account/delete/${jsonDecode(_userRes.body)["message"]["id"]}"),
        headers: AppRemoteHelper().header(token: AppAuthController.to.token!),
      );

      AppLoadingDialog.dispose(context);

      isLoading.value = false;

      printInfo(
          info:
              "https://scheduler1.baadhan.com/user/account/delete/${jsonDecode(_userRes.body)["message"]["id"]}");
      printInfo(
          info:
              "Delete account header : ${AppRemoteHelper().header(token: AppAuthController.to.token!)}");
      printInfo(info: "Delete response : ${_deleteRes.body}");

      //if (_deleteRes.statusCode == 200) {
      await logOut();
      // }
    }
  }
}
