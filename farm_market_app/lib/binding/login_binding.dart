import 'package:farm_market_app/controllers/controller.dart';
import 'package:get/get.dart';

class LoginBinding implements Bindings {
  @override
  void dependencies() {
    Get.put<LoginController>(LoginController());
    Get.put<HomeController>(HomeController());

  }
}
