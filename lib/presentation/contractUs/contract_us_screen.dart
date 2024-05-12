import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:schedule/core/utils/app_spaces.dart';
import 'package:schedule/core/widgets/app_button.dart';
import 'package:schedule/core/widgets/app_text_filed.dart';
import 'package:schedule/presentation/contractUs/_controller/app_contract_us_controller.dart';

import '';
import '../../core/utils/app_colors.dart';

class ContractUsScreen extends StatelessWidget {
  const ContractUsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AppContractUsController.to.phoneTextEditingController.clear();
    AppContractUsController.to.gmailTextEditingController.clear();
    AppContractUsController.to.messageTextEditingController.clear();
    AppContractUsController.to.nameTextEditingController.clear();

    return Scaffold(
      body: SafeArea(
        child: new SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AppSpaces.spaces_height_25,
              Padding(
                padding: const EdgeInsets.only(right: 16),
                child: Row(
                  children: [
                    Spacer(),
                    InkWell(onTap: () => Get.back(), child: Icon(Icons.close)),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  "Have you any question?",
                  style: Theme.of(context).textTheme.headline2,
                ),
              ),
              AppSpaces.spaces_height_25,
              AppTextFieldWidget(
                  hint: "Name",
                  controller:
                      AppContractUsController.to.nameTextEditingController),
              AppSpaces.spaces_height_15,
              AppTextFieldWidget(
                  hint: "Phone",
                  controller:
                      AppContractUsController.to.phoneTextEditingController),
              AppSpaces.spaces_height_15,
              AppTextFieldWidget(
                  hint: "Email",
                  controller:
                      AppContractUsController.to.gmailTextEditingController),
              AppSpaces.spaces_height_15,
              Center(
                child: Container(
                    height: 200,
                    width: Get.width * 0.9,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        border: Border.all(color: Colors.black)),
                    child: TextField(
                      controller: AppContractUsController
                          .to.messageTextEditingController,
                      keyboardType: TextInputType.multiline,
                      decoration: InputDecoration(
                        hintText: "Write description ...",
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.all(16),
                      ),

                      minLines: 1,
                      //Normal textInputField will be displayed
                      maxLines:
                          5, // when user presses enter it will adapt to it
                    )),
              ),
              AppSpaces.spaces_height_40,
              Center(child: Obx(() {
                return AppButton(
                  onTab: () {
                    AppContractUsController.to.contract(context);
                  },
                  isLoading: AppContractUsController.to.isLoading.value,
                  text: "Submit",
                );
              })),
            ],
          ),
        ),
      ),
    );
  }
}
