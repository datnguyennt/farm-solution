import 'package:farm_market_app/core/core.dart';
import 'package:farm_market_app/data/data.dart';
import 'package:farm_market_app/data/entity/account.dart';
import 'package:farm_market_app/routes/app_routes.dart';
import 'package:farm_market_app/utils/toast/toast_utils.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class SettingController extends GetxController with ToastUtils{
  final String title = "Cai dat";
  var item = 0.obs;
  SharedPref sharedPref = SharedPref();


  void changeItem(){
    item.value++;
  }
  showLogin(){
    errorToast('login_to_continue'.tr);
  }

  Future logout()async{
    FirebaseAuth _auth = FirebaseAuth.instance;
    await _auth.signOut();
    sharedPref.remove("user");
    Globals.setMainUser(Account());
    Get.toNamed(Routes.LOGIN_EMAIL);
  }
}