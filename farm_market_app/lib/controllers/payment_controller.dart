import 'dart:developer';

import 'package:farm_market_app/constants/constants.dart';
import 'package:farm_market_app/data/entity/account.dart';
import 'package:farm_market_app/data/request/phone_request.dart';
import 'package:farm_market_app/data/usecase/usecase.dart';
import 'package:get/get.dart';

class PaymentController extends GetxController {
  final PhoneLoginUsecase _loginUsecase = PhoneLoginUsecase();
  PhoneLoginRequest request = PhoneLoginRequest();
Account account = Account();
  Future loginUser() async {
    request = PhoneLoginRequest(phoneNumber: '0344966831');
    print(request);
    var pos = await _loginUsecase.phoneLoginResponse(request.toString());
    print(pos.status);
    if (pos.status == StatusResponse.OK) {
      //account = Account(pos.data);
      print('tai khoan da ton tai ${pos.data!.accountId}');
    } else {
      log('tai khoan khong ton tai');
    }
  }
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    loginUser();
  }
}
