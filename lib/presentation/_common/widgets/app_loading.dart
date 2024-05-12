import 'package:flutter/material.dart';
import 'package:loading_indicator/loading_indicator.dart';

Widget AppLoading(BuildContext context, {double size = 60}) {
  return SizedBox(
      width: size,
      height: size,
      child: LoadingIndicator(
        indicatorType: Indicator.lineSpinFadeLoader,
      ));
}

class AppLoadingDialog {
  BuildContext? context;

  double? size;

  var _dialog;

  AppLoadingDialog.show(BuildContext context, {double? size = 60}) {
    this.context = context;

    _dialog = showDialog(
        barrierDismissible: false,
        context: context,
        builder: (context) => Center(
              child: SizedBox(
                  width: size!,
                  height: size,
                  child: LoadingIndicator(
                    indicatorType: Indicator.lineSpinFadeLoader,
                  )),
            ));
  }

  show() {
    _dialog.show();
  }

  AppLoadingDialog.dispose(BuildContext context) {
    Navigator.pop(context);
  }
}
