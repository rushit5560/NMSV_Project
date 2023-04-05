import 'dart:convert';
import 'dart:developer';

import 'package:get/get.dart';
import 'package:nmsv_project/constants/api_url.dart';
import 'package:http/http.dart' as http;
import 'package:nmsv_project/model/meet_to_gurudev._screen_model/meet_to_gurudev_model.dart';

class MeetWithGurudevScreenController extends GetxController {
  RxBool isLoading = false.obs;
  String successStatus = "";

  RxString meetToGurudevData = "".obs;
// late WebViewController webViewController;

  Future<void> meetToGurudevFunction() async {
    isLoading(true);
    String url = "${ApiUrl.meeToGurudevApi}?slug=meeting_with_gurudev";
    log('meetToGurudevFunction Api Url : $url');
    try {
      var request = http.MultipartRequest('GET', Uri.parse(url));
      request.headers['Authorization-Token'] = 'nmsvtoken';

      var response = await request.send();

      // response.stream.transform(utf8.decoder).listen((value) {
      response.stream
          .transform(const Utf8Decoder())
          .transform(const LineSplitter())
          .listen((value) {
        // log('getDikshaDataFunction value : $value');
        MeetToGurudevModel meetToGurudevModel =
            MeetToGurudevModel.fromJson(json.decode(value.toString()));
        successStatus = meetToGurudevModel.status;

        if (successStatus.toLowerCase() == "ok") {
          meetToGurudevData.value = meetToGurudevModel.data[0].content;
        } else {
          log('meetToGurudevFunction Else');
        }
      });
    } catch (e) {
      log('getDikshaDataFunction Error : $e');
      rethrow;
    }
    isLoading(false);
  }

  @override
  void onInit() {
    initMethod();
    super.onInit();
  }

  Future<void> initMethod() async {
    await meetToGurudevFunction();
  }
}
