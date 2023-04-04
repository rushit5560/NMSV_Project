import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nmsv_project/constants/color.dart';
import 'package:nmsv_project/constants/extension.dart';
import 'package:nmsv_project/screens/gallery_screen/gallery_list_screen/shibir_photos_screen/shibir_photos_screen_widgets.dart';
import 'package:sizer/sizer.dart';
import '../../../../common_widgets/custom_appbar.dart';
import '../../../../common_widgets/custom_loader.dart';
import '../../../../constants/message.dart';
import '../../../../controller/shibir_photos_screen_controller.dart';


class ShibirPhotosScreen extends StatelessWidget {
   ShibirPhotosScreen({Key? key}) : super(key: key);
final shibirPhotosScreenController = Get.put(ShibirPhotosScreenController());
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: AppColors.whiteColor1,
      appBar: customAppBar(
        titleText: AppMessage.shibirPhotos,
        actionShow: false,
        // actionIcon: const Icon(Icons.west_outlined),
        actionOnTap: () {},
        leadingIcon: const Icon(Icons.navigate_before),
        leadingOnTap: () {
          Get.back();
        },
        leadingShow: true,
      ),
      body: Obx(()=> shibirPhotosScreenController.isLoading.value
         ? const CustomLoader()
      : Column(
          children: [
            SizedBox(height: 2.h),
          PhotosGridViewListModule(),
        ],
        ).commonSymmetricPadding(horizontal: 15),
      ) ,
    );
  }
}
