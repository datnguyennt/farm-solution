import 'package:farm_market_app/binding/binding.dart';
import 'package:farm_market_app/views/views.dart';
import 'package:get/get.dart';

import 'app_routes.dart';

class AppPages {
  static final pages = [
    GetPage(
      name: Routes.SPLASH,
      page: () => SplashScreen(),
      //binding:  SplashBinding(),
    ),
    GetPage(
      name: Routes.ONBOARDING,
      page: () => OnBoardingPage(),
      binding:  OnBoardingBinding(),
    ),
    GetPage(
      name: Routes.LOGIN,
      page: () => LoginPage(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: Routes.CHANGE_PASSWORD,
      page: () => ChangePasswordPage(),
      binding: ChangePasswordBinding(),
    ),
    GetPage(
      name: Routes.LOGIN_EMAIL,
      page: () => LoginEmailPage(),
      binding: LoginEmailBinding(),
    ),
    GetPage(
      name: Routes.HOME,
      page: () => HomePage(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: Routes.SIGNUP,
      page: () => SignUpPage(),
      binding: SignUpBinding(),
    ),
    GetPage(
      name: Routes.SETTING,
      page: () => SettingPage(),
      binding: SettingBinding(),
    ),
    GetPage(
      name: Routes.LOVE,
      page: () => LovePage(),
      binding: LoveBinding(),
    ),
    GetPage(
      name: Routes.GROCERY,
      page: () => GroceryPage(),
      binding: GroceryBinding(),
    ),
    GetPage(
      name: Routes.POST_ITEM,
      page: () => PostItemPage(),
      binding: PostItemBinding(),
    ),
    GetPage(
      name: Routes.DASHBOARD,
      page: () => DashBoardPage(),
      binding: DashboardBinding(),
    ),
    GetPage(
      name: Routes.PROFILE,
      page: () => ProfilePage(),
      binding: ProfileBinding(),
    ),
    GetPage(
      name: Routes.NOTIFICATION,
      page: () => NotificationPage(),
      binding: DashboardBinding(),
    ),
    GetPage(
      name: Routes.SETTING_APP,
      page: () => SettingAppPage(),
      binding: SettingAppBinding(),
    ),
    GetPage(
      name: Routes.PAYMENT,
      page: () => PaymentPage(),
      binding: PaymentBinding(),
    ),
    GetPage(
      name: Routes.CREATE_ACCOUNT,
      page: () => CreateAccountPage(),
      binding: CreateAccountBinding(),
    ),
    GetPage(
      name: Routes.OTP_AUTHEN,
      page: () => LoginOTPPage(),
      binding: OTPBinding(),
    ),
    GetPage(
      name: Routes.POST_DETAIL,
      page: () => PostDetailPage(),
      binding: PostDetailBinding(),
    ),
    // GetPage(
    //   name: Routes.LOGOUT,
    //   page: () => DashBoardPage(),
    //   binding: DashboardBinding(),
    // ),
  ];
}
