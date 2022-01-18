import 'dart:developer';
import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:farm_market_app/constants/constants.dart';
import 'package:farm_market_app/core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class ItemMyPost extends StatelessWidget {
  String imageDefault;
  String nameAccount;
  String postTitle;
  String weightName;
  String weightNumber;
  String timePost;
  int statusPost;
  String pricePost;

  ItemMyPost({
    required this.nameAccount,
    required this.postTitle,
    required this.statusPost,
    required this.weightNumber,
    required this.weightName,
    required this.timePost,
    required this.imageDefault,
    required this.pricePost,
  });
  statusSwitch(int statusPos) {
    switch (statusPos) {
      case 0:
      return 'Đang đợi duyệt';
        break;
      case 1:
        return 'Bị từ chối';
        break;
      case 2:
        return 'Đang hiển thị';
        break;
      case 3:
        return 'Đã bán';
      // do something else
        break;
    }
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 5.h),
      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 5.h),
      width: Get.width,
      height: 100.h,
      color: AppColor.white,
      child: InkWell(
        onTap: () {
          log('go to detail post');
        },
        child: Column(
          children: [
            _header(), //Title
            SizedBox(height: 5.h),
            _body(),
          ],
        ),
      ),
    );
  }

  Row _header() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SizedBox(
          width: 230.w,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Icon(
                Icons.person,
                color: AppColor.gray,
              ),
              Flexible(
                child: Text(
                  nameAccount == null ? 'lorem'.tr : nameAccount.toString(),
                  maxLines: 1,
                  textAlign: TextAlign.center,
                  overflow: TextOverflow.ellipsis,
                  style: AppTextStyle.regular14(
                    color: AppColor.black,
                  ),
                ),
              )
            ],
          ),
        ),
        Text(
          statusSwitch(statusPost),
          textAlign: TextAlign.right,
          style: AppTextStyle.regular12(
            color: AppColor.orange,
          ),
        )
      ],
    );
  }

  Container _body() {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          SizedBox(
            width: 60.h,
            height: 60.h,
            child: CachedNetworkImage(
              imageUrl: imageDefault == null
                  ? 'http://192.168.1.7:5001/post-content/d4b43701-58e1-4915-946e-b53647977977.jpg'
                  : imageDefault.toString(),
              errorWidget: (context, url, error) => const Icon(Icons.error),
              progressIndicatorBuilder: (context, url, downloadProgress) =>
                  Center(
                child: CircularProgressIndicator(
                  value: downloadProgress.progress,
                ),
              ),
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(width: 5.w),
          Flexible(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  postTitle == null ? '' : postTitle.capitalizeFirst.toString(),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: AppTextStyle.bold14(
                    color: AppColor.black,
                  ),
                ),
                SizedBox(height: 5.h),
                Text(
                  'Số lượng:  ${weightNumber == null ? '' : weightNumber.toString()} ${weightName == null ? '' : weightName.toString()}',
                  style: AppTextStyle.regular12(
                    color: AppColor.black,
                  ),
                ),
                SizedBox(height: 5.h),
                Divider(
                  height: 1,
                  color: AppColor.grayDivider,
                ),
                SizedBox(height: 5.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      timePost == null ? '' : timePost.toString(),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: AppTextStyle.regular12(
                        color: AppColor.gray,
                      ),
                    ),
                    Text(
                      pricePost == null ? '' : pricePost.toString(),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: AppTextStyle.regular16(
                        color: AppColor.green,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
