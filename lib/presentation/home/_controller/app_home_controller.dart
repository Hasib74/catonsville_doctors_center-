import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:schedule/core/widgets/app_toast.dart';
import 'package:schedule/presentation/home/model/Service_list_model.dart';

import '../../../core/appRemote/app_url.dart';
import '../model/our_staff_model.dart';

class AppHomeController extends GetxController {
  static AppHomeController to = Get.find();

  Rx<OurStaffModel> ourStaffModel = new OurStaffModel().obs;
  Rx<ServiceListModel> serviceListModel = new ServiceListModel().obs;
  RxBool isLoading = false.obs;

  @override
  onInit() {}

  getAllStaff(BuildContext context) async {
    isLoading(true);

    var _res = await http.get(
      Uri.parse(AppUrls.meetOurStaff),
    );

    isLoading(false);
    print("Get All Staff : ${_res.body}");

    if (_res.statusCode == 200) {
      ourStaffModel.value = OurStaffModel.fromJson(jsonDecode(_res.body));
    } else {
      // AnimatedSnackBar.rectangle(
      //         "Request Failed", "${jsonDecode(_res.body)["error"]}",
      //         type: AnimatedSnackBarType.error)
      //     .show(context);



      AppToast.showErrorMessage(context: context ,msg: jsonDecode(_res.body)["error"]);
    }
  }

  getServiceList(BuildContext context) async {
    isLoading(true);

    var _res = await http.get(
      Uri.parse(AppUrls.serviceList),
    );

    isLoading(false);
    print("Service list body  : ${_res.body}");

    if (_res.statusCode == 200) {
      serviceListModel.value = ServiceListModel.fromJson(jsonDecode(_res.body));
    } else {
    /*  ScaffoldMessenger.of(context).showSnackBar(
          new SnackBar(content: Text("Failed to load service List")));*/

      AppToast.showErrorMessage(context: context , msg: "Failed to load service List");
    }
  }
}
