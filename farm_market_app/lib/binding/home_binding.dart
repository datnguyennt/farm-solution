import 'package:farm_market_app/controllers/controller.dart';
import 'package:get/get.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    //Get.put<HomeController>(HomeController());
    Get.lazyPut<HomeController>(() => HomeController());
    Get.lazyPut<DashboardController>(() => DashboardController());
    Get.lazyPut<LoveController>(() => LoveController());
    Get.lazyPut<MyPostController>(() => MyPostController());
    Get.lazyPut<SettingController>(() => SettingController());
  }
}
