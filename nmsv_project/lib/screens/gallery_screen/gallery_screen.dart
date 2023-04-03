import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nmsv_project/constants/extension.dart';
import 'package:sizer/sizer.dart';
import '../../controller/gallery_screen_controller.dart';
import 'gallery_screen_widgets.dart';

class GalleryScreen extends StatelessWidget {
   GalleryScreen({Key? key}) : super(key: key);
final galleryScreenController = Get.put(GalleryScreenController());
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(height: 2.h),
            GalleryTextFiledModule(),
          ],
        ).commonSymmetricPadding(horizontal: 10),
      ),
    );
  }
}
