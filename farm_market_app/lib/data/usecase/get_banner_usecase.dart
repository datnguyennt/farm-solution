import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:farm_market_app/data/data.dart';
import 'package:farm_market_app/data/entity/banner.dart';

class GetBannerUsecase extends BaseUsecase {
  Future<List<Banner>> getAllBannerResponse() async {
    bool isDisconnect = await WifiService.isDisconnect();
    if (isDisconnect) NetworkResponse.withDisconnect();
    List<Banner> arrBanner = [];
    try {
      var stringResponse = await apiClient.getAllBanner();
      var tagObjsJson = jsonDecode(stringResponse) as List;
      arrBanner = tagObjsJson.map((tagJson) => Banner.fromJson(tagJson)).toList();
    } on DioError catch (e) {
      NetworkResponse.withErrorConvert(e);
    }
    return arrBanner;
  }
}
