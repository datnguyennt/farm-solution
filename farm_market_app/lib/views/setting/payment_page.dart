import 'package:farm_market_app/core/core.dart';
import 'package:farm_market_app/views/custom/custom.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:farm_market_app/controllers/controller.dart';

class PaymentPage extends GetView<PaymentController> {
  const PaymentPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
          alignment: Alignment.center,
          child: InkWell(
            onTap: () {
              showDialog(
                context: context,
                builder: (_) => ImagePickerWidget(),
              );
            },
            child: Container(
              height: 60.h,
              width: 120.w,
              alignment: Alignment.center,
              color: AppColor.green,
              child: Text('select'),
            ),
          )),
    );
  }
}
