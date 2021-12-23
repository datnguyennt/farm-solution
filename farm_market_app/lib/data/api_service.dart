import 'package:farm_market_app/constants/constants.dart';
import 'package:farm_market_app/data/entity/account.dart';
import 'package:farm_market_app/data/request/login_request.dart';
import 'package:farm_market_app/data/response/login_response.dart';
import 'package:retrofit/http.dart';
import 'package:dio/dio.dart';
part 'api_service.g.dart';

@RestApi(baseUrl: EndPoint.baseUrl)
abstract class RestClient {
  factory RestClient(Dio dio, {String baseUrl}) = _RestClient;

  @POST(EndPoint.login)
  Future<String> login(@Body() LoginRequest loginRequest);

  @FormUrlEncoded()
  @GET(EndPoint.getAllUser)
  Future<String> getAllUser(@Body() Map<String, dynamic> body);
}
