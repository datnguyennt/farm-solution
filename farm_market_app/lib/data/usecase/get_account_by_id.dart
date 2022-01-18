

import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:farm_market_app/data/data.dart';
import 'package:farm_market_app/data/response/get_account_by_id_response.dart';

class GetAccountByIdUsecase extends BaseUsecase {

  Future<GetAccountByIdResponse> getAccountByIdResponse(int request) async {
    bool isDisconnect = await WifiService.isDisconnect();
    if (isDisconnect) NetworkResponse.withDisconnect();
    GetAccountByIdResponse response = GetAccountByIdResponse();
    try {
      var stringResponse = await apiClient.getAccountById(request);
      response = GetAccountByIdResponse.fromJson(jsonDecode(stringResponse));
      print(response.data!.userName);
    } on DioError catch (e) {
      if (e.response?.statusCode == 400) {
        return response;
      } else{
        NetworkResponse.withErrorConvert(e);
      }
    }
    return response;
  }
}
