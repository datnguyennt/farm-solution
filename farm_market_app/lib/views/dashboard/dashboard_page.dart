import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:farm_market_app/constants/constants.dart';
import 'package:farm_market_app/controllers/controller.dart';
import 'package:farm_market_app/core/core.dart';
import 'package:farm_market_app/data/entity/post.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class DashBoardPage extends GetView<DashboardController> {
  final _controller = Get.put(DashboardController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.white,
        leadingWidth: 0,
        elevation: 1.0,
        toolbarHeight: 50.h,
        centerTitle: true,
        title: Container(
          width: 280.w,
          child: Row(
            children: [
              Icon(
                Icons.location_on_outlined,
                size: 20.h,
                color: AppColor.black,
              ),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Vị trí hiện tại',
                      textAlign: TextAlign.left,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: AppTextStyle.regular12(
                        color: AppColor.black,
                      ),
                    ),
                    GetX<DashboardController>(
                      builder: (_controller) => Text(
                        _controller.isLoadingLocation.value
                            ? 'Đang lấy vị trí'
                            : _controller.address.value.toString(),
                        textAlign: TextAlign.left,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: AppTextStyle.regular12(
                          color: AppColor.black,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.search_sharp,
              color: AppColor.black,
              size: 25.h,
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
          width: Get.width,
          height: Get.height,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 200.h,
                child: GetX<DashboardController>(
                  builder: (_c) {
                    return _c.isLoadingBanner.value
                        ? Center(child: CircularProgressIndicator())
                        : Stack(
                            children: [
                              CarouselSlider.builder(
                                itemCount: _c.arrBanner.length,
                                options: CarouselOptions(
                                  enlargeCenterPage: true,
                                  height: 200,
                                  autoPlay: true,
                                  onPageChanged: (index, reason) {
                                    _c.currentIndexBanner.value = index;
                                  },
                                  autoPlayInterval: Duration(seconds: 3),
                                  reverse: false,
                                  viewportFraction: 1,
                                  aspectRatio: 5.0,
                                ),
                                itemBuilder: (context, i, id) {
                                  //for onTap to redirect to another screen
                                  return GestureDetector(
                                    child: Container(
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(15),
                                          border: Border.all(
                                            color: Colors.white,
                                          )),
                                      //ClipRRect for image border radius
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(15),
                                        child: Image.network(
                                          EndPoint.baseUrl +
                                              _c.arrBanner[i].imagePath
                                                  .toString(),
                                          width: 500,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                    onTap: () {
                                      //var url = imageList[i];
                                      //print(url.toString());
                                    },
                                  );
                                },
                              ),
                              Align(
                                alignment: Alignment.bottomCenter,
                                child: Padding(
                                  padding: EdgeInsets.only(bottom: 20.h),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: _c.arrBanner.map((e) {
                                      int index = _c.arrBanner.indexOf(e);
                                      return Container(
                                        width:
                                            _c.currentIndexBanner.value == index
                                                ? 15.h
                                                : 8.h,
                                        height:
                                            _c.currentIndexBanner.value == index
                                                ? 10.h
                                                : 8.h,
                                        margin: EdgeInsets.symmetric(
                                            vertical: 10.h, horizontal: 2.w),
                                        decoration: BoxDecoration(
                                          shape: BoxShape.rectangle,
                                          borderRadius:
                                              BorderRadius.circular(10.r),
                                          color: _c.currentIndexBanner.value ==
                                                  index
                                              ? AppColor.green
                                              : AppColor.white,
                                        ),
                                      );
                                    }).toList(),
                                  ),
                                ),
                              )
                            ],
                          );
                  },
                ),
              ),
              SizedBox(height: 15.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'near_by_me'.tr,
                    style: AppTextStyle.regular16(color: AppColor.black),
                  ),
                  InkWell(
                    onTap: () {
                      print('Xem tất cả');
                    },
                    child: Text(
                      'view_all'.tr,
                      style: AppTextStyle.bold14(color: AppColor.green),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10.h),
              GetX<DashboardController>(
                builder: (_c) => _c.isLoading.value
                    ? Container(
                        height: 280.h,
                        alignment: Alignment.center,
                        child: CircularProgressIndicator(),
                      )
                    : listProduct(_c.arrPost),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Container listProduct(List<Post> arrPost) {
    return Container(
      height: 280.h,
      alignment: Alignment.center,
      child: ListView.builder(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemCount: arrPost.length,
        itemBuilder: (context, index) {
          return itemProduct(
            EndPoint.baseUrl + arrPost[index].imageDefault.toString(),
            arrPost[index].title!,
            arrPost[index].nameAccount!,
            arrPost[index].price!,
            arrPost[index].distance!.toStringAsFixed(2),
            //_controller.calculateDistance(arrPost[index]).toStringAsFixed(2),
          );
        },
      ),
    );
  }

  Container itemProduct(
      String image, String name, String author, double price, String distance) {
    return Container(
      margin: EdgeInsets.only(right: 10.w),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.r),
        color: AppColor.white,
      ),
      width: Get.width * 3 / 5,
      height: 250.h,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 180.h,
            //width: Get.width * 3 / 5,
            child: ClipRRect(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10.r),
                topRight: Radius.circular(10.r),
              ),
              child: CachedNetworkImage(
                imageUrl: image,
                errorWidget: (context, url, error) => const Icon(Icons.error),
                progressIndicatorBuilder: (context, url, downloadProgress) =>
                    Center(
                  child: CircularProgressIndicator(
                    value: downloadProgress.progress,
                  ),
                ),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 5),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: AppTextStyle.bold16(color: AppColor.black),
                ),
                Text(
                  author,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: AppTextStyle.regular14(color: AppColor.gray),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '${price.toString()} VND',
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: AppTextStyle.bold14(
                        color: AppColor.black,
                      ),
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.location_on_outlined,
                          size: 20.h,
                        ),
                        Text(
                          '${distance} km',
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: AppTextStyle.regular14(
                            color: AppColor.black,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
