import 'dart:io';

import 'package:farm_market_app/controllers/controller.dart';
import 'package:farm_market_app/core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:galleryimage/galleryimage.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class ImagePickerWidget extends StatefulWidget {
  const ImagePickerWidget({Key? key}) : super(key: key);

  @override
  _ImagePickerWidgetState createState() => _ImagePickerWidgetState();
}

class _ImagePickerWidgetState extends State<ImagePickerWidget> {
  final _controller = Get.put(PostItemController());

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            AppBar(
              leading: IconButton(
                onPressed: () {
                  _controller.selectedImagePath = ''.obs;
                  _controller.selectedVideoPath = ''.obs;
                  _controller.images.clear();
                  Get.back();
                },
                icon: Icon(Icons.arrow_back_ios_rounded),
              ),
              title: Text(
                'Chọn ảnh',
                style: AppTextStyle.regular14(color: AppColor.white),
              ),
              backgroundColor: AppColor.green,
            ),
            Container(
              height: 120.h,
              width: Get.width,
              child: Obx(
                () => _controller.selectedImagePath.value == ''
                    ? Icon(
                        Icons.add_a_photo_rounded,
                        size: 60.h,
                        color: AppColor.gray,
                      )
                    : Image.file(
                        File(
                          _controller.selectedImagePath.value,
                        ),
                      ),
              ),
            ),
            InkWell(
              onTap: () async {
                await _controller.selectImage(ImageSource.gallery);
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
            Container(
              height: 120.h,
              width: Get.width,
              child: Obx(
                () => _controller.selectedVideoPath.value == ''
                    ? Icon(
                        Icons.add_a_photo_rounded,
                        size: 60.h,
                        color: AppColor.gray,
                      )
                    : Image.file(
                        File(
                          _controller.selectedVideoPath.value,
                        ),
                      ),
              ),
            ),
            InkWell(
              onTap: () async {
                await _controller.selectVideo(ImageSource.gallery);
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
                  'thêm video sản phẩm'.toUpperCase(),
                  style: AppTextStyle.bold14(
                    color: AppColor.black,
                  ),
                ),
              ),
            ),
            Container(
              width: Get.width,
              height: 140,
              child: ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemCount: _controller.images.length,
                  itemBuilder: (BuildContext context, index) {
                    return Container(
                      margin: EdgeInsets.only(right: 5.w),
                      height: 140.h,
                      width: 140.h,
                      child: Image.file(
                          File(_controller.images[index].path)),
                    );
                  },
                ),

            ),
          ],
        ),
      ),
    );
  }
}
