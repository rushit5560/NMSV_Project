import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../common_modules/auth_screen_text_field.dart';
import '../../constants/message.dart';
import '../../controller/gallery_screen_controller.dart';

class GalleryTextFiledModule extends StatelessWidget {
   GalleryTextFiledModule({Key? key}) : super(key: key);
final galleryScreenController = Get.find<GalleryScreenController>();
  @override
  Widget build(BuildContext context) {
    return TextFieldModule(
      fieldController: galleryScreenController.gallerySearchbarController,
      prefixIcon: const Icon(Icons.search),
      hintText: AppMessage.search,
      keyboardType: TextInputType.text,
    );
  }
}
