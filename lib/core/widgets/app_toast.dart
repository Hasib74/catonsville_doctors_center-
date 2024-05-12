import 'package:animated_snack_bar/animated_snack_bar.dart';
import 'package:flutter/material.dart';

class AppToast {
  static showSuccessMessage({String? msg, required BuildContext context}) {
    return AnimatedSnackBar.rectangle(
      'Success',
      msg ?? 'This is a success snack bar',
      type: AnimatedSnackBarType.success,
      brightness: Brightness.light,
    ).show(
      context,
    );
  }

  static showErrorMessage({String? msg, required BuildContext context}) {
    return AnimatedSnackBar.rectangle(
      'Failed',
      msg ?? 'This is a success snack bar',
      type: AnimatedSnackBarType.warning,
      brightness: Brightness.light,
    ).show(
      context,
    );
  }
}
