import 'dart:io';

import 'package:farm_market_app/constants/app_images.dart';
import 'package:farm_market_app/constants/helper.dart';
import 'package:farm_market_app/core/core.dart';
import 'package:farm_market_app/views/custom/custom_appbar.dart';
import 'package:farm_market_app/views/views.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:farm_market_app/controllers/controller.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';

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
        keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.manual,
        child: Container(
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
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: GetBuilder<ProfileController>(
                    builder: (_c) => Container(
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
                              backgroundImage: profileController.pickedFile !=
                                      null
                                  ? FileImage(
                                      File(profileController.pickedFile!.path),
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
                                              topRight: Radius.circular(16.r)),
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
                                                profileController.selectImage(
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
                                                profileController.selectImage(
                                                    ImageSource.gallery);
                                              },
                                            ),
                                          ],
                                        ),
                                      ),
                                    );
                                  },
                                  child: SvgPicture.asset(AppImages.iconCamera),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 20.h),
                Text(
                  'full_name'.tr,
                  style: AppTextStyle.regular14(color: AppColor.gray),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 10.h),
                  child: TextField(
                      maxLines: 1,
                      keyboardType: TextInputType.text,
                      textInputAction: TextInputAction.next,
                      decoration: InputDecoration(
                        hintText: Globals.mainUser.fullName != null
                            ? Globals.mainUser.fullName.toString()
                            : 'Nhập vào họ tên',
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
                      )),
                ),
                Text(
                  'login_phone'.tr,
                  style: AppTextStyle.regular14(color: AppColor.gray),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 10.h),
                  child: TextField(
                      maxLines: 1,
                      keyboardType: TextInputType.phone,
                      textInputAction: TextInputAction.done,
                      decoration: InputDecoration(
                        hintText: Globals.mainUser.phoneNumber != null
                            ? Globals.mainUser.phoneNumber.toString()
                            : 'Nhập vào số điện thoại',
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
                      )),
                ),
                Text(
                  'dob'.tr,
                  style: AppTextStyle.regular14(color: AppColor.gray),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 10.h),
                  child: GestureDetector(
                    onTap: () {
                      _selectDate(context);
                    },
                    child: AbsorbPointer(
                      child: TextField(
                          maxLines: 1,
                          controller: controller.dateController,
                          keyboardType: TextInputType.datetime,
                          textInputAction: TextInputAction.next,
                          decoration: InputDecoration(
                            hintText: Globals.mainUser.createDate != null
                                ? Globals.mainUser.createDate.toString()
                                : 'Chọn ngày sinh',
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
                  ),
                ),
                Text(
                  'address'.tr,
                  style: AppTextStyle.regular14(color: AppColor.gray),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 10.h),
                  child: TextField(
                      maxLines: 1,
                      keyboardType: TextInputType.text,
                      textInputAction: TextInputAction.next,
                      decoration: InputDecoration(
                        hintText: Globals.mainUser.address != null
                            ? Globals.mainUser.address.toString()
                            : 'Nhập vào địa chỉ',
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
                      )),
                ),
                SizedBox(height: 20.h),
                InkWell(
                  onTap: () {
                    print('saved');
                  },
                  child: Container(
                    width: Get.width,
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

  _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      helpText: 'Chọn ngày sinh',
      locale: Locale('vi', 'VN'),
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );
    if (picked != null) {
      controller.selectedDate = picked;
      var date =
          "${picked.toLocal().day}/${picked.toLocal().month}/${picked.toLocal().year}";
      controller.dateController.text = date;
      print(date);
    } else {
      final f = DateFormat('dd/MM/yyyy');
      controller.dateController.text = f.format(DateTime.now()).toString();
    }
  }
}
