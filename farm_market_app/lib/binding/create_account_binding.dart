import 'package:farm_market_app/controllers/controller.dart';
import 'package:get/get.dart';
class CreateAccountBinding implements Bindings {
  @override
  void dependencies() {
    Get.put<CreateAccountController>(CreateAccountController());
  }
}
