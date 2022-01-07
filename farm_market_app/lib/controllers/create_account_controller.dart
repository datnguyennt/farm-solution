import 'package:farm_market_app/constants/constants.dart';
import 'package:farm_market_app/controllers/controller.dart';
import 'package:farm_market_app/core/core.dart';
import 'package:farm_market_app/data/data.dart';
import 'package:farm_market_app/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart' as GetX;
import 'package:image_picker/image_picker.dart';
import 'package:dio/dio.dart' as Dio;
import 'package:get/get.dart';

class CreateAccountController extends GetxController {
  final createAccountForm = GlobalKey<FormState>(debugLabel: 'createAccountForm');

  TextEditingController fullNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  TextEditingController userNameController = TextEditingController();
  RxString fullName = ''.obs;
  RxString email = ''.obs;
  RxString phoneNumber = ''.obs;
  RxString password = ''.obs;
  RxString confirmPassword = ''.obs;
  RxString userName = ''.obs;
  GetX.RxString message = ''.obs;
  final CreateAccountUsecase _createAccountUsecase = CreateAccountUsecase();
  final PhoneLoginUsecase _loginUsecase = PhoneLoginUsecase();
  SharedPref sharedPref = SharedPref();
  final _homeController = Get.put(HomeController());
  RxBool isLoading = false.obs;
  RxBool obscureText1 = true.obs;
  RxBool obscureText2 = true.obs;

  Future validateForm() async {
    if (createAccountForm.currentState!.validate()) {
      createAccount();
      isLoading.value = true;
    } else {
      isLoading.value = false;
      print('error');
    }
  }


  void getDataFromTextField() {
    fullName.value = fullNameController.text.trim();
    phoneNumber.value = phoneNumberController.text.trim();
    password.value = passwordController.text.trim();
    confirmPassword.value = confirmPasswordController.text.trim();
    email.value = emailController.text.trim();
    userName.value = userNameController.text.trim();
  }

  bool checkValidate() {
    getDataFromTextField();
    if (fullName.value.isEmpty &&
        phoneNumber.value.isEmpty &&
        email.value.isEmpty &&
        password.value.isEmpty &&
        confirmPassword.value.isEmpty &&
        userName.value.isEmpty) {
      return false;
    }
    return true;
  }

  Future createAccount() async {
    if (checkValidate()) {
      getDataFromTextField();
      Dio.FormData formData = Dio.FormData.fromMap({
        'FullName': fullName.value,
        'PhoneNumber': phoneNumber.value,
        'Email': email.value,
        'UserName': userName.value,
        'Password': password.value,
        'ConfirmPassword': confirmPassword.value,
      });
      var create = await _createAccountUsecase.createAccountResponse(formData);
      message.value = create.message.toString();
      if (create.status == StatusResponse.OK) {
        clearTextField();
        Get.back();
        //Get.back();
        GetX.Get.snackbar('create_user'.tr, message.value,
            backgroundColor: Colors.white,
            duration: const Duration(seconds: 3),
            animationDuration: const Duration(milliseconds: 900),
            margin: EdgeInsets.only(top: 5.h, left: 10.w, right: 10.w));
        var login = await _loginUsecase.phoneLoginResponse(phoneNumber.value);
        if (login.status == StatusResponse.OK) {
          Globals.setMainUser(login.data!);
          sharedPref.save("user", Globals.mainUser);
          _homeController.tabIndex = 0;
          Get.toNamed(Routes.HOME);
          isLoading.value = false;
        }
      } else {
        GetX.Get.snackbar('create_user'.tr, message.value,
            backgroundColor: Colors.white,
            duration: const Duration(seconds: 3),
            animationDuration: const Duration(milliseconds: 900),
            margin: EdgeInsets.only(top: 5.h, left: 10.w, right: 10.w));
        isLoading.value = false;
      }
    }
    update();
  }

  clearTextField() {
    fullNameController.clear();
    phoneNumberController.clear();
    emailController.clear();
    passwordController.clear();
    confirmPasswordController.clear();
    userNameController.clear();
  }

  getPhoneNumber() {
    if (Get.arguments != null) {
      phoneNumber = Get.arguments;
    } else {
      phoneNumber.value = '';
    }
  }

  @override
  void onInit() async {
    // TODO: implement onInit
    super.onInit();
    getPhoneNumber();
    print(phoneNumber.toString());
    isLoading.value = false;
    phoneNumberController.text = phoneNumber.toString();
    obscureText1.value = true;
    obscureText2.value = true;
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
    isLoading.value = false;
    clearTextField();
  }
}
