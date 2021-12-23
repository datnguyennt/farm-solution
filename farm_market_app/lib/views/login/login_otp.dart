import 'package:farm_market_app/constants/app_images.dart';
import 'package:farm_market_app/controllers/controller.dart';
import 'package:farm_market_app/core/core.dart';
import 'package:farm_market_app/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class LoginOTPPage extends StatefulWidget {
  const LoginOTPPage({Key? key}) : super(key: key);

  @override
  State<LoginOTPPage> createState() => _LoginOTPPageState();
}

class _LoginOTPPageState extends State<LoginOTPPage> {
  final _homeController = Get.put(HomeController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text(
          'Nhập OTP',
          style: AppTextStyle.regular14(color: AppColor.white),
        ),
        centerTitle: true,
        toolbarHeight: 50,
        flexibleSpace: Container(
          decoration: BoxDecoration(gradient: AppColor.linearGreen),
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          onPressed: () {
            Get.back();
          },
        ),
      ),
      body: Center(
        child: Container(
          height: Get.height,
          width: Get.width,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                height: 40.h,
              ),
              Image.asset(
                AppImages.otpImage,
                width: 90.r,
                height: 90.r,
              ),
              Padding(
                padding: EdgeInsets.only(top: 20.h, left: 0.w, right: 20.w),
                child: Text(
                  'login'.tr + ' bằng số điện thoại',
                  textAlign: TextAlign.left,
                  style: AppTextStyle.bold20(color: AppColor.titeFamily),
                ),
              ),
              SizedBox(
                height: 20.h,
              ),
              Text(
                'Nhập vào mã OTP đã được gửi đến số \n +84344976831',
                textAlign: TextAlign.center,
                style: AppTextStyle.regular14(
                  color: AppColor.gray,
                ),
              ),
              SizedBox(
                height: 20.h,
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 20.w,
                ),
                child: OTPForm(),
              ),
              SizedBox(
                height: 20.h,
              ),
              InkWell(
                onTap: (){
                  Get.toNamed(Routes.HOME);
                  _homeController.tabIndex = 0;
                },
                child: Container(
                  width: 160.w,
                  height: 44.h,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50.r),
                    gradient: AppColor.linearGreen,
                  ),
                  alignment: Alignment.center,
                  child: Text(
                    'login'.tr,
                    style: AppTextStyle.regular14(
                      color: AppColor.white,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 30.h,
              ),
              Text(
                'Gửi lại OTP',
                style: AppTextStyle.regular14(
                  color: AppColor.gray,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class OTPForm extends StatefulWidget {
  const OTPForm({Key? key}) : super(key: key);

  @override
  _OTPFormState createState() => _OTPFormState();
}

class _OTPFormState extends State<OTPForm> {
  late FocusNode pin2Node;
  late FocusNode pin3Node;
  late FocusNode pin4Node;
  late FocusNode pin5Node;
  late FocusNode pin6Node;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    pin2Node = FocusNode();
    pin3Node = FocusNode();
    pin4Node = FocusNode();
    pin5Node = FocusNode();
    pin6Node = FocusNode();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    pin2Node.dispose();
    pin3Node.dispose();
    pin4Node.dispose();
    pin5Node.dispose();
    pin6Node.dispose();
    super.dispose();
  }

  void nextField(String value, FocusNode focusNode) {
    if (value.length == 1) {
      focusNode.requestFocus();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          SizedBox(
            width: 40.w,
            child: TextFormField(
              obscureText: true,
              keyboardType: TextInputType.number,
              textAlign: TextAlign.center,
              style: AppTextStyle.regular24(
                color: AppColor.gray,
              ),
              decoration: InputDecoration(
                contentPadding:
                    EdgeInsets.symmetric(vertical: 15.h, horizontal: 5.w),
                enabledBorder: outlineInputBorder(),
                focusedBorder: outlineInputBorder(),
                border: outlineInputBorder(),
              ),
              autofocus: true,
              onChanged: (value) {
                nextField(value, pin2Node);
              },
            ),
          ),
          SizedBox(
            width: 40.w,
            child: TextFormField(
              focusNode: pin2Node,
              obscureText: true,
              keyboardType: TextInputType.number,
              textAlign: TextAlign.center,
              style: AppTextStyle.regular24(
                color: AppColor.gray,
              ),
              decoration: InputDecoration(
                contentPadding:
                    EdgeInsets.symmetric(vertical: 15.h, horizontal: 5.w),
                enabledBorder: outlineInputBorder(),
                focusedBorder: outlineInputBorder(),
                border: outlineInputBorder(),
              ),
              onChanged: (value) {
                nextField(value, pin3Node);
              },
            ),
          ),
          SizedBox(
            width: 40.w,
            child: TextFormField(
              focusNode: pin3Node,
              obscureText: true,
              keyboardType: TextInputType.number,
              textAlign: TextAlign.center,
              style: AppTextStyle.regular24(
                color: AppColor.gray,
              ),
              decoration: InputDecoration(
                contentPadding:
                    EdgeInsets.symmetric(vertical: 15.h, horizontal: 5.w),
                enabledBorder: outlineInputBorder(),
                focusedBorder: outlineInputBorder(),
                border: outlineInputBorder(),
              ),
              onChanged: (value) {
                nextField(value, pin4Node);
              },
            ),
          ),
          SizedBox(
            width: 40.w,
            child: TextFormField(
              focusNode: pin4Node,
              obscureText: true,
              keyboardType: TextInputType.number,
              textAlign: TextAlign.center,
              style: AppTextStyle.regular24(
                color: AppColor.gray,
              ),
              decoration: InputDecoration(
                contentPadding:
                    EdgeInsets.symmetric(vertical: 15.h, horizontal: 5.w),
                enabledBorder: outlineInputBorder(),
                focusedBorder: outlineInputBorder(),
                border: outlineInputBorder(),
              ),
              onChanged: (value) {
                nextField(value, pin5Node);
              },
            ),
          ),
          SizedBox(
            width: 40.w,
            child: TextFormField(
              focusNode: pin5Node,
              obscureText: true,
              keyboardType: TextInputType.number,
              textAlign: TextAlign.center,
              style: AppTextStyle.regular24(
                color: AppColor.gray,
              ),
              decoration: InputDecoration(
                contentPadding:
                    EdgeInsets.symmetric(vertical: 15.h, horizontal: 5.w),
                enabledBorder: outlineInputBorder(),
                focusedBorder: outlineInputBorder(),
                border: outlineInputBorder(),
              ),
              onChanged: (value) {
                nextField(value, pin6Node);
              },
            ),
          ),
          SizedBox(
            width: 40.w,
            child: TextFormField(
              maxLength: 1,
              focusNode: pin6Node,
              obscureText: true,
              keyboardType: TextInputType.number,
              textAlign: TextAlign.center,
              style: AppTextStyle.regular24(
                color: AppColor.gray,
              ),
              decoration: InputDecoration(
                counterText: "",
                contentPadding:
                    EdgeInsets.symmetric(vertical: 15.h, horizontal: 5.w),
                enabledBorder: outlineInputBorder(),
                focusedBorder: outlineInputBorder(),
                border: outlineInputBorder(),
              ),
              onChanged: (value) {},
            ),
          ),
        ],
      ),
    );
  }

  OutlineInputBorder outlineInputBorder() {
    return OutlineInputBorder(
        borderRadius: BorderRadius.circular(10.r),
        borderSide: BorderSide(color: AppColor.gray));
  }
}
