// import 'dart:convert';
// import 'package:farm_market_app/data/data.dart';
// import 'package:dio/dio.dart';
// import 'package:farm_market_app/constants/constants.dart';
// import 'package:farm_market_app/data/request/login_request.dart';
// import 'package:farm_market_app/data/response/login_response.dart';
//
// class UserProvider extends BaseUsecase {
//   final Dio _dio = Dio();
//
//   // Post request
//   Future<LoginResponse> loginUser(String username, String password) async {
//     _dio.interceptors.add(Logging());
//
//     bool isDisconnect = await WifiService.isDisconnect();
//     if (isDisconnect) NetworkResponse.withDisconnect();
//     LoginResponse response = LoginResponse();
//     try {
//           FormData formData = FormData.fromMap(
//             {
//               "LoginName": '${username}',
//               "Password": '${password}',
//             },
//           );
//           String stringResponse = await apiClient.login(formData);
//           response = LoginResponse.fromJson(jsonDecode(stringResponse));
//           print('day nè trời ơi là tời${response}');
//     } on DioError catch (e) {
//       NetworkResponse.withErrorConvert(e);
//     }
//
//     return response;
//   }
//   // Future<LoginResponse> loginUser(String username, String password) async {
//   //   _dio.interceptors.add(Logging());
//   //
//   //   bool isDisconnect = await WifiService.isDisconnect();
//   //   if (isDisconnect) NetworkResponse.withDisconnect();
//   //   LoginResponse response = LoginResponse();
//   //   try {
//   //     FormData formData = FormData.fromMap(
//   //       {
//   //         "LoginName": '${username}',
//   //         "Password": '${password}',
//   //       },
//   //     );
//   //     var ls1 = LoginRequest(LoginName: username, Password: password);
//   //     print(ls1);
//   //     print(formData);
//   //     var api_response = await _dio.post(
//   //       EndPoint.login,
//   //       data: ls1,
//   //       options: Options(
//   //         contentType: Headers.formUrlEncodedContentType,
//   //         followRedirects: false,
//   //         validateStatus: (status) => true,
//   //       ),
//   //     );
//   //     if (api_response.statusCode == 200) {
//   //       response = LoginResponse.fromJson(api_response.data);
//   //     } else {
//   //       print('Sai tên đăng nhập hoặc mật khẩu');
//   //     }
//   //   } on DioError catch (e) {
//   //     NetworkResponse.withErrorConvert(e);
//   //   }
//   //
//   //   return response;
//   // }
// }
