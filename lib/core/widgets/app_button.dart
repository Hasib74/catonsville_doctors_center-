import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loading_indicator/loading_indicator.dart';

import '../utils/app_colors.dart';

Widget AppButton(
        {Widget? child,
        VoidCallback? onTab,
        double? height,
        double? width,
        required String? text,
        bool isLoading = false}) =>
    AbsorbPointer(
      absorbing: isLoading,
      child: Container(
        width: Get.width * 0.94,
        height: 42,
        child: ElevatedButton(
            style: ElevatedButton.styleFrom(
                shadowColor: AppColors.primaryColor,
                backgroundColor: AppColors.primaryColor,

                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    side: BorderSide(color: AppColors.primaryColor))),
            onPressed: onTab,
            child: isLoading
                ? LoadingIndicator(
                    indicatorType: Indicator.lineSpinFadeLoader,

                    /// Required, The loading type of the widget
                    colors: const [Colors.white],

                    /// Optional, The color collections
                    strokeWidth: 2,

                    /// Optional, The stroke of the line, only applicable to widget which contains line
                    backgroundColor: AppColors.primaryColor,

                    /// Optional, Background of the widget
                    // pathBackgroundColor: Colors.black

                    /// Optional, the stroke backgroundColor
                  )
                : Text(
                    text ?? "",
                    style: TextStyle(
                        color: AppColors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                  )),
      ),
    );
