import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:farm_market_app/controllers/controller.dart';
import 'package:farm_market_app/core/global/globals.dart';
import 'package:farm_market_app/data/data.dart';
import 'package:farm_market_app/data/entity/account.dart';
import 'package:farm_market_app/routes/app_routes.dart';
import 'package:farm_market_app/services/remote_service.dart';
import 'package:farm_market_app/utils/toast/toast_utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginEmailController extends GetxController with ToastUtils {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final _homeController = Get.put(HomeController());
  SharedPref sharedPref = SharedPref();
  final Dio _dio = Dio();
  var username = ''.obs;
  var password = ''.obs;
  RxBool isLoading = false.obs;
  final UserProvider _provider = UserProvider();

  Future loginUser() async {
    username.value = emailController.text;
    password.value = passwordController.text;
    if (username.value.isNotEmpty && password.value.isNotEmpty) {
      isLoading.value = true;
      var pos = await _provider.loginUser(
          username.value.trim(), password.value.trim());
      print(pos.token);
      if (pos.account != null) {
        Globals.setMainUser(pos.account!);
        sharedPref.save("user", Globals.mainUser);
        emailController.clear();
        passwordController.clear();
        _homeController.tabIndex = 0;
        isLoading.value = false;
        Get.toNamed(Routes.HOME);
      } else {
        isLoading.value = false;
        errorToast('Sai tên đăng nhặp hoặc mật khẩu');
      }
    }else{
      errorToast('Không được bỏ trống tên đăng nhập và mật khẩu');
    }
  }

  @override
  void onClose() {
    super.onClose();
  }
}
