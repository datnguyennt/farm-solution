import 'package:farm_market_app/core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ItemSetting extends StatelessWidget {
  final String title;
  final String icon;
  final VoidCallback action;
  final Color color;
  const ItemSetting({required this.color, required this.action, required this.icon, required this.title}) ;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: action,
      leading: Container(
        width: 35.h,
        height: 35.h,
        padding: EdgeInsets.all(5),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.r),
          color: color,
        ),
        child: Image.asset(
          icon,
          color: AppColor.white,
        ),
      ),
      title: Text(
        title,
        style: AppTextStyle.regular14(color: AppColor.black),
      ),
      trailing: Icon(
        Icons.arrow_forward_ios,
        size: 20.h,
        color: AppColor.gray,
      ),
    );
  }
}
