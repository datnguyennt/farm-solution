import 'package:farm_market_app/controllers/controller.dart';
import 'package:get/get.dart';

class SplashBinding extends Bindings {
  @override
  void dependencies() {
    //Get.put<HomeController>(HomeController());
    Get.lazyPut<OnBoardingController>(() => OnBoardingController());
  }
}