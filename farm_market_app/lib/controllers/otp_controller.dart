import 'dart:convert';
import 'dart:developer';

import 'package:farm_market_app/constants/constants.dart';
import 'package:farm_market_app/controllers/controller.dart';
import 'package:farm_market_app/core/core.dart';
import 'package:farm_market_app/data/data.dart';
import 'package:farm_market_app/routes/app_routes.dart';
import 'package:farm_market_app/utils/toast/toast_utils.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get.dart' as GetX;

class OTPController extends GetxController with ToastUtils{
  final _homeController = Get.put(HomeController());
  String otpVerifiedID = '';
  RxString messageResponse = ''.obs;
  final PhoneLoginUsecase _loginUsecase = PhoneLoginUsecase();
  SharedPref sharedPref = SharedPref();
  RxBool isLoading = false.obs;
  late FocusNode pin2Node;
  late FocusNode pin3Node;
  late FocusNode pin4Node;
  late FocusNode pin5Node;
  late FocusNode pin6Node;

  TextEditingController pin1Controller = TextEditingController();
  TextEditingController pin2Controller = TextEditingController();
  TextEditingController pin3Controller = TextEditingController();
  TextEditingController pin4Controller = TextEditingController();
  TextEditingController pin5Controller = TextEditingController();
  TextEditingController pin6Controller = TextEditingController();

  RxString phoneSendToAPI = ''.obs;
  void clearOTP(){
    pin1Controller.clear();
    pin2Controller.clear();
    pin3Controller.clear();
    pin4Controller.clear();
    pin5Controller.clear();
    pin6Controller.clear();
  }

  @override
  void onInit() async {
    // TODO: implement onInit
    super.onInit();
    pin2Node = FocusNode();
    pin3Node = FocusNode();
    pin4Node = FocusNode();
    pin5Node = FocusNode();
    pin6Node = FocusNode();
    isLoading.value = false;
  }

  @override
  void dispose() {
    // TODO: implement dispose
    pin2Node.dispose();
    pin3Node.dispose();
    pin4Node.dispose();
    pin5Node.dispose();
    pin6Node.dispose();
    clearOTP();
    isLoading.value = false;
    super.dispose();
  }

  void nextField(String value, FocusNode focusNode) {
    if (value.length == 1) {
      focusNode.requestFocus();
    }
  }
  Future<void> phoneCredential(BuildContext context, String otp) async {
    FirebaseAuth _auth = FirebaseAuth.instance;
    if (otp.length == 6) {
      try {
        isLoading.value = true;
        print('OTP from server: ${otpVerifiedID.toString()}');
        PhoneAuthCredential credential = PhoneAuthProvider.credential(
            verificationId: otpVerifiedID.toString(), smsCode: otp);
        //await _auth.signInWithCredential(credential);
        final User? user = (await _auth.signInWithCredential(credential)).user;
        //Nếu OTP nhập đúng
        if (user != null) {
          print(phoneSendToAPI.value);
          //Kiểm tra số điện thoại bên API, nếu đã tồn tại thì đăng nhập vào màn hình home
          //Nếu không thì bắt người dùng phải nhập thông tin cơ bản như họ tên, địa chỉ, mật khẩu
          var pos =
              await _loginUsecase.phoneLoginResponse(phoneSendToAPI.value);
          if (pos.status == StatusResponse.OK) {
            Globals.setMainUser(pos.data!);
            sharedPref.save("user", Globals.mainUser);
            _homeController.tabIndex = 0;
            Get.offAllNamed(Routes.HOME);
          } else {
            Get.offAllNamed(Routes.CREATE_ACCOUNT, arguments: phoneSendToAPI);
            log('Tài khoản chưa được đăng kí ');
          }
        } else {
          isLoading.value = false;
          messageResponse.value = 'OTP nhập sai';
          clearOTP();
        }
      } catch (e) {
        isLoading.value = false;
        messageResponse.value = 'OTP nhập sai';
        clearOTP();
        print('Lỗi ${e}');
      }
    }else{
      messageResponse.value = '';
      errorToast('Vui lòng nhập OTP');
    }
  }
}
