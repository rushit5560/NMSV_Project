import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nmsv_project/common_widgets/custom_loader.dart';
import 'package:nmsv_project/constants/extension.dart';
import 'package:nmsv_project/screens/viedo_screen/viedo_list_screen/viedo_list_screen_widgets.dart';
import '../../../common_widgets/custom_appbar.dart';
import '../../../controller/video_screen_controller.dart';

class VideoScreen extends StatelessWidget {
   VideoScreen({Key? key}) : super(key: key);
final videoScreenController = Get.put(VideoScreenController());
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: customAppBar(
          titleText: "Video",
          leadingShow: false,
          actionShow: false,
      ),
      body: Obx(()=> videoScreenController.isLoading.value
          ? const CustomLoader()
          : VideoAllListModule().commonSymmetricPadding(horizontal: 15,vertical: 15)),
    );
  }
}
