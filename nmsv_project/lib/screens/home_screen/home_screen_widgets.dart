import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:get/get.dart';
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
          items: homeScreenController.getBannerList
              .map(
                (item) =>
                    ClipRRect(borderRadius: BorderRadius.circular(10),
                    child: CachedNetworkImage(
                      imageUrl: item.imageUrl,
                      fit: BoxFit.fill,
                    ),

                    )
                //     Container(
                //   decoration: BoxDecoration(
                //     borderRadius: BorderRadius.circular(10),
                //     image: DecorationImage(
                //         image: NetworkImage(item.imageUrl), fit: BoxFit.cover),
                //   ),
                //   // child: Image.network(item.imageUrl)
                // ),
              )
              .toList(),
          options: CarouselOptions(
            scrollPhysics: const BouncingScrollPhysics(),
            enlargeCenterPage: true,
            autoPlay: true,
            aspectRatio: 2,
            height: 200,
            viewportFraction: 1,
            onPageChanged: (index, reason) {
              homeScreenController.isLoading(true);
              homeScreenController.currentIndex.value = index;
              homeScreenController.isLoading(false);
            },
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: homeScreenController.getBannerList.map((url) {
            int index = homeScreenController.getBannerList.indexOf(url);
            return Container(
              width: homeScreenController.currentIndex.value == index ? 16 : 11,
              height:
                  homeScreenController.currentIndex.value == index ? 16 : 11,
              margin:
                  const EdgeInsets.symmetric(vertical: 10.0, horizontal: 2.0),
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
                    ? AppColors.orangeColor
                    : AppColors.greyColor,
              ),
            );
          }).toList(),
        ).commonOnlyPadding(right: 0.5.h),
      ],
    ).commonSymmetricPadding(vertical: 8);
  }
}

class ChoiceTopicModule extends StatelessWidget {
  ChoiceTopicModule({Key? key}) : super(key: key);
  final homeScreenController = Get.find<HomoScreenController>();

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisSpacing: 12,
        mainAxisSpacing: 12,
        crossAxisCount: 3,
        childAspectRatio: 0.9,
      ),
      itemCount: homeScreenController.categoryList.length,
      itemBuilder: (context, i) {
        return InkWell(
          onTap: () => homeScreenController.categoryClickFunction(i),
          child: Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey.shade400, width: 1),
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5), //color of shadow
                  spreadRadius: 3,
                )
              ],
              color: Colors.white,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  height: 55,
                  homeScreenController.categoryList[i].image,
                ),
                SizedBox(height: 1.5.h),
                Text(
                  // maxLines: 1,
                  textAlign: TextAlign.center,
                  homeScreenController.categoryList[i].name,
                  style: TextStyleConfig.textStyle(
                    fontFamily: FontFamilyText.roboto,
                    textColor: AppColors.blackColor,
                    fontWeight: FontWeight.w500,
                    fontSize: 11.sp,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    ).commonAllSidePadding(5);
  }
}

class HomeScreenTextModule extends StatelessWidget {
  HomeScreenTextModule({Key? key}) : super(key: key);
  final homeScreenController = Get.find<HomoScreenController>();

  @override
  Widget build(BuildContext context) {
    // return Container();
    return Html(
      data: homeScreenController.introductionValue.value,
    );
  }
}
