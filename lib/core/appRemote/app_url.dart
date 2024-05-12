class AppUrls {
  //static String _baseUrl = "https://scheduler1.baadhan.com/api/";
 // static String _baseUrl = "http://scheduler.tech365.cloud/api/";
  static String _baseUrl = "https://catonsville-doctors-center.tech365.cloud/api/";
/*  static String staffImageBase =
      "http://scheduler.tech365.cloud/assets/image/staffImag/"; */

  static String staffImageBase =
      "https://catonsville-doctors-center.tech365.cloud/assets/image/staffImag/";
  static String serviceImageBase = "https://catonsville-doctors-center.tech365.cloud/services/";

  static String logIn = "${_baseUrl}user/login";
  static String registration = "${_baseUrl}user/registration";
  static String all_time_slot = "${_baseUrl}all-time-slot";
  static String create_booking = "${_baseUrl}create/appointment/booking";
  static String appointment_list = "${_baseUrl}appointment/booking/list";
  static String re_sceduler = "${_baseUrl}booking/reschedule/";
  static String delete = "${_baseUrl}booking/cancel/";
  static String meetOurStaff = "${_baseUrl}meetOurStaff";
  static String serviceList = "${_baseUrl}services/list";
  static String verifyOtp = "${_baseUrl}verify/otp";
  static String resendOtp = "${_baseUrl}resend/otp";
}
