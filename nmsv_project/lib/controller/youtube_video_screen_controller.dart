import 'dart:convert';
import 'dart:developer';
import 'package:get/get.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import 'package:http/http.dart' as http;
import '../constants/api_url.dart';
import '../model/video_screen_model/video_screen_model.dart';

class YouTubeVideoScreenController extends GetxController {
  String videoUrl = Get.arguments[0] ?? "";
  String videoTitle = Get.arguments[1];

  RxBool isLoading = false.obs;
  RxString successStatus = ''.obs;
  YoutubePlayerController ytController = YoutubePlayerController(initialVideoId: "");
  //List<VideoList> videoList = [];
  // Future<void> youtubeVideoFunction() async {
  //   isLoading(true);
  //   String url = "${ApiUrl.mediaSectionApi}$videoUrl";
  //   log("youtubeVideoFunction url : $url");
  //
  //   try {
  //     http.Response response = await http.get(Uri.parse(url));
  //     VideoListModel videoListModel =
  //     VideoListModel.fromJson(json.decode(response.body));
  //     successStatus.value = videoListModel.status;
  //     if (successStatus.value.toLowerCase() == "ok") {
  //       videoList.addAll(videoListModel.data);
  //       log("youtubeVideoFunction : $videoList");
  //     } else {
  //       log('youtubeVideoFunction Else');
  //     }
  //   } catch (e) {
  //     log('youtubeVideoFunction Error :$e');
  //     rethrow;
  //   } finally {
  //     isLoading(false);
  //   }
  // }

  Future<void> initMethod() async {
    final videoId = YoutubePlayer.convertUrlToId(videoUrl);
    ytController = YoutubePlayerController(
        initialVideoId: videoId!,
        flags: const YoutubePlayerFlags(
          autoPlay: false,
        ));
  }

  @override
  void onInit() {
    //youtubeVideoFunction();
    initMethod();
    super.onInit();
  }
}
