class EndPoint {
  //static const String baseUrl = 'https://chonongsanapi.azurewebsites.net';
  static const String baseUrl = 'http://192.168.1.7:5001';

  static const int connectionTimeout = 5000;
  static const int receiveTimeout = 5000;
  static const String keyAuthorization = "Authorization";

  static const int SUCCESS = 200;
  static const int ERROR_TOKEN = 401;
  static const int ERROR_VALIDATE = 422;
  static const int ERROR_SERVER = 500;
  static const int ERROR_DISCONNECT = -1;

  static const String login = baseUrl + '/api/tai-khoan/dang-nhap';
  static const String loginByPhone = baseUrl + '/api/tai-khoan/so-dien-thoai';
  static const String getAllUser = baseUrl + '/api/tai-khoan';
  static const String getAllPost = baseUrl + '/api/tin-dang/tat-ca-tin-dang-cho-app';
  static const String getAllBanner = baseUrl + '/api/banner/tat-ca-banner';
  static const String changePassword = baseUrl + '/api/tai-khoan/doi-mat-khau';
  static const String createAccount = baseUrl + '/api/tai-khoan/dang-ky-khach-hang';
  static const String updateAccount = baseUrl + '/api/tai-khoan/cap-nhat-tai-khoan';
  static const String getPostDetail = baseUrl + '/api/tin-dang';
  static const String getAccountById = baseUrl + '/api/tai-khoan';
  static const String getWeightType = baseUrl + '/api/don-vi/tat-ca';
  static const String getCategory = baseUrl + '/api/danh-muc/tat-ca-danh-muc';
  static const String createPost = baseUrl + '/api/tin-dang/tao-moi';
  static const String getAllPostByAccount = baseUrl + '/api/tin-dang/all-post-by-accountId';

}