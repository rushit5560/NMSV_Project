import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

import '../../../controller/youtube_video_screen_controller.dart';

class ViewYouTubeVideoModule extends StatefulWidget {
  const ViewYouTubeVideoModule({Key? key}) : super(key: key);

  @override
  State<ViewYouTubeVideoModule> createState() => _ViewYouTubeVideoModuleState();
}

class _ViewYouTubeVideoModuleState extends State<ViewYouTubeVideoModule> {
  final youTubeVideoScreenController = Get.find<YouTubeVideoScreenController>();
  YoutubePlayerController? controller;
  @override
  void initState() {
    log("youTubeVideoScreenController.videoUrl : ${youTubeVideoScreenController.videoUrl}");
    super.initState();
    final videoId =
        YoutubePlayer.convertUrlToId(youTubeVideoScreenController.videoUrl);
    controller = YoutubePlayerController(
        initialVideoId: videoId!,
        flags: const YoutubePlayerFlags(
          enableCaption: false,
          isLive: false,
          autoPlay: false,
          loop: false,
        ));
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        YoutubePlayer(
          controller: controller!,
          showVideoProgressIndicator: true,
          bottomActions: [
            CurrentPosition(),
            ProgressBar(
              isExpanded: true,
            ),
            const PlaybackSpeedButton(),
          ],
        ),
      ],
    );
  }
}
