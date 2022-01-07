import 'package:farm_market_app/constants/app_images.dart';
import 'package:farm_market_app/controllers/controller.dart';
import 'package:farm_market_app/core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class LoginOTPPage extends GetView<OTPController> {
  final otpController = Get.put(OTPController());
  final loginController = Get.put(LoginController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text(
          'Nhập OTP',
          style: AppTextStyle.regular14(color: AppColor.white),
        ),
        centerTitle: true,
        toolbarHeight: 50,
        flexibleSpace: Container(
          decoration: BoxDecoration(gradient: AppColor.linearGreen),
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          onPressed: () {
            Get.back();
          },
        ),
      ),
      body: Center(
        child: Container(
          height: Get.height,
          width: Get.width,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                height: 40.h,
              ),
              Image.asset(
                AppImages.otpImage,
                width: 90.r,
                height: 90.r,
              ),
              Padding(
                padding: EdgeInsets.only(top: 20.h, left: 0.w, right: 20.w),
                child: Text(
                  'login'.tr + ' bằng số điện thoại',
                  textAlign: TextAlign.left,
                  style: AppTextStyle.bold20(color: AppColor.titeFamily),
                ),
              ),
              SizedBox(
                height: 20.h,
              ),
              Text(
                'Nhập vào mã OTP đã được gửi đến số \n ${controller.phoneSendToAPI}',
                textAlign: TextAlign.center,
                style: AppTextStyle.regular14(
                  color: AppColor.gray,
                ),
              ),
              SizedBox(
                height: 20.h,
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 20.w,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    SizedBox(
                      width: 40.w,
                      child: TextFormField(
                        obscureText: true,
                        controller: otpController.pin1Controller,
                        keyboardType: TextInputType.number,
                        textAlign: TextAlign.center,
                        style: AppTextStyle.regular24(
                          color: AppColor.gray,
                        ),
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.symmetric(
                              vertical: 15.h, horizontal: 5.w),
                          enabledBorder: outlineInputBorder(),
                          focusedBorder: outlineInputBorder(),
                          border: outlineInputBorder(),
                        ),
                        autofocus: true,
                        onChanged: (value) {
                          otpController.nextField(
                              value, otpController.pin2Node);
                        },
                      ),
                    ),
                    SizedBox(
                      width: 40.w,
                      child: TextFormField(
                        controller: otpController.pin2Controller,
                        focusNode: otpController.pin2Node,
                        obscureText: true,
                        keyboardType: TextInputType.number,
                        textAlign: TextAlign.center,
                        style: AppTextStyle.regular24(
                          color: AppColor.gray,
                        ),
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.symmetric(
                              vertical: 15.h, horizontal: 5.w),
                          enabledBorder: outlineInputBorder(),
                          focusedBorder: outlineInputBorder(),
                          border: outlineInputBorder(),
                        ),
                        onChanged: (value) {
                          otpController.nextField(
                              value, otpController.pin3Node);
                        },
                      ),
                    ),
                    SizedBox(
                      width: 40.w,
                      child: TextFormField(
                        controller: otpController.pin3Controller,
                        focusNode: otpController.pin3Node,
                        obscureText: true,
                        keyboardType: TextInputType.number,
                        textAlign: TextAlign.center,
                        style: AppTextStyle.regular24(
                          color: AppColor.gray,
                        ),
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.symmetric(
                              vertical: 15.h, horizontal: 5.w),
                          enabledBorder: outlineInputBorder(),
                          focusedBorder: outlineInputBorder(),
                          border: outlineInputBorder(),
                        ),
                        onChanged: (value) {
                          otpController.nextField(
                              value, otpController.pin4Node);
                        },
                      ),
                    ),
                    SizedBox(
                      width: 40.w,
                      child: TextFormField(
                        focusNode: otpController.pin4Node,
                        controller: otpController.pin4Controller,
                        obscureText: true,
                        keyboardType: TextInputType.number,
                        textAlign: TextAlign.center,
                        style: AppTextStyle.regular24(
                          color: AppColor.gray,
                        ),
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.symmetric(
                              vertical: 15.h, horizontal: 5.w),
                          enabledBorder: outlineInputBorder(),
                          focusedBorder: outlineInputBorder(),
                          border: outlineInputBorder(),
                        ),
                        onChanged: (value) {
                          otpController.nextField(
                              value, otpController.pin5Node);
                        },
                      ),
                    ),
                    SizedBox(
                      width: 40.w,
                      child: TextFormField(
                        focusNode: otpController.pin5Node,
                        controller: otpController.pin5Controller,
                        obscureText: true,
                        keyboardType: TextInputType.number,
                        textAlign: TextAlign.center,
                        style: AppTextStyle.regular24(
                          color: AppColor.gray,
                        ),
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.symmetric(
                              vertical: 15.h, horizontal: 5.w),
                          enabledBorder: outlineInputBorder(),
                          focusedBorder: outlineInputBorder(),
                          border: outlineInputBorder(),
                        ),
                        onChanged: (value) {
                          otpController.nextField(
                              value, otpController.pin6Node);
                        },
                      ),
                    ),
                    SizedBox(
                      width: 40.w,
                      child: TextFormField(
                        maxLength: 1,
                        controller: otpController.pin6Controller,
                        focusNode: otpController.pin6Node,
                        obscureText: true,
                        keyboardType: TextInputType.number,
                        textAlign: TextAlign.center,
                        style: AppTextStyle.regular24(
                          color: AppColor.gray,
                        ),
                        decoration: InputDecoration(
                          counterText: "",
                          contentPadding: EdgeInsets.symmetric(
                              vertical: 15.h, horizontal: 5.w),
                          enabledBorder: outlineInputBorder(),
                          focusedBorder: outlineInputBorder(),
                          border: outlineInputBorder(),
                        ),
                        onChanged: (value) {
                          otpController.pin6Node.unfocus();
                        },
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20.h,
              ),
              Obx(()
                => Text(
                  controller.messageResponse.value,
                  style: AppTextStyle.regular14(color: AppColor.black),
                ),
              ),
              SizedBox(
                height: 10.h,
              ),
              Obx(
                () => Stack(
                  alignment: Alignment.center,
                  children: [
                    AbsorbPointer(
                      absorbing: controller.isLoading.value ? true : false,
                      child: InkWell(
                        onTap: () {
                          String otp =
                              '${controller.pin1Controller.text}${controller.pin2Controller.text}${controller.pin3Controller.text}${controller.pin4Controller.text}${controller.pin5Controller.text}${controller.pin6Controller.text}';
                          print('otp is ${otp}');
                          controller.phoneCredential(context, otp);
                        },
                        child: Container(
                          width: 160.w,
                          height: 44.h,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50.r),
                            gradient: AppColor.linearGreen,
                          ),
                          alignment: Alignment.center,
                          child: Text(
                            'login'.tr,
                            style: AppTextStyle.regular14(
                              color: AppColor.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                    //CircularProgressIndicator(),
                    controller.isLoading.value
                        ? const CircularProgressIndicator()
                        : Container(),
                  ],
                ),
              ),
              SizedBox(
                height: 30.h,
              ),
              InkWell(
                onTap: () async{
                  await loginController.verifyPhoneNumber();
                },
                child: Text(
                  'Gửi lại OTP',
                  style: AppTextStyle.regular14(
                    color: AppColor.gray,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  OutlineInputBorder outlineInputBorder() {
    return OutlineInputBorder(
        borderRadius: BorderRadius.circular(10.r),
        borderSide: BorderSide(color: AppColor.gray));
  }
}
