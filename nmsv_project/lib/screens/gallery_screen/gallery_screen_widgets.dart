import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nmsv_project/utils/style.dart';
import 'package:sizer/sizer.dart';
import '../../common_modules/auth_screen_text_field.dart';
import '../../constants/message.dart';
import '../../controller/gallery_screen_controller.dart';
import '../shibir_photos_screen/shibir_photos_screen.dart';

class GalleryTextFiledModule extends StatelessWidget {
  GalleryTextFiledModule({Key? key}) : super(key: key);
  final galleryScreenController = Get.find<GalleryScreenController>();

  @override
  Widget build(BuildContext context) {
    return SearchBarTextFieldModule(
      fieldController: galleryScreenController.gallerySearchbarController,
      fillColor: Colors.grey[200],
      prefixIcon: const Icon(Icons.search, color: Colors.grey),
      suffixIcon: const Icon(Icons.close, color: Colors.grey),
      hintText: AppMessage.search,
      keyboardType: TextInputType.text,
    );
  }
}

class GalleryListModule extends StatelessWidget {
  GalleryListModule({Key? key}) : super(key: key);
  final galleryScreenController = Get.find<GalleryScreenController>();

  @override
  Widget build(BuildContext context) {
    log("galleryScreenController.allGalleryList.length: ${galleryScreenController.allGalleryList.length}");
    return Expanded(
      child: ListView.builder(
        // itemCount: galleryScreenController.allGalleryList.length,
        itemCount: galleryScreenController.allGalleryList.length,
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () {
              Get.to(() => const ShibirPhotosScreen());
            },
            child: Container(
                padding: const EdgeInsets.all(8),
                margin: const EdgeInsets.only(bottom: 10),
                decoration: BoxDecoration(
                  // border: Border.all(color: Colors.grey.shade400, width: 0.0),
                  color: Colors.white,
                  borderRadius: const BorderRadius.all(
                    Radius.circular(10),
                  ),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.grey.withOpacity(0.3), //color of shadow
                        // spreadRadius: 3,
                        blurRadius: 5,
                        blurStyle: BlurStyle.outer)
                  ],
                ),
                child: ListTile(
                  title: Text(
                    galleryScreenController
                        .allGalleryList[index].shivirGalleryTitle,
                    style: TextStyleConfig.textStyle(fontSize: 12.sp),
                  ),
                  trailing: const Icon(Icons.navigate_next_outlined),
                )),
          );
        },
      ),
    );
  }
}
