import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nmsv_project/common_modules/custom_submit_button.dart';
import 'package:nmsv_project/common_widgets/custom_appbar.dart';
import 'package:nmsv_project/common_widgets/custom_loader.dart';
import 'package:nmsv_project/constants/color.dart';
import 'package:nmsv_project/constants/extension.dart';
import 'package:nmsv_project/constants/message.dart';
import 'package:nmsv_project/controller/sadhana_screen_controller.dart';
import 'package:photo_view/photo_view_gallery.dart';
import 'package:sizer/sizer.dart';

class SadhanaImageShowScreen extends StatelessWidget {
  final String image;
  final int initialPageViewIndex;

  SadhanaImageShowScreen(
      {Key? key, required this.initialPageViewIndex, required this.image})
      : super(key: key);
  final sadhanaScreenController = Get.find<SadhanaScreenController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(
          titleText: "Sadhana images", leadingShow: false, actionShow: false),
      body: Obx(
        () => sadhanaScreenController.isLoading.value
            ? const CustomLoader()
            : Column(
                // alignment: Alignment.bottomCenter,
                children: [
                  Expanded(
                    child: PhotoViewGallery.builder(
                      // scrollDirection: Axis.vertical,

                      pageController: sadhanaScreenController.pageController
                      // PageController(initialPage: initialPageViewIndex)
                      ,
                      itemCount:
                          sadhanaScreenController.sadhanaImageList.length,
                      builder: (context, i) {
                        String singleItem =
                            sadhanaScreenController.sadhanaImageList[i];
                        return PhotoViewGalleryPageOptions(
                          imageProvider: NetworkImage(singleItem),
                        );
                      },
                      backgroundDecoration:
                          const BoxDecoration(color: AppColors.whiteColor1),
                      onPageChanged: (index) {
                        sadhanaScreenController.isLoading(true);
                        sadhanaScreenController.currentIndex.value = index;
                        sadhanaScreenController.isLoading(false);
                      },
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      PrevioustButtonModule(
                        labelText: AppMessage.previous,
                        buttonColor: AppColors.appColors,
                        onPress: () {
                          sadhanaScreenController.sadhanaImageList;
                          sadhanaScreenController.pageController.previousPage(
                              duration: const Duration(milliseconds: 500),
                              curve: Curves.linear);
                        },
                        icon: Icons.arrow_back_ios,
                      ),
                      NexttButtonModule(
                        labelText: AppMessage.next,
                        buttonColor: AppColors.appColors,
                        onPress: () {
                          sadhanaScreenController.sadhanaImageList;
                          sadhanaScreenController.pageController.nextPage(
                            duration: const Duration(milliseconds: 500),
                            curve: Curves.linear,
                          );
                        },
                        icon1: Icons.arrow_forward_ios,
                      ),
                    ],
                  ).commonSymmetricPadding(horizontal: 10),
                ],
              ),
      ),
    );
  }
}
