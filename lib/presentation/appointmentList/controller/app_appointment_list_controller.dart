import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:schedule/core/appRemote/app_remote_helper.dart';
import 'package:schedule/core/appRemote/app_url.dart';
import 'package:schedule/core/appRoutes/app_routes.dart';
import 'package:schedule/core/utils/app_colors.dart';
import 'package:schedule/core/widgets/app_toast.dart';
import 'package:schedule/presentation/auth/_controller/auth_controller.dart';
import '../../addSchedule/_controller/appointment_controller.dart';
import '../model/appointment_list_model.dart';

class AppAppointmentListController extends GetxController {
  static AppAppointmentListController to = Get.find();

  Rx<AppointmentListModel> appointmentListModel =
      new AppointmentListModel().obs;
  RxBool isLoading = false.obs;

  getAllAppointmentList(BuildContext context) async {
    isLoading(true);

    var _res = await http.get(Uri.parse(AppUrls.appointment_list),
        headers: AppRemoteHelper().header());

    print("All Appointment List  : ${_res.body}");
    isLoading(false);
    if (_res.statusCode == 200) {
      print("Appointment List body : ${_res.body}");

      appointmentListModel.value =
          AppointmentListModel.fromJson(jsonDecode(_res.body));
    } else {
      // AnimatedSnackBar.rectangle("Error", "Failed to load appointment list.",
      //         type: AnimatedSnackBarType.error)
      //     .show(context);

      if (AppAuthController.to.token != null) {
        AppToast.showErrorMessage(
            context: context, msg: "Failed to load appointment list.");
      }
    }
  }

  init(BuildContext context) async {
    if (AppAuthController.to.token == null) {
      Future.delayed(Duration(seconds: 1)).then((value) {
        showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                title: Text("Alert"),
                content: Text(
                    "Please create an account to schedule an appointment."),
                actions: [
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: InkWell(
                      child: Text(
                        "Sign In",
                        style: Theme.of(context)
                            .textTheme
                            .bodyMedium!
                            .copyWith(color: AppColors.grey),
                      ),
                      onTap: () async {
                        Navigator.pop(context);

                        var _res = await Get.toNamed(AppRoutes.LOG_IN);

                        if (_res != null) {
                          init(context);
                        }
                      },
                    ),
                  ),
                ],
              );
            }).then((value) {
          getAllAppointmentList(context);
        });
      });

      return;
    }
//fetched appointment list
    Future.delayed(Duration(seconds: 1)).then((value) async {
      if (AppAppointmentController.to.timeSlotModel.value.message == null) {
        isLoading(true);
        await AppAppointmentController.to.getAllTimeSlot(context);
      }

      await getAllAppointmentList(context);
    });
  }

  Future<bool> deleteAppointmentSchedule(BuildContext context, num? id) async {
    bool _isSuccess = false;

    isLoading(true);

    var _res = await http.post(Uri.parse(AppUrls.delete + "${id}"),
        headers: AppRemoteHelper().header());

    isLoading(false);

    print("All Appointment List  : ${_res.statusCode}");

    if (_res.statusCode == 200) {
      _isSuccess = true;
    } else {
      // AppToast.showErrorMessage(
      //     context: context, msg: "Failed to cancel appointment.");

      if (AppAuthController.to.token != null) {
        //  Get.toNamed(AppRoutes.LOG_IN);

        AppToast.showErrorMessage(
            context: context, msg: "Failed to load appointment list.");
      }
    }

    return _isSuccess;
  }
}
