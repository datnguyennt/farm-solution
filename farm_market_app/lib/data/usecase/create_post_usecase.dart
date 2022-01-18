import 'package:dio/dio.dart';
import 'package:farm_market_app/constants/constants.dart';
import 'package:farm_market_app/data/data.dart';
import 'package:farm_market_app/data/response/create_post_response.dart';
import '../network_response_model.dart';
import '../wifi_service.dart';

class CreatePostUsecase {
  Future<CreatePostResponse> createPostResponse(
      FormData formData) async {
    bool isDisconnect = await WifiService.isDisconnect();
    if (isDisconnect) NetworkResponse.withDisconnect();
    CreatePostResponse response = CreatePostResponse();
    Response? responseData;
    try {
      Dio dio = Dio();
      dio.interceptors.add(Logging());
      dio.options.headers["Content-Type"] = "multipart/form-data";
      responseData = await dio.post(EndPoint.createPost, data: formData);
      response = CreatePostResponse.fromJson(responseData.data);
      print('hihiihi ${responseData.statusCode}');
    } on DioError catch (e) {
      print('vcl loi ${e.response!.data}');
      response = CreatePostResponse.fromJson(e.response!.data);
      return response;
      //NetworkResponse.withErrorConvert(e);
    }
    return response;
  }
}
