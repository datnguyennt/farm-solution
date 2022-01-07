import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:farm_market_app/constants/constants.dart';
import 'package:farm_market_app/controllers/controller.dart';
import 'package:farm_market_app/core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class ImageSlide extends StatefulWidget {
  const ImageSlide({Key? key}) : super(key: key);
  @override
  _ImageSlideState createState() => _ImageSlideState();
}

class _ImageSlideState extends State<ImageSlide> {
  int _current = 0;
  List<Widget>? imageSlider;
  final _controller = Get.put(DashboardController());
String URL = '';
  @override
  void initState() {
    imageSlider = _controller.arrBanner.map((e) => Container(
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10.r),
        child: Stack(
          children: [
            CachedNetworkImage(
              imageUrl: EndPoint.baseUrl + e.imagePath.toString(),
              errorWidget: (context, url, error) =>
                  const Icon(Icons.error),
              progressIndicatorBuilder: (context, url, downloadProgress) =>
                  Center(
                    child: CircularProgressIndicator(
                      value: downloadProgress.progress,
                    ),
                  ),
              fit: BoxFit.cover,
              width: 1000,
            ),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                padding: const EdgeInsets.all(10),
                child: Text(
                  'Some Text',
                  style: AppTextStyle.regular20(color: AppColor.white)
                ),
              ),
            )
          ],
        ),
      ),
    )).toList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
          height: 200.h,
          child: CarouselSlider(
              items: imageSlider,
              options: CarouselOptions(
                  autoPlay: true,
                  enlargeCenterPage: true,
                  aspectRatio: 16/9,
                  viewportFraction: 1,
                  onPageChanged: (index, reason) {
                    setState(() {
                      _current = index;
                    });
                  }
              )),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Padding(
            padding: EdgeInsets.only(bottom: 10.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: _controller.arrBanner.map((e) {
                int index = _controller.arrBanner.indexOf(e);
                return Container(
                  width: _current == index ? 12.h : 8.h,
                  height: _current == index ? 12.h : 8.h,
                  margin: EdgeInsets.symmetric(vertical: 10.h,horizontal: 2.w),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: _current == index
                        ? AppColor.green
                        : AppColor.white,
                  ),
                );
              }).toList(),
            ),
          ),
        )
      ],
    );
  }
}