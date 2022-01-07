import 'package:farm_market_app/constants/app_images.dart';
import 'package:farm_market_app/core/core.dart';
import 'package:farm_market_app/data/data.dart';
import 'package:farm_market_app/data/entity/account.dart';
import 'package:farm_market_app/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

int? isviewed;
class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  SharedPref sharedPref = SharedPref();
  Account userLoad = Account();

  Future getValidation()async{
    try {
      Account user = Account.fromJson(await sharedPref.read("user"));
      setState(() {
        userLoad = user;
        Globals.setMainUser(userLoad);
      });
    } catch (Excepetion) {
    }
  }
  Future getView()async{
    isviewed = sharedPref.read("viewd");
  }
  @override
  void initState() {
    // TODO: implement initState
    getValidation().whenComplete(()async{
      Future.delayed(const Duration(seconds: 2)).then((_) {
        Get.offAllNamed(userLoad.fullName == null ? Routes.ONBOARDING : Routes.HOME);
      });
    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SizedBox(
          height: 120.h,
          width: 120.h,
          child: Image.asset(AppImages.splashScreen),
        ),
      ),
    );
  }
}
