import 'package:farm_market_app/controllers/controller.dart';
import 'package:farm_market_app/core/core.dart';
import 'package:farm_market_app/routes/app_routes.dart';
import 'package:farm_market_app/views/views.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  final controller = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      builder: (_c) => Scaffold(
        body: PageStorage(
          bucket: _c.bucket,
          child: _c.currentScreen,
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add_a_photo_rounded),
          onPressed: () {
            Get.toNamed(Routes.POST_ITEM);
          },
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        bottomNavigationBar: BottomAppBar(
          shape: CircularNotchedRectangle(),
          notchMargin: 10,
          child: Container(
            height: 60.h,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    MaterialButton(
                      minWidth: 40.w,
                      onPressed: () {
                        _c.currentScreen = DashBoardPage();
                        _c.currentTab = 0;
                        _c.update();
                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.home,
                            color: _c.currentTab == 0
                                ? AppColor.green
                                : AppColor.gray,
                          ),
                          Text(
                            'Trang chủ',
                            style: AppTextStyle.regular12(
                              color: _c.currentTab == 0
                                  ? AppColor.green
                                  : AppColor.gray,
                            ),
                          ),
                        ],
                      ),
                    ),
                    MaterialButton(
                      minWidth: 40.w,
                      onPressed: () {
                        _c.currentScreen = MyPostPage();
                        _c.currentTab = 1;
                        _c.update();
                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.local_grocery_store_outlined,
                            color: controller.currentTab == 1
                                ? AppColor.green
                                : AppColor.gray,
                          ),
                          Text(
                            'Tin của tôi',
                            style: AppTextStyle.regular12(
                              color: controller.currentTab == 1
                                  ? AppColor.green
                                  : AppColor.gray,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    MaterialButton(
                      minWidth: 40.w,
                      onPressed: () {
                        _c.currentScreen = LovePage();
                        _c.currentTab = 3;
                        _c.update();
                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.bookmark_border_outlined,
                            color: _c.currentTab == 3
                                ? AppColor.green
                                : AppColor.gray,
                          ),
                          Text(
                            'Tin đã lưu',
                            style: AppTextStyle.regular12(
                              color: _c.currentTab == 3
                                  ? AppColor.green
                                  : AppColor.gray,
                            ),
                          ),
                        ],
                      ),
                    ),
                    MaterialButton(
                      minWidth: 40.w,
                      onPressed: () {
                        _c.currentScreen = SettingPage();
                        _c.currentTab = 4;
                        _c.update();
                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.settings,
                            color: _c.currentTab == 4
                                ? AppColor.green
                                : AppColor.gray,
                          ),
                          Text(
                            'Cài đặt',
                            style: AppTextStyle.regular12(
                              color: _c.currentTab == 4
                                  ? AppColor.green
                                  : AppColor.gray,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
