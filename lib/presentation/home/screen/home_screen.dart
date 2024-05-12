import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:schedule/core/utils/app_assets.dart';
import 'package:schedule/core/utils/app_colors.dart';
import 'package:schedule/core/utils/app_dimension.dart';
import 'package:schedule/core/utils/app_spaces.dart';
import 'package:schedule/presentation/home/_controller/app_home_controller.dart';
import 'package:schedule/presentation/home/screen/sections/home_banner.dart';
import 'package:schedule/presentation/home/screen/sections/our_service.dart';
import 'package:schedule/presentation/home/screen/sections/shop_location.dart';
import 'package:schedule/presentation/home/screen/sections/video_section.dart';
import '../../addSchedule/screen/add_schedule_screen.dart';
import '../../drawer/screen/app_drawer.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  GlobalKey<ScaffoldState> _globalKey = new GlobalKey();

  @override
  initState() {
    print("HomeScreen : initState");
    super.initState();
  }

  @override
  dispose() {
    print("HomeScreen : dispose");
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    AppHomeController.to.getAllStaff(context);
    AppHomeController.to.getServiceList(context);

    //jdsjfjd

    return Scaffold(
      key: _globalKey,
      endDrawer: AppDrawer(_globalKey),
      backgroundColor: AppColors.backgroundColor,
      floatingActionButton: InkWell(
        onTap: () {
          Get.dialog(AddScheduleScreen());
        },
        child: Container(
            width: 160,
            height: 44,
            decoration: BoxDecoration(
                color: AppColors.primaryColor,
                borderRadius: const BorderRadius.all(Radius.circular(20))),
            child: Center(
                child: Text("Book now",
                    style: Get.textTheme.headline6!
                        .copyWith(color: AppColors.white, fontSize: 18)))),
      ),
      body: SafeArea(
        child: SizedBox(
          width: Get.width,
          height: Get.height,
          child: Column(
            children: [
              AppSpaces.spaces_height_20,
              _app_bar(),
              Expanded(
                child: SingleChildScrollView(
                  child: new Column(
                    children: [
                      AppSpaces.spaces_height_20,
                      HomeBanner(),
                      AppSpaces.spaces_height_20,
                      VideoSection(),
                      //  AppSpaces.spaces_height_20,
                      //_what_we_offer(),
                      AppSpaces.spaces_height_20,
                      OurService(),
                      AppSpaces.spaces_height_20,
                      //  MeetOurStaff(),
                      ShopLocation(),
                      AppSpaces.spaces_height_20,
                      AppSpaces.spaces_height_20,
                      AppSpaces.spaces_height_20,
                      AppSpaces.spaces_height_20,
                      AppSpaces.spaces_height_20,
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  _app_bar() {
    return Row(
      children: [
        AppSpaces.spaces_width_15,
        Expanded(
          child: AutoSizeText(
            "Catonsville Doctors Center",
            style: TextStyle(
                fontSize: AppDimension.h1,
                fontWeight: FontWeight.bold,
                color: Color(0xffA30335)),
          ),
        ),
        InkWell(
          onTap: () {
            _globalKey.currentState!.openEndDrawer();
          },
          child: Image(
            image: AssetImage(
              AppAssets.menu,
            ),
            color: AppColors.primaryColor,
            height: 20,
            width: 30,
          ),
        ),
        AppSpaces.spaces_width_15,
      ],
    );
  }
}
