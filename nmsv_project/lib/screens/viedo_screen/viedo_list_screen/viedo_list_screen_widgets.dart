import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nmsv_project/common_modules/auth_screen_text_field.dart';
import 'package:nmsv_project/constants/extension.dart';
import 'package:nmsv_project/constants/font_family.dart';
import 'package:nmsv_project/constants/message.dart';
import 'package:sizer/sizer.dart';
import '../../../controller/video_screen_controller.dart';
import '../../../utils/style.dart';
import '../youtube_video_screen/youtube_video_screen.dart';

class SearchTextFiledModule extends StatelessWidget {
  SearchTextFiledModule({Key? key}) : super(key: key);
  final videoListScreenController = Get.find<VideoListScreenController>();

  @override
  Widget build(BuildContext context) {
    return SearchBarTextFieldModule(
      fieldController: videoListScreenController.searchbarController,
      fillColor: Colors.grey[200],
      prefixIcon: const Icon(Icons.search, color: Colors.grey),
      hintText: AppMessage.search,
      keyboardType: TextInputType.text,
      onChanged: (value) {
        videoListScreenController.isLoading(true);

        videoListScreenController.searchVideoList = videoListScreenController
            .videoList
            .where(
                (element) => element.videoTitle.toLowerCase().contains(value))
            .toList();
        videoListScreenController.isLoading(false);
      },
      suffixIcon: videoListScreenController.searchbarController.text.isEmpty
          ? null
          : IconButton(
              onPressed: () {
                videoListScreenController.isLoading(true);
                videoListScreenController.searchVideoList =
                    videoListScreenController.videoList;
                videoListScreenController.searchbarController.clear();
                videoListScreenController.isLoading(false);
              },
              icon: const Icon(Icons.close, color: Colors.grey),
            ),
    );
  }
}

class VideoAllListModule extends StatelessWidget {
  VideoAllListModule({Key? key}) : super(key: key);
  final videoListScreenController = Get.find<VideoListScreenController>();
  @override
  Widget build(BuildContext context) {
    return videoListScreenController.searchVideoList.isEmpty
        ? Center(
            child: Text(
              "No data found.",
              style: TextStyleConfig.textStyle(fontSize: 14.sp),
            ),
          )
        : ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: videoListScreenController.searchVideoList.length,
            itemBuilder: (context, index) {
              var value = videoListScreenController.searchVideoList[index];
              return InkWell(
                onTap: () {
                  Get.to(
                    () => YouTubeVideoScreen(),
                    arguments:
                        videoListScreenController.videoList[index].videoUrl,
                  );
                },
                child: Container(
                  // padding: const EdgeInsets.all(8),
                  // margin: const EdgeInsets.only(bottom: 10),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: const BorderRadius.all(
                      Radius.circular(10),
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.3), //color of shadow
                        blurRadius: 5,
                        blurStyle: BlurStyle.outer,
                      )
                    ],
                  ),
                  child: ListTile(
                    title: Text(
                      value.videoTitle,
                      style: TextStyleConfig.textStyle(
                          fontSize: 13.sp,
                          fontFamily: FontFamilyText.roboto,
                          fontWeight: FontWeight.w500),
                    ),
                    trailing: const Icon(Icons.navigate_next_outlined),
                  ).commonSymmetricPadding(vertical: 3),
                ),
              );
            },
          );
  }
}
