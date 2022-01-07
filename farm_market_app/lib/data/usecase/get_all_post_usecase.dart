import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:farm_market_app/data/data.dart';
import 'package:farm_market_app/data/entity/post.dart';
import 'package:farm_market_app/data/response/get_all_post_response.dart';

class GetAllPostUsecase extends BaseUsecase {
  Future<List<Post>> getAllPostRespone() async {
    bool isDisconnect = await WifiService.isDisconnect();
    if (isDisconnect) NetworkResponse.withDisconnect();
    List<Post> arrPost = [];
    try {
      var stringResponse = await apiClient.getAllPost();
      var tagObjsJson = jsonDecode(stringResponse) as List;
      arrPost = tagObjsJson.map((tagJson) => Post.fromJson(tagJson)).toList();
    } on DioError catch (e) {
      NetworkResponse.withErrorConvert(e);
    }
    return arrPost;
  }
}
