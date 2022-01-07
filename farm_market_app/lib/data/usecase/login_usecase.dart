import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:farm_market_app/constants/constants.dart';
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
      var bodyValue = request.toJson();
      var bodydata = json.encode(bodyValue); // important

      var stringResponse = await apiClient.login(bodydata);
      //print('day nè trời ơi là tời${stringResponse}');
      response = LoginResponse.fromJson(jsonDecode(stringResponse));
    } on DioError catch (e) {
      if (e.response?.statusCode == 400) {
        response = LoginResponse.fromJson(jsonDecode(e.response?.data));
      } else {
        NetworkResponse.withErrorConvert(e);
      }
    }
    return response;
  }
}
