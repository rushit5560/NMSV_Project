import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nmsv_project/constants/extension.dart';
import 'package:sizer/sizer.dart';
import '../../common_widgets/custom_appbar.dart';
import '../../constants/message.dart';
import '../../controller/gallery_screen_controller.dart';
import 'gallery_screen_widgets.dart';

class GalleryScreen extends StatelessWidget {
   GalleryScreen({Key? key}) : super(key: key);
final galleryScreenController = Get.put(GalleryScreenController());
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: customAppBar(
        titleText: AppMessage.shibir,
        actionShow: false,
        // actionIcon: const Icon(Icons.west_outlined),
        actionOnTap: () {},
        leadingIcon: const Icon(Icons.navigate_before),
        //leadingOnTap: () => Get.to(HomeScreen()),
        leadingShow: true,
      ),
      body: SafeArea(
        child: Column(
          children: [
            // SizedBox(height: 1.h),
            GalleryTextFiledModule(),
            SizedBox(height: 3.h),
            GalleryListModule(),
          ],
        ).commonSymmetricPadding(horizontal: 10,vertical: 10),
      ),
    );
  }
}
