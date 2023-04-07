import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nmsv_project/common_widgets/custom_loader.dart';
import 'package:nmsv_project/constants/extension.dart';
import 'package:nmsv_project/screens/viedo_screen/youtube_video_screen/youtube_video_screen_widgets.dart';
import '../../../common_widgets/custom_appbar.dart';
import '../../../controller/youtube_video_screen_controller.dart';

class YouTubeVideoScreen extends StatelessWidget {
  YouTubeVideoScreen({Key? key}) : super(key: key);
  final youTubeVideoScreenController = Get.put(YouTubeVideoScreenController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(
        titleText: "Youtube Video",
        leadingShow: false,
        actionShow: false,
      ),
      body: Obx(
        () => youTubeVideoScreenController.isLoading.value
            ? const CustomLoader()
            : SingleChildScrollView(
                child: Column(
                  children: [
                    ViewYouTubeVideoModule()
                        .commonSymmetricPadding(vertical: 10, horizontal: 10),
                  ],
                ),
              ),
      ),
    );
  }
}
