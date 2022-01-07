import 'package:farm_market_app/controllers/controller.dart';
import 'package:get/get.dart';
class ChangePasswordBinding implements Bindings {
  @override
  void dependencies() {
    Get.put<ChangePasswordController>(ChangePasswordController());
  }
}
