import 'package:dio/dio.dart';
import 'package:farm_market_app/constants/constants.dart';
import 'package:farm_market_app/data/data.dart';
import 'package:farm_market_app/data/response/update_account_response.dart';
import '../network_response_model.dart';
import '../wifi_service.dart';

class UpdateAccountUsecase {
  Future<UpdateAccountResponse> updateAccountResponse(String AccountID,
      FormData formData) async {
    bool isDisconnect = await WifiService.isDisconnect();
    if (isDisconnect) NetworkResponse.withDisconnect();
    UpdateAccountResponse response = UpdateAccountResponse();
    Response? responseData;
    try {
      Dio dio = Dio();
      dio.interceptors.add(Logging());
      dio.options.headers["Content-Type"] = "multipart/form-data";
      responseData = await dio.put("${EndPoint.updateAccount}/${AccountID}", data: formData);
      response = UpdateAccountResponse.fromJson(responseData.data);
      print('hihiihi ${responseData.data}');
    } on DioError catch (e) {
      print('hhihhi ${e.response!.data}');
      response = UpdateAccountResponse.fromJson(e.response!.data);
      return response;
      //NetworkResponse.withErrorConvert(e);
    }
    return response;
  }
}
