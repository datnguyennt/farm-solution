import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:farm_market_app/data/entity/account.dart';
import 'package:farm_market_app/data/request/login_request.dart';
import 'package:farm_market_app/data/response/login_response.dart';
import '../network_response_model.dart';
import '../wifi_service.dart';
import 'base_usecase.dart';

class LoginUsecase extends BaseUsecase {
  Future<LoginResponse> loginResponse(LoginRequest request) async {
    bool isDisconnect = await WifiService.isDisconnect();
    if (isDisconnect) NetworkResponse.withDisconnect();
    LoginResponse response = LoginResponse();
    try {
      String stringResponse = await apiClient.login(request);
      response = LoginResponse.fromJson(jsonDecode(stringResponse));
      print('day nè trời ơi là tời${response}');
    } on DioError catch (e) {
      NetworkResponse.withErrorConvert(e);
    }
    return response;
  }
}
