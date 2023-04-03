import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nmsv_project/constants/app_images.dart';
import 'package:nmsv_project/constants/color.dart';
import 'package:sizer/sizer.dart';

class PhotosGridViewListModule extends StatelessWidget {
  const PhotosGridViewListModule({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GridView.builder(
        itemCount: 5,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisSpacing: 25,
          mainAxisSpacing: 15,
          crossAxisCount: 2,
        ),
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              CarouselSliderModule();
            },
            child: Container(
              // height: 40.h,
              decoration: const BoxDecoration(
                  color: AppColors.whiteColor,
                  borderRadius: BorderRadius.all(
                    Radius.circular(10),
                  ),
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage(AppImages.logoImage),
                  ),
                  boxShadow: [
                    BoxShadow(
                      blurRadius: 1,
                      offset: Offset(0, 1),
                    )
                  ]),
            ),
          );
        },
      ),
    );
  }
}

class CarouselSliderModule extends StatelessWidget {
  const CarouselSliderModule({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomRight,
      children: [
        CarouselSlider(
          carouselController: CarouselController(),
          items: [1, 2, 3]
              .map(
                (item) => Image.asset(AppImages.iconBooks),
              )
              .toList(),
          options: CarouselOptions(
            scrollPhysics: const BouncingScrollPhysics(),
            autoPlay: true,
            aspectRatio: 2,
            viewportFraction: 1,
// onPageChanged: (index, reason) {
//   return
// },
          ),
        ),
// Obx(
//       () => Padding(
//     padding: const EdgeInsets.only(right: 8, bottom: 8),
//     child: Row(
//       mainAxisAlignment: MainAxisAlignment.center,
//       children: homeScreenController.announcementOfferList.map((url) {
//         int index =
//         homeScreenController.announcementOfferList.indexOf(url);
//         return Container(
//           width: homeScreenController.currentIndex.value == index
//               ? 16
//               : 11,
//           height: homeScreenController.currentIndex.value == index
//               ? 16
//               : 11,
//           margin: const EdgeInsets.symmetric(
//               vertical: 10.0, horizontal: 2.0),
//           decoration: BoxDecoration(
//             shape: BoxShape.circle,
//             border: Border.all(
//                 width: homeScreenController.currentIndex.value == index
//                     ? 2
//                     : 0,
//                 color: homeScreenController.currentIndex.value == index
//                     ? AppColors.whiteColor
//                     : Colors.transparent),
//             color: homeScreenController.currentIndex.value == index
//                 ? AppColors.orangeColor
//                 : AppColors.greyColor,
//           ),
//         );
//       }).toList(),
//     ),
//   ),
// ).commonOnlyPadding(right: 1.h),
      ],
    );
  }
}
