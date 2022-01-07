import 'package:farm_market_app/constants/constants.dart';
import 'package:farm_market_app/core/core.dart';
import 'package:farm_market_app/data/data.dart';
import 'package:farm_market_app/data/request/change_password_request.dart';
import 'package:farm_market_app/utils/toast/toast_utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'package:dio/dio.dart' as Dio;
import 'package:get/get.dart' as GetX;

class ChangePasswordController extends GetxController with ToastUtils {
  RxBool obscureText1 = true.obs;
  RxBool obscureText2 = true.obs;
  RxBool obscureText3 = true.obs;

  TextEditingController oldPassController = TextEditingController();
  TextEditingController newPassController = TextEditingController();
  TextEditingController confirmNewPassController = TextEditingController();

  var oldPassword = ''.obs;
  var newPassword = ''.obs;
  var confirmNewPassword = ''.obs;
  RxString message = ''.obs;
  RxBool checkOldPass = true.obs;
  final changePasswordForm = GlobalKey<FormState>(debugLabel: 'changePasswordForm');

  final ChangePasswordUsecase _changePasswordUsecase = ChangePasswordUsecase();
  ChangePasswordRequest request = ChangePasswordRequest();

  validateForm(BuildContext context) {
    if (changePasswordForm.currentState!.validate()) {
      showLoaderDialog(context);
      changePassword();
    } else {
      print('error');
    }
  }

  showLoaderDialog(BuildContext context) {
    AlertDialog alert = AlertDialog(
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            alignment: Alignment.center,
            child: const CircularProgressIndicator(),
          ),
        ],
      ),
    );
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  Future changePassword() async {
    oldPassword.value = oldPassController.text.trim();
    newPassword.value = newPassController.text.trim();
    confirmNewPassword.value = confirmNewPassController.text.trim();
    // oldPassword.value = '12345';
    // newPassword.value = '12345';
    // confirmNewPassword.value = '12345';
    if (oldPassword.value.isNotEmpty &&
        newPassword.value.isNotEmpty &&
        confirmNewPassword.value.isNotEmpty) {
      Dio.FormData formData = Dio.FormData.fromMap({
        'AccountID': Globals.mainUser.accountId,
        'OldPass': oldPassword,
        'NewPass': newPassword,
        'ConfirmNewPass': confirmNewPassword,
      });

      var pos = await _changePasswordUsecase.changePasswordResponse(formData);
      if (pos.status == StatusResponse.OK) {
        clearTextField();
        Get.back();
        //Get.back();
        message.value = pos.message.toString();
        GetX.Get.snackbar('change_password'.tr, message.value,
            backgroundColor: Colors.white,
            duration: const Duration(seconds: 3),
            animationDuration: const Duration(milliseconds: 900),
            margin: EdgeInsets.only(top: 5.h, left: 10.w, right: 10.w));
        checkOldPass.value = true;
      } else {
        Get.back();
        //Get.back();
        checkOldPass.value = false;
      }
    } else {
      errorToast('Không được bỏ trống tên đăng nhập và mật khẩu');
    }
  }

  void clearTextField() {
    newPassController.clear();
    oldPassController.clear();
    confirmNewPassController.clear();
  }

  // Get.bottomSheet(
  // Container(
  // decoration: BoxDecoration(
  // color: Colors.white,
  // borderRadius: const BorderRadius.only(
  // topLeft: Radius.circular(16.0),
  // topRight: Radius.circular(16.0)),
  // ),
  // child: Wrap(
  // alignment: WrapAlignment.end,
  // crossAxisAlignment: WrapCrossAlignment.end,
  // children: [
  // ListTile(
  // leading: Icon(Icons.camera),
  // title: Text('Camera'),
  // onTap: () {
  // Get.back();
  // profilerController.uploadImage(ImageSource.camera);
  // },
  // ),
  // ListTile(
  // leading: Icon(Icons.image),
  // title: Text('Gallery'),
  // onTap: () {
  // Get.back();
  // profilerController
  //     .uploadImage(ImageSource.gallery);
  // },
  // ),
  // ],
  // ),
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    checkOldPass.value = true;
    obscureText1.value = true;
    obscureText2.value = true;
    obscureText3.value = true;
  }
}
