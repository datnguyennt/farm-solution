import 'dart:io';

import 'package:farm_market_app/constants/app_images.dart';
import 'package:farm_market_app/controllers/controller.dart';
import 'package:farm_market_app/core/core.dart';
import 'package:farm_market_app/routes/app_routes.dart';
import 'package:farm_market_app/views/login/login_otp.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class LoginPage extends GetView<LoginController> {
  const LoginPage({Key? key}) : super(key: key);

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
                onTap: () => {
                  Get.toNamed(Routes.HOME)
                },
                child: Container(
                  width: 50.r,
                  height: 50.r,
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
              child: viewLoginWithSocial(),
            ),
            legalText(),
          ]),
        ),
      ),
    );
  }

  Widget viewLoginWithSocial() {
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
              Container(
                margin: EdgeInsets.symmetric(
                  horizontal: 25.w,
                ),
                child: TextField(
                  keyboardType: TextInputType.phone,
                  maxLength: 10,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15.r),
                      ),
                      fillColor: AppColor.backgroundColor,
                      hintText: 'Nhập vào số điện thoại'),
                ),
              ),
              SizedBox(height: 16.h),
              InkWell(
                onTap: () {
                  Get.to(()=> LoginOTPPage());
                  print('Login');
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
                    _customButton(AppImages.iconLoginGoogle, (){
                      Get.toNamed(Routes.LOGIN_EMAIL);
                    },),
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
