
import 'package:dio/dio.dart';
import 'package:farm_market_app/constants/constants.dart';
import 'package:farm_market_app/data/data.dart';
import 'package:farm_market_app/data/response/create_account_response.dart';
import '../network_response_model.dart';
import '../wifi_service.dart';

class CreateAccountUsecase {
  Future<CreateAccountResponse> createAccountResponse(
      FormData formData) async {
    //dio.interceptors.add(Logging());
    bool isDisconnect = await WifiService.isDisconnect();
    if (isDisconnect) NetworkResponse.withDisconnect();
    CreateAccountResponse response = CreateAccountResponse();
    Response? responseData;
    try {
      Dio dio = Dio();
      dio.interceptors.add(Logging());
      dio.options.headers["Content-Type"] = "multipart/form-data";
      responseData = await dio.post(EndPoint.createAccount, data: formData);
      response = CreateAccountResponse.fromJson(responseData.data);
      print('hihiihi ${responseData.data}');
    } on DioError catch (e) {
      print('hhihhi ${e.response!.data}');
      response = CreateAccountResponse.fromJson(e.response!.data);
      return response;
      //NetworkResponse.withErrorConvert(e);
    }
    return response;
  }
}
