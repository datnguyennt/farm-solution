import 'package:farm_market_app/controllers/controller.dart';
import 'package:get/get.dart';

class SignUpBinding extends Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.put<SignUpController>(SignUpController());
  }
}
