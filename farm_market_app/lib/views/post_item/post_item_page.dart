import 'dart:developer';
import 'dart:io';
import 'package:farm_market_app/controllers/controller.dart';
import 'package:farm_market_app/core/core.dart';
import 'package:farm_market_app/data/entity/entity.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class PostItemPage extends GetView<PostItemController> {
  final ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.white,
      resizeToAvoidBottomInset: false,
      appBar: appBar('post_product'.tr),
      body: Stack(
        children: [
          Visibility(
            visible: Globals.mainUser.accountId == null ? true : false,
            child: Container(
              width: Get.width,
              height: Get.height,
              alignment: Alignment.center,
              child: Text(
                'Vui lòng đăng nhập để sử dụng tính năng này',
                style: AppTextStyle.regular14(color: AppColor.black),
              ),
            ),
          ),
          GetBuilder<PostItemController>(
            builder: (_c) => Visibility(
              visible: Globals.mainUser.accountId == null ? false : true,
              child: SingleChildScrollView(
                child: Container(
                  margin:
                      EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
                  padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 5.h),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.r),
                    color: AppColor.white,
                  ),
                  child: Form(
                    key: controller.postItemForm,
                    autovalidateMode: AutovalidateMode.disabled,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Tiêu đề bài đăng',
                          style: AppTextStyle.regular14(color: AppColor.gray),
                        ), // Title
                        TextFormField(
                          maxLines: 1,
                          keyboardType: TextInputType.text,
                          controller: controller.titleController,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'không được để trống';
                            }
                            return null;
                          },
                          textInputAction: TextInputAction.next,
                          decoration: InputDecoration(
                            errorBorder: InputBorder.none,
                            errorStyle:
                                AppTextStyle.regular10(color: AppColor.red),
                            hintText: 'Tiêu đề: Cà rốt trồng tại vườn',
                            hintStyle: TextStyle(
                                fontSize: 14.sp,
                                fontStyle: FontStyle.italic,
                                color: AppColor.gray),
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
                          ),
                        ),
                        SizedBox(height: 10.h),
                        Text(
                          'Loại nông sản',
                          style: AppTextStyle.regular14(color: AppColor.gray),
                        ), // Category
                        InkWell(
                          onTap: () {
                            showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return _listCategoryView(
                                      'type_product'.tr,
                                      controller.arrCategory,
                                      controller.categoryController);
                                });
                          },
                          child: TextFormField(
                            maxLines: 1,
                            keyboardType: TextInputType.text,
                            controller: controller.categoryController,
                            enabled: false,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'không được để trống';
                              }
                              return null;
                            },
                            textInputAction: TextInputAction.next,
                            decoration: InputDecoration(
                              errorStyle:
                                  AppTextStyle.regular10(color: AppColor.red),
                              hintText: 'Chọn loại nông sản',
                              hintStyle: TextStyle(
                                  fontSize: 14.sp,
                                  fontStyle: FontStyle.italic,
                                  color: AppColor.gray),
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
                            ),
                          ),
                        ),
                        SizedBox(height: 10.h),
                        Text(
                          'Đơn vị tính',
                          style: AppTextStyle.regular14(color: AppColor.gray),
                        ),
                        InkWell(
                          onTap: () {
                            showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return controller.isLoadingWeightType.value
                                      ? const Center(
                                          child: CircularProgressIndicator())
                                      : _listWeightTypeView(
                                          'weight_type'.tr,
                                          controller.arrWeightType,
                                          controller.weightTypeController);
                                });
                          },
                          child: TextFormField(
                            maxLines: 1,
                            keyboardType: TextInputType.text,
                            controller: controller.weightTypeController,
                            enabled: false,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'không được để trống';
                              }
                              return null;
                            },
                            textInputAction: TextInputAction.next,
                            decoration: InputDecoration(
                              errorStyle:
                                  AppTextStyle.regular10(color: AppColor.red),
                              hintText: 'Chọn đơn vị tính',
                              hintStyle: TextStyle(
                                  fontSize: 14.sp,
                                  fontStyle: FontStyle.italic,
                                  color: AppColor.gray),
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
                            ),
                          ),
                        ),
                        SizedBox(height: 10.h),
                        Text(
                          'Số lượng muốn bán',
                          style: AppTextStyle.regular14(color: AppColor.gray),
                        ), // WeightId
                        TextFormField(
                          maxLines: 1,
                          keyboardType: TextInputType.number,
                          controller: controller.weightNumberController,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'không được để trống';
                            }
                            return null;
                          },
                          textInputAction: TextInputAction.next,
                          decoration: InputDecoration(
                            errorBorder: InputBorder.none,
                            errorStyle:
                                AppTextStyle.regular10(color: AppColor.red),
                            hintText: 'Số lượng bạn muốn bán là bao nhiêu?',
                            hintStyle: TextStyle(
                                fontSize: 14.sp,
                                fontStyle: FontStyle.italic,
                                color: AppColor.gray),
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
                          ),
                        ), // WeightId
                        SizedBox(
                          height: 10.h,
                        ),
                        Text(
                          'Giá bán',
                          style: AppTextStyle.regular14(color: AppColor.gray),
                        ), // Price
                        TextFormField(
                          maxLines: 1,
                          keyboardType: TextInputType.number,
                          controller: controller.priceController,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'không được để trống';
                            }
                            return null;
                          },
                          textInputAction: TextInputAction.next,
                          decoration: InputDecoration(
                            errorStyle:
                                AppTextStyle.regular10(color: AppColor.red),
                            errorBorder: InputBorder.none,
                            hintText: 'Giá bán trên một đơn vị tính VNĐ',
                            hintStyle: TextStyle(
                                fontSize: 14.sp,
                                fontStyle: FontStyle.italic,
                                color: AppColor.gray),
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
                          ),
                        ),
                        SizedBox(height: 10.h),
                        Text(
                          'login_phone'.tr.capitalizeFirst.toString(),
                          style: AppTextStyle.regular14(color: AppColor.gray),
                        ), // Address
                        TextFormField(
                          maxLines: 1,
                          autofocus: false,
                          keyboardType: TextInputType.phone,
                          controller: controller.phoneNumberController,
                          validator: (value) {
                            if (controller.validateMobile(value!) == false) {
                              return 'Vui lòng nhập đúng số điện thoại';
                            }
                            return null;
                          },
                          textInputAction: TextInputAction.next,
                          decoration: InputDecoration(
                            errorStyle:
                                AppTextStyle.regular10(color: AppColor.red),
                            errorBorder: InputBorder.none,
                            hintText: 'Số điện thoại liên hệ với bạn',
                            hintStyle: TextStyle(
                                fontSize: 14.sp,
                                fontStyle: FontStyle.italic,
                                color: AppColor.gray),
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
                          ),
                        ),
                        SizedBox(height: 5.h),
                        InkWell(
                          onTap: () {
                            controller.phoneNumberController.text =
                                Globals.mainUser.phoneNumber.toString();
                            controller.update();
                          },
                          child: Container(
                            padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 10.h),
                            alignment: Alignment.centerRight,
                            child: Text(
                              'Lấy số của tài khoản',
                              textAlign: TextAlign.right,
                              style: AppTextStyle.bold12(color: AppColor.red),
                            ),
                          ),
                        ),
                        SizedBox(height: 10.h),
                        Text(
                          'address'.tr,
                          style: AppTextStyle.regular14(color: AppColor.gray),
                        ), // Address
                        TextFormField(
                          maxLines: 1,
                          autofocus: false,
                          keyboardType: TextInputType.streetAddress,
                          controller: controller.addressController,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'không được để trống';
                            }
                            return null;
                          },
                          textInputAction: TextInputAction.next,
                          decoration: InputDecoration(
                            errorStyle:
                                AppTextStyle.regular10(color: AppColor.red),
                            errorBorder: InputBorder.none,
                            hintText: 'Địa chỉ nơi bán',
                            hintStyle: TextStyle(
                                fontSize: 14.sp,
                                fontStyle: FontStyle.italic,
                                color: AppColor.gray),
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
                          ),
                        ),
                        SizedBox(height: 5.h),
                        InkWell(
                          onTap: () async {
                            await controller.getCurrentAddress();
                          },
                          child: Container(
                            padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 10.h),
                            alignment: Alignment.centerRight,
                            child: Text(
                              'get_current_location'.tr,
                              textAlign: TextAlign.right,
                              style: AppTextStyle.bold12(color: AppColor.red),
                            ),
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
                          controller: controller.descriptionController,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'không được để trống';
                            }
                            return null;
                          },
                          textInputAction: TextInputAction.next,
                          decoration: InputDecoration(
                            errorStyle:
                                AppTextStyle.regular10(color: AppColor.red),
                            errorBorder: InputBorder.none,
                            hintText:
                                'Mô tả về nông sản:\n - Giá bán\n - Chất lượng nông sản\n - ...',
                            hintStyle: TextStyle(
                                fontSize: 14.sp,
                                fontStyle: FontStyle.italic,
                                color: AppColor.gray),
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
                          ),
                        ),
                        SizedBox(height: 20.h),
                        Divider(
                          color: AppColor.grayDivider,
                        ),
                        SizedBox(height: 10.h),
                        AbsorbPointer(
                          absorbing:
                              controller.imageFiles.length == 10 ? true : false,
                          child: InkWell(
                            onTap: () {
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
                                    crossAxisAlignment: WrapCrossAlignment.end,
                                    children: [
                                      ListTile(
                                        leading: const Icon(Icons.camera),
                                        title: const Text('Camera'),
                                        onTap: () {
                                          controller
                                              .selectImage(ImageSource.camera);
                                        },
                                      ),
                                      ListTile(
                                        leading: const Icon(Icons.image),
                                        title: const Text('Thư viện ảnh'),
                                        onTap: () {
                                          controller
                                              .selectImage(ImageSource.gallery);
                                        },
                                      ),
                                    ],
                                  ),
                                ),
                              );
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
                        ),
                        SizedBox(height: 10.h),
                        Text(
                          'select_image'.tr,
                          style: AppTextStyle.regular14(
                            color: AppColor.gray,
                          ),
                        ),
                        Container(
                          height: 140.h,
                          width: Get.width,
                          child: Stack(
                            alignment: Alignment.center,
                            children: [
                              Visibility(
                                visible: controller.imageFiles.isEmpty
                                    ? true
                                    : false,
                                child: Container(
                                  alignment: Alignment.center,
                                  width: Get.width,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10.r),
                                      border: Border.all(
                                        color: AppColor.green,
                                      )),
                                  child: Text(
                                    'Chưa có ảnh nào',
                                    textAlign: TextAlign.center,
                                    style: AppTextStyle.regular14(
                                        color: AppColor.black),
                                  ),
                                ),
                              ),
                              Visibility(
                                visible: controller.imageFiles.isEmpty
                                    ? false
                                    : true,
                                child: GetBuilder<DashboardController>(
                                  builder: (_c) => ListView.builder(
                                      controller: _scrollController,
                                      shrinkWrap: true,
                                      scrollDirection: Axis.horizontal,
                                      itemCount: controller.imageFiles.length,
                                      itemBuilder: (BuildContext ctx, index) {
                                        return Container(
                                          margin: EdgeInsets.only(right: 10.w),
                                          child: Stack(
                                            alignment: Alignment.center,
                                            children: [
                                              Container(
                                                height: 140.h,
                                                width: 140.w,
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          10.r),
                                                  border: Border.all(
                                                    color: AppColor.green,
                                                  ),
                                                ),
                                                child: ClipRRect(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          10.r),
                                                  child: Image(
                                                    image: FileImage(
                                                      File(controller
                                                          .imageFiles[index]
                                                          .path),
                                                    ),
                                                    fit: BoxFit.cover,
                                                  ),
                                                ),
                                              ),
                                              Positioned(
                                                right: 0,
                                                top: 0,
                                                child: InkWell(
                                                  onTap: () {
                                                    controller.imageFiles
                                                        .removeAt(index);
                                                    controller.update();
                                                    log('da xoa');
                                                  },
                                                  child: Container(
                                                    padding:
                                                        EdgeInsets.all(5.h),
                                                    decoration: BoxDecoration(
                                                        color: AppColor.white,
                                                        borderRadius:
                                                            BorderRadius.only(
                                                          topRight:
                                                              Radius.circular(
                                                                  10.r),
                                                        ),
                                                        border: Border.all(
                                                          color: AppColor.gray,
                                                          style:
                                                              BorderStyle.solid,
                                                        )),
                                                    child: Icon(
                                                      Icons.delete_rounded,
                                                      color: AppColor.orange,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        );
                                      }),
                                ),
                              )
                            ],
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
                                    //await controller.createPost();
                                    //controller.checkPhoneNumber();
                                    controller.validateForm(context);
                                  },
                                  child: Container(
                                    alignment: Alignment.center,
                                    height: 50,
                                    decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(10.r),
                                        color: AppColor.green),
                                    child: Text(
                                      'Tiếp theo',
                                      style: AppTextStyle.bold16(
                                          color: AppColor.white),
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
                ),
              ),
            ),
          ),
        ],
      ),
      //bottomSheet:
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

  Widget _appbarDialog(String title) {
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

  Widget _listWeightTypeView(String title, List<WeightType> arr,
      TextEditingController textController) {
    return Dialog(
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _appbarDialog(title),
            ListView.builder(
              shrinkWrap: true,
              itemCount: arr.length,
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  contentPadding:
                      EdgeInsets.symmetric(horizontal: 10.w, vertical: 0.h),
                  title: Text(
                    arr[index].weightName.toString(),
                    style: AppTextStyle.regular14(color: AppColor.black),
                  ),
                  onTap: () {
                    textController.text = arr[index].weightName.toString();
                    controller.post.WeightId = index + 1;
                    log(controller.post.WeightId.toString());
                    Get.back();
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _listCategoryView(
      String title, List<Category> arr, TextEditingController textController) {
    return Dialog(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _appbarDialog(title),
          ListView.builder(
            shrinkWrap: true,
            itemCount: arr.length,
            itemBuilder: (BuildContext context, int index) {
              return ListTile(
                contentPadding:
                    EdgeInsets.symmetric(horizontal: 10.w, vertical: 0.h),
                title: Text(
                  arr[index].cateName.toString(),
                  style: AppTextStyle.regular14(color: AppColor.black),
                ),
                onTap: () {
                  textController.text = arr[index].cateName.toString();
                  controller.post.CategoryID = index + 1;
                  log(controller.post.CategoryID.toString());
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
