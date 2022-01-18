import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:farm_market_app/data/data.dart';
import 'package:farm_market_app/data/entity/entity.dart';

class GetCategoryUsecase extends BaseUsecase {
  Future<List<Category>> getCategoryResponse() async {
    bool isDisconnect = await WifiService.isDisconnect();
    if (isDisconnect) NetworkResponse.withDisconnect();
    List<Category> arrCategory = [];
    try {
      var stringResponse = await apiClient.getCategory();
      var tagObjsJson = jsonDecode(stringResponse) as List;
      arrCategory = tagObjsJson.map((tagJson) => Category.fromJson(tagJson)).toList();
    } on DioError catch (e) {
      NetworkResponse.withErrorConvert(e);
    }
    return arrCategory;
  }
}
