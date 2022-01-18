
import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:farm_market_app/data/data.dart';
import 'package:farm_market_app/data/response/get_post_detail_response.dart';

class GetPostDetailUsecase extends BaseUsecase {
  Future<GetPostDetailResponse> getPostDetailResponse(int request) async {
    bool isDisconnect = await WifiService.isDisconnect();
    if (isDisconnect) NetworkResponse.withDisconnect();
    GetPostDetailResponse response = GetPostDetailResponse();
    try {
      var stringResponse = await apiClient.getPostDetail(request);
      response = GetPostDetailResponse.fromJson(jsonDecode(stringResponse));
      print(response.data!.phone);
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
