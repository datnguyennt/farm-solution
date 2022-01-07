// import 'package:cached_network_image/cached_network_image.dart';
// import 'package:farm_market_app/constants/constants.dart';
// import 'package:farm_market_app/controllers/controller.dart';
// import 'package:farm_market_app/core/core.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:get/get.dart';
//
// class ProductItem extends StatefulWidget {
//   const ProductItem({Key? key}) : super(key: key);
//
//   @override
//   _ProductItemState createState() => _ProductItemState();
// }
//
// class _ProductItemState extends State<ProductItem> {
//   final _controller = Get.put(DashboardController());
//   String imagePath = '';
//
//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return
//   }
//
//   Widget productItem(String image, String name, String author,
//       double price, String distance) {
//     return Container(
//       margin: EdgeInsets.only(right: 10.w),
//       decoration: BoxDecoration(
//         borderRadius: BorderRadius.circular(10.r),
//         color: AppColor.white,
//       ),
//       width: Get.width * 3 / 5,
//       height: 250.h,
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.start,
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           SizedBox(
//             height: 180.h,
//             //width: Get.width * 3 / 5,
//             child: ClipRRect(
//               borderRadius: BorderRadius.only(
//                 topLeft: Radius.circular(10.r),
//                 topRight: Radius.circular(10.r),
//               ),
//               child: CachedNetworkImage(
//                 imageUrl: image,
//                 errorWidget: (context, url, error) => const Icon(Icons.error),
//                 progressIndicatorBuilder: (context, url, downloadProgress) =>
//                     Center(
//                   child: CircularProgressIndicator(
//                     value: downloadProgress.progress,
//                   ),
//                 ),
//                 fit: BoxFit.contain,
//               ),
//             ),
//           ),
//           Padding(
//             padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 5),
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.start,
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Text(
//                   name,
//                   maxLines: 1,
//                   overflow: TextOverflow.ellipsis,
//                   style: AppTextStyle.bold16(color: AppColor.black),
//                 ),
//                 Text(
//                   author,
//                   maxLines: 1,
//                   overflow: TextOverflow.ellipsis,
//                   style: AppTextStyle.regular14(color: AppColor.gray),
//                 ),
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Text(
//                       '${price.toString()} VND',
//                       maxLines: 1,
//                       overflow: TextOverflow.ellipsis,
//                       style: AppTextStyle.bold14(
//                         color: AppColor.black,
//                       ),
//                     ),
//                     Row(
//                       children: [
//                         Icon(
//                           Icons.location_on_outlined,
//                           size: 20.h,
//                         ),
//                         Text('',
//                           //'${distance} km',
//                           maxLines: 1,
//                           overflow: TextOverflow.ellipsis,
//                           style: AppTextStyle.regular14(
//                             color: AppColor.black,
//                           ),
//                         ),
//                       ],
//                     ),
//                   ],
//                 ),
//               ],
//             ),
//           )
//         ],
//       ),
//     );
//   }
// }
