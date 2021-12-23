import 'package:farm_market_app/constants/app_images.dart';
import 'package:farm_market_app/controllers/controller.dart';
import 'package:farm_market_app/core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class OnBoardingPage extends GetView<OnBoardingController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.white,
      body: Stack(children: [
        PageView.builder(
          controller: controller.pageController,
          onPageChanged: controller.selectedIndex,
          itemCount: controller.onBoardingPages.length,
          itemBuilder: (context, index) {
            return Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset(controller.onBoardingPages[index].imageAsset),
                  SizedBox(
                    height: 50.h,
                  ),
                  Text(
                    controller.onBoardingPages[index].title,
                    style: AppTextStyle.bold20(
                      color: AppColor.black,
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 40.w, vertical: 20.h),
                    child: Text(
                      controller.onBoardingPages[index].description,
                      style: AppTextStyle.regular18(
                        color: AppColor.black,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 40.h,
                  ),
                ],
              ),
            );
          },
        ),
        Positioned(
          bottom: 30,
          left: 20,
          child: Row(
            children: List.generate(
              controller.onBoardingPages.length,
              (index) => Obx(
                () => Container(
                  margin: EdgeInsets.all(3.w),
                  height: 10.w,
                  width: 10.w,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: controller.selectedIndex.value == index
                        ? AppColor.green
                        : AppColor.gray,
                  ),
                ),
              ),
            ),
          ),
        ),
        Positioned(
            bottom: 20,
            right: 20,
            child: FloatingActionButton(
              backgroundColor: AppColor.white,
              onPressed: (){
                controller.forwardAction();
              },
              child: Image.asset(
                AppImages.iconNext,
              ),
            )),
      ]),
    );
  }
}
