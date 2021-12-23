import 'package:farm_market_app/controllers/controller.dart';
import 'package:farm_market_app/core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class GroceryPage extends GetView<GroceryController> {
  final SettingController ctl = Get.put(SettingController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.white,
        leading: Container(),
        flexibleSpace: Container(
            decoration: BoxDecoration(gradient: AppColor.linearGreen)),
        elevation: 1.0,
        toolbarHeight: 50.h,
        centerTitle: true,
        title: Text(
          '${controller.title}',
          textAlign: TextAlign.left,
          style: AppTextStyle.regular12(
            color: AppColor.white,
          ),
        ),
      ),
      body: Center(
        child: Text(
          '${ctl.item.value}',
          style: AppTextStyle.regular20(
            color: AppColor.black,
          ),
        ),
      ),
    );
  }
}
