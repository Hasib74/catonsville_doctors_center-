import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:schedule/core/utils/app_assets.dart';
import 'package:schedule/core/utils/app_spaces.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_dimension.dart';
import '../../../addSchedule/screen/add_schedule_screen.dart';

class HomeBanner extends StatelessWidget {
  const HomeBanner({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return _banner();
  }

  _banner() {
    return Container(
      decoration: BoxDecoration(color: AppColors.white),
      padding: EdgeInsets.all(10),
      height: 180,
      width: Get.width,
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AppSpaces.spaces_height_20,
              Text(
                "Book Your",
                style: TextStyle(
                    color: AppColors.primaryColor,
                    fontWeight: FontWeight.w400,
                    fontSize: AppDimension.h2,
                    shadows: [
                      BoxShadow(
                          color: AppColors.black.withOpacity(0.4),
                          spreadRadius: 10)
                    ]),
              ),
              AppSpaces.spaces_height_10,
              Text(
                "APPOINTMENT NOW",
                style: TextStyle(
                    color: AppColors.black,
                    fontWeight: FontWeight.w300,
                    fontSize: AppDimension.h1,
                    shadows: [
                      BoxShadow(
                          color: AppColors.primaryColor.withOpacity(0.4),
                          spreadRadius: 10)
                    ]),
              ),
              AppSpaces.spaces_height_20,
              ElevatedButton(
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(
                          AppColors.primaryColor)),
                  onPressed: () {
                    Get.dialog(AddScheduleScreen());
                  },
                  child: Text(
                    "Book now",
                    style: TextStyle(
                        fontSize: AppDimension.h1, fontWeight: FontWeight.bold),
                  ))
            ],
          ),
          Spacer(),
          Image(
            width: 120,
            image: AssetImage(
              AppAssets.hire_cuting,
            ),
            fit: BoxFit.cover,
          ),
        ],
      ),
    );
  }
}
