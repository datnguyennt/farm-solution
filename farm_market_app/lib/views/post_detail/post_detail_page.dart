import 'package:farm_market_app/constants/constants.dart';
import 'package:farm_market_app/controllers/controller.dart';
import 'package:farm_market_app/core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class PostDetailPage extends GetView<PostDetailController> {
  const PostDetailPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            Container(
                margin: EdgeInsets.symmetric(horizontal: 5.w, vertical: 5.h),
                height: Get.height * 1 / 4,
                width: Get.width,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.r),
                ),
                child: Image.network(
                  EndPoint.baseUrl + '/post-content/qua-buoi.jpg',
                  fit: BoxFit.cover,
                )),
          ],
        ),
      ),
    );
  }

  AppBar appBar() {
    return AppBar(
      backgroundColor: AppColor.white,
      leading: IconButton(
        icon: Icon(
          Icons.arrow_back_ios_sharp,
          color: AppColor.black,
        ),
        onPressed: () {
          Get.back();
        },
      ),
      actions: [
        IconButton(
          onPressed: () {},
          icon: Icon(
            Icons.view_headline_outlined,
            color: AppColor.black,
          ),
        ),
      ],
      elevation: 1.0,
      toolbarHeight: 50.h,
    );
  }
}
