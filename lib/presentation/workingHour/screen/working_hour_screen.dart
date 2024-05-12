import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/utils/app_spaces.dart';
import '../../_common/widgets/app_loading.dart';
import '../_controller/working_our_controller.dart';

class WorkingHourScreen extends StatelessWidget {
  const WorkingHourScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(AppWorkingHourController());
    AppWorkingHourController.to.loadSlot();
    return Scaffold(
      appBar: AppBar(
        title: Text("Working Hour"),
      ),
      body: _timeSlot(context),
    );
  }

  _timeSlot(BuildContext context) {
    return Obx(() {
      if (AppWorkingHourController.to.timeSlotModel.value.message == null) {
        return Center(
          child: AppLoading(context),
        );
      } else {
        return SingleChildScrollView(
          child: Center(
            child: Container(
              margin: EdgeInsets.all(16),
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                border: Border.all(
                  color: Colors.grey[300]!,
                  width: 1,
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 1,
                    blurRadius: 2,
                    offset: Offset(0, 3), // changes position of shadow
                  ),
                ],
              ),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AppSpaces.spaces_height_15,
                    Container(
                      width: double.infinity,
                      padding: EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        // color: Colors.grey[200],
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                          color: Colors.grey[300]!,
                          width: 1,
                        ),
                      ),
                      child: Text(
                        "Monday: 9:30 am to 7:30 pm",
                        style: Theme.of(context).textTheme.headline6,
                      ),
                    ),
                    AppSpaces.spaces_height_15,
                    Container(
                      width: double.infinity,
                      padding: EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        //   color: Colors.grey[200],
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                          color: Colors.grey[300]!,
                          width: 1,
                        ),
                      ),
                      child: Text(
                        "Tuesday: 9:30 am to 7:30 pm",
                        style: Theme.of(context).textTheme.headline6,
                      ),
                    ),
                    AppSpaces.spaces_height_15,
                    Container(
                      width: double.infinity,
                      padding: EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        // color: Colors.grey[200],
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                          color: Colors.grey[300]!,
                          width: 1,
                        ),
                      ),
                      child: Text(
                        "Wednesday: 9:30 am to 7:30 pm",
                        style: Theme.of(context).textTheme.headline6,
                      ),
                    ),
                    AppSpaces.spaces_height_15,
                    Container(
                      width: double.infinity,
                      padding: EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        //color: Colors.grey[200],
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                          color: Colors.grey[300]!,
                          width: 1,
                        ),
                      ),
                      child: Text(
                        "Thursday: 9:30 am to 7:30 pm",
                        style: Theme.of(context).textTheme.headline6,
                      ),
                    ),
                    AppSpaces.spaces_height_15,
                    Container(
                      width: double.infinity,
                      padding: EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        // color: Colors.grey[200],
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                          color: Colors.grey[300]!,
                          width: 1,
                        ),
                      ),
                      child: Text(
                        "Friday: 9:30 am to 7:30 pm",
                        style: Theme.of(context).textTheme.headline6,
                      ),
                    ),
                    AppSpaces.spaces_height_15,
                    Container(
                      width: double.infinity,
                      padding: EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        //color: Colors.grey[200],
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                          color: Colors.grey[300]!,
                          width: 1,
                        ),
                      ),
                      child: Text(
                        "Saturday: 9:30 am to 7:30 pm",
                        style: Theme.of(context).textTheme.headline6,
                      ),
                    ),
                    AppSpaces.spaces_height_15,
                    Container(
                      width: double.infinity,
                      padding: EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        //  color: Colors.grey[200],
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                          color: Colors.grey[300]!,
                          width: 1,
                        ),
                      ),
                      child: Text(
                        "Sunday: Closed",
                        style: Theme.of(context).textTheme.headline6!.copyWith(color: Colors.red),
                      ),
                    ),
                    AppSpaces.spaces_height_15,
                  ]),
            ),
          ),
        );
      }
    });
  }
}
