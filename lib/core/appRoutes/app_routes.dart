import 'package:get/get.dart';
import 'package:schedule/presentation/appointmentList/screen/appointment_list_screen.dart';
import 'package:schedule/presentation/auth/screen/change_password.dart';
import 'package:schedule/presentation/auth/screen/email_verification_screen.dart';
import 'package:schedule/presentation/auth/screen/log_in_screen.dart';
import 'package:schedule/presentation/auth/screen/otp_screen.dart';
import 'package:schedule/presentation/auth/screen/registartion_screen.dart';
import 'package:schedule/presentation/contractUs/contract_us_screen.dart';
import 'package:schedule/presentation/home/screen/home_screen.dart';
import 'package:schedule/presentation/onBoading/screen/on_boarding_screen.dart';
import 'package:schedule/presentation/workingHour/screen/working_hour_screen.dart';
import '../../presentation/addSchedule/screen/add_schedule_screen.dart';
import '../../presentation/splashScreen/screen/splash_screen.dart';

class AppRoutes {
  static String INITIAL = "/";
  static String ON_BOARDING = "/boarding";
  static String HOME = "/home";
  static String APPOINTMENT_LIST = "/appointment_list";
  static String LOG_IN = "/log_in";
  static String REGISTRATION = "/registration";
  static String CHNAGE_PASSWORD = "/change_password";
  static String ADD_SCHEDULE = "/add_schedule";
  static String CONTRACT_US = "/contract_us";
  static String OTP_SCREEN = "/otp_screen";
  static String EMAIL_VERIFICATION = "/email_verification";

  static String WORKING_HOURS = "/working_hours";

  static List<GetPage> getAppRoutes() {
    return [
      GetPage(name: AppRoutes.INITIAL, page: () => SplashScreen()),
      //    GetPage(name: AppRoutes.ON_BOARDING, page: () => OnBoardingScreen()),
      GetPage(name: AppRoutes.HOME, page: () => HomeScreen()),
      GetPage(
          name: AppRoutes.APPOINTMENT_LIST,
          page: () => AppointmentListScreen()),
      GetPage(name: AppRoutes.LOG_IN, page: () => LogInScreen()),
      GetPage(name: AppRoutes.REGISTRATION, page: () => RegistrationScreen()),
      GetPage(
          name: AppRoutes.ADD_SCHEDULE,
          page: () => AddScheduleScreen()),
 /*     GetPage(
          name: AppRoutes.CHNAGE_PASSWORD, page: () => ChangePasswordScreen()),*/
      GetPage(name: AppRoutes.CONTRACT_US, page: () => ContractUsScreen()),
      GetPage(
          name: AppRoutes.OTP_SCREEN,
          page: () => OtpScreen(
                email: Get.arguments[0],
                isFromRegistrationPage: Get.arguments[1],
              )),
/*      GetPage(
          name: AppRoutes.EMAIL_VERIFICATION,
          page: () => EmailVerificationScreen()),*/
      GetPage(name: AppRoutes.WORKING_HOURS, page: () => WorkingHourScreen())
    ];
  }
}
