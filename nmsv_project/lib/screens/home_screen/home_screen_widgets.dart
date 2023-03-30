import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nmsv_project/constants/color.dart';
import 'package:nmsv_project/constants/extension.dart';
import 'package:nmsv_project/controller/home_screen_controller.dart';
import 'package:sizer/sizer.dart';

class CarouselBannerModule extends StatelessWidget {
  CarouselBannerModule({Key? key}) : super(key: key);
  final homeScreenController = Get.find<HomoScreenController>();

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomRight,
      children: [
        CarouselSlider(
          carouselController: homeScreenController.carouselController,
          items: homeScreenController.announcementOfferList
              .map(
                (item) => Image.network(item),
              )
              .toList(),
          options: CarouselOptions(
            scrollPhysics: const BouncingScrollPhysics(),
            autoPlay: true,
            aspectRatio: 2,
            viewportFraction: 1,
            onPageChanged: (index, reason) {
              homeScreenController.isLoading(true);
              homeScreenController.currentIndex.value = index;
              homeScreenController.isLoading(false);
            },
          ),
        ),
        Obx(
          () => Padding(
            padding: const EdgeInsets.only(right: 8, bottom: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: homeScreenController.announcementOfferList.map((url) {
                int index =
                    homeScreenController.announcementOfferList.indexOf(url);
                return Container(
                  width: homeScreenController.currentIndex.value == index
                      ? 16
                      : 11,
                  height: homeScreenController.currentIndex.value == index
                      ? 16
                      : 11,
                  margin: const EdgeInsets.symmetric(
                      vertical: 10.0, horizontal: 2.0),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                        width: homeScreenController.currentIndex.value == index
                            ? 2
                            : 0,
                        color: homeScreenController.currentIndex.value == index
                            ? AppColors.whiteColor
                            : Colors.transparent),
                    color: homeScreenController.currentIndex.value == index
                        ? AppColors.backGroundColor
                        : AppColors.greyColor,
                  ),
                );
              }).toList(),
            ),
          ),
        ).commonOnlyPadding(right: 1.h),
      ],
    );
  }
}
