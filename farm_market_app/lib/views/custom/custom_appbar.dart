import 'package:farm_market_app/core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomAppbar{
  Widget appBar(String title) {
    return AppBar(
      backgroundColor: AppColor.white,
      leading: Container(),
      flexibleSpace:
          Container(decoration: BoxDecoration(gradient: AppColor.linearGreen)),
      elevation: 1.0,
      toolbarHeight: 50.h,
      centerTitle: true,
      title: Text(
        title,
        textAlign: TextAlign.left,
        style: AppTextStyle.regular12(
          color: AppColor.white,
        ),
      ),
    );
  }
}
