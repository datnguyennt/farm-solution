import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:dio/dio.dart';
import 'package:farm_market_app/constants/constants.dart';
import 'package:farm_market_app/data/response/login_response.dart';

class UserProvider {
  final Dio _dio = Dio();

  // Post request
  Future<LoginResponse> loginUser(String username, String password) async {
    LoginResponse response = LoginResponse();

    FormData formData = FormData.fromMap(
      {
        "LoginName": '${username}',
        "Password": '${password}',
      },
    );
    var api_response = await _dio.post(
      EndPoint.login,
      data: formData,
      options: Options(
        followRedirects: false,
        validateStatus: (status) => true,
      ),
    );
    if (api_response.statusCode == 200) {
      response = LoginResponse.fromJson(api_response.data);

    } else {
      print('Sai tên đăng nhập hoặc mật khẩu');
    }
    return response;
  }
}
