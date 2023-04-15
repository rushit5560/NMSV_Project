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

  @override
  Widget build(BuildContext context) {
    return YoutubePlayerBuilder(
      builder: (context, player) {
        return Column(
          children: [player],
        );
      },
      player: YoutubePlayer(
        controller: youTubeVideoScreenController.ytController,
        aspectRatio: 16 / 9,
        showVideoProgressIndicator: true,
      ),
      
    );
  }
}
