import 'package:farm_market_app/utils/screen_utils.dart';
import 'package:flutter/material.dart';

class AppTextStyle {
  static TextStyle bold36({required Color color}) => TextStyle(
      fontSize: _getFontSize(36.0),
      fontWeight: FontWeight.bold,
      color: color,
      fontFamily: 'roboto_bold');

  static TextStyle bold28({required Color color}) => TextStyle(
      fontSize: _getFontSize(28.0),
      fontWeight: FontWeight.bold,
      color: color,
      fontFamily: 'roboto_bold');

  static TextStyle bold20({required Color color}) => TextStyle(
      fontSize: _getFontSize(20.0),
      fontWeight: FontWeight.bold,
      color: color,
      fontFamily: 'roboto_bold');

  static TextStyle bold24({required Color color}) => TextStyle(
      fontSize: _getFontSize(20.0),
      fontWeight: FontWeight.bold,
      color: color,
      fontFamily: 'roboto_bold');

  static TextStyle bold18({required Color color}) => TextStyle(
      fontSize: _getFontSize(18.0),
      fontWeight: FontWeight.bold,
      color: color,
      fontFamily: 'roboto_bold');

  static TextStyle bold16({required Color color}) => TextStyle(
      fontSize: _getFontSize(16.0),
      fontWeight: FontWeight.bold,
      color: color,
      fontFamily: 'roboto_bold');

  static TextStyle bold14({required Color color}) => TextStyle(
      fontSize: _getFontSize(14.0),
      fontWeight: FontWeight.bold,
      color: color,
      fontFamily: 'roboto_bold');

  static TextStyle bold12({required Color color}) => TextStyle(
      fontSize: _getFontSize(12.0),
      fontWeight: FontWeight.bold,
      color: color,
      fontFamily: 'roboto_bold');

  static TextStyle bold10({required Color color}) => TextStyle(
      fontSize: _getFontSize(10.0),
      fontWeight: FontWeight.bold,
      color: color,
      fontFamily: 'roboto_bold');

  static TextStyle regular20({required Color color}) => TextStyle(
      fontSize: _getFontSize(20.0), color: color, fontFamily: 'roboto');

  static TextStyle regular24({required Color color}) => TextStyle(
      fontSize: _getFontSize(24.0), color: color, fontFamily: 'roboto');

  static TextStyle regular18({required Color color}) => TextStyle(
      fontSize: _getFontSize(18.0), color: color, fontFamily: 'roboto');

  static TextStyle regular16({required Color color}) => TextStyle(
      fontSize: _getFontSize(16.0), color: color, fontFamily: 'roboto');

  static TextStyle regular14({required Color color}) => TextStyle(
      fontSize: _getFontSize(14.0), color: color, fontFamily: 'roboto');

  static TextStyle regular13({required Color color}) => TextStyle(
      fontSize: _getFontSize(13.0), color: color, fontFamily: 'roboto');

  static TextStyle regular12({required Color color}) => TextStyle(
      fontSize: _getFontSize(12.0), color: color, fontFamily: 'roboto');

  static TextStyle regular11({required Color color}) => TextStyle(
      fontSize: _getFontSize(11.0), color: color, fontFamily: 'roboto');

  static TextStyle regular10({required Color color}) => TextStyle(
      fontSize: _getFontSize(10.0), color: color, fontFamily: 'roboto');

  static TextStyle regular9({required Color color}) =>
      TextStyle(fontSize: _getFontSize(9.0), color: color, fontFamily: 'roboto');

  static TextStyle regular8({required Color color}) =>
      TextStyle(fontSize: _getFontSize(8.0), color: color, fontFamily: 'roboto');

  static TextStyle regular7({required Color color}) =>
      TextStyle(fontSize: _getFontSize(7.0), color: color, fontFamily: 'roboto');

  static TextStyle regular6({required Color color}) =>
      TextStyle(fontSize: _getFontSize(6.0), color: color, fontFamily: 'roboto');

  static double _getFontSize(double size) => GeneralScreenUtils.setSp(size);
}
