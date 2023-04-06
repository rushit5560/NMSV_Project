import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nmsv_project/constants/font_family.dart';
import 'package:sizer/sizer.dart';
import '../../../controller/video_screen_controller.dart';
import '../../../utils/style.dart';
import '../youtube_video_screen/youtube_video_screen.dart';

class VideoAllListModule extends StatelessWidget {
   VideoAllListModule({Key? key}) : super(key: key);
   final videoListScreenController = Get.find<VideoListScreenController>();
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: videoListScreenController.videoList.length,
      itemBuilder: (context, index) {
        var value = videoListScreenController.videoList[index];
        return InkWell(
          onTap: () {
            Get.to(() => YouTubeVideoScreen(),

            arguments: videoListScreenController.videoList[index].videoUrl,
            );
          },
          child: Container(
            padding: const EdgeInsets.all(8),
            margin: const EdgeInsets.only(bottom: 10),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: const BorderRadius.all(
                Radius.circular(10),
              ),
              boxShadow: [
                BoxShadow(
                    color: Colors.grey.withOpacity(0.3), //color of shadow
                    blurRadius: 5,
                    blurStyle: BlurStyle.outer)
              ],
            ),
            child:ListTile(
              title: Text(
                value.videoTitle,
                style: TextStyleConfig.textStyle(
                    fontSize: 13.sp,
                  fontFamily: FontFamilyText.roboto,
                  fontWeight: FontWeight.w500
                ),
              ),
              trailing: const Icon(Icons.navigate_next_outlined),
            ),
          ),
        );
      },
    );
  }
}
