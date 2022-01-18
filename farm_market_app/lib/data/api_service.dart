
import 'package:farm_market_app/constants/constants.dart';
import 'package:retrofit/http.dart';
import 'package:dio/dio.dart';
part 'api_service.g.dart';

@RestApi(baseUrl: EndPoint.baseUrl)
abstract class RestClient {
  factory RestClient(Dio dio, {String baseUrl}) = _RestClient;

  @POST(EndPoint.login)
  Future<String> login(@Body() data);

  @FormUrlEncoded()
  @GET(EndPoint.getAllUser)
  Future<String> getAllUser(@Body() Map<String, dynamic> body);

  //@FormUrlEncoded()
  @GET(EndPoint.getAllPost)
  Future<String> getAllPost();

  @GET(EndPoint.getWeightType)
  Future<String> getWeightType();

  @GET(EndPoint.getCategory)
  Future<String> getCategory();

  @GET(EndPoint.getAllBanner)
  Future<String> getAllBanner();

  @PUT(EndPoint.changePassword)
  Future<String> changePassword(formData);

  @POST(EndPoint.createAccount)
  Future<String> createAccount(formData);

  @POST(EndPoint.createPost)
  Future<String> createPost(formData);

  @GET("${EndPoint.getPostDetail}/{postID}")
  Future<String> getPostDetail(@Path("postID") int postID);

  @POST("${EndPoint.getAllPostByAccount}/{accountID}")
  Future<String> getAllPostByAccount(@Path("accountID") int accountID);

  @GET("${EndPoint.loginByPhone}/{phoneNumber}")
  Future<String> loginByPhone(@Path("phoneNumber") String phoneNumber);

  @GET("${EndPoint.getAccountById}/{accountID}")
  Future<String> getAccountById(@Path("accountID") int accountID);

  @PUT("${EndPoint.updateAccount}/{AccountID}")
  Future<String> updateAccount(@Path("AccountID") String AccountID);
}
