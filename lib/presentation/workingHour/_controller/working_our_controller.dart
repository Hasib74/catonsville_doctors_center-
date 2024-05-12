import 'package:get/get.dart';

import '../../addSchedule/_controller/appointment_controller.dart';
import '../../addSchedule/model/time_slot_model.dart';


class AppWorkingHourController extends GetxController {
  static AppWorkingHourController to = Get.find();

  RxBool loading = false.obs;
  Rx<TimeSlotModel> timeSlotModel = TimeSlotModel().obs;

  loadSlot() async {

   Get.put(AppAppointmentController());
    loading = true.obs;
    timeSlotModel.value =
        await AppAppointmentController.to.getAllTimeSlot(Get.context!);
    loading = false.obs;
  }
}
