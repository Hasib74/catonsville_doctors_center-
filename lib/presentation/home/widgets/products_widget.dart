import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:image_fade/image_fade.dart';

import '../../../core/utils/app_assets.dart';
import '../../../core/utils/app_colors.dart';
import '../../../core/utils/app_dimension.dart';
import '../../../core/utils/app_spaces.dart';

class ProductWidget extends StatelessWidget {
  final String image;

  final String name;

  final String price;

  final String description;

  const ProductWidget(
      {Key? key,
      required this.description,
      required this.image,
      required this.price,
      required this.name})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      width: Get.width,
      decoration: BoxDecoration(color: AppColors.white),
      child: Container(
        decoration: const BoxDecoration(),
        child: Stack(
          children: [
            Positioned.fill(child: _image()),
            Positioned.fill(
                child: Container(
              color: AppColors.black.withOpacity(0.05),
            )),
            Positioned.fill(
                child: Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Spacer(),
                  Text(
                    name,
                    style:TextStyle(
                      color: AppColors.white,
                      fontSize: AppDimension.h2,
                      fontWeight: FontWeight.w500),
                  ),
                  Text(
                    "${price}",
                    style:  TextStyle(
                      color: AppColors.primaryColor,
                      fontSize: AppDimension.h2,
                      fontWeight: FontWeight.bold),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "${description}",
                      maxLines: 3,
                      style:  TextStyle(
                        color: AppColors.white,
                        fontSize: AppDimension.h1,
                        fontWeight: FontWeight.w400),
                    )
                  ),
                  Spacer(),
                ],
              ),
            ))
          ],
        ),
      ),
    );
  }

  ImageFade _image() {
    return ImageFade(
      image: NetworkImage(
        image,
      ),

      alignment: Alignment.center,
      fit: BoxFit.cover,

      duration: const Duration(milliseconds: 900),

      // if the image is loaded synchronously (ex. from memory), fade in faster:
      syncDuration: const Duration(milliseconds: 150),

      placeholder: Container(
        color: const Color(0xFFCFCDCA),
        alignment: Alignment.center,
        child: const Icon(Icons.photo, color: Colors.white30, size: 128.0),
      ),

      // shows progress while loading an image:
      loadingBuilder: (context, progress, chunkEvent) =>
          Center(child: CircularProgressIndicator(value: progress)),

      // displayed when an error occurs:
      errorBuilder: (context, error) => Container(
        color: const Color(0xFF6F6D6A),
        alignment: Alignment.center,
        child: const Icon(Icons.warning, color: Colors.black26, size: 128.0),
      ),
    );
  }
}
