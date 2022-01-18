import 'dart:developer';
import 'package:farm_market_app/constants/constants.dart';
import 'package:farm_market_app/controllers/controller.dart';
import 'package:farm_market_app/data/data.dart';
import 'package:farm_market_app/routes/app_routes.dart';
import 'package:farm_market_app/services/firebase_api.dart';
import 'package:farm_market_app/utils/toast/toast_utils.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get.dart' as GetX;
import 'package:progress_dialog_null_safe/progress_dialog_null_safe.dart';

class LoginController extends GetxController with ToastUtils {
  final otpController = Get.put(OTPController());

  //FirebaseApi services = FirebaseApi();
  TextEditingController phoneNumberController = TextEditingController();
  String phoneNumber = '';
  String checkPhoneNum = '';
  final loginForm = GlobalKey<FormState>(debugLabel: 'loginForm');
  RxBool isValid = false.obs;
  RxBool isLoading = false.obs;
  FirebaseAuth auth = FirebaseAuth.instance;

  String getPhoneNum() {
    phoneNumber = phoneNumberController.text.trim();
    if (phoneNumber[0] == '0') {
      checkPhoneNum = phoneNumber;
      otpController.phoneSendToAPI.value = checkPhoneNum;
      phoneNumber = '+84' + phoneNumber.substring(1);
      return phoneNumber;
    } else {
      return '+84' + phoneNumber;
    }
  }

  clearText() {
    phoneNumberController.clear();
  }

  validateForm(BuildContext context) {
    if (phoneNumberController.text.isNotEmpty) {
      //validateMobile(phoneNumberController.text.trim());
      if (phoneNumberController.text.length < 10) {
        isValid.value = false;
        errorToast('Số điện thoại không đúng định dạng');
      } else {
        isValid.value = true;
        isLoading.value = true;
        log(getPhoneNum());
        verifyPhoneNumber();
        //verifyPhoneNumber('+18888888');
      }
    } else {
      isValid.value = false;
      errorToast('Vui lòng nhập số điện thoại');
      print('error');
    }
    update();
  }

  Future<void> verifyPhoneNumber() async {
    try {
      await FirebaseAuth.instance.verifyPhoneNumber(
        phoneNumber: getPhoneNum(),
        //phoneNumber: '+18888888',
        verificationCompleted: (phone){},
        verificationFailed: (FirebaseAuthException  e) async {
          if (e.code == 'invalid-phone-number') {
            log('The provided phone number is not valid.');
          } else {
            log(e.code.toString());
          }
          GetX.Get.snackbar('login'.tr, e.message.toString(),
              backgroundColor: Colors.white,
              duration: const Duration(seconds: 5),
              animationDuration: const Duration(milliseconds: 900),
              margin: EdgeInsets.only(top: 5.h, left: 10.w, right: 10.w));
          isLoading.value = false;
        },
        codeSent: (verificationId, resendingToken) async {
          log('Code from sever : $verificationId');
          otpController.otpVerifiedID = verificationId;
          Get.toNamed(Routes.OTP_AUTHEN);
          isLoading.value = false;
        },
        codeAutoRetrievalTimeout: (String verificationId) {
          log(verificationId);
        },
      );
    } catch (e) {
      print(e.toString());
      isLoading.value = false;
    }
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    isValid.value = true;
    isLoading.value = false;
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
    isLoading.value = false;
    clearText();
  }
}
