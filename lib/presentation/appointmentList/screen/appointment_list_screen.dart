import 'dart:ffi';

import 'package:custom_pop_up_menu/custom_pop_up_menu.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:schedule/core/appRoutes/app_routes.dart';
import 'package:schedule/core/utils/app_colors.dart';
import 'package:schedule/core/utils/app_spaces.dart';
import 'package:schedule/core/widgets/app_toast.dart';
import 'package:schedule/presentation/_common/widgets/app_loading.dart';
import 'package:schedule/presentation/addSchedule/_controller/appointment_controller.dart';
import 'package:schedule/presentation/appointmentList/controller/app_appointment_list_controller.dart';
import 'package:schedule/presentation/appointmentList/model/appointment_list_model.dart';
import 'package:schedule/presentation/appointmentList/screen/_common/widgets/appointment_list_card_widget.dart';

import '../../addSchedule/screen/add_schedule_screen.dart';

class AppointmentListScreen extends StatelessWidget {
  const AppointmentListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AppAppointmentListController.to.init(context);

    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: SafeArea(
        child: Column(
          children: [
            AppSpaces.spaces_height_15,
            _appBar(context),
            AppSpaces.spaces_height_15,
            Obx(() {
              if (AppAppointmentListController.to.isLoading.value) {
                return Expanded(
                    child: Align(
                  alignment: Alignment.center,
                  child: AppLoading(context),
                ));
              } else {
                return Expanded(
                  child: ListView.builder(
                    padding: EdgeInsets.only(top: 16, bottom: 16),
                    itemCount: AppAppointmentListController
                                .to.appointmentListModel.value.message ==
                            null
                        ? 0
                        : AppAppointmentListController
                            .to.appointmentListModel.value.message?.length,
                    itemBuilder: (BuildContext context, int index) {
                      var _data = AppAppointmentListController
                          .to.appointmentListModel.value.message?.reversed.toList()[index];

                      var _schedule = AppAppointmentController
                          .to.timeSlotModel.value.message
                          ?.toList().reversed
                          .where((element) => element.id.toString() == _data?.timeSlotId.toString())
                          .first;

                      return AppointmentListCardWidget(
                        onEditClick: () async {
                          print("Update button click");

                          var _res = await Get.dialog(new AddScheduleScreen(
                            isReScheduler: true,
                            reSchedulerDate: _data?.date,
                            reSchedulerTime: _data?.timeSlotId ?? "",
                            scheduleId: _data?.id!.toInt(),
                            reSchedulerDescription: _data?.description,
                          ));

                          if (_res != null) {
                            AppAppointmentListController.to
                                .getAllAppointmentList(context);
                          }
                        },
                        onDeleteClick: () async {
                          bool _isSuccess = await AppAppointmentListController
                              .to
                              .deleteAppointmentSchedule(context, _data?.id);

                          if (_isSuccess) {
                            AppToast.showSuccessMessage(
                                context: context,
                                msg: "Successfully canceled appointment.");

                            AppAppointmentListController.to
                                .getAllAppointmentList(context);
                          }
                        },
                        id: "Id : ${_data?.bookingId}",
                        date: "Schedule Date : ${_data?.date}",
                        created_at: "Booked time : ${DateFormat('MMM dd, yyyy hh:mm:ss a').format(DateTime.parse(_data!.createdAt!))}",
                        schedule:
                            "Schedule Time: ${_schedule?.timeFrom} to ${_schedule?.timeTo}",
                        description: _data?.description,
                      );
                    },
                  ),
                );
              }
            })
          ],
        ),
      ),
    );
  }

  Row _appBar(BuildContext context) {
    return Row(
      children: [
        AppSpaces.spaces_width_15,
        InkWell(
          onTap: () => Navigator.pop(context),
          child: const Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
            size: 30,
          ),
        ),
        AppSpaces.spaces_width_15,
        Text(
          "Appointment List",
          style: Get.textTheme.headline5!.copyWith(fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}
