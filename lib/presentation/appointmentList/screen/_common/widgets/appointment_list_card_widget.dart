import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_spaces.dart';
import '../../../../addSchedule/screen/add_schedule_screen.dart';

class AppointmentListCardWidget extends StatelessWidget {
  final id;
  final schedule;
  final date;
  final remainingTime;
  final created_at;

  final description;

  final VoidCallback? onEditClick;
  final VoidCallback? onDeleteClick;

  const AppointmentListCardWidget(
      {Key? key,
      this.id,
      this.date,
      this.remainingTime,
      this.schedule,
      this.description,
      this.onDeleteClick,
      this.created_at,
      this.onEditClick})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    print("description :: ${description}");
    return Container(
      margin: EdgeInsets.all(16),
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(color: AppColors.white),
      // height: 200,
      width: Get.width * 0.9,
      child: Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //AppSpaces.spaces_height_1,

              Row(
                children: [
                  Text(
                    id ?? "",
                    style:  Get.textTheme.bodySmall!.copyWith(color: AppColors.black,fontWeight: FontWeight.bold),
                  ),
                  Spacer(),
                  _edit_and_delete(context)
                ],
              ),
              AppSpaces.spaces_height_5,
              Text(
                date ?? "",
                style:
                Get.textTheme.bodySmall!.copyWith(color: AppColors.black,fontWeight: FontWeight.w500),
              ),

              AppSpaces.spaces_height_5,
              Text(
                schedule ?? "",
                style:
                Get.textTheme.bodySmall!.copyWith(color: AppColors.black,fontWeight: FontWeight.w500),
              ),
              AppSpaces.spaces_height_5,
              Text(
                "${created_at}",
                style:
                    Get.textTheme.bodySmall!.copyWith(color: AppColors.black,fontWeight: FontWeight.w500),
              ),
              AppSpaces.spaces_height_5,

              Text(
                remainingTime ?? "",
                style:
                    Get.textTheme.bodySmall!.copyWith(color: AppColors.black),
              ),

              description == null ? Container() : AppSpaces.spaces_height_10,
              description == null ? Container() : AppSpaces.spaces_height_10,

              Visibility(
                visible: description != null,
                child: Text(
                  description ?? "",
                  style: Get.textTheme.bodySmall!.copyWith(
                      color: AppColors.black, fontWeight: FontWeight.normal),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  _edit_and_delete(BuildContext context) {
    return Row(
      children: [
        InkWell(
            onTap: () {
              onEditClick!();
            },
            child: Icon(
              Icons.edit,
              color: AppColors.primaryColor,
            )),
        AppSpaces.spaces_width_20,
        InkWell(
            onTap: () async {
              var res = await showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      title:
                          const Text("Do you want to cancel this schedule ?"),
                      actions: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: InkWell(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child: const Text(
                              "No",
                              style: TextStyle(color: Colors.green),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: InkWell(
                            onTap: () {
                              Navigator.pop(context, true);
                            },
                            child: const Text("Yes",
                                style: TextStyle(color: Colors.red)),
                          ),
                        )
                      ],
                    );
                  });

              if (res) {
                onDeleteClick!();
              }
            },
            child: Icon(
              Icons.delete,
              color: AppColors.primaryColor,
            ))
      ],
    );
  }

  PopupMenuItem _buildPopupMenuItem(String title, int item) {
    return PopupMenuItem(
      /*    onTap: onTap,*/
      value: item,
      child: Row(
        children: [
          // Icon(iconData, color: Colors.black,),
          Text(title),
        ],
      ),
    );
  }
}
