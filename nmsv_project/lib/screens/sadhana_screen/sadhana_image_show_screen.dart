import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nmsv_project/common_widgets/custom_appbar.dart';
import 'package:nmsv_project/common_widgets/custom_loader.dart';
import 'package:nmsv_project/constants/color.dart';
import 'package:nmsv_project/constants/extension.dart';
import 'package:nmsv_project/controller/sadhana_screen_controller.dart';
import 'package:photo_view/photo_view.dart';
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
            : Stack(
                alignment: Alignment.bottomCenter,
                children: [
                  PhotoViewGallery.builder(
                    // scrollDirection: Axis.vertical,
                    pageController:
                        PageController(initialPage: initialPageViewIndex),
                    itemCount: sadhanaScreenController.sadhanaImageList.length,
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
                  // Row(
                  //   mainAxisAlignment: MainAxisAlignment.center,
                  //   children:
                  //       sadhanaScreenController.sadhanaImageList.map((url) {
                  //     int index = sadhanaScreenController.sadhanaImageList
                  //         .indexOf(url);
                  //     return Container(
                  //       width: sadhanaScreenController.currentIndex.value ==
                  //               index
                  //           ? 12
                  //           : 7,
                  //       height: sadhanaScreenController.currentIndex.value ==
                  //               index
                  //           ? 12
                  //           : 7,
                  //       margin: const EdgeInsets.symmetric(
                  //           vertical: 10.0, horizontal: 2.0),
                  //       decoration: BoxDecoration(
                  //         shape: BoxShape.circle,
                  //         border: Border.all(
                  //             width: sadhanaScreenController
                  //                         .currentIndex.value ==
                  //                     index
                  //                 ? 2
                  //                 : 0,
                  //             color: sadhanaScreenController
                  //                         .currentIndex.value ==
                  //                     index
                  //                 ? AppColors.whiteColor
                  //                 : Colors.transparent),
                  //         color: sadhanaScreenController.currentIndex.value ==
                  //                 index
                  //             ? AppColors.orangeColor
                  //             : AppColors.greyColor,
                  //       ),
                  //     );
                  //   }).toList(),
                  // ).commonOnlyPadding(right: 0.5.h),
                ],
              ),
      ),
    );
  }
}
