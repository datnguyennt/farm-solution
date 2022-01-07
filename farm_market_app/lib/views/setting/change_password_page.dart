import 'package:farm_market_app/core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:farm_market_app/controllers/controller.dart';

class ChangePasswordPage extends GetView<ChangePasswordController> {
  const ChangePasswordPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: appBar('change_password'.tr),
      body: Container(
          width: Get.width,
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
          child: Form(
            key: controller.changePasswordForm,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'type_old_password'.tr,
                  style: AppTextStyle.regular14(color: AppColor.gray),
                ),
                Obx(
                  () => Padding(
                    padding: EdgeInsets.only(top: 5.h),
                    child: TextFormField(
                      maxLines: 1,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'không được để trống';
                        }
                        return null;
                      },
                      controller: controller.oldPassController,
                      obscureText: controller.obscureText1.value,
                      keyboardType: TextInputType.text,
                      textInputAction: TextInputAction.done,
                      decoration: InputDecoration(
                        errorText: controller.checkOldPass == true
                            ? null
                            : 'Mật khẩu cũ không đúng',
                        hintText: 'type_old_password'.tr,
                        enabledBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(width: 1.w, color: AppColor.lightGray),
                          borderRadius: BorderRadius.circular(10.r),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide:
                              const BorderSide(color: Colors.white, width: 2.0),
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
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 10.h),
                Text(
                  'type_new_password'.tr,
                  style: AppTextStyle.regular14(color: AppColor.gray),
                ),
                Obx(
                  () => Padding(
                    padding: EdgeInsets.only(top: 5.h),
                    child: TextFormField(
                        maxLines: 1,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'không được để trống';
                          }
                          return null;
                        },
                        controller: controller.newPassController,
                        obscureText: controller.obscureText2.value,
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
                ),
                SizedBox(height: 10.h),
                Text(
                  'retype_new_password'.tr,
                  style: AppTextStyle.regular14(color: AppColor.gray),
                ),
                Obx(
                  () => Padding(
                    padding: EdgeInsets.only(top: 5.h),
                    child: TextFormField(
                        maxLines: 1,
                        validator: (val) {
                          if (val!.isEmpty) {
                            return 'Không được bỏ trống';
                          }
                          if (val != controller.newPassController.text) {
                            return 'Mật khẩu không khớp';
                          }
                          return null;
                        },
                        controller: controller.confirmNewPassController,
                        obscureText: controller.obscureText3.value,
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
                              controller.obscureText3.value
                                  ? Icons.visibility_off
                                  : Icons.visibility,
                            ),
                            onPressed: () {
                              controller.obscureText3.value =
                                  !controller.obscureText3.value;
                            },
                          ),
                        )),
                  ),
                ),
                SizedBox(height: 20.h),
                InkWell(
                  onTap: () {
                    controller.validateForm(context);
                  },
                  child: Container(
                    width: 280,
                    height: 50.h,
                    alignment: Alignment.center,
                    margin:
                        EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
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
              ],
            ),
          )),
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
