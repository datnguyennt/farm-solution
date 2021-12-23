import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:farm_market_app/data/data.dart';
import 'package:farm_market_app/data/response/list_user_response.dart';
import '../network_response_model.dart';
import '../wifi_service.dart';
import 'base_usecase.dart';

class GetAllAccountUsecase extends BaseUsecase {
  Future<GetAllUserResponse> getAllAccount(String base64Json) async {
    bool isDisconnect = await WifiService.isDisconnect();
    if (isDisconnect) NetworkResponse.withDisconnect();
    GetAllUserResponse response = GetAllUserResponse();
    try {
      String stringResponse =
      await apiClient.getAllUser(handleRetrofitBody(base64Json));
      response = GetAllUserResponse.fromJson(jsonDecode(stringResponse));
    } on DioError catch (e) {
      NetworkResponse.withErrorConvert(e);
    }
    return response;
  }
}

