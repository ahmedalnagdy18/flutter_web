import 'package:flutter/material.dart';
import 'package:flutter_website/core/colors/app_color.dart';
import 'package:fluttertoast/fluttertoast.dart';

double appHight(BuildContext context, double h) {
  return MediaQuery.of(context).size.height * h;
}

double appWidth(BuildContext context, double w) {
  return MediaQuery.of(context).size.width * w;
}

void showToastMessage({required String message}) {
  Fluttertoast.showToast(
    msg: message,
    webBgColor: "#489FD5",
    webPosition: "center",
    backgroundColor: AppColors.primaryColor,
    toastLength: Toast.LENGTH_LONG,
    gravity: ToastGravity.CENTER,
    timeInSecForIosWeb: 2,
    textColor: Colors.white,
    fontSize: 12,
  );
}
