import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nmsv_project/common_widgets/custom_loader.dart';
import 'package:nmsv_project/constants/extension.dart';
import 'package:sizer/sizer.dart';
import '../../../common_widgets/custom_appbar.dart';
import '../../../constants/message.dart';
import '../../../controller/gallery_screen_controller.dart';
import 'gallery_list_screen_widgets.dart';

class GalleryScreen extends StatelessWidget {
  GalleryScreen({Key? key}) : super(key: key);
  final galleryScreenController = Get.put(GalleryScreenController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(
        titleText: AppMessage.shibir,
        actionShow: false,
        leadingShow: false,
      ),
      body: Obx(
        () => galleryScreenController.isLoading.value
            ? const CustomLoader()
            : SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      // SizedBox(height: 1.h),
                      GalleryTextFiledModule(),
                      SizedBox(height: 3.h),
                      GalleryListModule(),
                    ],
                  ).commonSymmetricPadding(horizontal: 10, vertical: 10),
                ),
              ),
      ),
    );
  }
}
