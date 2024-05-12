import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:schedule/presentation/home/model/our_staff_model.dart';

import '../../../../core/appRemote/app_url.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_dimension.dart';
import '../../_controller/app_home_controller.dart';

class MeetOurStaff extends StatelessWidget {
  const MeetOurStaff({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return _meet_our_staff();
  }

  _meet_our_staff() {
    return Container(
      height: 260,
      width: Get.width,
      decoration: BoxDecoration(color: AppColors.white),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              "Meet Our Staff",
              style: TextStyle(
                  color: AppColors.black,
                  fontSize: AppDimension.h2,
                  fontWeight: FontWeight.w700),
            ),
          ),
          Obx(
            () {

              if(AppHomeController.to.ourStaffModel.value.data != null || AppHomeController.to.ourStaffModel.value.data!.isEmpty){

                return Container();
              }
              if (AppHomeController.to.ourStaffModel.value.data!.isNotEmpty ) {
                return Row(
                  children:
                      AppHomeController.to.ourStaffModel.value.data!.map((e) {
                    return Container(
                      margin: const EdgeInsets.only(left: 16),
                      height: 180,
                      width: 120,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: NetworkImage(
                                  AppUrls.staffImageBase + "${e.image!}"),
                              fit: BoxFit.cover)),
                      child: Stack(
                        children: [
                          Positioned.fill(
                              child: Container(
                            color: AppColors.black.withOpacity(0.4),
                          )),
                          Align(
                            alignment: Alignment.bottomCenter,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                e.name ?? "",
                                style: TextStyle(
                                    color: AppColors.white,
                                    fontSize: AppDimension.b2,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          )
                        ],
                      ),
                    );
                  }).toList(),
                );
              } else {
                return Container();
              }
            },
          )
        ],
      ),
    );
  }
}
