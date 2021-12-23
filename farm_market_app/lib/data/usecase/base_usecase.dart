import 'package:dio/dio.dart';
import 'package:farm_market_app/data/data.dart';

class BaseUsecase {
  late Dio dio;
  late RestClient apiClient;

  BaseUsecase() {
    dio = Dio();
    dio.options.headers["Content-Type"] = "application/json";
    dio.options.contentType = Headers.wwwAuthenticateHeader;
    dio.interceptors.add(Logging());
    apiClient = RestClient(dio);
  }
}
