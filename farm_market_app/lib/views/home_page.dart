import 'package:cached_network_image/cached_network_image.dart';
import 'package:farm_market_app/controllers/controller.dart';
import 'package:farm_market_app/core/core.dart';
import 'package:farm_market_app/views/dashboard/dashboard_page.dart';
import 'package:farm_market_app/views/love/love_page.dart';
import 'package:farm_market_app/views/views.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(builder: (controller) {
      return Scaffold(
        body: IndexedStack(
          index: controller.tabIndex,
          children: [
            DashBoardPage(),
            GroceryPage(),
            PostItemPage(),
            LovePage(),
            SettingPage(),
          ],
        ),
        bottomNavigationBar: CustomAnimatedBottomBar(
          containerHeight: 70.h,
          backgroundColor: AppColor.white,
          selectedIndex: controller.tabIndex,
          showElevation: true,
          itemCornerRadius: 15.r,
          curve: Curves.easeIn,
          onItemSelected: controller.changeTabIndex,
          items: <BottomNavyBarItem>[
            BottomNavyBarItem(icon: Icon(Icons.home), title: Text('Trang chủ'), activeColor: AppColor.green, inactiveColor: AppColor.gray),
            BottomNavyBarItem(icon: Icon(Icons.local_grocery_store_outlined), title: Text('Tin của tôi'),activeColor: AppColor.green, inactiveColor: AppColor.gray),
            BottomNavyBarItem(icon: Icon(Icons.add_a_photo_rounded), title: Text('Đăng tin'),activeColor: AppColor.green, inactiveColor: AppColor.gray),
            BottomNavyBarItem(icon: Icon(Icons.bookmark_border_outlined), title: Text('Yêu thích'),activeColor: AppColor.green, inactiveColor: AppColor.gray),
            BottomNavyBarItem(icon: Icon(Icons.settings), title: Text('Cài đặt'),activeColor: AppColor.green, inactiveColor: AppColor.gray),
          ],
        ),
      );
    });
  }

  Container _appBar(BuildContext context) {
    return Container(
      height: 60.h,
      width: Get.width,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: AppColor.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            offset: Offset(0, 1),
            blurRadius: 5, // changes position of shadow
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: EdgeInsets.only(left: 5.w),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Chào buổi sáng',
                  style: AppTextStyle.regular12(
                    color: AppColor.gray,
                  ),
                ),
                Text(
                  'Nguyễn Thành Đạt',
                  style: AppTextStyle.regular14(color: AppColor.black),
                ),
              ],
            ),
          ),
          InkWell(
            onTap: () {
              Scaffold.of(context).openDrawer();
            },
            child: Padding(
              padding: EdgeInsets.only(right: 10),
              child: Stack(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(
                      50.r,
                    ),
                    child: CachedNetworkImage(
                      height: 40.h,
                      width: 40.h,
                      alignment: Alignment.center,
                      fit: BoxFit.cover,
                      imageUrl: "https://i.ibb.co/F63FB7w/profile.jpg",
                      placeholder: (context, url) =>
                          CircularProgressIndicator(),
                      errorWidget: (context, url, error) => Icon(Icons.error),
                    ),
                  ),
                  Positioned(
                    right: 0,
                    top: 0,
                    child: Container(
                      height: 14,
                      width: 14,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100.r),
                        color: AppColor.red,
                      ),
                      child: Text(
                        '10',
                        textAlign: TextAlign.center,
                        style: AppTextStyle.regular8(
                          color: AppColor.white,
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
