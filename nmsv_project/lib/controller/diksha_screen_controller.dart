import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';
import 'package:nmsv_project/constants/api_url.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../model/diksha_screen_model/diksha_model.dart';

class DikshaScreenController extends GetxController {
  RxBool isLoading = false.obs;
  String successStatus = "";

  RxString dikshaData = "".obs;
  late WebViewController webViewController;

  Future<void> getDikshaDataFunction() async {
    isLoading(true);
    String url = "${ApiUrl.pageSectionApi}?page_slug=diksha";
    log('getDikshaDataFunction Api Url : $url');
    try {
      var request = http.MultipartRequest('GET', Uri.parse(url));
      request.headers['Authorization-Token'] = 'nmsvtoken';

      var response = await request.send();

      // response.stream.transform(utf8.decoder).listen((value) {
      response.stream
          .transform(const Utf8Decoder())
          .transform(const LineSplitter())
          .listen((value) {
        log('getDikshaDataFunction value : $value');
        DikshaModel dikshaModel = DikshaModel.fromJson(json.decode(value.toString()));
        successStatus = dikshaModel.status;

        if(successStatus == "ok") {
          dikshaData.value = dikshaModel.data[0].cmsDescription;
        } else {
          log('getDikshaDataFunction Else');
        }
      });
    } catch(e) {
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
    getDikshaDataFunction();
  }

}