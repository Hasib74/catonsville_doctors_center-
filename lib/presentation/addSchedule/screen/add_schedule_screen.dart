import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loading_indicator/loading_indicator.dart';
import 'package:schedule/core/appRoutes/app_routes.dart';
import 'package:schedule/core/utils/app_colors.dart';
import 'package:schedule/core/utils/app_spaces.dart';
import 'package:schedule/core/widgets/app_button.dart';
import 'package:schedule/presentation/_common/widgets/app_loading.dart';
import 'package:schedule/presentation/addSchedule/_controller/appointment_controller.dart';
import 'package:schedule/presentation/appointmentList/controller/app_appointment_list_controller.dart';

import '../../../core/packages/calenderStrip/calender_strip.dart';

class AddScheduleScreen extends StatelessWidget {
  bool? isReScheduler;

  var reSchedulerTime;
  String? reSchedulerDate;
  String? reSchedulerDescription;
  int? scheduleId;

  AddScheduleScreen(
      {Key? key,
      this.reSchedulerTime,
      this.reSchedulerDate,
      this.reSchedulerDescription,
      this.isReScheduler,
      this.scheduleId})
      : super(key: key);

  DateTime startDate = DateTime.now().subtract(Duration(days: 0));
  DateTime endDate = DateTime.now().add(Duration(days: 30));
  DateTime selectedDate = DateTime.now().subtract(Duration(days: 2));
  List<DateTime> markedDates = [DateTime.now()];

  onSelect(data) {
    print("Selected Date -> $data");

    List _date = data.toString().split(" ");
    List _finalDate = _date[0].toString().split("-");
    AppAppointmentController.to.selectedDate =
        _finalDate[2] + "/" + _finalDate[1] + "/" + _finalDate[0];
  }

  onWeekSelect(data) {
    print("Selected week starting at -> $data");
  }

  _monthNameWidget(monthName) {
    return Container(
      child: Text(monthName,
          style: TextStyle(
              fontSize: 10,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
              fontStyle: FontStyle.normal)),
      padding: EdgeInsets.only(top: 8, bottom: 4),
    );
  }

  getMarkedIndicatorWidget() {
    return Row(mainAxisAlignment: MainAxisAlignment.center, children: [
      Container(
        margin: EdgeInsets.only(left: 1, right: 1),
        width: 7,
        height: 7,
        decoration: BoxDecoration(shape: BoxShape.circle, color: Colors.red),
      ),
      Container(
        width: 7,
        height: 7,
        decoration: BoxDecoration(shape: BoxShape.circle, color: Colors.blue),
      )
    ]);
  }

  dateTileBuilder(
      date, selectedDate, rowIndex, dayName, isDateMarked, isDateOutOfRange) {
    bool isSelectedDate = date.compareTo(selectedDate) == 0;
    Color fontColor = isDateOutOfRange
        ? Colors.black26
        : isSelectedDate
            ? Colors.white
            : Colors.black87;
    TextStyle normalStyle =
        TextStyle(fontSize: 10, fontWeight: FontWeight.w800, color: fontColor);
    TextStyle selectedStyle = TextStyle(
        fontSize: 10, fontWeight: FontWeight.w800, color: Colors.white);
    TextStyle dayNameStyle = TextStyle(fontSize: 10, color: fontColor);
    List<Widget> _children = [
      Text(dayName, style: dayNameStyle),
      Text(date.day.toString(),
          style: !isSelectedDate ? normalStyle : selectedStyle),
    ];

    if (isDateMarked == true) {
      _children.add(getMarkedIndicatorWidget());
    }

    return AnimatedContainer(
      duration: Duration(milliseconds: 150),
      alignment: Alignment.center,
      padding: EdgeInsets.only(top: 8, left: 5, right: 5, bottom: 5),
      decoration: BoxDecoration(
        color: !isSelectedDate ? Colors.transparent : AppColors.primaryColor,
        //borderRadius: BorderRadius.all(Radius.circular(60)),
      ),
      child: Column(
        children: _children,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    AppAppointmentController.to.descriptionController.clear();
    AppAppointmentController.to.isLoading.value = false;

    if (isReScheduler != null && isReScheduler == true) {
      _reSchulderDataSet();
    }

    AppAppointmentController.to.selectedDate = (selectedDate.day.toString() +
        "/" +
        selectedDate.month.toString() +
        "/" +
        selectedDate.year.toString()) as String;

    AppAppointmentController.to.getAllTimeSlot(context);

    return Scaffold(
      body: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Align(
            alignment: Alignment.topRight,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: InkWell(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Icon(
                  Icons.close,
                  color: AppColors.primaryColor,
                  size: 25,
                ),
              ),
            ),
          ),
          Container(
              height: 100,
              child: CalendarStrip(
                startDate: startDate,
                endDate: endDate,
                onDateSelected: onSelect,
                onWeekSelected: onWeekSelect,
                dateTileBuilder: dateTileBuilder,
                iconColor: Colors.black87,
                monthNameWidget: _monthNameWidget,
                markedDates: markedDates,
                containerDecoration: BoxDecoration(color: AppColors.white),
              )),
          AppSpaces.spaces_height_20,
          Expanded(
            child: new Container(
              child: Column(
                children: [
                  Expanded(child: _timeSlot(context)),
                  AppSpaces.spaces_height_20,
                  Container(
                    height: 190,
                    decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                              color: AppColors.grey.withOpacity(0.6),
                              spreadRadius: 1,
                              blurRadius: 1)
                        ],
                        color: AppColors.white,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(16),
                            topRight: Radius.circular(16))),
                    child: Column(
                      children: [
                        AppSpaces.spaces_height_20,
                        Expanded(
                          child: Container(
                              //height: 200,
                              width: Get.width * 0.9,
                              decoration: BoxDecoration(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(16)),
                                  border: Border.all(
                                      color: AppColors.primaryColor)),
                              child: TextField(
                                controller: AppAppointmentController
                                    .to.descriptionController,
                                keyboardType: TextInputType.multiline,
                                decoration: InputDecoration(
                                  hintText: "Write description ...",
                                  border: InputBorder.none,
                                  contentPadding: EdgeInsets.all(16),
                                ),

                                minLines: 1,
                                //Normal textInputField will be displayed
                                maxLines:
                                    5, // when user presses enter it will adapt to it
                              )),
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: Obx(() {
                                return Padding(
                                  padding: const EdgeInsets.all(16.0),
                                  child: AppButton(
                                      text: isReScheduler != null
                                          ? "Update Schedule"
                                          : "Book Now",
                                      isLoading: AppAppointmentController
                                          .to.isLoading.value,
                                      onTab: () async {
                                        if (isReScheduler != null) {
                                          bool _isUpdated =
                                              await AppAppointmentController.to
                                                  .updateScheduler(
                                                      context, scheduleId);

                                          if (_isUpdated) {
                                            Navigator.pop(context, true);
                                          }
                                        } else {
                                          AppAppointmentController.to
                                              .createBook(context);
                                        }
                                      }),
                                );
                              }),
                            ),
                          ],
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  _timeSlot(BuildContext context) {
    return Obx(() {
      if (AppAppointmentController.to.timeSlotModel.value.message == null) {
        return Center(
          child: AppLoading(context),
        );
      } else {
        return SingleChildScrollView(
          child: Wrap(
              direction: Axis.horizontal,
              children: AppAppointmentController.to.timeSlotModel.value.message!
                  .asMap()
                  .values
                  .map((e) => Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: InkWell(
                          onTap: () {
                            AppAppointmentController.to.selectedSlot.value =
                                e.id!.toInt();
                          },
                          child: Container(
                            //width: 180,
                            height: 40,
                            //  margin: const EdgeInsets.only(left: 16, right: 16),
                            padding: const EdgeInsets.only(left: 16, right: 16),
                            decoration: BoxDecoration(
                                color: AppAppointmentController
                                            .to.selectedSlot.value ==
                                        e.id!.toInt()
                                    ? AppColors.primaryColor
                                    : Colors.white,
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(20)),
                                border:
                                    Border.all(color: AppColors.primaryColor)),
                            child: Center(
                              child: Text(
                                "${e.timeFrom} to ${e.timeTo}",
                                style: TextStyle(
                                    color: AppAppointmentController
                                                .to.selectedSlot.value ==
                                            e.id!.toInt()
                                        ? AppColors.white
                                        : AppColors.black),
                              ),
                            ),
                          ),
                        ),
                      ))
                  .toList()),
        );
      }
    });
  }

  void _reSchulderDataSet() {
    var _date = reSchedulerDate!.split("/");
    startDate =
        DateTime(int.parse(_date[2]), int.parse(_date[1]), int.parse(_date[0]));

    AppAppointmentController.to.selectedSlot.value =
        int.parse(reSchedulerTime.toString());

    AppAppointmentController.to.descriptionController.text =
        reSchedulerDescription ?? "";
  }
}
