import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:schedule/core/localDB/local_database_manager.dart';
import 'package:schedule/presentation/addSchedule/_controller/appointment_controller.dart';
import 'package:schedule/presentation/appointmentList/controller/app_appointment_list_controller.dart';
import 'package:schedule/presentation/auth/_controller/auth_controller.dart';
import 'package:schedule/presentation/contractUs/_controller/app_contract_us_controller.dart';
import 'package:schedule/presentation/home/_controller/app_home_controller.dart';

import 'core/appRoutes/app_routes.dart';
import 'core/utils/app_colors.dart';
import 'core/utils/app_theme.dart';


void main() {

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    _injection();
    SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(statusBarColor: AppColors.primaryColor
            //color set to purple or set your own color
            ));

    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: appTheme(),
      getPages: AppRoutes.getAppRoutes(),
      initialRoute: AppRoutes.INITIAL,
      // initialRoute: AppRoutes.SLIVER_SCROLL_PRACTICES,
    );
  }

  void _injection() async {
    AppLocalDatabaseManager();
    Future.delayed(Duration(seconds: 1)).then((value) {
      Get.put(AppAuthController(), permanent: true);
      Get.put(AppAppointmentController(), permanent: true);
      Get.put(AppAppointmentListController(), permanent: true);
      Get.put(AppHomeController(), permanent: true);
      Get.put(AppContractUsController(), permanent: true);
    });
  }
}
