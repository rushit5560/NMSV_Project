import 'dart:developer';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nmsv_project/constants/app_images.dart';
import 'package:nmsv_project/constants/color.dart';
import 'package:nmsv_project/constants/extension.dart';
import 'package:nmsv_project/constants/font_family.dart';
import 'package:nmsv_project/controller/home_screen_controller.dart';
import 'package:sizer/sizer.dart';

import '../../utils/style.dart';

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
              mainAxisAlignment: MainAxisAlignment.center,
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


class ChoiceTopicModule extends StatelessWidget {
  const ChoiceTopicModule({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 400,
      child: GridView.builder(
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              crossAxisCount: 3),
        itemCount: 9,
        itemBuilder: (context, index) {
        return InkWell(
          onTap: () {
            log('message');
          },
          child: Container(
            height: 100,
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              border: Border.all(color: AppColors.greyColor,width: 2),
              //borderRadius: BorderRadius.circular(3),
              color: Colors.white,
              ),
              child:  Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset(
                  height: 50,
                    AppImages.omImage,
                ),
                   SizedBox(height: 1.h),
                   Text('Mantra',
                    style: TextStyleConfig.textStyle(
                      fontFamily: FontFamilyText.roboto,
                      textColor: AppColors.blackColor,
                      fontWeight: FontWeight.w500,
                      fontSize: 12.sp,
                    ),
                  ),
              ],
              ),
          ),
        );
      }),
    );
  }
}


class HomeScreenTextModule extends StatelessWidget {
  const HomeScreenTextModule({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Row(
          children:[
            Text(
            '|| Aaano Bhadra Kratvo Yantu Vishwatah ||',
            style: TextStyleConfig.textStyle(
              fontFamily: FontFamilyText.roboto,
              textColor: AppColors.blackColor,
              fontWeight: FontWeight.bold,
              fontSize: 14.sp,
            ),
          ),
        ]),
        SizedBox(height: 3.h),
        Row(
          children: [
            Flexible(
              child: Text(
                'i.e May we follow a path, for the welfare of all. May we lead the whole world on the path to prosperity.',
                style: TextStyleConfig.textStyle(
                  fontFamily: FontFamilyText.roboto,
                  textColor: AppColors.blackColor,
                  fontWeight: FontWeight.w500,
                  fontSize: 12.sp,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
