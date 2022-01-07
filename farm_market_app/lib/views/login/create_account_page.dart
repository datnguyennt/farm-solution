import 'dart:io';

import 'package:farm_market_app/constants/constants.dart';
import 'package:farm_market_app/core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:farm_market_app/controllers/controller.dart';
import 'package:image_picker/image_picker.dart';

class CreateAccountPage extends GetView<CreateAccountController> {
  const CreateAccountPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: appBar('create_user'.tr),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.symmetric(
            horizontal: 15.w,
            vertical: 10.h,
          ),
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.r),
            color: AppColor.white,
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 1,
                blurRadius: 2,
                offset: Offset(0, 3), // changes position of shadow
              ),
            ],
          ),
          child: Obx(()=> Form(
              key: controller.createAccountForm,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'full_name'.tr,
                    style: AppTextStyle.regular14(color: AppColor.gray),
                  ), //Fullname
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 10.h),
                    child: TextFormField(
                        maxLines: 1,
                        controller: controller.fullNameController,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'không được để trống';
                          }
                          return null;
                        },
                        keyboardType: TextInputType.text,
                        textInputAction: TextInputAction.next,
                        decoration: InputDecoration(
                          hintText: 'Nhập vào họ tên',
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                width: 1.w, color: AppColor.lightGray),
                            borderRadius: BorderRadius.circular(10.r),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                                color: Colors.white, width: 2.0),
                            borderRadius: BorderRadius.circular(10.r),
                          ),
                          fillColor: AppColor.lightGray,
                          filled: true,
                        )),
                  ),
                  Text(
                    'username'.tr,
                    style: AppTextStyle.regular14(color: AppColor.gray),
                  ), //Fullname
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 10.h),
                    child: TextFormField(
                        maxLines: 1,
                        controller: controller.userNameController,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'không được để trống';
                          }
                          if(value.length < 5){
                            return 'Tên người dùng không được nhỏ hơn 5 kí tự';
                          }
                          return null;
                        },
                        keyboardType: TextInputType.text,
                        textInputAction: TextInputAction.next,
                        decoration: InputDecoration(
                          hintText: 'Nhập vào tên đăng nhập',
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                width: 1.w, color: AppColor.lightGray),
                            borderRadius: BorderRadius.circular(10.r),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                                color: Colors.white, width: 2.0),
                            borderRadius: BorderRadius.circular(10.r),
                          ),
                          fillColor: AppColor.lightGray,
                          filled: true,
                        )),
                  ),
                  Text(
                    'login_phone'.tr,
                    style: AppTextStyle.regular14(color: AppColor.gray),
                  ), //Phone number
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 10.h),
                    child: TextFormField(
                        maxLines: 1,
                        controller: controller.phoneNumberController,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'không được để trống';
                          }
                          if(value.length < 10){
                            return 'Số điện thoại không được nhỏ hơn 10';
                          }
                          return null;
                        },
                        keyboardType: TextInputType.phone,
                        textInputAction: TextInputAction.next,
                        decoration: InputDecoration(
                          hintText: 'Nhập vào số điện thoại',
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                width: 1.w, color: AppColor.lightGray),
                            borderRadius: BorderRadius.circular(10.r),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                                color: Colors.white, width: 2.0),
                            borderRadius: BorderRadius.circular(10.r),
                          ),
                          fillColor: AppColor.lightGray,
                          filled: true,
                        )),
                  ),
                  Text(
                    'email_address'.tr,
                    style: AppTextStyle.regular14(color: AppColor.gray),
                  ), //Email
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 10.h),
                    child: TextFormField(
                        maxLines: 1,
                        controller: controller.emailController,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'không được để trống';
                          }
                          if (!RegExp(r'\S+@\S+\.\S+').hasMatch(value)) {
                            return "Địa chỉ Email không hợp lệ";
                          }
                          return null;
                        },
                        keyboardType: TextInputType.emailAddress,
                        textInputAction: TextInputAction.next,
                        decoration: InputDecoration(
                          hintText: 'Nhập vào địa chỉ email',
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                width: 1.w, color: AppColor.lightGray),
                            borderRadius: BorderRadius.circular(10.r),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                                color: Colors.white, width: 2.0),
                            borderRadius: BorderRadius.circular(10.r),
                          ),
                          fillColor: AppColor.lightGray,
                          filled: true,
                        )),
                  ),
                  Text(
                    'type_new_password'.tr,
                    style: AppTextStyle.regular14(color: AppColor.gray),
                  ),
                Padding(
                      padding: EdgeInsets.only(top: 5.h),
                      child: TextFormField(
                          maxLines: 1,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'không được để trống';
                            }
                            return null;
                          },
                          controller: controller.passwordController,
                          obscureText: controller.obscureText1.value,
                          keyboardType: TextInputType.text,
                          textInputAction: TextInputAction.done,
                          decoration: InputDecoration(
                            hintText: 'type_new_password'.tr,
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  width: 1.w, color: AppColor.lightGray),
                              borderRadius: BorderRadius.circular(10.r),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                  color: Colors.white, width: 2.0),
                              borderRadius: BorderRadius.circular(10.r),
                            ),
                            fillColor: AppColor.lightGray,
                            filled: true,
                            suffixIcon: IconButton(
                              icon: Icon(
                                controller.obscureText1.value
                                    ? Icons.visibility_off
                                    : Icons.visibility,
                              ),
                              onPressed: () {
                                controller.obscureText1.value =
                                    !controller.obscureText1.value;
                              },
                            ),
                          )),
                    ),

                  SizedBox(height: 10.h),
                  Text(
                    'retype_new_password'.tr,
                    style: AppTextStyle.regular14(color: AppColor.gray),
                  ),
                   Padding(
                      padding: EdgeInsets.only(top: 5.h),
                      child: TextFormField(
                          maxLines: 1,
                          validator: (val) {
                            if (val!.isEmpty) {
                              return 'Không được bỏ trống';
                            }
                            if (val != controller.passwordController.text) {
                              return 'Mật khẩu không khớp';
                            }
                            return null;
                          },
                          controller: controller.confirmPasswordController,
                          obscureText: controller.obscureText2.value,
                          keyboardType: TextInputType.text,
                          textInputAction: TextInputAction.done,
                          decoration: InputDecoration(
                            hintText: 'retype_new_password'.tr,
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  width: 1.w, color: AppColor.lightGray),
                              borderRadius: BorderRadius.circular(10.r),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                  color: Colors.white, width: 2.0),
                              borderRadius: BorderRadius.circular(10.r),
                            ),
                            fillColor: AppColor.lightGray,
                            filled: true,
                            suffixIcon: IconButton(
                              icon: Icon(
                                controller.obscureText2.value
                                    ? Icons.visibility_off
                                    : Icons.visibility,
                              ),
                              onPressed: () {
                                controller.obscureText2.value =
                                    !controller.obscureText2.value;
                              },
                            ),
                          )),
                    ),
                  SizedBox(height: 20.h),
                  Stack(
                    alignment: Alignment.center,
                    children: [
                      AbsorbPointer(
                        absorbing: controller.isLoading.value ? true : false,
                        child: InkWell(
                          onTap: () {
                            print('saved');
                            controller.validateForm();
                          },
                          child: Container(
                            width: Get.width,
                            height: 50.h,
                            alignment: Alignment.center,
                            margin: EdgeInsets.symmetric(
                                horizontal: 20.w, vertical: 10.h),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20.r),
                              gradient: AppColor.linearGreen,
                            ),
                            child: Text(
                              'save'.tr,
                              style: AppTextStyle.bold18(color: AppColor.white),
                            ),
                          ),
                        ),
                      ),
                      controller.isLoading.value ? const CircularProgressIndicator() : Container(),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  AppBar appBar(String title) {
    return AppBar(
      backgroundColor: AppColor.white,
      leadingWidth: 0,
      elevation: 1.0,
      toolbarHeight: 50.h,
      centerTitle: true,
      title: Text(
        title,
        textAlign: TextAlign.left,
        style: AppTextStyle.bold14(
          color: AppColor.black,
        ),
      ),
    );
  }
}
