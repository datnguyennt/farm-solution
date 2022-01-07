import 'dart:io';

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
import 'package:get/get.dart';
import 'package:dio/dio.dart' as Dio;
import 'package:image_picker/image_picker.dart';
import 'package:flutter_google_places/flutter_google_places.dart';

class ProfileController extends GetxController {
  final updateAccountForm = GlobalKey<FormState>(debugLabel: 'updateAccountForm');
  Position? position;
  RxString location = ''.obs;

  TextEditingController fullNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController userNameController = TextEditingController();
  RxString fullName = ''.obs;
  RxString email = ''.obs;
  RxString phoneNumber = ''.obs;
  RxString address = ''.obs;
  RxString userName = ''.obs;
  RxString message = ''.obs;
  var file;
  final UpdateAccountUsecase _updateAccountUsecase = UpdateAccountUsecase();
  final PhoneLoginUsecase _loginUsecase = PhoneLoginUsecase();
  SharedPref sharedPref = SharedPref();
  final _homeController = Get.put(HomeController());
  RxBool isLoading = false.obs;
  Dio.FormData formData = Dio.FormData();
  XFile? pickedFile;

  void selectImage(ImageSource imageSource) async {
    try {
      pickedFile = await ImagePicker().pickImage(source: imageSource);
    } finally {
      if (Get.isBottomSheetOpen ?? true) Get.back();
      update();
    }
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

  Future<void> getCurrentAddress() async {
    List<Placemark> placemarks =
        await placemarkFromCoordinates(position!.latitude, position!.longitude);
    Placemark place = placemarks[0];
    address.value =
        '${place.street ?? ''}, ${place.subAdministrativeArea}, ${place.administrativeArea}';
    addressController.text = address.value;
  }

  Future validateForm() async {
    if (updateAccountForm.currentState!.validate()) {
      updateAccount();
      isLoading.value = true;
    } else {
      isLoading.value = false;
      print('error');
    }
  }

  void fetchData() {
    fullNameController.text = Globals.mainUser.fullName.toString();
    addressController.text = Globals.mainUser.address != null ? Globals.mainUser.address.toString() : '';
    phoneNumberController.text = Globals.mainUser.phoneNumber.toString();
    emailController.text = Globals.mainUser.email.toString();
    userNameController.text = Globals.mainUser.userName.toString();
  }

  void getDataFromTextField() {
    var file =
        pickedFile != null ? File(pickedFile!.path) : Globals.mainUser.avatar;
    fullName.value = fullNameController.text.trim().isEmpty
        ? Globals.mainUser.fullName.toString()
        : fullNameController.text.trim();
    phoneNumber.value = phoneNumberController.text.trim().isEmpty
        ? Globals.mainUser.phoneNumber.toString()
        : phoneNumberController.text.trim();
    address.value = addressController.text.trim().isEmpty
        ? Globals.mainUser.address.toString()
        : addressController.text.trim();
    email.value = emailController.text.trim().isEmpty
        ? Globals.mainUser.email.toString()
        : emailController.text.trim();
    userName.value = userNameController.text.trim().isEmpty
        ? Globals.mainUser.userName.toString()
        : userNameController.text.trim();
  }

  bool checkValidate() {
    getDataFromTextField();
    if (fullName.value.isEmpty && address.value.isEmpty) {
      return false;
    }
    return true;
  }

  Future updateAccount() async {
    if (checkValidate()) {
      getDataFromTextField();
      if (pickedFile != null) {
        file = File(pickedFile!.path);
        String imageName = pickedFile!.path.split('/').last;
        formData = Dio.FormData.fromMap({
          'AccountID': Globals.mainUser.accountId.toString(),
          'FullName': fullName.value,
          'PhoneNumber': phoneNumber.value,
          'Email': email.value,
          'Address': address.value,
          'UserName': userName.value,
          "ThumbnailImage": await Dio.MultipartFile.fromFile(
            file.path,
            filename: imageName,
          ),
        });
      } else {
        formData = Dio.FormData.fromMap({
          'AccountID': Globals.mainUser.accountId.toString(),
          'FullName': fullName.value,
          'PhoneNumber': phoneNumber.value,
          'Email': email.value,
          'Address': address.value,
          'UserName': userName.value,
        });
      }

      var update = await _updateAccountUsecase.updateAccountResponse(
          Globals.mainUser.accountId.toString(), formData);
      message.value = update.message.toString();
      if (update.status == StatusResponse.OK) {
        clearTextField();
        Get.back();
        //Get.back();
        GetX.Get.snackbar('update_account'.tr, message.value,
            backgroundColor: Colors.white,
            duration: const Duration(seconds: 3),
            animationDuration: const Duration(milliseconds: 900),
            margin: EdgeInsets.only(top: 5.h, left: 10.w, right: 10.w));
        var login = await _loginUsecase.phoneLoginResponse(phoneNumber.value);
        if (login.status == StatusResponse.OK) {
          Globals.setMainUser(login.data!);
          sharedPref.save("user", Globals.mainUser);
          // _homeController.tabIndex = 0;
          // Get.toNamed(Routes.HOME);
          isLoading.value = false;
        }
      } else {
        GetX.Get.snackbar('update_account'.tr, message.value,
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
    addressController.clear();
    phoneNumberController.clear();
    emailController.clear();
    userNameController.clear();
  }

  @override
  void onInit() async {
    // TODO: implement onInit
    super.onInit();
    position = await getGeoLocationPosition();
    fetchData();
  }
}
