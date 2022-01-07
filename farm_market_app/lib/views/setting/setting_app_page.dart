import 'package:farm_market_app/core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:farm_market_app/controllers/controller.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class SettingAppPage extends GetView<SettingAppController> {
  const SettingAppPage({Key? key}) : super(key: key);
  static const _initCamera = CameraPosition(
      target: LatLng(16.076954562795013, 108.2136449260412), zoom: 11);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: appBar('setting'.tr),
      body: GoogleMap(
        initialCameraPosition: _initCamera,
        myLocationButtonEnabled: true,
        zoomControlsEnabled: true,
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
}
