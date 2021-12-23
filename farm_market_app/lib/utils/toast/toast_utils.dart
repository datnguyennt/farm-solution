import 'package:farm_market_app/core/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

mixin ToastUtils {
  void successToast(String message) {
    Fluttertoast.showToast(
      msg: message,
      textColor: AppColor.white,
      backgroundColor: Colors.blue,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
    );
  }

  void errorToast(String message) {
    Fluttertoast.showToast(
      msg: message,
      textColor: AppColor.white,
      backgroundColor: Colors.red,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
    );
  }
}
