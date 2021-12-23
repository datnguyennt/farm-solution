import 'package:cached_network_image/cached_network_image.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:farm_market_app/constants/app_images.dart';
import 'package:farm_market_app/controllers/controller.dart';
import 'package:farm_market_app/core/core.dart';
import 'package:farm_market_app/routes/app_routes.dart';
import 'package:farm_market_app/views/custom/item_setting.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/src/rx_typedefs/rx_typedefs.dart';

class SettingPage extends GetView<SettingController> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          backgroundColor: AppColor.backgroundColor,
          body: Stack(
            children: [
              Positioned(
                top: 0,
                left: 0,
                child: Container(
                  height: Get.height * 0.3,
                  width: Get.width,
                  decoration: BoxDecoration(
                    gradient: AppColor.linearGreen,
                    // color: AppColor.green,
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(40.r),
                      bottomRight: Radius.circular(40.r),
                    ),
                  ),
                  child: Stack(
                    children: [
                      Align(
                        alignment: Alignment.topCenter,
                        child: Padding(
                          padding: EdgeInsets.symmetric(vertical: 10.h),
                          child: Text(
                            'setting'.tr,
                            style: AppTextStyle.bold16(
                              color: AppColor.white,
                            ),
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.center,
                        child: Container(
                          margin: EdgeInsets.symmetric(horizontal: 10.w),
                          width: Get.width,
                          height: 90.h,
                          //color: AppColor.white,
                          child:
                          GetX<SettingController>(
                            builder: (controller) =>
                          Globals.mainUser.fullName == null
                              ? Container(
                            alignment: Alignment.center,
                                  child: Text(
                                    'login_to_continue'.tr,
                                    style: AppTextStyle.regular18(
                                        color: AppColor.white),
                                  ),
                                )
                              : Row(
                                  children: [
                                    SizedBox(
                                      width: 90.h,
                                      height: 90.h,
                                      child: Container(
                                        height: 90.h,
                                        width: 90.h,
                                        decoration: const BoxDecoration(
                                          shape: BoxShape.circle,
                                        ),
                                        child: CachedNetworkImage(
                                          errorWidget: (context, url, error) =>
                                              Icon(
                                            Icons.error_outline_sharp,
                                            size: 100,
                                          ),
                                          imageUrl: Globals.mainUser.avatar
                                              .toString(),
                                          placeholder: (context, url) =>
                                              const CircularProgressIndicator(),
                                          imageBuilder: (context, image) =>
                                              CircleAvatar(
                                            backgroundImage: image,
                                            radius: 150,
                                          ),
                                        ),
                                      ),
                                    ),
                                    Flexible(
                                      child: Container(
                                        padding: EdgeInsets.only(
                                            left: 15.w, right: 5.w),
                                        height: 90.h,
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Obx(
                                              () => Text(
                                                Globals.mainUser.fullName
                                                    .toString(),
                                                maxLines: 1,
                                                overflow: TextOverflow.ellipsis,
                                                style: AppTextStyle.bold16(
                                                  color: AppColor.white,
                                                ),
                                              ),
                                            ),
                                            SizedBox(
                                              height: 5.h,
                                            ),
                                            Text(
                                              Globals.mainUser.phoneNumber !=
                                                      null
                                                  ? Globals.mainUser.phoneNumber
                                                      .toString()
                                                  : '',
                                              style: AppTextStyle.regular14(
                                                color: AppColor.white,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
          GetX<SettingController>(
            builder: (_controller) =>
              Positioned(
                top: Get.height * 0.25,
                left: 25,
                right: 25,
                child: Container(
                  width: Get.width,
                  height: Get.height,
                  padding: EdgeInsets.symmetric(
                    horizontal: 10.w,
                    vertical: 20.h,
                  ),
                  decoration: BoxDecoration(
                    color: AppColor.white,
                    borderRadius: BorderRadius.circular(10.r),
                  ),
                  child: Column(
                    children: [
                      ItemSetting(
                        action: () {
                          print('my_profile'.tr);
                          Globals.mainUser.fullName == null
                              ? controller.showLogin() : Get.toNamed(Routes.PROFILE);
                        },
                        title: 'my_profile'.tr,
                        icon: AppImages.iconProfile,
                        color: AppColor.green,
                      ),
                      Divider(color: AppColor.grayDivider),
                      ItemSetting(
                        action: () {
                          print('notification'.tr);
                          Get.toNamed(Routes.NOTIFICATION);
                        },
                        title: 'notification'.tr,
                        icon: AppImages.iconNotification,
                        color: AppColor.notificationBg,
                      ),
                      Divider(color: AppColor.grayDivider),
                      ItemSetting(
                        action: () {
                          print('setting'.tr);
                          Get.toNamed(Routes.SETTING_APP);
                        },
                        title: 'setting'.tr,
                        icon: AppImages.iconSetting,
                        color: AppColor.settingBg,
                      ),
                      Divider(color: AppColor.grayDivider),
                       ItemSetting(
                        action: () {
                          print('payment'.tr);
                          Globals.mainUser.fullName == null
                              ? _controller.showLogin() : Get.toNamed(Routes.PAYMENT);
                        },
                        title: 'payment'.tr,
                        icon: AppImages.iconPayment,
                        color: AppColor.paymentBg,
                      ),
                      Divider(color: AppColor.grayDivider),
                      Globals.mainUser.fullName != null ?
                      ItemSetting(
                        action: () {
                          print('logout'.tr);

                          _controller.logout();
                        },
                        title: 'logout'.tr,
                        icon: AppImages.iconLogout,
                        color: AppColor.logoutBg,
                      ):
                      ItemSetting(
                        action: () {
                          print('logout'.tr);
                          //_controller.logout();
                          Get.toNamed(Routes.LOGIN_EMAIL);
                        },
                        title: 'login'.tr,
                        icon: AppImages.iconLogout,
                        color: AppColor.green,
                      ),
                    ],
                  ),
                ),
              ),),
            ],
          )),
    );
  }
}
