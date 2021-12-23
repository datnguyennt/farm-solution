import 'package:farm_market_app/constants/constants.dart';
import 'package:farm_market_app/core/theme/colors.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'controllers/auth_controller.dart';
import 'routes/app_pages.dart';
import 'routes/app_routes.dart';
import 'translations/app_translations.dart';
import 'views/views.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: ScreenUtil.defaultSize,
        builder: () {
          return GetMaterialApp(
            initialRoute: Routes.SPLASH,
            getPages: AppPages.pages,
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              primarySwatch: Colors.green,
              primaryColor: AppColor.green,
              primaryColorLight: AppColor.green,
              primaryColorDark: AppColor.green,
              visualDensity: VisualDensity.adaptivePlatformDensity,
            ),
            locale: Locale('vi', 'VN'),
            localizationsDelegates: [
              GlobalMaterialLocalizations.delegate
            ],
            supportedLocales: [
              const Locale('vi'),
              const Locale('VN')
            ],
            translationsKeys: AppTranslation.translations,
            //home: LoginPage(),
          );
        });
  }
}