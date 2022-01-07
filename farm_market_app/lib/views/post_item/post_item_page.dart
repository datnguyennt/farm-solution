import 'package:dotted_border/dotted_border.dart';
import 'package:farm_market_app/controllers/controller.dart';
import 'package:farm_market_app/core/core.dart';
import 'package:farm_market_app/models/model.dart';
import 'package:farm_market_app/views/custom/custom.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class PostItemPage extends GetView<PostItemController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.backgroundColor,
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
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
        child: GetBuilder<PostItemController>(builder: (_controller) {
          return Container(
            margin: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
            padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 5.h),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.r),
              color: AppColor.white,
            ),
            child: Form(
              //key: _controller.postItemForm,
              autovalidateMode: AutovalidateMode.disabled,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Tiêu đề bài đăng',
                    style: AppTextStyle.regular14(color: AppColor.gray),
                  ), // Tên nông sản
                  TextFormField(
                    maxLines: 1,
                    keyboardType: TextInputType.text,
                    controller: _controller.titleController,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'không được để trống';
                      }
                      return null;
                    },
                    textInputAction: TextInputAction.next,
                    decoration: InputDecoration(
                      errorBorder: InputBorder.none,
                      errorStyle: AppTextStyle.regular10(color: AppColor.red),
                      hintText: 'Tiêu đề: Cà rốt trồng tại vườn',
                      hintStyle: TextStyle(
                          fontSize: 14.sp,
                          fontStyle: FontStyle.italic,
                          color: AppColor.gray),
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
                    ),
                  ),
                  SizedBox(height: 10.h),
                  Text(
                    'Loại nông sản',
                    style: AppTextStyle.regular14(color: AppColor.gray),
                  ), // Tên nông sản
                  InkWell(
                    onTap: () {
                      showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return _listView(
                                'type_product'.tr,
                                _controller.categoires,
                                _controller.categoryController);
                          });
                    },
                    child: TextFormField(
                      maxLines: 1,
                      keyboardType: TextInputType.text,
                      controller: _controller.categoryController,
                      enabled: false,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'không được để trống';
                        }
                        return null;
                      },
                      textInputAction: TextInputAction.next,
                      decoration: InputDecoration(
                        errorStyle: AppTextStyle.regular10(color: AppColor.red),
                        hintText: 'Chọn loại nông sản',
                        hintStyle: TextStyle(
                            fontSize: 14.sp,
                            fontStyle: FontStyle.italic,
                            color: AppColor.gray),
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
                      ),
                    ),
                  ),
                  SizedBox(height: 10.h),
                  Text(
                    'Đơn vị tính',
                    style: AppTextStyle.regular14(color: AppColor.gray),
                  ), // Tên nông sản
                  InkWell(
                    onTap: () {
                      showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return _listView(
                                'weight_type'.tr,
                                _controller.weightType,
                                _controller.weightTypeController);
                          });
                    },
                    child: TextFormField(
                      maxLines: 1,
                      keyboardType: TextInputType.text,
                      controller: _controller.weightTypeController,
                      enabled: false,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'không được để trống';
                        }
                        return null;
                      },
                      textInputAction: TextInputAction.next,
                      decoration: InputDecoration(
                        errorStyle: AppTextStyle.regular10(color: AppColor.red),
                        hintText: 'Chọn đơn vị tính',
                        hintStyle: TextStyle(
                            fontSize: 14.sp,
                            fontStyle: FontStyle.italic,
                            color: AppColor.gray),
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
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  Text(
                    'Giá bán',
                    style: AppTextStyle.regular14(color: AppColor.gray),
                  ), // Tên nông sản
                  TextFormField(
                    maxLines: 1,
                    keyboardType: TextInputType.number,
                    controller: _controller.priceController,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'không được để trống';
                      }
                      return null;
                    },
                    textInputAction: TextInputAction.next,
                    decoration: InputDecoration(
                      errorStyle: AppTextStyle.regular10(color: AppColor.red),
                      errorBorder: InputBorder.none,
                      hintText: 'Giá bán trên một đơn vị tính VNĐ',
                      hintStyle: TextStyle(
                          fontSize: 14.sp,
                          fontStyle: FontStyle.italic,
                          color: AppColor.gray),
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
                    ),
                  ),
                  Text(
                    'address'.tr,
                    style: AppTextStyle.regular14(color: AppColor.gray),
                  ), // Tên nông sản
                  TextFormField(
                    maxLines: 1,
                    autofocus: false,
                    keyboardType: TextInputType.streetAddress,
                    controller: _controller.addressController,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'không được để trống';
                      }
                      return null;
                    },
                    textInputAction: TextInputAction.next,
                    decoration: InputDecoration(
                      errorStyle: AppTextStyle.regular10(color: AppColor.red),
                      errorBorder: InputBorder.none,
                      hintText: 'Địa chỉ nơi bán',
                      hintStyle: TextStyle(
                          fontSize: 14.sp,
                          fontStyle: FontStyle.italic,
                          color: AppColor.gray),
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
                    ),
                  ),
                  SizedBox(height: 10.h),
                  Text(
                    'Mô tả nông sản'.tr,
                    style: AppTextStyle.regular14(color: AppColor.gray),
                  ), // Tên nông sản
                  TextFormField(
                    autofocus: false,
                    maxLines: 10,
                    keyboardType: TextInputType.text,
                    controller: _controller.descriptionController,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'không được để trống';
                      }
                      return null;
                    },
                    textInputAction: TextInputAction.next,
                    decoration: InputDecoration(
                      errorStyle: AppTextStyle.regular10(color: AppColor.red),
                      errorBorder: InputBorder.none,
                      hintText:
                          'Mô tả về nông sản:\n - Giá bán\n - Chất lượng nông sản\n - ...',
                      hintStyle: TextStyle(
                          fontSize: 14.sp,
                          fontStyle: FontStyle.italic,
                          color: AppColor.gray),
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
                    ),
                  ),
                  SizedBox(height: 20.h),
                  Divider(
                    color: AppColor.grayDivider,
                  ),
                  SizedBox(height: 10.h),
                  InkWell(
                    onTap: () {
                      showDialog(
                          context: context,
                          barrierDismissible: false,
                          builder: (BuildContext context) {
                            return ImagePickerWidget();
                          });
                    },
                    child: Container(
                      margin: EdgeInsets.symmetric(horizontal: 20.w),
                      alignment: Alignment.center,
                      width: Get.width,
                      height: 50,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.r),
                          color: AppColor.grayLight),
                      child: Text(
                        'thêm ảnh sản phẩm'.toUpperCase(),
                        style: AppTextStyle.bold14(
                          color: AppColor.black,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 10.h),
                  Row(
                    children: [
                      Expanded(
                        child: Container(
                          margin: EdgeInsets.symmetric(
                              horizontal: 20.w, vertical: 10.h),
                          child: InkWell(
                            onTap: () {
                              //_controller.validateForm();
                            },
                            child: Container(
                              alignment: Alignment.center,
                              height: 50,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10.r),
                                  color: AppColor.green),
                              child: Text(
                                'Tiếp theo',
                                style:
                                    AppTextStyle.bold16(color: AppColor.white),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        }),
      ),
      //bottomSheet:
    );
  }

  Widget _appbar(String title) {
    return AppBar(
      elevation: 0,
      backgroundColor: AppColor.white,
      iconTheme: IconThemeData(color: AppColor.green),
      automaticallyImplyLeading: false,
      shape: Border(bottom: BorderSide(color: AppColor.gray200)),
      title: Text(
        title,
        style: AppTextStyle.regular16(color: AppColor.black),
      ),
    );
  }

  Widget _listView(
      String title, List arr, TextEditingController textController) {
    return Dialog(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _appbar(title),
          ListView.builder(
            shrinkWrap: true,
            itemCount: arr.length,
            itemBuilder: (BuildContext context, int index) {
              return ListTile(
                contentPadding:
                    EdgeInsets.symmetric(horizontal: 10.w, vertical: 0.h),
                title: Text(
                  arr[index].title.toString(),
                  style: AppTextStyle.regular14(color: AppColor.black),
                ),
                onTap: () {
                  textController.text = arr[index].title;
                  Get.back();
                },
              );
            },
          ),
        ],
      ),
    );
  }
}
