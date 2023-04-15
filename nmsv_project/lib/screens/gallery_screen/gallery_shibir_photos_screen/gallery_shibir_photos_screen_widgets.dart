import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nmsv_project/constants/color.dart';
import '../../../controller/shibir_photos_screen_controller.dart';
import '../shibir_photos_slider_screen/shibir_photos_slider_screen.dart';

class PhotosGridViewListModule extends StatelessWidget {
  PhotosGridViewListModule({Key? key}) : super(key: key);
  final shibirPhotosScreenController = Get.find<ShibirPhotosScreenController>();
  @override
  Widget build(BuildContext context) {
    //log("shibirPhotosScreenController.galleryPhotos.length: ${shibirPhotosScreenController.galleryPhotos.length}");
    return Expanded(
      child: GridView.builder(
        itemCount: shibirPhotosScreenController.galleryPhotos.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisSpacing: 25,
          mainAxisSpacing: 15,
          crossAxisCount: 2,
        ),
        itemBuilder: (context, index) {
          final value = shibirPhotosScreenController.galleryPhotos[index];
          return GestureDetector(
            onTap: () {
              Get.to(
                () => ShibirPhotosSliderScreen(
                  initialPageViewIndex: index,
                ),
              );
            },
            child: Container(
              // height: 40.h,
              decoration: BoxDecoration(
                color: AppColors.whiteColor,
                borderRadius: const BorderRadius.all(
                  Radius.circular(10),
                ),
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage(value.imageUrl),
                ),
                boxShadow: const [
                  BoxShadow(
                    blurRadius: 1,
                    offset: Offset(0, 1),
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
