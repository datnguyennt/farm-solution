import 'package:farm_market_app/controllers/controller.dart';
import 'package:farm_market_app/core/core.dart';
import 'package:farm_market_app/views/custom/image_slide.dart';
import 'package:farm_market_app/views/views.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class DashBoardPage extends GetView<DashboardController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.white,
        leading: Container(),
        elevation: 1.0,
        toolbarHeight: 50.h,
        centerTitle: true,
        title: Row(
          children: [
            Icon(
              Icons.location_on_outlined,
              size: 20.h,
              color: AppColor.black,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Vị trí hiện tại',
                  textAlign: TextAlign.left,
                  style: AppTextStyle.regular12(
                    color: AppColor.black,
                  ),
                ),
                Text(
                  '48 Cao Thắng, Đà Nẵng',
                  textAlign: TextAlign.left,
                  style: AppTextStyle.regular12(
                    color: AppColor.black,
                  ),
                ),
              ],
            ),
          ],
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.search_sharp,
              color: AppColor.black,
              size: 25.h,
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
          width: Get.width,
          height: Get.height,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 200.h,
                child: GetBuilder<DashboardController>(
                  builder: (_c) {
                    return const ImageSlide();
                  },
                ),
              ),
              SizedBox(height: 15.h),
              ProductItem(),
            ],
          ),
        ),
      ),
    );
  }
}
