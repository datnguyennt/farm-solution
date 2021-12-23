import 'package:dotted_border/dotted_border.dart';
import 'package:farm_market_app/controllers/controller.dart';
import 'package:farm_market_app/core/core.dart';
import 'package:farm_market_app/models/model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class PostItemPage extends GetView<PostItemController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.backgroundColor,
      appBar: AppBar(
        backgroundColor: AppColor.white,
        leading: Container(),
        flexibleSpace: Container(
            decoration: BoxDecoration(gradient: AppColor.linearGreen)),
        elevation: 1.0,
        toolbarHeight: 50.h,
        centerTitle: true,
        title: Text(
          'post_product'.tr,
          textAlign: TextAlign.left,
          style: AppTextStyle.regular12(
            color: AppColor.white,
          ),
        ),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(left: 10.w, top: 10.h),
              child: Text(
                'Nhập thông tin nông sản',
                style: AppTextStyle.regular14(color: AppColor.black),
              ),
            ),
            Container(
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
                  Text(
                    'name_product'.tr,
                    style: AppTextStyle.regular14(color: AppColor.gray),
                  ), // Tên nông sản
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 10.h),
                    child: TextField(
                        maxLines: 1,
                        keyboardType: TextInputType.text,
                        textInputAction: TextInputAction.next,
                        decoration: InputDecoration(
                          hintText: 'Nhập vào tên nông sản',
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
                    'type_product'.tr,
                    style: AppTextStyle.regular14(color: AppColor.gray),
                  ), //Loại nông sản
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 5.h),
                    padding:
                        EdgeInsets.symmetric(horizontal: 10.w, vertical: 5.h),
                    width: Get.width,
                    height: 50,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.r),
                      color: AppColor.lightGray,
                    ),
                    child: GetBuilder<PostItemController>(
                      builder: (_controller) {
                        return DropdownButtonHideUnderline(
                          child: DropdownButton<Category>(
                            isExpanded: true,
                            iconSize: 30.h,
                            hint: Text(
                              'Chọn loại nông sản',
                              style:
                                  AppTextStyle.regular14(color: AppColor.gray),
                            ),
                            value: _controller.selectedCategory,
                            items: _controller.categoires
                                .map(_controller.categoryItem)
                                .toList(),
                            onChanged: (value) {
                              _controller.setCategorySelected(value!);
                              _controller.update();
                              print('Don vi tinh chon: ${value.title}');
                            },
                          ),
                        );
                      },
                    ),
                  ),
                  Text(
                    'type_product'.tr,
                    style: AppTextStyle.regular14(color: AppColor.gray),
                  ), //Giá
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 10.h),
                    child: TextField(
                        maxLines: 1,
                        keyboardType: TextInputType.text,
                        textInputAction: TextInputAction.next,
                        decoration: InputDecoration(
                          hintText: 'Nhập vào tên nông sản',
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
                    'type_product'.tr,
                    style: AppTextStyle.regular14(color: AppColor.gray),
                  ), //Đơn vị tính
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 5.h),
                    padding:
                        EdgeInsets.symmetric(horizontal: 10.w, vertical: 5.h),
                    width: Get.width,
                    height: 50,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.r),
                      color: AppColor.lightGray,
                    ),
                    child: GetBuilder<PostItemController>(
                      builder: (_controller) {
                        return DropdownButtonHideUnderline(
                          child: DropdownButton<WeightType>(
                            isExpanded: true,
                            iconSize: 30.h,
                            hint: Text(
                              'Chọn đơn vị tính',
                              style:
                                  AppTextStyle.regular14(color: AppColor.gray),
                            ),
                            value: _controller.selectedWeightTypeItem,
                            items: _controller.weightType
                                .map(_controller.weightTypeItem)
                                .toList(),
                            onChanged: (value) {
                              _controller.setWeightTypeSelected(value!);
                              _controller.update();
                              print('Don vi tinh chon: ${value.title}');
                            },
                          ),
                        );
                      },
                    ),
                  ),
                  Text(
                    'detail'.tr,
                    style: AppTextStyle.regular14(color: AppColor.gray),
                  ), //Mô tả chi tiết
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 10.h),
                    child: TextField(
                        //minLines: 2,
                        maxLines: 10,
                        maxLength: 1000,
                        keyboardType: TextInputType.multiline,
                        textInputAction: TextInputAction.next,
                        decoration: InputDecoration(
                          hintText: 'Nhập vào tên nông sản',
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
                    'add_image'.tr,
                    style: AppTextStyle.regular14(color: AppColor.gray),
                  ),
                  DottedBorder(
                    color: AppColor.orange,
                    strokeWidth: 1,
                    child: Container(
                      width: Get.width,
                      height: 140.h,
                      decoration: BoxDecoration(
                        color: AppColor.addImage,
                      ),
                      child: InkWell(
                        onTap: () async {
                          controller.selectImage();
                          print('chọn ảnh');
                        },
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.add_a_photo_rounded,
                              size: 60.h,
                              color: AppColor.white,
                            ),
                            Text(
                              'select_image'.tr,
                              style:
                                  AppTextStyle.regular16(color: AppColor.white),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 20.h),
                  InkWell(
                    onTap: (){
                      print('saved');
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
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
