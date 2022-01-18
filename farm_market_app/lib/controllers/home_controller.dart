import 'package:farm_market_app/routes/app_routes.dart';
import 'package:farm_market_app/views/dashboard/dashboard_page.dart';
import 'package:farm_market_app/views/views.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';

class HomeController extends GetxController {
  var tabIndex = 0;
  final List<Widget> screens = [
    DashBoardPage(),
    MyPostPage(),
    LovePage(),
    SettingPage(),
  ];

  var currentTab = 0;
  final PageStorageBucket bucket = PageStorageBucket();
  Widget currentScreen = DashBoardPage();

  void changeTabIndex(int index) {
    tabIndex = index;
    update();
  }

  Future<void> requestLocationPermission() async {
    final serviceStatusLocation = await Permission.locationWhenInUse.isGranted;

    bool isLocation = serviceStatusLocation == ServiceStatus.enabled;

    final status = await Permission.locationWhenInUse.request();

    if (status == PermissionStatus.granted) {
      print('Permission Granted');
    } else if (status == PermissionStatus.denied) {
      print('Permission denied');
    } else if (status == PermissionStatus.permanentlyDenied) {
      print('Permission Permanently Denied');
      await openAppSettings();
    }
  }

  @override
  void onInit()async {
    super.onInit();
    tabIndex = 0;
    await requestLocationPermission();
  }

}

