// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:nmsv_project/constants/app_images.dart';
// import 'package:nmsv_project/constants/color.dart';
// import 'package:nmsv_project/constants/extension.dart';
// import 'package:sizer/sizer.dart';

// import '../../controller/magazine_history_screen_controller.dart';
// import '../../controller/magazine_view_screen_controller.dart';
// import '../../utils/style.dart';
// import 'magazine_subscription_screen/magazine_subscription_screen.dart';

// class MagazineHistoryModule extends StatelessWidget {
//   MagazineHistoryModule({Key? key}) : super(key: key);
//   final magazineHistoryScreenController =
//       Get.find<MagazineHistoryScreenController>();
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Row(
//           mainAxisAlignment: MainAxisAlignment.start,
//           children: [
//             Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Text(
//                   'March - 2020',
//                   style: TextStyleConfig.textStyle(
//                       fontSize: 12.sp, fontWeight: FontWeight.bold),
//                 ),
//                 const Text('Year : 2020'),
//               ],
//             ).commonOnlyPadding(bottom: 80),
//             const Spacer(),
//             InkWell(
//               onTap: () {
//                 Get.to(() => MagazineSubscriptionScreen());
//               },
//               child: Container(
//                 decoration: BoxDecoration(
//                   border: Border.all(
//                     width: 2,
//                     color: AppColors.greyColor,
//                   ),
//                   image: const DecorationImage(
//                     image: NetworkImage(
//                       "https://narayanmantrasadhanavigyan.org/assets/uploads/magazine_pdf/img/mar20-min.jpg",
//                     ),
//                     fit: BoxFit.cover,
//                   ),
//                 ),
//                 height: 130,
//                 width: 12.h,
//                 // child: Image.network(
//                 //   "https://narayanmantrasadhanavigyan.org/assets/uploads/magazine_pdf/img/mar20-min.jpg",
//                 // ),
//               ),
//             ),
//           ],
//         ),
//         Text(
//           'Order on : ',
//           style: TextStyleConfig.textStyle(
//               fontSize: 12.sp, fontWeight: FontWeight.bold),
//         ),
//         SizedBox(height: 2.h),
//         Text(
//           'Phone Number : ',
//           style: TextStyleConfig.textStyle(
//               fontSize: 12.sp, fontWeight: FontWeight.bold),
//         ),
//         SizedBox(height: 2.h),
//         Text(
//           'Address : ',
//           style: TextStyleConfig.textStyle(
//               fontSize: 12.sp, fontWeight: FontWeight.bold),
//         ),
//         SizedBox(height: 2.h),
//         Text(
//           'Expire On : ',
//           style: TextStyleConfig.textStyle(
//               fontSize: 12.sp, fontWeight: FontWeight.bold),
//         ),
//       ],
//     );
//   }
// }
