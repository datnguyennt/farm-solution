import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:farm_market_app/constants/constants.dart';
import 'package:farm_market_app/data/data.dart';
import 'package:farm_market_app/data/request/phone_request.dart';
import 'package:farm_market_app/data/response/phone_response.dart';

class PhoneLoginUsecase extends BaseUsecase {
  Future<LoginPhoneResponse> phoneLoginResponse(String request) async {
    bool isDisconnect = await WifiService.isDisconnect();
    if (isDisconnect) NetworkResponse.withDisconnect();
    LoginPhoneResponse response = LoginPhoneResponse();
    try {
      var stringResponse = await apiClient.loginByPhone(request);
      response = LoginPhoneResponse.fromJson(jsonDecode(stringResponse));
      print(response.data!.fullName);
    } on DioError catch (e) {
      if (e.response?.statusCode == 400) {
        response.status = StatusResponse.FAILED;
        return response;
      } else{
        NetworkResponse.withErrorConvert(e);
      }
    }
    return response;
  }
}
