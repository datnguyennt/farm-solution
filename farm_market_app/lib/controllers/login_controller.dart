import 'package:farm_market_app/constants/constants.dart';
import 'package:farm_market_app/controllers/auth_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

class LoginController extends GetxController {
  late TextEditingController phoneNumberController;
  RxString phoneNumber = ''.obs;

  getPhoneNum(){
    phoneNumber.value = phoneNumberController.text;
  }
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
  }


}
