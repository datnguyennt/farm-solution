import 'dart:io';

import 'package:farm_market_app/constants/app_images.dart';
import 'package:farm_market_app/constants/constants.dart';
import 'package:farm_market_app/controllers/controller.dart';
import 'package:farm_market_app/core/core.dart';
import 'package:farm_market_app/routes/app_routes.dart';
import 'package:farm_market_app/services/firebase_api.dart';
import 'package:farm_market_app/utils/toast/toast_utils.dart';
import 'package:farm_market_app/views/login/login_otp.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class LoginPage extends GetView<LoginController>{
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Container(
          color: AppColor.backgroundColor,
          width: Get.width,
          height: Get.height,
          child: Stack(children: [
            Align(
              alignment: Alignment.topRight,
              child: InkWell(
                onTap: () => {Get.toNamed(Routes.HOME)},
                child: Container(
                  width: 25.r,
                  height: 25.r,
                  child: Center(
                    child: SvgPicture.asset(
                      AppImages.iconLoginClose,
                      width: 25.r,
                      height: 25.r,
                    ),
                  ),
                ),
              ),
            ),
            Align(
              alignment: Alignment.topCenter,
              child: viewLoginWithSocial(context),
            ),
            legalText(),
          ]),
        ),
      ),
    );
  }

  Widget viewLoginWithSocial(BuildContext context) {
    return Stack(
      children: [
        Align(
          alignment: Alignment.topCenter,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(
                height: 40.h,
              ),
              Image.asset(
                AppImages.logo_login,
                width: 90.r,
                height: 90.r,
              ),
              Padding(
                padding: EdgeInsets.only(top: 20.h, left: 0.w, right: 80.w),
                child: Text(
                  'login'.tr + '\nBằng số điện thoại',
                  textAlign: TextAlign.left,
                  style: AppTextStyle.bold24(color: AppColor.titeFamily),
                ),
              ),
              SizedBox(
                height: 20.h,
              ),
              Text(
                'Chúng tôi sẽ gửi cho bạn một mã OTP với số điện\n thoại bạn nhập bên dưới',
                textAlign: TextAlign.center,
                style: AppTextStyle.regular14(
                  color: AppColor.gray,
                ),
              ),
              SizedBox(
                height: 20.h,
              ),
              GetBuilder<LoginController>(
                builder: (_controller) {
                  return Container(
                    height: 55.h,
                    margin: EdgeInsets.symmetric(horizontal: 10.w),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: _controller.isValid.value == true
                            ? AppColor.gray
                            : AppColor.red,
                      ),
                      borderRadius: BorderRadius.circular(10.r),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          alignment: Alignment.center,
                          width: 80.w,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Image.asset(
                                AppImages.iconVietNam,
                                width: 30.w,
                                height: 30.w,
                              ),
                              Text(
                                '+84',
                                style: AppTextStyle.regular14(
                                    color: AppColor.black),
                              )
                            ],
                          ),
                        ),
                        Expanded(
                          child: TextFormField(
                            keyboardType: TextInputType.phone,
                            maxLines: 1,
                            textAlign: TextAlign.left,
                            controller: controller.phoneNumberController,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              errorStyle: TextStyle(height: 0.h),
                              fillColor: AppColor.backgroundColor,
                              hintText: '0344 768 831',
                              suffixIcon: IconButton(
                                icon: const Icon(Icons.close_outlined),
                                onPressed: () {
                                  controller.clearText();
                                },
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
              SizedBox(height: 16.h),
              Obx(
                () => AbsorbPointer(
                  absorbing: controller.isLoading.value ? true : false,
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      InkWell(
                        onTap: () {
                          controller.validateForm(context);
                        },
                        child: Container(
                          width: 160.w,
                          height: 44.h,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50.r),
                            gradient: AppColor.linearGreen,
                          ),
                          alignment: Alignment.center,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Tiếp theo',
                                style: AppTextStyle.regular14(
                                  color: AppColor.white,
                                ),
                              ),
                              Icon(
                                Icons.arrow_forward_ios_outlined,
                                color: AppColor.white,
                                size: 15.h,
                              ),
                            ],
                          ),
                        ),
                      ),
                      controller.isLoading.value
                          ? const CircularProgressIndicator()
                          : Container(),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 20.h,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 90.w, vertical: 10.h),
                child: Divider(
                  color: AppColor.gray,
                  thickness: 1,
                ),
              ),
              Text(
                'Hoặc đăng nhập với',
                style: AppTextStyle.regular14(
                  color: AppColor.gray,
                ),
              ),
              SizedBox(
                height: 10.h,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 40.w),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    _customButton(AppImages.iconLoginZalo, () {
                      print(1);
                    }),
                    SizedBox(
                      width: 10.w,
                    ),
                    _customButton(
                      AppImages.iconLoginGoogle,
                      () {
                        Get.toNamed(Routes.LOGIN_EMAIL);
                      },
                    ),
                    SizedBox(
                      width: 10.w,
                    ),
                    _customButton(AppImages.iconLoginFacebook, () {}),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  InkWell _customButton(String iconURL, VoidCallback? onButtonPressed) {
    return InkWell(
      onTap: onButtonPressed,
      child: SvgPicture.asset(
        iconURL,
        height: 50.h,
        width: 50.h,
      ),
    );
  }

  Widget legalText() {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Padding(
          padding: EdgeInsets.only(bottom: 30.h, left: 50.w, right: 50.w),
          child: Text.rich(
            TextSpan(
              text: 'legal1'.tr,
              style: AppTextStyle.regular10(color: AppColor.titeFamily),
              children: <TextSpan>[
                TextSpan(
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                        // Single tapped.
                        // Get.toNamed(
                        //   Routes.WEB_VIEW,
                        //   arguments: {'url': policy, 'title': 'legal2'.tr},
                        // );
                      },
                    text: 'legal2'.tr,
                    style: TextStyle(
                      fontSize: 10.sp,
                      decoration: TextDecoration.underline,
                    )),
                TextSpan(
                  text: 'và ',
                  style: AppTextStyle.regular9(color: AppColor.titeFamily),
                ),
                TextSpan(
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                        // Single tapped.
                        // Get.toNamed(
                        //   Routes.WEB_VIEW,
                        //   arguments: {'url': term, 'title': 'legal3'.tr},
                        // );
                      },
                    text: 'legal3'.tr,
                    style: TextStyle(
                      fontSize: 10.sp,
                      decoration: TextDecoration.underline,
                    )),
                TextSpan(
                  text: 'legal4'.tr,
                  style: AppTextStyle.regular10(color: AppColor.titeFamily),
                ),
              ],
            ),
            textAlign: TextAlign.center,
          )),
    );
  }

  //Button đăng nhập
  InkWell btnLogin(BuildContext context) {
    return InkWell(
      onTap: () => {
        //loginController.clickLoggedUser(),
      },
      child: Container(
        width: 250.w,
        height: 44.h,
        decoration: BoxDecoration(
          gradient: AppColor.linearRed,
          borderRadius: BorderRadius.circular(50.r),
        ),
        child: Center(
          child: Text(
            'login'.tr,
            style: AppTextStyle.regular14(color: AppColor.white),
          ),
        ),
      ),
    );
  }
}
