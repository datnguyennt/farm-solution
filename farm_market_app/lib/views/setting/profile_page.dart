import 'dart:io';

import 'package:farm_market_app/constants/app_images.dart';
import 'package:farm_market_app/core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:farm_market_app/controllers/controller.dart';
import 'package:image_picker/image_picker.dart';
class ProfilePage extends GetView<ProfileController> {
  final profileController = Get.put(ProfileController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: appBar(
        'my_profile'.tr,
      ),
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
          child: Obx(
            () => Form(
              key: controller.updateAccountForm,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  GetBuilder<ProfileController>(
                    builder: (_controller) => Center(
                      child: Container(
                        decoration: BoxDecoration(
                          boxShadow: <BoxShadow>[
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.3),
                              blurRadius: 140,
                            ),
                          ],
                        ),
                        child: SizedBox(
                          height: 115,
                          width: 115,
                          child: Stack(
                            clipBehavior: Clip.none,
                            fit: StackFit.expand,
                            children: [
                              CircleAvatar(
                                backgroundImage: _controller.pickedFile != null
                                    ? FileImage(
                                        File(_controller.pickedFile!.path),
                                        // height: 300.0,
                                        // fit: BoxFit.scaleDown,
                                      )
                                    : AssetImage(AppImages.noUser)
                                        as ImageProvider,
                              ),
                              Positioned(
                                right: -16,
                                bottom: 0,
                                child: SizedBox(
                                  height: 46.h,
                                  width: 46.h,
                                  child: FlatButton(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(50.r),
                                      side: BorderSide(color: AppColor.white),
                                    ),
                                    color: Colors.grey[200],
                                    onPressed: () {
                                      Get.bottomSheet(
                                        Container(
                                          decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius: BorderRadius.only(
                                                topLeft: Radius.circular(16.r),
                                                topRight:
                                                    Radius.circular(16.r)),
                                          ),
                                          child: Wrap(
                                            alignment: WrapAlignment.end,
                                            crossAxisAlignment:
                                                WrapCrossAlignment.end,
                                            children: [
                                              ListTile(
                                                leading: Icon(Icons.camera),
                                                title: Text(
                                                  'Camera',
                                                  style: AppTextStyle.regular14(
                                                      color: AppColor.black),
                                                ),
                                                onTap: () {
                                                  controller.selectImage(
                                                      ImageSource.camera);
                                                },
                                              ),
                                              ListTile(
                                                leading: Icon(Icons.image),
                                                title: Text(
                                                  'Thư viện',
                                                  style: AppTextStyle.regular14(
                                                      color: AppColor.black),
                                                ),
                                                onTap: () {
                                                  controller.selectImage(
                                                      ImageSource.gallery);
                                                },
                                              ),
                                            ],
                                          ),
                                        ),
                                      );
                                    },
                                    child:
                                        SvgPicture.asset(AppImages.iconCamera),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ), //Ảnh đại diện
                  SizedBox(height: 20.h),
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
                          hintText: Globals.mainUser.fullName != null
                              ? Globals.mainUser.fullName
                              : 'Nhập vào họ tên',
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
                        enabled: false,
                        keyboardType: TextInputType.text,
                        textInputAction: TextInputAction.next,
                        decoration: InputDecoration(
                          hintText: Globals.mainUser.userName != null
                              ? Globals.mainUser.userName
                              : 'Nhập vào tên đăng nhập',
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
                          if (value.length < 10) {
                            return 'Số điện thoại không được nhỏ hơn 10';
                          }
                          return null;
                        },
                        keyboardType: TextInputType.phone,
                        textInputAction: TextInputAction.next,
                        decoration: InputDecoration(
                          hintText: Globals.mainUser.phoneNumber != null
                              ? Globals.mainUser.phoneNumber
                              : 'Nhập vào số điện thoại',
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
                          hintText: Globals.mainUser.email != null
                              ? Globals.mainUser.email
                              : 'Nhập vào địa chỉ email',
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
                    'address'.tr,
                    style: AppTextStyle.regular14(color: AppColor.gray),
                  ), //Address
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 10.h),
                    child: TextFormField(
                        maxLines: 1,
                        controller: controller.addressController,
                        keyboardType: TextInputType.streetAddress,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'không được để trống';
                          }
                          return null;
                        },
                        textInputAction: TextInputAction.next,
                        decoration: InputDecoration(
                          hintText: Globals.mainUser.address != null
                              ? Globals.mainUser.address
                              : 'Nhập vào địa chỉ',
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
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 5.w),
                    alignment: Alignment.centerRight,
                    child: InkWell(
                      onTap: () async {
                        await controller.getCurrentAddress();
                      },
                      child: Text(
                        'get_current_location'.tr,
                        textAlign: TextAlign.right,
                        style: AppTextStyle.bold12(color: AppColor.red),
                      ),
                    ),
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
                      controller.isLoading.value
                          ? const CircularProgressIndicator()
                          : Container(),
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
      leading: IconButton(
        icon: Icon(
          Icons.arrow_back_ios_sharp,
          color: AppColor.black,
        ),
        onPressed: () {
          Get.back();
        },
      ),
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
