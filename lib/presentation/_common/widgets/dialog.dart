import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppDialogWidget extends StatelessWidget {
  const AppDialogWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: Get.width * 0.8,
        height: Get.width * 0.3,
        child: Container(
          child: Column(
            children: [
              Text("Aer")
              
            ],
          ),
        ),
      ),
    );
  }
}
