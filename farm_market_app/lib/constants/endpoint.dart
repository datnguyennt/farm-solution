class EndPoint {
  static const String baseUrl = 'https://chonongsanapi.azurewebsites.net/api';

  static const int connectionTimeout = 5000;
  static const int receiveTimeout = 5000;
  static const String keyAuthorization = "Authorization";

  static const int SUCCESS = 200;
  static const int ERROR_TOKEN = 401;
  static const int ERROR_VALIDATE = 422;
  static const int ERROR_SERVER = 500;
  static const int ERROR_DISCONNECT = -1;

  static const String login = baseUrl + '/tai-khoan/dang-nhap';
  static const String getAllUser = baseUrl + '/tai-khoan';

}