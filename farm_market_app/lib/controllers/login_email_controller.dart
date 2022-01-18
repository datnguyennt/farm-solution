import 'package:farm_market_app/constants/constants.dart';
import 'package:farm_market_app/controllers/controller.dart';
import 'package:farm_market_app/core/global/globals.dart';
import 'package:farm_market_app/data/data.dart';
import 'package:farm_market_app/data/request/login_request.dart';
import 'package:farm_market_app/data/response/login_response.dart';
import 'package:farm_market_app/routes/app_routes.dart';
import 'package:farm_market_app/utils/toast/toast_utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';

class LoginEmailController extends GetxController with ToastUtils {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  SharedPref sharedPref = SharedPref();
  Position? position;
  var username = ''.obs;
  var password = ''.obs;
  RxBool isLoading = false.obs;
  RxBool obscureText = true.obs;
  final LoginUsecase _loginUsecase = LoginUsecase();
  LoginRequest request = LoginRequest();

  Future loginUser() async {
    username.value = emailController.text.trim();
    password.value = passwordController.text.trim();
    // username.value = '0344976831';
    // password.value = '123456';
    if (username.value.isNotEmpty && password.value.isNotEmpty) {
      isLoading.value = true;
      request = LoginRequest(
          loginName: username.value.trim(), password: password.value.trim());
      print(request);
      var pos = await _loginUsecase.loginResponse(request);
      if (pos.status == StatusResponse.OK) {
        Globals.setMainUser(pos.data!.account!);
        sharedPref.save("user", Globals.mainUser);
        clearTextField();
        isLoading.value = false;
        Get.toNamed(Routes.HOME);
      } else {
        isLoading.value = false;
        errorToast(pos.message.toString());
      }
    } else {
      errorToast('Không được bỏ trống tên đăng nhập và mật khẩu');
    }
  }

  void clearTextField() {
    emailController.clear();
    passwordController.clear();
  }
  Future<Position> getGeoLocationPosition() async {
    bool serviceEnabled;
    LocationPermission permission;
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      await Geolocator.openLocationSettings();
      return Future.error('Location services are disabled.');
    }
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }
    return await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.medium);
  }

  @override
  void onInit() async {
    // TODO: implement onInit
    super.onInit();
    obscureText.value = true;
    position = await getGeoLocationPosition();
  }

  @override
  void onClose() {
    super.onClose();
    isLoading.value = false;
    clearTextField();
  }
}
