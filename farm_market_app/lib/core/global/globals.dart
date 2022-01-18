import 'package:farm_market_app/data/entity/account.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';

class Globals {
  static RxBool _isNative = false.obs;
  static RxString _deviceId = ''.obs;
  static RxString _platform = ''.obs;
  static RxString _packageName = ''.obs;
  static RxString _language = ''.obs;
  static Rx<Account> _user = Account().obs;

  static bool get isNative => _isNative.value;

  static void setIsNative(bool isNative) => _isNative.value = isNative;

  static String get deviceId => _deviceId.value;

  static void setDeviceId(String deviceId) => _deviceId.value = deviceId;

  static String get platform => _platform.value;

  static void setPlatform(String platform) => _platform.value = platform;

  static String get packageName => _packageName.value;

  static void setPackageName(String packageName) =>
      _packageName.value = packageName;

  static String get language => _language.value;

  static void setLanguage(String language) => _language.value = language;

  static Account get mainUser => _user.value;

  static void setMainUser(Account user) => _user.value = user;
  


}
