import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:schedule/core/appRoutes/app_routes.dart';
import 'package:schedule/core/helper/app_functions.dart';
import 'package:schedule/core/utils/app_colors.dart';
import 'package:schedule/core/utils/app_spaces.dart';
import 'package:schedule/presentation/_common/widgets/app_loading.dart';
import 'package:schedule/presentation/auth/_controller/auth_controller.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../core/utils/app_dimension.dart';
import '../_controller/drawer_controller.dart';

class AppDrawer extends StatelessWidget {
  GlobalKey<ScaffoldState>? globalKey;

  AppDrawer(this.globalKey, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(AppDrawerController(), tag: "AppDrawerController");

    print("Tokennnnn ${AppAuthController.to.token}");

    return Container(
      width: Get.width * 0.6,
      decoration: BoxDecoration(color: AppColors.white),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AppSpaces.spaces_height_20,
          AppSpaces.spaces_height_20,
          AppSpaces.spaces_height_20,
          Align(
            alignment: Alignment.bottomRight,
            child: InkWell(
              onTap: () {
                globalKey!.currentState!.closeEndDrawer();
              },
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Icon(
                  Icons.close_sharp,
                  size: AppDimension.h1 * 2,
                  color: AppColors.primaryColor,
                ),
              ),
            ),
          ),
          AppSpaces.spaces_height_20,
          //  AppSpaces.spaces_height_10,

          Padding(
            padding: const EdgeInsets.only(left: 16.0),
            child: InkWell(
              onTap: () {
                Navigator.pop(context);

                Get.toNamed(AppRoutes.WORKING_HOURS);
              },
              child: Text(
                "Working Hours",
                style: TextStyle(
                    color: AppColors.primaryColor,
                    fontWeight: FontWeight.bold,
                    fontSize: AppDimension.h1),
              ),
            ),
          ),

          AppSpaces.spaces_height_20,

          Padding(
            padding: const EdgeInsets.only(left: 16.0),
            child: InkWell(
              onTap: () {
                Navigator.pop(context);

                Get.toNamed(AppRoutes.APPOINTMENT_LIST);
              },
              child: Text(
                "Appointment List",
                style: TextStyle(
                    color: AppColors.primaryColor,
                    fontWeight: FontWeight.bold,
                    fontSize: AppDimension.h1),
              ),
            ),
          ),

          AppSpaces.spaces_height_20,
          Padding(
            padding: const EdgeInsets.only(left: 16.0),
            child: InkWell(
              onTap: () {
                Navigator.pop(context);
                Get.toNamed(AppRoutes.CONTRACT_US);
              },
              child: Text(
                "Contact us",
                style: TextStyle(
                    color: AppColors.primaryColor,
                    fontWeight: FontWeight.bold,
                    fontSize: AppDimension.h1),
              ),
            ),
          ),

          AppSpaces.spaces_height_15,
          Padding(
            padding: const EdgeInsets.only(left: 16.0),
            child: InkWell(
                onTap: () async {
                  if (!await launchUrl(Uri.parse(
                      "https://scheduler1.baadhan.com/trams/condition"))) {
                    throw Exception(
                        'Could not launch https://scheduler1.baadhan.com/trams/condition');
                  }
                },
                child: Text(
                  "Terms and conditions",
                  style: TextStyle(
                      color: AppColors.primaryColor,
                      fontWeight: FontWeight.bold,
                      fontSize: AppDimension.h1),
                )),
          ),

          AppSpaces.spaces_height_20,

          if (AppAuthController.to.token != null

          /*||
              AppAuthController.to.token!.isNotEmpty*/
          )
            Padding(
              padding: const EdgeInsets.only(left: 16.0),
              child: InkWell(
                onTap: () async {
                  AppLoadingDialog.show(context);

                  await AppDrawerController.to.logOut();

                  await Future.delayed(Duration(seconds: 2));

                  AppLoadingDialog.dispose(context);

                  globalKey!.currentState!.closeEndDrawer();
                },
                child: Text(
                  "Sign out",
                  style: TextStyle(
                      color: AppColors.primaryColor,
                      fontWeight: FontWeight.bold,
                      fontSize: AppDimension.h1),
                ),
              ),
            )
          else
            Padding(
              padding: const EdgeInsets.only(left: 16.0),
              child: InkWell(
                onTap: () async {
                  globalKey!.currentState!.closeEndDrawer();
                  Get.toNamed(AppRoutes.LOG_IN);
                },
                child: Text(
                  "Sign In",
                  style: TextStyle(
                      color: AppColors.primaryColor,
                      fontWeight: FontWeight.bold,
                      fontSize: AppDimension.h1),
                ),
              ),
            ),

          _delete_account(context),

          Spacer(),

          Padding(
            padding: const EdgeInsets.only(left: 16),
            child: FutureBuilder(
                future: AppFunctions.getVersion(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Container();
                  } else if (snapshot.hasError) {
                    return Text(
                      "Version: 1.1.0",
                      style: Get.textTheme.bodySmall!
                          .copyWith(color: AppColors.primaryColor),
                    );
                  } else if (snapshot.hasData) {
                    return Text(
                      "Version: ${snapshot.data}",
                      style: Get.textTheme.bodySmall!
                          .copyWith(color: AppColors.primaryColor),
                    );
                  }

                  return Container();
                }),
          ),
        ],
      ),
    );
  }

  Visibility _delete_account(BuildContext context) {
    return Visibility(
      visible: AppAuthController.to.token != null,
      child: Padding(
        padding: const EdgeInsets.only(left: 8),
        child: TextButton(
          onPressed: () {
            showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                      title: Text("Delete Account"),
                      content: Text(
                          "Are you sure you want to delete your account?",
                          style: TextStyle(
                              color: AppColors.primaryColor,
                              fontWeight: FontWeight.bold,
                              fontSize: AppDimension.h1)),
                      actions: [
                        TextButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: Text("Cancel")),
                        TextButton(
                            onPressed: () async {
                              await AppDrawerController.to
                                  .deleteAccount(context);

                              await Future.delayed(Duration(seconds: 2));

                              AppLoadingDialog.dispose(context);
                              globalKey!.currentState!.closeEndDrawer();

                              // Navigator.pop(context);
                            },
                            child: Text("Delete"))
                      ]);
                });
          },
          child: Text("Delete Account",
              style: TextStyle(
                  color: AppColors.primaryColor,
                  fontWeight: FontWeight.bold,
                  fontSize: AppDimension.h1)),
        ),
      ),
    );
  }
}
