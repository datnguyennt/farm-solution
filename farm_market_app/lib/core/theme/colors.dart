import 'package:flutter/material.dart';

class AppColor {
  static Color primary = Color(0xFF40AA54);

  static final Color backgroundColor = Colors.white.withOpacity(0.1);

  /// `80%`
  static final Color whiteMedium = Colors.white.withOpacity(0.8);

  /// `60%`
  static final Color whiteDisable = Colors.white.withOpacity(0.6);

  /// `30%`
  static final Color whiteLine = Colors.white.withOpacity(0.3);
  static final Color broze = Color(0xFFD57402);
  static final Color red = Color(0xFFFF5F73);
  static final Color blue = Color(0xFF6C99FE);
  static final Color purpleBlue = Color(0xFF8591FF);
  static final Color blueLight = Color(0xFF9ABAF7);
  static final Color cyan = Color(0xFF66DADA);
  static final Color yellow = Color(0xFFFFD75B);
  static final Color purple = Color(0xFF9772F1);
  static final Color purpleMedium = Color(0xFFC079FF);
  static final Color purpleLight = Color(0xFFEEABFA);
  static final Color newGreen = Color(0xFF66B684);
  static final Color green = Color(0xFF41AA55);
  static final Color pink = Color(0xFFFF698D);
  static final Color black = Color(0xFF000000);
  static final Color white = Color(0xFFffffff);
  static final Color grayLightest = Color(0xFFEDEDED);
  static final Color gray200 = Color(0xFFdadada);
  static final Color gray = Color(0xFF9E9E9E);
  static final Color grayMedium = Color(0xFF929292);
  static final Color grayLight = Color(0xFFC4C4C4);
  static final Color titeFamily = Color(0xFF131313);
  static final Color bgRecording = Color(0xFFEFEFEF);
  static final Color lineRecording = Color(0xFFEEEEEE);
  static final Color orange = Color(0xFFFF795C);
  static final Color textOption = Color(0xFF3F3F3F);
  static final Color tabIndent = Color(0xF5F5F5F5);
  static final Color textOptionClose = Color(0xFFA6A6A6);
  static final Color linerPink = Color(0xFFFFD6D6);
  static final Color bg_level_family_des = Color(0xFFDADADA);
  static final Color gold = Color(0xFFEDC780);
  static final Color lightPink = Color(0xFFFFEDED);
  static final Color mattePink = Color(0xFFFFD8D9);
  static final Color lightGray = Color(0xFFF5F5F5);
  static final Color lightCopper = Color(0xFFFFDBA5);
  static final Color matteGray = Color(0xFFDBD9DB);
  static final Color darkGray = Color(0xFF6F6F6F);
  static final Color greenPercentIndicator = Color(0xFF1DA193);
  static final Color grayDivider = Color(0xFFF0EFF4);
  static final Color starButton = Color(0xFF60F9F0);
  static final Color endButton = Color(0xFFF0294FB);
  static final Color cancelText = Color(0xFFF05746);
  static final Color loginFacebook = Color(0xFF3A6EC5);
  static final Color loginZalo = Color(0xFF0180C7);
  static final Color loginGoogle = Color(0xFF4F86EC);
  static final Color loginApple = Color(0xFF060606);
  static final Color paymentBg = Color(0xFF653CB5);
  static final Color settingBg = Color(0xFF9C28B1);
  static final Color logoutBg = Color(0xFFDE1760);
  static final Color notificationBg = Color(0xFF29C3DB);
  static final Color changePasswordBg = Color(0xFFF16041);
  static final Color addImage = Color(0xFF6FD5AB);
  static final Color grayCountImagePost = Color(0xFFF4F4F4);

  static LinearGradient _linearLR({required List<Color> colors}) =>
      LinearGradient(
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
          colors: colors);

  static LinearGradient _linearBT({required List<Color> colors}) =>
      LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: colors);

  static final LinearGradient linearRecording =
      _linearBT(colors: [Color(0xFF000000).withOpacity(0), Color(0xFF505050)]);
  static final LinearGradient linearRed =
      _linearLR(colors: [Color(0xFFF15F41), Color(0xFFF02C6A)]);
  // static final LinearGradient linearRed =
  // _linearLR(colors: [Color(0xFF6C99FE), Color(0xFF8F6FEE)]);
  static final LinearGradient linearOrange =
      _linearLR(colors: [Color(0xFFEE7465), Color(0xFFFFA89D)]);
  static final LinearGradient linearBlue =
      _linearLR(colors: [Color(0xFF3270F5), Color(0xFF75A1FF)]);
  static final LinearGradient linearPurpleBlue =
      _linearLR(colors: [Color(0xFF717FF9), Color(0xFF9AA4FB)]);
  static final LinearGradient linearBlueLight =
      _linearLR(colors: [Color(0xFF72A0F7), Color(0xFF9ABAF7)]);
  static final LinearGradient linearCyan =
      _linearLR(colors: [Color(0xFF44CBCB), Color(0xFF92E6E6)]);
  static final LinearGradient linearGreen =
      _linearLR(colors: [Color(0xFF6FD5AB), Color(0xFF23CA98)]);

  static final LinearGradient linearYellow =
      _linearLR(colors: [Color(0xFFFBD253), Color(0xFFFBE08D)]);

  static final LinearGradient linearPurple =
      _linearLR(colors: [Color(0xFF9067F4), Color(0xFFB09FF8)]);

  static final LinearGradient linearPurpleMedium =
      _linearLR(colors: [Color(0xFFB25BFE), Color(0xFFD5A6FF)]);

  static final LinearGradient linearPurpleLight =
      _linearLR(colors: [Color(0xFFEC85FF), Color(0xFFF4B7FF)]);
  static final LinearGradient linearBluePurple =
      _linearLR(colors: [Color(0xFF02E2FE), Color(0xFFAE48FF)]);

  static final LinearGradient linearBgRank =
      _linearBT(colors: [Color(0xFF96F2FE), Color(0xFF22E6AB)]);

  static final LinearGradient linearBluePercentIndicator =
      _linearBT(colors: [Color(0xFF52BFFF), Color(0xFF3371FF)]);

  static Color getColorFromHex(String hex) {
    return Color(int.parse(hex.replaceAll('#', '0xFF')));
  }
}
