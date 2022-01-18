import 'dart:developer';
import 'package:farm_market_app/constants/constants.dart';
import 'package:farm_market_app/data/entity/entity.dart';
import 'package:farm_market_app/data/usecase/usecase.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class MyPostController extends GetxController with GetSingleTickerProviderStateMixin{
  TabController? tabController;
  RxInt selectedIndex = 0.obs;
  final List<Tab> myTabs = <Tab>[
    Tab(text: 'is_showing'.tr),
    Tab(text: 'is_pending'.tr),
    Tab(text: 'suspended'.tr),
    Tab(text: 'post_sold'.tr),
  ];

  RxBool isLoading = false.obs;
  final formatCurrency = NumberFormat.currency(locale: 'vi', symbol: "VNĐ");
  List<Post> arrPost = [];
  List<Post> arrPostPending = [];
  List<Post> arrPostSuppended = [];
  List<Post> arrPostShowing = [];
  List<Post> arrPostSold = [];
  GetPostByAccountUsecase _getPostByAccountUsecase = GetPostByAccountUsecase();
  Future<void> getPostDetail() async {
    //var pos = await _getPostByAccountUsecase.getPostByAccountResponse(Globals.mainUser.accountId!);
    var pos = await _getPostByAccountUsecase.getPostByAccountResponse(33);
    if (pos.status == StatusResponse.OK) {
      isLoading.value = false;
      arrPost = pos.data!;
      arrPostShowing = arrPost.where((i) => i.statusPost == StatusPost.IS_SHOWING).toList();
      arrPostPending = arrPost.where((i) => i.statusPost == StatusPost.IS_PENDING).toList();
      arrPostSuppended = arrPost.where((i) => i.statusPost == StatusPost.SUPPENDED).toList();
      arrPostSold = arrPost.where((i) => i.statusPost == StatusPost.POST_SOLD).toList();
      log('Do dai cua post la : ${arrPost.length.toString()}');
    } else {
      log('Error from api');
    }
    update();
  }
@override
  void onInit() async{
    // TODO: implement onInit
    super.onInit();
    isLoading.value = true;
    tabController = TabController(length: myTabs.length, vsync: this);
    await getPostDetail();
}
}