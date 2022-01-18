import 'package:farm_market_app/constants/constants.dart';
import 'package:farm_market_app/controllers/controller.dart';
import 'package:farm_market_app/core/core.dart';
import 'package:farm_market_app/data/entity/entity.dart';
import 'package:farm_market_app/utils/timeago/timeago_utils.dart';
import 'package:farm_market_app/views/views.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class MyPostPage extends GetView<MyPostController> {
  Future<void> _reFreshPage() async {
    controller.isLoading.value = true;
    controller.arrPost.clear();
    controller.arrPostSold.clear();
    controller.arrPostShowing.clear();
    controller.arrPostSuppended.clear();
    controller.arrPostPending.clear();
    controller.refresh();
    controller.getPostDetail();
    return Future.delayed(const Duration(seconds: 2));
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.arrow_back_ios_rounded,
              color: AppColor.black,
            )),
        title: Text(
          'Tin cuar toi',
          style: AppTextStyle.regular14(
            color: AppColor.black,
          ),
        ),
        centerTitle: true,
        backgroundColor: AppColor.white,
        bottom: TabBar(
          isScrollable: true,
          controller: controller.tabController,
          tabs: controller.myTabs,
          labelColor: AppColor.green,
          unselectedLabelColor: AppColor.black,
          indicatorColor: AppColor.green,
        ),
      ),
      body: Padding(
        padding: EdgeInsets.only(top: 10.h),
        child: GetBuilder<MyPostController>(builder: (_controller) {
          return RefreshIndicator(
            onRefresh: _reFreshPage,
            child: TabBarView(
              controller: _controller.tabController,
              children: [
                Stack(
                  children: [
                    Visibility(
                      visible: _controller.arrPostShowing.isEmpty ? false : true,
                      child: Container(
                        width: Get.width,
                        height: Get.height,
                        child: _controller.isLoading.value
                            ? const Center(child: CircularProgressIndicator())
                            : RefreshIndicator(
                          onRefresh: _reFreshPage,
                              child: ListView.builder(
                                  itemCount: _controller.arrPostShowing.length,
                                  padding: EdgeInsets.only(bottom: 10.h),
                                  itemBuilder: (BuildContext context, int index) {
                                    return ItemMyPost(
                                      imageDefault: EndPoint.baseUrl +
                                          _controller.arrPostShowing[index].imageDefault
                                              .toString(),
                                      nameAccount: _controller
                                          .arrPostShowing[index].nameAccount
                                          .toString(),
                                      postTitle: _controller.arrPostShowing[index].title
                                          .toString(),
                                      pricePost:
                                      controller.formatCurrency.format(_controller.arrPostShowing[index].price),
                                      timePost:
                                      TimeAgo.timeAgo(
                                          _controller.arrPostShowing[index].timePost
                                              .toString())
                                          .capitalizeFirst!,
                                      statusPost: _controller
                                          .arrPostShowing[index].statusPost!,
                                      weightName: _controller
                                          .arrPostShowing[index].weightName
                                          .toString(),
                                      weightNumber: _controller
                                          .arrPostShowing[index].weightNumber
                                          .toString(),
                                    );
                                  },
                                ),
                            ),
                      ),
                    ),
                    Visibility(
                        visible: _controller.arrPostShowing.isEmpty ? true : false,
                        child: Container(
                          width: Get.width,
                          height: Get.height,
                          color: AppColor.white,
                          alignment: Alignment.center,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Image.asset(AppImages.errorImage),
                              Text(
                                'post_empty'.tr,
                                style: AppTextStyle.regular18(
                                  color: AppColor.green,
                                ),
                              )
                            ],
                          ),
                        )),
                  ],
                ),
                Stack(
                  children: [
                    Visibility(
                      visible: _controller.arrPostPending.isEmpty ? false : true,
                      child: Container(
                        width: Get.width,
                        height: Get.height,
                        child: _controller.isLoading.value
                            ? const Center(child: CircularProgressIndicator())
                            : RefreshIndicator(
                          onRefresh: _reFreshPage,
                          child: ListView.builder(
                            itemCount: _controller.arrPostPending.length,
                            padding: EdgeInsets.only(bottom: 10.h),
                            itemBuilder: (BuildContext context, int index) {
                              return ItemMyPost(
                                imageDefault: EndPoint.baseUrl +
                                    _controller.arrPostPending[index].imageDefault
                                        .toString(),
                                nameAccount: _controller
                                    .arrPostPending[index].nameAccount
                                    .toString(),
                                postTitle: _controller.arrPostPending[index].title
                                    .toString(),
                                pricePost:
                                controller.formatCurrency.format(_controller.arrPost[index].price),
                                timePost:
                                TimeAgo.timeAgo(
                                    _controller.arrPostPending[index].timePost
                                        .toString())
                                    .capitalizeFirst!,
                                statusPost: _controller
                                    .arrPostPending[index].statusPost!,
                                weightName: _controller
                                    .arrPostPending[index].weightName
                                    .toString(),
                                weightNumber: _controller
                                    .arrPostPending[index].weightNumber
                                    .toString(),
                              );
                            },
                          ),
                        ),
                      ),
                    ),
                    Visibility(
                        visible: _controller.arrPostPending.isEmpty ? true : false,
                        child: Container(
                          width: Get.width,
                          height: Get.height,
                          color: AppColor.white,
                          alignment: Alignment.center,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Image.asset(AppImages.errorImage),
                              Text(
                                'post_empty'.tr,
                                style: AppTextStyle.regular18(
                                  color: AppColor.green,
                                ),
                              )
                            ],
                          ),
                        )),
                  ],
                ),
                Stack(
                  children: [
                    Visibility(
                      visible: _controller.arrPostSuppended.isEmpty ? false : true,
                      child: Container(
                        width: Get.width,
                        height: Get.height,
                        child: _controller.isLoading.value
                            ? const Center(child: CircularProgressIndicator())
                            : RefreshIndicator(
                          onRefresh: _reFreshPage,
                          child: ListView.builder(
                            itemCount: _controller.arrPostSuppended.length,
                            padding: EdgeInsets.only(bottom: 10.h),
                            itemBuilder: (BuildContext context, int index) {
                              return ItemMyPost(
                                imageDefault: EndPoint.baseUrl +
                                    _controller.arrPostSuppended[index].imageDefault
                                        .toString(),
                                nameAccount: _controller
                                    .arrPostSuppended[index].nameAccount
                                    .toString(),
                                postTitle: _controller.arrPostSuppended[index].title
                                    .toString(),
                                pricePost:
                                controller.formatCurrency.format(_controller.arrPostSuppended[index].price),
                                timePost:
                                TimeAgo.timeAgo(
                                    _controller.arrPostSuppended[index].timePost
                                        .toString())
                                    .capitalizeFirst!,
                                statusPost: _controller
                                    .arrPostSuppended[index].statusPost!,
                                weightName: _controller
                                    .arrPostSuppended[index].weightName
                                    .toString(),
                                weightNumber: _controller
                                    .arrPostSuppended[index].weightNumber
                                    .toString(),
                              );
                            },
                          ),
                        ),
                      ),
                    ),
                    Visibility(
                        visible: _controller.arrPostSuppended.isEmpty ? true : false,
                        child: Container(
                          width: Get.width,
                          height: Get.height,
                          color: AppColor.white,
                          alignment: Alignment.center,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Image.asset(AppImages.errorImage),
                              Text(
                                'post_empty'.tr,
                                style: AppTextStyle.regular18(
                                  color: AppColor.green,
                                ),
                              )
                            ],
                          ),
                        )),
                  ],
                ),
                Stack(
                  children: [
                    Visibility(
                      visible: _controller.arrPostSold.isEmpty ? false : true,
                      child: Container(
                        width: Get.width,
                        height: Get.height,
                        child: _controller.isLoading.value
                            ? const Center(child: CircularProgressIndicator())
                            : RefreshIndicator(
                          onRefresh: _reFreshPage,
                          child: ListView.builder(
                            itemCount: _controller.arrPostSold.length,
                            padding: EdgeInsets.only(bottom: 10.h),
                            itemBuilder: (BuildContext context, int index) {
                              return ItemMyPost(
                                imageDefault: EndPoint.baseUrl +
                                    _controller.arrPostSold[index].imageDefault
                                        .toString(),
                                nameAccount: _controller
                                    .arrPostSold[index].nameAccount
                                    .toString(),
                                postTitle: _controller.arrPostSold[index].title
                                    .toString(),
                                pricePost:
                                controller.formatCurrency.format(_controller.arrPostSold[index].price),
                                timePost:
                                TimeAgo.timeAgo(
                                    _controller.arrPostSold[index].timePost
                                        .toString())
                                    .capitalizeFirst!,
                                statusPost: _controller
                                    .arrPostSold[index].statusPost!,
                                weightName: _controller
                                    .arrPostSold[index].weightName
                                    .toString(),
                                weightNumber: _controller
                                    .arrPostSold[index].weightNumber
                                    .toString(),
                              );
                            },
                          ),
                        ),
                      ),
                    ),
                    Visibility(
                        visible: _controller.arrPostSold.isEmpty ? true : false,
                        child: Container(
                          width: Get.width,
                          height: Get.height,
                          color: AppColor.white,
                          alignment: Alignment.center,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Image.asset(AppImages.errorImage),
                              Text(
                                'post_empty'.tr,
                                style: AppTextStyle.regular18(
                                  color: AppColor.green,
                                ),
                              )
                            ],
                          ),
                        )),
                  ],
                ),
              ],
            ),
          );
        }),
      ),
    );
  }
}
