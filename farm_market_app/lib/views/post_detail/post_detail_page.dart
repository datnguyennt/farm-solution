import 'dart:developer';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:farm_market_app/constants/constants.dart';
import 'package:farm_market_app/controllers/controller.dart';
import 'package:farm_market_app/core/core.dart';
import 'package:farm_market_app/utils/timeago/timeago_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

class PostDetailPage extends GetView<PostDetailController> {
  PostDetailPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.white,
      appBar: appBar(),
      // bottomSheet: Container(
      //   width: Get.width,
      //   height: 60.h,
      //   color: AppColor.green,
      // ),
      body: Obx(
        () => Stack(
          children: [
            Visibility(
                //visible: controller.dataError.value ? false : true,
                visible: controller.dataError.value ? true : false,
                child: Center(
                  child: Image.asset(AppImages.errorImage),
                )),
            Visibility(
              //visible: controller.dataError.value ? true : false,
              visible: controller.dataError.value ? false : true,
              child: SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10.w),
                  child: controller.isLoading.value
                      ? Container(
                          alignment: Alignment.center,
                          width: Get.width,
                          height: Get.height,
                          child: CircularProgressIndicator())
                      : Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: 250.h,
                              child: Stack(
                                alignment: Alignment.center,
                                children: [
                                  CarouselSlider.builder(
                                    itemCount:
                                        controller.post.listImage!.length,
                                    options: CarouselOptions(
                                      onPageChanged: (index, reason) {
                                        controller.currentIndexImage.value =
                                            index + 1;
                                      },
                                      height: 260,
                                      autoPlay:
                                          controller.post.listImage!.length == 1
                                              ? false
                                              : true,
                                      reverse: false,
                                      viewportFraction: 1,
                                      //aspectRatio: 5.0,
                                    ),
                                    itemBuilder: (context, i, id) {
                                      return ClipRRect(
                                        borderRadius:
                                            BorderRadius.circular(10.r),
                                        child: CachedNetworkImage(
                                          fit: BoxFit.contain,
                                          imageUrl: EndPoint.baseUrl +
                                              controller.post.listImage![i]
                                                  .toString(),
                                          imageBuilder:
                                              (context, imageProvider) =>
                                                  Container(
                                            decoration: BoxDecoration(
                                              image: DecorationImage(
                                                image: imageProvider,
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                          ),
                                          placeholder: (context, url) =>
                                              const Center(
                                                  child:
                                                      CircularProgressIndicator()),
                                          errorWidget: (context, url, error) =>
                                              const Icon(Icons.error),
                                        ),
                                      );
                                    },
                                  ),
                                  Positioned(
                                      right: 10,
                                      top: 15,
                                      child: InkWell(
                                        onTap: () {
                                          log('loved');
                                          controller.savedPost();
                                        },
                                        child: Container(
                                          padding: EdgeInsets.all(10.h),
                                          alignment: Alignment.center,
                                          decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            color: AppColor.white,
                                          ),
                                          child: SvgPicture.asset(
                                            AppImages.iconHeart,
                                            width: 15.w,
                                            height: 15.w,
                                            color: controller.isSaved.value
                                                ? AppColor.red
                                                : AppColor.black,
                                          ),
                                        ),
                                      )),
                                  Positioned(
                                      right: 10,
                                      bottom: 15,
                                      child: Container(
                                        padding: EdgeInsets.all(5.h),
                                        alignment: Alignment.center,
                                        decoration: BoxDecoration(
                                          shape: BoxShape.rectangle,
                                          color: AppColor.white,
                                        ),
                                        child: Text(
                                          '${controller.currentIndexImage.value}/${controller.post.listImage!.length.toString()}',
                                        ),
                                      )),
                                ],
                              ),
                            ),
                            SizedBox(height: 10.h),
                            Text(
                              controller.post.title!.capitalize!.toString(),
                              style: AppTextStyle.bold18(
                                color: AppColor.black,
                              ),
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            ),
                            SizedBox(height: 5.h),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  '${controller.formatCurrency.format(controller.post.price)}/ ${controller.post.weightName.toString()}',
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: AppTextStyle.bold14(
                                    color: AppColor.green,
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.only(right: 20.w),
                                  child: Text(
                                    '${controller.post.weightName.toString()}',
                                    style: AppTextStyle.regular14(
                                      color: AppColor.gray,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Text(
                              TimeAgo.timeAgo(
                                      controller.post.timePost!.toString())
                                  .capitalizeFirst!,
                              style: AppTextStyle.regular12(
                                color: AppColor.gray,
                              ),
                            ),
                            SizedBox(height: 5.h),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.location_on_outlined,
                                  color: AppColor.gray,
                                ),
                                Expanded(
                                    child: Text(
                                  controller.isLoadingAddress.value
                                      ? ''
                                      : controller.post.address.toString(),
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                  style: AppTextStyle.regular14(
                                    color: AppColor.black,
                                  ),
                                ))
                              ],
                            ),
                            Divider(
                              color: AppColor.grayDivider,
                              height: 15.h,
                              thickness: 1.5.w,
                            ),
                            SizedBox(
                              width: Get.width,
                              height: 50.h,
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Expanded(
                                    child: Row(
                                      children: [
                                        SizedBox(
                                          width: 50.h,
                                          height: 50.h,
                                          child: CachedNetworkImage(
                                            imageUrl:
                                                'https://firebasestorage.googleapis.com/v0/b/farmmarketapp.appspot.com/o/images%2FDSC_9840%20(1).jpg?alt=media&token=fdb08ec0-6736-4700-a067-38f3f1e53d5d',
                                            placeholder: (context, url) =>
                                                const CircleAvatar(
                                              backgroundColor: Colors.grey,
                                              radius: 150,
                                            ),
                                            imageBuilder: (context, image) =>
                                                CircleAvatar(
                                              backgroundImage: image,
                                              radius: 150,
                                            ),
                                          ),
                                        ),
                                        SizedBox(width: 5.w),
                                        Expanded(
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceEvenly,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                controller.account.fullName !=
                                                        null
                                                    ? controller.account
                                                        .fullName!.capitalize!
                                                        .toString()
                                                    : '',
                                                style: AppTextStyle.regular14(
                                                    color: AppColor.black),
                                                maxLines: 1,
                                                overflow: TextOverflow.ellipsis,
                                              ),
                                              Row(
                                                children: [
                                                  Container(
                                                    height: 10.h,
                                                    width: 10.h,
                                                    decoration: BoxDecoration(
                                                      shape: BoxShape.circle,
                                                      color: AppColor.gray,
                                                    ),
                                                  ),
                                                  SizedBox(width: 5.w),
                                                  Expanded(
                                                    child: Text(
                                                      controller.account
                                                                  .address !=
                                                              null
                                                          ? controller
                                                              .account
                                                              .address!
                                                              .capitalize!
                                                              .toString()
                                                          : 'Địa chỉ chưa cập nhật',
                                                      style: AppTextStyle
                                                          .regular14(
                                                              color: AppColor
                                                                  .gray),
                                                      maxLines: 1,
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                  SizedBox(width: 5.w),
                                  Visibility(
                                    visible: controller.account.fullName != null
                                        ? true
                                        : false,
                                    child: InkWell(
                                      onTap: () async {
                                        await controller.makePhoneCall();
                                      },
                                      child: Container(
                                        width: 90,
                                        height: 40,
                                        alignment: Alignment.center,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(10.r),
                                          color: AppColor.green,
                                        ),
                                        child: Text(
                                          'Liên hệ',
                                          style: AppTextStyle.regular14(
                                            color: AppColor.white,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(height: 5.h),
                            Divider(
                              color: AppColor.grayDivider,
                              height: 15.h,
                              thickness: 1.5.w,
                            ),
                            SizedBox(height: 5.h),
                            Text(
                              'post_detail'.tr,
                              textAlign: TextAlign.start,
                              style: AppTextStyle.bold16(
                                color: AppColor.black,
                              ),
                            ),
                            controller.secondHalf.value == ''
                                ? Text(
                                    controller.description.value == null
                                        ? ''
                                        : controller.description.value,
                                    textAlign: TextAlign.justify,
                                    style: AppTextStyle.regular14(
                                      color: AppColor.black,
                                    ),
                                  )
                                : Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        controller.showMore.value
                                            ? controller.description.value
                                            : controller.firstHalf.value,
                                        textAlign: TextAlign.justify,
                                        style: AppTextStyle.regular14(
                                          color: AppColor.black,
                                        ),
                                      ),
                                      SizedBox(height: 10.h),
                                      InkWell(
                                        onTap: () {
                                          controller.changeStatus();
                                        },
                                        child: Container(
                                          width: Get.width / 3,
                                          padding: EdgeInsets.symmetric(
                                              vertical: 10.h),
                                          child: Row(
                                            children: [
                                              Text(
                                                controller.showMore.value ==
                                                        false
                                                    ? 'Đọc tiếp'
                                                    : 'Thu lại',
                                                textAlign: TextAlign.left,
                                                style: AppTextStyle.bold14(
                                                  color: AppColor.green,
                                                ),
                                              ),
                                              Icon(
                                                controller.showMore.value ==
                                                        false
                                                    ? Icons
                                                        .keyboard_arrow_down_outlined
                                                    : Icons
                                                        .keyboard_arrow_up_outlined,
                                                color: AppColor.green,
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                          ],
                        ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  AppBar appBar() {
    return AppBar(
      backgroundColor: AppColor.white,
      leading: IconButton(
        icon: Icon(
          Icons.arrow_back_ios_sharp,
          color: AppColor.black,
        ),
        onPressed: () {
          Get.back();
        },
      ),
      actions: [
        IconButton(
          onPressed: () {},
          icon: Icon(
            Icons.logout,
            color: AppColor.black,
          ),
        ),
        IconButton(
          onPressed: () {},
          icon: Icon(
            Icons.view_headline_outlined,
            color: AppColor.black,
          ),
        ),
      ],
      elevation: 1.0,
      toolbarHeight: 50.h,
    );
  }
}
