import 'package:farm_market_app/controllers/controller.dart';
import 'package:get/get.dart';

class OTPBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<OTPController>(OTPController());
  }
}