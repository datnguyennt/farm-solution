import 'dart:developer';
import 'dart:io';

import 'package:farm_market_app/data/data.dart';
import 'package:farm_market_app/data/entity/banner.dart';
import 'package:farm_market_app/data/entity/post.dart';
import 'package:farm_market_app/models/model.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:zalo_flutter/zalo_flutter.dart';

class DashboardController extends GetxController {
  Position? position;
  RxString location = ''.obs;
  RxString address = ''.obs;
  double distance = 0;
  List<Post> _arrPost = [];
  List<Banner> _arrBanner = [];
  RxBool isLoading = false.obs;
  RxBool isLoadingBanner = false.obs;
  RxBool isLoadingLocation = false.obs;
  RxInt currentIndexBanner = 0.obs;
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
    isLoadingLocation.value = false;
  }

  List<Post> get arrPost => _arrPost;

  set arrPost(List<Post> posts) {
    _arrPost = posts;
  }

  List<Banner> get arrBanner => _arrBanner;

  set arrBanner(List<Banner> banner) {
    _arrBanner = banner;
  }

  final GetAllPostUsecase _getAllPostUsecase = GetAllPostUsecase();
  final GetBannerUsecase _getBannerUsecase = GetBannerUsecase();

  //Danh sách bài đăng
  Future<List<Post>> getAllPost() async {
    //String json = jsonEncode(GetIcoinHistoryRequest().toJson());
    var data = await _getAllPostUsecase.getAllPostRespone();
    if (data != null) {
      arrPost.map((job) => Post()).toList();
      print(data.length);
      return data;
    } else {
      return [];
    }
  }

  //Danh sách banner
  Future<List<Banner>> getAllBanner() async {
    //String json = jsonEncode(GetIcoinHistoryRequest().toJson());
    var data = await _getBannerUsecase.getAllBannerResponse();
    if (data != null) {
      isLoadingBanner.value = false;
      arrBanner.map((job) => Post()).toList();
      print(data.length);
      return data;
    } else {
      return [];
    }
  }

  calculateDistance() {
    // double distanceInMeters = Geolocator.distanceBetween(position!.latitude,
    //     position!.longitude, double.parse(post.lat!), double.parse(post.lng!));
    // distance = distanceInMeters / 1000;
    //distance = (distanceInMeters / 1000).toStringAsFixed(2);
    for(var i = 0; i< _arrPost.length; i++) {
      _arrPost[i].distance = (Geolocator.distanceBetween(position!.latitude,
          position!.longitude, double.parse(_arrPost[i].lat!), double.parse(_arrPost[i].lng!)))/1000;
      //print("${ls[i].name} is electric? ${ls[i].isElectric}");
    }
    //print(distance.toString());
    //return distance;
  }

  @override
  void onInit() async {
    // TODO: implement onInit
    super.onInit();
    isLoading.value = true;
    isLoadingBanner.value = true;
    isLoadingLocation.value = true;
    position = await getGeoLocationPosition();
    getAddressFromLatLong(position!);
    _arrPost = await getAllPost();
    _arrBanner = await getAllBanner();
    calculateDistance();
    _arrPost.sort((a, b) => a.distance!.compareTo(b.distance!));
    isLoading.value = false;
    //calculateDistance(arrPost[0]);
  }
  @override
  void onReady() async{
    // TODO: implement onReady
    super.onReady();
    isLoading.value = true;
    isLoadingBanner.value = true;
    isLoadingLocation.value = true;
    position = await getGeoLocationPosition();
    getAddressFromLatLong(position!);
    _arrPost = await getAllPost();
    _arrBanner = await getAllBanner();
    calculateDistance();
    _arrPost.sort((a, b) => a.distance!.compareTo(b.distance!));
    isLoading.value = false;

  }

  void loginZalo() async {
    ZaloLogin data = await ZaloFlutter.login();
    //zaloLoginResult = res;
    log('${data.toJson()}');
  }
  // Add this function
  Future<void> _initZaloFlutter() async {
    if (Platform.isAndroid) {
      final hashKey = await ZaloFlutter.getHashKeyAndroid();
      log('HashKey: $hashKey');
    }
  }
}
