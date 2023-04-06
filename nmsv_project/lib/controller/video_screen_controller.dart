import 'dart:convert';
import 'dart:developer';
import 'package:get/get.dart';
import '../constants/api_url.dart';
import '../model/video_screen_model/video_screen_model.dart';
import 'package:http/http.dart' as http;

class VideoListScreenController extends GetxController{
  RxBool isLoading = false.obs;
  RxString successStatus = ''.obs;
  List<VideoList> videoList = [];
  Future<void> videoListFunction() async {
    isLoading(true);
    String url = "${ApiUrl.mediaSectionApi}?type=video&order=asc";
    log("videoListFunction url : $url");

    try {
      http.Response response = await http.get(Uri.parse(url));

      VideoListModel videoListModel =
      VideoListModel.fromJson(json.decode(response.body));
      // log("response.body : ${response.body}");

      successStatus.value = videoListModel.status;
      if (successStatus.value.toLowerCase() == "ok") {
        videoList.addAll(videoListModel.data);
        log("videoListFunction : $videoList");
      } else {
        log('videoListFunction Else');
      }
    } catch (e) {
      log('videoListFunction Error :$e');
      rethrow;
    } finally {
      isLoading(false);
    }
  }

  @override
  void onInit() {
    videoListFunction();
    super.onInit();
  }
}