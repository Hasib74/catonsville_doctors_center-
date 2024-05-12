import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '';
import '../../../../core/appRemote/app_url.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_dimension.dart';
import '../../../../generated/assets.dart';
import '../../_controller/app_home_controller.dart';
import '../../widgets/products_widget.dart';

class OurService extends StatelessWidget {
  const OurService({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return _our_products();
  }

  _our_products() {
    return Container(
      color: AppColors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              "Our Services",
              style: TextStyle(
                  color: AppColors.black,
                  fontSize: AppDimension.h1 * 1.4,
                  fontWeight: FontWeight.w500),
            ),
          ),
          SizedBox(
            //height: 220,
            width: Get.width,
            child: CarouselSlider(
              options: CarouselOptions(


                viewportFraction: 1,
                autoPlay: true,
                //aspectRatio: 6/3
              ),
              items: [
                Image(
                  image: AssetImage(Assets.images01),
                  fit: BoxFit.cover,
                ),
                Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Image(image: AssetImage(Assets.images02), fit: BoxFit.cover),
                ),
                Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Image(image: AssetImage(Assets.images03), fit: BoxFit.cover),
                ),
                Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Image(image: AssetImage(Assets.images04), fit: BoxFit.cover),
                ),
                Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Image(image: AssetImage(Assets.images05), fit: BoxFit.cover),
                ),
                Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Image(image: AssetImage(Assets.images06), fit: BoxFit.cover),
                ),
                //  Image(image: AssetImage(Assets.images07)),
              ],
            ),
          ),

          /*  Obx(() {
            if (AppHomeController.to.serviceListModel.value.success == null) {
              return Container();
            } else {
              return
            }
          }),*/
        ],
      ),
    );
  }
}
