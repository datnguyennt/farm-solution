
import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:farm_market_app/constants/constants.dart';
import 'package:farm_market_app/data/data.dart';
import 'package:farm_market_app/data/response/get_post_by_account_response.dart';

class GetPostByAccountUsecase extends BaseUsecase {

  Future<GetPostByAccountResponse> getPostByAccountResponse(int request) async {
    bool isDisconnect = await WifiService.isDisconnect();
    if (isDisconnect) NetworkResponse.withDisconnect();
    GetPostByAccountResponse response = GetPostByAccountResponse();
    Response? responseData;
    try {
      Dio dio = Dio();
      dio.interceptors.add(Logging());
      //dio.options.headers["Content-Type"] = "multipart/form-data";
      responseData = await dio.get("${EndPoint.getAllPostByAccount}?accountId=${request}");
      response = GetPostByAccountResponse.fromJson(responseData.data);
      print('hihiihi ${responseData.data}');
    } on DioError catch (e) {
      print('loi ${e.response!.data}');
      response = GetPostByAccountResponse.fromJson(e.response!.data);
      return response;
      //NetworkResponse.withErrorConvert(e);
    }
    return response;
  }
}
