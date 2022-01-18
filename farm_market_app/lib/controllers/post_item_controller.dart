import 'dart:developer';
import 'dart:io';

import 'package:dio/dio.dart' as Dio;
import 'package:farm_market_app/constants/constants.dart';
import 'package:farm_market_app/controllers/controller.dart';
import 'package:farm_market_app/core/core.dart';
import 'package:farm_market_app/data/entity/entity.dart';
import 'package:farm_market_app/data/usecase/get_category_usecase.dart';
import 'package:farm_market_app/data/usecase/get_weight_type_usecase.dart';
import 'package:farm_market_app/data/usecase/usecase.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:get/get.dart' as GetX;
import 'package:image_picker/image_picker.dart';

class PostItemController extends GetxController {
  WeightType? selectedWeightTypeItem;
  final postItemForm = GlobalKey<FormState>(debugLabel: 'postItemForm');
  Category? selectedCategory;
  final ImagePicker picker = ImagePicker();
  List<XFile> imageList = [];
  final GetWeightTypeUsecase _getWeightTypeUsecase = GetWeightTypeUsecase();
  final GetCategoryUsecase _getCategoryUsecase = GetCategoryUsecase();
  RxString address = ''.obs;
  Position? position;
  RxString location = ''.obs;

  TextEditingController titleController = TextEditingController();
  TextEditingController categoryController = TextEditingController();
  TextEditingController weightNumberController = TextEditingController();
  TextEditingController weightTypeController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController priceController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  String? title;
  String? categoryId;
  String? price;
  String? description;
  String? weightNumber;
  String? weightId;
  List<XFile> galleryFiles = [];
  XFile? cameraFile;
  List<XFile> imageFiles = [];
  String? lat;
  String? lng;
  String? expiry;
  String? quality;
  String? phoneNumber;
  bool? isDeliver;
  int? AccountID;
  List thumbnailImage = [];
  Post post = Post();
  List<WeightType> _weightType = [];
  List<Category> _category = [];
  RxBool isLoadingWeightType = false.obs;
  TextEditingController qualityController = TextEditingController();
  String? message;

  void setWeightTypeSelected(WeightType value) {
    selectedWeightTypeItem = value;
  }

  List<WeightType> get arrWeightType => _weightType;

  set arrWeightType(List<WeightType> weightType) {
    _weightType = weightType;
  }

  List<Category> get arrCategory => _category;

  set arrCategory(List<Category> categories) {
    _category = categories;
  }

  //Danh sách banner
  Future<List<WeightType>> getWeightType() async {
    //String json = jsonEncode(GetIcoinHistoryRequest().toJson());
    var data = await _getWeightTypeUsecase.getWightTypeResponse();
    if (data != null) {
      isLoadingWeightType.value = false;
      arrWeightType = data;
      print('ahhuhuh ${data.length}');
      return data;
    } else {
      log('mang rong');
      return [];
    }
  }

  Future<List<Category>> getCategory() async {
    //String json = jsonEncode(GetIcoinHistoryRequest().toJson());
    var dataCat = await _getCategoryUsecase.getCategoryResponse();
    if (dataCat != null) {
      isLoadingWeightType.value = false;
      arrCategory = dataCat;
      print('ahhuhuh ${dataCat.length}');
      return dataCat;
    } else {
      log('mang rong');
      return [];
    }
  }

  final CreatePostUsecase _createPostUsecase = CreatePostUsecase();

  void setCategorySelected(Category value) {
    selectedCategory = value;
  }

  //Lấy ảnh từ thư viện
  Future<void> selectImage(ImageSource imageSource) async {
    try {
      if (imageSource == ImageSource.camera) {
        cameraFile = await ImagePicker().pickImage(source: imageSource);
        imageFiles.add(cameraFile!);
      } else {
        galleryFiles = (await ImagePicker().pickMultiImage())!;
        imageFiles.addAll(galleryFiles);
        if (imageFiles.length > 10) {
          imageFiles = imageFiles.sublist(0, 10);
        }
        log('do dai mang anh la ${imageFiles.length}');
      }
    } finally {
      if (Get.isBottomSheetOpen ?? true) Get.back();
      update();
    }
  }

  bool validateMobile(String value) {
    String pattern = r'^(?:[+0]9)?[0-9]{10}$';
    RegExp regExp = RegExp(pattern);
    if (value.length == 0) {
      return false;
    } else if (!regExp.hasMatch(value)) {
      return false;
    }
    return true;
  }

  void checkPhoneNumber() {
    if (validateMobile('03449768331') == true) {
      log('valid number');
    } else {
      log('invalid');
    }
  }

  Future validateForm(BuildContext context) async {
    if (postItemForm.currentState!.validate()) {
      showLoaderDialog(context);
      await createPost();
    } else {
      print('error');
    }
  }

  showLoaderDialog(BuildContext context) {
    AlertDialog alert = AlertDialog(
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            alignment: Alignment.center,
            child: const CircularProgressIndicator(),
          ),
        ],
      ),
    );
    showDialog(
      barrierDismissible: true,
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  Future createPost() async {
    title = titleController.text.trim();
    description = descriptionController.text.trim();
    weightNumber = weightNumberController.text.trim();
    price = priceController.text.trim();
    //quality = qualityController.text.trim();
    quality = 'Good';
    address.value = addressController.text.trim();
    phoneNumber = phoneNumberController.text.trim();
    expiry = '1';
    isDeliver = true;
    AccountID = Globals.mainUser.accountId;
    categoryId = post.CategoryID.toString();
    weightId = post.WeightId.toString();
    lat = post.lat;
    lng = post.lng;

    // title = 'Bán 5 bó rau mới hái hồi chiều năm ngoái';
    // productName = 'Bán 5 bó rau mới hái hồi chiều năm ngoái';
    // description = 'Bán 5 bó rau mới hái hồi chiều năm ngoái';
    // weightNumber = '10';
    // price = '350000';
    // quality = 'Tốt';
    // address.value = 'Tường Sơn, Anh Sơn, Nghệ An';
    // phoneNumber = '03449176831';
    // expiry = '1';
    // isDeliver = true;
    // AccountID = 33;
    // categoryId = '2';
    // weightId = '2';
    // lat = '15.82399';
    // lng = '108.29479';
    thumbnailImage.clear();

    for (var img in imageFiles) {
      thumbnailImage.add(await Dio.MultipartFile.fromFile(img.path,
          filename: img.path.split('/').last));
    }
    if (title!.isNotEmpty &&
        description!.isNotEmpty &&
        weightNumber!.isNotEmpty &&
        price!.isNotEmpty &&
        quality!.isNotEmpty &&
        address.value.isNotEmpty &&
        phoneNumber!.isNotEmpty &&
        expiry!.isNotEmpty &&
        categoryId!.isNotEmpty &&
        weightId!.isNotEmpty &&
        thumbnailImage.isNotEmpty) {
      Dio.FormData formData = Dio.FormData.fromMap({
        'Platform':Globals.platform,
        'Title': title,
        'Description': description,
        'WeightNumber': weightNumber,
        'Price': price,
        'Quality': quality,
        'Address': address,
        'PhoneNumber': phoneNumber,
        'Expiry': expiry,
        'IsDeliver': isDeliver,
        'AccountID': AccountID,
        'CategoryID': categoryId,
        'WeightId': weightId,
        'Lat': lat.toString(),
        'Lng': lng.toString(),
        'ThumbnailImage': thumbnailImage
      });
      var pos = await _createPostUsecase.createPostResponse(formData);
      if (pos.status == StatusResponse.OK) {
        clearTextField();
        Get.back();
        //Get.back();
        //Get.back();
        message = pos.message.toString();
        GetX.Get.snackbar('post_product'.tr, message!,
            backgroundColor: Colors.white,
            duration: const Duration(seconds: 5),
            animationDuration: const Duration(milliseconds: 900),
            margin: EdgeInsets.only(top: 5.h, left: 10.w, right: 10.w));
        Get.back();
      } else {
        Get.back();
      }
    } else {
      GetX.Get.snackbar('post_product'.tr, 'Không được bỏ trống',
          backgroundColor: Colors.white,
          duration: const Duration(seconds: 3),
          animationDuration: const Duration(milliseconds: 900),
          margin: EdgeInsets.only(top: 5.h, left: 10.w, right: 10.w));
    }
  }

  clearTextField() {
    titleController.clear();
    categoryController.clear();
    weightNumberController.clear();
    weightTypeController.clear();
    phoneNumberController.clear();
    priceController.clear();
    addressController.clear();
    descriptionController.clear();
    thumbnailImage.clear();
    imageFiles.clear();
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

  Future<void> getAddressFromLatLong(Position position) async {
    List<Placemark> placemarks =
        await placemarkFromCoordinates(position.latitude, position.longitude);
    Placemark place = placemarks[0];
    address.value =
        '${place.street ?? ''}, ${place.subAdministrativeArea}, ${place.administrativeArea}';
  }

  Future<void> getCurrentAddress() async {
    position = await getGeoLocationPosition();
    List<Placemark> placemarks =
        await placemarkFromCoordinates(position!.latitude, position!.longitude);
    Placemark place = placemarks[0];
    post.lat = position!.latitude.toString();
    post.lng = position!.longitude.toString();
    address.value =
        '${place.street ?? ''}, ${place.subAdministrativeArea}, ${place.administrativeArea}';
    addressController.text = address.value;
    log('lat : ${post.lat} and lng ${post.lng}');

    update();
  }

  @override
  void onInit() async {
    // TODO: implement onInit
    super.onInit();
    isLoadingWeightType.value = true;
    await getWeightType();
    await getCategory();
    //position = await getGeoLocationPosition();
  }
}
