import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:schedule/core/appRemote/app_url.dart';
import 'package:schedule/core/localDB/local_database_manager.dart';
import 'package:schedule/core/utils/app_colors.dart';
import 'package:schedule/core/widgets/app_toast.dart';

class AppAuthController extends GetxController {
  static AppAuthController to = Get.find();

  TextEditingController emailController = new TextEditingController();
  TextEditingController passwordController = new TextEditingController();

  TextEditingController newPasswordController = new TextEditingController();

  TextEditingController firstNameController = new TextEditingController();

  TextEditingController lastNameController = new TextEditingController();

  TextEditingController addressController = new TextEditingController();
  TextEditingController phoneController = new TextEditingController();

  TextEditingController confirmPasswordController = new TextEditingController();

  TextEditingController otpTextEditingController = new TextEditingController();

  String? token;

  RxBool isTramsSelected = false.obs;

  RxBool isLoading = false.obs;

  logIn(BuildContext context) async {
    if (_loginValidation(context)) {
      isLoading.value = true;

      Map _body = {
        "email": emailController.value.text,
        "password": passwordController.value.text,
      };

      print("Body is : ${_body}");

      http.Response _res =
          await http.post(Uri.parse(AppUrls.logIn), body: _body);

      isLoading.value = false;

      print("Log in response : ${_res.body}");

      if (_res.statusCode == 200) {
        token = jsonDecode(_res.body)["token"];

        printInfo(info: "Token is : ${token}");

        AppLocalDatabaseManager().setToken(token!);

        AppAuthController.to.token = token;
        emailController.clear();
        passwordController.clear();
        emailController.clear();
        passwordController.clear();
        addressController.clear();
        passwordController.clear();
        firstNameController.clear();
        lastNameController.clear();
        confirmPasswordController.clear();

        Get.back(result: token!);
      } else {
        // AnimatedSnackBar.rectangle(
        //         "Request Failed", jsonDecode(_res.body)["message"],
        //         type: AnimatedSnackBarType.error)
        //     .show(context);

        AppToast.showErrorMessage(
            context: context, msg: jsonDecode(_res.body)["message"]);
      }
    }
  }

  Future<bool> signUp(BuildContext context) async {
    if (!isTramsSelected.value) {
      AppToast.showErrorMessage(
          context: context, msg: "Please accept terms and conditions");
      return false;
    }
    bool isSuccess = false;
    isLoading.value = true;

    Map _body = {
      "first_name": firstNameController.value.text,
      "last_name": lastNameController.value.text,
      "email": emailController.value.text,
      "phone": phoneController.value.text,
      "password": passwordController.value.text,
      "c_password": confirmPasswordController.value.text,
    };

    print("Body is : ${_body}");

    http.Response _res =
        await http.post(Uri.parse(AppUrls.registration), body: _body);

    isLoading.value = false;

    print("Log in response : ${_res.body}");

    if (_res.statusCode == 200 || _res.statusCode == 201) {
      logIn(context);



      isSuccess = true;
    } else {
      String _outPut = "";
      Map<String, dynamic> _errorRes = jsonDecode(_res.body)["error"];

      _errorRes.values.forEach((element) {
        print("Response : ${element}");

        _outPut +=
            element.toString().replaceAll("[", "").replaceAll("]", "") + "\n";
      });

      // AnimatedSnackBar.rectangle("Request Failed", _outPut,
      //         type: AnimatedSnackBarType.error)
      //     .show(context);
      AppToast.showErrorMessage(context: context, msg: "${_outPut}");

      isSuccess = false;
    }

    return isSuccess;
  }

  bool _loginValidation(BuildContext context) {
    bool _isValid = false;

    if (emailController.value.text.isEmpty) {
      _isValid = false;

      // AnimatedSnackBar.rectangle("Validation Error", "Email con not be empty.",
      //         type: AnimatedSnackBarType.error)
      //     .show(context);

      /*ScaffoldMessenger.of(context)
          .showSnackBar(new SnackBar(content: Text("Email con not be empty.")));*/

      AppToast.showErrorMessage(
          context: context, msg: "Email con not be empty.");
    } else if (passwordController.value.text.isEmpty) {
      _isValid = false;

      // AnimatedSnackBar.rectangle("Validation Error", "Email con not be empty.",
      //         type: AnimatedSnackBarType.error)
      //     .show(context);

      /* ScaffoldMessenger.of(context).showSnackBar(
          new SnackBar(content: Text("Password con not be empty.")));*/

      AppToast.showErrorMessage(
          context: context, msg: "Password can not be empty.");
    } else {
      _isValid = true;
    }

    return _isValid;
  }

  @override
  onInit() {
    String? _token = AppLocalDatabaseManager().getToken();

    if (_token == null || _token.isEmpty) {
      print("User not log in");
    } else {
      token = _token;

      AppLocalDatabaseManager().setToken(token!);

      print("Token is : ${token}");
    }
  }

/*  Future<bool> ChangePasswordScreen(BuildContext context) async {
    bool isSuccess;
    if (emailController.value.text.isNotEmpty &&
        newPasswordController.value.text.isNotEmpty &&
        confirmPasswordController.value.text.isNotEmpty &&
        newPasswordController.value.text ==
            confirmPasswordController.value.text) {
      Map<String, String> _body = {
        "email": emailController.value.text,
        "c_password": confirmPasswordController.value.text,
        "password": newPasswordController.value.text,
      };

      isLoading(true);

      http.Response res =
          await http.post(Uri.parse(AppUrls.verifyOtp), body: _body);

      printInfo(info: "Forgot password response : ${res.body}");

      isLoading(false);

      if (res.statusCode == 200) {
        isSuccess = true;
        AppToast.showSuccessMessage(
            context: context, msg: "Successfully changed password.");

        //Get.back();
      } else {
        isSuccess = false;
        AppToast.showErrorMessage(
            context: context, msg: jsonDecode(res.body)["error"]);
      }
    } else {
      if (emailController.value.text.isEmpty ||
          newPasswordController.value.text.isEmpty ||
          confirmPasswordController.value.text.isEmpty) {
        AppToast.showErrorMessage(
            context: context, msg: "Field cannot be empty.");

        isSuccess = false;
      } else if (newPasswordController.value.text !=
          confirmPasswordController.value.text) {
        AppToast.showErrorMessage(
            context: context,
            msg: "New password and confirm password does not match.");

        isSuccess = false;
      }

      isSuccess = false;
    }

    return isSuccess;
  }

  Future<bool> mailVarificationAndSendCodeToMail(BuildContext context) async {
    bool? _isSuccess;

    if (emailController.value.text.isEmpty) {
      AppToast.showErrorMessage(
          context: context, msg: "Email can not be empty.");
    } else {
      isLoading(true);
      Map _body = {"email": emailController.value.text};

      var _res =
          await http.post(Uri.parse(AppUrls.ChangePasswordScreen), body: _body);

      isLoading(false);

      print("Otp response : ${_res.body}");

      if (_res.statusCode == 200) {
        _isSuccess = true;
      } else {
        _isSuccess = false;
      }
    }

    return _isSuccess!;
  }*/

  Future<bool> verifyOtp(BuildContext context, String otp) async {
    bool? _isSuccess;

    if (emailController.value.text.isEmpty) {
      AppToast.showErrorMessage(
          context: context, msg: "Email can not be empty.");
    } else {
      isLoading(true);
      Map _body = {"otp_code": otp};

      var _res =
          await http.post(Uri.parse(AppUrls.verifyOtp), body: _body);

      isLoading(false);

      print("Otp response : ${_res.body}");

      if (jsonDecode(_res.body)["success"] != "false") {
        _isSuccess = true;
      } else {
        _isSuccess = false;
      }
    }

    return _isSuccess!;
  }

  Future<bool> resendOtp(String email) async {
    bool _isSuccess = false;

    Map _body = {"email": email};

    var _res = await http.post(
        Uri.parse(
          AppUrls.resendOtp,
        ),
        body: _body);

    isLoading(false);

    print("Otp response : ${_res.body}");

    if (_res.statusCode == 200) {
      _isSuccess = true;
    } else {
      _isSuccess = false;
    }

    return _isSuccess;
  }
}
