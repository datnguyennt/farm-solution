import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:farm_market_app/data/data.dart';
import 'package:farm_market_app/data/entity/entity.dart';

class GetWeightTypeUsecase extends BaseUsecase {
  Future<List<WeightType>> getWightTypeResponse() async {
    bool isDisconnect = await WifiService.isDisconnect();
    if (isDisconnect) NetworkResponse.withDisconnect();
    List<WeightType> arrWeightType = [];
    try {
      var stringResponse = await apiClient.getWeightType();
      var tagObjsJson = jsonDecode(stringResponse) as List;
      arrWeightType = tagObjsJson.map((tagJson) => WeightType.fromJson(tagJson)).toList();
    } on DioError catch (e) {
      NetworkResponse.withErrorConvert(e);
    }
    return arrWeightType;
  }
}
