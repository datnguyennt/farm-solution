import 'dart:developer';

import 'package:farm_market_app/constants/constants.dart';
import 'package:farm_market_app/data/data.dart';
import 'package:farm_market_app/data/entity/entity.dart';
import 'package:geocoding/geocoding.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:video_player/video_player.dart';

class PostDetailController extends GetxController {
  RxString description = ''.tr.obs;
  RxBool isLoading = false.obs;
  RxBool isLoadingName = false.obs;
  RxBool dataError = false.obs;
  RxBool isLoadingAddress = false.obs;
  RxString firstHalf = ''.obs;
  RxString secondHalf = ''.obs;
  RxBool showMore = false.obs;
  RxBool isSaved = false.obs;
  VideoPlayerController? videoController;
  final GetPostDetailUsecase _getPostDetailUsecase = GetPostDetailUsecase();
  final GetAccountByIdUsecase _getAccountByIdUsecase = GetAccountByIdUsecase();
  Post post = Post();
  RxInt currentIndexImage = 0.obs;
  Account account = Account();
  final formatCurrency = NumberFormat.currency(locale: 'vi', symbol: "VNĐ");
  int postId = Get.arguments;
  Future<void> getPostDetail() async {
    var pos = await _getPostDetailUsecase.getPostDetailResponse(postId);
    if (pos.status == StatusResponse.OK) {
      dataError.value = false;
      isLoading.value = false;
      post = pos.data!;
      description.value = pos.data!.description!;
      await getAccountById(pos.data!.accountId!);
      await getAddressFromLatLong(
          double.parse(pos.data!.lat!), double.parse(pos.data!.lng!));
    } else {
      dataError.value = true;
    }
  }

  String getFileExtension(String fileName) {
    return "." + fileName.split('.').last;
  }
  Future<void> getAccountById(int accountId) async {
    var req = await _getAccountByIdUsecase.getAccountByIdResponse(accountId);
    if (req.status == StatusResponse.OK) {
      account = req.data!;
    } else {
      account.fullName = 'user';
    }
    isLoadingName.value = false;
  }

  Future<void> getAddressFromLatLong(double lat, double lng) async {
    List<Placemark> placemarks =
    await placemarkFromCoordinates(lat, lng);
    Placemark place = placemarks[0];
    post.address =
    '${place.street ?? ''}, ${place.subAdministrativeArea}, ${place.administrativeArea}';
    isLoadingAddress.value = false;
  }

  Future<void> makePhoneCall() async {
    // Use `Uri` to ensure that `phoneNumber` is properly URL-encoded.
    // Just using 'tel:$phoneNumber' would create invalid URLs in some cases,
    // such as spaces in the input, which would cause `launch` to fail on some
    // platforms.
    final Uri launchUri = Uri(
      scheme: 'tel',
      path: post.phone,
    );
    await launch(launchUri.toString());
  }

  changeStatus() {
    showMore.value = !showMore.value;
  }

  savedPost() {
    isSaved.value = !isSaved.value;
  }

  @override
  void onInit() async {
    // TODO: implement onInit
    super.onInit();
    postId = Get.arguments;
    currentIndexImage.value = 1;
    isLoading.value = true;
    isSaved.value = false;
    isLoadingName.value = true;
    isLoadingAddress.value = true;
    showMore.value = false;
    dataError.value = false;
    await getPostDetail();
    if (description.value.length > 150) {
      firstHalf.value = description.substring(0, 150);
      secondHalf.value = description.substring(151, description.value.length);
    } else {
      firstHalf = description;
      secondHalf = ''.obs;
    }
  }
}
