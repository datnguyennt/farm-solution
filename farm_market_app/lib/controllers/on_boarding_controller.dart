import 'package:farm_market_app/constants/app_images.dart';
import 'package:farm_market_app/models/on_boarding_info.dart';
import 'package:farm_market_app/routes/app_routes.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class OnBoardingController extends GetxController {
  var selectedIndex = 0.obs;
  var pageController = PageController();
  List<OnBoardingInfo> onBoardingPages = [
    OnBoardingInfo(
        imageAsset: AppImages.onBoarding1,
        title: 'Nông sản luôn tươi',
        description: 'description1'),
    OnBoardingInfo(
        imageAsset: AppImages.onBoarding2,
        title: 'Giá cả tại vườn',
        description: 'description2'),
    OnBoardingInfo(
        imageAsset: AppImages.onBoarding3,
        title: 'Chất lượng nông sản tốt',
        description: 'description3'),
    OnBoardingInfo(
        imageAsset: AppImages.onBoarding4,
        title: 'Ủng hộ người nông dân',
        description: 'description4'),
  ];
  bool get isLastPage => selectedIndex.value == onBoardingPages.length - 1;



  forwardAction() {
    if (isLastPage) {
      Get.toNamed(Routes.LOGIN_EMAIL);
    } else {
      pageController.nextPage(duration: 300.milliseconds, curve: Curves.easeIn);
    }
  }
}
