import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:schedule/core/appRemote/app_remote_helper.dart';
import 'package:schedule/core/appRemote/app_url.dart';
import 'package:schedule/core/appRoutes/app_routes.dart';
import 'package:schedule/core/widgets/app_toast.dart';
import 'package:schedule/presentation/addSchedule/model/time_slot_model.dart';
import 'package:schedule/presentation/auth/_controller/auth_controller.dart';

import '../../../core/localDB/local_database_manager.dart';

class AppAppointmentController extends GetxController {
  static AppAppointmentController to = Get.find();

  TextEditingController descriptionController = new TextEditingController();

  Rx<TimeSlotModel> timeSlotModel = TimeSlotModel().obs;

  RxInt selectedSlot = 1.obs;

  String selectedDate = "";
  RxBool isLoading = false.obs;

  Future<TimeSlotModel> getAllTimeSlot(BuildContext context) async {
    var _res = await http.get(Uri.parse(AppUrls.all_time_slot),
        headers: AppRemoteHelper().header());

    print("Appointment time slot response : ${_res.body}");

    if (_res.statusCode == 200) {
      timeSlotModel.value = TimeSlotModel.fromJson(jsonDecode(_res.body));
    } else {
      // AnimatedSnackBar.rectangle(
      //         "Request Failed", "${jsonDecode(_res.body)["error"]}",
      //         type: AnimatedSnackBarType.error)
      //     .show(context);

      AppToast.showErrorMessage(
          context: context, msg: "${jsonDecode(_res.body)["error"]}");
    }

    return timeSlotModel.value;
  }

  createBook(BuildContext context) async {
    var _token;

    if (!_isUserAuthorize()) {
      _token = await Navigator.pushNamed(context, AppRoutes.LOG_IN);
    }

    printInfo(info: "Token is ok: ${AppAuthController.to.token}");

    // if (AppAuthController.to.token == null) {
    //   return;
    // }

    isLoading(true);

    Map<String, String> _body = {
      "date": selectedDate,
      "timeSlot_id": selectedSlot.toString(),
      "description": descriptionController.value.text ?? ""
    };
    String? tokenFromLocal = await AppLocalDatabaseManager().getToken();

    if (tokenFromLocal != null) {
      AppAuthController.to.token = tokenFromLocal;
    }

    var _res = await http.post(Uri.parse(AppUrls.create_booking),
        headers: AppRemoteHelper().header(token: AppAuthController.to.token),
        body: _body);

    print("Appointment  body : ${_body}");
    print(
        "Appointment  header : ${AppRemoteHelper().header(token: AppAuthController.to.token)}");

    print("Book appointment response : ${_res.body}");

    isLoading(false);

    if (_res.statusCode == 200 || _res.statusCode == 201) {
      if (jsonDecode(_res.body)["success"] == null) {
        descriptionController.clear();

        showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                title: Text("Alert"),
                content: Text(jsonDecode(_res.body)["message"]),
              );
            });
      } else {
        Get.offAndToNamed(AppRoutes.APPOINTMENT_LIST);
        // AnimatedSnackBar.rectangle(
        //         "Success", "Successfully appointment created.",
        //         type: AnimatedSnackBarType.success)
        //     .show(context);

        // ScaffoldMessenger.of(context).showSnackBar(
        //     new SnackBar(content: Text("Successfully appointment created.")));

        AppToast.showSuccessMessage(
            context: context, msg: "Successfully appointment created.");
      }
    } else {
      // AnimatedSnackBar.rectangle("Error", "Failed to create an appointment.",
      //         type: AnimatedSnackBarType.error)
      //     .show(context);

      AppToast.showErrorMessage(
          context: context, msg: "Failed to create an appointment.");
    }
    isLoading(false);

  }

  bool _isUserAuthorize() {
    return AppAuthController.to.token != null;
  }

  Future<bool> updateScheduler(BuildContext context, int? scheduleId) async {
    bool _isSuccess = false;

    isLoading(true);

    Map<String, String> _body = {
      "date": selectedDate,
      "timeSlot_id": selectedSlot.toString(),
      "description": descriptionController.value.text
    };

    var _res = await http.post(
        Uri.parse(AppUrls.re_sceduler + scheduleId.toString()),
        headers: AppRemoteHelper().header(),
        body: _body);

    print("Appointment list body : ${_body}");

    print("appointment update response : ${_res.body}");

    isLoading(false);

    if (_res.statusCode == 200 || _res.statusCode == 201) {
      if (jsonDecode(_res.body)["success"] == null) {
        showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                title: Text("Alert"),
                content: Text(jsonDecode(_res.body)["message"]),
              );
            });
      } else {
        // AnimatedSnackBar.rectangle(
        //         "Success", "Successfully appointment updated.",
        //         type: AnimatedSnackBarType.success)
        //     .show(context);

        AppToast.showSuccessMessage(
            context: context, msg: "Successfully appointment updated.");

        _isSuccess = true;
      }
    } else {
      // AnimatedSnackBar.rectangle("Error", "Failed to update an appointment.",
      //         type: AnimatedSnackBarType.error)
      //     .show(context);

      AppToast.showErrorMessage(
          context: context, msg: "Failed to update an appointment.");
    }

    return _isSuccess;
  }
}
