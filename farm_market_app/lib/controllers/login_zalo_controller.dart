import 'dart:developer';
import 'dart:io';

import 'package:farm_market_app/data/entity/zalo_model.dart';
import 'package:farm_market_app/data/response/zalo_login_response.dart';
import 'package:get/get.dart';
import 'package:zalo_flutter/zalo_flutter.dart';

class LoginZaloController extends GetxController {
  RxBool isAuthenticated = false.obs;
  ZaloLoginResult zaloLoginResult = ZaloLoginResult();
  ZaloProfileModel zaloInfo = ZaloProfileModel();

  Future<void> loginZalo() async {
    ZaloLogin data = await ZaloFlutter.login();
    //zaloLoginResult = res;
    log('${data.toJson()}');
  }

  // Add this function
  Future<void> initZaloFlutter() async {
    if (Platform.isAndroid) {
      final hashKey = await ZaloFlutter.getHashKeyAndroid();
      log('HashKey: $hashKey');
    }
  }
}
