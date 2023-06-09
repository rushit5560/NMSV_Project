import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nmsv_project/screens/gallery_screen/gallery_shibir_photos_screen/gallery_shibir_photos_screen.dart';
import 'package:nmsv_project/utils/style.dart';
import 'package:sizer/sizer.dart';
import '../../../common_modules/auth_screen_text_field.dart';
import '../../../constants/message.dart';
import '../../../controller/gallery_screen_controller.dart';

class GalleryTextFiledModule extends StatelessWidget {
  GalleryTextFiledModule({Key? key}) : super(key: key);
  final galleryScreenController = Get.find<GalleryScreenController>();

  @override
  Widget build(BuildContext context) {
    return SearchBarTextFieldModule(
      fieldController: galleryScreenController.searchGallerySearchbarController,
      fillColor: Colors.grey[200],
      prefixIcon: const Icon(Icons.search, color: Colors.grey),
      hintText: AppMessage.search,
      keyboardType: TextInputType.text,
      onChanged: (value) {
        // galleryScreenController.isLoading(true);
        // galleryScreenController.searchGalleryDataList =
        //     galleryScreenController.allGalleryList;
        galleryScreenController.searchGalleryDataList = galleryScreenController
            .allGalleryList
            .where((element) =>
                element.shivirGalleryTitle.toLowerCase().contains(value))
            .toList();
        // galleryScreenController.isLoading(false);
        galleryScreenController.loadUI();
      },
      suffixIcon:
          galleryScreenController.searchGallerySearchbarController.text.isEmpty
              ? null
              : IconButton(
                  onPressed: () {
                    galleryScreenController.isLoading(true);
                    galleryScreenController.searchGalleryDataList =
                        galleryScreenController.allGalleryList;
                    galleryScreenController.searchGallerySearchbarController
                        .clear();
                    galleryScreenController.isLoading(false);
                  },
                  icon: const Icon(
                    Icons.close,
                    color: Colors.grey,
                  ),
                ),
    );
  }
}

class GalleryListModule extends StatelessWidget {
  GalleryListModule({Key? key}) : super(key: key);
  final galleryScreenController = Get.find<GalleryScreenController>();

  @override
  Widget build(BuildContext context) {
    // log("galleryScreenController.allGalleryList.length: ${galleryScreenController.allGalleryList.length}");
    // ignore: prefer_const_constructors
    return galleryScreenController.searchGalleryDataList.isEmpty
        ? Center(
            child: Text(
              "No data found.",
              style: TextStyleConfig.textStyle(fontSize: 14.sp),
            ),
          )
        : ListView.builder(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: galleryScreenController.searchGalleryDataList.length,
            itemBuilder: (context, index) {
              final valuedata =
                  galleryScreenController.searchGalleryDataList[index];
              return InkWell(
                onTap: () {
                  Get.to(() => GalleryShibirPhotosScreen(), arguments: [
                    galleryScreenController
                        .searchGalleryDataList[index].shivirGalleryId,
                    galleryScreenController
                        .searchGalleryDataList[index].shivirGalleryTitle,
                  ]);
                },
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: const BorderRadius.all(
                      Radius.circular(10),
                    ),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.grey.withOpacity(0.3), //color of shadow
                          blurRadius: 5,
                          blurStyle: BlurStyle.outer)
                    ],
                  ),
                  child: ListTile(
                    title: Text(
                      valuedata.shivirGalleryTitle,
                      style: TextStyleConfig.textStyle(fontSize: 12.sp),
                    ),
                    trailing: const Icon(Icons.navigate_next_outlined),
                  ),
                ),
              );
            },
          );
  }
}
