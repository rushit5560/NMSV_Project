import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nmsv_project/constants/extension.dart';
import 'package:photo_view/photo_view_gallery.dart';
import 'package:sizer/sizer.dart';

import '../../../../common_widgets/custom_appbar.dart';
import '../../../../common_widgets/custom_loader.dart';
import '../../../../constants/color.dart';
import '../../../../controller/shibir_photos_screen_controller.dart';

class ShibirPhotosSliderScreen extends StatelessWidget {
   ShibirPhotosSliderScreen({Key? key}) : super(key: key);
final  shibirPhotosScreenController = Get.find<ShibirPhotosScreenController>();
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: customAppBar(
        titleText:'',
        actionShow: false,
        actionOnTap: () {},
        leadingIcon: const Icon(Icons.navigate_before),
          leadingOnTap: () => Get.back(),
        leadingShow: true,
      ),
      body: Obx(()=>shibirPhotosScreenController.isLoading.value
        ?const CustomLoader()
        : Stack(
        alignment: Alignment.center,
          children: [
            PhotoViewGallery.builder(
              itemCount: shibirPhotosScreenController.galleryPhotos.length,
              builder: (context, index) {
                var value = shibirPhotosScreenController.galleryPhotos[index];
              return  PhotoViewGalleryPageOptions(
                imageProvider: NetworkImage(value.imageUrl),
              );
            },
              backgroundDecoration:const BoxDecoration(
                color: AppColors.whiteColor1
              ) ,
              onPageChanged: (index) {
                shibirPhotosScreenController.isLoading(true);
                shibirPhotosScreenController.currentIndex.value = index;
                shibirPhotosScreenController.isLoading(false);
              },
        ),
            Positioned(
              top: 500,
              child: Row(
                mainAxisAlignment:MainAxisAlignment.center,
                children: shibirPhotosScreenController.galleryPhotos.map((url) {
                  int index = shibirPhotosScreenController.galleryPhotos.indexOf(url);
                  return Container(
                    width:
                    shibirPhotosScreenController.currentIndex.value == index ? 12 : 7,
                    height:
                    shibirPhotosScreenController.currentIndex.value == index ? 12 : 7,
                    margin:
                    const EdgeInsets.symmetric(vertical: 10.0, horizontal: 2.0),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                          width: shibirPhotosScreenController.currentIndex.value == index
                              ? 2
                              : 0,
                          color: shibirPhotosScreenController.currentIndex.value == index
                              ? AppColors.whiteColor
                              : Colors.transparent),
                      color: shibirPhotosScreenController.currentIndex.value == index
                          ? AppColors.orangeColor
                          : AppColors.greyColor,
                    ),
                  );
                }).toList(),
              ).commonOnlyPadding(right: 0.5.h),
            ),
          ],
        ),
      ),
    );
  }
}
